Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8A561B1D1F
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 05:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgDUDzi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 23:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbgDUDzi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 23:55:38 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEEEC061A0E;
        Mon, 20 Apr 2020 20:55:37 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B8D3A2A0EF3
Message-ID: <b7af1fd261a54527be2ea2ab2656756f15452732.camel@collabora.com>
Subject: Re: [PATCH 2/3] phy-rockchip-dphy-rx0: Drop unneeded CONFIG_OF
 dependency
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>
Date:   Tue, 21 Apr 2020 00:55:21 -0300
In-Reply-To: <7ced1203-cdea-ad26-f46b-8873bfb85043@collabora.com>
References: <20200401213721.24173-1-ezequiel@collabora.com>
         <20200401213721.24173-3-ezequiel@collabora.com>
         <7ced1203-cdea-ad26-f46b-8873bfb85043@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-04-02 at 10:59 -0300, Helen Koike wrote:
> 
> On 4/1/20 6:37 PM, Ezequiel Garcia wrote:
> > The driver is perfectly capable of being built without CONFIG_OF.
> > Remove this dependency, which is useful for compile-only tests.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>
> 
> > ---
> >  drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig b/drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig
> > index bd0147624de1..fb74df829371 100644
> > --- a/drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig
> > +++ b/drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig
> > @@ -2,7 +2,7 @@
> >  
> >  config PHY_ROCKCHIP_DPHY_RX0
> >  	tristate "Rockchip MIPI Synopsys DPHY RX0 driver"
> > -	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
> > +	depends on ARCH_ROCKCHIP || COMPILE_TEST

After discussing other similar patches, I'm starting to
think this was a bad idea.

Instead, we want to do have (ARCH_ROCKCHIP && OF) || COMPILE_TEST
as the other Rockchip PHYs.

Thanks,
Ezequiel

