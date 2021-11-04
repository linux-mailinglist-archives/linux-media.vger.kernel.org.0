Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F734452A0
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 13:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhKDMIj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 08:08:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:37094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhKDMIi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 08:08:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9546061213;
        Thu,  4 Nov 2021 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636027560;
        bh=SnYYpxSRUg67hd+Xit15R1TqiZu+34ZFEvrRwplYLzo=;
        h=From:To:Cc:Subject:Date:From;
        b=o3GORacJsT9uLQpEl5H7J02DV7zs2O5f3Gq0Wfc8n3hSuXy+b+lGaWwj6tm0S0GHn
         eX1NgSOjkHOB1U/Hl12sAeXkVVoq3nBqpHwRNb8LLUvRmblbv2sY81Rv3szoOzKO/B
         +5qeVq5kRPcYyBLJ7N9oZPnahJq+gfLep4pRu7E0d8SbwXZ2Da7+0vGWyzDH0KBFdI
         Yjepfp3EVHet33eUWMKQ2Swi+NQdwTH4/waYOmZjPxrGcMjupg6Oni2WzROXPu/z/d
         ITQkALbn/Ff1fkqcMsiRfVS8xu12k9LyHch7/YNE/p2X4hD5biS82kG+KrkyJzraHF
         fFa/p8mdtVL+Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mibVG-005nHb-47; Thu, 04 Nov 2021 12:05:58 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 0/7] Address issues preventing camorama to work with atomisp
Date:   Thu,  4 Nov 2021 12:05:49 +0000
Message-Id: <cover.1636026959.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series address some issues at atomisp that are preventing camorama
to work with atomisp driver.

After this series, I can use camorama just like on any other device. The frame
rate is slow (~7fps), though. Not sure if this is due to some sensor limitation or
because of some other issue.

Anyway this is a start :-)

Some notes:

1. Patch 1 fixes an issue at ov2680 logic. It probably needs to be reflected at the
   other supported sensors;

2. MMAP is not working. So, it requires a newer version of camorama that has
   support for USERPTR.

3. There's nothing special on Camorama for atomisp, except that it has support
   for USERPTR.

4. Camorama currently doesn't allow changing the resolution of the camera.
   That's because of several things:

   a. The driver has a scaler, supporting resolutions from 32x16 to 1600x1200
      on Asus T101HA.
   b. The atomisp driver doesn't implement ENUM_FRAMEINTERVALS;
   c. camorama is not prepared for cameras with scalers on it. It just lets one to
      select the resolutions enumerated by  ENUM_FRAMEINTERVALS.

Mauro Carvalho Chehab (7):
  media: atomisp-ov2680: use v4l2_find_nearest_size()
  media: atomisp: move a debug printf to a better place
  media: atomisp: fix VIDIOC_S_FMT logic
  media: atomisp: fix enum_fmt logic
  media: atomisp: move atomisp_g_fmt_cap()
  media: atomisp: fix try_fmt logic
  media: atomisp: fix g_fmt logic

 .../media/atomisp/i2c/atomisp-ov2680.c        | 127 +++-----------
 drivers/staging/media/atomisp/i2c/ov2680.h    |   3 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  59 +++++--
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 157 ++++++++++--------
 4 files changed, 162 insertions(+), 184 deletions(-)

-- 
2.31.1


