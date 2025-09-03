Return-Path: <linux-media+bounces-41618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E378B4114B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 02:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56282560475
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 00:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE4419D065;
	Wed,  3 Sep 2025 00:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHr+qWnh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D6D1891A9
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 00:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858990; cv=none; b=eTbRejyqyjAyz4RICw/ZE3GqYlmo/YT3d8D8YX5iKgLLvxWM40YiMX+bbXfD2+TlvijxXDKcXRnbdYu7JVUAVu4GXNky5meOCYeMOv58V7MZCYhJe69RHC99qURY/NcW/n7JkaIeV7qWB0EseblT+51xfnvmmVwYMpg6BHnV9Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858990; c=relaxed/simple;
	bh=+zLwhXHiWKXvYK6XtyXNEo22hiTXQEOOe3vSK4n5PZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dO39SUz3jbggA+z0eDilj/CqKMsfDEyDyISYky/qlG5Xr6fKkmRicE+imRo3vR9qvFVAdvyM7BG7vEhiU/U6syDU5JcrUo9x9r6CONUPh5e2l2/eTQFnfLgfH0mlgGCCtnsy0hVXfs7kJ/YW/poukOV1wRkZPVxqwC9Zys/SYlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yHr+qWnh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f6d63afb5so567479e87.1
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 17:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756858987; x=1757463787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ied3KyKYXo1OXsMQmpWvwcS5LOsHy9YZp/ZoDS/HAiY=;
        b=yHr+qWnhWrdOYldQSCD0XCknsHFwr39ZHRuL4gZRHFPvgvqTeFxZvNbTEA2ZraIXkh
         70bxQNnlItwiTgHFivHNeYBev+BFuDyHoDMfH/AhWSGO7QRN5UiC4FA3uUV5f7PdICnn
         dtreLeo7BdkHKGfrZCkfKI+XcoB0qurERLxhFCvBjMNbyVnMyn+CBYNH22M3S+5pBt1l
         YNdf6I+JqL8r4K0xS3ad/ZmAQfHPfApg2LJCuJTu3xN9x7ASbTFvTq08xOOh9a/r1OYu
         HfDKsOLwCIuTyUSadOpL8w6bpTpTdWa8rMM/eQbEoOS6BpQcp5xQtBx5+vY3mR60eWh7
         kDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858987; x=1757463787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ied3KyKYXo1OXsMQmpWvwcS5LOsHy9YZp/ZoDS/HAiY=;
        b=OcfW6ptN8lgANCfa2EOCzzitnM+DcUULNhztjPuE2rpu3M4uRHHAYJ70tM7Ox3mVjn
         6qYZe/TqTt3bV/arBcOnphcVZT1+XCasb2PtNwUxCgzUmOKyU87t7/LiXL1OShkO1zYx
         d4AimKYLE6crCnW5jf97xySXYzDV1h67WvUUaJnwCLuFRVlUdcoxhWbc4JJ1ADi2bnZs
         JAfZx0tZUqkJgSgWJIaggXeQSSEkgowiiteC/x9EfDC1zhM4pmq+5u3meoqhyF6xWELh
         8PHSOQkPBnc0nOQbp+ND54pSy1K1XlOK2Y+pF+Lj62cPHuZzkktY1QPwaaEjEkjOguir
         0QDA==
X-Forwarded-Encrypted: i=1; AJvYcCVmXWr8+9UvRh0wyGifUWea0IFFs1qK8mqeazpyxOoR8n9Jj1YnAkwzW+bqN2ncm0O6jluAuYewydIIvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHaIzuq04q5e7aF82GhRJVqGHx5Y9C3s/ikevXVUZvJSNDxxa3
	KFEnN4nvIe8PXxNA9QftOoodK8hA6o1Tx/8+7eTyRU/w2FhZsa08bHdrxkHTILVXb38=
X-Gm-Gg: ASbGnctWW6FNrhP/ADCcNFAA7e6UOjvCPxYYdALQgw8PtCHeEIIi5NVcJNLh8gJNxm2
	oXR9+YgDNSkNIFgj4zPduCwLMnM51Z7NsqTLVsFe9hiBq34w483v7ppRbPFS/Z/ROgG3qI0r8en
	Onc3kb89vBWf7hmL9Yoc2abfBnfFmlzBfVUwRPRJmRhKzg5n0nHxni7Es4ZoC6qOafyHp+jb39O
	YSw2L7bVGhcNS6dSgfh2xcapWB3jXisavP0im/0jUVIPyhAl0hhVfCId67BA9LGva8uiVUWuvgG
	dCL8ytxUI5Js/sQhSWmPzSmPP5RoDS0Qdim5meBli9yLDU6ZTMBMPZQftNhDGknm+4K4HPHmyan
	zD6DMmm7uBKcDeKeXYQpktcPD2/oPByXlJFqa2vrVxEiWrIJ7JrZho5LjZTmebrGZDCU96JFhmw
	D8VmBUSg==
X-Google-Smtp-Source: AGHT+IFNMQg1OhGMRxFYe5kVq/TMBgE6GTRSJ/oEOASGuZ+aGzm+/sOteKbXO8hlOUzKkQ6+dG64YA==
X-Received: by 2002:a05:6512:220f:b0:55f:4d37:6363 with SMTP id 2adb3069b0e04-55f6af049c1mr2785992e87.0.1756858987105;
        Tue, 02 Sep 2025 17:23:07 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm129649e87.99.2025.09.02.17.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:23:05 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/5] media: qcom: camss: remove a check for unavailable CAMSS endpoint
Date: Wed,  3 Sep 2025 03:22:53 +0300
Message-ID: <20250903002255.346026-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Media endpoints are not devices, and there is no valid or sane usecase,
when an endpoint on the ISP side is an unavailable device.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 898d90410551..42f392f6f3a8 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3041,9 +3041,6 @@ static int camss_of_parse_ports(struct camss *camss)
 	for_each_endpoint_of_node(dev->of_node, node) {
 		struct camss_async_subdev *csd;
 
-		if (!of_device_is_available(node))
-			continue;
-
 		remote = of_graph_get_remote_port_parent(node);
 		if (!remote) {
 			dev_err(dev, "Cannot get remote parent\n");
-- 
2.49.0


