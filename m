Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBC91834D8
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 16:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgCLPWH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 11:22:07 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36030 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbgCLPWH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 11:22:07 -0400
Received: by mail-oi1-f194.google.com with SMTP id k18so5847911oib.3;
        Thu, 12 Mar 2020 08:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a6WnhHW3Np3QbKKjKxFHHPr40yxHHv0stzGtOBzaVLc=;
        b=Ajzy88o1z1uZ1QmCTbV542KMoeGco9C9ZSSv6fE9nqI2LVzGy6N5CMGl4g+NSw78S9
         zpTcFXe8LmZnprcYyLd2Ab6cAMZuvP9gWTb1L5BOO6tW9dx5HnVP5fSJ7j03bl93T2Ln
         tmhns6S13/C14644ahuAWCdmiIL8LJ5mB/gOz9AIj+NfmyLXqhbLOmJCqxZehg1bY+2c
         gT1K867oAoR8wFhgwW2wN2w+2TCMDsLZAQt3AwabTDXwyt2QTDVgYZvR1wrznU3THEuV
         t5gNCT/GnHFuDznuRp+3QsNMZCGmW0HiV4nuKugnvHvda2RHIVW0ppmvvLxLcQKUD5/z
         Dr+w==
X-Gm-Message-State: ANhLgQ1WsTo4pVhUWwaxqjDJy4A9MnZG7JPoKBQHKq9OdO3Oee37S9yQ
        GwmyYPMIWHcACnKNUm/5yw==
X-Google-Smtp-Source: ADFU+vsZYyNPazIaY4y6ozlG69lisQb63cqMqP+Ill41cx5dK6OIRcqAtvQNyW37X+H801eBMb1U7g==
X-Received: by 2002:a05:6808:b1c:: with SMTP id s28mr3046470oij.2.1584026526006;
        Thu, 12 Mar 2020 08:22:06 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a22sm10865950oto.45.2020.03.12.08.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 08:22:05 -0700 (PDT)
Received: (nullmailer pid 17075 invoked by uid 1000);
        Thu, 12 Mar 2020 15:22:03 -0000
Date:   Thu, 12 Mar 2020 10:22:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     mark.rutland@arm.com, ck.hu@mediatek.com, p.zabel@pengutronix.de,
        airlied@linux.ie, mturquette@baylibre.com, sboyd@kernel.org,
        ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com,
        Allison Randal <allison@lohutok.net>,
        Matthias Brugger <matthias.bgg@gmail.com>, wens@csie.org,
        linux-media@vger.kernel.org, sean.wang@mediatek.com,
        hsinyi@chromium.org, rdunlap@infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-kernel@lists.infradead.org, matthias.bgg@kernel.org,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        frank-w@public-files.de, devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        linux-kernel@vger.kernel.org, mtk01761 <wendell.lin@mediatek.com>,
        Richard Fontana <rfontana@redhat.com>
Subject: Re: [PATCH v12 2/5] dt-bindings: mediatek: Update mmsys binding to
 reflect it is a system controller
Message-ID: <20200312152203.GA15635@bogus>
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
 <20200311165322.1594233-3-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311165322.1594233-3-enric.balletbo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 11, 2020 at 05:53:19PM +0100, Enric Balletbo i Serra wrote:
> The mmsys system controller is not only a pure clock controller, so
> update the binding documentation to reflect that apart from providing
> clocks, it also provides routing and miscellaneous control registers.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
> 
> Changes in v12: None
> Changes in v10:
> - Update the binding documentation for the mmsys system controller.
> 
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> 
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt    | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
