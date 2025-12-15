Return-Path: <linux-media+bounces-48808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C580BCBE184
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 14:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4012D30552C3
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 13:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09890327BFB;
	Mon, 15 Dec 2025 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E4AUtIrN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA530595C;
	Mon, 15 Dec 2025 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804843; cv=none; b=jm4wqFUIzhjCPImWq/LlyUDI6m8+Q2A75Xi9vfqR6qSYrWetM99ql0nLfdgTVarQOQayzmT4G/8V900Ia5ru7j+fJATWkkDBV8InK1LV/PjJDYCuGPyVlejyNpzkLuUSMczHnLXxGxFbcnEb0CkX7myQO+4kIRHDmw4lcVqTlM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804843; c=relaxed/simple;
	bh=0CShGOwgZ5TigEVw+G91rrywFxkq5Qn1I/+QnibNAJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rcqWBKscmi+99SVmM5F861EEA/0SsiL8R2V8wfvnxmr9PeVk4rUQ+Wxk6iP2A4RtQLo/n7SNyphN0KX/BTBy67iT05pho53adkZ7aOHaI0et0ZOvo5gJe5HQM3pEstXZjqauHeLY+AqUXRGpPVnJm+dotT6HMNrumX7SUyKa1Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E4AUtIrN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-49-39.net.vodafone.it [5.90.49.39])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB677EB4;
	Mon, 15 Dec 2025 14:20:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765804826;
	bh=0CShGOwgZ5TigEVw+G91rrywFxkq5Qn1I/+QnibNAJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E4AUtIrNOFKKUHn8Au6SdoTwRCMlI3I4HGZEtQYBkhWCBu0SCvhzh12i+aD8oUvJN
	 YoLW+QthcN906u3KoEeJc7AA+4kk2ieVYuGDuIM8IfvQpPs10PLQpANiE9uNaBjwh3
	 ZlWydopZIfDrmoErdzbzzotc3Sr3iVmT58/4OQQE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 15 Dec 2025 14:20:22 +0100
Subject: [PATCH 2/3] media: mali-c55: Remove duplicated version check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-2-69f56dee3c71@ideasonboard.com>
References: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
In-Reply-To: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=0CShGOwgZ5TigEVw+G91rrywFxkq5Qn1I/+QnibNAJ0=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpQAscHfusVJvOynlfZGD4zMeE/VwNEB763GtZv
 ijw0FoPHjmJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaUALHAAKCRByNAaPFqFW
 PDKbD/4lKcdLO12a65hRL3LjpnK/L9weonr5PuHERs7ZUBa9hf5hR/2t05OPDgo72zTQWJPn0fl
 Bh/d+G9mlp7pk/pSCa9dksDoAcGs64XbSJF7tCOp7CsAXN/PRyQhdWu1QAUmWXrok+iiMWOtLy/
 fm5bU7IiYjH11y29gTrfVZ79Ecuwt6WOFy07KTEg/KYxcUQPgy57dD4h5vVYbJf51/THa9gT7R5
 6BIyaHSJWXDmDj4Cxq76V77wEhJOk0FOvmCEdQHrQiw5xqvJPEy8LrqExxqCvL/NA73ZFRnBMY9
 u38Dyr1l/3cImLi+LcILc0AI0B+HSWV3axVR/nqI5llR7Ri9kMxGbXHale3zZTBD+fHoqxSmdqx
 +HqvWjkTj9gP6YD0aqNUIncLm7PiCEM8lECHmQ359CnBt+/+LRPJXENx2TE9gAowBZGFdCrTddL
 /qkQrYojyhpyuDZLMCrAdzWeYr33m5Dmi/NdT3PRzNj3YL28FgM2oeIioLXH+1o48asmnmqxdyS
 +HBoIywGD5689bGJ3mOnQu6JAznxxY52H48V3uXx/hCPk4LeqsJ8ePkOL93sYQsR3XPPMv0cigo
 Jk2eULM2/tNhDVOOGb8YoshZdaC2ozkKo9cf5Tu0fGG4a7w0OuJItowtfXLhFHmDVyML7G5UG+t
 qbBd+SHWT4YrYjQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The Mali C55 driver uses the v4l2-isp framework, which performs
validation of the parameters buffer versioning in the
v4l2_isp_params_validate_buffer() function.

It is not necessary to replicate the validation of the parameters buffer
versioning in the platform-specific implementation.

Remove it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 082cda4f4f63e880162896ff0f893cd774982d51..be0e909bcf29f62c01c75d711c21278faf7c9de5 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -582,13 +582,6 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
 	struct mali_c55 *mali_c55 = params->mali_c55;
 	int ret;
 
-	if (config->version != MALI_C55_PARAM_BUFFER_V1) {
-		dev_dbg(mali_c55->dev,
-			"Unsupported extensible format version: %u\n",
-			config->version);
-		return -EINVAL;
-	}
-
 	ret = v4l2_isp_params_validate_buffer_size(mali_c55->dev, vb,
 			v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
 	if (ret)

-- 
2.52.0


