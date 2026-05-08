Return-Path: <linux-media+bounces-60890-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CfiERaC/WnSfAAAu9opvQ
	(envelope-from <linux-media+bounces-60890-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 08:26:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D83934F2731
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 08:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8580A3022041
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 06:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E755537880B;
	Fri,  8 May 2026 06:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkiq76oJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685923793A2
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221561; cv=none; b=g7tctOHswB83grdnREasfrFwVxmP7Zuz4aaBh6OqTkeK39SM2nJZDF0ZNUeQBXxFIL8SH92lx2CeQ9TfV6Ti2Kvt3hnYHtJwG9BI2M5VmJWfdqWf/siCek8SVHB1HD5A3WkVPXlsXZHWhfiYpARrlZPrkIwcbS568BTLAlJfsHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221561; c=relaxed/simple;
	bh=cv5ZQ7RDUoTrqLqP4/sBLtA2dmTug073X/Xz8LbRrwI=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:
	 In-Reply-To:Content-Type; b=ta51L0RBj+Ur+LeSzb3Ge1fbeVPbcYNXmmyp/mNlouePtDxFS7UPfUcF3dl8j7OreJGCUWKotPBw2v2rAZc10riGRbnBWZrsHSKa7VfcIlufADyXcPukpaPiONy2ieeYK/g2cciNHsiJF52LY5OXoCNUCr9ZcXm/0ca5O2vvx6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkiq76oJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso9898175e9.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 23:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778221552; x=1778826352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q0B0EAR1P+R7f8BwrSFh3If6GSNF4WFFP1Xr/m/6H0Q=;
        b=hkiq76oJztIKKHP2vyTjA7A3tBvPKI5flwnsmFPr/a23dvqBfOMwXF6DZ+D2vD3ZNJ
         kSSi/w437REiHDFq1pc8nqEG9rB+r3BtpZXVBJD2KAUG2W4zrbsk6+XLN8mVm4wK1kmJ
         C2h+fS71dwDBIJL/3UQu1jY08esc7H5QNeGNG6SbVeZC+bM3RAXZH3/JIzaOdOgG6adf
         axgu6haPu0sIpgA69HLDdEN3WmmSQlKMNuISie/mkOKk8t18wntVicAyS8eQFh5Q3Qtb
         XN1kQVajkpVGHpgRlM3zZdGHhy4n2895PnVTkrh6MY7itygfwsJtRixTYC88VQmwvSXO
         4pTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221552; x=1778826352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0B0EAR1P+R7f8BwrSFh3If6GSNF4WFFP1Xr/m/6H0Q=;
        b=nvsDOR4kwsZzV/OUnTHNJdpSyBTJfX7k6i7kw8ojaSfTiuyh189iaV/Gh9zGpEW3Tn
         NexuhM1hfA5YD8ZjdEYjt8CJoId1xyQb9oCZP/qEWQQ1q8Efp2O/dZWZX1g0XRiMaTK6
         dRDCELVE2WLwqJfP3aCzCAlDj5C/jrezkMXiaiTusFVzrRN3uc1bFtas8r4fphix2T1n
         jDdnmsCN9dRdVoMQR41y1jqftb6vKyyUmOsi7okn4q10gbHw+x2v0WFj6UD04SxjP5ZR
         xxizTjJXqNJ2nlbSfLk64n8HKje7SP7jsAWGYpYCy6VDpO+4XHrEL51bLTX9os5gUYKn
         Oo+g==
X-Forwarded-Encrypted: i=1; AFNElJ/4KOFSN1wAMneSfb95vxCJLEgN7PX3VyrHjlEQbwdjmaSnBQBJPH+deVY/LUxeWCa2yLawfCb1sjA9UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcn4qLKdMdpN0IMbjmDqWkZPKArQp4zkYtSmCk1Z+ZHl0QWGuX
	FN2yUIvPK+EZX3GEl2X52hJAN8pcx3Qif6BxW0au/suiwOhSsS4iJebT
X-Gm-Gg: AeBDiesb+sHfAk/7fkGzHPPjnwvzZ/Qbiii0hZXFMfknLmosowXzLqT7Emxb6X+GKNb
	2iCrBE4QscSwwiPsXauoZV9PVw0rStJ8L2fC6O8MWrQbOYXFAlq3b6DBNohgHlEr5WWFXxIrPda
	isphVyr7oStv7Fu+4/7iGthJI2//HBLZLaZ1p4k2IiMPo9dycHq0QXK3cCkQITZo6ksR2IWWrXN
	CJvpie35Xzhrcp6d4T8Ff2l0khUbthf617IiRZr1GDtXGzrmVy1YdJYxhvv3x/EF15zGmq/j9sJ
	Jp5nkRhzZmZvwjqClfp9qUiB+Pp8GfWkuxAxA97W7bnCFowUGSMljOFjPUnsemzFtSYGlziRvSv
	2PvCovoYND8wg59nDHtAn6KmLXQbHvsUpKAWpX1Gwx7IMRR3tH+i9YGQQ2NaHBW2HitPJ7ngQdR
	+o2T5apSYoSCFr+mcsUmVAXaA12p/kvGyV5vC5ZihFf5gzFEpeRY4DAYp8Y4CDnBHtk/8JTwgK
X-Received: by 2002:a05:600c:6290:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-48e51f3fd58mr196699875e9.20.1778221551502;
        Thu, 07 May 2026 23:25:51 -0700 (PDT)
Received: from ?IPV6:2a02:8109:8617:d700:d9bb:cdec:69e5:2f8e? ([2a02:8109:8617:d700:d9bb:cdec:69e5:2f8e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e642d1e5csm12599585e9.3.2026.05.07.23.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 23:25:50 -0700 (PDT)
Message-ID: <a69dc374-8275-4899-89df-942c6f3137e4@gmail.com>
Date: Fri, 8 May 2026 08:25:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: alvium: fix critical pointer access in
 alvium_ctrl_init
Cc: sakari.ailus@linux.intel.com, martin.hecht@avnet.eu,
 michael.roeder@avnet.eu, stable@vger.kernel.org,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260508045332.360004-1-mhecht73@gmail.com>
Content-Language: en-US
From: Martin Hecht <mhecht73@gmail.com>
In-Reply-To: <20260508045332.360004-1-mhecht73@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D83934F2731
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_TO(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,avnet.eu,vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60890-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhecht73@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi all,

please ignore that misleading patch. I send the wrong file. I set the 
status on patchwork on obsolete. I'm preparing v3 after cleanup.

Kindly regards,
Martin




On 5/8/26 06:53, Martin Hecht wrote:
> The current implementation of alvium_ctrl_init creates several controls
> in function alvium_ctrl_init and uses the returned pointer without
> check. That can cause write access over NULL-pointer for several
> controls.
> The reworked code checks the pointers before adding flags and also it
> creates controls for V4L2_CID_BLUE_BALANCE and V4L2_CID_RED_BALANCE only
> if supported by the particular camera model.
> 
> Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
> Cc: stable@vger.kernel.org
> Signed-off-by: Martin Hecht <mhecht73@gmail.com>
> ---
>   drivers/media/i2c/alvium-csi2.c | 72 +++++++++++++++++++--------------
>   1 file changed, 42 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
> index b62b45a4f2fc..43535ba7a264 100644
> --- a/drivers/media/i2c/alvium-csi2.c
> +++ b/drivers/media/i2c/alvium-csi2.c
> @@ -2100,34 +2100,41 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
>   					      V4L2_CID_PIXEL_RATE, 0,
>   					      ALVIUM_DEFAULT_PIXEL_RATE_MHZ, 1,
>   					      ALVIUM_DEFAULT_PIXEL_RATE_MHZ);
> -	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	if (ctrls->pixel_rate)
> +		ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>   
>   	/* Link freq is fixed */
>   	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
>   						  V4L2_CID_LINK_FREQ,
>   						  0, 0, &alvium->link_freq);
> -	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
> -	/* Auto/manual white balance */
> +	if (ctrls->link_freq)
> +		ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	/* manual white balance */
> +	if (alvium->avail_ft.whiteb) {
> +		ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops,
> +							V4L2_CID_BLUE_BALANCE,
> +							alvium->min_bbalance,
> +							alvium->max_bbalance,
> +							alvium->inc_bbalance,
> +							alvium->dft_bbalance);
> +
> +		ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops,
> +						       V4L2_CID_RED_BALANCE,
> +						       alvium->min_rbalance,
> +						       alvium->max_rbalance,
> +						       alvium->inc_rbalance,
> +						       alvium->dft_rbalance);
> +	}
> +
> +	/* Auto white balance */
>   	if (alvium->avail_ft.auto_whiteb) {
>   		ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
>   						   V4L2_CID_AUTO_WHITE_BALANCE,
>   						   0, 1, 1, 1);
> -		v4l2_ctrl_auto_cluster(3, &ctrls->auto_wb, 0, false);
> -	}
> -
> -	ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops,
> -						V4L2_CID_BLUE_BALANCE,
> -						alvium->min_bbalance,
> -						alvium->max_bbalance,
> -						alvium->inc_bbalance,
> -						alvium->dft_bbalance);
> -	ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops,
> -					       V4L2_CID_RED_BALANCE,
> -					       alvium->min_rbalance,
> -					       alvium->max_rbalance,
> -					       alvium->inc_rbalance,
> -					       alvium->dft_rbalance);
> +		if (ctrls->auto_wb)
> +			v4l2_ctrl_auto_cluster(3, &ctrls->auto_wb, 0, false);
> +	}
>   
>   	/* Auto/manual exposure */
>   	if (alvium->avail_ft.auto_exp) {
> @@ -2136,7 +2143,9 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
>   					       V4L2_CID_EXPOSURE_AUTO,
>   					       V4L2_EXPOSURE_MANUAL, 0,
>   					       V4L2_EXPOSURE_AUTO);
> -		v4l2_ctrl_auto_cluster(2, &ctrls->auto_exp, 1, true);
> +		if (ctrls->auto_exp)
> +			v4l2_ctrl_auto_cluster(2, &ctrls->auto_exp,
> +					       V4L2_EXPOSURE_MANUAL, true);
>   	}
>   
>   	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops,
> @@ -2145,15 +2154,8 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
>   					    alvium->max_exp,
>   					    alvium->inc_exp,
>   					    alvium->dft_exp);
> -	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
> -
> -	/* Auto/manual gain */
> -	if (alvium->avail_ft.auto_gain) {
> -		ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops,
> -						     V4L2_CID_AUTOGAIN,
> -						     0, 1, 1, 1);
> -		v4l2_ctrl_auto_cluster(2, &ctrls->auto_gain, 0, true);
> -	}
> +	if (ctrls->exposure)
> +		ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
>   
>   	if (alvium->avail_ft.gain) {
>   		ctrls->gain = v4l2_ctrl_new_std(hdl, ops,
> @@ -2162,7 +2164,17 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
>   						alvium->max_gain,
>   						alvium->inc_gain,
>   						alvium->dft_gain);
> -		ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
> +		if (ctrls->gain)
> +			ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
> +	}
> +
> +	/* Auto/manual gain */
> +	if (alvium->avail_ft.auto_gain) {
> +		ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops,
> +						     V4L2_CID_AUTOGAIN,
> +						     0, 1, 1, 1);
> +		if (ctrls->auto_gain)
> +			v4l2_ctrl_auto_cluster(2, &ctrls->auto_gain, 0, true);
>   	}
>   
>   	if (alvium->avail_ft.sat)


