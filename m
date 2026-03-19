Return-Path: <linux-media+bounces-56344-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMlXCKIOvGkirwIAu9opvQ
	(envelope-from <linux-media+bounces-56344-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:56:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7AF2CD461
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 560E3300D63B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 14:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57023DD509;
	Thu, 19 Mar 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OU+QOCS2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43223DB644
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932185; cv=none; b=QBcM9BnIl5kAm3eHsU3XMg0bQk6sy4hTvdFD3vSvl4u1UWRAjVkr2sOCNBsD4Nycy3WWWohkdAaNHjL85aaYaBCqWoaTLYd4nBO+bW+S5bGHTkiLo0JV5jaGI+/sxfRwXIwGiyUwRH4Tr/1+Ml7jz+WsibTQYnpHxNQBxu+YL00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932185; c=relaxed/simple;
	bh=gd7SCs27uyPu79nVL6/LCI+yIXMU2kzESBFAMZUgfLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTH8QT/upIwwBdvVUzrJuWDS9ZZPcp6TWgCwkrNkfGJqlnSBhg5Wf/odzpjwjP41+Rk/4xpawt5g0HUI3WzaqGzyITc2tMhOn8hrfn8D1F9RmcCsQzTbK+3hd0Ru8pRH3mxiJloLFNYWbnp96Na0bTBLbdz/OVB6nSVi4W1c25o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OU+QOCS2; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a2fb8ad36so1680381fa.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773932182; x=1774536982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFE8LLUUKG9iTuvDaB93WvqlPoGXC9p6rn4PhnM6x18=;
        b=OU+QOCS22gmyJtPUxAd2+gZZf8fRVP81YY929OBTR1/7TmKG+QnvpvK5vx0f7hA9hv
         GOcXrJ3H02NqKoDfh6e6xKYCrvW75SSP6QfRJLtH62ZPwgDyzw2eoDg8ClOK4YW1P0Az
         hR3gm/65Q4xp0NPKN8HhshunAgoC6d9xzd/3sCjCCEs49A3MzX3kDsHYnn8dbq6UltDs
         HUTyZXPg2zMmLSGEM1+Esf4BaW89RTp6GcPgxM+GPSGAwVH9DkoOgUE5c5IunV75l0sr
         mTJWFuE5jfd0+j+YJmQ+zIjztR7WK2TbLLa+CTPWMhpv2sDAvfpn4GycDJfs7j6kQvzQ
         x/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773932182; x=1774536982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFE8LLUUKG9iTuvDaB93WvqlPoGXC9p6rn4PhnM6x18=;
        b=CieDq25S5RIH72jmY0hrOpDAclxK9oveqI5ascLK7MsCSi1462RRNB/OB61hNYc5kJ
         tVn1xu69GVbjSGijORw5fbkQk/4qd1uE0gAsKRpk1NRVnB7HqluXDgej8xJrdKfnRM3l
         PQlt1Nxc8fty+4dVPYCp5U2+NVDzjr9QAmlpvBwoSTD9UFGY1O5yJ1L4yLyn8FxWzSY3
         BykpCrYUOrnkFetHHClLaaZbxXoe9ECzdDn5HDspENuqyaMuOPQFBKwEFQPK+aORRC+G
         okvw+Bu5jplBKR6KlY1GSs+2tPn7d1cmGjepMusRrCG/kWZaesLqqbpGc/j+VZrtiVdr
         kz+g==
X-Forwarded-Encrypted: i=1; AJvYcCV3GKVP1BAZgvOScbcr/VjmKvLFfzsllF4GXEqyTpoYPqnTUgJxgGK9y05rliXDHraON5Gk+JjmtAiPcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPJwG3LIVaXiL0BQO/eRUqmIFtw8kbQhKwZgy2HZRlC+9VoTSF
	hdEgkr0RYq4rkOiaJIj1PFtNEgFbtw25LVOtczmq2h78zbLdw4VV8uyEYx/Zim3ZmwQ=
X-Gm-Gg: ATEYQzy752PFRfKMXsA7Xi2+vUTEvF7a+SGGn+aVnKF1vx5pgXHP7ANP2RGiNye4nO/
	dUeoTYGpBbyABBUmSNtuZ+Ro08NJxSZW7/yvsmS/G/T+bIO7YwJiG8C/Xb6Ymg5EgKTDl8HROOX
	zP980MtTi8xMGNc64FO7OnZ7Xp8nhry/rfItGBEhl74H1aU9gVtt8sZDr6q+WOfKtVI3DsEUxWV
	0AzK7dYmVXihudYm0JdyUuWtmSFCIbaaW+hcVKfFBbNIjjBsCMNm/Ag1WWseiBZ08WNX4bSpPCa
	TgKHEX9fErIaLQSUlN7TbEabM+wDSkjSodBfHarBptb/eTcjXTa2ykqWqi/1B6jsAhL6gg3EUxp
	HQ6BpDBupwKuEuLJsPfqsBigiyP6+295WKMbkR3uh7NNXbLId1Jud3ddtulvvuxRvKJPpT/o3K8
	UW4t/LwRvlP0O20YmhmIvh69ww/K+q6dYQxpl1FNWGZUWhk+EevaFnNWPtq9zp3YsKgrO1V+dJ0
	DHZag==
X-Received: by 2002:a05:6512:3b82:b0:5a2:7c19:414f with SMTP id 2adb3069b0e04-5a27c1941bfmr1196514e87.3.1773932181770;
        Thu, 19 Mar 2026 07:56:21 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2be56sm1230577e87.19.2026.03.19.07.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:56:21 -0700 (PDT)
Message-ID: <d6616fc0-75fb-47e2-96cd-ae81fa1a8e82@linaro.org>
Date: Thu, 19 Mar 2026 16:56:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bod@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
 <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
 <ulenfus552ggobis4gmi7eh27tikdaxbgm2oj63b5l2vemlfxc@ib5f2xaqurj6>
 <26XTdUyQTB41Oc4D5HnMtSm_QpZRjlkljQRJVw-u1Zp3Ltn9s4LVU-LQkP6drdl3Z3GGssLCCbsVYPFEqssHcQ==@protonmail.internalid>
 <65e06b2e-eeb9-45af-97ac-4ae60f652361@linaro.org>
 <9578400d-30ac-4d8c-9295-ee4ec8af3b2c@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <9578400d-30ac-4d8c-9295-ee4ec8af3b2c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56344-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 8E7AF2CD461
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 15:17, Bryan O'Donoghue wrote:
> On 19/03/2026 13:08, Vladimir Zapolskiy wrote:
>>> Why do you want a media driver? Isn't PHY driver enough?
>>>
>> As for today CAMSS CSIPHY are already media devices, and a user applies media
>> specific properties to them, for instance media bus format, resolution etc.
>> Technically this might be removed from CAMSS, but if so, then it should be
>> done before this new PHY driver model is applied.
>>
>> --
>> Best wishes,
> 
> There's no reason to remove that from CAMSS - it would be an ABI break
> in user-space anyway.

If technically CAMSS CSIPHY could be excluded from the list of CAMSS media
subdevices, then for the sake of simplification it should be done for all
supported platforms in advance, such a change will be independent from this
particular phy series, and vice versa, this CAMSS only driver change will
prepare a ground for media-less CAMSS CSIPHY device drivers, hence it shall
precede this particular CAMSS CSIPHY series.

For backward compatibility with userspace a noop stub will be good enough,
it's not an issue at all.

> The media entity in CAMSS msm_csiphyX handles format negotiation and
> pipeline routing. The PHY driver handles electrical configuration. They
> don't conflict and there multiple cited examples of this upstream already.
> 

-- 
Best wishes,
Vladimir

