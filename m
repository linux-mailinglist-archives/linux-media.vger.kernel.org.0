Return-Path: <linux-media+bounces-57845-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EpWFibhzGm0XAYAu9opvQ
	(envelope-from <linux-media+bounces-57845-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 11:11:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68283377519
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 11:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C08C43077A26
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 09:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAA13CBE6B;
	Wed,  1 Apr 2026 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y5iZzCMe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431D13CBE6C
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034160; cv=none; b=rYylTJkOnrhNcvZsPlFuQn56qoGSM2Sa+OQJdiLZxWEIUbReM9mY/EAG83mEIXbFHbdafR5v4T0S8l/DNn3yukvvwYe48LFBMyNimorewf0dRPt3wdjd8Ub1S8pexo0VHyAWxKzkwlUvj/CCX5mQbaQ8I5BK0JjmOzqYB2y9D4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034160; c=relaxed/simple;
	bh=O1HK0Jj/R3UIJ82LFS+5RhJz5avmTJzqUtVQIzkvhd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvfD/2xIixMIGyUNeAKTXy8IjyLkq3YdH2PIGz2c6tHdL27Ik7C0ALaR5noElGaF8Zs6BVlBrP1+cDp+0GHXpkqsIHNISC+rf2hWEoN+IAIOsR/mlvnHzTI94KhcT4+gMY64HT+rWvhrwFbEZ3lWSqmsi8vS+mgbBvkq3FkCWHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y5iZzCMe; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6618bc129acso9762931a12.2
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775034156; x=1775638956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1PukhdiG5D11EUZIE0UsizRPKVyY9ijY1qfZllXyoG0=;
        b=y5iZzCMeRP9y8rFvklIWpamvKlq1Yruap7z3lTHm1dlZgQLLuQrbKWlHPJJstn6rwT
         pGrgAID+3HhEVAVxeaLusfq+3KpaBMR6ed0ZO54MW+ryREw+bTbIxo41V9awxrV2o6b0
         P/Z73/7WIH25GhbvAHtCIfEIYIFnqdJaGaWkHqElI2C8W+8taE3sKMfSl8MHytc775K1
         VfO7yvOltR9hhkKAc8fPJcBiGOTC3Tizba9VdUQfsOZuKUJke4kCoyN0RhdZRQx+aRA5
         b9pgckwqN1Ruipu4JSNHO7kZFHfRw7Q4FfxRaPiJaQIEW/qOEF4hQBdneI2UBgPsjMgX
         mvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034156; x=1775638956;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PukhdiG5D11EUZIE0UsizRPKVyY9ijY1qfZllXyoG0=;
        b=Rqk0n9oeuqOFnIlZJEUdf0yswWYbxKH343hs6Czti9onDqTxEYf5MP4/64nsJk9qCN
         rBJJJRyWHOEArU3hhvCL8Cc1A/THOqUeMwtNTz5B4RJBURxp6M3aYX7097vDAfEmebGT
         C0Ypq49r5H73B456djVLXE/O7mu4m5BFxwS5X2BgqX43tc0+7EjC1xpE66AuwibMC07N
         1QEslm3CSP7ackPGm168TZXj+fAosjk2xJOM7E3eLKjSq3h9Sr0DmPrAidlFt7SnKUB3
         /150JYMIXvyhrEC4NBXTtIAUkAOnjtAls/khZZ6hK/NAZZ3Ltt01vnhFt8wolP1lLZnh
         Tolg==
X-Forwarded-Encrypted: i=1; AJvYcCVAymVrrEocodsJUV57pARO2ruXplk6meHuQf+3Ut4TM7aBIBwgUZJ2+W8mHCNQ3wYVtah/zMuAO7yh+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YykcCkIEH9DkfW/NbU29XaRW6lNCgcM/ircb1GQF+iEPMnwboU1
	aNpXNyeUzHC4zqAdnIDnbmKde2JFPWY75AFByyeDMWOuxWmHKX3NfkqCiKy94Nzjlfo=
X-Gm-Gg: ATEYQzw62DjaLzan0zuCLGBJtmuXmMHHucmRRvIAHBlaiXJB4ibTF/I2fBfJfFd6Lh2
	00p2i9bVHqm7mf/Y+9AMdcImUZ8dUEzZBoqGTircN6h8QEWn7K8ggzGhPZB1svA2hl+rw2/Iejv
	xFNwpGssuup8elt76wXH3XmKOY96gl1//KQLxRWRxqS7RHrrP71s1W8b8XFzMXmf2kuYmO66rJQ
	W6akYi5kzixbuRPaum3t0nKUkZLKy8CHsdl2iHEsWa1U7GV3SPmwjdw0TP0XyHCF6FPGOqwFfaN
	YCxdIz3YuXytyAZKOnExOjDzWJT6d/oc/f+zyZR/pllKknJpbsdxx70mjR9oHD8lXbtk7mpSSKH
	0ko/F1hus1vkQyUn7/5XfX9SpzvHwdNM52jW/KJPi8qTe3Q/AZ5Tz7vI2dUvIKXfTHZPGvL8tGb
	9MQpA0gYQulslHNsFTNfWR7MP1jzxG5b6LafI=
X-Received: by 2002:aa7:ce0e:0:b0:66d:d05d:aab5 with SMTP id 4fb4d7f45d1cf-66dd05db070mr776807a12.19.1775034156409;
        Wed, 01 Apr 2026 02:02:36 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.235.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66beb2d044esm3047130a12.26.2026.04.01.02.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:02:34 -0700 (PDT)
Message-ID: <90c88cf7-8873-412f-b14b-cb0f94028194@linaro.org>
Date: Wed, 1 Apr 2026 10:02:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] media: qcom: camss: Add camss TPG support for
 multiple targets
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-57845-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 68283377519
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/03/2026 10:05, Wenmeng Liu wrote:
> Tested with following commands:
> - media-ctl --reset
> - media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - v4l2-ctl -d /dev/v4l-subdev1 -c test_pattern=9
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video2
>    --capture=7

I get this on Hamoa.

media-ctl --reset

media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
Unable to parse link: Invalid argument (22)

Failing to connect the TPG to the CSID.

Please resolve.

---
bod

