Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 375344074AA
	for <lists+linux-media@lfdr.de>; Sat, 11 Sep 2021 04:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbhIKCiK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 22:38:10 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:40805 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231864AbhIKCiJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 22:38:09 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id A282B580D33;
        Fri, 10 Sep 2021 22:36:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 10 Sep 2021 22:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=M
        ZwiB4t7cgLqvScVDIZR9A1Mim4fiTt+M7GI7d73zms=; b=H+LiH3zHq89scv+vN
        aIu0hc/isLfU5jfa+wOyLj6+jVyHhqfJex9qqP7MH6RG5fNK67JTj+kTPIJ8rVxT
        T1bV3pU6M2GBvAlyuugBwmAcrzQM88BnjsARCPwEfUB7GJDbnZsPbN/L0hozartO
        /PW3VExwPTn3SK16C1ji+OWrBrXOk9mlwOHhBkc5qh6mIr2kVsUNxi6C/vBISVuY
        tvnbOmByEQPBjsT2jOThZL6HxbVKnsIo44GLENjuKeWOg9F/7M5YsCQojR03dA37
        grnQ98ctpMennqgG40d9fxCWhcA8oROqpKTYgdmDQe7oLXyZkkU9gydTSMqBnPIK
        AMybA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=MZwiB4t7cgLqvScVDIZR9A1Mim4fiTt+M7GI7d73z
        ms=; b=YXpDWxOIL/8VZ5yfptuuZalKkr1XSXs1Ypl4qX+K5Zkau7Cw3lH2epp+J
        /Uf8/czE9XuucaN9l/YiKt6iLgve29+SAyOQ2XyFiBlc/LzwhJqMu1ami5F/AWsS
        zmuv0clVpDsq7LZngC5vy4J7jYoWKdQb/IWo61/y58SYFCcWXnDyqhXRREdgubGk
        DVH5jWstr0URoSracLG8scY5xoKoMpA37qLPtHwKW2I+yNVbxK04ksXjTrTdMxf4
        FO1XDBpA8MqEiHOvKQziKqzYYP2rJtHzIhS9UQ44jMSB5DBvUOk/e2iaB70k/2bQ
        RkzC10gHm7oyEABsyR2VHqMx6glUQ==
X-ME-Sender: <xms:PxY8YRkCQ7DagY8flMijoDh0kUEacLL8-g-XKlZTnynF7w27LzgPuA>
    <xme:PxY8Yc12bCUDxNlESx3VPqZBgMcim5ec5mb-2TwFxFXtrY6n47KuYhcTziKgFXSrF
    X84qANXbrFG1Dp1yA>
X-ME-Received: <xmr:PxY8YXobR6QHdlmHycSQ_Ct8ec7r1H00G5LB8_TmmIzx9aLgpBRRqGE5f-91-Lied0XH5OHfdMdHyvFncdgXqJTzsSXJDCKB2RNiJPJkWpbMSxiUz1X63SffkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegvddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:PxY8YRm7UToxuHcOCZJF75VSYqkqUiw3BkiEkjlsdthsC7HzDhZHCg>
    <xmx:PxY8Yf3jNKjkn_NjdHFFEyOex0ONUpP9E4QCgVzvZLbbIeZ22KhPTg>
    <xmx:PxY8YQv9fDerYHtCaDWaujYoO-8AbcyE7xEPDU9WyYqKjFU-xoqgIw>
    <xmx:QhY8YU6gs5pimeqB1fWChGZG99tFP0P6cI2KunVIcCdsMwaIVhlvKw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 22:36:47 -0400 (EDT)
Subject: Re: [PATCH 19/22] soc: sunxi: mbus: Add A31 ISP compatibles to the
 list
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-20-paul.kocialkowski@bootlin.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <208239ba-01b1-451e-6030-894bd25770c3@sholland.org>
Date:   Fri, 10 Sep 2021 21:36:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210910184147.336618-20-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/10/21 1:41 PM, Paul Kocialkowski wrote:
> The A31 ISP sits on the mbus and requires the usual bus address
> adaptation. Add its compatibles to the list.

My understanding is that this driver only exists to work around old DT
bindings where the interconnects/interconnect-names = "dma-mem"
properties are not required (and so they are historically missing from
the device trees).

For new bindings, it would be better to use those properties and not add
to this list.

Regards,
Samuel

> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/soc/sunxi/sunxi_mbus.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbus.c
> index d90e4a264b6f..7f0079ea30b1 100644
> --- a/drivers/soc/sunxi/sunxi_mbus.c
> +++ b/drivers/soc/sunxi/sunxi_mbus.c
> @@ -37,6 +37,7 @@ static const char * const sunxi_mbus_devices[] = {
>  	"allwinner,sun5i-a13-video-engine",
>  	"allwinner,sun6i-a31-csi",
>  	"allwinner,sun6i-a31-display-backend",
> +	"allwinner,sun6i-a31-isp",
>  	"allwinner,sun7i-a20-csi0",
>  	"allwinner,sun7i-a20-display-backend",
>  	"allwinner,sun7i-a20-display-frontend",
> @@ -50,6 +51,7 @@ static const char * const sunxi_mbus_devices[] = {
>  	"allwinner,sun8i-h3-csi",
>  	"allwinner,sun8i-h3-video-engine",
>  	"allwinner,sun8i-v3s-csi",
> +	"allwinner,sun8i-v3s-isp",
>  	"allwinner,sun9i-a80-display-backend",
>  	"allwinner,sun50i-a64-csi",
>  	"allwinner,sun50i-a64-video-engine",
> 

