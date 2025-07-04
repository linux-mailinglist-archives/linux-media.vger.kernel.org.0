Return-Path: <linux-media+bounces-36749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A651AF84BF
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 02:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02A515464E5
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B00720330;
	Fri,  4 Jul 2025 00:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QypCii29"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE79F9E8;
	Fri,  4 Jul 2025 00:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751588331; cv=none; b=DtBWoNen6bh0NZxJ+ioKZJOTePyeCj0v8a88q0ga4PSo8/dfrbIfTeAEzPXJCdLaJuig8iotfV/hdPnbZTkJnLoZzsi8Ee6Mp39UbxWVYSCwTIVDpV4SmLKV3EAOGL7cUzwxsCVbyyap01/J7FUJAKwK1jcKRfYzRCB/u08eTZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751588331; c=relaxed/simple;
	bh=Unli75nNXDef97rsgX6LE+x1ePeQ0Mc4wyQUOtpEC98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGsXApWwoLqN36RD/UD56N65bVx9V38iNkVdhBwdClBxPiMU+MxjGzkR2kvNjzIJA8UBMgJgikGiSvx9UfeYYaJvqEVCuecuZFjUn+FLr9Z8ww3npp270pkAmKNgYe5yw02SmOJsQ52UOU84VhkEr73NXTFT/We9I+7Eqmx15us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QypCii29; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 72D3C669;
	Fri,  4 Jul 2025 02:18:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751588301;
	bh=Unli75nNXDef97rsgX6LE+x1ePeQ0Mc4wyQUOtpEC98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QypCii29NO9gydLGC2y9puwNFua0wnE9vMkvFtg1PaY9oXhFBS9DJspswXYNrtCCR
	 l2VA/Htmwj1YvMinsGxZSXDQHEqQO/+scAifzW5cElGUsI9P0wrJsW8t/iFUZFyeTv
	 k+texZhXaTpantq1kv2WOdmqMXQKmOzEPhgkVKj0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 4/8] media: renesas: vsp1: Fix crop left and top clamping on RPF
Date: Fri,  4 Jul 2025 03:18:08 +0300
Message-ID: <20250704001812.30064-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RPF doesn't enforces the alignment constraint on the sink pad
format, which could have an odd size, possibly down to 1x1. In that
case, the upper bounds for the left and top coordinates clamping would
become negative, cast to a very large positive value. Incorrect crop
rectangle coordinates would then be incorrectly accepted.

A second issue can occur when the requested left and top coordinates are
negative. They are cast to a large unsigned value, clamped to the
maximum. While the calculation will produce valid values for the
hardware, this is not compliant with the V4L2 specification that
requires values to be adjusted to the closest valid value.

Fix both issues by switching to signed clamping, with an explicit
minimum to adjust negative values, and adjusting the clamp bounds to
avoid negative upper bounds.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 56464875a6c5..ffc1b3ab54e2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -201,6 +201,8 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel)
 {
+	unsigned int min_width = RWPF_MIN_WIDTH;
+	unsigned int min_height = RWPF_MIN_HEIGHT;
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
@@ -229,18 +231,36 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 
 	/*
-	 * Restrict the crop rectangle coordinates to multiples of 2 to avoid
-	 * shifting the color plane.
+	 * For YUV formats, restrict the crop rectangle coordinates to multiples
+	 * of 2 to avoid shifting the color plane.
 	 */
 	if (format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
 		sel->r.left = ALIGN(sel->r.left, 2);
 		sel->r.top = ALIGN(sel->r.top, 2);
 		sel->r.width = round_down(sel->r.width, 2);
 		sel->r.height = round_down(sel->r.height, 2);
+
+		/*
+		 * The RPF doesn't enforces the alignment constraint on the sink
+		 * pad format, which could have an odd size, possibly down to
+		 * 1x1. In that case, the minimum width and height would be
+		 * smaller than the sink pad format, leading to a negative upper
+		 * bound in the left and top clamping. Clamp the minimum width
+		 * and height to the format width and height to avoid this.
+		 *
+		 * In such a situation, odd values for the crop rectangle size
+		 * would be accepted when clamping the width and height below.
+		 * While that would create an invalid hardware configuration,
+		 * the video device enforces proper alignment of the pixel
+		 * format, and the mismatch will then result in link validation
+		 * failure. Incorrect operation of the hardware is not possible.
+		 */
+		min_width = min(ALIGN(min_width, 2), format->width);
+		min_height = min(ALIGN(min_height, 2), format->height);
 	}
 
-	sel->r.left = min_t(unsigned int, sel->r.left, format->width - 2);
-	sel->r.top = min_t(unsigned int, sel->r.top, format->height - 2);
+	sel->r.left = clamp_t(int, sel->r.left, 0, format->width - min_width);
+	sel->r.top = clamp_t(int, sel->r.top, 0, format->height - min_height);
 	sel->r.width = min_t(unsigned int, sel->r.width,
 			     format->width - sel->r.left);
 	sel->r.height = min_t(unsigned int, sel->r.height,
-- 
Regards,

Laurent Pinchart


