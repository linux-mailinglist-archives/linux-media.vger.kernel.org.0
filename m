Return-Path: <linux-media+bounces-59858-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIa0Cii68GmFXwEAu9opvQ
	(envelope-from <linux-media+bounces-59858-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:46:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F8B486310
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71C7C3384990
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0103044BCAE;
	Tue, 28 Apr 2026 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQCh+V7X"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5348044BCBE;
	Tue, 28 Apr 2026 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383413; cv=none; b=s0q+YgcpnhQkEAMPkQ9CRjTD9eS0bfs5NMZY2AEsYF3x7X+FoAboC+MrS+i2qT5B/YBA1IjH6YQdSsK6FVrRFJaDE29O+7h3WKua4usYxND5+WO4CIzf7OFvyRNhFewX0qLA7zzDFV8SHKvBulIWQqINoEVHMR2Y8XvTkFxqw3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383413; c=relaxed/simple;
	bh=SV/abDQ9GHMF1r7JuRQf6ccezy9MHlopkSctJDFMcm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lsBRdu2EFu4uRLs1qXusGK7Rad0ivK1niV3dZ3NdBfIDKT5S8kIDXK/SRN/VwrxzQ6c3nLEuSmaHt99oPovV3cGl0hCvShYvha83TUxN4O29whrP7OhxSZgRyYHdLPvwttbHxsMy1ved12kWBzXczCOHL6gj8CLw3mzg3I6a+is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQCh+V7X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD15C2BCAF;
	Tue, 28 Apr 2026 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777383413;
	bh=SV/abDQ9GHMF1r7JuRQf6ccezy9MHlopkSctJDFMcm0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TQCh+V7XkKalFjhqFLnZNoiER1cm/2IHx7i6qSIQhKboGz5cU13NVK2zoPg1a3Kgb
	 rs2jpke3ulloLBQX+zWbcGmjrmRsQLZ1w6M0GpeyMWWfTrqHcX3r/oTMJQq5dUfzU+
	 06ZCug4Hh5myP99JcCzJmdFYixP1RX+MS2ekstaMvfVq0rqWolWC2TfQYJUjav88Rx
	 yXduw3391pgOvi4qnylT1CfZLoIWNA/b+1kXJfpwBm60Xtb1efuJiDCnwfWVATXvbe
	 Q7iFO2tjk2MwkH6gYZRCW1TrP9h/h9JOJhvFDK+G/mZ5wqBD/s8/3SyasoxJwCslF6
	 SzEZkfZkXLOtg==
Message-ID: <2846fc60-bf8c-43b3-ae64-58faad6aed2f@kernel.org>
Date: Tue, 28 Apr 2026 14:36:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 04/11] arm64: dts: qcom: msm8939: Add venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <Xfiq_WNTU9P-ThZLMs4plWE5hwtmwyVyKJc1bD5BKdhERGouucNpyuenIoKQiKfZKaRzP-PdamsNlQ8vezjrRg==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-4-288195bb7917@gmail.com>
 <56d609dd-62be-47eb-8ba3-c5d70d773113@kernel.org>
 <QRkqY_zK7EC4e0ZMoLVyLUhgI9A5RrBcJLm22d69xKT17HzJMXsEDdz_qodBN9qogvuS1XqN4zdemqcoByY5CA==@protonmail.internalid>
 <34627be5-75cc-469b-af23-f1f08ce29820@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <34627be5-75cc-469b-af23-f1f08ce29820@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C1F8B486310
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59858-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,apitzsch.eu,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pastebin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 28/04/2026 10:47, Erikas Bitovtas wrote:
> 
> 
> On 4/28/26 10:10 AM, Bryan O'Donoghue wrote:
>> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>>> +            video-decoder {
>>> +                compatible = "venus-decoder";
>>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>>> +                clock-names = "core0", "core1";
>>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>>> +                        <&gcc VENUS_CORE1_GDSC>;
>>> +                power-domain-names = "core0", "core1";
>>> +            };
>>> +
>>> +            video-encoder {
>>> +                compatible = "venus-encoder";
>>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>>> +                clock-names = "core0", "core1";
>>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>>> +                        <&gcc VENUS_CORE1_GDSC>;
>>> +                power-domain-names = "core0", "core1";
>>> +            };
>>
>> So to be fair in this case you do have a reason to have an encoder and
>> decoder compatible here _but_ it should be the case that one one of the
>> sub-devices contains CORE0 related stuff and the other CORE1 related stuff.
>>
>> Because in that case the sub-devices actually represent individual
>> hardware settings.
>>
>> So listing power-domains and clocks for both cores in each node like
>> this militates against that.
>>
>> The other thing is to double check of the encoder and decoder are inter-
>> changable here i.e. can either core be encoder or decoder or is it fixed ?
>>
>> I believe on older generations - perhaps not on 8939 it is not
>> interchangable.
>>
> I found this in LA.BR.1.2.9.1_rb1.5:
> https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
> Only decoder bits are being set in bus configs. This suggests that the
> cores are not interchangeable.
> Then again, I never managed to get encoding working on MSM8939. Testing
> it with
> gst-launch-1.0 videotestsrc ! videoconvert ! v4l2vp8enc ! queue !
> v4l2vp8dec ! xvimagesink
> Fails with the following log: https://pastebin.com/nmZcLgPV
> And in dmesg it reports a firmware error:
> [  784.461031] qcom-venus 1d00000.video-codec: no valid instance(pkt
> session_id:dead, pkt:21001)
> [  784.461126] qcom-venus-decoder 1d00000.video-codec:video-decoder:
> dec: event session error 0
> [  784.461200] qcom-venus-encoder 1d00000.video-codec:video-encoder:
> enc: event session error 0
> [  784.468799] qcom-venus 1d00000.video-codec: SFR message from FW:
> QC_IMAGE_VERSION_STRING=VIDEO.VE.1.8-00099, Err_Fatal -
> Z:\b\venus\utils\src\vbuffer.c:1319:
> [  785.791641] qcom-venus 1d00000.video-codec: System error has
> occurred, recovery failed to init HFI
> [  787.018339] qcom-venus 1d00000.video-codec: System error has
> occurred, recovery failed to init HFI
> [  787.097253] qcom-venus 1d00000.video-codec: system error has occurred
> (recovered)
> This happens regardless of whether I enable the cores for encoding too
> or not. The same errors were happening on MSM8916 as well. So I can't
> tell if these cores are interchangeable just by testing.

Right so if you swap around the definition of which core is encoder and 
which decoder do you get the same or different result ?

i.e. is it because you are trying to get encoder running generally or 
because of the core you are doing it on ?

How about declaring both cores a decoder ?

---
bod

