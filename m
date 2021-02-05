Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C454231050D
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 07:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhBEGoi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 01:44:38 -0500
Received: from mout01.posteo.de ([185.67.36.65]:46804 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230483AbhBEGoh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Feb 2021 01:44:37 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 7473016005F
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 07:43:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1612507419; bh=8zUn+UyozeAseEbIW29rRlgrAkKAcwU7JN9yB32OBVU=;
        h=Date:From:To:Cc:Subject:From;
        b=nxK5M0KsURI7H8q7N/u7Z5J40DfSmNln6h/rtHagaUbtb/h3fDvIEHpOyKDQ6Ppxk
         5BCcMFNUpaQMZx71PIv3eSlcHr1Hsd9NeFXGkWZg5jI5slYy+6wwBwWT2avZql8Wtv
         aI+Iw0bjBgv5HPfxjAN5gKAza50eCOCktUh1hBUGp4+Aq20GcBqezetx2gQdvVvUwb
         X8pm0B43c1TcA+tFJ5R7esBcFOz44IqE0fTqopArBLgvW3PWsBdtPtw45KPjyYQreA
         TA0+TOUFYljkM6ZkAqwVbLku1/ZS9wu4PZur0lWUuHw0SQlKciR2J/hbKY/A4ca4/2
         WMZpdjYeFI1AA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DX5V03kQNz6tmM;
        Fri,  5 Feb 2021 07:43:36 +0100 (CET)
Date:   Fri, 5 Feb 2021 07:43:35 +0100
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, robh+dt@kernel.org,
        linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        cmuellner@linux.com
Subject: Re: [PATCH 0/6] Support second Image Signal Processor on rk3399
Message-ID: <20210205064335.6c3gs3h3pgvhceku@basti-TUXEDO-Book-XA1510>
References: <20210202145632.1263136-1-heiko@sntech.de>
 <20210203181422.txbd6kvujlmz4nju@basti-TUXEDO-Book-XA1510>
 <16624224.lhrHg4fidi@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16624224.lhrHg4fidi@diego>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Heiko,

On 03.02.2021 20:54, Heiko Stübner wrote:
>Hi Sebastian,
>
>Am Mittwoch, 3. Februar 2021, 19:14:22 CET schrieb Sebastian Fricke:
>> Hey Heiko,
>>
>> I have tested your patch set on my nanoPC-T4, here is a complete log
>> with:
>> - relevant kernel log entries
>> - system information
>> - media ctl output
>> - sysfs entry information
>>
>> https://paste.debian.net/1183874/
>>
>> Additionally, to your patchset I have applied the following patches:
>> https://github.com/initBasti/Linux_kernel_media_tree_fork/commits/dual_cam_setup
>>
>> And just to not cause confusion the `media_dev` entries come from this
>> unmerged series:
>> https://patchwork.kernel.org/project/linux-media/list/?series=426269
>>
>> I have actually been able to stream with both of my cameras at the same
>> time using the libcamera cam command.
>> I would like to thank you a lot for making this possible.
>
>Thanks for testing a dual camera setup. On my board I could only test
>the second ISP. And really glad it works for you tool :-) .
>
>Out of curiosity, do you also see that green tint in the images the cameras
>produce?

Yes, I do. Actually, I currently have two forms of a green tint, on my
OV13850 everything is quite dark and greenish, which is caused by the
missing 3A algorithms. On my OV4689, I have big patches of the image
with bright green color and flickering, I investigated if this is
connected to the 2nd ISP instance, but that doesn't seem to be the case
as I have the same results when I switch the CSI ports of the cameras.

I have found another issue, while testing I discovered following
issue:
When I start the system with an HDMI monitor connected, then the camera
on the 2nd port doesn't work. This is probably because the RX/TX is
reserved as a TX.
But it made me wonder because if the system has an RX, a TX, and
an RX/TX, why isn't the pure TX used by the monitor and the
cameras take RX and RX/TX?
Or do you think that this is maybe a malfunction of this patch?

>
>Thanks
>Heiko

Greetings,
Sebastian

>
>
>> If you like to you can add:
>> Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>
>>
>> On 02.02.2021 15:56, Heiko Stuebner wrote:
>> >The rk3399 has two ISPs and right now only the first one is usable.
>> >The second ISP is connected to the TXRX dphy on the soc.
>> >
>> >The phy of ISP1 is only accessible through the DSI controller's
>> >io-memory, so this series adds support for simply using the dsi
>> >controller is a phy if needed.
>> >
>> >That solution is needed at least on rk3399 and rk3288 but no-one
>> >has looked at camera support on rk3288 at all, so right now
>> >only implement the rk3399 specifics.
>> >
>> >
>> >Heiko Stuebner (6):
>> >  drm/rockchip: dsi: add own additional pclk handling
>> >  dt-bindings: display: rockchip-dsi: add optional #phy-cells property
>> >  drm/rockchip: dsi: add ability to work as a phy instead of full dsi
>> >  arm64: dts: rockchip: add #phy-cells to mipi-dsi1
>> >  arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
>> >  arm64: dts: rockchip: add isp1 node on rk3399
>> >
>> > .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
>> > arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  39 ++
>> > drivers/gpu/drm/rockchip/Kconfig              |   2 +
>> > .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 342 ++++++++++++++++++
>> > 4 files changed, 384 insertions(+)
>> >
>>
>
>
>
>
