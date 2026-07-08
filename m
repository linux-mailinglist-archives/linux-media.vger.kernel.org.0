Return-Path: <linux-media+bounces-66932-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nR0MItCUTWrw2QEAu9opvQ
	(envelope-from <linux-media+bounces-66932-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:07:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 869737208A9
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:07:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="D1EPHvZ/";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66932-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66932-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 347FF300609C
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 00:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EFF1E7660;
	Wed,  8 Jul 2026 00:07:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E4517B50A
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 00:07:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469235; cv=none; b=DKUSDRQWIsQobd5GeqWvKJJYJspzBZNDH71CS2jpOglM9L3l1iOR+wgOGbv5U9ualb6oANNddKnTiYIKL5G2KKGr/LQG66DS2vWNc4m9Y4HWEiAMMciiIH/UH6V4n+Y+lTgn54Ddo1GGollVt1fxrh8ftWT5Jve2jsOep3OuW2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469235; c=relaxed/simple;
	bh=Fey+/W+7XCC5DReENEFX73Y8A6XquPC4dmr4ORGlTRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eb2x/7U8uykPFuzLD6HQCCPD0WHmHMfd/TjNolhIDaPLjFOUzfqUC8/oIXlqqOe+qgD3KBdslRVF+69rXbF0WwMyAPEsfUK6IuOBVHKwYBwSSe2mazH3ODl/uz01fLO+ebbIxZ+fA+6NTpBAPHk6mvky3JYBluxqBkv3UmlFeTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1EPHvZ/; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-46ed4f66256so76397f8f.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469231; x=1784074031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zd+inJitFkSMF/haZOvtCKkE6zMXknRWkzEpnLBObRI=;
        b=D1EPHvZ/NT/AMVFYpcNh+7Je57VtpKVVQ/8q5qOR2McxQuClL1ddOXB3LT6DuziCil
         o5To30SJO6kn1O7xnaP5I0IkyUtzPtiVIG0G97+gz89QwL23b+y9h1lXihtz1Fa0R6zo
         2F7wIWoYTyeqHOpPna7dChH00vIA6pa4xQ2lRNXI6fgp/6yz647I4AgckGOfm6BsbRMv
         55pegILgzWTpkLMNtcYhOJIit/NfI07a4UaTs71bwvXl5tFLR3b9CN+fgUA3EUpj9Wfv
         9UlFQ9tdlf/5/qL4IFHzKUcYn7C8agvUDOZY3RdciWOdbjOO0+etkoICXcCimCGqOQGD
         JUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469231; x=1784074031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zd+inJitFkSMF/haZOvtCKkE6zMXknRWkzEpnLBObRI=;
        b=BEct8TXLn6jppJylgrfZcMB1+QqdE00ZCv9tKpuwNOMUMYCiISFL17hfNcpl8S5fhP
         3uBKlyz/KilhYxZbVv7MHkGiwQA33EJLFLK5EJfnhUR9HjAUZxdtOsJpiIyLbScNW3NB
         2k7qoPPo/ah0Z6Ns7HtStZ4nGsGGD7Ig41fCSFmpXwiXV5NvqISOGBQ2ZrldwhHLvVEK
         jMB8x47rfibtbT3aC2uZMi+2UggYdGyV1nbgtAYggvP5EZzJaWsZPRHpchugi1rNScma
         yllgbwSS2UDK0Nu+tnuIscgVurn3VvIevwdPci3IuDDSxUQYGeQPwP+uCuQhroxaWmkO
         F2Fw==
X-Forwarded-Encrypted: i=1; AHgh+RoUtuhP3Fk0Y9taxUGjZteMR0L652H1dJUzZsUwG912Ne/kenAEUzcMl4z5HWEx8kDCKnQma24HhtqrMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKqJU3OPPYzMcY6UE6j/NHUrN6cLSybGMV5Y97Rnq0Amz7mf1B
	+tC6GbClpdHWCWglgOgMv9lYMMuIdNHntCMRSsFO14tAzaPj29t1CuixPrtMH1fuEsE=
X-Gm-Gg: AfdE7cn8nxEJ22YP+6YlYGMv2TgagxmGr/tki1GgNTbRdUA3mjstMULcs9v/tU0LcgO
	6zDOlXKGYKVvbnBpnh8/uDnQILzcIrnHc2YbHzj/ncYmmuT0QrrsvButZVIZ3TE2Q65CkMy6X1Y
	DpL9N/+MnUvRkY8UvPuC9OdDmojdPx45ib7fNvrXdqNsD1RPak4hiWlnRK6HoEYBxYJ3YG2VlKh
	WEYhvS7+Y9xXcsEXQL9T67J0JX8DnOApIifMMz/Atrpu2/CaJiveOwQ8E/d7HK1P/cnCNtuiuu8
	PnDWLik6eu3ASEd1WnJ88bLcvEPfHeyfYviiUaEd2kyvUv47jRjq+cN4zQPgK0iBJu4jQ+AWwZX
	OfJO+FX0uYNJbBj4OlWzUzTiywsuLaYmnIgtBWcv+iZaLsxRkDjNPGY8EvgX4QvUYkg5VfsEqk4
	V1Y1fPF7IhR8+XhiiiE3GZSwI=
X-Received: by 2002:a5d:4a0f:0:b0:473:b32:ff28 with SMTP id ffacd0b85a97d-47de6644b7dmr6101950f8f.34.1783469230847;
        Tue, 07 Jul 2026 17:07:10 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:10 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:06:57 +0100
Subject: [PATCH v12 3/6] media: qcom: camss: Add support to populate
 sub-devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-3-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Fey+/W+7XCC5DReENEFX73Y8A6XquPC4dmr4ORGlTRM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSnIwO7RDbt7xUzJzUmsuvZjlPXVORNHmcV/
 zBgF1OqeC6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UpwAKCRAicTuzoY3I
 OrzMD/4xiHaBTiPb4JG2qSnj5fgWTIEt3ZtLDoRh/CetULjYEQPLBH5hsjsfk0e6btpOXPrQxp3
 lnKGaVXA+2mq8K4G0uRkw8vv65xIN+qqvYbdMiwYsgTdH8ummxk8W4tvRuCYlW8MPhTNaXpHpIf
 Kk528bQGZr8aGYGlIn8cFXAALnoKlBwBB5NvgsgTlL3xn8CCBzW26hrjQE+a3yciLmx/B7XC/RX
 7NdLCcibOfTP0tnhMD7WYFTZsdVbK6vsrxTI86U7pIkf4YM23VIs57WNxflt9wKBZJeELByfKia
 7GpVNmHaoYG9UlNtf2dFS2mWbxEDgtG2uWX9HnDMQrsFaFn6hXkbx/FZ8qCzJWLwR1GadAOIgJC
 Vy3EjC3uqOz9p0aqRyMd63fTspTR72mo3ok5HjNercfM9UabdbvWeznuY6O3ot4EgVNpi60FzLd
 +4N1cBTSxEDQw4LC4lF1XFWmkjpNs7OlrNg/mVVZTtDnZ1xUHnrnTyLf43rP3lB/JFxSjyqe4Ub
 b0yrfEQBF2e5nntp5pEGHj9ffr27htrWuYqTHrb+7ADbxz8YccYlSWbaz8OBeYarxJFb1wz2duF
 MevatqeiXXLujqmn07kLIv9ATDKUf1zH7TqNwjNwCfUCv/vXD8B5TVImtiXHeTOEk+3DkFjhAlx
 BOUyKECCmiofnUg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66932-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 869737208A9

Use devm_of_platform_populate() to populate subs in the tree.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7..95e655a8b6aa0 100644
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
@@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);

-- 
2.54.0


