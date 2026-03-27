Return-Path: <linux-media+bounces-57385-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIgmMnkLx2k6SAUAu9opvQ
	(envelope-from <linux-media+bounces-57385-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:58:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8631834C298
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75726306EC88
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E34739E6F0;
	Fri, 27 Mar 2026 22:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZormfnx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD8824B28;
	Fri, 27 Mar 2026 22:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774652256; cv=none; b=lkRLZaJP3+kgD1Tx1G1nVkdUrUbW/lxT0+aoH4c5F+HjZqJvzEL5d96EeCVU1jP8C8B39p4dN903F4RyQzLGiFb6YZoeAY4HLGl8CooRYWtx33EZt6CECcZrmBvWg2T+g8LFhQIKQa6sO5SFb96FVHx5kKmKUcJg1oiysCozMqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774652256; c=relaxed/simple;
	bh=382ZzAjwznfU2ambOpURhZCaUOZizho9wnlqCZN8Ycc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e49OvddJN9EtM6vyS8DIDxoNU4K/Ep4ggr7/E8lWg+xKpY8RhEoVPmsRU3zzZueH5d/j/xGJ18iWtwUSBbTFpjw+Dr6GTtG0V9ZEEqVKR3Gk0H/N11xgGgLwMXGfy86WDUua0G2FD33F5Yj+qYX6g7qiuTtV3pLNyw/YA+x7fEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZormfnx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84CFC2BC87;
	Fri, 27 Mar 2026 22:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774652256;
	bh=382ZzAjwznfU2ambOpURhZCaUOZizho9wnlqCZN8Ycc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AZormfnxOGPv++BinyFO8R7Wtiv2nT/QnAZdEVtFlU/eavjIOKluZi45ymywR0tEs
	 H2TY4qagxRcKs+icTlli4Rk5teaTDHF5pEklmesASduK5aTr83s686fbHkH4/KV+rZ
	 n5D0nZVijEh9xEzEKAsirpZyF1Dtbd/O6XCtMiWCFHg5kmz2kOfeUKUt1VlTCpkcra
	 FlUZAJqcd8wdVIzhX4/4uYiaOIHxqHs3L+ZNBP8cdHdXhVJ3NvffQq8a5oQQu2dSMZ
	 nKNBxODdll3cindqVUyfmiOp/0NIkph66OxC4xToBmU2z3GjY0UNBZ1I0nroHm8Zkt
	 qoNR7PyCHfoXw==
Message-ID: <4ead0b6d-26a8-4e99-b5de-b7bf1ddc5fc4@kernel.org>
Date: Fri, 27 Mar 2026 22:57:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
 <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
 <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6>
 <7757b121-da4f-4157-93c9-4ba162b2696f@linaro.org>
 <8QluTwu20EKgDZw7aCJzUdLnbW1JPmcC1joptTrNEAhmI2vhOGtR1brQ4DMO2PAZGEcUsFwrmo8fAcc54yxMDg==@protonmail.internalid>
 <CAFEp6-0og=MJm-kZmTdTka7per6eHvfO8pR1k87NwGT0no-Ncg@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-0og=MJm-kZmTdTka7per6eHvfO8pR1k87NwGT0no-Ncg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57385-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8631834C298
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 22:48, Loic Poulain wrote:
> On Fri, Mar 27, 2026 at 11:37 PM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>> On 27/03/2026 21:33, Dmitry Baryshkov wrote:
>>>> Other drivers typically call the populate function at the end of the
>>>> probe function. In this case, however, it is invoked before the main
>>>> resources are enabled. I assume this is because the CSIPHY device
>>>> needs to be available early. Aside from that, it looks good to me.
>>> This becomes fragile. The CSI PHY might be built as a module, which
>>> might be loaded later.
>> Is it any more or less fragile than "simple-mfd" in a DT though ?
>> Krzysztof isn't very much in favour of simple-mfd so this method of
>> population is the alternative to hand.
>>
>> The CSIPHY driver uses devm_of_phy_get which handles deferred probe. If
>> the PHY module isn't loaded yet when CAMSS tries to get it, CAMSS gets
>> -EPROBE_DEFER and retries.
> What about relying on v4l2_async_nf_register() in the same way as for
> the sensors? That would allow both the sensors and the CSIPHY to be
> bound asynchronously when they are ready, assuming the CSIPHY driver
> registers a V4L2 subdevice...

The point of +	devm_of_platform_populate(dev); or simple-mfd is to allow 
all sub-devices to asynchronously probe wrt the existing camss node.

OPE, IPE, BPS, ICP, CSIPHY - for the case of CSIPHY CAMSS cares about a 
phandle but for the others it does not.

There's no bug here to solve that devm_of_phy_get() doesn't solve.

---
bod

