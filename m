Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C5B2D1DF9
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 00:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgLGXBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 18:01:03 -0500
Received: from mail-oo1-f67.google.com ([209.85.161.67]:42653 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbgLGXBD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 18:01:03 -0500
Received: by mail-oo1-f67.google.com with SMTP id g20so1733349oos.9;
        Mon, 07 Dec 2020 15:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CFy+nG4iS5p2yYyKX/b5kvW6hcT/gqROUK6GrSdahRU=;
        b=Y3RsbRbEEsyUaQJFowhv2rA2/Cd+vbJNuOoMj9BI+wYBS9SD3HGqSvPJuGSZ8fHW9T
         CkQf/vc9xKvqd/NRY3+8AKni7UJLMU+R1oeL5zsQv4WBN1M3mBUUNZ9Cqmlyg+4U/+O+
         q3XIURZqzHe3M7cTkQEsKlk9/SeE2YSHxxEvWhf8bWo2hplg9n1IZN6x1wbRpn6Oeidc
         P4fkcLksuzDHBYxPM4FNmQxjPjrRBRCbcvj1XgHp/nikVcaF4qGUjaEZ7bAawzBKnSYw
         1p3ElGuj1lec9s0/eOHnbGX00IjxYVWxLG2YjAaBUdjT6Hoq+TMFgVXSdxEIIk0uGjf7
         donw==
X-Gm-Message-State: AOAM530JAyZJ86fSfirIxtLV5b+Yj/y9lBpA0G7Adl/GUGkLkKhRnyAX
        HxaTXxyhsTvhAz3jUYJ3TA==
X-Google-Smtp-Source: ABdhPJzE//ECqTKe9WJx+3uBk86ScLYklU5dwJEKbOkkShMp6z+xNxpE+bs9r/ycNubVmOVXfDg91Q==
X-Received: by 2002:a4a:a3cb:: with SMTP id t11mr8596364ool.30.1607382021970;
        Mon, 07 Dec 2020 15:00:21 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o63sm2978041ooa.10.2020.12.07.15.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 15:00:20 -0800 (PST)
Received: (nullmailer pid 1006890 invoked by uid 1000);
        Mon, 07 Dec 2020 23:00:18 -0000
Date:   Mon, 7 Dec 2020 17:00:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Stafford Horne <shorne@gmail.com>,
        Karol Gugala <kgugala@antmicro.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        linux-serial <linux-serial@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 5/5] dt-bindings: mfd: correct the node name of the panel
 led
Message-ID: <20201207230018.GA1006838@robh.at.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-6-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204093813.1275-6-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 04 Dec 2020 17:38:13 +0800, Zhen Lei wrote:
> According to the definition in leds-pwm.yaml, the node name of each led
> must match the regular expression "^led(-[0-9a-f]+)?$". "led" or "led-"
> followed by a decimal or hexadecimal ID number.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
