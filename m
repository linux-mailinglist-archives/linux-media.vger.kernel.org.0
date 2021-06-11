Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D5D3A45BA
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 17:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhFKPxC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 11:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhFKPxC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 11:53:02 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B491C061574;
        Fri, 11 Jun 2021 08:51:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0B6ED1F447EC
Message-ID: <09885c89dd37ca56305630c96da88333e81a2f25.camel@collabora.com>
Subject: Re: [PATCH v2 06/12] media: hantro: add support for Rockchip RK3066
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Alex Bee <knaerzche@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Fri, 11 Jun 2021 12:50:50 -0300
In-Reply-To: <20210527154455.358869-7-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
         <20210527154455.358869-1-knaerzche@gmail.com>
         <20210527154455.358869-7-knaerzche@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On Thu, 2021-05-27 at 17:44 +0200, Alex Bee wrote:
> RK3066's VPU IP block is the predecessor from what RK3288 has.
> The hardware differences are:
>   - supports decoding frame sizes up to 1920x1088 only
>   - doesn't have the 'G1_REG_SOFT_RESET' register
>     (requires another .reset callback for hantro_codec_ops,
>      since writing this register will result in non-working
>      IP block)
>   - has one ACLK/HCLK per vdpu/vepu
>   - ACLKs can be clocked up to 300 MHz only

Have you tested trying 400 MHz (or more) ?

>   - no MMU
>     (no changes required: CMA will be transparently used)
> 
> Add a new RK3066 variant which reflect this differences. This variant
> can be used for RK3188 as well.
> 

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks!
Ezequiel

