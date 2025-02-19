Return-Path: <linux-media+bounces-26385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92433A3C0BA
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CDC0174140
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5C81FCFEF;
	Wed, 19 Feb 2025 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OH3nXeXA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16761FC7C1;
	Wed, 19 Feb 2025 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973010; cv=none; b=pxDO+u3HCKCFfLO/MzyNDOzi8JA46FVfIsgkCRIQOB11DGjj4+rE3XGwGnpvIVyI88U8TsHLa/BQt98ja68/tPN1dm8q/eb0qbGWDJzSfXMQxi7UuX26DXUjpQkb3SPUHLCdrCXVMDS9oAGY5433ZGsq9jOO1CZ6nYp2/yzXQ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973010; c=relaxed/simple;
	bh=AAoZrLKhCu46h4eqW0AD+WoWoaATspJrEVsuJ1Kip4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HXN8w+kAUf52WCj/P3xySWLOReGqkev7bZxxZ2EkFltv/kR/iOxmCaekxLQFE0wcfLDYIOResglAATnlxIDbsGm/0C/r85Knt8exrxv6x8SiwdDoyCpMIrk5Zep3h0uUv+AIFQs7EcjjXLCvr7r5s+xzd02NOsda6XZrQHNbYeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OH3nXeXA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0A2E1986;
	Wed, 19 Feb 2025 14:48:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972911;
	bh=AAoZrLKhCu46h4eqW0AD+WoWoaATspJrEVsuJ1Kip4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OH3nXeXAaNVgx9uPkqoPIJWkCJf9ESZsenmFOfG8tmL0osXVdEa/JxRfx4G9juOGo
	 pYdRQAyjBb0+5vaQiQ9gW2WX2+gMqdUWp2QfV+Mwtwc+PANK/8d+2jpDRK2kwl6mCz
	 sgIANGR9uOm7d0fvcUjqrOmjmYRk/39FJiowqL1E=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:08 +0200
Subject: [PATCH 14/18] media: rcar-isp: Call get_frame_desc to find out VC
 & DT
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-14-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=4530;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=AAoZrLKhCu46h4eqW0AD+WoWoaATspJrEVsuJ1Kip4g=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteF0Se4pPB1mnuS889UKp4TxEYYL1TZt7iDK0
 nMNS9CkLFSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhdAAKCRD6PaqMvJYe
 9XHPD/9vJy4tUDRFXLDWzbvXqJQF1M1W8pS4me4gl6u25mVbtshAFGPBa/9foJFtJJNwLT0kL/T
 WnuBOBiS28Pc0DacZ+d8RGGuKNwojG23sSMaIYAZgMwX8MGIIERLe8pXM4FUvt7ZbBw+6wIMBaX
 vTKVdVZyssrs4Ln7y4r4R2Uw7laPOmcbXPXi0v55TobBbUX75aTtJ6bvpawYzviQdLeb4siSkHO
 0Oe9YZAUAIO7HeifaVm9yIv0tHwr+ycSHEX+fh3dIpXQ8of9JX06u4oMELqq/NR8tShOG5nNyOv
 Qc8D/FqQTWU+T1FLH1jfPWoMN+1aYyXu1Rzg2NAWauSjzOopuEh20dZvVdcUkNER70Wrk38YtL6
 VkVghVxmYzdIrOuDZN6Vm7kFoc8IS2fJS6/uWwbCYn7Qs3nImoVzXeED94sjciP60JA9hsdWfwG
 CFzi4m3Dr0NWQIliGGVqunW1uX6SbOGtjhjVWr3pCTFbfBK/qZKklU6/B+sobc/nnUVVeqEfdu0
 FsZyyGcWbHKh/6lgEZbgDlWJrvIpSmXtoq9u+Ilqxfc4ujSy+IPmbX0xYwQTAVigETKYWIrhZqI
 jCorKZH11+i1S2vFxCs55/3oqaT6YWwrpVe4g+K9k73iWmPTyypXJH+6o1jXVNsM/HJFOA1qJJc
 xJgwFVH4Wi4TPRg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Call get_frame_desc to find out VC & DT, instead of hardcoding the VC
