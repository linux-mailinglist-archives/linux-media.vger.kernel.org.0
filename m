Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BC42DEAE8
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 22:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbgLRVRu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 16:17:50 -0500
Received: from mail-oo1-f46.google.com ([209.85.161.46]:44651 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgLRVRt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 16:17:49 -0500
Received: by mail-oo1-f46.google.com with SMTP id j21so885954oou.11;
        Fri, 18 Dec 2020 13:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jEbr5s4D+ZYMzO40gLC2UnGAo9wF8hMz62vqs5D6Is0=;
        b=BzKcxc46alylRqRDJgwY6l7Kleua2U29hCYMZYGRvVRWfh8+OV6qfdFzx2iyxVuO5v
         AHNlDbCbC1CGQ6zNi/0XihKaobZVWMyltUqrKOpfvLpP+d3wBwgcjCU4qtLdbCJOvppl
         8FNhogY7juIsugkm821O2bzcjX9a2JK2pCi43owv65L1dtorTfBw+HVGPfoj/OlNqs+K
         OGJ94B3OZ8x3UjfxBxUxb7wZ2xbVmMT87R76ckmj7dfpZkGkGBPVG1NlGdgUqbUeUSqL
         3e9kqOvCqFhZgMS2GGX+nVWP6+KadTO4J37ZkcXPdJS+UE6Qw1h/vLQxPdHY5mSy02eL
         2K4A==
X-Gm-Message-State: AOAM530xhM6ZrxbXtMSftO3vu45zJvu6gKIuLYW+YQJUVQUOyCOYcNPw
        rHO9OcUzJNGxOwfIspIKMA==
X-Google-Smtp-Source: ABdhPJz1hrSQ11VEvWW1bcr9TnHL55sCBxx5SwUaddzYOjGxqP6qsmV4Le1WPCV8esAZOjxClkh9Gg==
X-Received: by 2002:a4a:4f0f:: with SMTP id c15mr4258954oob.75.1608326228529;
        Fri, 18 Dec 2020 13:17:08 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i1sm2197006otr.81.2020.12.18.13.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 13:17:07 -0800 (PST)
Received: (nullmailer pid 2190532 invoked by uid 1000);
        Fri, 18 Dec 2020 21:17:06 -0000
Date:   Fri, 18 Dec 2020 15:17:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Karol Gugala <kgugala@antmicro.com>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media <linux-media@vger.kernel.org>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: soc: add the required property
 'additionalProperties'
Message-ID: <20201218211706.GA2190351@robh.at.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-4-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204093813.1275-4-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 04 Dec 2020 17:38:11 +0800, Zhen Lei wrote:
> When I do dt_binding_check for any YAML file, below wanring is always
> reported:
> 
> xxx/soc/litex/litex,soc-controller.yaml: 'additionalProperties' is a required property
> xxx/soc/litex/litex,soc-controller.yaml: ignoring, error in schema:
> warning: no schema found in file: xxx/soc/litex/litex,soc-controller.yaml
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/soc/litex/litex,soc-controller.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
