Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6F42B79F
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 16:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfE0Of1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 10:35:27 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:57625 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726311AbfE0Of1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 10:35:27 -0400
Received: from [IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13] ([IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VGiihbarq3qlsVGijhd5I4; Mon, 27 May 2019 16:35:25 +0200
Subject: Re: [PATCH v6 3/5] media: dt-bindings: media: Add vendor prefix for
 allegro
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
        tfiga@chromium.org, dshah@xilinx.com, Rob Herring <robh@kernel.org>
References: <20190513172131.15048-1-m.tretter@pengutronix.de>
 <20190513172131.15048-4-m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3e65382c-f120-8310-5407-6a6a115913f2@xs4all.nl>
Date:   Mon, 27 May 2019 16:35:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513172131.15048-4-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC8zU/A5m9MDwrIrNxUaI4R7nr2xjZ5ltjm1HAvhEo1W70TRmETVAbKM3JsGsc69zSSQNARVwF3zz78+9mq7ulHWYfHWq3WI6/7rWCnXN9885gwG3nGB
 NZ3BRFGmOmXPdKeziX3kurfOmddr26a78LozAysRW/fcPFwuH4dGwTcntNkHeyfR+W79BS+ndVWKLIWrfzSRBdWB43+QME4GHMQWzHtZSzqCTviqqGLRc97B
 z6ajDEQDXuE/VLk2e6ITrK18Au+Bq0IgH8bI9USc+SxzGZWMFe0SnPIqWcKP34f9OT7SHn8l+Uk0xy9bUK/1pNRlZasbqCFeyhJUBzxHZb5vI/81xV4Uzv1x
 A1jMuf61glPyhgydWKSpPOY+uhwpeVAMUBkYHanRU9TTW1XBpkQQ522OVsc8qRUP8exF4XVHhbFDtKk8/xg4K95+ukp1Tem1QrnFx6NL2PYDbE7HcIFUHrnw
 F17ht2cPXFmjp7CBtyr0klJtwSkNwdY0tFaS6I7iNAHRU2vZlje99lsxiJE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

This patch no longer applies (vendor-prefixes.txt is now vendor-prefixes.yaml).
Can you rebase this patch?

Regards,

	Hans

On 5/13/19 7:21 PM, Michael Tretter wrote:
> Add vendor prefix for Allegro DVT, a provider of H.264/AVC, H.265/HEVC,
> AVS2, VP9 and AV1 compliance test suites and H.264/AVC, H.265/HEVC, and
> VP9 encoder, codec and decoder hardware (RTL) IPs.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v5 -> v6:
> none
> 
> v5:
> - new patch
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 8162b0eb4b50..78a849b25f64 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -16,6 +16,7 @@ adi	Analog Devices, Inc.
>  advantech	Advantech Corporation
>  aeroflexgaisler	Aeroflex Gaisler AB
>  al	Annapurna Labs
> +allegro	Allegro DVT
>  allo	Allo.com
>  allwinner	Allwinner Technology Co., Ltd.
>  alphascale	AlphaScale Integrated Circuits Systems, Inc.
> 

