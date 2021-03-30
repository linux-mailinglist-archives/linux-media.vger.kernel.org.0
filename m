Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9955F34E4EC
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 11:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhC3J6Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 05:58:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40222 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbhC3J6X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 05:58:23 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AABBC102;
        Tue, 30 Mar 2021 11:58:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617098301;
        bh=KQexPofric7XCkn2Agbn0SGu83LfkNQ/8twI3ckzDIk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GfC2fqGEwKP/xgChDjerhJ9NzTMnrH4nS0V0Ia+lPeFT1blzW0/bWFvUQOP0CBtQb
         XFr90hEIb0ASNiR6TI4YY+KBv0uKEa7JRV3bqkEHVx1H3vNWxJL/BzCGi9cSbG58uF
         W30NtvNXTisrxZbHovE/NKEUAIGewE15n1qdKwOE=
Date:   Tue, 30 Mar 2021 12:57:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: RFC: dt-binding: media: document ON Semi AR0521 sensor bindings
Message-ID: <YGL2EXjEdWDCpsvk@pendragon.ideasonboard.com>
References: <m3o8fjs02a.fsf@t19.piap.pl>
 <YFEBRGF20xhpHese@pendragon.ideasonboard.com>
 <m3czvhxanx.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3czvhxanx.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Tue, Mar 30, 2021 at 11:17:54AM +0200, Krzysztof Hałasa wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
> 
> >> +  reg:
> >> +    description: I2C bus address of the sensor device
> >
> > You can drop this, it's implicit for I2C devices.
> 
> Do you mean just dropping these two lines (and MaxItems: 1), and leaving
> "reg" in "required" and in the example? E.g.:

I meant dropping the description, sorry. You need to keep

  reg:
    maxItems: 1

> ...
> required:
>   - compatible
>   - reg
>   - clocks
>   - clock-names
>   - port
> 
> additionalProperties: false
> 
> examples:
>   - |
>     #include <dt-bindings/gpio/gpio.h>
>     #include <dt-bindings/clock/imx6qdl-clock.h>
> 
>     i2c {
>             #address-cells = <1>;
>             #size-cells = <0>;
> 
>             ar0521: camera-sensor@36 {
>                     compatible = "onnn,ar0521";
>                     reg = <0x36>;
>                     pinctrl-names = "default";
> 
> ...
> 
> It protests with:
> 
> Documentation/devicetree/bindings/media/i2c/onnn,ar0521.example.dt.yaml:
> camera-sensor@36: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
>         From schema: /usr/src/linux/imx6/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
> 
> Thus I'm currently leaving it as is.

-- 
Regards,

Laurent Pinchart
