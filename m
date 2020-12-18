Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E322DEAE4
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 22:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgLRVRk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 16:17:40 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:35265 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgLRVRk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 16:17:40 -0500
Received: by mail-ot1-f42.google.com with SMTP id i6so3289462otr.2;
        Fri, 18 Dec 2020 13:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oZbLTUAj2Ubj95CZHG22KJrmm6gu+1PJrDH8jQ0Wy2w=;
        b=seNCsWOVHAc4OfncJGe2KwkTY2Y8hKcCwkO/arhF69VwEc9BrnpfH4GG4kO6eN4/BV
         1qABkxD1FO8Ow3I4Q4hs4JksUyPf0FO4hduoZFruvGT29i+6EqM2QrGvZlP3fFhVjrBU
         kki77YnSPWTCT5KjCrs4CKcgzL3KkYv1EFBzOT8VQAwcvLfhlVgqvNpCn1JT/ABxHlU/
         Lvo0RWdipqMuJUasW2JQfVD4aaUFTsPpsY/rmMkugBW3hYjjfezh1zZbIr1nghGJHp5V
         nvW0TCPF7MjxmTWroyS29phvLyIVdFmQvpJMgrZd+bxQhRAhX4wmyTmmPGgjolnd2u/2
         i9Mw==
X-Gm-Message-State: AOAM530wZBknA0rj/+MIpHZwOk8/9QRQ8J/WlOC39207wR3z1pCqI383
        upEmYBwN7w6OZiKr8YWsZQ==
X-Google-Smtp-Source: ABdhPJy9XYh7zJVONvvuBjyhbfwsYX4hbZey5qNYAdiUHfr1I2nThQ60ynXf75brR04s/jCIn1yfaQ==
X-Received: by 2002:a9d:745a:: with SMTP id p26mr4383657otk.206.1608326219050;
        Fri, 18 Dec 2020 13:16:59 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y84sm2078765oig.36.2020.12.18.13.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 13:16:58 -0800 (PST)
Received: (nullmailer pid 2190306 invoked by uid 1000);
        Fri, 18 Dec 2020 21:16:57 -0000
Date:   Fri, 18 Dec 2020 15:16:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Stafford Horne <shorne@gmail.com>,
        Karol Gugala <kgugala@antmicro.com>,
        linux-serial <linux-serial@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: serial: add the required property
 'additionalProperties'
Message-ID: <20201218211657.GA2190041@robh.at.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-3-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204093813.1275-3-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 04 Dec 2020 17:38:10 +0800, Zhen Lei wrote:
> When I do dt_binding_check for any YAML file, below wanring is always
> reported:
> 
> xxx/serial/litex,liteuart.yaml: 'additionalProperties' is a required property
> xxx/serial/litex,liteuart.yaml: ignoring, error in schema:
> warning: no schema found in file: xxx/serial/litex,liteuart.yaml
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/serial/litex,liteuart.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
