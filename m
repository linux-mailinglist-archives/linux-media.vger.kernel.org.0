Return-Path: <linux-media+bounces-40692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48905B30A4E
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18DE32A4710
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB97D2E41E;
	Fri, 22 Aug 2025 00:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LDDAHb2B"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED794A3E;
	Fri, 22 Aug 2025 00:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822486; cv=none; b=LOerTc65IWmO06/TDS4QBPJdFn8yVVNYgSzvwv2P3AMpTZxY4jqi9FzUavqYv7InzNK92NVdCMh3BqtnoN5S9A5j9K71iS5U3kEAcsMbwIr5bMtwtxqaYuSJlErWcuvL53dvACn3g3llDLahrmrHhgdy9BlL9mpyX9y9ZRmVx54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822486; c=relaxed/simple;
	bh=ovnp78uxCAMSAIEe6ksQSf7uTZ5gFLsD1WnNZZ9DQWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpB+2JrXY7c7DtpzIs2MNj5dp0gM7ACbylfD8Zmy/AKrnBBwPy/PnKc/QNrK70BzPLV7oz2EPRYTeYDgWDGVxWrytfq+UY+2dIEfKKSIrmYLwHvFLnnOFtC/GUyH6iNhJxVMtI8/+oc1F6m1qk7+/xcw166QpuGJmEv8vqONKig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LDDAHb2B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9EC2CE45;
	Fri, 22 Aug 2025 02:27:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822421;
	bh=ovnp78uxCAMSAIEe6ksQSf7uTZ5gFLsD1WnNZZ9DQWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LDDAHb2BLRjxMsVzpJMUtCia3uu6KKrjUquwsKlGro2FUc4+rhHqXFpeFsgnTJWLu
	 WG6ZUxjkhYH3Jb8Dn84KEvC2QMuyxfgHdysuJWir+ghgKc7en6/wOmu/pAFgUULbAA
	 kJXMqbJN2CBBMdF6Evx15W182TqVkGUyj5yUvAkU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 02/13] media: imx-mipi-csis: Simplify access to source pad
Date: Fri, 22 Aug 2025 03:27:22 +0300
Message-ID: <20250822002734.23516-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mipi_csis_calculate_params() function needs to access the pad of the
connected source. The pad is already available in csis->source.pad, but
the function takes a convoluted path by getting the pad index and
indexing the source subdev's pads array. Simplify it.

No functional change is intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2beb5f43c2c0..46f93cd677e3 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -579,13 +579,11 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
 				      const struct csis_pix_format *csis_fmt)
 {
-	struct media_pad *src_pad =
-		&csis->source.sd->entity.pads[csis->source.pad->index];
 	s64 link_freq;
 	u32 lane_rate;
 
 	/* Calculate the line rate from the pixel rate. */
-	link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
+	link_freq = v4l2_get_link_freq(csis->source.pad, csis_fmt->width,
 				       csis->bus.num_data_lanes * 2);
 	if (link_freq < 0) {
 		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
-- 
Regards,

Laurent Pinchart


