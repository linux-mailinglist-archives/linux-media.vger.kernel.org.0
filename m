Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7FCE3A8A
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 20:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407769AbfJXSCT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 14:02:19 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36980 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405818AbfJXSCT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 14:02:19 -0400
Received: by mail-lf1-f68.google.com with SMTP id g21so18784188lfh.4
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 11:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=1MT+NuL0A2d7V47il5xKhn38l4jnJHUWqOzNSUqZTmU=;
        b=oZ22aT4v7OacrgXhNTSDZMursMGBZczVUnMPSlZ/Trsm7sPAQ/HZoQod05TDbS0DvM
         oDCq0HtMiuBDJ5XsdPVtJq1oCRGBQW4nVjj724fZT92YXuPyodfXTYwppWz3pyOA4Xy1
         IiXrDpZRt/3F9DRMeZV3/clMSkQEKpZZoGoeej3YZvYhUQrxgZYpbZlWzMhtyunBPN/h
         6TWZ/935JMnZjt1MC0A/+UOQdu9/RRoKDxPTo+BHxYvAc5NkTCQN+wU4A1d0zzEyiuNs
         sN5VUfK5DIj3z7jpjLIGpQjUfmP7XTaUbtPKunBAyF3fC/b9GcDeYAgVtCWmC1PQqstJ
         O4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1MT+NuL0A2d7V47il5xKhn38l4jnJHUWqOzNSUqZTmU=;
        b=jsWEnhkTpAj5bLLih85xLEgJjhgLmFpqu63K8TepQtCskrCZSVc3c0oLYZgejGctfK
         TfzQWV7RjtGMzYIK3SnUqxpZywaN0MSc2yqoTEx9DZRzk6Gi9czfnU2orEsT+GWLCjk3
         1d126xBJyK/XaO9zFhpCrF6g4a5tKxS8j2CQn00+xU2WvNMJTyrca5zQ5HfOtd1dVedD
         DPUM/Zme6R/8iRI6Vf3yBxdpXo7C0JxZImtKaLwxeMGEGaQTeOw9TMJweI31Z5d5thOG
         8ypWSee/eeneGL3VmCHEayd1uPBoiVAv9LJwrrzzWVZy3Z39E4GynYJQ5w5PPUgrhKrv
         Cemg==
X-Gm-Message-State: APjAAAV8vBqw8JBHqajNHBG8SDeZZUZdKSrP4/eh7Kq8yD/Xpqp0YgUF
        WDDuUNnb/rLSztYoLAxdJnXdXg==
X-Google-Smtp-Source: APXvYqxGtlgBuxs1ObTfTUdNmXl+vqtR/s3VtCKQ9QOnG7IF5eA/FjgTQhCKWo+G3t/i5gv/UkgNZQ==
X-Received: by 2002:a19:f813:: with SMTP id a19mr12166729lff.33.1571940136026;
        Thu, 24 Oct 2019 11:02:16 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id m15sm10649914ljh.50.2019.10.24.11.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 11:02:15 -0700 (PDT)
Date:   Thu, 24 Oct 2019 20:02:03 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: rcar_vin: Document RZ/G1 per-board
 settings
Message-ID: <20191024180203.GA24998@bigcity.dyn.berto.se>
References: <20191024131423.16799-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191024131423.16799-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-10-24 15:14:23 +0200, Geert Uytterhoeven wrote:
> The R-Car Gen2 per-board settings apply to RZ/G1, too.
> 
> Fixes: 1d14a5eaa156b0b3 ("media: dt-bindings: media: rcar_vin: add device tree support for r8a774[35]")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/renesas,vin.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
> index aa217b0962797712..221fcc416d1ac598 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.txt
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.txt
> @@ -43,7 +43,7 @@ on Gen3 and RZ/G2 platforms to a CSI-2 receiver.
>  Additionally, an alias named vinX will need to be created to specify
>  which video input device this is.
>  
> -The per-board settings Gen2 platforms:
> +The per-board settings for Gen2 and RZ/G1 platforms:
>  
>  - port - sub-node describing a single endpoint connected to the VIN
>    from external SoC pins as described in video-interfaces.txt[1].
> @@ -63,7 +63,7 @@ The per-board settings Gen2 platforms:
>      - data-enable-active: polarity of CLKENB signal, see [1] for
>        description. Default is active high.
>  
> -The per-board settings Gen3 and RZ/G2 platforms:
> +The per-board settings for Gen3 and RZ/G2 platforms:
>  
>  Gen3 and RZ/G2 platforms can support both a single connected parallel input
>  source from external SoC pins (port@0) and/or multiple parallel input sources
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
