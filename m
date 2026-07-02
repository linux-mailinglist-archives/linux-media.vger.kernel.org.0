Return-Path: <linux-media+bounces-66330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PnRaGGozRmqwLgsAu9opvQ
	(envelope-from <linux-media+bounces-66330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 11:46:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B99D46F5736
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 11:46:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=YQYaexdT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66330-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66330-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEB2E312FE79
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 09:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BE747B429;
	Thu,  2 Jul 2026 09:28:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B37412271
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 09:28:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984521; cv=none; b=QAQRpFEKzpdKG1F4JBIy5EqSvoh6DHlAKQ5vpXwtsYbf4JMQApXC31ImI5zuHazZ8L/Av0dbwYIsPUyfUXVgcpI+Nq2JFOIMxU+r1Dfr7QUhiQ1QKY0noVLotNPjGhE1Cx8xDQPpCGkP360GdKxCaRQkZOjcOhv5Se3kLpd2RLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984521; c=relaxed/simple;
	bh=ord1rspkjMh6vVxNgvwjzy4OsLQIgtGKKriwINUPMpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qx/mLDqWTrwD9mvBLHaLvqBacmdJzwxzakNQVx5kZzRFEFHRy553GmDQk69s9SqGu77KH308fBOZhSfRYHrC8VXamhl92M0MsEfvvD6v+om9oLe0vhPxsFK42YmYuItt5ZYyYx+70xUY5JhzeZprSU5ioJqdajlnKWGbtTxA+cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQYaexdT; arc=none smtp.client-ip=209.85.208.175
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39afd6a6b98so1221071fa.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 02:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984518; x=1783589318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r0zPwWUyPadxaQfjwDx9HdrEaUrpGJfxmRrHbmv0dro=;
        b=YQYaexdTUYAtdzI5NH0jhExR8JRDWYN7NKyityvCvkG0CGq6DxVN2TCob1NOX2EF7L
         UK4+lVhhbwmZf5FlzNs+XXXsBe9GbNIyC1wbjbFp1s7YeFwAbtGB5PooLThWejdQbL2u
         LNQIiPgQA5PU1719aXuaJSQAJL0xAfr3cheSEWlWIhVMcBJ5zTyd8fm7s+JsSHaHZ7h0
         DoHo0/y6SbGxwwIjBa7INa1C9dOHxzAjprJPwsLvVN8sCOb/5YHy7Pw/pnx3YAEp4Vky
         wAJa+89qHOaqArj4awKg0FHgr7gTWAw43ZeJ7PIXflMnkCUNfqNYIBfq6qCjpa4HN2pp
         /HEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984518; x=1783589318;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0zPwWUyPadxaQfjwDx9HdrEaUrpGJfxmRrHbmv0dro=;
        b=rE2X3NfGRKhGMjuPUC4UNLwC/ObEKPfxSJG084m1r340xkTzJCL6PrtGXIcEBWQ1xD
         9LZIupWkoj84qgH+IW6e2vLTvaTcIhcduSzQsaWsK8082XuGRIoRwrO4tglEAXK2glgX
         i/q/7ROzIof3nkQqSQiXbAdZIzOxegIoZtNbi6B6bStxfTa8w3G5/HGzbJMyDGHXPh3R
         jIcaBEDEcT1q7skQuAtUJW3i/p58ZCWULpl9zcYI/s+NAmycCRznT+SHDYxzlVmGZZlI
         VRNSGFZ8XRUwFSrsba/G3YIUJEzQ++ctb55fHMEFOsPQQN6xIeGqLO2OoKKL9/PjzV8l
         +Osg==
X-Forwarded-Encrypted: i=1; AHgh+RqvvHRvGm6YEKZRcAftZ/PCu7ASM/7iLA/BvtDmGY/CSXjeIWYYIWClKaZttU2JIekehV/W2HEdYonOWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPaNCmaYLSPAAii1cXMV1VPEkFm+jUICpWR5AWl90lASD1b7k3
	xFx5FFN4yWAVg/vMe8SYrFgWdCu3UonysrSkeeScWV2sNZXltkg2gZSQID5voWPfcJKmF4yDBfu
	ve8sRo9M=
X-Gm-Gg: AfdE7ckt0kD7PQD5vnciUD/v3dKbslw73JcWLIqcZU3PBqZqEzWhq77DmEfT357rmdz
	kcHKDqFixChk3vfd8bOLn6hLAvjw0chiaohiE/Cl9mUBnnZExkZxSUgow/SxBqNbUT2zX8y5ouw
	GEjkwtUdKjUh6WJg4Y9b9F3/uPefwBrpkJ8usZaQMcnq2RtIqC0q0LkvihWNOU10IGhOwxSvuU6
	oaT1vdBRGvYEGgwgJlRKRjrRRqtZgd9X1jRXoZlU+NQmpKBUPFkFR9J54vLhxZrMj87C8+LhgbD
	gQJmzUSzYB1TW8tjYGOVbXP2AJtlvf1Cw61dqFU1AJsJYuTxsq0iOxQpDGTirXL9B4iArIP/g7P
	QdMNUr+ZSuWxi0lCpXNx7OREfgzYGpQmv1qab9CQzrraH1o+8uqen1KHR8Z24oup7a5M0Sy4FAR
	X0zTrxjQPRhuHlIIW4X5XZXZL8FDrbzltjmQyvreeyCK43vSGnUC6WyjShAbVxdNOz/KI=
X-Received: by 2002:a2e:be03:0:b0:396:67c6:9338 with SMTP id 38308e7fff4ca-39b33c3891fmr7815541fa.0.1782984517842;
        Thu, 02 Jul 2026 02:28:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b38004dbasm4980591fa.40.2026.07.02.02.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:28:37 -0700 (PDT)
Message-ID: <b8226ab3-2ff8-42db-8110-7947c59cf343@linaro.org>
Date: Thu, 2 Jul 2026 12:28:36 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
 <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
 <6b6492a4-7610-4dce-a81c-8dc0387a4061@linaro.org>
 <1c583e24-09db-4d90-8f32-d3d3961188a0@linaro.org>
 <3e2e6184-e020-49cc-9a4b-609c05aed846@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <3e2e6184-e020-49cc-9a4b-609c05aed846@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66330-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B99D46F5736

On 7/2/26 11:46, Bryan O'Donoghue wrote:
> On 02/07/2026 09:31, Vladimir Zapolskiy wrote:
>>>>> phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's
>>>>> suggestion will specify the mode.
>>>>
>>>> This cell is just not needed, and unneeded complexity should not be
>>>> added.
>>>
>>> I'm going to stick to Rob's initial guidance on this.
>>>
>>> https://lore.kernel.org/linux-media/20250710230846.GA44483-
>>> robh@kernel.org/
>>>
>>
>> Sure, the discussion will be continued abouve v9 of the series, it's
>> just a chance to do it now. Rob properly pointed out, that the invented
>> "phy-type" is not needed at all.
> 
> I'll quote here
> 
>   >> +  phy-type:
>   >> +    description: D-PHY or C-PHY mode
>   >> +    enum: [ 10, 11 ]
>   >> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
>   > Perhaps putting this in phy cells would be better because the consumer
>   > decides on the mode.
> 
> A clear instruction which I'm implementing.

It has no contradiction with what I've said above, you have a chance to
discuss the matter now or at v9 time.

>> Ther fact is that the whole placement of the CSIPHY to phy subsystem
>> looks execessive, since you add a driver for a media device, there will
>> be nothing PHY driver specific left in the CSIPHY driver but name.
> No, a block with its own pins, external voltage rails, even its own
> specific votes to scale individual clocks, is a distinct PHY.
> 
> There will be no further CSIPHY init sequences getting buried in CAMSS.
> It is well past time to dispense with the monolith.
> 

Again, there is no contradiction with what I've said above, so far there
is no argument to support CSIPHY driver registration within phy framework.

-- 
Best wishes,
Vladimir

