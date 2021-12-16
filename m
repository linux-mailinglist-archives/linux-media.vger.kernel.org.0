Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15890477201
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 13:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236852AbhLPMmC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 07:42:02 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.168]:57987 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbhLPMmC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 07:42:02 -0500
X-KPN-MessageId: 7eaaea01-5e6d-11ec-8862-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 7eaaea01-5e6d-11ec-8862-005056aba152;
        Thu, 16 Dec 2021 13:41:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:subject:from:to:mime-version:date:message-id;
        bh=p06rlHeb5vHskdaBlE/nr14WCMzuREIAw32gDLbIFcA=;
        b=W/pBBXtMgVDnfcZmS0dAseu5ejFq/R5OpidMMaAZO72RfRro6rZziMyw2dEoXwIxm3sPX0mTRC/iC
         +BSlP7KrYlHtytmhjl6ZEGoLwvNo4NQ9WuCaK2F2Vlxr4PJImQ1NTUjw96xq52RQgZphmgFtKDqUBL
         yNMyWjcy8ubR21EEhvXCrn30OlM2Wob0BDUqb1rFVW0pM2Lg522d5wuzzNwlfMbd9UVoCj0GHl525n
         IKbeQsLBTtEnu/KFotYy10+33hR1Ms9qMPF5/h99FP7i1pNa17s46Q8tiyoVeJwJZQsBUCX7bvM5/3
         xtuGDFeMCNc5dwwVPoTHdZZmBrUuVjg==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|yQnzTE/EhGrUQTdI1A0BoSRRLBZ0AdIbDRQUHu7PtCI9CYgZLwoK/rnA05hc+uP
 1crAbnLR7dfL+fV6JFsPPmg==
X-Originating-IP: 80.101.105.217
Received: from [192.168.1.10] (marune.xs4all.nl [80.101.105.217])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 9031939b-5e6d-11ec-94d2-005056abf0db;
        Thu, 16 Dec 2021 13:42:00 +0100 (CET)
Message-ID: <eab48e21-fb71-8a41-9d0c-b19aa779746b@xs4all.nl>
Date:   Thu, 16 Dec 2021 13:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.17] hantro: add Allwinner H6 support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit b9aafbd46eb92b3174781661c33bdb2c17d484f1:

  media: si2157: add ATV support for si2158 (2021-12-14 16:19:05 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.17h

for you to fetch changes up to 7002aa6312bbf3ea1374163bd013165cabb880b1:

  media: hantro: Add support for Allwinner H6 (2021-12-16 09:17:04 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jernej Skrabec (8):
      media: hantro: Fix probe func error path
      media: hantro: add support for reset lines
      media: hantro: vp9: use double buffering if needed
      media: hantro: vp9: add support for legacy register set
      media: hantro: move postproc enablement for old cores
      media: hantro: Convert imx8m_vpu_g2_irq to helper
      media: dt-bindings: allwinner: document H6 Hantro G2 binding
      media: hantro: Add support for Allwinner H6

 Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml | 64 +++++++++++++++++++++++++++++++++++
 drivers/staging/media/hantro/Kconfig                                    | 10 +++++-
 drivers/staging/media/hantro/Makefile                                   |  3 ++
 drivers/staging/media/hantro/hantro.h                                   |  9 +++++
 drivers/staging/media/hantro/hantro_drv.c                               | 28 ++++++++++++++--
 drivers/staging/media/hantro/hantro_g2.c                                | 18 ++++++++++
 drivers/staging/media/hantro/hantro_g2_regs.h                           | 17 ++++++++++
 drivers/staging/media/hantro/hantro_g2_vp9_dec.c                        | 76 ++++++++++++++++++++++++++++++++----------
 drivers/staging/media/hantro/hantro_hw.h                                |  2 ++
 drivers/staging/media/hantro/imx8m_vpu_hw.c                             | 20 +----------
 drivers/staging/media/hantro/sunxi_vpu_hw.c                             | 86 ++++++++++++++++++++++++++++++++++++++++++++++++
 11 files changed, 294 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
 create mode 100644 drivers/staging/media/hantro/sunxi_vpu_hw.c
