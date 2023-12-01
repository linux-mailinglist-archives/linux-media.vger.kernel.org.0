Return-Path: <linux-media+bounces-1468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF85C800A76
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 13:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF7DD1C20E0E
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 12:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1116225D7;
	Fri,  1 Dec 2023 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="QI1sgGCT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E7C1BE7
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 04:07:30 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bbb4de875so2818763e87.0
        for <linux-media@vger.kernel.org>; Fri, 01 Dec 2023 04:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1701432448; x=1702037248; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ld796iPDsS/HIVvP7w7PB/lqEfZHZ7EhyA8gH1ALk3s=;
        b=QI1sgGCTHCMa+ydQJry0cT01FDFopZL4C9WtFa02Y6rzqti4oBPYRpPSN/iIjy/WeN
         DG7CoJ1pHdix7dDAderPbr1hc2AVEKFGOBuB3HK4xrA6/eKoKVOnYr7Sy3R4O/V24b1G
         odAUHXYcK8SJVuHabs5g6L6nyE5eL281A7qhQT+xVQjDXyFcHlFM3+b1P7zc1e3w0ADk
         2ZhlNJyE7MirstQ9iTXjp70MHwpE6KeRD/iZkuPODbtBo2+5XUsQQ4rAxldQ13VDsZrS
         xrCLLYjjcUUHlFxRVGWKVK1QGhyBoNMyY5KmsrjtE9PuJh9F4BJYbQ3Qwe10MWMcW8Zp
         qrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701432448; x=1702037248;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ld796iPDsS/HIVvP7w7PB/lqEfZHZ7EhyA8gH1ALk3s=;
        b=D/N6bUSqPIeMrvWB/TUVm4gElxtHg9xvS1nZb7x5nN7GceSsXqaC2LB5+Erx8sqmaC
         KK7Kn72AOrY0Y6TcO4mZkYiC7qMUskSeLu/n4KKrHo5HcMARtEAryaotr53t/U4SiFI0
         dKAh+keYU2bpPH2vzTO3VBikezg80SofnvsM9WwpFX6JMhFc2Nek6eZZIn3xBLvbjeey
         nTfi39WWSnc3EP4QM3S50pHmsMhKM+kUDsHrOJ+INSsCsvI700Svfen+ifQF5tS0av89
         8xnYHtSf55mVB81TGf2EQsshjAYSF0XIcqAWpp/jmyqh/cvpJGmTRRRPtwARg47EkYD9
         E4sw==
X-Gm-Message-State: AOJu0YxDUbV3Cy78hz4FtGp5TYck0xY4ZY+eVwe3WMIFlNAyZlvUu8hJ
	Jh99cF9HcLcC4simB2S212tMuJlt3hDt48kLkik=
X-Google-Smtp-Source: AGHT+IGsrE93liKAZolC8G8WXET7gLNXDHqJNS2z6TcNiio4ZxjrJ/SrX10j4SrUKcRLaazKtoz1vQ==
X-Received: by 2002:a05:6512:48c3:b0:50b:c999:8660 with SMTP id er3-20020a05651248c300b0050bc9998660mr500702lfb.54.1701432448501;
        Fri, 01 Dec 2023 04:07:28 -0800 (PST)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id h40-20020a0565123ca800b0050bc57e1419sm407684lfv.243.2023.12.01.04.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 04:07:27 -0800 (PST)
Date: Fri, 1 Dec 2023 13:07:26 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add missing bindings for max96712
Message-ID: <ZWnMfsqUGRCDa3HR@oden.dyn.berto.se>
References: <20231115164127.2790596-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231115164127.2790596-1-niklas.soderlund+renesas@ragnatech.se>

Hi Mauro,

Ping on this patch.

On 2023-11-15 17:41:27 +0100, Niklas Söderlund wrote:
> Add the binding documentation to the entry in the MAINTAINERS file.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c9f868e13b6..ea14bd4198a3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13014,6 +13014,7 @@ MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
>  M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
>  F:	drivers/staging/media/max96712/max96712.c
>  
>  MAX9860 MONO AUDIO VOICE CODEC DRIVER
> -- 
> 2.42.1
> 

-- 
Kind Regards,
Niklas Söderlund

