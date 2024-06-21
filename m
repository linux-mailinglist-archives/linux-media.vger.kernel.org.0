Return-Path: <linux-media+bounces-13911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE729120F3
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 11:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45D641F2244D
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 09:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972F916F830;
	Fri, 21 Jun 2024 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPB9zuMt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD90416EB6F;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718962857; cv=none; b=mmuxzhHWbXwekgkbbdu6fChjgcJW1bJH5+2sfCAwqXg12u+8TY5mneq2Kd6p+8/mt6SlPEX+KtUU4x8T05Mxf3c1cGAPDdywMQ21c2av4tK0Gfk8JOcKAJcP56BMJG+1eW1cRZkH2IjRCLtIOJNq3wwoPb0mSbeMUWqlmwobd5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718962857; c=relaxed/simple;
	bh=y0RoOWqrDNtRx3/l9S/QfF0yJ9pb9mKrBdIdyjxlfG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PFXJe9TBLrBHsQr9Q0DbsOvEq9LbuLw9JO141SBFDCXCjmnQH5LZI1SNN27PJRmD3hdxmNNGaJfW7NoCROGwqnHG/YIc1p+k2I993K4sYRyX601a8mE0VqECEl/QVxIkmFQvwLwdA/snu3J98K7ph4CWPCJQuMc/JZ4oDgG68Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPB9zuMt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71878C4AF11;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718962857;
	bh=y0RoOWqrDNtRx3/l9S/QfF0yJ9pb9mKrBdIdyjxlfG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LPB9zuMtIL4KWLHx/bBJMGmXBkmbTCL10YVGqmjS5cqmuXHK9Lh444pEijkmn9dhO
	 zSiB5aEp1GjH1SEifwzO4AtREq+2fJIJR5pMLLp9++AloSnOUpT7oiiakNmkN3byQL
	 Xamwx6wuaFQFWTUW3mR8uzL9vMBTibF/OnMnKiqqBy+q7BtoaBoWi0eprlN3kDvVUd
	 /h5P0tOyTVcsFPhMvy3NXnKZhbWfXlLZlsZpMncPejrRJ9GC10b8eQxoTa5PzMwALp
	 cjzqoo86trOmAoHjWIcXIAaRC4ldYK/RbkJnDSIQf2Yfzxc94E7OJTe+jkJzUusUcW
	 /27HDj48UAdpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AA8C2BA1A;
	Fri, 21 Jun 2024 09:40:57 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Fri, 21 Jun 2024 17:40:56 +0800
Subject: [PATCH 4/6] media: qcom: camss: Add sc7180 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-b4-sc7180-camss-v1-4-14937929f30e@gmail.com>
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
In-Reply-To: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718962855; l=2308;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=YnPxfplUpyI7adL5KPtpIXi5NQhvsVScDtSlkhPHhXI=;
 b=6N0QHkttcoYSS5SQ1fZKQ/9yXpFF+i4jfnyxFZ/YNyQ7zNoXbFOCVAxMHQm5FCGJtRgJI6iC/
 LYsmZIaJH8pBbe6sVnNlv7yrOh1pHN56UuFSW8GTBg9UZ33wu+ZamU6
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



