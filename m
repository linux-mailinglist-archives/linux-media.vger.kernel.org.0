Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A282D1DEC
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 00:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbgLGW7k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 17:59:40 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42747 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgLGW7j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 17:59:39 -0500
Received: by mail-oi1-f193.google.com with SMTP id l200so17335436oig.9;
        Mon, 07 Dec 2020 14:59:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dDAvG00SrOftyhEZu/9QMTjp5fmGYTX2yGfHUYcWWzY=;
        b=hLqydeoTXyQfCzrL7qOaWZsmMdeeJuPkFul1rTyjSkRcIl8guFyP4OwQTInmKEVTVJ
         QveQhVIWH7dYxdDAazgCqBpFCor/irnxl6BlvWIw3lC9BFsC2bh4/iaBIRCcxQu8Yajo
         dUU9QEdHzw5ErTHiRAJN7d7J3SqYhAykUw6lNQiVlVfQY00xEJh9YK1FPlQ2Cg0MyzJc
         B49GL9YN1yRmeNIMs/RcAvuAHPBsrcFH3k8I8XqzfOHXxgUKYvdTxcoxzpGtP1KuQ40n
         9X6cH84EDLkriWAKk4BN5yJPXouqvE5TlTZ1mkHD5Awb6ck6B51OU9PcC5yel7QDVbHb
         GzpA==
X-Gm-Message-State: AOAM531D+gAtGuZk58VxlQ6XVqW+bNYAoemDm8JeNshS9Z5E4xKRtnjF
        bWrLbRUNEGNuWru3cDN3+w==
X-Google-Smtp-Source: ABdhPJx+ZRhYn1sd/H/ieyNhhCTI4YoNfNdq4GrSu3H1BIPquWZr7UzN5bnmTYDnd8/TDp6CMdWojg==
X-Received: by 2002:aca:bb43:: with SMTP id l64mr812393oif.52.1607381938769;
        Mon, 07 Dec 2020 14:58:58 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u141sm67076oie.46.2020.12.07.14.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 14:58:57 -0800 (PST)
Received: (nullmailer pid 1004451 invoked by uid 1000);
        Mon, 07 Dec 2020 22:58:56 -0000
Date:   Mon, 7 Dec 2020 16:58:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Karol Gugala <kgugala@antmicro.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Stafford Horne <shorne@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Mateusz Holenko <mholenko@antmicro.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: serial: add the required property
 'additionalProperties'
Message-ID: <20201207225856.GA1004420@robh.at.kernel.org>
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

Reviewed-by: Rob Herring <robh@kernel.org>
