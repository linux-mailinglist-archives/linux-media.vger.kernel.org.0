Return-Path: <linux-media+bounces-29227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8803A78E4F
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 14:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76A721890313
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 12:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C041D23A9A7;
	Wed,  2 Apr 2025 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="esSmra/x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0ED23909E
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596661; cv=none; b=jxpfXDwvLYWeToVlIiSVaVfjUg+3v09KjrPPuv2xRYaWFCKbYjPUBNvztMIGxVg4JMc0EvcEZVRPyKNq4p3pM9422BDA00JOvjwV2CmPTt2Y921eLiKo0duZ+lTcVLMDiDdLArTLH4Dg2srsAECuMjmRXX7cLQJZazn3mOB0wtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596661; c=relaxed/simple;
	bh=pd3p1EOQeH1JIt4Udq9z6hzw43geRI4pY+FfLwoeNyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mts63mCWvPmteFJKxhvdPCePhmTRmXLHypx8GcmmIp2H8R/X41fXBjzUVbWwr44rP4dw28JW3TrlpYty5/CiSwyKZKOBGAS3m4gj1z0p6mEmnliFYSYGbXkWmc3IQfhfS9thJLLRRNs536yUtByeKQ8QTNpHxeqNItkGHBr8olA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=esSmra/x; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so72382755e9.3
        for <linux-media@vger.kernel.org>; Wed, 02 Apr 2025 05:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743596658; x=1744201458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ag+qe36rtOH7BLdLDFRBy4D28dCl/fsM+SZOhDkhdl0=;
        b=esSmra/xoXXUbxKb420hDYnq3/8ceIa/4QK0SyVejyi6Ifp05e++k3tcg0oXGkjIl6
         ActRxgW7R5MUG19CfuyVfoYDX4oi7Oic7cKKU1QbXmZ3bn1kAh0l/APCH2O2sMTM3UcI
         MP8Lipb9nZnA9VmQNoeAvcDA9RvZlqMVGcXq+aWw4mrWHIiA0QXT+TKyLwBinMncmESm
         qVPXZG4YuMydJ9h0IxnloYakY9MeFVx0HYTGwuNtA3fL/teaYnye04AeMPbD52FCFoPZ
         Id1kvZNeqjYfpdWcIvtHW9xxZZQ74HOsvzDKE/7CCC600Bd0dpO2lNdyDJIl6pUg7Lgz
         6k7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596658; x=1744201458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ag+qe36rtOH7BLdLDFRBy4D28dCl/fsM+SZOhDkhdl0=;
        b=OzIq2Xv8DtR0xMRmZ5bhc/SG81lirixQ6YgRDIFJSWo1wq0C+POUlcUTzyMVUoj4pi
         x7WLSibPC7K1MUGs+ZxdaaFULWJnxbBvKd3luAWLG1DljWhg9NXu7wbiXf+CrXpoUb/S
         OEEqIy+Z09Nk/iYtoUUEwiFENGc0qyXng8za+3oiWmYfBekxV8xokV6nnhY6Kk32sxy3
         VPgRXOWYJVM3KDLalYQHM8hxylIF3qtvZnbcepRNvgaRfgjJqxVAclUr5JO/d5+jQ/OI
         raOf8g5dwSiPo/U8S5YGVj4MKg8sRtTkwFV6nCrIfZUlO6Z1IM53gUtUbmzfYF/HzMEE
         FJoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtwCjX5zTiEaT4iDB4WGzkb9Pnz9G/RZGO8n9CyOZUjknji1mLsgy5i38uLZ6K+d1CgIg06Nj/c7/ZVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNtHcX+7rBrJ0ats5wQGrV1hZaAW+3B0l4aOSyAPwgMZ0SSJMR
	yMM5PkC3qfK+2lgTOuTtHwN3nXh7Tds9tkmGpt6WVXKf9nHbhOIHJYdqPwCZ84g=
X-Gm-Gg: ASbGncuqYssnD1oAg6wtxrPPMh2/mJ3SSWzf9eKYfETX17xJj95SSDSkRP2yvPwjLAK
	9+xd8ZHTdQMqbc7SN+elofcMNdDcpQsSekl2YFY4eKMt8jGOJo/p60MYbHF56xA0MwrVEIVbDod
	6zyPY3V82/S4MAJFHcZv9gFYCBXgh+uJkyJlmqCYrBBiCOUfw23qUdMzYgjDJJ6Rn3pCmIxag3T
	X7tSELnlaSVfl4CkIJEdIGapOp/ibUr9Z8dkPLR5F6Wogix4P9z08nRbBa4OV+9UJOP6QUms87Y
	TGJjH+SUUefn54rm0xm6PYmEfKEYslmpE4F6PDVWhiZxdkgJZh3VaHC5IxsgixNDuc4ckrBU3kU
	C0vncfHdOIg==
X-Google-Smtp-Source: AGHT+IGZ2A+/X2i0m4nqT4WW0eKZBN0Bs5Jmua4vnLJ9sVRHmwsIh+X6Rzu6YnRHs9vcyXyorAWz4Q==
X-Received: by 2002:a05:600c:474a:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-43db622a023mr164334985e9.12.1743596657700;
        Wed, 02 Apr 2025 05:24:17 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60ccc66sm19418675e9.24.2025.04.02.05.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:24:17 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 02 Apr 2025 13:24:14 +0100
Subject: [PATCH v3 1/2] media: MAINTAINERS: Amend venus Maintainers and
 Reviewers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-1-2b2434807ece@linaro.org>
References: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
In-Reply-To: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Stan has stepped back from active venus development as a result I'd like to
volunteer my help in keeping venus maintained upstream.

Discussing with the qcom team on this we agreed

+M for Dikshita
+R for me

Many thanks to Stan for his hard work over the years from originating this
driver upstream to his many years of maintenance of it too.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..1d03530f3298703c5f3d025010511451f878f822 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19590,8 +19590,8 @@ F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
 F:	drivers/usb/typec/tcpm/qcom/
 
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
-M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
+M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org

-- 
2.49.0


