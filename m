Return-Path: <linux-media+bounces-13998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF14913F28
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 01:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32C611F21AB4
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796B4188CCD;
	Sun, 23 Jun 2024 23:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ztz0PePk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61C918509E;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719184976; cv=none; b=RbbdPNOVUuc/+fNXrDcG8ML8JV6R16WHfo/hze5bSCfo3COLcHeF7DLV+emhSn4txogjqMWJb2O+B3v7L+421iotkh4Sez/TjHt/Oejh+E0nORqaZbUhwwV1ACbmBdvyxptJzzSOlsI3pnhGKO6lrCsz4F2mfWcxcE/vEuTQxlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719184976; c=relaxed/simple;
	bh=y0RoOWqrDNtRx3/l9S/QfF0yJ9pb9mKrBdIdyjxlfG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CwrL5M0PpOaxxK76ACIvjn4y+EdK3PsbqEGeZ3U7vLJ8ofJV+ns1BBoSfFujAP7nxoc3lUq0+/92uyp7wPOJVipGiNpozSJhJYdHAqSzv+ThYt4Y05exe8w1NAQlmi4dpSHCsV4qqNp0vo0Ujo2ejjD4uUISUIhtKepiiJDaFXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ztz0PePk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42AE4C4AF10;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719184976;
	bh=y0RoOWqrDNtRx3/l9S/QfF0yJ9pb9mKrBdIdyjxlfG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ztz0PePkGLBe9Ja/IErSfHxMy3YVouBxBFWmijemRmACKDO6IFZTA9Ep8n1xSqkEN
	 z9qaaZxLTaLAcm+1ZoRxPoPRr8+gAAN7V9VxlVRRfogUkPIfdcwl7Zj8KVDcROMddD
	 tsh7vGq4v9qjp5kAlL2u2MPZ1HsrBEz4UfnbDl9Jt2RdgpN02Lv4H04MFhVst7DIRL
	 fgu7Q7Aq1KsAsLTxqT1SsgYUhKFV75F78uzCWV4moD8eMtKIkY+hasQ+QCGGSMROqB
	 aRFWcx7f+PDZslo9WZApb9SfHb+Vl5qgtfACTocAennzrC7uGQ6j3vKSW6jzqkR1CP
	 BTBY9A+WObH/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3833EC27C4F;
	Sun, 23 Jun 2024 23:22:56 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Mon, 24 Jun 2024 07:22:42 +0800
Subject: [PATCH v2 3/8] Add sc7180 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-sc7180-camss-v2-3-0dfecdc50073@gmail.com>
References: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
In-Reply-To: <20240624-b4-sc7180-camss-v2-0-0dfecdc50073@gmail.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Chan <gchan9527@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719184973; l=2308;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=YnPxfplUpyI7adL5KPtpIXi5NQhvsVScDtSlkhPHhXI=;
 b=/I0M+vj7t9R6giw6FMrUFghs4X9YNXcj0LsjgRByu9J+GnalPu2StVVD8L/ZsoE5udfElUsVG
 QN/Ww/Gug2JB/X+ZxyS0S9TrHXWz6iq+yolczpEXeYHBRFE7/xxVH5X
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=Ac2fkTqgUBlj2sns9hRIWJTYhWHO1BsmHbdBb5UpUUY=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20240621 with
 auth_id=176
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

From: George Chan <gchan9527@gmail.com>

Add in functional logic throughout the code to support the sc7180.

Signed-off-by: George Chan <gchan9527@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 1 +
 drivers/media/platform/qcom/camss/camss-vfe.c    | 3 +++
 drivers/media/platform/qcom/camss/camss-video.c  | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 45b3a8e5dea4..1fb08b5ee01b 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -577,6 +577,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x96);
 		break;
 	case CAMSS_845:
+	case CAMSS_7180:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 		csiphy->formats = csiphy_formats_sdm845;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index d875237cf244..05fa1adc1661 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -224,6 +224,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8x96:
 	case CAMSS_660:
 	case CAMSS_845:
+	case CAMSS_7180:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 		switch (sink_code) {
@@ -1518,6 +1519,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 			}
 			break;
 		case CAMSS_845:
+		case CAMSS_7180:
 		case CAMSS_8250:
 		case CAMSS_8280XP:
 			l->formats = formats_rdi_845;
@@ -1603,6 +1605,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 
 	switch (vfe->camss->res->version) {
 	case CAMSS_845:
+	case CAMSS_7180:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 		ret = 16;
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 54cd82f74115..5b7f3fba938c 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -1027,6 +1027,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 		}
 		break;
 	case CAMSS_845:
+	case CAMSS_7180:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 		video->formats = formats_rdi_845;

-- 
2.34.1



