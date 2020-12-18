Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7122DEAEE
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 22:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727554AbgLRVSF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 16:18:05 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:40602 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbgLRVSE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 16:18:04 -0500
Received: by mail-oi1-f178.google.com with SMTP id p126so4317219oif.7;
        Fri, 18 Dec 2020 13:17:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l8NpM/ZXx3KvTES0GcT3wzVOs1+8KOFnRlCaHv0vQqg=;
        b=Ff6IEDnLqo2swbfUZXbZPyqSziAh/VBSxNAZEuTqfIqqp1nKYlPk9EVQQY+TEVQpSK
         fU0CjNk2prgP33Kjcg4joI7vn3BItwEXE9874KSkVTni8GAtVHaNsY4AvK9Sjcw+9gFE
         PaRHdGVdh/3hmAng9YrBbKzqDJbl3peUkSpQDH/rGIZja9gFkJj/eEklk/nd1+comRq/
         Zn0qKw3uqjK1IXKanXiENs2OoZdB0cUGZ2VakN5p1oyj/A2p5TGOhjbMh30a4BlBSyv+
         SCKbHXTTv9gT1OOpUGh1mRb0E1pnBtTJbwlAdb+m1A1sq+TsuJmZ8K5VDk7i8AJdRYqI
         wc8g==
X-Gm-Message-State: AOAM531gEKl9D2NyRNKwsC8VMUYaJupU48Y8dg9OmfXfNgydd7m6C4Jy
        tsnoeCSE6DHb9cS/p4dXZg==
X-Google-Smtp-Source: ABdhPJzL2Cdk+fsnQO8ZXvFKbLhNOKv4lZI3fZ66X1EcYf/ouISSzRrfIxqRxLPlSTmS8yZ3GB1RBA==
X-Received: by 2002:aca:3c57:: with SMTP id j84mr4146262oia.41.1608326243527;
        Fri, 18 Dec 2020 13:17:23 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p132sm917646oia.41.2020.12.18.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 13:17:22 -0800 (PST)
Received: (nullmailer pid 2190902 invoked by uid 1000);
        Fri, 18 Dec 2020 21:17:21 -0000
Date:   Fri, 18 Dec 2020 15:17:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Karol Gugala <kgugala@antmicro.com>,
        linux-media <linux-media@vger.kernel.org>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Lee Jones <lee.jones@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: devapc: add the required property
 'additionalProperties'
Message-ID: <20201218211721.GA2190633@robh.at.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-5-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204093813.1275-5-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 04 Dec 2020 17:38:12 +0800, Zhen Lei wrote:
> When I do dt_binding_check for any YAML file, below wanring is always
> reported:
> 
> xxx/soc/mediatek/devapc.yaml: 'additionalProperties' is a required property
> xxx/soc/mediatek/devapc.yaml: ignoring, error in schema:
> warning: no schema found in file: xxx/soc/mediatek/devapc.yaml
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/devapc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
