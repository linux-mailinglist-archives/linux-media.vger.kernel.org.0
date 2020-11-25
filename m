Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9BA2C40EB
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 14:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729309AbgKYNJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 08:09:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728944AbgKYNJp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 08:09:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D702C0613D4;
        Wed, 25 Nov 2020 05:09:45 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 026E3292;
        Wed, 25 Nov 2020 14:09:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606309782;
        bh=reRVd882nXi3LuDXhBCQ4MjPHfFv1/eQYp3Emoa1WoI=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=Tixe2w+Vwwh6yuzZYH/RDp24sGNqYAUnXFx63zwO3RWCPQ67Pzu48CW6tZy74DRxS
         vSjLD1sOi/q90/UwM/ncolZbisAdwZ+u5ymtoXxetTA0CiT5veAPgmzP2mBcym28te
         +tFzg6Dt7n9xfZ787hfXS7UX4fSfR39NWhTMVwyk=
Subject: Re: [PATCH 0/3] adv748x: Add support for s2ram
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <7ec9c2ba-ea9c-2ce5-8ecf-6239448c711f@ideasonboard.com>
Date:   Wed, 25 Nov 2020 13:09:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 22/11/2020 16:36, Niklas Söderlund wrote:
> Hello,
> 
> This series enables usage of the ADV748x after the system have been 
> suspended to ram. During s2ram the ADV748x may be powered down and thus 
> lose its configuration from probe time. The configuration contains  
> among other things the i2c slave address mappings for the different 
> blocks inside the ADV748x. If this is lost the hardware listens to the 
> "wrong" i2c addresses and becomes inaccessible.
> 
> Example trying to read the analog standard before and after s2ram with 
> and without this this series.
> 

Should we be considering runtime_pm for this instead?

--
Kieran


> Without this series,
> 
>   # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
>   # v4l2-ctl --get-detected-standard -d $subdev
>   Video Standard = 0x000000ff
>           PAL-B/B1/G/H/I/D/D1/K
>   # echo on > /sys/bus/i2c/drivers/bd9571mwv/*/bd9571mwv-regulator*/backup_mode
>   ** flipp SW23 off **
>   # echo mem > /sys/power/state
>   ** flipp SW23 on **
>   # v4l2-ctl --get-detected-standard -d $subdev
>   [  502.753723] adv748x 4-0070: error reading 63, 02
>   [  502.866437] adv748x 4-0070: error reading 63, 02
>   VIDIOC_QUERYSTD: failed: No such device or address
> 
> With this series,
> 
>   # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
>   # v4l2-ctl --get-detected-standard -d $subdev
>   Video Standard = 0x000000ff
>           PAL-B/B1/G/H/I/D/D1/K
>   # echo on > /sys/bus/i2c/drivers/bd9571mwv/*/bd9571mwv-regulator*/backup_mode
>   ** flipp SW23 off **
>   # echo mem > /sys/power/state
>   ** flipp SW23 on **
>   # v4l2-ctl --get-detected-standard -d $subdev
>   Video Standard = 0x000000ff
>           PAL-B/B1/G/H/I/D/D1/K
> 
> Also any streaming while the system is suspended to ram fails to resume 
> without this series due to the issue demonstrated above. This series is 
> tested on R-Car M3-N on-top of latest media-tree.
> 
> Niklas Söderlund (3):
>   adv748x: afe: Select input port when device is reset
>   adv748x: csi2: Set virtual channel when device is reset
>   adv748x: Configure device when resuming from sleep
> 
>  drivers/media/i2c/adv748x/adv748x-afe.c  |  6 +----
>  drivers/media/i2c/adv748x/adv748x-core.c | 29 ++++++++++++++++++++++--
>  drivers/media/i2c/adv748x/adv748x-csi2.c |  6 +----
>  drivers/media/i2c/adv748x/adv748x.h      |  2 ++
>  4 files changed, 31 insertions(+), 12 deletions(-)
> 

