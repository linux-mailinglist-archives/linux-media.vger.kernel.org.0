Return-Path: <linux-media+bounces-51150-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDC4KsgGcGlyUwAAu9opvQ
	(envelope-from <linux-media+bounces-51150-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 23:50:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A844D459
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 23:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5DC74B091D3
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 21:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E57427A00;
	Tue, 20 Jan 2026 21:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H073B8N3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C83A7DEA;
	Tue, 20 Jan 2026 21:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768944529; cv=none; b=nQ4P7Hf/qx8mIuVv5gEf7vsXYdSJH53lhHZ9zAf3FsSzH73kiUws8LEt67DfXFYsRbRFP1A2IhgYHtV5nXMBXQv9VTAqNQmduWA8f7tQBfcRH6Cy1im2Bz1fxwiVKqeQ21Mk7iz20et41dePjlauwZMA4A8eQdgTXIpYEq8s5kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768944529; c=relaxed/simple;
	bh=u1IptKrgurDrwNSvmApbhQ4W5+wyL++f0DeFrPtprro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eL0FOV2g84ljBzYNvpJ2VhlWIImUQmFV8M5NYr301X7kYqVzA4nVK25vyuDxjgkzAKEjYCzcxJvQI2fk2I/Q5aSinAuxr1X9HOY44DnqHisY+dW05DAQGm2XdQFojncbA8JV4YhGP/5Jr/5rcS7VX6B5EtKd+lVsi/sejnpKCp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H073B8N3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE9FC16AAE;
	Tue, 20 Jan 2026 21:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768944528;
	bh=u1IptKrgurDrwNSvmApbhQ4W5+wyL++f0DeFrPtprro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H073B8N3agEchG7zoLwQLFT2zmkySSPfwHVCNyTNKXWYNCM8qjN3xnUAENUh8gMoa
	 g9weqgvgbtquV4ZSlTZtATh1Yeu6cfqEmox9LwjDMtmN2gnhaBb2yMkqbeL6ssjTUn
	 3HZ1oK/ZbT3gi2lv91Db/zorgdxrZX2d+MzDb8KkZcrSfcytJo2KGmSCbF/83Tpn5l
	 /ct1HrA2zbzA14oc73joPfgA7xWnkePAkUGYT272Q7aO1jfFxgFZXRadVjnJwJi3zz
	 x9ebUfAP7XRX+VcmVfDNZ0mjDZFnd2CwbOdMl9aRCOQP2dK92uqJnoOIzpYhlfFage
	 JdvYFMQlCo7ng==
Message-ID: <72b8804b-8871-41f8-81ee-6e0286ecaa8e@kernel.org>
Date: Tue, 20 Jan 2026 21:28:41 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 1/5] media: dt-bindings: Add CAMSS device for
 SM8750
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
 <20260119-add-support-for-camss-on-sm8750-v2-1-3e06583a0a81@oss.qualcomm.com>
 <20260120-kickass-taipan-from-hyperborea-e53ea6@quoll>
 <lACopU3ydY_Fb7oVfrCzy-Sbovi-J3nFOPuSyG0XEtNr1QW-LqdU_kAe139UNND3jU32Csl4Y2KGcCWhxb7xrw==@protonmail.internalid>
 <86661c45-d9ab-4ce1-bb92-d9da49e6851f@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <86661c45-d9ab-4ce1-bb92-d9da49e6851f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51150-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org,oss.qualcomm.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 51A844D459
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 18:58, Vijay Kumar Tumati wrote:
> 
> 
> On 1/20/2026 1:35 AM, Krzysztof Kozlowski wrote:
>> On Mon, Jan 19, 2026 at 10:42:51PM -0800, Hangxiang Ma wrote:
>>> +      - description: Registers for RT CDM 1
>>> +      - description: Registers for RT CDM 2
>>> +      - description: Registers for RT CDM 3
>>> +      - description: Registers for RT CDM 4
>>> +      - description: Registers for TPG 0
>>> +      - description: Registers for TPG 1
>>> +      - description: Registers for TPG 2
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: csid0
>>> +      - const: csid1
>>> +      - const: csid2
>>> +      - const: csid_lite0
>>> +      - const: csid_lite1
>>> +      - const: csiphy0
>>> +      - const: csiphy1
>>> +      - const: csiphy2
>>> +      - const: csiphy3
>>> +      - const: csiphy4
>>> +      - const: csiphy5
>>
>> Same comment as last time - nothing got resolved, nothing got concluded.
>>
>> And before you claim without supporting arguments "we are not blocking"
>> let me clarify: yes, you are blocked, because I am not taking bindings
>> which are known to be incomplete, not finished and already being
>> changed/worked on.
> Hi Bryan, can you please advise on how to go about this? I don't think I
> see the driver support in CAMSS for separate CSIPHY nodes on linux-next.
> Are we mandating anything about this wrt ongoing patches? Thanks.
Since 6.20 is close I'll hold off on posting a new large series but 
yeah, I have updates ready to go.

I'm thinking camss should have a "simple-bus" and instantiate the 
CSIPHYs as sub-nodes, instead of having them be entirely separate.

But sure, that'll come out in the wash.

FWIW I agree with Krzysztof, it's more important to zero-in on correct 
and sustainable long term bindings.

---
bod

