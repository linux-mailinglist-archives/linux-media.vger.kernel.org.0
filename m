Return-Path: <linux-media+bounces-24638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 577E3A0A27A
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 10:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31BD37A2F3D
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 09:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797E9190068;
	Sat, 11 Jan 2025 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OuMYyroZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B78A18E03A
	for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589326; cv=none; b=PdfhqzDo1xHBdFFOOk31W1+wYRE/rVvlRrIcUu5ps+cv3b5WxuidSQIuSxIkYQPncYlYJpCsVqbl0B8+4RSIzJ7CgS/m3saqsAdRMlN80XULDsN8bjVW1p3i2D8XaviGCUryn863AcQV1UkFmcl3gxGei6N0onJ/QKHaCTTTMlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589326; c=relaxed/simple;
	bh=cJ3Ao2R6zgoGJgyibADb5EAE6IKBeo/pElOZjlQDp0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FclKEBgsWfd+yPd6h46IdyPf0ce4X9w0v5AYWEojp144qWjJfTyOsvuYOTNdQObFf2nnRO/3dFVFVVdDVzbOWJue1oYz5o+AtljrWS/EYCAxppm0MDqb8K4R+10JDpjUpuqmJAj7fFqn3BzAxBmxus6jcjVeAIwRJQMU7Tjr5sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OuMYyroZ; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6dfbc45355bso2023126d6.2
        for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 01:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736589324; x=1737194124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52iWgPg8zx+q33hKer1CkCPQAZHddOV8vj+q0ZyeQAY=;
        b=OuMYyroZ54iH3H6THbYRxENeEoSEm6U9dF9xpWxmLlRUSPh2Ze2UF+ZOeCuX+s/OKM
         wnDnthyOIuTqks1c+0lB8q7kVXqGtBxV2xi8rJMwDWMTZd+T9KBlxHodSFZuIlK+g83u
         A1KZ1Mz1rf1NnH+dkinadBwAmyVmx7LRXFlbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736589324; x=1737194124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52iWgPg8zx+q33hKer1CkCPQAZHddOV8vj+q0ZyeQAY=;
        b=N4gp7O8//6JXc50tOYA1nAXxJNrn6XELbqBVU32Rua/w+ScDM9HN21QfrgFtmt5ASZ
         B5II8h0JFwRGpCR+wCY9WlWfKgbHhvsWmUt3LdAryMrRfvZ8lY3tkpqhJWzCG+GL/Ie7
         ZniNM31uqLK9hhPCUmAlX6yxBOA0Gzfr8Ikq2dhCOyWFtfSTp039SC4k0pRvZ6tIG70u
         PYOdLoX9mLpUe5Qb/MmheGMS7PMEms2QFbKCkVzPQC7VqH8KTFNeP0Z3qshRvTa09u/y
         bhRC3mz9FeUlexMDKfWUuMgrOVjvDtMq/p4lXqbbs/ll81n2/5gHTVPmq/8zIY0YCRtj
         8acA==
X-Gm-Message-State: AOJu0YzA2NaCo+k2/bsDwnF1wW7vFawJfyDkWauMRwHMFlIAxWYT0GTT
	NGy9ByKroFEDYparY0AMFrAV6+XLRheWedq/mfwasncyKiiRk0FgH8rhHzsnfDwxg8rJDpbTrG0
	QaA==
X-Gm-Gg: ASbGnctmTYa4Oi4vtYpoafxVoiFCBx9SG4STubOIq928EH03m13IzloJewUBrfFMRSC
	PrZ5TacgeftHMGe415hTtvNTCCP64JMMB46GeeVERJUKhduUIhUldggxrkUVYFfmDv9eOJNF9E/
	LY1Chkt5XJAHKgWknFoQSHLkcqlAEs/7bhe8cwLNCSdNAcdYFWeifIzYxge9hWyfsh3grizW3SG
	+siLj3x0/9E2Avt4/0yv6x9XSDGxlys/HAjv/sf9V+4W8ccqsg6SzumdrNl3eVFAAxvOORB8sS0
	4/yUchkYY2Ize+dQYhckrh2ji72T8ykeDw74
X-Google-Smtp-Source: AGHT+IFqiGK2VIMRcFvBZ2YyjvHmdtNauhF62df7aKlMfYRbakz7XnEj9n0FSoSywyG9ImyL+3sm3w==
X-Received: by 2002:a05:6214:2a8f:b0:6d8:8e16:7c29 with SMTP id 6a1803df08f44-6df9b2383f5mr216932866d6.14.1736589324231;
        Sat, 11 Jan 2025 01:55:24 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce327b8besm267096785a.59.2025.01.11.01.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 01:55:23 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 11 Jan 2025 09:55:14 +0000
Subject: [PATCH v6 1/6] media: dvb-frontends: tda10048: Make the range of z
 explicit.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-fix-cocci-v6-1-1aa7842006cc@chromium.org>
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
In-Reply-To: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Kosta Stefanov <costa.stephanoff@gmail.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The datasheet recommends 55MHz frequency sampling, with a max of 69 MHz.
(Kudos to Kosta Stefanov for the calculations).

Replace z with a 32 bit uint, and make the range of the variable
explicit.

Found by cocci:
drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Kosta Stefanov <costa.stephanoff@gmail.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda10048.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
index 3e725cdcc66b..1f87eb0dcf2a 100644
--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 			     u32 bw)
 {
 	struct tda10048_state *state = fe->demodulator_priv;
-	u64 t, z;
+	u64 t;
+	u32 z;
 
 	dprintk(1, "%s()\n", __func__);
 
@@ -341,6 +342,11 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
 	/* t *= 2147483648 on 32bit platforms */
 	t *= (2048 * 1024);
 	t *= 1024;
+
+	/*
+	 * Sample frequency is typically 55 MHz, with a theoretical maximum of
+	 * 69 MHz. With a 32 bit z we have enough accuracy for up to 613 MHz.
+	 */
 	z = 7 * sample_freq_hz;
 	do_div(t, z);
 	t += 5;

-- 
2.47.1.613.gc27f4b7a9f-goog


