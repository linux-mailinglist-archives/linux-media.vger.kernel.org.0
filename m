Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D608468BB
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 22:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbfFNUSq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 16:18:46 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33599 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfFNUSq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 16:18:46 -0400
Received: by mail-qk1-f195.google.com with SMTP id r6so2543305qkc.0;
        Fri, 14 Jun 2019 13:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2S0DTzr7T25H6ahTWfAr0eKoReCAR3ggo1mfN8CFCHQ=;
        b=ZXPPb90LqGM4qxfK8ApOkyeWsu4ywqFSj0R6QWJBxAtrd0Vprwy6N9GHREaZVFYpyq
         m/Kv7D8foYoWI0l31FU7soeuBmCnv/+SGTYuujLt4chgm/mCHK8WNgoVdCcTkB75k7f+
         Pu+KbAA1PurYloVqpPofEIrITMxkdw26ArsMFujnm1AJwRXEowUh3vZiufjLxTphGanh
         nvo+xLC5kOxiMqvzCIgTC80t0FCe2nF2jgdGnyLeI2ii7KPhOTkVUpYccZJixMWyQIok
         FSpSwuioNPxhdB9Sg/Oz37FUxuTf739p+Y2BYXBRRptgJTcoj4Igjfxx+e9M/STFs+k7
         j7wQ==
X-Gm-Message-State: APjAAAUlp3RYnW5m8EDmvxQHWAcYE2A6RyavayhZvgudlX67I+cCaIhQ
        6p0WYqC9R19vAWin4mVfuQ==
X-Google-Smtp-Source: APXvYqwsKNTd0AOI6kAgPfjhl2V5K+SFwP4wtJ8cEJEVgj35zYt85Q1VitdZH1kp+GJIOs7FE8KOVw==
X-Received: by 2002:a37:e40a:: with SMTP id y10mr20766206qkf.303.1560543525092;
        Fri, 14 Jun 2019 13:18:45 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id l6sm1705339qkc.89.2019.06.14.13.18.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:18:44 -0700 (PDT)
Date:   Fri, 14 Jun 2019 14:18:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: media: sunxi-ir: add A31 compatible
Message-ID: <20190614201842.GA6768@bogus>
References: <20190528161440.27172-1-peron.clem@gmail.com>
 <20190528161440.27172-2-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190528161440.27172-2-peron.clem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 28 May 2019 18:14:29 +0200, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= wrote:
> Allwinner A31 has introduced a new memory mapping and a
> reset line.
> 
> The difference in memory mapping are :
> 
> - In the configure register there is a new sample bit
>   and Allwinner has introduced the active threshold feature.
> 
> - In the status register a new STAT bit is present.
> 
> Note: CGPO and DRQ_EN bits are removed on A31 but present on A13
> and on new SoCs like A64/H6.
> This is actually not an issue as these bits are togglable and new
> SoCs have a dedicated bindings.
> 
> Introduce this bindings to make a difference since this generation.
> And declare the reset line required since A31.
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/sunxi-ir.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
