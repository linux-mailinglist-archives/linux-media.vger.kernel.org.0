Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33B130E242
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 19:16:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbhBCSP7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 13:15:59 -0500
Received: from mout02.posteo.de ([185.67.36.66]:52301 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232741AbhBCSPk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Feb 2021 13:15:40 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 1EE2A2400FF
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 19:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1612376076; bh=95Jo6jadPYtj6MXt69Zot2RehnRdPqf90i4ijMVzY88=;
        h=Date:From:To:Cc:Subject:From;
        b=MgxPC2Kl4jayx8GkY88oKsJbzjMpEz+uvVRxmsvX4rVtaCbH9i2h4u6YGM9AduLNi
         x8YBC4AuPF3GcLIwI78e68JsoUPgxUxN6gOUnWEiQ5nLAmnyeP8xC6m2Smu23N139v
         eaOAJ2EB9KdxEPgmkR6MwcukYgd5gDN22lWu0Gs5XnG9ysGfVw5rhSiSCjkhPTIOZw
         cfUvB9uOLOkNxi95Uk7KcBO2hIjqjKNq9Pfoe6xOvTU627JGa0zhPAJ1LfnHSG4MRm
         cmuI7+FeL8qQ0MgSy4WBSjxqPw1CfeL3rkEN5BR7zJ7vpnJPaSEZPtP2m5Y4cxauAy
         yCPD6iMxa8VZw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DW8w34mLRz6tmS;
        Wed,  3 Feb 2021 19:14:27 +0100 (CET)
Date:   Wed, 3 Feb 2021 19:14:22 +0100
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, robh+dt@kernel.org,
        linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        cmuellner@linux.com
Subject: Re: [PATCH 0/6] Support second Image Signal Processor on rk3399
Message-ID: <20210203181422.txbd6kvujlmz4nju@basti-TUXEDO-Book-XA1510>
References: <20210202145632.1263136-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20210202145632.1263136-1-heiko@sntech.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Heiko,

I have tested your patch set on my nanoPC-T4, here is a complete log
with:
- relevant kernel log entries
- system information
- media ctl output
- sysfs entry information

https://paste.debian.net/1183874/

Additionally, to your patchset I have applied the following patches:
https://github.com/initBasti/Linux_kernel_media_tree_fork/commits/dual_cam_setup

And just to not cause confusion the `media_dev` entries come from this
unmerged series:
https://patchwork.kernel.org/project/linux-media/list/?series=426269

I have actually been able to stream with both of my cameras at the same
time using the libcamera cam command.
I would like to thank you a lot for making this possible.

If you like to you can add:
Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>

On 02.02.2021 15:56, Heiko Stuebner wrote:
>The rk3399 has two ISPs and right now only the first one is usable.
>The second ISP is connected to the TXRX dphy on the soc.
>
>The phy of ISP1 is only accessible through the DSI controller's
>io-memory, so this series adds support for simply using the dsi
>controller is a phy if needed.
>
>That solution is needed at least on rk3399 and rk3288 but no-one
>has looked at camera support on rk3288 at all, so right now
>only implement the rk3399 specifics.
>
>
>Heiko Stuebner (6):
>  drm/rockchip: dsi: add own additional pclk handling
>  dt-bindings: display: rockchip-dsi: add optional #phy-cells property
>  drm/rockchip: dsi: add ability to work as a phy instead of full dsi
>  arm64: dts: rockchip: add #phy-cells to mipi-dsi1
>  arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
>  arm64: dts: rockchip: add isp1 node on rk3399
>
> .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
> arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  39 ++
> drivers/gpu/drm/rockchip/Kconfig              |   2 +
> .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 342 ++++++++++++++++++
> 4 files changed, 384 insertions(+)
>
>-- 
>2.29.2
>
