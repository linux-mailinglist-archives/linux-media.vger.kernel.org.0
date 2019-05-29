Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABF02E05F
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 16:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfE2O7v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 10:59:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53560 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbfE2O7v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 10:59:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 88BBD2609D6
Message-ID: <34015a49654464b072efd401d2b55d26379bc85c.camel@collabora.com>
Subject: Re: [PATCH v6 16/16] rockchip/vpu: Add support for MPEG-2 decoding
 on RK3328
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     "kernel@collabora.com" <kernel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Date:   Wed, 29 May 2019 11:59:41 -0300
In-Reply-To: <VI1PR03MB42066B8C9F364ACF7CFFF241AC1F0@VI1PR03MB4206.eurprd03.prod.outlook.com>
References: <20190528170232.2091-1-ezequiel@collabora.com>
         <20190528170232.2091-17-ezequiel@collabora.com>
         <2ef056a2-e9dc-52b1-855b-2bef759af9b6@xs4all.nl>
         <VI1PR03MB42066B8C9F364ACF7CFFF241AC1F0@VI1PR03MB4206.eurprd03.prod.outlook.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-05-29 at 08:50 +0000, Jonas Karlman wrote:
> On 2019-05-29 10:11, Hans Verkuil wrote:
> > On 5/28/19 7:02 PM, Ezequiel Garcia wrote:
> > > From: Jonas Karlman <jonas@kwiboo.se>
> > > 
> > > Add necessary bits to support MPEG2 decoding on RK3328.
> > > 
> > > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > --
> > > Changes from v5:
> > > * New patch.
> > > 
> > >  drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c   | 12 ++++++++++++
> > >  .../staging/media/rockchip/vpu/rockchip_vpu_drv.c    |  1 +
> > >  drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h |  1 +
> > >  3 files changed, 14 insertions(+)
> > > 
> > > diff --git a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c b/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
> > > index 2b3689968ef4..341f8d69c33d 100644
> > > --- a/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
> > > +++ b/drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
> > > @@ -175,3 +175,15 @@ const struct rockchip_vpu_variant rk3399_vpu_variant = {
> > >  	.clk_names = {"aclk", "hclk"},
> > >  	.num_clocks = 2
> > >  };
> > > +
> > > +const struct rockchip_vpu_variant rk3328_vpu_variant = {
> > > +	.dec_offset = 0x400,
> > > +	.dec_fmts = rk3399_vpu_dec_fmts,
> > > +	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
> > > +	.codec = RK_VPU_MPEG2_DECODER,
> > > +	.codec_ops = rk3399_vpu_codec_ops,
> > > +	.vdpu_irq = rk3399_vdpu_irq,
> > > +	.init = rk3399_vpu_hw_init,
> > > +	.clk_names = {"aclk", "hclk"},
> > > +	.num_clocks = 2
> > > +};
> > > diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
> > > index b94ff97451db..2e22009b6583 100644
> > > --- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
> > > +++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
> > > @@ -419,6 +419,7 @@ static const struct v4l2_file_operations rockchip_vpu_fops = {
> > >  
> > >  static const struct of_device_id of_rockchip_vpu_match[] = {
> > >  	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
> > > +	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
> > This new compatible string should be documented in
> > Documentation/devicetree/bindings/media/rockchip-vpu.txt as well.
> > 
> > I'll take patches 1-15 and drop this one. This patch can be merged once
> > the bindings file is updated as well.
> 
> Looks like the bindings patch did not get picked for v6 :-)
> 

Oh, that's my bad. I picked the support and left the binding out.

> I am a bit unclear on how to handle patch submission that covers multiple subtrees.
> Should I send a single series including three patches: bindings update, this patch and device tree update?
> Or is a series with only bindings update and this patch preferred?
> 

Thanks both for sorting this one out,
Ezequiel

