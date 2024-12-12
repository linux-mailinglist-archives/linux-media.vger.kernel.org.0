Return-Path: <linux-media+bounces-23277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 260309EE349
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B554B282964
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD3520FAB1;
	Thu, 12 Dec 2024 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PLclz1s0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED7A20E011;
	Thu, 12 Dec 2024 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733996510; cv=none; b=GEAPRAeU3PNelflrAi+iruc6o3jhIxmbYa0I+7uUQoyoQFFWqUimknbc1MKitwf9MC7fcoJV2w1YYATS9S6lAxo+MEahfto3MZOIS48iuc5g7Jnq9GJjjhttAkVpkqaivLGxVlOUz41MpriW9wZAyrZRNu3lm5Ek6P5mqF+kj+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733996510; c=relaxed/simple;
	bh=obaLmOxLmJXlb/CDjZv7Zm7XxIZBGmVcCgDa31nx99o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHppzX0ZLn71cdu9NVgGGF/ZyW+yOV1J2mgQRmi0md7vnhhGMYl2hyqhMXygzTbhuh8UH6qZxcMazxNxB9o8poBVMdxVHtU1zDV5b5b8sbjpt8aa8y56Rwk6hVADBnl7DIr4Ul96Eh9OxpWhEUiQP3dE892YbCB3WyXbBSpHV2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PLclz1s0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:459e:1ee6:26ea:2d31])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 704D0229;
	Thu, 12 Dec 2024 10:41:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733996471;
	bh=obaLmOxLmJXlb/CDjZv7Zm7XxIZBGmVcCgDa31nx99o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PLclz1s0qjNNBqIxl/K970Ib6OkbcTqMouuTpqmv/mxbDaPDWEtV7+UKlSW9Sqlcn
	 8mzpmc+lMnONoa8Tq2Y2V9H2mNN3qKQBGWXHqex6yplhm1KGY7W2GPcVjOeVMrvIMr
	 ONmGF/fEodK8ZPUjeBvXGi9DBj0XzGPD0LNIwbtw=
Date: Thu, 12 Dec 2024 10:41:42 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Keke Li <keke.li@amlogic.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	dan.scally@ideasonboard.com
Subject: Re: [PATCH v4 02/10] media: platform: Add c3 mipi csi2 driver
Message-ID: <2jc3sqihnj7sd7vjj7542nntc45eratyxi7diuaewlbqqbixbp@vlgkpv6vm6wr>
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
 <20241205-c3isp-v4-2-cb1868be0105@amlogic.com>
 <5sen6lv5xg4hjdc4j2l6k5iywqpllbutoaebyln74aeuplawtu@nmpmzgwkkgih>
 <0fc7f15c-66be-4ba0-9549-51ba87f48690@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fc7f15c-66be-4ba0-9549-51ba87f48690@amlogic.com>

Hi Keke

On Thu, Dec 12, 2024 at 05:08:27PM +0800, Keke Li wrote:
>
> On 2024/12/12 16:41, Jacopo Mondi wrote:
> > [ EXTERNAL EMAIL ]
> >
> > Hi Keke,
> >    a question for Laurent and Sakari
> >
> > On Thu, Dec 05, 2024 at 05:04:28PM +0800, Keke Li via B4 Relay wrote:
> > > From: Keke Li <keke.li@amlogic.com>
> > >
> > > This driver is used to receive mipi data from image sensor.
> > >
> > > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > Signed-off-by: Keke Li <keke.li@amlogic.com>
> > [snip]
> >
> > > +
> > > +static int c3_mipi_csi_configure_clocks(struct csi_device *csi)
> > > +{
> > > +     const struct csi_info *info = csi->info;
> > > +     int ret;
> > > +     u32 i;
> > > +
> > > +     for (i = 0; i < info->clock_num; i++)
> > > +             csi->clks[i].id = info->clocks[i];
> > > +
> > > +     ret = devm_clk_bulk_get(csi->dev, info->clock_num, csi->clks);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     for (i = 0; i < info->clock_num; i++) {
> > > +             if (!info->clock_rates[i])
> > > +                     continue;
> > > +             ret = clk_set_rate(csi->clks[i].clk, info->clock_rates[i]);
> > > +             if (ret) {
> > > +                     dev_err(csi->dev, "Failed to set %s rate %u\n", info->clocks[i],
> > > +                             info->clock_rates[i]);
> > > +                     return ret;
> > > +             }
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > [snip]
> >
> > > +
> > > +static const struct csi_info c3_mipi_csi_info = {
> > > +     .clocks = {"vapb", "phy0"},
> > > +     .clock_rates = {0, 200000000},
> > > +     .clock_num = 2
> > > +};
> > > +
> > > +static const struct of_device_id c3_mipi_csi_of_match[] = {
> > > +     { .compatible = "amlogic,c3-mipi-csi2",
> > > +       .data = &c3_mipi_csi_info,
> > > +     },
> > > +     { },
> > > +};
> > All the drivers in this patch series implement the same pattern when
> > it comes to handling clock. There's a list of clock providers in the
> > driver associated with a clock frequency. The driver bulk_get the
> > clocks and set_rate() using the per-compatible info table.
> >
> > Do you think this should rather come from dts using the
> > assigned-clocks and assigned-clock-rates properties ?
>
> Yes,  I think your suggestion is OK.
>
> Will test it.
>
> If apply your suggestion, do I need to modify the relevant yaml file?
>

Do you mean the binding files ?

You could add to the example

--- a/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
@@ -73,6 +73,8 @@ examples:
             clocks = <&clkc_periphs CLKID_VAPB>,
                      <&clkc_periphs CLKID_ISP0>;
             clock-names = "vapb", "isp0";
+            assigned-clocks = <&clkc_periphs CLKID_ISP0>;
+            assigned-clock-rates = <400000000>;
             interrupts = <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>;

             port {


As your binding document has "additionalProperties: false" I thought
you had to add:

  assigned-clocks: true
  assigned-clock-rates: true

As in my understanding "additionalProperties: false" means "whatever
is not explicitly allowed is forbidden". However I might be wrong as
validating the binding even without the two above entries work well
(and I see other bindings doing the same)

DT maintainers are in cc

