Return-Path: <linux-media+bounces-24989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76518A16F9B
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 16:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B6BB3A46E2
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 15:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA301EE007;
	Mon, 20 Jan 2025 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cFt3/o9f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A3D1E9B0C
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737388031; cv=none; b=FBGW5h/gGtwB3CduiwnAhVvrQM5RJIxh5UDlYuXnXeqWayE72GzbmSSNzMKZA7o/VOfm5W/7NFUv7KMW1+2Knt8y7HvhQ8Mv4jNs36FbQnFplEToWoryTlFqk9FyqUCKFB2NRv1+M4IGFQHHQ8ZNgBegi/6KT46rp5yK2LO9NNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737388031; c=relaxed/simple;
	bh=YDmfsVdEfslTeB5tlJT59e1gEl1IIeKoagoSAphy/v8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dwMEgVYBQ0oVxfhXZRUUENcnHQTqIZ7iEoxsUmZwREj65PFaKPstnOFNKHwUQK8d76K5btMZy5XYXedPavm2I8FOhC9I7pFQ+ocL222UEZups1xGBRZZlbgSQ6EGbTmDzG3q940cLM3PObou0Cw7g/4hCgE3Gv56ySFuhTHM+UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cFt3/o9f; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385de9f789cso3580433f8f.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 07:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737388025; x=1737992825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4YmIVvWntbAsllR5dKuT+D1ShEa9qyZfjT7/otOhdU=;
        b=cFt3/o9fPsZnl4xzUEKnmD/NPOr30p7zdDUADHnJWxPeh0ZVvxCirutv4yc/RA7Qj6
         Nv5jVdtwLrXoiNrZJiP8orbA4Gw5o7+j7YbyzyLR8dudIED84l6PpLAbbYdS9riRQwYz
         tFGcdeqUlKeiuCjSs7tCZiljyu/m1+0QN5L8Kdp7p4p079ViI/CCP5q9sGhH5Oi4STq4
         Kn3kbOJNY+ZCicMJ13lhy8Jxmzi3d29aBxhifrvuGRXoDbgPW8izS0eSF8lxzS9KCDLk
         hNhAC2czsv9qzJ8bpPRgsWoW+HDB/OqglZevzglbSpQ7yKHD7AJjq1dmS2JUvQWNnzFb
         cenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388025; x=1737992825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4YmIVvWntbAsllR5dKuT+D1ShEa9qyZfjT7/otOhdU=;
        b=qIQI3lS3Wx8x2bz12iI/YNn/EzOyy3MjrzKDZnSd2D9ZvblhpytZZEToND+9/qCTLb
         l0DzyhFakchdRC5BL0R0lfK83sa74d7KA6KXzGjRS7L3hhOLDvFKBQwq7/Rwi/CBlTeT
         W2M/mPwvR5HXw/DdVZ5NBGE5LgppxjuOJd1wfJiIx8rhmLP8el4b7NdodKrOV2VvD7aF
         VQDbRosYoYdu1BNay0sy0N7Mii2Kn4sfp4mfsWZCvCaWlVT3ojRikBDGef3nt4WSa8ie
         7weZuivkkEJVJMQkdv1zBC2rmGNxZppU1RXdHHS2ABu89s1tMkxjXaeYrjbTi6VgTTTF
         7TzQ==
X-Gm-Message-State: AOJu0YywKWAZq+03SL1PkmiS1ZFh9PTJ4HTdQAuPuO6Bu+kVWEQHWkgl
	J1M54PuFUTeT1kr+5lzXUVVDpN0IwSamwOzAC2bXDbkQsLY0tcveHzcm4Ujnv3A=
X-Gm-Gg: ASbGncs5rz0vsypS1vqOobhiNcX4/zjXDw4Fu90nS0eK6VbGVlMdYf4zE6AZMdQwBaO
	9fj+PX7rNvksPnHKOQlSRm/ukJ5EdP5t4DoIO9MeLNXukgJeBZu1qp4TgiHBEoK9jHSb4tPcLQL
	t3Nirl5MurA1mJwuE0b3SoY4b35MDNuHZUBJ4D6iXRhKRk/k+vAUwhAjSyKtvcm1BRHA2zkZCrN
	2Vol85fFK6SbaNxk1fUZ8wN9JHWKQPmBh4ZhQ8FsUnGDHU5/bp7WViD8OCU+CI8s68OAOWIlQEU
	ZN4=
X-Google-Smtp-Source: AGHT+IE+0NBhx/Co58J/f5Vb35XzclAS2LGnRT01R7FBkn5X44ZzL89KUzEdqtn7d/UqjjEY/nHB2Q==
X-Received: by 2002:a5d:5848:0:b0:38b:e1b3:16dc with SMTP id ffacd0b85a97d-38bf57d339amr12052973f8f.50.1737388025212;
        Mon, 20 Jan 2025 07:47:05 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm10645766f8f.26.2025.01.20.07.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:47:04 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 20 Jan 2025 15:46:59 +0000
Subject: [PATCH 2/7] media: qcom: camss: Use the CSIPHY id property to find
 clock names
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-2-44c62a0edcd2@linaro.org>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Depeng Shao <quic_depengs@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-33ea6

Use the CSIPHY id property to find clock names instead of relying on
generating the clock names based on the control-loop index.

x1e80100 has CSIPHY0, CSIPHY1, CSIPHY2 and CSIPHY4 so simple index naming
won't work whereas and 'id' property allows any ordering and any stepping
between the CSIPHY names.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 28 +++++++++++-------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index c053616558a73..c622efcc92ff3 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -586,7 +586,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
 {
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	int i, j, k;
+	int i, j;
 	int ret;
 
 	csiphy->camss = camss;
@@ -680,23 +680,21 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		for (j = 0; j < clock->nfreqs; j++)
 			clock->freq[j] = res->clock_rate[i][j];
 
-		for (k = 0; k < camss->res->csiphy_num; k++) {
-			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
-								      "csiphy%d_timer", k);
-			if (csiphy->rate_set[i])
-				break;
-
-			if (camss->res->version == CAMSS_660) {
-				csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
-									      "csi%d_phy", k);
-				if (csiphy->rate_set[i])
-					break;
-			}
+		csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
+							      "csiphy%d_timer",
+							      csiphy->id);
+		if (csiphy->rate_set[i])
+			continue;
 
-			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name, "csiphy%d", k);
+		if (camss->res->version == CAMSS_660) {
+			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
+								      "csi%d_phy",
+								       csiphy->id);
 			if (csiphy->rate_set[i])
-				break;
+				continue;
 		}
+
+		csiphy->rate_set[i] = csiphy_match_clock_name(clock->name, "csiphy%d", csiphy->id);
 	}
 
 	/* CSIPHY supplies */

-- 
2.47.1


