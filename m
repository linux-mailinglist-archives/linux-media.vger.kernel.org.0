Return-Path: <linux-media+bounces-53673-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GHsJx5doWmksQQAu9opvQ
	(envelope-from <linux-media+bounces-53673-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 10:00:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB11B4D68
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 10:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 016FA30B5A07
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 08:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0613A0EA1;
	Fri, 27 Feb 2026 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bkt2ARzV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C363859DF
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182740; cv=none; b=LBrrHC6/TgzuPvkrWCXShLUETyZfQQ23BHFnEuoXqwnNFTcpUN0r8Wn57bwcWXdyP19XVkUmTdq7pYn73WIxz8+k1HzhcvqnfFxfAKi4+cOMGILZuwI2UYwz4mvnJgetjGrHSnW4z2lNaGcs3T88Zj03n7FCEZHOdCCBsiSGOPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182740; c=relaxed/simple;
	bh=Rab/Jz8s2Uc744fMnlW79JYdb4B3JVTjRt9ymGtF/MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9vkq3+3Pbjoa5tLMRM/UhYMy+j0PkHbQt+rjEWV+PMeXalgLlwDaP/8c7y15Y8ifv9uD859mdTHVVVVSAciHP8C0iEe/D+ZOb0DO9zeofNpQa+J5L004tmfp63IEtgHRgcvdmqNotCMdHLntlNdyUGYrpcAfTHg4zXQlUlFkoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bkt2ARzV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so14583445e9.3
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 00:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772182737; x=1772787537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZj4vcPqGU2PZNqfUYcmBKBz7k0/XrtLyYeVPXSafZ8=;
        b=Bkt2ARzVpwPQAh9XvhHSQP4SLu0YI3X8jswizkDhlpLhmqT9obhxg4tp7zf92Doi5M
         1uEX3eYeg0eChfjSfC1+O8FxxBjY04lTO4g7ajtfdXjtPcFaoB3xwPFVax00Mq7p4Fa6
         QM6P01q7+iiSKNrUMJ6s4/Rk8Em70E2JSI8hdOlJQVN6Sa1yQ/KA193IJrfmkZQpTZC3
         R6rwYv6RBKlLhUnZHRBapIiYhC08SxR+P8LHxTFyLEvPJSbPjiah28ig4PlNhy4shhBg
         czkD4W2d/zun7limMH5+l2GiO4cIfFn4bW78fZFauRAW2Ig2JWbEfmF6BWRcEF0105ah
         bMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182737; x=1772787537;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZj4vcPqGU2PZNqfUYcmBKBz7k0/XrtLyYeVPXSafZ8=;
        b=j4AnEaMyEar8jXcG+ryK2qsqEfiQi0+oalVQ9oVeLrFIe5e+l8w1t+OX72hYO/H5dH
         XIWd3XuBW+FzdlxaqnbpzPOQrZ4/FZit4xyfv6fsIh8hL6V8nt1viPbz3TjLsQV7Qhux
         v2FnoafZiNemGCKCRbxFCq5FaOqQf/5rw5IVtglwmX95+EC/HTFArdAAAya86xT7KSJG
         uPGfBTZSQ09qd52RjyWNuyLtRVwN8TAec5dUSePA7/ZHAzHOmdt3UH1UkgE/nCSG0z9J
         IYQvUbmBoEcl9E0TSZSb1/0VaNyKO39yjc5YH9a5Nz1PQzCwTH5oIz7RazpsWO8fRZDR
         WeKg==
X-Forwarded-Encrypted: i=1; AJvYcCU/eqIxYc6hrUgSgQQ4ximcqSxf/i+LcAmJr/Cv0Xp0ylnn+jZ5dsXcT+IOOSH/TjLcgMSEseV3LSVcfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxTkzexlUabEdS/bY+tqAdWDVeOS982x1bRdGMxuQUfjeuatqM
	IX7s7CjL+hesVRyasaJxdvoJwkUz0m98UcIAQRSGpddJPkS0QzrW/bYQ/f/XIvTwz7o=
X-Gm-Gg: ATEYQzzOXuuQdMyhWwxqzdyaAeyWhFRSa74dQ5btWvhijJZBxBtmrndYIkobD/fmtmo
	yJlDV9sazEqHnMo1kGdBucgjCKV5MMGyb2FF9kvD6btNX+YLD0yZrLC4o22gMbjKsQ/ImoX3wt2
	IMLqTbwTsZE61ngWVnVt8+C/fTy4RUziYEYc6IgkWg905/T6wVcsdgLIJGWEIQq77NSWHUxigKf
	HeYOlClohrYkPY/2x+nmeaZC8A20J67eWLxff81rc3vmdnADARjMwDwiAVwD0MvhYynRh7wI3ar
	euLn2lF2/mCG9dzaGjmi3JMISptE+X2ytxOKTK3uUan2dD0glTIZAggA9m76wv9P7idLZcCNOgA
	x4nHWGQhr+JlcPjH9talW1slNSW6I0lwPSidL8hQYAqjHekep5w5vQWvZdxy87IJqYLze6lw9p4
	8JGyZDrcBGc0k85+nCh948A263J+vQ5ekB5zoAh+U4TkVX2vEtJAQqUq+A2SV2qUXl
X-Received: by 2002:a05:600c:3e16:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-483c9ba38damr29772325e9.7.1772182737123;
        Fri, 27 Feb 2026 00:58:57 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd750607sm201855375e9.10.2026.02.27.00.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:58:56 -0800 (PST)
Message-ID: <5d880b56-a3fe-4677-9751-feeeea8dc2b1@linaro.org>
Date: Fri, 27 Feb 2026 08:58:54 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
 <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-1-a59c3f037d0b@linaro.org>
 <lxkbmpzqgkxdnanetardqhqpyop64ri5sawu3wta7hzjibbgzm@zyrdsfac4wvq>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <lxkbmpzqgkxdnanetardqhqpyop64ri5sawu3wta7hzjibbgzm@zyrdsfac4wvq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-53673-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 3DBB11B4D68
X-Rspamd-Action: no action

On 27/02/2026 00:02, Dmitry Baryshkov wrote:
> - Add CSI PHY as an optional device node under the camss node.
> - If it is not present there, create it manually (by applying the
>    platform-specific overlay, by using OF_DYNAMIC or just by creating the
>    platform device manually)
> - Migrate existing platforms into using the CSI PHY driver (ideally, one
>    by one), while still retaining the backwards compatibility with the
>    current camss ABI.

Even though this is more work, I actually quite like this suggestion.

Provided the DT compiler doesn't complain, I think I'll take this feedback.

One reason for that is indeed as you say, we can reach back to older 
devices and give them some love.

> - For platforms starting with N+1 (the next platform to be submitted or
>    merged(?) into the kernel) make CSI PHY node mandatory, keeping
>    backwards compatibility code limited to the currently defined affected
>    platforms, which unfortunately means the following list (I'd leave the
>    question on how to handle the patches currently in flight to the
>    maintainer's discretion):

---
bod

