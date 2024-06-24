Return-Path: <linux-media+bounces-14055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 703FF91498A
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 14:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B790281D1A
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 12:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC4213CF8C;
	Mon, 24 Jun 2024 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNf5ERor"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D252413B5A2;
	Mon, 24 Jun 2024 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231235; cv=none; b=j+3WCA8qImsonYmWWWsgRU1iZP/uqCuPR7TSwE1ToZ3a421ekdzaamfRmmTDpGO4vx8nEo/K3s2VbqBtxWwcExKxn6VABCat+xa4eDExlBAK5h178AzkduFuElEwpXCf4wnPX6KYe31ABfqgcf8gngHs68sDB9IA5y5kuQEAHYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231235; c=relaxed/simple;
	bh=4lPmZq/kdKwByrrPEk0TO//GBNkLGA6Gl8rs5LnhRw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aSFOpVxevOmOMDWMhu5c1v2WGIMGN5OSnLHLl9+miQvdpt24i26u59eu/ljvFXjkJCFY/RpbxLvDlMwf/pNGJH0g9+DwjlOI1MyLgjGPxqiuLc2NlWF1TWg5+BwSd1azAjbdpEeMuMLJTGubuBKJG/Rc/zSndzt4cm+3cvLYzcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNf5ERor; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87B9FC32789;
	Mon, 24 Jun 2024 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719231235;
	bh=4lPmZq/kdKwByrrPEk0TO//GBNkLGA6Gl8rs5LnhRw4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oNf5ERorNO6AflrMkYk30l6tY5pd7iP8y5m7VSqxNgJnbFlmfwc4qAjiAFhep0s2o
	 fNwuSi7VU7M/LO/mmLFqYatXQsRs7sQYnNTmiqOHWtxUNchpXvEhMqrtJcqFS3CXnR
	 BrGxBAZZN9TFpytc4tGVdyA1QNJ2ttz1w7kfDwRcy47y4/WX/ZKJ8jjZlfOdcbYWwd
	 E6J3IcUzCkkZIZ+uHOtJRzOpLSmPSTmWmy5uDVs+LvgmSUqzlAGHbDyO+mIQAQNfHk
	 uyjigjXal5B62Zqm/dOBjePdjTWq37sNWQmUWGiqM//LsOlyecUbBc2uIWvkzv4Hye
	 n1Suyoc+de4CA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79474C2BD09;
	Mon, 24 Jun 2024 12:13:55 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Mon, 24 Jun 2024 20:13:14 +0800
Subject: [PATCH RFT v3 3/5] media: qcom: camss: Add sc7180 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-b4-sc7180-camss-v3-3-89ece6471431@gmail.com>
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
In-Reply-To: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719231232; l=927;
 i=gchan9527@gmail.com; s=20240621; h=from:subject:message-id;
 bh=HHQC0JVgXeyXDdUnnrDSAKGSUw92sGDdo0OWiCGXY4A=;
 b=umfuvpded0avpFTUHhmEzpvneVqWsGTZAuLmHe5JYrvY5KIJoCkrhuxCd4e+pbeLucHtbvXy3
 +t1mvLy+BZyCvLZebVTuTvtVX8/9IExLgBtABE5UMqQBOJucxDkOG6W
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
 drivers/media/platform/qcom/camss/camss-vfe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 83c5a36d071f..05191cc2c2f9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -336,6 +336,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8x96:
 	case CAMSS_660:
 	case CAMSS_845:
+	case CAMSS_7180:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 		switch (sink_code) {
@@ -1693,6 +1694,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 
 	switch (vfe->camss->res->version) {
 	case CAMSS_845:
+	case CAMSS_7180:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 		ret = 16;

-- 
2.34.1