routing and deducing the DT based on the mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp.c | 108 +++++++++++++++++++++---------
 1 file changed, 77 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 5f3fcdb7e37e..53927954ba73 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -225,24 +225,86 @@ static void risp_power_off(struct rcar_isp *isp)
 	pm_runtime_put(isp->dev);
 }
 
-static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
+static int risp_configure_routing(struct rcar_isp *isp,
+				  struct v4l2_subdev_state *state)
 {
-	const struct v4l2_mbus_framefmt *fmt;
-	const struct rcar_isp_format *format;
-	unsigned int vc;
-	u32 sel_csi = 0;
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
 	int ret;
 
-	fmt = v4l2_subdev_state_get_format(state, RCAR_ISP_SINK, 0);
-	if (!fmt)
-		return -EINVAL;
+	ret = v4l2_subdev_call(isp->remote, pad, get_frame_desc,
+			       isp->remote_pad, &source_fd);
+	if (ret)
+		return ret;
 
-	format = risp_code_to_fmt(fmt->code);
-	if (!format) {
-		dev_err(isp->dev, "Unsupported bus format\n");
-		return -EINVAL;
+	/* Clear the channel registers */
+	for (unsigned int ch = 0; ch < 12; ++ch) {
+		risp_write(isp, ISPCS_FILTER_ID_CH_REG(ch), 0);
+		risp_write(isp, ISPCS_DT_CODE03_CH_REG(ch), 0);
 	}
 
+	/* Clear the proc mode registers */
+	for (unsigned int dt = 0; dt < 64; ++dt)
+		risp_write(isp, ISPPROCMODE_DT_REG(dt), 0);
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		const struct rcar_isp_format *format;
+		const struct v4l2_mbus_framefmt *fmt;
+		unsigned int i;
+		u8 vc, dt, ch;
+		u32 v;
+
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!source_entry) {
+			dev_err(isp->dev,
+				"Failed to find stream from source frame desc\n");
+			return -EPIPE;
+		}
+
+		vc = source_entry->bus.csi2.vc;
+		dt = source_entry->bus.csi2.dt;
+		/* Channels 4 - 11 go to VIN */
+		ch = route->source_pad - 1 + 4;
+
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
+		if (!fmt)
+			return -EINVAL;
+
+		format = risp_code_to_fmt(fmt->code);
+		if (!format) {
+			dev_err(isp->dev, "Unsupported bus format\n");
+			return -EINVAL;
+		}
+
+		/* VC Filtering */
+		risp_write(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
+
+		/* DT Filtering */
+		risp_write(isp, ISPCS_DT_CODE03_CH_REG(ch),
+			   ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
+
+		/* Proc mode */
+		v = risp_read(isp, ISPPROCMODE_DT_REG(dt));
+		v |= ISPPROCMODE_DT_PROC_MODE_VCn(vc, format->procmode);
+		risp_write(isp, ISPPROCMODE_DT_REG(dt), v);
+	}
+
+	return 0;
+}
+
+static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
+{
+	u32 sel_csi = 0;
+	int ret;
+
 	ret = risp_power_on(isp);
 	if (ret) {
 		dev_err(isp->dev, "Failed to power on ISP\n");
@@ -256,25 +318,9 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	risp_write(isp, ISPINPUTSEL0_REG,
 		   risp_read(isp, ISPINPUTSEL0_REG) | sel_csi);
 
-	/* Configure Channel Selector. */
-	for (vc = 0; vc < 4; vc++) {
-		u8 ch = vc + 4;
-		u8 dt = format->datatype;
-
-		risp_write(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
-		risp_write(isp, ISPCS_DT_CODE03_CH_REG(ch),
-			   ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
-			   ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
-			   ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
-			   ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
-	}
-
-	/* Setup processing method. */
-	risp_write(isp, ISPPROCMODE_DT_REG(format->datatype),
-		   ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
-		   ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
-		   ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
-		   ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
+	ret = risp_configure_routing(isp, state);
+	if (ret)
+		return ret;
 
 	/* Start ISP. */
 	risp_write(isp, ISPSTART_REG, ISPSTART_START);

-- 
2.43.0


