Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74D634C6B76
	for <lists+linux-media@lfdr.de>; Mon, 28 Feb 2022 13:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235797AbiB1MBx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 07:01:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbiB1MBw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 07:01:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A6B66620;
        Mon, 28 Feb 2022 04:01:14 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BB1E478;
        Mon, 28 Feb 2022 13:01:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646049672;
        bh=P6tUqqE8TNWEPznGIjIdUEUJRaoDO4TBx2QwQ9Kl/qU=;
        h=From:To:Cc:Subject:Date:From;
        b=bQvXV+9NbXjyk9uiYfoJf7VYJvsCqQBUooSMyC8jTuQ3TyUDqfF3i1MY5ZAvdZ8iK
         d0Hxth+DYz/B4IutQIC0FES5YF2WOSzJt9Ec5+Vm9nVR3Qsp91uKccl/Em6POifUG0
         2r43pO2kqhEMvra+u731M32kgwrO/Oxr+hHhHHuo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Michael Rodin <mrodin@de.adit-jv.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] media: v4l: vsp1: Fix offset calculation for plane cropping
Date:   Mon, 28 Feb 2022 14:00:58 +0200
Message-Id: <20220228120058.9755-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Michael Rodin <mrodin@de.adit-jv.com>

The vertical subsampling factor is currently not considered in the
offset calculation for plane cropping done in rpf_configure_partition.
This causes a distortion (shift of the color plane) when formats with
the vsub factor larger than 1 are used (e.g. NV12, see
vsp1_video_formats in vsp1_pipe.c). This commit considers vsub factor
for all planes except plane 0 (luminance).

Fixes: e5ad37b64de9 ("[media] v4l: vsp1: Add cropping support")
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>

Drop generalization of the offset calculation to reduce the binary size.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_rpf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_rpf.c b/drivers/media/platform/vsp1/vsp1_rpf.c
index 85587c1b6a37..75083cb234fe 100644
--- a/drivers/media/platform/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/vsp1/vsp1_rpf.c
@@ -291,11 +291,11 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
 		     + crop.left * fmtinfo->bpp[0] / 8;
 
 	if (format->num_planes > 1) {
+		unsigned int bpl = format->plane_fmt[1].bytesperline;
 		unsigned int offset;
 
-		offset = crop.top * format->plane_fmt[1].bytesperline
-		       + crop.left / fmtinfo->hsub
-		       * fmtinfo->bpp[1] / 8;
+		offset = crop.top / fmtinfo->vsub * bpl
+		       + crop.left / fmtinfo->hsub * fmtinfo->bpp[1] / 8;
 		mem.addr[1] += offset;
 		mem.addr[2] += offset;
 	}
-- 
Regards,

Laurent Pinchart

