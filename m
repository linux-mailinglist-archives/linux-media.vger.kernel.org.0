Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E311CEA2E
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 03:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgELBli (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 21:41:38 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35497 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgELBli (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 21:41:38 -0400
Received: by mail-oi1-f196.google.com with SMTP id o7so16924736oif.2;
        Mon, 11 May 2020 18:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qc7aeZe8qKrHeqqbdWlSzYUTH7CM0WkR8L80HDu2Jy4=;
        b=F3tvvfc5oHR3pf9tKZh1o2xmhx5MfrrzBIZRwv9sl858GrcOAdeppNjVxb5SLfFHLV
         G1sKOjjaz9ITRbK75l4D9jZzn24lPtQCqe+NPV1ZAZs6JFfPgciG9efcY87kormQSy/9
         7TT9R6XfhKa26UKEExBCKnY2lu9iGeSiIrRtGJegzDaHFagG0gG0PcsWFcLBqGyCbpT1
         y1X0PmAkVunDcT4odpQMWVd3KZi0nn9lyTzcN8tsfrxMfSWx0r857uC+jKNdOAG3i9Cb
         GrzZDbr8CAF5gAaP76btA2mRXG9yHvwfzAp/3SaRMb5VFoBV+YDKRsmySvVhV6eI3QLa
         YP4A==
X-Gm-Message-State: AGi0PuZE1CqSCQUqy4BxiozB7y1BwFFWgreyOnxQrnBinDCVdQlKZiH0
        VVPKB6S6dhRz6SCna4j3hg==
X-Google-Smtp-Source: APiQypLtu39AJZfEb9cdImmCaZsDHwlqCT3WzgPF/Bxr7JVZSOElTYZZjaXHg/QrGCEcZAYMLJ4VYg==
X-Received: by 2002:aca:a90e:: with SMTP id s14mr22266347oie.80.1589247696893;
        Mon, 11 May 2020 18:41:36 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 130sm1697610oid.43.2020.05.11.18.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 18:41:36 -0700 (PDT)
Received: (nullmailer pid 15739 invoked by uid 1000);
        Tue, 12 May 2020 01:41:35 -0000
Date:   Mon, 11 May 2020 20:41:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: Add Marvell MMP Audio Clock
 Controller binding
Message-ID: <20200512014135.GA15336@bogus>
References: <20200511195534.1207927-1-lkundrak@v3.sk>
 <20200511195534.1207927-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511195534.1207927-2-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 11 May 2020 21:55:33 +0200, Lubomir Rintel wrote:
> This describes the bindings for a controller that generates master and bit
> clocks for the I2S interface.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../clock/marvell,mmp2-audio-clock.yaml       | 73 +++++++++++++++++++
>  .../dt-bindings/clock/marvell,mmp2-audio.h    |  8 ++
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/marvell,mmp2-audio-clock.yaml
>  create mode 100644 include/dt-bindings/clock/marvell,mmp2-audio.h
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/clock/marvell,mmp2-audio-clock.example.dts:20:18: fatal error: dt-bindings/power/marvell,mmp2.h: No such file or directory
         #include <dt-bindings/power/marvell,mmp2.h>
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/clock/marvell,mmp2-audio-clock.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/clock/marvell,mmp2-audio-clock.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1288040

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

