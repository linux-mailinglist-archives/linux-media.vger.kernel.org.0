Return-Path: <linux-media+bounces-41649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3DBB41A03
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 11:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E581683B28
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 09:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C6E2F49F0;
	Wed,  3 Sep 2025 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tBiY7K6I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481562F1FC0
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891697; cv=none; b=Q4D0hc3B9E24UZQEC0LmJkUe12osmKuECQchc/VsEuz4TdUj/b5c/teZl1lIRh2whDFvfBzB1dutbSj1HwdzW5NIsQf2HF9IiN1zGmPTGO4rI1VjtqSauUd71Frv3aM5c3seEciCqpxayUJ53fQIp+vQssZUroRoLCapAC1ziwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891697; c=relaxed/simple;
	bh=qKKSA6BQE9yHosLS//5MBxPP+lVnakPngtoSP4h66Nc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ECN9D9kKKzV9GZyKwJqtCUjhCY3WMywHazbeDsIua1w9d71KySAjHLFRCj2sMZJKsxLsW7iubNOVf+Km1ZvyvNavEp9JbmlkrFWnnAQaFo4uFWaiB4seQph/+tt1puNTyt45Z+lNqyKKAqIrSf9ZIpRcLvlf/mdm6Xry5uFs7sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tBiY7K6I; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b883aa405so30861025e9.2
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756891694; x=1757496494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZNErLUB5OL/PMLhd6A1jzaNLQ2AEV0NouRMBCYTl2M=;
        b=tBiY7K6IV0zTj7r9+SWarKDPgRPT/pbJ+pBtWX0WAqM9NPMVibbKHSQ0JK3lHJ9fM+
         yBRW5K46YgUJjP7RDauFZgSvONURupjJcQYqe3MBnNZGLJxxl1shJrpn56oqjfARXZFY
         gPPkl3NhaLrfOoPpawQVyfsvz1yzXsqEmNTa3kd28zU1jay2i6j0iIfb3pldeDuuScx/
         4VlIQhQq2dXnNfbvLsy1mttAyH2WVb+eFiKeuL8XPlXIcYHD0mjmJSC7L3B6lDwhtKfG
         9wwGsDh2jygZMg5q4PNRvAW3JTiqXho6wJ5dWGf1MBYQm9m6DqBeC+tX5r/I23678eNH
         5Gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891695; x=1757496495;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OZNErLUB5OL/PMLhd6A1jzaNLQ2AEV0NouRMBCYTl2M=;
        b=iG1V61EI4nbAWoDreo8yKMPZQBOHd5rM3zGdRxY/PhUBagyetv86bNS1f0cmNHH1oI
         XUfHPf0FaXON65zhoEwfj/G4b32c0vmJQmOmFesH68YMbfMVnYh19n9O5C3w44ZiEeDD
         zupoCECeFZdy/Xbag6ZIpR3ZaajPXrNj1t4CaC6oF8eOTFzEejj72gy9nugqxktFD+h+
         ISwkZNAj104pbp2IgkV+yJCmqUS9U2rUSvh/kZq8TuEK7ErBwd8zkRYrKBjOSSqVAOga
         9HM0uRuUjp/6OyIsI7pnTWflN1dvL+vOS4ocV1slLYYAlVe5FeOoRVOYmAN0VtP8PobV
         kn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkHeoJMWJ7SNTatDgs98NBMZ8tReeOvwEZr8zMm3W1CfHBT77NBe4XsIu24OtPHaUZyS6D4PqSrtXohA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiLtwLuib7UpQszsP2EoAPKkEUjCI+oxf2pchO4rHF3C4xq0ew
	8+aDSuyQjjRWJGZlk1bHHcOLL0p65VLEywQykcqffImSazlp0AEF38dAYNwyuptd6thzwnM3Rb4
	Su5SDU5/a9A==
X-Google-Smtp-Source: AGHT+IFnWh841cOnAh3nRAM8eplxLxhfI2ZySq8PueqPfpVd5Li2djuTOGDmJgDPyjn9FbOfO4yL0Zt772wk
X-Received: from wmsr6.prod.google.com ([2002:a05:600c:8b06:b0:45b:7a6f:5dc0])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b41:b0:45b:7be1:be1f
 with SMTP id 5b1f17b1804b1-45b8557d72amr108441325e9.32.1756891694453; Wed, 03
 Sep 2025 02:28:14 -0700 (PDT)
Date: Wed,  3 Sep 2025 09:27:54 +0000
In-Reply-To: <20250903092754.2751556-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250903092754.2751556-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250903092754.2751556-3-abarnas@google.com>
Subject: [RFC PATCH v2 2/2] staging: media: atomisp: Simplify logic in vmem.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add inline helper and simplify logic for subword operations in
pci/hive_isp_css_common/host/vmem.c.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/vmem.c    | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vme=
m.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index a3fe03216389..f11b0448ed83 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -15,18 +15,23 @@
=20
 /* Copied from SDK: sim_semantics.c */
=20
+static inline unsigned long long subword_bitmask(unsigned int start, unsig=
ned int end)
+{
+	return GENMASK_ULL(end - 1, 0) & ~(GENMASK_ULL(start, 0) >> 1);
+}
+
 /* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[000000=
00xxxx]LSB */
 static inline unsigned long long
 subword(unsigned long long w, unsigned int start, unsigned int end)
 {
-	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
+	return (w & GENMASK_ULL(end - 1, 0)) >> start;
 }
=20
 /* clears subword bits like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx=
]LSB */
 static inline unsigned long long
 clear_subword(unsigned long long w, unsigned int start, unsigned int end)
 {
-	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1)=
);
+	return w & ~subword_bitmask(start, end);
 }
=20
 #define uedge_bits (8 * sizeof(unsigned long long))
--=20
2.51.0.355.g5224444f11-goog


