Return-Path: <linux-media+bounces-66111-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3NdYNsHGQ2obhgoAu9opvQ
	(envelope-from <linux-media+bounces-66111-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:38:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D476E4ED5
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:38:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=HmQxxYiS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66111-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66111-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D34113137272
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 13:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C283368D68;
	Tue, 30 Jun 2026 13:32:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7113B282F02
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 13:32:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826335; cv=none; b=qqS+RL3yC/dvQPQiGZiSx4GTYHrWsbnfEjkPHSy2m4OR3OQuc6FpDjXUaBlTg+Y5U6Yz75EVdy0UkcRI7Hnu9DXo5rRXrIVYRHpDpzymeZpsYhZ0AkUERinaLHi3l1oHv8nVl3P07ZdVZdk//p1aJr5ET54vR+AAQjKFHhrZOk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826335; c=relaxed/simple;
	bh=xpPMmV2m6fv5jfNde38a5Ol4Pz7X2NWCQ/YN94erzc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQDbRTZl8oJ0NwBBd87gnxGkpjIraH3DdhN9HRqFvHYLsDygcGv32Bna++H4cCjz+Y7vqZYUBiT2dKQdbWES5imOgKXvM84e11JI80E50udu+FDkV32oElgB+F+O41NvisJaqzWjh5VwUTtC8sjKfWFTZtXlYSSS4YR65NXP81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmQxxYiS; arc=none smtp.client-ip=209.85.167.42
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb8cf8134so90828e87.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782826332; x=1783431132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3k0gXgFqIFH85+EiNZcDCFD94DA0SXlTQoMWB+Asgdc=;
        b=HmQxxYiSA9I3I84UF5tJvaZ9OzFJm6BEfoirCpUNuEjqlaLZlM1EAhsysznRY/m4mf
         PzqVTHZN+fr1oRqSWmDSEh5pQdW4qDQ82nLCyRnaix7onaiQ4J4OWXs+KxEtp5X/9xyj
         556m5Ptmthq5QQDsTPXQjqdvSD5n0EMF7UUsXxA78kqiKR+s926E+adgmi65GBIrjkrH
         yGheD0Hrkp0Fi7RznYdSQi1l+GK/WYvjcjxMHm53jM5GtuFmtnnGWB5saWSxbjni+JCz
         OXax9syPSHhl+TpNV6ZsAPNwhTUY3rIl4OpbHkPLoGNrbvTH/8LZcHDs4eZWFvyBnIlJ
         FCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826332; x=1783431132;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3k0gXgFqIFH85+EiNZcDCFD94DA0SXlTQoMWB+Asgdc=;
        b=moIg91o8svQhFChsprjTvzt/BThRdMqjAyQgpwnL9LFxEZGO8KeSytgqJEdxcFxrc2
         4ornhaFe87fuDCJwEqSV8glkBvawfOq17Os3kFH4DcFGcCoxDHru6LxEmfyJC9SlMkOv
         6Z7+FMsS1kPE2DG5bD/fJbKKXLq//CCGrqNWwk7Lgn3O3Q7gfIFw+wsBa7xzM2J34fef
         wGG2xNaDogVZCYt9h5hgkLogQdL25ejOabRzeigPa9AO/+xVrHNs9edIwWyYkeEQIl4n
         0WtQf2zEviZKSWTCjNqU8nt0H/xgaf3jJ/26ww+if2c5ZERPV+CFhV13leYkfpX7JNzx
         D/Vg==
X-Forwarded-Encrypted: i=1; AHgh+RogzEEh729GxUhNbArAir7175o3h8MES788+0wskMSbdlEfjrc01FuBDIUL7krjDG50LgbfQb4Gi6RpCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgVjwVWgLgp9cdmdfSolDEdzagJdFZ8XoqS2p1e2eRg7v1x8MF
	PRpVNAfifLYuKs5hRwD7qAQLCjuQOGKUrqNeoDyXu54xiD/zoioB4GRzo8iS/1Dfu0g=
X-Gm-Gg: AfdE7cmoPEySrtrmz9lru+qfddwEP5rc6ebLwblWl6UqeHFVcqv+PvpFKdzvf1+2J7t
	bq8C7j6cQXdof+BR6NSvtKj3Efq1mH9lD89W+CWjtiaU2QXgNeNYPlc1sVSpZmn760VdRcIU5yI
	KDGj120TdbCdapUjUh2+YYyamcYwwTvRCgui0eYM3+tvVW5Cd1crYA0kRIL7sS/KHP1tfNhldfh
	W26x+0KsIX1TZiihN0lpeu6e3xJdt2IL1WyJCiIgmr2HSMti2ol8Y8xBVG03u8piVE/1ueg230M
	1MmYOi065gKmW8+Hl7aUvoOQjfW57ruMn11sQykZqXqY4UKYcRuLVu7OnVoPFXIUMFfxDpKgffU
	DHzJsgWurcMuF0VvRTYyHPa95yc2OdrAwvosd/P3CRkf6tQZNV6uP3wemLij3ed3/WhDTdCpioM
	Cy8sdaucrsz4V58xi/655rlzrydIYDR8bDB/023hZkB6HsAHNVKmTxOalKn/kC2ErstdNYIOWPV
	4BWNg==
X-Received: by 2002:a05:6512:8396:b0:5ae:b9fd:a0b4 with SMTP id 2adb3069b0e04-5aebdbd8724mr438715e87.7.1782826331545;
        Tue, 30 Jun 2026 06:32:11 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe33ce5asm564051e87.21.2026.06.30.06.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:32:10 -0700 (PDT)
Message-ID: <0161b69d-62fb-46b8-a43a-df0c8af4956a@linaro.org>
Date: Tue, 30 Jun 2026 16:32:08 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
 <_zZ7OLAmvphzTdIURTW71m_LKDwA-DEQ-a40gIiLYSqgDrdOOEf1bElz53zTbmSaDoqc8PDFyQXa7bycFaSTXw==@protonmail.internalid>
 <569539db-b079-439a-bd05-cb97c30141c1@linaro.org>
 <fbc018f5-c025-4747-85f2-53b45b0f0496@nxsw.ie>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <fbc018f5-c025-4747-85f2-53b45b0f0496@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66111-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:bod.linux@nxsw.ie,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49D476E4ED5

On 6/30/26 16:19, Bryan O'Donoghue wrote:
> On 29/06/2026 14:38, Vladimir Zapolskiy wrote:
>>> +                interconnects =
>>> +                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
>>> +                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
>>> +                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
>>> +                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
>>> +                interconnect-names = "cpu-cfg",
>>> +                                     "hf-mnoc",
>>> +                                     "sf-mnoc",
>>> +                                     "icp-mnoc";
>> Since the proper option for describing this hardware is to have it as
>> a child device tree node of CAMSS device tree node, which should serve
>> or be percepted as a bus, it makes no sense to repeat and moreover rename
>> bus/parent's resources, here is the list:
>>
>> * "hf_axi", "sf_axi", "core_ahb", "cpas_ahb" and "cnoc_axi" clocks,
>> * Titan GDSC power domain and all four interconnects.
>>
>> Only "jpeg" clock and iommus are left specific to the hardware description
>> of this IP under CAMSS, right? Thus, it should be reflected like this in
>> the dt description as well, and the complexity of shared resource management
>> has to be done in the driver, which might be tedious unfortunately, but
>> certainly doable.
> 
> JPEG should be able to vote for its individual NoC / CamNoC dependencies
> / requirements.

There is no individual interconnects, JPEG interconnects are equal to
bus/parent CAMSS ones.

> 
> Both GDSCs and interconnects should be described in the sub-node.

Why to do it in each child, if GDSCs and interconnects are CAMSS bus/domain
specific? There is no acceptable explanation so far.

> There's no functional linkage between CAMSS/IFE and JPEG - they are
> peers within the CAMSS power-island. Over time we will migrate to

I do not refer to any "functional linkage".

> individual nodes for IFE CSID and these too will appear inside of the
> CAMSS "bus" -> JPEG etc should describe their nocs and power-domains
> individually.
> 
> camss@X{
> 	camnoc@{}
> 	csid@{
> 		interconnects = <gem_noc>, <cam_noc>;
> 	};
> 	jpeg@ {
> 		interconnects = <gem_noc>, <cam_noc>;
> 	};
> 	ife@ {
> 		interconnects = <gem_noc>, <cam_noc>;
> 	};
> };

It makes sense only if the lists of interconnects are different, this
is not the case.

-- 
Best wishes,
Vladimir

