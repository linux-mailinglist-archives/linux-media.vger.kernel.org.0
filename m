Return-Path: <linux-media+bounces-63048-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEhkLr6sGWpEyQgAu9opvQ
	(envelope-from <linux-media+bounces-63048-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:11:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3106A6045A0
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CF19319EE02
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 15:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55F5402BB8;
	Fri, 29 May 2026 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dEp8C/l4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE0A3FB7DC
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066701; cv=none; b=oeda/JoqPWuPUbFwdiC5u92rYvd+vN1qB64yThfnSMMZUt0GYTrBHbAn0Ee1balhohcLFIo6HMP/sV1yRi+9QskKovfF8m0IFqfhFCWGXfbhejrNUN/2ijCG8fwOrNsSQLLoVnxsCpBJkra4utBkAHkGm9vg26Q4r3uCE23y16c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066701; c=relaxed/simple;
	bh=TvDNOUNE5esDjb0VJzWZLByvq8d6tWkBf2WKUMK9i1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbN6effKHoxwN4ZX/Ta6L4UBWZUpBqUCr7hxUzdJeSmaf9anaAjYtmn3loZL28EvoPU0WHViYqta1bC0EdloWgnTxSRGGHvwAglmlcl0PtEubqeLe9HWDDioNJ4hQvWpcd38fsM3RWsrzKU4l2NCa1cHaubd0t9DmxVu4gZ9dSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dEp8C/l4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so89668875e9.1
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780066698; x=1780671498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GU2T/pZfXae23cHrpeloETVxMMttaLJWiMdOf7oLCD8=;
        b=dEp8C/l4kP6fTzCOB0TqE8BUSqt69CnDSmzsvE8WbH6NizrhkG8T147dC1PVYuxN73
         EBSHHiYf4uKHpwJ/MEqpT1p+f+gh+LdFJg0A15EnPfEF2bI0MOcRTd47AtAXi41i8eLo
         wF3z3yWSqSqivF8sXBaxvfz7PKAU6/sluHBvH+IbFhAApcX51hsPRttuquZqx78m0oLK
         IL48+/+6gsoD6zNsc66DMmRCSvWHPtS1ZjKbqJuOQ5NOfMr0KSt0oi4aR26Hzt/fpAIo
         ZmCvBEIb4tGWmrA/yakeGSk0z876HQaNoAClDgFu1v6jKWQShyddHXKnpUh/iqg0n7aF
         s6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066698; x=1780671498;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU2T/pZfXae23cHrpeloETVxMMttaLJWiMdOf7oLCD8=;
        b=fa4kZaLoH0EZPon64yNaDJX5bXVFOmbOSaQlZSnzfawG1LukJUhu6lSW/zxC9wGYRI
         3yunNNbbl0awPs185wSO+hRMkxfsz54vV+R7EhjH8EecULv8T01Ec6c6R56lt8FJpO5i
         zcFDwk4OR+inxRF2H7Q9vehtZ1MZ4+rsgHUvjjRVxSpIkCry9WZQlRGn75/wNlOoh+Sh
         xEvQuNU1f9ELlY7hFo69mzyI7NibESIKdPzQl211rJ2jGUzxZ1XSN9ILCVCyZeN3Mjcl
         Fz5caQ4r9byETm28rr/fMX6ZUtDGQ53yBBiR6V+vrzWWC2+eqTegiRvbGc8IPHAnItfN
         ObsA==
X-Forwarded-Encrypted: i=1; AFNElJ+Qu9bqpa2po25+ZQmS1qOu39yAbn6KB1lTFDimO0mMWEkkgq7NPdPIlnqanZ3nt4q5TPfCVnHS5koJhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxplZ7D04Wy1Br5z0x9ncpt04ObbBRfPogqBp4drKR/RiPY4xH2
	qN6rq83pjh9DG37axdMAq7SVop29uoybUo9di1+Hsif9ZB3kDumTnw+lRz7R7ti9+cA=
X-Gm-Gg: Acq92OE+eEHkG7yh08hLTwQQdAMlj6tqCxXSCq4ARCcd5nCOB6T6/6xqBk/KZrECpyo
	lum++uzisBrMsBh4ia4gFsRiq6VVczHWPwVZN7+wzpYr7VO4VE4b3RiYWc+LCyss4FbhFwuwy8p
	6uhW0q25ynIADT7dV+U+U0kOP9oAWfQKLNWDrbphzjgFB/941NGUqOEK2liF5xtvt96AgTe5fz0
	DNd6ipcMt/KcgAxxa47wkRSmxcD7lWKfqZlnfH4u0UOSaZ3R57Zo+04oXOIANaPtQLlsUj30IWs
	qOemX4SsuQG3VbUqXZcLcj6sXpC5JVlZzH4mwkkYBmJfqpsFS/kmPzPdknunWZwzwY6uGI6WWPZ
	cEoeoibQKqBC/d/UWPUFEyzsdlFJnL/+jt7gw5eqdU/HOGBvHxfvsTIq9ZsvSiWCC49TC9/U97G
	D08PqrI6ARwN7LSiulNN3TwYgmvaQdkvb/07jI6uel4jM=
X-Received: by 2002:a05:600c:1994:b0:490:48df:2793 with SMTP id 5b1f17b1804b1-4909c0e77d6mr57620855e9.26.1780066698120;
        Fri, 29 May 2026 07:58:18 -0700 (PDT)
Received: from [192.168.0.101] ([64.43.33.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909ca6e124sm49445275e9.7.2026.05.29.07.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:58:17 -0700 (PDT)
Message-ID: <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
Date: Fri, 29 May 2026 15:58:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
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
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-63048-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3106A6045A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 29/05/2026 15:52, Vikram Sharma wrote:
> Shikra and Agatti are not iommu compatible in terms of Stream ID. Only VFE SID is same
> for both. Agatti is documenting iommu for VFE, CDM and OPE. OPE is not yet enabled for
> Shikra and in my opinion it should be added as a separate yaml similar to Agatti.
> "https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9- 
> bb1055274603@oss.qualcomm.com/"
> 
> Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.

Which will be a problem as soon as CDM is attempted to be enabled and 
yaml changes are dropped upstream.

Hmm then it seems to me that five is too many for Agatti's IOMMU set.

I'd like a number list so that we are discussing facts instead of 
nebulous hypotheticals.

For both Agatti and Shikra.

---
bod

