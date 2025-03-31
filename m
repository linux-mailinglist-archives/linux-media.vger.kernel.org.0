Return-Path: <linux-media+bounces-29035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87292A7618A
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06985168C9E
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C80D1DE4E7;
	Mon, 31 Mar 2025 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mmvqv5Zm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE1E1DD0F2
	for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409425; cv=none; b=ZvBPgSJa0syNl+gIDVI1UxrZqHsFWHKNjlnehig9Fg2/CRUfFo69Nya+Gm9SOQue1uUmMvUw3uXaBf4VDqvVNg7nFg46XF+ipxyOHHuX+fQRAdTEdgLtNKAgeSLCgybjYr6Pmvhj/zLO7uGntU49D9XOeRNaPzkwjWCGvdOAcTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409425; c=relaxed/simple;
	bh=ERwV/SnUIQ4OHPGNRv4Tp+NTvJ/Vyjhm4B9Sc83K5dE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B2PemZSj/bau71T7PTvqTLVi/ksd1LzEo55UlWYdp/fwmXgxz5cjMacGELoxGTvA+l2m1l4yKT5eVIJlXBbrRiGCBb5lo2a76J8YhDXg7QaHRC+7JMKUUawp0jyZjeq8d1oi+1wh78vit1WJx1c1C0b+peaZgxAMqSRD0HegF80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mmvqv5Zm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so41622585e9.3
        for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 01:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743409422; x=1744014222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK2g3FGZIjasAQ7VSmorolGoY5GKHH9MhFTld7ZjnJs=;
        b=Mmvqv5Zm+6prIa5/5c4NAYohHs7sZ43JWGVT+BMeFbttcsAHtlK+q8ywOZdS850k8m
         uJQMQPuOLNhGKPUtwfGjFegOWk9119gN3zc9tuF1JPbQUQYimN3+xQsfRRIGkZkAChfe
         8CRmChoSoVNOFNtYMcyeyC/9r7ee3j5MD9CCw6z+Mi4LkfxxrbBm1yEE42+JnoKyn3M9
         46YJTMULCMKlNqCnsPqOkydTYdftZD8cKVg9D7Qf1OT70andvUcK7ENZQCTzJzGj8uME
         n9VOttFSppcDOSQUfAiEaqH+FkIOoIqQBaKmAOdtVdrkBbvpBmBhe8GpTFMFvfzFczLG
         eukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409422; x=1744014222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QK2g3FGZIjasAQ7VSmorolGoY5GKHH9MhFTld7ZjnJs=;
        b=k995FGACHR//Qj/3QM7U8HNSDMzMOVKvp99o/pQsAcIE6jHeRnLLaNrzL7K3TsbgvZ
         dDRHMqYQ+v4YC/btEk5wd+X/l2+yDYZ9xEn84BnXVvWr1T39cS3bGtXFGMUGZPfLsygN
         H4bYm5VQOBbWzboDi/E04gTWqfyW4vrjWAqsqZuIMS+leGVMrXgrpJ0kkPi3Cuiy5MbP
         SZEyjola9v6YEv4rQzbZci7VSlK7soGFGBTKLgGFli2WNIFdGZ+0ZifD7+dKeBjnWgsA
         y3+XWFG2r0pN7sVTE9jbuly4A7xk00X8GfwCa4ONYLcrhWg/T/pkLFLpblD7zFbdg+eJ
         +v2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWveARQf6KYnFl39REIpxyGVbqOXsTM3sCHMDyU9vHmD+j/3KCnxYm/W+EcH7/m0WgE++XeXJ9L7VNWmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf71N05PGNdFRGFz6pYGs4t0HDjIvdAx18VYgZxxI2cJ4zKM/6
	ASvc76a2WcNBHV1HZv8m2p0/I7nEbutMmMOXfAsQ14Y6+L2RCmfb5FbklFIxAx0=
X-Gm-Gg: ASbGncuQvuVcIr2w1JFlRkUnN+2ECHo+/RCMihuW0sIYOWPqCLK25qbSp7zJ6HH31Fd
	qNfEKVaD4oaqeu/Mqkl8q/+UOAoRXM+qhpOSvamqkbKzA17CRzMvtQo460jcmPiS/cJGqbR3Skv
	Do3BE9kEotv0lIX7VR1enteYfbbeeZ8SV+VzZ7bi5tUXy6VOBaq72jZfSXP8TLQVXaHC1WWBea0
	PDT7n+g7yK4n3fuENftMrKnVyo7N9faCrXdo1ZMdAvJkMQy318LzJnHFqYbqdYdsDbVElgrxwFi
	Yt5mS1y0EgvUS79U9BxN8y9tnVf/jjQnK/KI/qrZsfCNmnWihBvL3uEmDezM+CY1Slhw6p7KxL9
	VW+Oli3JMjbdmsAhWsW0Z
X-Google-Smtp-Source: AGHT+IEISWKcgsRTpQ3Z0Z0qNZlwTz1sZpCHybyqtuv68X05X4q1wH/e/XIbVecbpVDX03fLTSyYhw==
X-Received: by 2002:a05:600c:34d3:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43db8526487mr85580955e9.30.1743409422187;
        Mon, 31 Mar 2025 01:23:42 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a8e0asm10520079f8f.101.2025.03.31.01.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:23:41 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 31 Mar 2025 09:23:34 +0100
Subject: [PATCH v2 1/2] media: MAINTAINERS: Switch from venus Reviewer to
 Maintainer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-1-036222fa383a@linaro.org>
References: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org>
In-Reply-To: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Stan has stepped back from active venus development as a result I'd like to
volunteer my help in keeping venus maintained upstream.

Many thanks to Stan for his hard work over the years from originating this
driver upstream to his many years of maintenance of it too.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..9571d042c7f4f7d3b0eb3e627f3b5ae20cf52e99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19590,9 +19590,8 @@ F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
 F:	drivers/usb/typec/tcpm/qcom/
 
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
-M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
-R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.49.0


