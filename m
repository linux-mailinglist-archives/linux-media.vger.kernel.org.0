Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC80427458D
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 17:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgIVPkp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 11:40:45 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:40787 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgIVPko (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 11:40:44 -0400
Received: by mail-il1-f196.google.com with SMTP id x18so15285067ila.7;
        Tue, 22 Sep 2020 08:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CjP3FaqB3xLlWdr6WInpgaxgqbiPdi3G8u/3sWsh5ow=;
        b=ZG5bj2zJF3+AR3v6Ma8+SFCljc8+kVL+K/DxOUX4tEgVnxaR4jVVQelHGYog0nB7F8
         SUmxc3s7JZIkPxzxZ4oDre73e9L8FVOke3txjHgAGzXDpiyXaFNiLzAl2aTjFYigpvqy
         iT7LYMgoLpHoQpbNsi7JhrTeShuK2nRwgOj0EcTNbdtrIdXvxBt67EYogD5d8K2d7gPz
         YY/O4Aw9DWu51WibKXv11LOVTXdpnxH9Kzg23loXux5zXJIaf2Lr3Enhi5KmCOhaZxNt
         8JfaF5SEmQHLWGsN/7WJij1PYUavGFHzsF4e0CHempXbi12mdAfKjMlnhr4n9A6fi1hl
         I9Vg==
X-Gm-Message-State: AOAM5326HzR3jR1wGVNYm4Id1w+n+QF3xo/4jFsFIaXS2G5E0HGgkA8q
        30K1Q0nNpdRSBPNbJb3xWg==
X-Google-Smtp-Source: ABdhPJwQoEwM/M3ijOW1oWfyfZVRyxlGnhJRQmLBrTBNtjoQCGXIHE0IkmbOCWPcPfO5+I2VpOjP9Q==
X-Received: by 2002:a92:405d:: with SMTP id n90mr4659530ila.58.1600789243916;
        Tue, 22 Sep 2020 08:40:43 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l6sm1265375ils.6.2020.09.22.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 08:40:42 -0700 (PDT)
Received: (nullmailer pid 2730811 invoked by uid 1000);
        Tue, 22 Sep 2020 15:40:41 -0000
Date:   Tue, 22 Sep 2020 09:40:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: dt-bindings: media: i2c: Add bindings for
 TW9900
Message-ID: <20200922154041.GA2730544@bogus>
References: <20200918142422.1086555-1-maxime.chevallier@bootlin.com>
 <20200918142422.1086555-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918142422.1086555-3-maxime.chevallier@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 18 Sep 2020 16:24:21 +0200, Maxime Chevallier wrote:
> The Techwell TW9900 is a video decoder supporting multiple input
> standards, such as PAL, NTSC and SECAM, and outputs a BT.656 video
> signal.
> 
> It's designed to be low-power, posesses some features such as a
> programmable comb-filter, and automatic input standard detection.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../devicetree/bindings/media/i2c/tw9900.yaml | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/tw9900.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/media/i2c/tw9900.example.dts:28.46-47 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/media/i2c/tw9900.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1367017

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

