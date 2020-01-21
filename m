Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B86B143D90
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 14:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbgAUNBu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 08:01:50 -0500
Received: from gloria.sntech.de ([185.11.138.130]:60610 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726920AbgAUNBu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 08:01:50 -0500
Received: from ip092042140082.rev.nessus.at ([92.42.140.82] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1itt9w-0003e0-H3; Tue, 21 Jan 2020 14:01:32 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Justin Swartz <justin.swartz@risingedge.co.za>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: rockchip/rga: add rk3228-rga to rockchip_rga_match[]
Date:   Tue, 21 Jan 2020 14:01:31 +0100
Message-ID: <1798689.nCamLzREIU@phil>
In-Reply-To: <241033bf82fc7e955dd20c0084bfd4f6fc9fc75b.camel@collabora.com>
References: <20200120194158.25357-1-justin.swartz@risingedge.co.za> <241033bf82fc7e955dd20c0084bfd4f6fc9fc75b.camel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Am Dienstag, 21. Januar 2020, 11:45:01 CET schrieb Ezequiel Garcia:
> On Mon, 2020-01-20 at 19:41 +0000, Justin Swartz wrote:
> > Add an entry to the rockchip_rga_match array for "rockchip,rk3228-rga"
> > 
> > Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> > ---
> >  drivers/media/platform/rockchip/rga/rga.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> > index e9ff12b6b..268116cd5 100644
> > --- a/drivers/media/platform/rockchip/rga/rga.c
> > +++ b/drivers/media/platform/rockchip/rga/rga.c
> > @@ -956,6 +956,9 @@ static const struct dev_pm_ops rga_pm = {
> >  
> >  static const struct of_device_id rockchip_rga_match[] = {
> >  	{
> > +		.compatible = "rockchip,rk3228-rga",
> > +	},
> 
> Unless you need to tune something in the driver
> specifically for rk3228, then you don't need a
> new compatible string.
> 
> As the name implies, it's just a "compatible",
> so you may simply declare your rga dts node as
> compatible to "rockchip,rk3288-rga".
> 
> (Of course, this means we shouldn't have added
> the rk3399 compatible string.)

small correction, we normally do that in two parts in the dts,
	compatible = "rockchip,rk3228-rga", "rockchip,rk3288-rga"

etc. So the compatible needs to be added to binding document but
not necessarily to the driver but does leave us the option of later
defining that new compatible in the driver to handle quirks that may
be discovered later on, without needing to adapt existing devicetrees.


Heiko


