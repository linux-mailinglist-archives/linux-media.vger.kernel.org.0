Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E809D30407
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 23:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfE3VPj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 17:15:39 -0400
Received: from mailoutvs5.siol.net ([185.57.226.196]:55353 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726652AbfE3VPi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 17:15:38 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id DEC8E52287A;
        Thu, 30 May 2019 23:15:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id SKLhHVptzaCe; Thu, 30 May 2019 23:15:35 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 8A25A522869;
        Thu, 30 May 2019 23:15:35 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id E82C452287A;
        Thu, 30 May 2019 23:15:32 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     paul.kocialkowski@bootlin.com, maxime.ripard@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        nicolas@ndufresne.ca, boris.brezillon@collabora.com,
        jonas@kwiboo.se
Subject: [PATCH 2/7] media: cedrus: Fix H264 default reference index count
Date:   Thu, 30 May 2019 23:15:11 +0200
Message-Id: <20190530211516.1891-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530211516.1891-1-jernej.skrabec@siol.net>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reference index count in VE_H264_PPS reg should come from PPS control.
However, this is not really important because reference index count is
in our case always overridden by that from slice header.

Cc: nicolas@ndufresne.ca
Cc: boris.brezillon@collabora.com
Cc: jonas@kwiboo.se

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
We have to decide if we drop pps->num_ref_idx_l0_default_active_minus1
and pps->num_ref_idx_l1_default_active_minus1 fields or add
num_ref_idx_l0_active_override_flag and num_ref_idx_l0_active_override_fl=
ag
to slice control.

Current control doesn't have those two flags, so in Cedrus override flag =
is
always set and we rely on userspace to set slice->num_ref_idx_l0_active_m=
inus1
and slice->num_ref_idx_l1_active_minus1 to correct values. This means tha=
t
values stored in PPS are not needed and always ignored by VPU.

If I understand correctly, algorithm is very simple:

ref_count =3D PPS->ref_count
if (override_flag)
	ref_count =3D slice->ref_count

It seems that VAAPI provides only final value. In my opinion we should do=
 the
same - get rid of PPS default ref index count fields.

 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
index a30bb283f69f..cc8d17f211a1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -340,12 +340,8 @@ static void cedrus_set_params(struct cedrus_ctx *ctx=
,
=20
 	// picture parameters
 	reg =3D 0;
-	/*
-	 * FIXME: the kernel headers are allowing the default value to
-	 * be passed, but the libva doesn't give us that.
-	 */
-	reg |=3D (slice->num_ref_idx_l0_active_minus1 & 0x1f) << 10;
-	reg |=3D (slice->num_ref_idx_l1_active_minus1 & 0x1f) << 5;
+	reg |=3D (pps->num_ref_idx_l0_default_active_minus1 & 0x1f) << 10;
+	reg |=3D (pps->num_ref_idx_l1_default_active_minus1 & 0x1f) << 5;
 	reg |=3D (pps->weighted_bipred_idc & 0x3) << 2;
 	if (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE)
 		reg |=3D VE_H264_PPS_ENTROPY_CODING_MODE;
--=20
2.21.0

