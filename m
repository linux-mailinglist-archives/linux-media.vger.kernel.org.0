Return-Path: <linux-media+bounces-2030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A380AF46
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 23:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91D901C20CD6
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 22:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D77B59B50;
	Fri,  8 Dec 2023 22:00:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDFD1708;
	Fri,  8 Dec 2023 14:00:04 -0800 (PST)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1fa1c3755afso1218403fac.1;
        Fri, 08 Dec 2023 14:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702072804; x=1702677604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNPRU0FNU7QKtEQcMllHcv0YAtO+zJjy7ZQCkfvhnHc=;
        b=vQJmI0NuWCt6c90ypigLd0WMXIv1LqhnA56h4uxn8cwqxOKrxZVyaZ0mM/mmqwgQiu
         UQpUxSDWs7scg+xem+HWMdsdIsI9HiX4RcNSa04wdVeRW/U1T53zHSAv+jB5le8NN3E7
         atVOuv6xbrz/knzR1EZ7XIwYmyhkt3NxP69vXiR0A3uGFMJ+4HDWbwF26LtXSR0SP+lT
         ueMr2rlmRYkwmEW4d6APaSqknWRkqt3RDdZQuU16LUN7/z9A5dORDzmJmJj7erKpvre9
         p090Q6pmKodavEcHUgDR63hp2oV8kn3uvR7MJWtKyd4xHHcnV0aK8BUUYnO5r1YrOZTh
         9cqg==
X-Gm-Message-State: AOJu0YwWINU9KU+CnH13ZnkAKhNod7tBMXQIY1Xo+mwcOP+3NUhvx8EU
	gVfflsM5ZPGrz1Qrkq5Bnw==
X-Google-Smtp-Source: AGHT+IEZhSY6G/TyluC+ct9+exH9dx3QLmpi6Wrof4HsaI8jDGw2gC+wh0RS4B73rQHe14EDAfUUVg==
X-Received: by 2002:a05:6870:239f:b0:1fa:df5e:48be with SMTP id e31-20020a056870239f00b001fadf5e48bemr396047oap.15.1702072803500;
        Fri, 08 Dec 2023 14:00:03 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ho13-20020a056870498d00b001fb3a053eaesm620436oab.34.2023.12.08.14.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 14:00:02 -0800 (PST)
Received: (nullmailer pid 2876137 invoked by uid 1000);
	Fri, 08 Dec 2023 22:00:01 -0000
Date: Fri, 8 Dec 2023 16:00:01 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3] media: dt-bindings: ov8856: decouple lanes and link
 frequency from driver
Message-ID: <170207280134.2876077.6594221825258184727.robh@kernel.org>
References: <20231208195253.130470-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208195253.130470-1-krzysztof.kozlowski@linaro.org>


On Fri, 08 Dec 2023 20:52:53 +0100, Krzysztof Kozlowski wrote:
> The data lanes and link frequency were set to match existing Linux driver
> limitations, however bindings should be independent of chosen Linux
> driver support.
> 
> Decouple these properties from the driver to match what is actually
> supported by the hardware.
> 
> This also fixes DTS example:
> 
>   ov8856.example.dtb: camera@10: port:endpoint:link-frequencies:0: [360000000] is too short
> 
> Fixes: 066a94e28a23 ("media: dt-bindings: media: Use graph and video-interfaces schemas")
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v3:
> 1. Drop link-frequencies entirely (Sakari)
> 2. Add Conor's ack
> 
> Changes in v2:
> 1. Rework approach: decouple bindings from driver instead of fixing
>    DTS example (Sakari)
> ---
>  .../devicetree/bindings/media/i2c/ov8856.yaml | 24 +++++++++----------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


