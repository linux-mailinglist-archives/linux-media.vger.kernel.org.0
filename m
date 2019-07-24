Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFE1073406
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 18:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387402AbfGXQhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 12:37:41 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34418 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbfGXQhl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 12:37:41 -0400
Received: by mail-io1-f68.google.com with SMTP id k8so91003976iot.1;
        Wed, 24 Jul 2019 09:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=aN3WiNJl0bfCZ6MqW9HUrJKO6cOxUKnLi8cPca8JyJ4=;
        b=PXkLnpXrc225FlQ/IUjX8YWqOFAh82Ma4N7/JtL5wngdM7SoIazxcbU7DyrPlaWbQU
         U6cozBESoJr1QeudKNIRORYrFA45yXj0FZQck3ecKJ4SQsrDrnxmKuV/0urqr5cBqDeO
         vP8zfXaYpE3dJa/qHYJe+5iEt2vxFBsybecYY7knLuBh3mHYQ6rzZDJSp1/N5AXMq5eW
         e9/aGHbC7pSKG6++sJwIkDw/baWVYomzEghH9zHEvbC/ejcB5kB9nfkEJAyOPZZeQWn6
         WzHeFzfqKp0mPwtyGo6JuVut7/L3vDDV46xFYZ457x6vp5AVV0N6/cwdPuV9qwpsbMJm
         Ve2w==
X-Gm-Message-State: APjAAAUm8YYL6EMs7SQ93t6yEITKNsxcdwkPiTebdQqfq88jd5qLekb+
        sn7gZ2MfrPZ0v68Cn0K0Cg==
X-Google-Smtp-Source: APXvYqxBJFBHz4CQS6sQgG+9iwqs2ivKeU8rEkIxda0VNz5GfxhHcwnTFYOz14lhl0mS6oDzsTpOug==
X-Received: by 2002:a5d:8195:: with SMTP id u21mr78103739ion.260.1563986260529;
        Wed, 24 Jul 2019 09:37:40 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id l5sm80967912ioq.83.2019.07.24.09.37.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 09:37:39 -0700 (PDT)
Date:   Wed, 24 Jul 2019 10:37:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     dongchun.zhu@mediatek.com
Cc:     mchehab@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
        sakari.ailus@linux.intel.com, tfiga@chromium.org,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS
 entry
Message-ID: <20190724163739.GA29502@bogus>
References: <20190708100641.2702-1-dongchun.zhu@mediatek.com>
 <20190708100641.2702-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190708100641.2702-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 08, 2019 at 06:06:40PM +0800, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> Add the Devicetree binding documentation and MAINTAINERS entry for dw9768.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt | 9 +++++++++
>  MAINTAINERS                                                     | 7 +++++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
> new file mode 100644
> index 0000000..94b8ec3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
> @@ -0,0 +1,9 @@
> +Dongwoon Anatech DW9768 camera voice coil lens driver
> +
> +DW9768 is a 10-bit DAC with current sink capability. It is intended
> +for driving voice coil lenses in camera modules.
> +
> +Mandatory properties:
> +
> +- compatible: "dongwoon,dw9768"
> +- reg: I²C slave address

Why not shared with the existing DW9807 binding? Or this could be a 
trivial device.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5cfbea4..8f6ac93 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4872,6 +4872,13 @@ S:	Maintained
>  F:	drivers/media/i2c/dw9714.c
>  F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
>  
> +DONGWOON DW9768 LENS VOICE COIL DRIVER
> +M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
> +L:	linux-media@vger.kernel.org
> +T:	git git://linuxtv.org/media_tree.git
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
> +
>  DONGWOON DW9807 LENS VOICE COIL DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.9.2
> 
