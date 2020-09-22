Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E2D274D02
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 01:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgIVXAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 19:00:45 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:34385 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIVXAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 19:00:45 -0400
Received: by mail-il1-f195.google.com with SMTP id q5so12437424ilj.1;
        Tue, 22 Sep 2020 16:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GsXOYZZf5xdaUt63u65zd5bMSVGREYrkQy367fZurpc=;
        b=hbhYvjelyQhZszEXkYD+hYHkzlTTlbwTckhISSDPJDH0R3PaUUEbO45/cgmqz3uNUr
         8H8g/i7BhD7m3EZnBA6AihNwhTMUPM7gyV489SwtRPn5FDhArxBxtucQ+bZo09o42zTZ
         LyRPYA3Ns4LLich7zjDBkqNoeyH6WeiRRx415R4Uu+e3UeT8KXJgPd3yQq35Dv0FJhmV
         WbwuMxCJZL9jE0Rq38EtOn8LVW3h2GkF/Zybc3UUitM2Rf9k/hSYJKP0HClqvEw3pVD6
         MDMPkCOJT6h8VxRvhkZR+7L5PW3ZPyZq65MDc2kxOKdCKCZZkuqchrIBBbdWChadQIX5
         AUbw==
X-Gm-Message-State: AOAM533CCuH6fHQ4Mwm+yeVx99jevwVpjkkosNwFEyE+DV0PrbzQUw9D
        b1VRk4iOdJDKxS+V80xueQ==
X-Google-Smtp-Source: ABdhPJxfqDX5bxzFUrY+k6Qc1PsPZWVhldUH35d8eXvTqDKiWig6b9je3/K0vTqPctttmyXkbg6eqg==
X-Received: by 2002:a92:cb01:: with SMTP id s1mr6368568ilo.225.1600815644833;
        Tue, 22 Sep 2020 16:00:44 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id u15sm8062352ior.6.2020.09.22.16.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 16:00:44 -0700 (PDT)
Received: (nullmailer pid 3425231 invoked by uid 1000);
        Tue, 22 Sep 2020 23:00:43 -0000
Date:   Tue, 22 Sep 2020 17:00:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martin Cerveny <m.cerveny@computer.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 5/6] dt-bindings: media: cedrus: Add V3s compatible
Message-ID: <20200922230043.GA3425202@bogus>
References: <20200912143052.30952-1-m.cerveny@computer.org>
 <20200912143052.30952-6-m.cerveny@computer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200912143052.30952-6-m.cerveny@computer.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 12 Sep 2020 16:30:51 +0200, Martin Cerveny wrote:
> Allwinner V3s SoC contains video engine. Add compatible for it.
> 
> Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
> ---
>  .../bindings/media/allwinner,sun4i-a10-video-engine.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
