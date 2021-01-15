Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E617A2F7685
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 11:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbhAOKVF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 05:21:05 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49086 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbhAOKVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 05:21:05 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50204527;
        Fri, 15 Jan 2021 11:20:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610706023;
        bh=7kyTqT9FN3b8Uy0+26Q2u/qi3/6ocHnWu+k0Ue4GOIQ=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=Ahq71RtSQq0hGbv4pBioh9yKMSIoC48x0lcZnqJyvtDVAdJ1XUj7jUbtQ3Jsujc0d
         zmzSHpYXcGSLPvumsIkMuXM1i/xAVCheHTObwIDZw5i/2esEQLpEiuuGEjO5rMLC/q
         OjYi49pV7DHh5Gdhe57qwrp0rlazvPZyTRzL/ZZM=
Subject: Re: [PATCH] dt-bindings: media: ov5647: Fix filename
To:     Jacopo Mondi <jacopo@jmondi.org>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org
References: <20210115101652.9275-1-jacopo@jmondi.org>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c77755a4-4386-f5b0-cb47-64227d022b4b@ideasonboard.com>
Date:   Fri, 15 Jan 2021 10:20:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115101652.9275-1-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 15/01/2021 10:16, Jacopo Mondi wrote:
> Commit 1b5071af8240 ("media: dt-bindings: media: i2c: Rename
> ov5647.yaml") renamed the bindings file but did not update the
> Id: field there.
> 
> Fix it by using the new filename.
> 
> Fixes: 1b5071af8240 ("media: dt-bindings: media: i2c: Rename ov5647.yaml")
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

I wonder if this could be automatically validated by one of the checkers
at some point. (I assume it isn't already).

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> index 280c62afae13..429566c9ee1d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/media/i2c/ov5647.yaml#
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5647.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>  title: Omnivision OV5647 raw image sensor
> --
> 2.29.2
> 

