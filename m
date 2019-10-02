Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 535DAC9277
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 21:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbfJBTgK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 15:36:10 -0400
Received: from mailoutvs57.siol.net ([185.57.226.248]:42368 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729042AbfJBTgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 15:36:08 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 7CA91523B37;
        Wed,  2 Oct 2019 21:36:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id WgF6VE6rEv7V; Wed,  2 Oct 2019 21:36:05 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 37B9F523B2B;
        Wed,  2 Oct 2019 21:36:05 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id D00F3523B68;
        Wed,  2 Oct 2019 21:36:02 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] media: cedrus: Fix H264 default reference index count
Date:   Wed,  2 Oct 2019 21:35:52 +0200
Message-Id: <20191002193553.1633467-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002193553.1633467-1-jernej.skrabec@siol.net>
References: <20191002193553.1633467-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reference index count in VE_H264_PPS should come from PPS control.
However, this is not really important, because reference index count is
in our case always overridden by that from slice header.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
index bd848146eada..4a0e69855c7f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -364,12 +364,8 @@ static void cedrus_set_params(struct cedrus_ctx *ctx=
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
2.23.0

