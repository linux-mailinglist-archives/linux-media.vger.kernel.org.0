Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7CD72B7E5A
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 14:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgKRNfA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 08:35:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44126 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgKRNfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 08:35:00 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 787D59BF;
        Wed, 18 Nov 2020 14:34:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605706497;
        bh=DBt7k3kM16a1u4PscOHfyfWUlWagJI1Kn1oXOaUi74g=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PFMJylTmhX9Td6Aa/GgqxbJCyoBWhtUe2G6Hw/yT+/b5rZZ4NP+5+GmQvEmaWCbSJ
         N8gk/redcZBNO3iJDOefIogErGBCMIH19/r5/Bb62o97wrcZ/HS45IGy90kOUIkvo2
         vBUb62DL6Chh4vrJM5ZuNFIfEV8r9sGLBHkfL0mU=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v5 0/8] media: i2c: Add RDACM21 camera module
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
References: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <53e43d23-483a-adc2-a3c4-3a2b821da832@ideasonboard.com>
Date:   Wed, 18 Nov 2020 13:34:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/11/2020 13:52, Jacopo Mondi wrote:
> Hello,
>    this v5 mostly changes how the rdacm21 driver handles writes to the
> OV490 chip by handling the 'high' part of the sensor register through an
> helper function as suggested by Kieran and Laurent.
> 
> The diff is available at:
> https://paste.debian.net/1172700/
> 
> Minor fixes in patches subjects and in bindings as reported by Sergei and
> Kieran.
> 
> Bindings have now been sent to DT people now that they've been reviewed
> by Kieran.
> 
> v4: https://patchwork.linuxtv.org/project/linux-media/list/?series=3847
> v3: https://patchwork.linuxtv.org/project/linux-media/list/?series=3657
> 
> Background in v1 cover letter:
> https://www.spinics.net/lists/linux-renesas-soc/msg52886.html
> 
> I have tested on Eagle V3M with 4 RDACM21, but the whole point of
> this series is to retain compatibility with RDACM20.
> 
> For this reason I have included 2 patches on top, not intended for merge
> that re-propose DTS support for the MAXIM max9286 expansion board connected
> to Salvator-X and add the newly introduced property to the DTS file.
> 
> Kieran, I know you have a working setup with RDACM20, the final patches are
> meant for ease your testing. Can you give this series a spin ?


After some rabbit-holes :-D:

A 5-camera capture on Salvator-X - https://pasteboard.co/JAW0PSr.png
For this series, on both Eagle-V3M and Salvator-X

Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



> Series based on latest renesas-drivers tag: renesas-drivers-2020-11-10-v5.10-rc3
> 
> Thanks
>   j
> 
> Jacopo Mondi (7):
>   media: i2c: Add driver for RDACM21 camera module
>   dt-bindings: media: max9286: Document
>     'maxim,initial-reverse-channel-mV'
>   media: i2c: max9286: Break-out reverse channel setup
>   media: i2c: max9286: Make channel amplitude programmable
>   media: i2c: max9286: Configure reverse channel amplitude
>   [DNI] arm64: dts: renesas: salvator-x-max9286: Specify channel
>     amplitude
>   [DNI] arm64: dts: renesas: eagle: Specify channel amplitude
> 
> Laurent Pinchart (1):
>   arm64: dts: renesas: salvator-x: Add MAX9286 expansion board
> 
>  .../bindings/media/i2c/maxim,max9286.yaml     |  23 +
>  MAINTAINERS                                   |  12 +
>  .../arm64/boot/dts/renesas/r8a77970-eagle.dts |   1 +
>  .../boot/dts/renesas/salvator-x-max9286.dtsi  | 396 ++++++++++++
>  drivers/media/i2c/Kconfig                     |  13 +
>  drivers/media/i2c/Makefile                    |   2 +
>  drivers/media/i2c/max9286.c                   |  58 +-
>  drivers/media/i2c/rdacm21.c                   | 595 ++++++++++++++++++
>  8 files changed, 1087 insertions(+), 13 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
>  create mode 100644 drivers/media/i2c/rdacm21.c
> 
> --
> 2.29.1
> 

