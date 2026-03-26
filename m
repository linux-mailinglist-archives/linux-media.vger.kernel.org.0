Return-Path: <linux-media+bounces-57106-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DfCLUeMxGn50AQAu9opvQ
	(envelope-from <linux-media+bounces-57106-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:30:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD3B32DE38
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C39230730B3
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 01:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5897337C106;
	Thu, 26 Mar 2026 01:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WmVPmPML"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E528E37C111
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488491; cv=none; b=VKtlGoAmXaCgXZOXVSC4zR9WeQuc5G6f27iGWzsPS2hTeEjZA32hYMbsVArjd8uj0+Buhb0qbGAJapGIhcL2+GFlOGuyIiMOQzSIUSInfokBTMTmGAvZv+A5YlZFWt2w+lRzl/LVMfHNrxhnr7VnDPFPDhlAJAFQfmlkHoG5s1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488491; c=relaxed/simple;
	bh=RysHVq0N4+YzTb4e9cFYCnf19hquCbv9aui7fBhcLT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYTWmUUVL2lkDVNa/76YwvZwQ6yujRObD5MuaMYiZUTXKpMnISs1uE1ltzjIunDkPAdOj3z72qK5BVMGYXbzGZzKCh/eI2u/tF4351by+8dzrXT0fBiTtOQXwvNp+sJvzR3VRhGzulvzugyx4AhObh3P63ZN4PyDS+xFKlVe9VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WmVPmPML; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so355730f8f.1
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 18:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488488; x=1775093288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqJm1xZwLehDeiB9ZhDe2YZdoSqbYfjYIEA7QeOvbXQ=;
        b=WmVPmPMLg5cHLA8iedgfnYlvZlnh/EKxSoE/DD0UeeIjOpsf7893oZTwou3ltuyVdq
         TRhHyZDASKyCL6Dk8bHs5tNHImjs0tNstchbNlcnHlPBkri+mpsB7yTYhftiI3Hy0lb7
         YOHzBqZsH0DoiGw2xQAoBhGUGLNlxRPNmIGIG+TUI3Rpog4xNwqIWJQmCEOPIQJ0x02s
         G6F4zUlTnwd/PenIRi120yhYAvmQrA06l0XKPH3s36fR0m0zztEX8TuixjL0MerjGCv8
         PiGcvnJcH+aFzkxMHim9gPhYeHgYhUkMT4Eo513QRs2IuJaJKA4rL6vkqtmyZngv6h/p
         zYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488488; x=1775093288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqJm1xZwLehDeiB9ZhDe2YZdoSqbYfjYIEA7QeOvbXQ=;
        b=r0u2zzMk2yrYf/Kd9QdwsA0ArBbQojjOMMEWsp2Ecoti+7Iwb538TBz+6DpbygX/ir
         p2Ey/2S6wc4/hCyZeIIr3S/0k+8+wMwxVCIpmXqyf2MyCdmpS0pUfXp6Gww/CmHEsbyv
         1FZnKCNuoO8e8RN6GTTTOey41vujD8ROeACZJOTC3Gt5C2z/VUlVZPJAFUwkXK6sqQ8J
         hVNvn73Ay5miqx0Jpr+RojemyNz4dM4sTn75HXtMMpc6gR8aK4M5f64J0KR0M0N0TgzE
         YC4vL3Prt4owa30CgmJlzNm1wEWt67ELsxMkGyOszGtz3I/vgfcNQ9BBtDKb3HWD2y4b
         prlg==
X-Forwarded-Encrypted: i=1; AJvYcCV/T+GZxxzcbvx9+tYqug7RTZSyhogbWMsC4Qm2f1sEQgbHICdf1U1kCq2qYf4PhBKKLt9+V1kx5GWMeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKRMcdptiFQvFiyBX2TFDwB0gS26XMBttTmhpXwqTVsCbgOBCz
	qU0Xps5tdBac5LXlEjdvBOnCAjI1mON70wM+yCFOuMKdnovQyhJVy9nh6uTnnFpTVC8=
X-Gm-Gg: ATEYQzzgFyk1+xhgXOIjqEQYRA++J3bMZThI7owfZzV5Zbb6sHHfk7XxOXvWata0k+p
	cd++ESwd102HwmLjpFw9RAHF3BaU3ZZ9oeofBFHPiCCLacLwZVm+B2DgXjrWsqLCVxgQomIoOrv
	WfJ3s7wmvQ9kBCeGt5ijgSZsABpLs3FGywTQMm2aZOYiLC1KIGGiVs68K/VDFCz59KnfosH4tFr
	meR+BmgLrSRJcWY5qwycA3iPn77ZRLlPuUV1X0AdhdVzrhASAdWZLNZZIxMxjkOpxoriQJRLZRF
	36Bd1JspDYMItgXdKXQQOVqj9BsZQDatwesI6dKW5FPRZyTNU77PKDVT6uyovRD+7tc7Hk6hSyR
	vfd2ZYp3Vt+x5WJ0Il/yvT+MwQPlij45+Gt67gHPAp8HfedeF+iAO+fMfU8B4vZdM9YnEgUV8YL
	gUxkgmyXwvmuMDlbK4npDTZ9iZuN4/pP1Fisg=
X-Received: by 2002:a05:6000:2890:b0:43b:4625:5933 with SMTP id ffacd0b85a97d-43b88a88baamr8337146f8f.30.1774488488352;
        Wed, 25 Mar 2026 18:28:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:32 +0000
Subject: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=RysHVq0N4+YzTb4e9cFYCnf19hquCbv9aui7fBhcLT4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIu/++z8oXlchbJP/1M16TqvlqfGF301jKf2r
 tvWAN5KfSmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLvwAKCRAicTuzoY3I
 OvDmD/9IeYsBBB79Uzcq2AiGxUn5frbN2yao4rM5EyI5w/zdWIwI8vVhpwVrKUTRnPJ1DrvcovQ
 fb6EwO+HedpbY8CYcPjKLFWRNxM8B9CymD0RJh/GyNimakpmkqsK/ZzjRW0qJyHLMwxzVcKBQgZ
 6STIheHOVMYoCqmuMWC5Q0yDrkia1uCszfyaARyX1V/ZNDwBQ8qX/bcl/g5hxuG+k8VQVzlVNhV
 NOH0xS6kyAALaVifjCjL8z/A8491mvPf4ml//sVj10+4pHu5QrkcQwIRXOvbJHmIjkyz+dGDkX/
 cyjqEiqPQK45U+k7Qwnn2ZwKVfkxiEvvmojLvfQECfFh49JvyPXTo6JvyYlKZ8o/6COYLD2IXAq
 /1uOuMxz/5YTuuZcL/G2jvgkAJl+dVSe+t61zL6HrtGp9dRxdA1/bjwuZ4YKjcI5pVBT8dINs86
 tPjzP5qu8CQWrvgpuuTOf9PGwr0KTMeBILGjMGsYhgI4Rf0+N5OZhoh70uXgU8V+ykJl6eDcTIO
 WH37pYR2LCzoLFH4pKeJmXT7umNMkx9tK009I5PkmZNwM+EhJuaOJQdoISyrEqSBfXhzFdYwdHC
 k7snsqE0XnDaEXLa0ZmLyJeJBkmf8NsFfsTzfwNZi+0N/5N+eoLzp8NVTv/fK9kAhf7NtD1cAHX
 dzKtZJFOLXIw6Jg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57106-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 3BD3B32DE38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use devm_of_platform_populate() to populate subs in the tree.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd8..66ea057291f6d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);

-- 
2.52.0


