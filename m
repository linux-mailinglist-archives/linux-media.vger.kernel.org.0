Return-Path: <linux-media+bounces-7942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F27388E6EF
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 15:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C58701F3142F
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 14:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79639158DAD;
	Wed, 27 Mar 2024 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KMR/WDVZ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B16A13D252
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 13:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711546483; cv=none; b=LBD2woR9T4oKXd+4Ql3ZbB/BGnrUSxo59SbtkXGx5oWFFlI4Aj/E+CDDZHlyIru8c/BoZyTc1/5ocJqBcAdqW3m2S4kVdTqsNaDQHqpcH7GUlMLC9H4hnhlQRhdZafhIhItVQa1qnLbIN3JxNUU/nwLFScRjQSseOL3FdHmtFJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711546483; c=relaxed/simple;
	bh=2jhp1ihsl19xv+FjEfObLMIlt7vATRxjGhELbLsJj7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JvzxWQ26kcCyeumgy+8YHeDTfLtQC/eDhbEXWL60PAaREAhjFO4YpR9PSRnKL/sf7/57RWY+rvoNlU8zcSqsqBkqClaj8E1FBFqIfvGjPIPJa5888l+yG0LOUJhqHLPFwkjTHuvPajTEAV3B39hgMZb5cpFYeZZ3QA0slxm1clQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KMR/WDVZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711546481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hiWCOrPmiYSKv2evRp4ZElQd+yf9YQzwzc6z1Xq7R4=;
	b=KMR/WDVZWoBH5l5OxAVvZaLO/DRwzz93ZTAT3/R6QOvXSepE8u8E9IbvZU2UN+bzWjmSrM
	l7m/KoAk9xbwe5RX5lqf+LsdaYA2aKS6BOf0Ubmi6QOBsMiensSHGELFCqH9KchFNIrjSD
	g4i0djQUXDTGO12GkmdtC2Dwcw4e51c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-e9Ua7GcdPviTOq2lshFWUQ-1; Wed, 27 Mar 2024 09:34:38 -0400
X-MC-Unique: e9Ua7GcdPviTOq2lshFWUQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a467a6d4e3eso302529666b.3
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 06:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711546477; x=1712151277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hiWCOrPmiYSKv2evRp4ZElQd+yf9YQzwzc6z1Xq7R4=;
        b=R4KduKB8X6rP5Z4tvRdd1aQUq7zFCNEpX2xbipjICC8wosv5EVwsQ1Z4Ayf6qTz0/K
         flaWZCW8n9hhsFjnahGdr5bH3Z44Szi14QkM5UeQl+ZZe66sFWgrZL4sZ2JuzZaAhFXp
         cPTF59B30ptQRG7qlDMY9DrLoBVxMtM4hTAkY1VIcGUPHzoY5g3Nd8JX8SYh3HDRgaha
         VDyrI8XCBC2WsEgRLY1QzM+77U43ecblGMmMtLAH7LdQdVJMd80n+655WOC8M3pHaI3N
         EpBHofpiYd+XMJvuzplz18uDgGQruKCEE4uFAvOPb7+V5ZB6G0W6+StnEMvDyr/3inY0
         n/5g==
X-Forwarded-Encrypted: i=1; AJvYcCWYIRVE4WGgeGXnXiLlEApqG+j0FN877XfkSAmHSLJbGkX98jb2TfVcEQv2oL5rzN/tpuZEZygO5lprmK/wMUXz5mItkls1iap/sCI=
X-Gm-Message-State: AOJu0Yw4XKHX1OXWULCIBeO4q6gPlCFVUZExWP2E3UD7UKo84eE1fCBk
	l8oIw25h7t4n+iGvrEBngZrLQa/QqmOb8VmoTQOIiARiUxRToSP3mpO/brdHk3e1DgjZvbWVuPz
	3B8NCIFHppOtggwjwZWizpKXZ6gnBuRGjqDxUPCkLLjyinS9D30JmbB8mTDtf
X-Received: by 2002:a17:906:a2d8:b0:a47:479a:a12b with SMTP id by24-20020a170906a2d800b00a47479aa12bmr854204ejb.43.1711546477823;
        Wed, 27 Mar 2024 06:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFyIWM1E8GeVRe9mP9dT08pXmK1V+6d/LnY1cdAPXq4fiqgLa0+vPMOJq4X1mH6BjRilZy4Q==
X-Received: by 2002:a17:906:a2d8:b0:a47:479a:a12b with SMTP id by24-20020a170906a2d800b00a47479aa12bmr854192ejb.43.1711546477515;
        Wed, 27 Mar 2024 06:34:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bm2-20020a170906c04200b00a45c9ea48e3sm5417015ejb.193.2024.03.27.06.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 06:34:36 -0700 (PDT)
Message-ID: <6ff16130-5efe-4561-a90a-08dc44a18994@redhat.com>
Date: Wed, 27 Mar 2024 14:34:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: ov2740: Fix LINK_FREQ and PIXEL_RATE control
 value reporting
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
References: <20240327132853.521461-1-sakari.ailus@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240327132853.521461-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/27/24 2:28 PM, Sakari Ailus wrote:
> The driver dug the supported link frequency up from the V4L2 fwnode
> endpoint and used it internally, but failed to report this in the
> LINK_FREQ and PIXEL_RATE controls. Fix this.
> 
> Fixes: 0677a2d9b735 ("media: ov2740: Add support for 180 MHz link frequency")
> Cc: stable@vger.kernel.org # for v6.8 and later
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/i2c/ov2740.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 552935ccb4a9..57906df7be4e 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -768,14 +768,15 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>  	cur_mode = ov2740->cur_mode;
>  	size = ARRAY_SIZE(link_freq_menu_items);
>  
> -	ov2740->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
> -						   V4L2_CID_LINK_FREQ,
> -						   size - 1, 0,
> -						   link_freq_menu_items);
> +	ov2740->link_freq =
> +		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
> +				       V4L2_CID_LINK_FREQ, size - 1,
> +				       ov2740->supported_modes->link_freq_index,
> +				       link_freq_menu_items);
>  	if (ov2740->link_freq)
>  		ov2740->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
> -	pixel_rate = to_pixel_rate(OV2740_LINK_FREQ_360MHZ_INDEX);
> +	pixel_rate = to_pixel_rate(ov2740->supported_modes->link_freq_index);
>  	ov2740->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
>  					       V4L2_CID_PIXEL_RATE, 0,
>  					       pixel_rate, 1, pixel_rate);


