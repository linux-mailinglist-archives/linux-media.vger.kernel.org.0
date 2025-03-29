Return-Path: <linux-media+bounces-28966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F28A753D8
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 02:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6A1F3B3579
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 01:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151C08821;
	Sat, 29 Mar 2025 01:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ekTOO4iG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FFC79C0
	for <linux-media@vger.kernel.org>; Sat, 29 Mar 2025 01:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743211615; cv=none; b=Wu2hNVioApvrR2ZdAKOjvyOgfyfNvcvSda/5yxlRFfTf9ltBelUP+GwVdpscM9H9YvbdCfss97+o0exGjy5VPVXYvVHfawfiAHbKnTBD/caS4U74qdxP8A5/cBdh1s7rlEU4REpnHi7NCvyRD3IwFfo7V3iJMW68x1K1CX4x6n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743211615; c=relaxed/simple;
	bh=ieo3v3eB0Q3Vd8qHSezVD4mOnD8BGH4gMrjlTPEOOWA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=SGssrcaW06LvQFDNSjcCwH5C0CEtM1jf0dHI5HyoPs8fpwFOeuzj8sYUowxlZCT/nLm6S+VCZUoNsF+AaXlOkOWu6M9dSru548A1QBWFlteM/BHch6zrBsR1eaXjUFUeVd4oTayw0USP4Bzt08D9oOCPBEfq6cIJH/tueoQs1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ekTOO4iG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so1467731f8f.0
        for <linux-media@vger.kernel.org>; Fri, 28 Mar 2025 18:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743211612; x=1743816412; darn=vger.kernel.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3qGhnuDainIiSGsnAJ33rQSgGHUL64MysGlQKWygUU=;
        b=ekTOO4iGHIY9n6RbogazejacyBhs3WT8xEMUSvxTKow1CbTN/aG0eMi/ccNE1mi1kQ
         OkwP/q+N4Wzdv0gObmIgoGW/RwQlZZH8tSpqG9pQltEyDdIzgVZUZGA/gCEiuXOMhNFm
         U0zfT72QPqd2saBKAKpoealSQEu4nZg9EYL6db+JbGwibxzuYETVwCPf2vtxLtXKhAC/
         CgeN5elnspGQkPJFKZs46A5Tdq9CYT7zcrFbRbCH8zEkNTijcy6fBiK+X8iR+j0wA7/S
         x9vIiT7P7FUu6vBp5Dy/GyTXi0W8eYeCZ16wptxQ1wQpy8GzyTKOJhqSr6IO7BjCMWhi
         ffNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743211612; x=1743816412;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3qGhnuDainIiSGsnAJ33rQSgGHUL64MysGlQKWygUU=;
        b=Y1S0IAzJiAgGh+mHbMhLg2PNOTucDxtBP7SjAOUQxW6IKdE5oZh5mpGW2DerkzagX6
         7QaIH5rxbJQaezavsDgYKJ4TZzDJL/1yQNe73T1FDpFL1nfNyD7fNsTELy8XBfNyy/tW
         dZIqmp+Nhll1UFoN3SBvCgwgACoCssLyuR13V2979AfH9Pc0jLbQ1ApMMHGSYxm/HO0Y
         +t544RW682StarXJlT1FTNf6Ydo9GiZ0udNaVl3noEHSS6fpkkcAOja/sFq8wTSBhElP
         U65MADMAyqKqm7jOSJB6eWoVRAAT3E0fvtshil8/ofqLJ+dI10mmaxju+HOZU27HA+vw
         WfGg==
X-Forwarded-Encrypted: i=1; AJvYcCWSGGThVmyytfJOKrjCzh5YNxDfIPWtWtWzxL627LDDIJszgsGJ5KEzz9BsF1HzQxsTyIpkvE5Y3LY75A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgxWArHxiEo7VwKpvMlqCbxErrmVIsVuOxZR8PImjCLfnLUKux
	9rdbkWMoKnTY93RX/qSsor2iUjC219iOQ7gkg6Ra3tU7nmJN7wyoTVDstEuiJWE=
X-Gm-Gg: ASbGncvJRCh6nIMq7AdRAQjxyAsRDB/ziTGvA/gTYU8QNctNRJDyUjIs+remWpcR1ce
	rAWp1kqi9r9RY95YE9bK+E0fcBdOd7kazScRqqxRBpBO2Bxf8I1lxPFoLZd2E+UiDyrg6fetkpS
	oOaDzSuSereCliLXm0wQwCumNyfTzta1qqzNCWD5RezGOOwQBdeTiN5rkLRrP2t0uJW0I1GJZ+U
	GR13hzjOzgGfRgc+nRj1rFFWLgPbXTnk25RCsh5mgAXc5RV0z1DQ29jwCj0Uik0OQM415ufpAoY
	lyPC0FdWWkPZzxP6ti/vbFDfnTf/dl+LdnomtntRXvIQYnVJL9xzVHJrNNh2xr1hxY2kjpDimuj
	UIr8m07RDifo7rTcpNt7v
X-Google-Smtp-Source: AGHT+IGTHkSX5Lsugh5eM7Cu6CGWHlhiuVXW/CQFpV4/rGcYQLEZya9631aVHT9jxzBaZCaGHcBp/w==
X-Received: by 2002:a05:6000:400b:b0:39c:dfb:9e8e with SMTP id ffacd0b85a97d-39c120c7cc3mr845271f8f.8.1743211611742;
        Fri, 28 Mar 2025 18:26:51 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm4264655f8f.94.2025.03.28.18.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 18:26:51 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] media: MAINTAINERS: Add myself into venus/iris to
 maintain/review
Date: Sat, 29 Mar 2025 01:26:49 +0000
Message-Id: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFlM52cC/x2NSw7CMAxEr1J5jaWQtEC5SsUiHwNeJEV2qCpVv
 XsDi5HmvcXMBkrCpHDvNhBaWHkuDc6nDuLblxchp8ZgjR2MsyOGHu2AxmHrmRJ7jHPOXCuJ4kL
 lq8jCitlzqS0/TcHdqB9TvFwDtOWP0JPX/+v02PcDoz51poUAAAA=
X-Change-ID: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

I'd like to help out getting patches reviewed and merged for both of these
drivers.

+M for venus
+R for iris

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      media: MAINTAINERS: Switch from venus Reviewer to Maintainer
      media: MAINTAINERS: Add myself to iris Reviewers

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


