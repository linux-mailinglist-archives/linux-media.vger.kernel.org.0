Return-Path: <linux-media+bounces-66322-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t0LwBUonRmoZKwsAu9opvQ
	(envelope-from <linux-media+bounces-66322-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 10:54:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BF96F4FE9
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 10:54:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=xznNSid3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66322-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66322-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6115630059A2
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 08:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A1B42B31F;
	Thu,  2 Jul 2026 08:31:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD14642A79E
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 08:31:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981115; cv=none; b=hybUyH0oLmMXqyVgMoKpiDqkB6fcjYJRmDVrPQbT6ECZip2VFXNqd4CPX4FFl6EbiNp0wrjc3CfI+cFdGUpjMOIYgoWB/jDRUSCQJJ6mauJYNTBUQh5ZKcDDh+Vaxq3eRVpBUnuEfyDpAt8oSzwlMbJEvhFjdFKVeafzvdkYapM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981115; c=relaxed/simple;
	bh=SxEdWObSZbUYZ46vS/JBccmLuboyk8r+0BnZw9wrUVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQHSlYqMdkIKZEQv66PfnPb8VdXI6njrfJXxJcHdjf/BP00IdJDSrt/oVUc6ksQZkKrj5mzhU961W5zyaqd2ioYqbQxHIhNLsfLtjYuDUqMtPIl1Xg8NSrLwgDpoMwfejU663cgCVGWSQBDFrTNAQfaV+V3U2S2/tbJBDHM2qXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xznNSid3; arc=none smtp.client-ip=209.85.167.41
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aebf96bc89so299545e87.0
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 01:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782981111; x=1783585911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uyIInBymlHfz7VGDGtgQL8R4WXsM/iu4ZoItEUD8FE0=;
        b=xznNSid3qZdqU7P6bAKbpcOEZxAKn7KjZc4V13PhEH0U0EWnKFfY/ITq0as/wtKTrW
         aB5+63ertkdXpbV4PMl7/h9UxRITtFyK5i/rdSEFPvl/AXxI6lZ1nHDwPQ6QPT0qPzvg
         PFXgA3RKWq5FhXRDSK6ZsTgLu1jC2723te1fpkVGjEn8Xkn3Gq6Db08yFtJFfhz92DXO
         s0Nu470vVSoKjA8GSQVJMNlLRb8rgn8xK9/seajmpZlVB4tWNS6UHO4yt+E5BMPuEjPQ
         YcrvyAZGOF/hAKZHiYDfFl91Q6A4Hr1RIIhRlFAvx6ssRJ+4X3EK7QYaWqUjOO8jVAQx
         m+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981111; x=1783585911;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uyIInBymlHfz7VGDGtgQL8R4WXsM/iu4ZoItEUD8FE0=;
        b=Uaz1F2GhyrWgU/ulMgeHsEZDBiwaq0pM/ZcwmPWeoT2pDtZaYKB1ryk1w4xbYBjIYT
         ktzk4tAw6/5DiM/y9vMgUCFD8loSfAZvYRjbzSccxf78tiOnzRsNhPx6/5IzbolfwMTy
         Y32mt1y8UwmvHzTzwD/Hg+ltBA9+jBOeEH86IQmNEoUizaiCoQ5nBM8abu9ow0/x2MpP
         8vrBo4WueNgPzwVfi3LDnZhFWEkQLZm14lRdzVWevUIq3Z+JU8Fsu6tshFxpfLJ1iflA
         W/K4Eu18kVZ8KahlJDnNEU1hIpmX/0PqUL9NRywZMGClusIp3t3tyCNmlFhm5zRyYR6U
         OU+g==
X-Forwarded-Encrypted: i=1; AHgh+Rp7+EXjO/p8h6VpiQp+nGFXVRzCMuP7IsL2paI2cBtlfTcpEQ+CUDrGwK8OTaQklooXctGPYntoRul8Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYPgv8AqPdOwzC8tMBUy56gwhFLkvJxebeEf8Wc8Go3I2j2Ik5
	ys717Cc7SEmnBnjez1aWnhoKFp/TI1L6K9B12KsyhD2kZ5puKRUS+vHqjSXgEjGYF3Ai7uAC6uG
	mvt/Rb8E=
X-Gm-Gg: AfdE7ckVhwa4gYeME7i1BsdJiv4c6jc/Wouvd7UO1IfsAzF5RxkOqy46554+2F/GRIK
	lZpStfw57Geb2gacLaXBc/gNrt8O6+cfde+wQKoE8tm9Ju11DsaCbJ6AEjFI8STaeSuk/awVTHS
	0iabGQ1BAsh5zihV7JzsAs+cDUezesVUXDjI/RCe6PyGZF3j/iJh6BBNl4uI++IcG9TlGxnk4Fa
	ujdKpvk6tO3ekW15wAeYQuUzJrmOApEJhXS/AOV/jQxCKFxzhMVpnSd6JluoEsmN88NO9QZCExu
	XHVptJVF/SElvvkmrH5wkiXHoQCNWQIickOm1nb279v6ldW3ZXwRBSkIee2Eg5/7Lx8NzObvSe5
	C+5QdhJ0D16Qj94digG/oWEqXffxAQmxnunl0OVM7Ixi6ybAZwRqOJGedQz4CGyd++QJGhiGuSu
	eC2mfZthnzHGLBeQ9o7fzMvETVsH0zX0RtqWenEn/JrK5mQoiFRUOaa8MwqLqWyZDcguQ=
X-Received: by 2002:a05:6512:1319:b0:5ae:b6cf:2864 with SMTP id 2adb3069b0e04-5aec676a8f3mr825148e87.0.1782981110761;
        Thu, 02 Jul 2026 01:31:50 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec899171asm537377e87.16.2026.07.02.01.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:31:49 -0700 (PDT)
Message-ID: <1c583e24-09db-4d90-8f32-d3d3961188a0@linaro.org>
Date: Thu, 2 Jul 2026 11:31:42 +0300
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <6b6492a4-7610-4dce-a81c-8dc0387a4061@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66322-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3BF96F4FE9

On 7/2/26 03:08, Bryan O'Donoghue wrote:
> On 02/07/2026 00:37, Vladimir Zapolskiy wrote:
>>>
>>> Inserting bus-type into the PHY layer is borrowing from one domain
>>> linux-media and pushing the concept into PHYs.
>>
>> It's the other way around, "bus-type" is an endpoint property of media
>> devices, reference to video-interfaces.yaml to get more details about it.
>>
>>> phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's
>>> suggestion will specify the mode.
>>
>> This cell is just not needed, and unneeded complexity should not be added.
> 
> I'm going to stick to Rob's initial guidance on this.
> 
> https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/
> 

Sure, the discussion will be continued abouve v9 of the series, it's
just a chance to do it now. Rob properly pointed out, that the invented
"phy-type" is not needed at all.

Ther fact is that the whole placement of the CSIPHY to phy subsystem
looks execessive, since you add a driver for a media device, there will
be nothing PHY driver specific left in the CSIPHY driver but name.

-- 
Best wishes,
Vladimir

