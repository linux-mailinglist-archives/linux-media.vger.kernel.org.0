Return-Path: <linux-media+bounces-63325-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IANQFKTrHWp0fwkAu9opvQ
	(envelope-from <linux-media+bounces-63325-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:29:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD34162518D
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E83EC302A7D6
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 20:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911303F4DC1;
	Mon,  1 Jun 2026 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jSX1zweN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC1538BF76
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 20:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345758; cv=none; b=V5emeAdeIqoF28DfqBMlpe8wR0ks5xmBZ/XrRQvPSJ35GvDnC+3cZbyJ1k7/hX1XcCamLrS0WQPLn38ZJLpVRedFnsSEtj6RBlmZPRZtcwmE5vL0MiEQhU/+0/8Ma/8LNm+qfyFTDImqmCq2AlNrcuMd2Y7PMNzKytWazKpiBOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345758; c=relaxed/simple;
	bh=fqT6LZZWvvuCiVxgMDtlsXYgUKBFR0XwxahTM1RHgnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uSt6jYiu2XaFkQyafPJC3uLI1fguW7xYnpYtZyEdE575vnHn502pA/JAJ9IrKTMAGPTG2fkSLH26MeW7/pR4dg5oJwdxB3LA3mZwsTrLjJtg28jOBl+ZUbYpI2KKKuncEyx2fHeSal5Iwf/mpWFpZ4EXUpW+q6XJRpFrUH6TcRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jSX1zweN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so94816655e9.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 13:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780345755; x=1780950555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FuBG5thkiczhmSMU1mytIPUE9n1pNCrGrOz79kkF6lo=;
        b=jSX1zweNlgE4yP4XzxPGGUA5cVUVYGI9HeZQWYmZEI1ehBOEE/lqpmPOJvKhx4ypeU
         3mc79TQkbNIQ87JboSL343OlZ8nLCOt4yNR1lFKb0/77DN8j14oKjSjI2knTtxyMXe18
         8rsXaDIg+g0pI04Hmy9C9Tr5hjX1705expWHbCYLKHzE8SrI0d2gHKR+sIATd7+wSJHi
         4yA1h8EEOVirGi1KJbYQXy9Xn68fZ3eStRbeEt47UJBOp8AbSkp7mlTsa3pNFhvP88FD
         X3xPyKYqT9/1+yQKbQLYxQbbSVI+CYMYiP+8QJMPEu2+utGG49pTVFx6dqgEpBUY8FNZ
         GYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780345755; x=1780950555;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuBG5thkiczhmSMU1mytIPUE9n1pNCrGrOz79kkF6lo=;
        b=Q5i+0XZjsUOkDvP6LpeGxUi3TYPfx+QM1dduF/Yibuj2EqZ5bgcK/StPgv94IAAHUK
         txJ7V0fse+qUSSGHjqkbnJ3pjiKxtyPtP/SICQ57mP1RXwwI0n4NemXCSQKD62uh/cX6
         q6w2LAmDBRQqZ4gy4FSvXtdPCV+9igKK9H9iaR5nVItRJHzgKlXzhDKpHmdo4AcH3QKC
         Vo8F6kXVbUGALZocEH3wZ14uA3o/6PsWBFtP8mqoLzhDWxVJQhXy3jvVInoRbKej7K76
         iSw35J/DcXm1deFBlYmXr39kQuR2hzYkm8JRZhx+KnwPDSX2FNvFmm7WdJVwQJ17/NT1
         XXHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GbDR7Tcwt2yquLPT6nyxDQ6RrL82qfLmVItYBvtC1zIimzkeUQMqV7fE6+p6H+fuA/H4wnN7IOCi+9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtlksChSU5K+qoKsaiIzhuEV/Nr6XrK0SJOkpVzSq3X6szb07b
	DAymMVCkfleExsHQ8ZKVsL/7tAc6jTTJ0mqEqU3/5WxdPlq3Xn0OTlzhl7miAHbGRD4=
X-Gm-Gg: Acq92OGLhpUGLC5gPKw5kC3hIANuOQaDw2DSRBe9PV7tEHmQSd11Gp8G7AZNmTjJxcB
	g1mQU30bzu5nUJhCNhp+huJxj1wXjH40gvxNdqZTIQu12/qBcHXP636ELX4t3SlbkhTUaAw9G+u
	1/yskn1+4mhBaRkpC4wx8TH0gGyusWKICab+wfes8jZI7f+BbYk0f5J83cpiB5EpXjYBu1RObsD
	UbZrH9UfwOmIB1BGOMO9Jr8RS5c7sGJCRjTZ9rGdHUFrBjshjr6k43AlYOnTp0mbAF2D26Wq+a4
	89r6ctm49PLSVXCL3H1rxI+hKB4Wzrm6+lVwbAYFcoQ8wNj97+LEobMvOyUqKfOeAiRpn+hcUzB
	ZWlrluJ7l5Zx720lLMnj+UnyhhIYxyNg5IL4RUZt9EHqBnubhY/r2hamzaRiuP7hQEYt3YK+4rn
	czyGvsFzBPZkg8+mRIOGCT7AiW8Zz1vRHLKJ8NS6OHCYwf2A==
X-Received: by 2002:a05:600c:1c0a:b0:490:5074:651e with SMTP id 5b1f17b1804b1-490a2940746mr237991485e9.25.1780345755113;
        Mon, 01 Jun 2026 13:29:15 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b18cf3f9sm1530325e9.21.2026.06.01.13.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 13:29:14 -0700 (PDT)
Message-ID: <2768617d-e031-441b-be05-a6c8efa6615c@linaro.org>
Date: Mon, 1 Jun 2026 21:29:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: csid: Consolidate
 CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 hangxiang.ma@oss.qualcomm.com, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260601-camss-macro-v1-1-cabf1fb99241@oss.qualcomm.com>
 <CAFEp6-3a_ZRvCBiATwT594KOMH3DOMoQA_=qj0WW7iiZHTWABw@mail.gmail.com>
 <ac381274-f50c-4db4-9e4f-436d1d3cdbb6@oss.qualcomm.com>
 <215786e4-e85c-4af0-9993-5c6331c87817@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <215786e4-e85c-4af0-9993-5c6331c87817@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-63325-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: AD34162518D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 19:22, Vijay Kumar Tumati wrote:
> Hi Hangxiang,
> 
> On 6/1/2026 8:13 AM, hangxiang.ma@oss.qualcomm.com wrote:
>> On 6/1/26 11:04 PM, Loic Poulain <loic.poulain@oss.qualcomm.com> wrote:
>>> On Mon, Jun 1, 2026 at 4:44 PM Hangxiang Ma
>>> <hangxiang.ma@oss.qualcomm.com> wrote:
>>> >
>>> > Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
>>> > camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
>>> > header. This eliminates redundancy and makes the constant available
>>> > to future CSID implementations.
>>>
>>> Taking that direction, I don’t think this is the only instance of
>>> redundancy, so why single out this one in particular? Should we
>>> consider one-line cleanups across all similar cases? Also, other CSID
>>> drivers follow the same pattern but use different identifiers for that
>>> define (e.g. csid-340).
>>>
>>> Also, introducing such low-level, register-aligned naming
>>> (CSI2_RX_CFG0_PHY...)  in what is supposed to be a generic
>>> CSID header doesn’t seem appropriate.
>>>
>>> Regards,
>>> Loic
>>>
>>>
>>>
>>> >
>>> > Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> > ---
>>> > Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
>>> > camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
>>> > header. This eliminates redundancy and makes the constant available
>>> > to future CSID implementations.
>>> > ---
>>> >   drivers/media/platform/qcom/camss/camss-csid-680.c  | 1 -
>>> >   drivers/media/platform/qcom/camss/camss-csid-gen3.c | 1 -
>>> >   drivers/media/platform/qcom/camss/camss-csid.h      | 2 ++
>>> >   3 files changed, 2 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/ 
>>> drivers/media/platform/qcom/camss/camss-csid-680.c
>>> > index 345a67c8fb94..bf7164085ddb 100644
>>> > --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
>>> > +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
>>> > @@ -101,7 +101,6 @@
>>> >   #define CSI2_RX_CFG0_DL2_INPUT_SEL                      12
>>> >   #define CSI2_RX_CFG0_DL3_INPUT_SEL                      16
>>> >   #define CSI2_RX_CFG0_PHY_NUM_SEL                        20
>>> > -#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX                   1
>>> >   #define CSI2_RX_CFG0_PHY_TYPE_SEL                       24
>>> >   #define CSI2_RX_CFG0_TPG_MUX_EN                         BIT(27)
>>> >   #define CSI2_RX_CFG0_TPG_MUX_SEL                        
>>> GENMASK(29, 28)
>>> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/ 
>>> drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>> > index 0fdbf75fb27d..da9458cd178b 100644
>>> > --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>> > +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>> > @@ -105,7 +105,6 @@
>>> >   #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)     
>>> (csid_is_lite(csid) && IS_CSID_690(csid) ?\
>>> >                                                          (0x34C + 
>>> 0x100 * (rdi)) :\
>>> >                                                          (0x54C + 
>>> 0x100 * (rdi)))
>>> > -#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX  1
>>> >
>>> >   static void __csid_configure_rx(struct csid_device *csid,
>>> >                                  struct csid_phy_config *phy, int vc)
>>> > diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/ 
>>> drivers/media/platform/qcom/camss/camss-csid.h
>>> > index 5296b10f6bac..059ac94ad1be 100644
>>> > --- a/drivers/media/platform/qcom/camss/camss-csid.h
>>> > +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>>> > @@ -27,6 +27,8 @@
>>> >   /* CSID hardware can demultiplex up to 4 outputs */
>>> >   #define MSM_CSID_MAX_SRC_STREAMS       4
>>> >
>>> > +/* CSIPHY to hardware PHY selector mapping */
>>> > +#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX 1
>>> >   #define CSID_RESET_TIMEOUT_MS 500
>>> >
>>> >   enum csid_testgen_mode {
>>> >
>>> > ---
>>> > base-commit: 697a0e31ee66f5ddb929c09895139779fff33f20
>>> > change-id: 20260601-camss-macro-3d40c4d4e90d
>>> >
>>> > Best regards,
>>> > --
>>> > Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> >
>>>
>> Thanks Loic, Bryan pointed this out in last review cycle and suggested 
>> to split it as a standalone series. This idea comes from KNP series as 
>> I was once suggested to move this macro into one common header to 
>> remove redundancy. I think your are correct after fully consideration. 
>> I will make changes only for KNP and put it in driver.
>>
>> Best regards,
>> Hangxiang
>>
> So this patch is not necessary any more, is it? If there is anything 
> specifically to be done to withdraw this, just for it to be clear to 
> Bryan, can you please?
> 
> Thanks,
> Vijay.
> 

I don't like endlessly redefining the same things over and over again. 
Its wasteful and error prone.

Burying it in camss-csid yes I agree is not appropriate - however for 
specific classes of silicon - it is entirely appropriate.

That surely is the entire point of naming things gen2, gen3, gen4 etc 
instead of silicon-version-x

Hence camss-csid-genX.h for sharing generation specific things.

---
bod

