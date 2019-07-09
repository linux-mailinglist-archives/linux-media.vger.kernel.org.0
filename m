Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A20DE63C54
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 22:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729088AbfGIUBZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 16:01:25 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46135 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728959AbfGIUBY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 16:01:24 -0400
Received: by mail-io1-f67.google.com with SMTP id i10so45785550iol.13;
        Tue, 09 Jul 2019 13:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B7/QcW7r5MQOGhPEoQO1LbngGWl8Cp/c3zBrZbGmskM=;
        b=BmL8bFLtY/b8HJ9LNKgDW7qtyOkGvfYPL/II1VC9Nkfmp8Zha17QGZo1/+lsGjY5XV
         6XxAgxiy6Ga13SLci+cfWWHjNJ0DFhB6syC/iljDLbF7CESedfTP/vOtQGTxwXdyKe8d
         gNRMjmOelzMFxEYOvgZzRp46mxeyD8qzp/+BwwZe53WSKqzB4Tapkfn+Ys0w4oOsy+7P
         sgfLlKy9Al4LOGqliPr+MymPiv5MadGV/f11MwPiYqoJ7JVcw1sFJKd5C8ZZmPcqneBB
         7ELPZMFbyS2ORPHF17vsDUmwDg5ypC74HQFpRUNIHctrWskP6OMreSSDmVx/DOzvKuOq
         jX/g==
X-Gm-Message-State: APjAAAViEZmOg+qY47hTM+8j3b56rowlYUOxPHr0Yx7iymi7XtHplNoj
        pXCGdyTlF8g+bp2gglhOGQ==
X-Google-Smtp-Source: APXvYqytSsRPVq3GTbSVDnVsku/qIgTDId3MOrt1dloK9TJz1SnYYCUTN2WCuwk38In8AaLhppOnLQ==
X-Received: by 2002:a02:7f15:: with SMTP id r21mr31288185jac.120.1562702483721;
        Tue, 09 Jul 2019 13:01:23 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id s2sm15525321ioj.8.2019.07.09.13.01.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 13:01:23 -0700 (PDT)
Date:   Tue, 9 Jul 2019 14:01:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Cheng-Yi Chiang <cychiang@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/7] ASoC: rockchip: rockchip-max98090: Add node for HDMI
Message-ID: <20190709200121.GA19118@bogus>
References: <20190603043251.226549-1-cychiang@chromium.org>
 <20190603043251.226549-6-cychiang@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603043251.226549-6-cychiang@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 03, 2019 at 12:32:49PM +0800, Cheng-Yi Chiang wrote:
> Let user specify HDMI node so machine driver can use it to let codec
> driver register callback on correct hdmi-notifier.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  Documentation/devicetree/bindings/sound/rockchip-max98090.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
> index a805aa99ad75..dae57c14864e 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
> +++ b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
> @@ -7,6 +7,7 @@ Required properties:
>    connected to the CODEC
>  - rockchip,audio-codec: The phandle of the MAX98090 audio codec
>  - rockchip,headset-codec: The phandle of Ext chip for jack detection
> +- rockchip,hdmi: The phandle of HDMI node for HDMI jack detection
>  
>  Example:
>  
> @@ -16,4 +17,5 @@ sound {
>  	rockchip,i2s-controller = <&i2s>;
>  	rockchip,audio-codec = <&max98090>;
>  	rockchip,headset-codec = <&headsetcodec>;
> +	rockchip,hdmi= <&hdmi>;

space                ^

With that,

Acked-by: Rob Herring <robh@kernel.org>

>  };
> -- 
> 2.22.0.rc1.257.g3120a18244-goog
> 
