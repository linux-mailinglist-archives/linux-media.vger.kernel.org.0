Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E00322328
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 01:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbhBWAf1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 19:35:27 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:47009 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbhBWAfZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 19:35:25 -0500
Received: by mail-ot1-f51.google.com with SMTP id k13so3414619otn.13;
        Mon, 22 Feb 2021 16:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lyivJb9f8wPCa/lD4YB1UDD8vooV05Tees3O5Wb+cLw=;
        b=P3YpxXnT/oPHaTDSrJ0hpqG9QVG04vXWFLge+LBwikvggqsDNNYvXx4aDh0vixBg1p
         wvu92qn9w+OhvCVkmZAcYmrPPq92SZIUyiCo7H5AXzCYH7nElQnJyFjNV+8OTP/CSUno
         jtVpAcW/CvgMAGd0P9gYcWkBps5xoHs6V1p2Ye1vOfWEOB3e5ugqDWxsdUNjEvBt9nG8
         5Ahwen8jdmEmjqZlOyEjUquSRNJz01zwIpDQvrQgdMFfuBskIoEtIPB3rXwgD8P2xF9e
         HyQkP4kefNDeNdKNkQE3X9PJZOywJqorE+ZIbCaZAD1W+dXj3XB3/j2gf0wK4b1MFzoR
         EQrQ==
X-Gm-Message-State: AOAM531A6FlNrFa8Za8pGcBuRCUitZxmn7gOYQpfZ4AL2IjrxGMAKhBs
        7y7xrzYWANXeJ7jxaQ/OFw==
X-Google-Smtp-Source: ABdhPJx6i286DEQbq/GZ3Ul1huDMj1I7vyETL5vk9U6RLjl8/FuVzm0xigHBLix9OEtaxy4LDFdbQg==
X-Received: by 2002:a9d:42c:: with SMTP id 41mr4093792otc.108.1614040484864;
        Mon, 22 Feb 2021 16:34:44 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r13sm3901863oot.41.2021.02.22.16.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 16:34:44 -0800 (PST)
Received: (nullmailer pid 2517303 invoked by uid 1000);
        Tue, 23 Feb 2021 00:34:42 -0000
Date:   Mon, 22 Feb 2021 18:34:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v3 8/9] dt-bindings: media: nxp,imx8mq-vpu: Update
 bindings
Message-ID: <20210223003442.GA2516123@robh.at.kernel.org>
References: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
 <20210222122406.41782-9-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222122406.41782-9-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 22, 2021 at 01:24:05PM +0100, Benjamin Gaignard wrote:
> The current bindings seem to make the assumption that the
> two VPUs hardware blocks (G1 and G2) are only one set of
> registers.
> After implementing the VPU reset driver and G2 decoder driver
> it shows that all the VPUs are independent and don't need to
> know about the registers of the other blocks.
> Remove from the bindings the need to set all blocks register
> but keep reg-names property because removing it from the driver
> may affect other variants.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 2:
> - be more verbose about why I change the bindings
> Keep in mind that series comes after: https://www.spinics.net/lists/arm-kernel/msg875766.html
> without that review and ack it won't work

Better, but you've still mentioned nothing about breaking compatibility.
Why is that okay?
