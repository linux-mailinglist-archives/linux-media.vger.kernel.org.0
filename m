Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2B6C167809
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730021AbgBUIpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 03:45:38 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:44701 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728655AbgBUIph (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 03:45:37 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 53wBjunHFPKvK53wFjhWPF; Fri, 21 Feb 2020 09:45:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582274735; bh=YkSxFacioWkeeQ0ZcNHWP17TqrGk527fezHzGzYnPIA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=ZqWrAPNWc9JkUIGdEgu6TVL66Oh1aJY7hGdx5oNGcFI1Bj6VxQssMlWdjJ7MQPyNT
         5Ksy7wJw19gHIn3ucZQuVY2hCM0VJ31iNV79gg4zqGJTDOK8wUHmwwcAM19Hy43RvY
         25/x0lubJgIn56cH0ql9xFdGNgEkUrXZY3pkdatKy3sCWRWMHl85ppuIzuV2V/mbHg
         eefNGs6sAx50SQXiAYPKAzhoRbRjA3RRepYU0W2uYWaMRFVZKWSe5MW1yC90ZCO5ea
         X+f9PziUB1TlhdPPrIB8I/9yK6T59kBfTUDtVqdo+AHo/1Odm7m1F3zEoUnLVzVJZ0
         okOrAeAZDYgiw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [RFC PATCH 0/9] Drop VB2_USERPTR + dma-contig combo
Date:   Fri, 21 Feb 2020 09:45:22 +0100
Message-Id: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAjnkLiP7q4gZpqplTpKO1fI2iBbMeQqXKDivYFuayAtK838oEK2l/w7lRMJCTMEnYgxY3oatVhS7EIvQ5k6wuKVuM+AgLt+sWUGhSm8h1c85bacquQJ
 La1mzHvPUThJhtPJbjqoTFoIS3B7oeReC6NXvlamzWTdbfL1ZgNWUyhV4ynwOTdutPxXyjjwxBSsWg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The user of VB2_USERPTR with vb2_dma_contig_memops makes no sense
since it requires that the user pointer buffer is in contiguous
memory. This was required with old hacks in the past, but these
days we have DMABUF to take that role.

This RFC series drops VB2_USERPTR from any vb2_queue that uses
vb2_dma_contig_memops.

Note that this series depends on a patch that adds VB2_DMABUF
to any driver that didn't have that:

https://patchwork.linuxtv.org/patch/61782/

And for the rkisp1 a patch to remove VB2_USERPTR has already
been posted:

https://patchwork.linuxtv.org/patch/61780/

Regards,

	Hans

Hans Verkuil (9):
  mtk-vcodec: drop VB2_USERPTR
  solo6x10: drop VB2_USERPTR
  m2m-deinterlace: drop VB2_USERPTR
  mcam-core: drop VB2_USERPTR
  sh_veu: drop VB2_USERPTR
  mx2_emmaprp: drop VB2_USERPTR
  davinci: drop VB2_USERPTR
  exynos/s3c/s5p: drop VB2_USERPTR
  omap3isp/rcar_fdp1/vsp1/xilinx: drop VB2_USERPTR

 drivers/media/pci/solo6x10/solo6x10-v4l2.c         | 2 +-
 drivers/media/platform/davinci/vpbe_display.c      | 2 +-
 drivers/media/platform/davinci/vpif_capture.c      | 2 +-
 drivers/media/platform/davinci/vpif_display.c      | 2 +-
 drivers/media/platform/exynos-gsc/gsc-m2m.c        | 4 ++--
 drivers/media/platform/exynos4-is/fimc-capture.c   | 2 +-
 drivers/media/platform/exynos4-is/fimc-isp-video.c | 2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c      | 2 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c       | 4 ++--
 drivers/media/platform/m2m-deinterlace.c           | 4 ++--
 drivers/media/platform/marvell-ccic/mcam-core.c    | 2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 ++-------
 drivers/media/platform/mx2_emmaprp.c               | 4 ++--
 drivers/media/platform/omap3isp/ispvideo.c         | 2 +-
 drivers/media/platform/rcar_fdp1.c                 | 4 ++--
 drivers/media/platform/s3c-camif/camif-capture.c   | 2 +-
 drivers/media/platform/s5p-g2d/g2d.c               | 4 ++--
 drivers/media/platform/s5p-jpeg/jpeg-core.c        | 4 ++--
 drivers/media/platform/s5p-mfc/s5p_mfc.c           | 6 ++----
 drivers/media/platform/sh_veu.c                    | 4 ++--
 drivers/media/platform/vsp1/vsp1_video.c           | 2 +-
 drivers/media/platform/xilinx/xilinx-dma.c         | 2 +-
 22 files changed, 32 insertions(+), 39 deletions(-)

-- 
2.25.0

