Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961082D1DF0
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 00:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgLGW76 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 17:59:58 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45195 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgLGW75 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 17:59:57 -0500
Received: by mail-ot1-f68.google.com with SMTP id h18so10190780otq.12;
        Mon, 07 Dec 2020 14:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u68n1Z29DrDl0c987oxwFjaFo/JQpyXuVglTLEmfnmg=;
        b=j2WnI1WtptY1Lx7Mpnb935C/ROeZ2iS7myDpAVhyEgvypwBazQ16SCC2TmxlEzw+jp
         DEtdEhh/qtbRgFz2s7qdkWpVNcZgxGhqreRaPPql4mdu4Lk/WWkh1jUfsF/gbdY4kIrE
         jnsnNhnHwppP3mSLH0KQk0j3dKkaHzE7VGPWZuRau+KRs+0ojq2cmHAJEo7n6YR7mw27
         rnGO3tirFxcMBk5N/ApnCHoo6b8tP9SIYnYEWhWdBQnzJ7hKYk0qpyVnk2hsJhggrrlf
         EmLCdyWc7fknAacYGY6Z/nCVYWpl6j/8myYuP1HQd0Biz0iDPz+OtveYLLIpUc4UKYvC
         xtng==
X-Gm-Message-State: AOAM532Xtkr6AkArTsPCOs5ovECNWS7Dr7Lp53IpNowDGKMvBYns0W9a
        q7hsHYxRbwPCmsSclcb5mQ==
X-Google-Smtp-Source: ABdhPJwDAeS253Mx7NZTvA7Pkqt6sBA6Dd0tVqoo4dexxHY+vYPatp++kT/Lug4cBC3Ga6TGdIuEhw==
X-Received: by 2002:a9d:6a99:: with SMTP id l25mr5302128otq.178.1607381956549;
        Mon, 07 Dec 2020 14:59:16 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x72sm3283950oia.16.2020.12.07.14.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 14:59:15 -0800 (PST)
Received: (nullmailer pid 1005036 invoked by uid 1000);
        Mon, 07 Dec 2020 22:59:14 -0000
Date:   Mon, 7 Dec 2020 16:59:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stafford Horne <shorne@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Karol Gugala <kgugala@antmicro.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mateusz Holenko <mholenko@antmicro.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/5] dt-bindings: soc: add the required property
 'additionalProperties'
Message-ID: <20201207225914.GA1004985@robh.at.kernel.org>
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

Reviewed-by: Rob Herring <robh@kernel.org>
