Return-Path: <linux-media+bounces-55874-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QANGA1vNt2mDVgEAu9opvQ
	(envelope-from <linux-media+bounces-55874-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:28:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D7296FF8
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FECB301917C
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6ACB388E59;
	Mon, 16 Mar 2026 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OoJFiU2y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B683859D1
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653319; cv=none; b=MtCJFv8jgUK4pwRZHygEcAXz/UZiw66jfz2OT3Hm104RhtbaIYmc96HF18PCvpXQ7hZlD+D2YY+JiPXXUn0omfYt95Xz1p6JN3IPIGZXtPKgtQKi3dWfYVcgh39Maz9E4SvzNC4W2t/XkPkbwGHHeAkzNM8mP6nK9dF00L5oPKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653319; c=relaxed/simple;
	bh=9c+Cpxp1ZGW3zXQamjYhD0iRzxH3nZLhn74BuWgaiP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWKQgUA8U0BiTVzlkOqVQWfioA7SzSfRs1wI0TlhZeJlYWFBFSp2pyFN5WSTrNOtCFH5Jn27JM0H7Hmy7c7+GD+ij9ljxN3CR3ER1nVmXEAGeQWtA0QE4iAdLATKHtOiDwYtAk7QLIm4vF+P0gcn3F3el7ViO23cVUzMy+oMx54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OoJFiU2y; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a2dfb1a83so2718771fa.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773653316; x=1774258116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q75aoBy7Ji4mItPLv1quA/8WA+tC3Zlx81nywgbhn7w=;
        b=OoJFiU2ysS8xfggD0fZWt27gi04RkJ65YpHk68DkMbrZaoY/Qe4d0sYSjP1MhnuhDq
         ZMUs/kE+WHqd6M2JJ60C/zsLWKM8Kq7Fu+WIDYUCLZe4wBeptbu5+QqC5TIWUCmRyyqb
         ZUw8CCgqvsCv+NMeR2jC+o2TTkE4m1e68b0tDeDSFotv46XgJvYW1QMKjCjgt+IdA6IY
         zjeEtoO/bqdL+t2CIFlO8WadyBAW5p6UjE1VgMtyz42nzI3eVo5+IU7jXXXgC2neEaKY
         7BzufaZ1Nxuc8gJ2NpwtpsDB0KlmqOWuutKvXMH7kAsr5iSGrW/Eonl/p5DNDtQwytnR
         05Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653316; x=1774258116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q75aoBy7Ji4mItPLv1quA/8WA+tC3Zlx81nywgbhn7w=;
        b=EUvtIYk/y84sE9yhbg3ibGYfwHKBRE4iN+pkXE+MyWEs0UhTK8jNQZQNmky3mowhnF
         Igj2mThpmK2jXWIw5o6a4J2t28Fm7LEtJv0BSAwOQGgKt8HbTc4RhnH/82BCN9YpIMgo
         pN4xHAXVpbW++/uwTTqb+Uk4KhzgL8N0wWx8vbWpfCnibQje3FkxibTD3dVSvL59w81U
         bXiwlcYuuNW5/wT5qs/zRX3sbwqHLjTuEA1f7+PTJvqTZRVFYtzGMhHtHMAibDxGGcu/
         ige0DM/gnOdmKHULqx/3UjNdujsjw/gy98gY6vRh7+gOicdpjZpR9KdD15wkvL6HuLEV
         PH+A==
X-Forwarded-Encrypted: i=1; AJvYcCXd0mEFDtDiWsMolgvigv4U7akrVNUQFXVvYRvUuRGEeCh1XlRfhbHIOucmcRjOwqtPwJBPCo0lsPXK9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBdT4jMjPnlcQUE9aRgQSalc9dyy7W40ArDZIQYmceYqxaHfEa
	AtWxfoZl1SrGkHwUAwzbbCY/PWf4m6vorbbVykrPbJkvWM6nPHGQtsKRpb5NeWJqyjg=
X-Gm-Gg: ATEYQzylJtdAaJGdApx7SiPtgI7Ddg7SONJJV1jK9ZAVYJKvkb+tz9MVccsTda/BN19
	bqwEd/1Y9BVj871huuNTjGgPJlSFFBsdUSy0oR+2oU1/jLnI2QwE/11iutsfoAK2CBzBc8zoCMh
	u0/1GkyO6WkPK2qOsRpnrs3LDyIOXguCCm3Kiglqhx1fo3KOYe3rOxJSMBDFap50rL8TxgMOlLU
	U7iEeiCUXSdCHfCQPP+buSP0G7dXZGfKj1LAG4s8PQJD0CKQ9zpEwKv0TsmBIkVTGCHbdnE/lMb
	U+60X+bRpgQ7Wfy+QttuVzhndGtIn4AH68AnlVXR0jHGNZKWaq4OwtN55+U7LQIwNzy05nbMSlx
	JqiG5KI/YKJtj49qVUola1RRZrY7QvezLb1H/Pgn+djRCmI1ryfeLDij1x/lR1Hq15nM9W5h1OJ
	kHhZf9620/Vizt7BRJMo9n+Vhi1m/S9gduknamWbbOCoHD4foW8ycnr7g2xCMeCFA0lO0rMNcoJ
	eH0YQ==
X-Received: by 2002:a05:651c:211a:b0:384:9158:6bcd with SMTP id 38308e7fff4ca-38a896a443dmr21270251fa.2.1773653316000;
        Mon, 16 Mar 2026 02:28:36 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm31237711fa.9.2026.03.16.02.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:28:35 -0700 (PDT)
Message-ID: <30f3ec22-c86d-4f05-b519-641fc2632c50@linaro.org>
Date: Mon, 16 Mar 2026 11:28:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <cca53190-ec16-40ee-ab4d-7bfbc1f082e8@linaro.org>
 <bmcxyn5bv24cmxvuyhjbbsjb2bfhq55nmoccfqxvgiwx3g44nb@xq5fsyfqdma6>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bmcxyn5bv24cmxvuyhjbbsjb2bfhq55nmoccfqxvgiwx3g44nb@xq5fsyfqdma6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-55874-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF9D7296FF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 04:39, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 04:12:35AM +0200, Vladimir Zapolskiy wrote:
>> On 3/16/26 03:02, Bryan O'Donoghue wrote:
>>> Add "simple-mfd" as a second compatible string to allow child nodes
>>> within the CAMSS block to probe as individual platform devices.
>>
>> Why are there any child nodes representing platform devices?
>>
>> There is no necessity of it, please use a layout similar to CAMSS CCI
>> modelling.
>>
> 
> I'd say it differently. I think, putting CCI device outside of the CAMSS
> node is a mistake. In the hardware all those devices are a part of the
> separate block, they share the same NoC fabric, etc.
> 

A simple-mfd model could be considered and pretty often it's usage makes
great sense, but likely it's not the case here, when phys are childen of
a factual CSI decoder. So far an umbrella/container device has not been
considered to the best of my knowledge.

OTOH I see no issue in placing phandles to the same exploited resources
under multiple device tree nodes, the ultimate goal is to provide a proper
hardware description.

>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>    Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>

-- 
Best wishes,
Vladimir

