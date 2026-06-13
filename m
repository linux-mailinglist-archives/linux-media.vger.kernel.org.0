Return-Path: <linux-media+bounces-64763-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z4roCshMLWrJegQAu9opvQ
	(envelope-from <linux-media+bounces-64763-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 14:27:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E667E872
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 14:27:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=AFhFseIC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64763-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64763-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A3213079AD6
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 12:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE0B3563C7;
	Sat, 13 Jun 2026 12:27:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4733B19B0
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 12:27:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781353644; cv=none; b=PNUPSLnJAom0A+Z3L4Czyc8gl9fWBAweiAcx/Ib0vvvB/0w94nvy9xV5YvE0rLJbh6ip5EJDAFAAsxYSorVpCd+Vzwt+jOaxExYLumJl8dcwZuqya2OXlL3flNHuWndmhuE6sIo7iaMmGsUX+imuGycnqYbW9WzSm2RqEnMg0Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781353644; c=relaxed/simple;
	bh=5q6l40SW5GCFqUD5KFtgslh4wXLEHyDhKFKwFuZnP2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ph+v4mYPMQu4D0xhJbwGAvqyzswSo+6Y2HX9ilFKPVp5MTB/ep74HEQbYIL9hWQXGDL/suQGKfjz9/nXuzpRpEOgJ2H0LE8tJ6aW7654lXfD0J9mAF4z8/NbhtPBokzwGGH/SnJypshHVsm5Mzu3l/Cxhv04D20OjwrVJhGmZOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AFhFseIC; arc=none smtp.client-ip=209.85.167.53
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa68da4e45so65805e87.2
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781353639; x=1781958439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lf6/s9VnK2HpT2bt2UhBhYgE68skc15jixFZftcr760=;
        b=AFhFseICsV8LGQRiuZBjqhkhL8lI7K9QbseuXcfT8rNXitrkxDSnVeONkvYMPd2hLh
         b9ur2Z7AP5Sk8enHjEGL2hPeonu1oiaWcz/+N+GUlODA7BYKYM3yW/bGea1DkWTFV3tv
         8OL4oy6MxBPpi+CRQHFwSXOZDyA9+bllrqgDDo5JzQvvhHjrK9R4IQflOTfOzyf9Pq/i
         ftUVg38UybI7MigXRBPO0vMqRKm2h5SUtywFbQYyu4OzcSVyDo+A7yL1ZLM8SQBpdFwD
         rus9lPXDoUPz+BliY3X3MKkpIZDlhrPYIbd1jJwYXydo09R2Y67cn/oSBtCGqMZ50wIz
         K7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781353639; x=1781958439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lf6/s9VnK2HpT2bt2UhBhYgE68skc15jixFZftcr760=;
        b=mB1YZZWPFM2yLXo2lJA83JkG4hV6FCGvH5l0SWKzr4CPOyPQzyQwdQd/0a61gno1yS
         OktlnubgU9CfHKmP7X1JG8zT5UcKK6ezXbXF3wjW83zIBcts3dOnYP/DO9LO2xgB+lng
         jMI3K7RIFkz8gx/uh2/hXY3JoZhN1fxRYjS1jmHZ8VQqhPKXCPYeEyeaIbuI0wQzDVTV
         HzHMgkBUwa2HihEesZRSf0AQulp6E+0L7u/Kjm1skOpnFBNCOSLnoRG8LbNW99Ac7iFW
         AyC3Dv+0fghGCkJvzB/58c3l7x419vbs4d+WsWzHk3Q57M9vZx7E1DL+NVwCPqS1Q68V
         jxaA==
X-Forwarded-Encrypted: i=1; AFNElJ9V0cqrsVzlJa4SsHGvhfYTrEJasAPp51l7uQ7ZGDBFz6cMy6mWUTETLqeTkxjrhtwR/HkI34ulm9LGdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywu0wfdTHc5hnjo0tfL56H4x+YZiBXdeC0uJhVCnffmabfVXtm
	g42JIPsoDII5CnquyUKO4f1YUaS4hNTYugfvzkR88ZYUAOH/MVo7ODjgqDAnWCfrSeI=
X-Gm-Gg: Acq92OHt5j/GaC/prvVChHpkqB6G/kFOeQyx05SAaFK2U5/o8duzegBYX/pIrGg+mkZ
	xduBLSiGMwH5ZT/cBs/km79IOPtjJRtg/IpANOc5RwK0idbscM1e2+2mEtaKyNm7HMmm6mJyDuw
	onqY0xfRwylen8/nUujCJCuTkCNfndY5d6e6DrDziKUvChKpYw9rSSv8vnQg0+g/Y/Djp71Hf67
	2sh4VGOrLemYv7y8teVKlhdc5XnIJGOmFwECTfgEva9R7TwozzzoIgNDZo9bNp/QDCP3dZkbapa
	7MMPP+babrtvchOuq4ChZPo/ehwqUlY4sjO0fW0o1jpZK1/Pzl+RJ4ObyD8qMJF3XEKw9aVeI3g
	or889LtdwgMR+Auy7Co6AS9fPKbNh7iyokrXL34z+JTMs+6eVhEn0gd8af2XFHQefdS2Wm72L/s
	k6OZXRIAq0+J4HYaRbqyNiX/9AqC85RZKoZtkm7v4e6TSyZNfZrb2jNIGinxr9yoGoZmlt9+Nxe
	qJwHw==
X-Received: by 2002:a05:6512:3994:b0:5aa:628b:5890 with SMTP id 2adb3069b0e04-5ad2db3a233mr780108e87.2.1781353638649;
        Sat, 13 Jun 2026 05:27:18 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1ae1f2sm1237452e87.61.2026.06.13.05.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 05:27:17 -0700 (PDT)
Message-ID: <dae9b1b5-5d3d-4201-b23d-5d02fb43547e@linaro.org>
Date: Sat, 13 Jun 2026 15:27:16 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: ov02a10: fix endpoint parsing
 use-after-free and error leak
To: Biren Pandya <birenpandya@gmail.com>, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
 dongchun.zhu@mediatek.com, stable@vger.kernel.org
References: <20260613112920.64617-1-birenpandya@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260613112920.64617-1-birenpandya@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64763-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:linux-media@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:dongchun.zhu@mediatek.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 835E667E872

On 6/13/26 14:29, Biren Pandya wrote:
> The ov02a10_check_hwcfg() function calls fwnode_handle_put(ep)
> immediately after allocating and parsing the endpoint. However, it
> subsequently calls fwnode_property_read_u32() using the same 'ep'
> handle, leading to a potential use-after-free.
> 
> Additionally, reading the optional 'ovti,mipi-clock-voltage' property
> used to overwrite the 'ret' variable. If the property was missing,
> 'ret' would become negative, and this failure code would be incorrectly
> returned at the end of the function, causing probe to fail entirely.
> 
> Fix the use-after-free by moving fwnode_handle_put(ep) to the end of
> the endpoint property reading block, and adding it to the error path of
> v4l2_fwnode_endpoint_alloc_parse().
> 
> Fix the error leak by avoiding assigning the result of
> fwnode_property_read_u32() to 'ret'.
> 
> Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

