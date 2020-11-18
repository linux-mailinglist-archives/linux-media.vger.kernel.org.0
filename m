Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3D42B7E70
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 14:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgKRNkG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 08:40:06 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgKRNkF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 08:40:05 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4D449BF;
        Wed, 18 Nov 2020 14:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605706803;
        bh=1geR/exmqMp91/LbjtCPKbAdQ0uy80PivlfD1KouC6M=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=f5JgRB3PcbggpnlgDTDW8VxQgAnICGfZvjkH+u5ntgxoYi0ovNw4Xb28eDtwoD3sL
         dqhD19xVvqM8wKOyLNH+Tlcd5yaAph0dcWCbJ8b7vVKFU9BL1iyA9gg8KfKlEHV5B5
         N1yPoHhmoer205R5VdqxHDlXtqzBV8Gku3pXoOt4=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v5 7/8] [DNI] arm64: dts: renesas: salvator-x-max9286:
 Specify channel amplitude
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
References: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
 <20201116135305.81319-8-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <71d9898f-2371-7c9d-e0da-cdec1b69ba0f@ideasonboard.com>
Date:   Wed, 18 Nov 2020 13:40:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116135305.81319-8-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/11/2020 13:53, Jacopo Mondi wrote:
> Use the newly introduced 'maxim,initial-reverse-channel-mV'
> property to specify the initial reverse channel amplitude when
> the remote serializers are pre-programmed with noise immunity threshold
> enabled.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



> ---
>  arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi b/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
> index 6f4798859542..f14a133b7302 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
> @@ -128,6 +128,7 @@ gmsl-deserializer@4c {
>  		compatible = "maxim,max9286";
>  		reg = <0x4c>;
>  		poc-supply = <&poc_12v>;
> +		maxim,initial-reverse-channel-mV = <170>;
>  
>  		ports {
>  			#address-cells = <1>;
> @@ -263,6 +264,7 @@ gmsl-deserializer@6c {
>  		compatible = "maxim,max9286";
>  		reg = <0x6c>;
>  		poc-supply = <&poc_12v>;
> +		maxim,initial-reverse-channel-mV = <170>;
>  
>  		ports {
>  			#address-cells = <1>;
> 

