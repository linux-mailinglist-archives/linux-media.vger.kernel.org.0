Return-Path: <linux-media+bounces-28770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C105A71557
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C323BA6B0
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A6C1DF97C;
	Wed, 26 Mar 2025 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G1WobdrN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F0B1DDA0F;
	Wed, 26 Mar 2025 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987427; cv=none; b=HWlx4OG4Acj/wqwRbcsflaGEIiOlts0Frez3UH1/c6L2vC5Pa61iPTR4xmFQ+zZAmhaLs1jBW0LUXRNg/Y6fKf8qVv1zMmnmLRAJ7i1Uq3GgzLpY1zSbQ8JwaLbQnC+PZoAxaKJpKzFvoddM5ZYXjVNiSYr+s9S8VTdCPYrBteU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987427; c=relaxed/simple;
	bh=bAh1et3ubU3RR5o1IhFws7s0RctF///TjTdS3EPINR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=seyZ/WQfDoiRCfc2dOqxGHjHHlVw55Fef1kaU0sCTHmjZdnKK9I1EPZOhZ3d3YaajiuTesR83q9zgjh9DRf6zmdGuBpbAPUhHaLWGHZXBmxKXzdj+UR7sxewgK1ZCIIRa+yvrfU2REGo4KG3wBLJdMRnzlCgFJg+HkR6aW29Hb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G1WobdrN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CAE41054;
	Wed, 26 Mar 2025 12:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987308;
	bh=bAh1et3ubU3RR5o1IhFws7s0RctF///TjTdS3EPINR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G1WobdrNFvqKpSizvvlYgP6BLNEK4Jp7I0RGVJs3DC47gFnUUGJTXhM3DCCVn4i90
	 sq9OSWKC49S3h9nwDFQQ10KAFVjRjr1QHifLFBI6laoT6D9o/WBOem/UW9rCkuQMIj
	 4o0HAsfDOphdNdimUqiQpxp0mSyAkW94osnO9bLg=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:25 +0200
Subject: [PATCH v2 03/15] media: rcar-isp: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-3-d0d7002c641f@ideasonboard.com>
References: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
In-Reply-To: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=bAh1et3ubU3RR5o1IhFws7s0RctF///TjTdS3EPINR8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CQZ3jD/emWkxQr7ZsEioZJ8qzshTklF+SOl
 CBrMK4uZp2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgkAAKCRD6PaqMvJYe
 9eF3EACrEkHHd0zZrf4k6yQE/7hwIBAmmhQ8VQgSLmRZX15TgLSslYSiT6fc+yCscIkDGgRWYqW
 idu6HBQ7xsJFSBJDOWEnWlfhwHTbo00rwjovh2rrF0V0Re1RIdTaPie5rrro9lrHfoPKofxs4OY
 g784FF06oUGllBUxslWm2X0Dr7EFuDMd2jHWOTKhwDdUtosHmH+qATGiSpatUW3CifavZDj3HvS
 JC9chxjI2c7k5F201j20yhtDslmEJ/ErwBoUag9WEGrRoT2X2LkjKc0eP9lH2/eyue49oqFZff/
 A4AzLaI+ZnONFc9Et9dBwtyfuAosusnUyGu0ZWErVEK13Y8F5F/lNkkD6PEI5Oiu5NpuDB/BG3b
 /AQHquewhfrbyEBa/OmL4TvQoDM0V3Rj4pRRfKblHTTifjpfXoDvbBN5PcknBpxSb/FKM0kZ8bl
 8r0duH4mkzwHQHT+gE0XHOTHpQNeubaVzByc7OHbPGezCP/bAuCvug6HnHzmHxv3YDq/TwA9Jqz
 vxC02117lmoKPVMx/yXXhpPqCeSAQ5woYsYJuNvcaqT29It+R/Dl62I4K5/S6TWfwMoWD+HVgju
 ZG2AIBq0f1Sddpwt1OElL5rqzBbRAg7idFq/bAxDvy2cWx3ipDk+oRmkmDumPRMN+8RXpXJq3sL
 nDNk0RSU7a8Ji7A==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

With multiple streams the operation to enable the ISP hardware and to
call {enable|disable}_streams() on upstream subdev will need to be
handled separately.

Prepare for that by moving {enable|disable}_streams() calls out from
risp_start() and risp_stop().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 46534a479201..8e222c9ec604 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -268,18 +268,11 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	/* Start ISP. */
 	risp_write(isp, ISPSTART_REG, ISPSTART_START);
 
-	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
-					 BIT_ULL(0));
-	if (ret)
-		risp_power_off(isp);
-
-	return ret;
+	return 0;
 }
 
 static void risp_stop(struct rcar_isp *isp)
 {
-	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
-
 	/* Stop ISP. */
 	risp_write(isp, ISPSTART_REG, ISPSTART_STOP);
 
@@ -305,6 +298,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
+					 BIT_ULL(0));
+	if (ret) {
+		risp_stop(isp);
+		return ret;
+	}
+
 	isp->stream_count += 1;
 
 	return ret;
@@ -322,6 +322,8 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 	if (!isp->remote)
 		return -ENODEV;
 
+	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
+
 	if (isp->stream_count == 1)
 		risp_stop(isp);
 

-- 
2.43.0


