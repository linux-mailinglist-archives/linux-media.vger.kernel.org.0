Return-Path: <linux-media+bounces-57821-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKVqG+Y+zGm+RgYAu9opvQ
	(envelope-from <linux-media+bounces-57821-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 23:38:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2B737202C
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 23:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5812C3028738
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137004534A2;
	Tue, 31 Mar 2026 21:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NwYRp2iR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2076C44B67E
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 21:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993038; cv=none; b=CvuDPB0Wsy+3aacSd7rsCecvIPbU1HMEDEaloJV5d1YLhFjv0M8w8Xt6NKcIhxmEbJ4hnmYlsEde98+FCZ+dN7ewJzIJ+h42QP/VzSL7UJxY7HW9E/tFzCQsCVh5J13Nn8ugf55q51yyzmSEeV28X5Ngveh1VBUHHLLMedAO8OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993038; c=relaxed/simple;
	bh=77TKJXfDqxRbDJZcS4iQHfQ8ePzfWbiSwaDIcMZRDug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gz18RCePLD9K5mDA9Xkdwga4sQfhFija3WP3mzATSRhp+fFoc+RSmE9pCp0QMmr1bMdgFSl9hT6AYtcglC4ZsTQTsSVhuXepBcWhXFhMjWsi1zTgx19CuFhO5o1IKnjUpIgKKO3//W9VhiwDzGphQiRcMAFDm3RxBgpIQfJM9rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NwYRp2iR; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2c1b09d69so52894e87.2
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 14:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774993035; x=1775597835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHUi+YrE+mS2lDKmIKKoK4NA/mtXRLEN2zW5bJXcYuk=;
        b=NwYRp2iRxPPx8fvTfwe0/Bp9h9kSs1CCF1G2mfCPegUPc8pWgatU+ffGKa9dT/6Pi5
         0h9a5fuAppZYQLmujL8LjF16ErqGiOs5pXwzP5nU+lwnmTtVQwGKTVjyouPQ1774Vx7z
         f1bq06Y9Aw2XzbKYsWR1N7tCNQL+ETTk2tD6s55UwFYTGV2rvyES4eaG2wrTFMKFcgvm
         hoYjmzhrwyaCOq0KPdRFme/9ciAH1YqzcYxpFsV8A3dFxNLf1rXUTHe3nmhsVgXdWL7L
         POV8H7IMAnWS1eCQExEtZjh0UpO7oyf6/CmDofzzyhtOGL8JKV6XBIm73YnthF8OJFFl
         i4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774993035; x=1775597835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KHUi+YrE+mS2lDKmIKKoK4NA/mtXRLEN2zW5bJXcYuk=;
        b=AGEogCcwT19Sc9o6ZVqxbKp+T29YVuT3/BT2H6dP5dhplwlxyzupcq3z2F9QTQeEOw
         oKZRK+9fXscPch13y1G4UWVS5TQmOClG2Vha8ruxyq3JEIJfSYF2nqabb3tJBWQZGqyP
         jUo4/zIBEo/Q5AhSRanHUoG59OZ3AMXu2cLvObYhPBFxsCU+S9K11UFQ4pz7rbyOOsXU
         hxvzahE8twfQE/LopJWmwyuOfQ8iBSGihDH0eSIp8d/Lg94gAK/ELputlsLSoElU+o9z
         pEjmBmfeE/kRmTnYIyNvW+lle1Hypb3wLi9DE9Ar3UDa8NFBIqQ5lHVI/EIl20rzSLKg
         ef3w==
X-Forwarded-Encrypted: i=1; AJvYcCVRvISaX5UWwY6dKt8Zs3cRxs3sLCbgFjsxCodVB4MzYJHsiYBGEieAXRi4S3prcXBo1saruBsWilUacA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz3vGONE4ULv9rvIbSz74moC0rQzTf36otHhP6wYcplQ1/+3nh
	D4XG562B8FMGbNwE7jA8gsDxzd18zxXy/NvrfijWF7ECYHWEBTeZLLgFQJgTtBe+bS0=
X-Gm-Gg: ATEYQzwvpaIXCZh3k5zTGEU9RC4lXi2uIcAfGcbAb8NXPmoUah06hqr6+KcUmkdigTf
	CPpvjkRJIaVNv27dNBjzYnMnIr1ETWW9MjJAwbsR1NUpG8ZUcQcOec/hYBAjXXTcEXSqArerm9M
	bWJDvaHiMUZ38PO4kl7/j57kFYh+cyY8gHUyn+MoEZRZ2NbIfn7ED+xoNqY2k7Fi+HND22p8l+r
	v9LI92W4rqzVdymMN05a5PUQr7WYgY7tHVNNtGyiMgozJOqYeCY9kGCkdIAJR10sBhUvPW26t7D
	faZeCyg/8fy5ARf8a0xrBLOgDKoWtHlNo0P0NvWQOTMs+h72duTFL2W9bu2k1tEIW6YM723c9/O
	AJhnC7jtCPiCuMI/qn49T/Ww6zyT8zYK04L3Czb+UBUuoPD0JTehZyu4pjLU1OvyjK4z9987zMw
	sKyLb9TXpXZgGIfp29X+3A4EsxcZbjHVqOnIR88tpaosDgb9df09OGuqifqoTyvJTiVV+h5+GUr
	fyjNeU+hCC1ZMBK
X-Received: by 2002:a05:6512:1091:b0:5a1:3d15:287b with SMTP id 2adb3069b0e04-5a2c1c98cc5mr165782e87.0.1774993035132;
        Tue, 31 Mar 2026 14:37:15 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83890bbcsm25187391fa.25.2026.03.31.14.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:37:14 -0700 (PDT)
Message-ID: <3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org>
Date: Wed, 1 Apr 2026 00:37:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/7] media: i2c: imx355: Restrict data lanes to 4
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-5-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260217002738.133534-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57821-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.944];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid,intel.com:email]
X-Rspamd-Queue-Id: 0E2B737202C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/17/26 02:27, Richard Acayan wrote:
> The IMX355 sensor driver currently supports having 4 data lanes. There
> can't be more or less, so check if the firmware specifies 4 lanes.

Does IMX355 sensor hardware support any other number of lanes?

1) If no, then it makes no practical sense to check for data lanes number
given by firmware, there can be any stored value, but it's known that the
number of sensor data lanes is 4.

2) If yes, then please return to the sensor dt bindings, and reflect any
other options, right now it is set strictly to 4 lanes only. In case if
'data-lanes' property is omitted, you can use 4 lanes as a default number
of data lanes, and this information shall be documented in the dt bindings.

> 
> Existing ACPI hardware descriptions may not have the data lanes defined
> so this check also accepts a placeholder of 0 lanes.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Link: https://lore.kernel.org/r/aW3uFcT1zmiF4GUP@kekkonen.localdomain
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   drivers/media/i2c/imx355.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 9ca87488c933..0d6aabea7d59 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -66,6 +66,9 @@
>   #define IMX355_EXT_CLK			19200000
>   #define IMX355_LINK_FREQ_INDEX		0
>   
> +/* number of data lanes */
> +#define IMX355_DATA_LANES		4
> +
>   struct imx355_reg {
>   	u16 address;
>   	u8 val;
> @@ -1705,6 +1708,10 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
>   	if (!cfg)
>   		goto out_err;
>   
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 0
> +	 && bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
> +		goto out_err;
> +
>   	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
>   				       bus_cfg.nr_of_link_frequencies,
>   				       link_freq_menu_items,

-- 
Best wishes,
Vladimir

