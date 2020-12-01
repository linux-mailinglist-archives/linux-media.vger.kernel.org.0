Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356BB2CAC8B
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 20:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392477AbgLATjF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 14:39:05 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:34300 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392472AbgLATjF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 14:39:05 -0500
Received: by mail-io1-f65.google.com with SMTP id i18so109618ioa.1;
        Tue, 01 Dec 2020 11:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XYryzA4/mFCMKCIdF4yV/ZR2i0tUMBhkZeyfOMT4X4g=;
        b=OjaEdSpELliFKxKeBdaOHijvUIXrUOzw6P9kGsvT0CDXGl6DnpM6IgPngXvIyqwVOO
         ltpP3iBJn6a8gEyXhQTmCsE1ApTt4GeHc0bN5I7h4mOSn/58tW4jke2a7i7b/7AfRAuh
         RiMGQFaAspVvLyhjUgIXRXrmCW5zsW3sGkk9vkuEqKHSyQdmPySuD2ueeGgTbf8a4S4W
         UIUVjiJvR5iNz4j9yhOwEGVDaBwTGMFgZFtJIL7q9xTBsCgxPrbIvkc7+SDLKCiqxJSF
         6O8otMQVPdg0btoDJfyXZcVwGWwvA9kqQbhevEtkA1JHMoCdcD2/L2ywkN5BZuV70ZRP
         kl8Q==
X-Gm-Message-State: AOAM531HS7E4slPXqxRf7y4Kd//ulW5QtlAkhPIiHnsb0v13lJU/mol8
        ImrjRy93VbNZq5PHu/N4+w==
X-Google-Smtp-Source: ABdhPJz6y0nwODn3fi22qW0p1MoAqQH5CE857hDxXdkRZT/O3+x/q/eHKcGoz/oIUzGrKCRWBlG6Ow==
X-Received: by 2002:a02:7124:: with SMTP id n36mr4080721jac.59.1606851504458;
        Tue, 01 Dec 2020 11:38:24 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k28sm293101ilg.40.2020.12.01.11.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 11:38:23 -0800 (PST)
Received: (nullmailer pid 929500 invoked by uid 1000);
        Tue, 01 Dec 2020 19:38:20 -0000
Date:   Tue, 1 Dec 2020 12:38:20 -0700
From:   Rob Herring <robh@kernel.org>
To:     Martin Cerveny <m.cerveny@computer.org>
Cc:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Icenowy Zheng <icenowy@aosc.io>, devel@driverdev.osuosl.org,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 5/6] dt-bindings: media: cedrus: Add V3s compatible
Message-ID: <20201201193820.GA929471@robh.at.kernel.org>
References: <20201116125617.7597-1-m.cerveny@computer.org>
 <20201116125617.7597-6-m.cerveny@computer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116125617.7597-6-m.cerveny@computer.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 16 Nov 2020 13:56:16 +0100, Martin Cerveny wrote:
> Allwinner V3s SoC contains video engine. Add compatible for it.
> 
> Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
> ---
>  .../bindings/media/allwinner,sun4i-a10-video-engine.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
