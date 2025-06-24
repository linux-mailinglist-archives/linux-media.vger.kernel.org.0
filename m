Return-Path: <linux-media+bounces-35763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2341AE6399
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 686AD4C1480
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 11:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0DF288538;
	Tue, 24 Jun 2025 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TBbphgmw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E97927AC3C;
	Tue, 24 Jun 2025 11:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750764850; cv=none; b=pyx0jQzGIR/XMBAL8LQfiufaq4E4rqzdGpbA5LufQUgCSGK+pPLo73uB8Ic1W0NSc54sXFmaOjnde5MvNLXMeXvQfdChy6lfrC/DtxXj3QfbOfP4LeZKdD43uyKqraGSTgGeJ92KVHaoC9zHcHwPzyKvMpWw6GPzsPZeHBRh10Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750764850; c=relaxed/simple;
	bh=r6oASjfdT53/q55FsTiqjOy2t9dDTh2M+chbw4uwmB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glHxvCqrauT1VghhuGGumCGaDMb2v1RJgRAY/rnybdCOMrz3438xVLg/7ElM6uwhUzzbNeW4At8PvPvs5DATax3M/p7LSCWTEYqXVqfJqkw6HuSRUZXgwnJnjB9+Azz8ureOreCu1ws5Tp+tAuJzde0b8D44rdJHlGOoO+UCBuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TBbphgmw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-34-99-nat.elisa-mobile.fi [85.76.34.99])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D2ED1EFF;
	Tue, 24 Jun 2025 13:33:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750764829;
	bh=r6oASjfdT53/q55FsTiqjOy2t9dDTh2M+chbw4uwmB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBbphgmwtPohsqsiQqmg50c2ghEjF7L0ck0yyGUPMymlfNVNXFeJYTaP83vY08JnE
	 fDF4p3A1TplmBSuJBqOUu5XyROqxtG1+azuWzKBmJJDT7bYbbv9AUZoXHQ3EQPdzJG
	 HU7uDbV4gEPRwQaZHiXdyMgmikkBTnSZNTOgiuus=
Date: Tue, 24 Jun 2025 14:33:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Nirujogi, Pratap" <pnirujog@amd.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
	jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com,
	king.li@amd.com, dantony@amd.com, vengutta@amd.com,
	Svetoslav.Stoilov@amd.com, Yana.Zheleva@amd.com
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <20250624113344.GJ15951@pendragon.ideasonboard.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
 <425j7c6xvbbatdhxgjgjawzwfnjmjetg6rpnwfudbtg6qz6nay@dy5ldbuhtbvv>
 <aFp7tuXkU1jayPum@kekkonen.localdomain>
 <aFp78tqHhe_IhV6d@kekkonen.localdomain>
 <20250624102745.GG15951@pendragon.ideasonboard.com>
 <nixg4efp3zkdpd6h7kp6wkvam63batpoknov2nkgu36voks6bk@gzuackzl3l5g>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nixg4efp3zkdpd6h7kp6wkvam63batpoknov2nkgu36voks6bk@gzuackzl3l5g>

