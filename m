Return-Path: <linux-media+bounces-29226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD194A78E5B
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 14:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3F763B67B6
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 12:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC4123A98F;
	Wed,  2 Apr 2025 12:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sGYF0GSe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD8A2356AB
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596660; cv=none; b=RsZcd2Qoe5lylIXZhWZrcWaDL+hzuHr2nSXx927rSTrvYi/RmUsYXVDEK3fh44bqmlW0CNwQmK/pVmjxPZm7nyxyIfCLAqJq/hzRWJw11ypYbXSnWJY96pII00Q9a7YqrvNGu7nfnGqNuEd6E20NXd5BIeno4dzJkRViQGFRbWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596660; c=relaxed/simple;
	bh=0v2URiG8esdkRgUTyd3SngcEHuSOj0Zafp4N84xHkg4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hOG1TXg2a++OkFnk/5qKZ28EReqAHQ47Zs1ndAwZz6/iHo5umK8Hd6FcRxLhtvQqmOkmq5ITZqAfGEvaPLYb4WdF5Hsabq2d0uud2cicOqHao/0+oKLrYoMQu3s3xofPGT1kPyRTN/btSgxdxKPy9DFxQ9NuGVbBUebEw3pfV/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sGYF0GSe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe574976so46236645e9.1
        for <linux-media@vger.kernel.org>; Wed, 02 Apr 2025 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743596657; x=1744201457; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztK8X1ZBqwTpCQZgzQx75WiIn9I1zX9gTe47p5OjGL8=;
        b=sGYF0GSeNVXXFwNIelq2JcE7p2k9EUARs3S/FzjucEFbRNJDZO+iNusSH6DpNHfUYh
         7Oci/JxglJ/EjAVKagJ1msMF51SxzoM93l9mXOMhlnUDiFOdCVzy2DLbj4tE/zcbe2HU
         5ucqlbzBTmsjUxxIe2eFF6r8A7xIExAr4unP03Uy1Ja9pETHp5Scl4MQaXAFMDz8ww7Z
         pUd1SHOL1rRIB4B1IJK5Jw1DlPP7Qz0DbVEnfrf0bwPixpLK/8Q0RTWyDYTvkrJKHTCW
         SFgHqqiphChv/gBlnTfueNWEB6F4AGrp3qDH6ElaLsaaNyyrqdpLoU4zt2vRgQ3ylyrD
         JuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596657; x=1744201457;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztK8X1ZBqwTpCQZgzQx75WiIn9I1zX9gTe47p5OjGL8=;
        b=WGNQMOw8vAEviSaV6K3wGIfADfIJbHPhOhwZ53tBZFBR6P6GBWRLY2b9X/73FGXOmg
         rkpDnH0rwBP2a922KvwTx0UueJlCDYY4q6kRCpp1JXKM9fmeGjBuTRgM8y/kZkBqYj+p
         jpT0/VtA16gDEutBGRSMqyAZz7wjkioqprW93gm04AqOff8OqXLel33Q3I8FewSQ2ca+
         yFVugaZGJnEkb1nRLbgrSYO4JCM+OfgKlgrb0QX/+6vsm15idPjEq9Y+v4qq5HHhnPQK
         cxRT5x+iJ0MNfyGPB3PeJHg62JcuGeT7Fm4c2MueisEwL4cdJCmctjXsDDfdXf1Ln6jR
         nssQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh5Gv4Uo9xBxXSD05OaPJQe0q5UycFK3WWSYs31RNau+wLLNT0Um+kGPVut6dgw3bCzE11dKhEhVpH5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YynK/TVsDNINfUzAec4hggeZIC5gV5LIDs+8HBmlmGx+EdFjrgV
	kKKo9gz7fX+GldzeCSUlVqpjADaWgp8QJtbMTpRexsHfaw2Tey1uXQ0B4yFRyK4=
X-Gm-Gg: ASbGncsv/mm9gcK38fvELBbd6VSWwTNJfWeGJg30nL9uW3JlTKb0rTckuXh8wXdxKKy
	Axwt07pOYqXre4NQzP0LALppOxzcrLr+wZM1QWBh1Zca7LgSa5BclRF/y+g0pAse5rQhl6ptzqQ
	MpOGSWoC1U6fHVpUIdvOygS0oJUxw+P/VjeLvBqoxDqhQ3M+YkMAuY0otD2LsQecqYZbo3Abd2a
	J55poZ580NvgqLWi/xufs6fCaV1Niu8SvOYiVqWCjy5lUoXUdGpYOPcoKsQNnpnTbfjnVf9jmDt
	tOIVe6elAHuC0lSYDvFo0EgPC1C5CuPdqjWQ6Xhox5zNSh+GLtWuWeuRWpqbIVVqo3w/o49rSiB
	pWXU0qRi+5aLaxHdxYzdb
X-Google-Smtp-Source: AGHT+IF40EzUUmGVd0zd7rqUsdkDiAiIczPUOCxpw6qKHK2XBj0/TDqOPqbFk3OkguXZaFpVMQXW9A==
X-Received: by 2002:a05:600c:450a:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-43ea7cdfdf8mr50511585e9.29.1743596656675;
        Wed, 02 Apr 2025 05:24:16 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60ccc66sm19418675e9.24.2025.04.02.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:24:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/2] media: MAINTAINERS: Update venus/iris reviewers and
 maintainers list
Date: Wed, 02 Apr 2025 13:24:13 +0100
Message-Id: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0s7WcC/6XOPQ7CMAwF4KugzBilNv8T90AMaeq2lmiCkhKBq
 t6dhAlWGCz5vcGfJxU5CEd1XEwqcJIo3uVAy4WyvXEdgzQ5K9S40YQHqNeAG9AEeR+4EQPWD4O
 MI4cIid09ggSJMBhxY55Sc017Xh8au93VKl++BW7l8VbPl5x7iaMPz/cTqSrtf16qQINmW2m9a
 xsme7qKM8GvfOhUARN+IFT9hmBBaIuIraE9mS9knucX4+8NGlwBAAA=
X-Change-ID: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

V3:
- Was: Add myself into venus/iris to maintain/review
- I'll be helping to pickup patches for camss, venus and iris so
  +R to make sure checkpatch.pl includes me.
- +M Dikshita as she is an expert in this area.
- Link to v2: https://lore.kernel.org/r/20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org

V2:
- Remove Stan from venus +M per his indication he can't continue
  due to lack of appropriate test hardware.
- Apply trailers from Neil on patch #2
- Link to v1: https://lore.kernel.org/r/20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org

V1:
I'd like to help out getting patches reviewed and merged for both of these
drivers.

+M for venus
+R for iris

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      media: MAINTAINERS: Amend venus Maintainers and Reviewers
      media: MAINTAINERS: Add myself to iris Reviewers

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


