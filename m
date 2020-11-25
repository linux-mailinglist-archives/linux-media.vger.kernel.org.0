Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C772C3A7E
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 09:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbgKYIIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 03:08:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:55226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgKYIIG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 03:08:06 -0500
Received: from coco.lan (ip5f5ad5d3.dynamic.kabel-deutschland.de [95.90.213.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24A7520708;
        Wed, 25 Nov 2020 08:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606291685;
        bh=MQdQla3MaBtabwzgYuOcGBHDirpZ+q6ehQad7ftCyF4=;
        h=Date:From:To:Cc:Subject:From;
        b=inKwTxg2OLAfZNNnht0UadufT4YKn90Xn2XZgFUcxFZQJMkXMjiyFNYWkpdGBpjTM
         zXfXOnz+gOQZYWXwWLLYK/SSS4/hdBxmED3nZ5ks/7EvFVTeKj6jSUSB38j+u5OJrs
         QEo6p542MQNcfyHshBmKebxyEfwo7LNc0/t2cz+w=
Date:   Wed, 25 Nov 2020 09:07:58 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.10-rc6] media fixes
Message-ID: <20201125090758.131b3448@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-2


For:
  - a rand Kconfig fixup for mtk-vcodec;
  - a fix at h264 handling at cedrus codec driver;
  - some warning fixes when config PM is not enabled at marvell-ccic;
  - two fixes at venus codec driver: one related to codec profile and the
    other one related to a bad error path which causes an OOPS on 
    module re-bind.

Regards,
Mauro

The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-2

for you to fetch changes up to 9215f6bb4705ffe205885411394732bfc439dee0:

  media: venus: pm_helpers: Fix kernel module reload (2020-11-16 19:06:10 +0100)

----------------------------------------------------------------
media fixes for v5.10-rc6

----------------------------------------------------------------
Alexandre Courbot (2):
      media: mtk-vcodec: move firmware implementations into their own files
      media: mtk-vcodec: fix build breakage when one of VPU or SCP is enabled

Jernej Skrabec (1):
      media: cedrus: h264: Fix check for presence of scaling matrix

Randy Dunlap (1):
      media: media/platform/marvell-ccic: fix warnings when CONFIG_PM is not enabled

Stanimir Varbanov (2):
      media: venus: venc: Fix setting of profile and level
      media: venus: pm_helpers: Fix kernel module reload

 drivers/media/platform/Kconfig                     |  28 +++-
 drivers/media/platform/marvell-ccic/mmp-driver.c   |   2 +
 drivers/media/platform/mtk-vcodec/Makefile         |  10 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |   2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |   2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c  | 174 +--------------------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h  |   7 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h |  52 ++++++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c  |  73 +++++++++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c  | 110 +++++++++++++
 drivers/media/platform/qcom/venus/core.h           |  15 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     |   4 +-
 drivers/media/platform/qcom/venus/venc.c           |  31 +++-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |  14 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c   |   2 +-
 15 files changed, 338 insertions(+), 188 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c

