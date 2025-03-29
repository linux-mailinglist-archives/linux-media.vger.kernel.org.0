Return-Path: <linux-media+bounces-28967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26869A753DC
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 02:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32E541898D33
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 01:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008AD54F8C;
	Sat, 29 Mar 2025 01:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjiXoT6R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C4A17991
	for <linux-media@vger.kernel.org>; Sat, 29 Mar 2025 01:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743211617; cv=none; b=S4eIbsnF9CX6X7Z9AqCOfXEM3bdLSS2WuWaPD3GazI1acuYTgaRCev4kEns8/5bh6o5w+Kq15zdeBOJpnYxMTcvHMZ0zeTPOrtOaH7jnPlcM+65fhYIKn7ErZKUk9cDiu0lnhxry19N8bmviUF1wYlQ8B/AwVWWOkivyW67Qi60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743211617; c=relaxed/simple;
	bh=8iUkVLiRaFgpf9kgBiXuc+txIqsEZ1pdksC7K1q+D0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=ZUugSVydGoV8z5zW9Huz33TCHOye5a+WT/jOIcGbrhAIrlCZHaib6aoDm8MHpNXmgkl5iS2sWRjPIuUOvf4IyyXloUkH4UDuMaSGAbCnEaPBur6FHOr5q2XCRjuwI5qfMoz0VayquyK4rf9L48BmhjZJ8AgCLkuZld6aak+0W2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bjiXoT6R; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso2452960f8f.2
        for <linux-media@vger.kernel.org>; Fri, 28 Mar 2025 18:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743211614; x=1743816414; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OalCYm/Z+qjs2z+PLYtPWK/oaiLf/iOtUZrDjzSPIcM=;
        b=bjiXoT6Rj+tL3xibrlFVssPADTu46rKyN8PksK+p+zKemdpNLiLPa5YZHP7WrAoZ1e
         9rUScCkZtfcEiBgilNVilRpAk1iC+ZwtoIj2CqmC5fp8FdzO/WLR6zRGnu9wcAcxrb51
         oXjZ1EzwJdTjD35aoVVnrRdmIFUrJ9lHhZH4EsQffoIBShKS4KafWwRgdYWiHjM1B6Tl
         ERqV78QecnvCFY8clLwaFWbHqj3QQ09RHbp0ptsBxx8untPyDLjCMcj7cOqy1ucYSqjd
         kj0THMTx5Fv0nPvmwAv8kmikJ0gb64ajQ66zsfXWXGB73w0Kq46DtcnbL5kngHjI09y3
         2vdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743211614; x=1743816414;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OalCYm/Z+qjs2z+PLYtPWK/oaiLf/iOtUZrDjzSPIcM=;
        b=rHddhZ14qR49cM1YvpLpG521le36G03Q4Lgsvl+09j3M+avjd7bxsnZ4GmCs2446IH
         y4mkqYRtAQNZqaH8yt9RgyC3j/oNQJqn5SID9NNvtc8jwOqkKQOJrqV5sETCjy2N3SpV
         AXMVEmGIK3COMYmO1IjLSV6gTQXmenFqtT8mjwLtHQgQy2ih6oDMKPvPIuMPHFQkePAY
         97PlgTYUx+AzDfOn8kqwRpi1sP8EI8qfNNasC7izyMALFm7I7xcTEq4b0fmMfRzW24iq
         tp9T6L04OshEFbnNqg19mhEBVM9DavmwZNnOyJhsfefi1AStxm1w0bBgX6i6iyASu890
         9wUg==
X-Forwarded-Encrypted: i=1; AJvYcCX3txo/2NsIGd/ZNUB0SGIYL7U/IrWRWlKgeoZHSwkI1O3/P0piuN43QhCHdd2IzhhISz0kYZ6FGBENVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx78+ovt6ocPigFH9AtlGVi9xmeanCaLX9+Ek8YbE5OfOgsWG1q
	xZO8J3TWR2YlTDYjZZy/+d1qFdV115XGw4fvTD2gjYu0YSByKzjYZLzWfccgbQ0=
X-Gm-Gg: ASbGnctC5c7ZQnx3xIxnsdc4az78zeMWx6Drlts1MGNJRXenftQJgwfEdHWboCD4ULP
	b0KspV5iVb6o60IuZpfOcyLb8Mg/bkcs0IpqFH5RBZfFFOxkLqe11Oo88ji03QlP2qSxCDXyvDy
	c6fbJbS4Yp+H+eK68hkkcXiqclxyLmr0yyKTwhmgy5BlJKz26/oTCIPI62DF72ET2SMv218HY+v
	8NPzK4ml3+q4ABJ9CdXaWA9jAY/lon0cIUWVsRKdxShnQUb6KMdzs/vX3WpU5KvB+Jp2a/TwXy5
	tetPkfdBCP3WgUbX2pvS3ayPPJJV2ly4oBC9UL5ICStI6ylojtPxdP55iA3EbYKDD6TGKwYCK0Z
	hTvKtVnAmNA==
X-Google-Smtp-Source: AGHT+IFtPc2WM6pnT8Dub9oo1Ivvz7Q5Lsd3aD5EmVGBQBZ7muWGL+w5LN7xlKXQLJlvsfQ0fc9dLw==
X-Received: by 2002:a05:6000:240b:b0:39c:13fd:ec44 with SMTP id ffacd0b85a97d-39c13fdedd2mr21687f8f.5.1743211613776;
        Fri, 28 Mar 2025 18:26:53 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm4264655f8f.94.2025.03.28.18.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 18:26:52 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 29 Mar 2025 01:26:50 +0000
Subject: [PATCH 1/2] media: MAINTAINERS: Switch from venus Reviewer to
 Maintainer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-1-0ec1007fde3c@linaro.org>
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
In-Reply-To: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

I'd like to volunteer my help in keeping venus maintained upstream.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..5ccddd2030efd96324e53fcee8048120990a85d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19592,7 +19592,7 @@ F:	drivers/usb/typec/tcpm/qcom/
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
 M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
-R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.49.0