On Tue, Jun 24, 2025 at 01:27:03PM +0200, Mehdi Djait wrote:
> On Tue, Jun 24, 2025 at 01:27:45PM +0300, Laurent Pinchart wrote:
> > On Tue, Jun 24, 2025 at 10:20:34AM +0000, Sakari Ailus wrote:
> > > On Tue, Jun 24, 2025 at 10:19:35AM +0000, Sakari Ailus wrote:
> > > > On Tue, Jun 24, 2025 at 10:35:18AM +0200, Mehdi Djait wrote:
> > > > > On Tue, Jun 24, 2025 at 01:05:03AM +0300, Laurent Pinchart wrote:
> > > > > > On Mon, Jun 23, 2025 at 05:51:48PM -0400, Nirujogi, Pratap wrote:
> > > > > > > On 6/16/2025 6:49 PM, Nirujogi, Pratap wrote:
> > > > > > > >>> +static int ov05c10_probe(struct i2c_client *client)
> > > > > > > >>> +{
> > > > > > > >>> +     struct ov05c10 *ov05c10;
> > > > > > > >>> +     u32 clkfreq;
> > > > > > > >>> +     int ret;
> > > > > > > >>> +
> > > > > > > >>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10), 
> > > > > > > >>> GFP_KERNEL);
> > > > > > > >>> +     if (!ov05c10)
> > > > > > > >>> +             return -ENOMEM;
> > > > > > > >>> +
> > > > > > > >>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
> > > > > > > >>> +
> > > > > > > >>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency", 
> > > > > > > >>> &clkfreq);
> > > > > > > >>> +     if (ret)
> > > > > > > >>> +             return  dev_err_probe(&client->dev, -EINVAL,
> > > > > > > >>> +                                   "fail to get clock freq\n");
> > > > > > > >>
> > > > > > > >> Let's try to land
> > > > > > > >> https://lore.kernel.org/linux-media/20250521104115.176950-1- 
> > > > > > > >> mehdi.djait@linux.intel.com/
> > > > > > > >> and replace the code above with devm_v4l2_sensor_clk_get().
> > > > > > > >>
> > > > > > > > Ok, we will verify on our side.
> > > > > > > 
> > > > > > > We tried using devm_v4l2_sensor_clk_get() and found its required to add 
> > > > > > > support for software_node to make it work with this driver.
> > > > > > 
> > > > > > Why is that ?
> > > > > > 
> > > > > > > Please refer 
> > > > > > > the changes below and let us know if these should be submitted as a 
> > > > > > > separate patch.
> > > > > 
> > > > > The helper is still not merged, so no patch is required.
> > > > > 
> > > > > I will see if a change is needed from the helper side or the OV05C10 side.
> > > > 
> > > > I wonder if there's a better way to figure out if you're running on a DT or
> > > > ACPI based system than getting the device's parents and checking which one
> > > > you find first, DT or ACPI. I think that should work for now at least.
> > > 
> > > Or, rather, checking for non-OF node here would probably work the best. I
> > > wouldn't expect these to be software node based on DT systems ever.
> > 
> > Until it happens :-) And we'll handle it then.
> 
> So we have the following:
> 
> - The problem with this driver is due to lack of proper ACPI
>   description. HW is already shipping and AMD will work on better ACPI
>   description for future models. See [1]

If that's the same way that Intel said during the IPU3 days they would
work on better ACPI description for future models, I think the IPU6
shows us how that went :-)

> - software_node can also be used on DT systems

They can, but for this purpose, they really shouldn't. That's why I
prefer approach two, we shouldn't enable a mechanism that nobody should
be using on OF platforms.

> [1] https://lore.kernel.org/lkml/0d801367-da24-4596-83d9-08ccd89ca670@redhat.com/
> 
> Now going back to the helper. If we want to support this case:
> 
> Approach 1: software_node || acpi
> 
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -682,16 +682,17 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>         const char *clk_id __free(kfree) = NULL;
>         struct clk_hw *clk_hw;
>         struct clk *clk;
> -       bool acpi_node;
> +       bool acpi_sw_node;
>         u32 rate;
>         int ret;
>  
>         clk = devm_clk_get_optional(dev, id);
>         ret = device_property_read_u32(dev, "clock-frequency", &rate);
> -       acpi_node = is_acpi_node(dev_fwnode(dev));
> +       acpi_sw_node = is_acpi_node(dev_fwnode(dev)) ||
> +                      is_software_node(dev_fwnode(dev));
>  
>         if (clk) {
> -               if (!ret && acpi_node) {
> +               if (!ret && acpi_sw_node) {
>                         ret = clk_set_rate(clk, rate);
>                         if (ret) {
>                                 dev_err(dev, "Failed to set clock rate: %u\n",
> @@ -705,7 +706,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>         if (ret)
>                 return ERR_PTR(ret);
>  
> -       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
> +       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_sw_node)
>                 return ERR_PTR(-ENOENT);
>  
>         if (!id) {
> 
> 
> Approach 2: of_node
> 
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -682,16 +682,16 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>         const char *clk_id __free(kfree) = NULL;
>         struct clk_hw *clk_hw;
>         struct clk *clk;
> -       bool acpi_node;
> +       bool of_node;
>         u32 rate;
>         int ret;
>  
>         clk = devm_clk_get_optional(dev, id);
>         ret = device_property_read_u32(dev, "clock-frequency", &rate);
> -       acpi_node = is_acpi_node(dev_fwnode(dev));
> +       of_node = is_of_node(dev_fwnode(dev));
>  
>         if (clk) {
> -               if (!ret && acpi_node) {
> +               if (!ret && !of_node) {
>                         ret = clk_set_rate(clk, rate);
>                         if (ret) {
>                                 dev_err(dev, "Failed to set clock rate: %u\n",
> @@ -705,7 +705,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>         if (ret)
>                 return ERR_PTR(ret);
>  
> -       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
> +       if (!IS_ENABLED(CONFIG_COMMON_CLK) || of_node)
>                 return ERR_PTR(-ENOENT);
>  
>         if (!id) {

-- 
Regards,

Laurent Pinchart

