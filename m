Return-Path: <linux-media+bounces-63448-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RphjJrpXH2o0kwAAu9opvQ
	(envelope-from <linux-media+bounces-63448-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 00:22:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2A6632647
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 00:22:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=dL3AdcYA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63448-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63448-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B11063048F1E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 22:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F6C3B8BA4;
	Tue,  2 Jun 2026 22:22:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E968731F985
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 22:22:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438966; cv=none; b=XSWjJD7w7FB8NlQNea6BQl0Q4MO/L3/qmf6c8Oe0UnY8ZLgSjAtjnY6R84bHg0FqnScVYEz/DRuUvJgg4TZ0j9uV/LD4g5jmHjpU61V2cZRZD8TpQuYwXBWZKP6SpMuS3xNcqdo2d8Fsi4s29+FNMAnR3ZfIyBEpzhQP3EpUQhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438966; c=relaxed/simple;
	bh=XNUExCvA+WARuUW8BQZoPl41BM6NXl/RrTpIJO+J1zA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXVo6xrj7DAtSn2e8NvoANuvIJc/ymur9ATfMbN2E3xYbtsykLEpDtdKzr/bcJFocGAy8yw0P8X7ukVpZ0zMFWB8ZJRabrOd4Wn64PZJLEoCvb7LfdrZ62NTFayZFyadkH3M9zi+Sj1P8o3ZZFeFXjRqeTsGc6x2YExHmBToybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dL3AdcYA; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso11005685e9.3
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 15:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780438963; x=1781043763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5YMLNp4uCEpkwe9D6P+mENG3LiY0e9ha51X9dT+gkc=;
        b=dL3AdcYA6/iHoD9LfCqAVpxuTI4KVU1glkBFbUTSAWJQdeOoym93DIDSGAoAx8/J8a
         GDejkzXlm7y39wOEeGvs+NFVJBNkYB8P7oH4EiFJqyLlHLP+YgakLnrnCET7SXLEgx+A
         2Z8aEZlnxZUUkdGeD6b6Z1PoSYnO+vOjtDkz2wVZWJY+vdw2FtMnuZRejCDNpbk8XM9v
         6z0x2rrihVglxdvSx7O2CtrUpyygcbo5SKiNl/WOfEraTcXLeHpWVv1O7lZZFOWwEZcZ
         YRN7DzhmXRbsrPu6JjbLChMrEpAUJFjwjcvxIsOiBhy8wrmN79zXvuQc8FOHsPvP1TOC
         2PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438963; x=1781043763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5YMLNp4uCEpkwe9D6P+mENG3LiY0e9ha51X9dT+gkc=;
        b=XwRAChsGnjQyhP1AgUX5Jpjn2j/9pwNMAqx7RKYgTITh5fKVIu544XRytpjXZv1IDM
         n+IGBNulHYJc81nf4nf7Rg+H1UR9YqKsq5WABha/8t4IYLYYYXImQe1ukfEbhpKiJpTJ
         qyjKs4a8NEqrul1TMP7R0Fx6gzMiiUJa4Dnij1vGo3W4bRLAwCmBFrj7TuD/IRIx5iGN
         LyEXKGnvAAq4MjtUGLCaVx5cG2xjIGfL0DC09+QKKxQxulQ3jfu24brPYXlCH0ZVz6XE
         XuE7/96kmE4KnQYq69ZFhko0JlkI7Ti0U2ts4wtj1bEGn9lq9FqmoaDzEAJR50/EoBNb
         izjw==
X-Forwarded-Encrypted: i=1; AFNElJ+YBriHF5p6WNTxnvDJvxUHnZKfoARqtwvy/0bs2tKzxEooPexNf7IY/6JVMjH3hbnDShH3sdjbIDcc1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPawIu+D4SL0L+dAX0xriKNcHvBSuFPrf7lEefEJOLInIvRDkW
	foe4Q5mBCWMknLVt3FMSU5oiKdRBJ/HdDJIYYJiik8QL3n3g3h4p3jY/AidPP5iM+xY=
X-Gm-Gg: Acq92OGHpuXUW1CLsU5vcg5GFxPjp2RtW7jkBs50LyC7GeeSaF8885CAen+BZocyEMd
	Mt6IGzY0lMEZAogP5y08gAMpkFa/ZZM5+SNsl+JAtWdzbLDCvaYi426Ovc6mGiEqR8e2UqTq8uY
	ZP8gEQwgBOi0zO/7IUYKsB2Pm3xNd1yEkTbygQf9eo9oCkPeedFm2uKRkkKrnSfoiPqK0/DKBMW
	qsIppZ9LvsMFtMSs38utrHvW/eDHp46ZrI8VZTQeaSMulKdfv27CP9TnixMtMn0nuen7H0EpPKf
	OBzpHgPE9ihKbz5wFPL6myH5VxXdk/VnA9NMxlcbGVkFQS/hVnpZMy8IV8FZYXzSehvRAK/eAIf
	ybRQ1T005dpLZCMV6zoxKbVvVE4thsBtQQ6HiJgNs9r99CsZRPAp05hPbj2BDBQAAedODwXQq/i
	qXyba+McVG6/1sSbGIfg9pNBn5+8OBNzwaDkk9i2HxWcy4
X-Received: by 2002:a05:600c:1c1e:b0:48e:6db3:ff3a with SMTP id 5b1f17b1804b1-490b5eb137bmr11597745e9.16.1780438963385;
        Tue, 02 Jun 2026 15:22:43 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b5885c26sm5064835e9.10.2026.06.02.15.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 15:22:42 -0700 (PDT)
Message-ID: <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
Date: Tue, 2 Jun 2026 23:22:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63448-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E2A6632647

On 02/06/2026 23:07, Vladimir Zapolskiy wrote:
>> +    ret = fwnode_property_read_u32(ep, "clock-lanes", &clock_lane);
>> +    if (ret) {
>> +        clock_lane = CSI2_DEFAULT_CLK_LN;
>> +        dev_info(dev, "Using default clock-lane %d\n",
>> +             CSI2_DEFAULT_CLK_LN);
> 
> Why CSI2_DEFAULT_CLK_LN is set to 7, what does it mean and how is it used?
> 
> Since "7" is a meaningless number in the context, I believe it's 
> practically
> not used at all, and if so, 'clock-lanes' property should be just removed.

Documentation shows clock lane at lane 7.

Truthfully it makes no sense that the clock lane would genuinely be 
locked to lane 7 but the documentation does seem to suggest it.

Yes in fact I agree. clock-lanes can be reintroduced if someone can show 
hardware that supports/depends on it.

---
bod

