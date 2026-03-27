Return-Path: <linux-media+bounces-57401-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cATsMLUWx2mWSgUAu9opvQ
	(envelope-from <linux-media+bounces-57401-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:45:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D1834C825
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 00:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 400443079E6D
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A1938F936;
	Fri, 27 Mar 2026 23:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUdkJeZI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49E71D5170;
	Fri, 27 Mar 2026 23:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654856; cv=none; b=kf5Foq5nmQt5F01HdWaoxaSj4yekT2McXu9A20zbS1TYJZExC/7375NqLUST60+5wOm3+DahNURNkZgpV+v42yqFA5u6mU4cCmaNHAeC/ZukNr7geaQCBzcS/R3noufJ7PeczeKv9QLe2zpi7qZQfZbw2FztOLf5sCKCtSsefrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654856; c=relaxed/simple;
	bh=sByxVQRXRO33XAc5dfOqJ5M+BSrugSeygBYgV/aa6II=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YC+gRhqCnqgTvjE9SBUtRmFZdsRL2W8DUBJ8W7Fr3czrax90/kmIC+qK2NH1SBigij42cQlYeKsb4qoY4C1t99mTTOO8qwgWP0r/rRKS9hifemYHBX2vkasa/awaadMsVvibiudp85fIu5hYagd2u7HAPi3E4/T2zrNGGT4LcGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUdkJeZI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7826DC19423;
	Fri, 27 Mar 2026 23:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774654856;
	bh=sByxVQRXRO33XAc5dfOqJ5M+BSrugSeygBYgV/aa6II=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iUdkJeZIC/EPizOX4gTS5UdxRRAMfuT5H1Lnb7bOWM3FkLLzFc1hZELrB9U/+uXFU
	 in9WNNykZWSU0dDg16nEdiXIWyxZuDgAtpTBs9GKjGhYB/bnT57a6D0D2Ft6+7KoWE
	 i19kVhrn+JFHFUMLHhxA9NePNl8LtnQVI+kiCFifIqhxTNMVK8lkrWeQwnQqvCfloz
	 DtkFLArCgPndN9MwE2s/h4ZHp9hpo6FZRR00CH6MvI0a/hf8iHWUUdKSOY1g4oaOB3
	 X+M4teyIFo3t2L4+MTVkTxTAKYFslMNUdmHapftc/PlHJz5ClJ5ZqUcBPk9zp5Bzs3
	 s0YVh1k/GXmIA==
Message-ID: <0322e0b3-bce8-4415-90b2-d14445986e23@kernel.org>
Date: Fri, 27 Mar 2026 23:40:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
 <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
 <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
 <vcj9b-49PycEnk8KeGcgXAaN09KfYZnW7g0LayiEPie9p-4krmMDfNO6Nx4DLgwoKHdKJughl7zoxvmKVkqOag==@protonmail.internalid>
 <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57401-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: C7D1834C825
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 23:23, Dmitry Baryshkov wrote:
> On Sat, Mar 28, 2026 at 01:12:22AM +0200, Vladimir Zapolskiy wrote:
>> On 3/28/26 00:29, Bryan O'Donoghue wrote:
>>> On 27/03/2026 20:51, Dmitry Baryshkov wrote:
>>>>> That's just not true. If you read the camx source code you can see
>>>>> split/combo mode 2+1 1+1 data/clock mode requires special programming of the
>>>>> PHY to support.
>>>> This needs to be identified from the data-lanes / clock-lanes topology.
>>>> And once you do that, there would be (probably) no difference in the
>>>> hardware definition.
>>>>
>>>>
>>>> In other words, I'd also ask to drop this mode from the DT. This
>>>> infromation can and should be deduced from other, already-defined
>>>> properties.
>>>
>>> It still needs to be communicated to the PHY from the controller,
>>> however that is not a problem I am trying to solve now.
>>>
>>> If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.
>>>
>>> I'll aim for DPHY only and we can come back to this topic when someone
>>> actually tries to enable it.
>>>
>>
>> DPHY may be the only supported phy type in the driver, it does not matter
>> at this point, however it's totally essential to cover the called by you
>> 'split mode' right from the beginning in the renewed device tree binding
>> descriptions of CAMSS IPs to progress further.
> 
> Okay. How would we describe that there are two sensors connected to the
> single PHY anyway? How would it be described with the current bindings?
> 
> --
> With best wishes
> Dmitry

Assuming you add endpoints to the PHY i.e. that is what Neil appears to 
be asking for and I personally am _fine_ with that, then it should just be

port@0
port@1

if port@1 exists, you know you are in split-phy mode.

Its actually straight forward enough, really. To be clear though I can 
write that yaml - the _most_ support I'm willing to put into the PHY 
code is to detect the port@1 and say "nope not supported yet", since 
like CPHY its not.

---
bod

