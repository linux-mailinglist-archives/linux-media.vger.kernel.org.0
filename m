Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BD94480AA
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 14:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235081AbhKHOB5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 09:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237744AbhKHOB4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 09:01:56 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594B6C061746
        for <linux-media@vger.kernel.org>; Mon,  8 Nov 2021 05:59:12 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id x23so8814115qkf.7
        for <linux-media@vger.kernel.org>; Mon, 08 Nov 2021 05:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JirAXSflDjIcMAeazdVpY/4xA41IlCAY04BXmE2ZYQM=;
        b=HLXr25pRJ7+E8lT4ABwhuNFkxRYpRCgr7hswcSp5Lz4N+xi7/whjxmtqYGZ7KbEIEw
         Fcup+X6OvBpYzpNUAh6zyT5/m3AeG+K+iHjJJKNEWzKsYf8PqPGhUHfyUuESlLkiSda6
         rMA9QOjK3uybOhJ3DKPAODHNWZQv0Y4hHdUTqW3DB7U7vLEYxfmp1SYgVU0MraHxjcFz
         46eeeNtdwLRH2bFiCb2W/gNK7T99wdZm8vPf/VunOX7XX9iHY9N5ju5ZC+DVLn0Ps7nO
         jH1fVjmkejbUkdA4z95OSyqwjq127ae5Jja/zWqxhVrkP0wZUUrUATNA+nEQ352/GE/l
         Ud3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JirAXSflDjIcMAeazdVpY/4xA41IlCAY04BXmE2ZYQM=;
        b=GZSDHjxPDDHA+HMTPlxR52XFgDT9FENyckZ+dUDClJBQjX7qmA6lD1Oc61EU7iutIY
         1fmy4X4ltswts+S8+HzK9tdt/C3N2K6DV/OFuEcmv03acN6weMoEPskYz6MIvmVcvfTM
         XEKkoflR48U1gdCKUWZMHhehheZ0UTRZ+2rSt/MZM7G/g6voptP5d8ca9p53x/6UOeQ1
         4OSfXI3FEVijzgvUbOujtrQAv+lwwZREJn9Y1N8BQJcGx/3V+aoN9nmelF48m2GSleBt
         fly66PzCyvcz+K0JIxFzqQHDwPdeu9dYmr+GWLFTt8wL4GdYKl2UXkuS0WxFh/cdTELi
         BPPg==
X-Gm-Message-State: AOAM530s/uV9dwCZPRqgL9TmHQtrhWJteH5+bSCqbMqDmfsYQQph27n7
        kjfuQo9IbvfT48G0YXlCc1d8mg==
X-Google-Smtp-Source: ABdhPJwnQhLeO0Oq5jMtAfmA/8j65tIDSBH7CNZ4oKjXKDgjfz7o42nBFlklWsUQVUkMrnayVPVZCg==
X-Received: by 2002:a05:620a:448b:: with SMTP id x11mr39558492qkp.286.1636379951308;
        Mon, 08 Nov 2021 05:59:11 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id f7sm10082091qkp.107.2021.11.08.05.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 05:59:10 -0800 (PST)
Message-ID: <718f7f6d6cd564d031c1963f1590c62d549ae725.camel@ndufresne.ca>
Subject: Re: [RFC 0/5] arm64: imx8mm: Enable Hantro VPUs
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        marek.vasut@gmail.com, jagan@amarulasolutions.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        "open list:HANTRO VPU CODEC DRIVER" 
        <linux-rockchip@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Date:   Mon, 08 Nov 2021 08:59:09 -0500
In-Reply-To: <20211106183802.893285-1-aford173@gmail.com>
References: <20211106183802.893285-1-aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 (3.42.0-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

thanks for you work, I'll try and reply  about the GStreamer questions below, if
you have further question feel free to ask.

Le samedi 06 novembre 2021 à 13:37 -0500, Adam Ford a écrit :
> The i.MX8M has two Hantro video decoders, called G1 and G2 which appear
> to be related to the video decoders used on the i.MX8MQ, but because of
> how the Mini handles the power domains, the VPU driver does not need to
> handle all the functions, so a new compatible flag is required.
> 
> This is an RFC because I don't have functional video on my system yet,
> and I'm hoping there might be people who do and can help test this.
> I have only tested this far enough to see they enumerate and appear
> as /dev/videoX and /dev/mediaX devices.

I will check the patchset, but you need in the mini-variant to disable the G1
post processor, because this block was fused out. We didn't make it optional
from the start as according to the V1 of the TRM it was there, but that error
was corrected in V3.

> 
> I am also curious to know if/what gstreamer plugins are necessary.  In
> NXP's custom kernel, there are IMX-specific plugins, and I was hoping there
> would be more generic plugins that I can use to test.  I am hoping some
> of the linux-media experts might chime in on how to best test.

I will recommend using GStreamer 1.19.3 or main branch (GStreamer is now a
single git repo). You will then be able to test Hantro G1 decoding of MPEG2,
H264 and VP8. Remember that the related plugin depends on libgudev (a glib
binding of udev).

For the encoder, I believe only JPEG maybe supported, since this is all there is
mainline for RK3288 (and perhaps other RK). But this will need testing and
debugging as the G1 version is slightly newer on NXP SoC.

> 
> Lastly, I didn't update any device tree binding YAML files, because
> I know there have been some discussions about the power domains on the
> imx8mq, and I wasn't sure if the imx8mm should get a separate YAML file
> or if the existing one for te imx8mq should just be modified.
> 
> This will likely require the following series in order to apply correctly:
> https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=576407
> 
> Adam Ford (5):
>   media: hantro: Add support for i.MX8M Mini
>   arm64: dts: imx8mm:  Enable VPU-G1 and VPU-G2
>   media: hantro: Rename ROCKCHIP_VPU_ENC_FMT to HANTRO_VPU_ENC_FMT
>   media: hantro: Add H1 encoder support on i.MX8M Mini
>   arm64: dts: imx8mm:  Enable Hantro H1 Encoder
> 
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  61 ++++++++
>  drivers/staging/media/hantro/hantro_drv.c     |   3 +
>  drivers/staging/media/hantro/hantro_hw.h      |  19 ++-
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   | 143 ++++++++++++++++++
>  .../staging/media/hantro/rockchip_vpu_hw.c    |  26 ++--
>  5 files changed, 231 insertions(+), 21 deletions(-)
> 

