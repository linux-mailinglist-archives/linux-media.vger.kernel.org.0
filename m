Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70407454DEE
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 20:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240511AbhKQThM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 14:37:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:45386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229554AbhKQThJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 14:37:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99CC960EC0;
        Wed, 17 Nov 2021 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637177650;
        bh=jMlKOq75JKI6mQX7Vkxy7abjzXkoN9hP1je25Y0LlS4=;
        h=From:To:Cc:Subject:Date:From;
        b=d+mk+LXmGvla5lkPux/RfA83vIVfe988HZQOQCglO7C1b732wK7A2ZmCdaiV4NQPU
         9tw4oeSIJDZvI+AZo7EdJ1+CMoYCCjzNNpmnytk2N7z/kEhYci83ejaO4V9yqDjSpo
         FlBPfSzndA2EGeAJ9IKH7kctg8InHkBO3B0u5Gxk8kXT+TTCFKrDz+nNmq/1didz5v
         atfwHAEa321Ms2r54jvyI6HtV4dOPiGA4w9m9qzlZ0LTplcABwrIKWRtuPW2TFlsot
         lUsh9b364IjtIX1bpnmtk/gOj57ssILrx3P/v62TXgw3pG8o6miRxEjXDRfsOG6WBT
         TBafJZ21mgyJw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnQh6-00DXHZ-0f; Wed, 17 Nov 2021 19:34:08 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 0/8] media: atomisp: sync the remaining code with Aero firmware
Date:   Wed, 17 Nov 2021 19:33:58 +0000
Message-Id: <cover.1637177402.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are still a couple of things that are aiming firmware versions newer
or different than Intel Aero firmware:
    https://github.com/intel-aero/meta-intel-aero-base/blob/master/recipes-kernel/linux/linux-yocto/shisp_2401a0_v21.bin

As the code should be in sync with the firmware, change the remaining
code to be compatible with the firmware.

After this series, except if some mistakes were made, the atomisp code
is now in sync with the Aero firmware.

Mauro Carvalho Chehab (8):
  media: atomisp: atomisp_cmd: make it more compatible with firmware
  media: atomisp: get rid of set pipe version custom ctrl
  media: atomisp: simplify binary.c
  media: atomisp: binary.c: drop logic incompatible with firmware
  media: atomisp: pipe_binarydesc: drop logic incompatible with firmware
  media: atomisp: frame.c: drop a now-unused function
  media: atomisp: add YUVPP at __atomisp_get_pipe() logic
  media: atomisp: cleanup qbuf logic

 .../staging/media/atomisp/pci/atomisp_cmd.c   |  20 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  |   9 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  19 -
 .../media/atomisp/pci/atomisp_subdev.c        |  23 -
 .../media/atomisp/pci/atomisp_subdev.h        |   1 -
 .../pci/camera/pipe/src/pipe_binarydesc.c     |  18 +-
 .../atomisp/pci/runtime/binary/src/binary.c   | 489 +-----------------
 .../runtime/frame/interface/ia_css_frame.h    |  19 -
 .../atomisp/pci/runtime/frame/src/frame.c     |  70 ---
 9 files changed, 27 insertions(+), 641 deletions(-)

-- 
2.33.1


