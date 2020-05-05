Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC7F81C60E8
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 21:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgEETPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 15:15:32 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:46565 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgEETPc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 15:15:32 -0400
Received: by mail-ot1-f49.google.com with SMTP id z25so2637915otq.13;
        Tue, 05 May 2020 12:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XoHZt1v+HXOCwO7SD36qP6zAfCtrd8CNqlmb++NU8YY=;
        b=S12EEkeQ0ir49Kki1FsKTHkHjiW0a6Y2p/53OT6636yqsk1yR9I8VLRS/talftGKXu
         DuOD/J0tTNvUqeTdawPOrq27tLKtXiorcCgfB3j3W2uw2cLihi/j+s3dfXKBOl8Ns6eq
         pN2zW3l5SZdDk/yaTAejXKAAwH2MfMO2GKFpyO6GqP16PFknKkttewuOIGz4IkbhH0Oc
         qU0NSlku7rMxXsj1aeCrbed9hK/r7iS0G8KU3M1Eu8XKoxaEEkiLpV2RdpYpVTrHALQc
         9E7nulRsTeNy+9rt6GiWzNVzgiH+vduKg/eKRfXDqwenhy23p7Cx30sHFgy5c0m8MtqE
         sRiQ==
X-Gm-Message-State: AGi0PuZefu1bZf36WBGi8morzW6N9snlJlewQmqcikk+4PGswJjxXxeu
        rvSvX3TVPMD7UatFnf/Zqg==
X-Google-Smtp-Source: APiQypJ0OwtXiTN14pTnb4JSYnEKPWlE8p/Y3d5aQVPv5XX3SPxmyciZRldsnF55K55eHRzZK/W7Zw==
X-Received: by 2002:a05:6830:2158:: with SMTP id r24mr3829724otd.65.1588706131344;
        Tue, 05 May 2020 12:15:31 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j70sm785945oib.53.2020.05.05.12.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 12:15:30 -0700 (PDT)
Received: (nullmailer pid 765 invoked by uid 1000);
        Tue, 05 May 2020 19:15:29 -0000
Date:   Tue, 5 May 2020 14:15:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        shengnan.wang@mediatek.com, sj.huang@mediatek.com,
        linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com,
        louis.kuo@mediatek.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: Re: [V5, 1/2] media: dt-bindings: media: i2c: Document DW9768
 bindings
Message-ID: <20200505191529.GA701@bogus>
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
 <20200502161727.30463-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502161727.30463-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 3 May 2020 00:17:26 +0800, Dongchun Zhu wrote:
> Add DeviceTree binding documentation for Dongwoon Anatech DW9768 voice
> coil actuator.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/dongwoon,dw9768.yaml        | 60 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
