Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962CE21A88B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 22:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgGIUEO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 16:04:14 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33231 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgGIUEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 16:04:14 -0400
Received: by mail-io1-f66.google.com with SMTP id d18so3693317ion.0;
        Thu, 09 Jul 2020 13:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ws0i2CrqY6pD3P73//8FyL2EApZ5BXXOhJZ2Q0taym4=;
        b=KVtNxa8k+q8TIDSPCrZ3ntuFP1OdXNQRPtulsV7hCbNbuLM0IKCWEUHbNP4qvHXIxm
         jOmjsBdPoJQbjHE7B0uds6vsmebVAKJc/AntB4H8kSlk+/swJJ8z5EFQKaoa9gs9uVCk
         aXJVPFmoBNYemfmqTYfqhaTuOi3BUdHJt1mNAXY6f/cLkyRSBSJW0KwZwRBvtgd/f6XH
         Qg7l0KL8bUbtKTamHIGPZsQsLd8OuSLJ/Cb3QH8SebQfH3uSxGlRh3Fh5J19uPjxiCl/
         8ZjdUf8GhkUOW/bng5699QggujBJTlOtSxyyChwYpy/lGhx1Zzlp1UwLIAgDNGFBfkEg
         40ew==
X-Gm-Message-State: AOAM532/1zDnTZxiavHmS7S7i2rA5jvgj5PvzyE3lDVAhjp+au96okh5
        PO7rE+KAf0QDPb/WlHHF0A==
X-Google-Smtp-Source: ABdhPJy5U3mHVxmJOTUHKoiDc1k/A6c2wX0Pp1z/J6O2LJznpvgIyHxe7LJcVtvRNHWYjrLa6wChdA==
X-Received: by 2002:a6b:6c09:: with SMTP id a9mr43481210ioh.178.1594325053494;
        Thu, 09 Jul 2020 13:04:13 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id z20sm2649443iot.15.2020.07.09.13.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:04:12 -0700 (PDT)
Received: (nullmailer pid 801025 invoked by uid 1000);
        Thu, 09 Jul 2020 20:04:11 -0000
Date:   Thu, 9 Jul 2020 14:04:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, linux-mediatek@lists.infradead.org,
        tfiga@chromium.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, andriy.shevchenko@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        sj.huang@mediatek.com, mark.rutland@arm.com,
        bgolaszewski@baylibre.com, shengnan.wang@mediatek.com,
        drinkcat@chromium.org, louis.kuo@mediatek.com,
        linus.walleij@linaro.org, sakari.ailus@linux.intel.com
Subject: Re: [PATCH V12 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200709200411.GA800946@bogus>
References: <20200702115223.21507-1-dongchun.zhu@mediatek.com>
 <20200702115223.21507-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702115223.21507-2-dongchun.zhu@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 02 Jul 2020 19:52:22 +0800, Dongchun Zhu wrote:
> Add DT bindings documentation for OmniVision OV02A10 image sensor.
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 172 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
