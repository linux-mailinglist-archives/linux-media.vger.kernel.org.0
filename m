Return-Path: <linux-media+bounces-28968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34423A753DF
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 02:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 266941899D37
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 01:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448FD81732;
	Sat, 29 Mar 2025 01:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+lWGTyG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE94714AA9
	for <linux-media@vger.kernel.org>; Sat, 29 Mar 2025 01:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743211619; cv=none; b=YTnSs6U9pjM2fpFjKbGWneIMDRynFf2YsFXeewNYp6p7GLqiC8YbTRxpfFd4J99BxR12sx93GU09ti71PVgDzeUOv2hNXAs+9Ri3b9cyvHoP4Lya1Atkiq5xa2n8bKt5a6dRis9ytUzodol+s8xrPRnQs63OL2nPNFki8cwbFJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743211619; c=relaxed/simple;
	bh=UeU+dNWfV5v3e10I+uyNNP2RIX8IeSbfeC0wbfVG2UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=bbbUJMLv21icLXJv7wQGdY46fJZGxZPz6sGfYtOv07Sx9QJonSfWoV2qt48rjwZd8NBavPHrTk7TnOT1Pu5/kJ9oH+aXOJblXb59GtMQNCly+cYO9QAm8UHDxz7g4bnYk4ZFeNsxamRKmVyrEjZZHeJzNG1CNEkmqXbVYdeQQhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+lWGTyG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-394780e98easo1636719f8f.1
        for <linux-media@vger.kernel.org>; Fri, 28 Mar 2025 18:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743211616; x=1743816416; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Xd7RMGwL+Gav8KAb2ER71A9xVEKtaQiZB3bM2GUMrU=;
        b=K+lWGTyGyIXG7EhqrSqtIVAJLdVEc0wRTgqLurh2rKElSDWfM3kHoFXMoOs7O+6JcS
         gJwogy3twL53S1pp0ORdg/kTGumDIkRHoisTibWfgsIIPgIfReF0C21h9w09a+abX9Tj
         mcAzPCTOnTSHBL8C3RJLnG3Fq4DaSqW8n6/vFUXoxeFSmilkU9oH+aIuHVKh4daQyMl3
         bTqs7colwiuP5IPf9bP/kNuTa7jcSe0U694O5ioTA35XImhxsLJuBfANIeTXNdMnVy2a
         8aIQjwmKd58wNhJ/pUN8iKCd053i5hgxJg/dXXOiRO2yFSzbcTQI8ONqUDppQ9TTjmpY
         bHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743211616; x=1743816416;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Xd7RMGwL+Gav8KAb2ER71A9xVEKtaQiZB3bM2GUMrU=;
        b=itMKa/Sp+4AYyOnkDrZnKHxJwmivgBhCqBl26W2C8JvKWUqJ/VkuIzxc5FKYIuJmCQ
         v4yvX+edlaivWpZ+6k2DgKve47j2hRDqrmgwkkvdnXu1d65zzcZsE1SL8YNZriHx7lY9
         VZE6hrpgZCN5MXPqvyVCVHwwRlYEwox2jPJ81TOUQXnHZmmegoScgnKeviMX8wFu4Qas
         8SzNSVfNI1p9JC7AdITWNI6aUuJhjLBhdkhTNWhc/TTz1VZMuy4IAbL+pkxm7waLjaNs
         e+uoBIMUSzwUEyrMbRdNbTtwuumSfd8aTty4zRfA+rdHfDxeHW5evxGO8P5kBV8YaFWI
         m6PQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1MDo0IQSb6Y1PQGElKQpcc+4F5DI97/R4+f53ISoWJcG6eGgzIDv95TGTR0B3Q4d5IM7ovUTBGxgfTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpNGPnAH3V7KwJGp4hKaTW/NPUaGXDNcAdHSzNIG3WeORKS42x
	BY9CiUgJ0H3OJwqJ9YhlCwjcki1okL90wZ49qhqmV77O+N7hywtDjIqXh6pjcY8=
X-Gm-Gg: ASbGncvzuZDOzITmOUyDDDhfwOoZNVwCq8TqR7jGrXQqblaz5aTmcUYH+G7POGKDKm/
	XTJS95lZn9lxaN6dXCvAIRajOC/E36y/TTM+j0dVCX6ce3QRWYJudIzX92I1As//rfHkniSXZRA
	GtxX1IFPbkSjEMh8bP+nZDakrya6wbiqxleACELtsoLWvsGx4EadB291LbAj4AxhfnS3TgOZ0h0
	ZMf9x/PR4+aUwS4KV2okzmHwuKJlQF053Kz5mr7IImIawPuU96Cgex/OM9XroZs4lPcDqfeZUL5
	HPh/dRRoqSBjrKjCpnzp5aeLzXb+5ZJP/mUgoB8z8kpoDfN/I4+UFik4lJBki6LEHNl1g3mQEOg
	Z9rsXFSn1rg==
X-Google-Smtp-Source: AGHT+IEwBNuvUbAMhxVWmNvRXOcvqx3XImmXmPW/lSoPmuRLIWXWpEkqe1jIw7kqySc1oRVntaGqZQ==
X-Received: by 2002:a05:6000:1787:b0:391:2c0c:1270 with SMTP id ffacd0b85a97d-39c120cca84mr847956f8f.1.1743211616163;
        Fri, 28 Mar 2025 18:26:56 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm4264655f8f.94.2025.03.28.18.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 18:26:55 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 29 Mar 2025 01:26:51 +0000
Subject: [PATCH 2/2] media: MAINTAINERS: Add myself to iris Reviewers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-2-0ec1007fde3c@linaro.org>
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
In-Reply-To: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

There's some crossover between venus and iris, I'd like to help out with
the reviews for iris to ensure we keep upstream chugging along.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ccddd2030efd96324e53fcee8048120990a85d5..89fd10c690bbb395fe22f7a6440fb98c9a25c659 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19529,6 +19529,7 @@ QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
+R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.49.0


