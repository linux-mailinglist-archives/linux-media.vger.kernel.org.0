Return-Path: <linux-media+bounces-35728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D25AE5F87
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F17E33A6540
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 08:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5944E25C812;
	Tue, 24 Jun 2025 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWGDQDr0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9492522A7;
	Tue, 24 Jun 2025 08:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754134; cv=none; b=fYYwsdnUpwyOqFpEGCJd+bSURCgEmZSkTvBIjIudlBtmDk++XU04agUQkNsyPev5vsfJwscWpjYp9vl2aS1Yy3jDSuzvn/t0Vyt7IGA311oVXIcSZ0MXGL4Qf5QMFtEV5nXSwBqyp4qZwnQ5lz3WKGizoox2JrFnhw15n2RBub0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754134; c=relaxed/simple;
	bh=WyQDQWnqq81OoIwpxZisCxByRiTBJQZ/Ifg54KE6Tv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b21Q2+pIuwwRaKr3Twi7x01KjKexVkPM0S+Kkr2vXVXeG5nLnitc61lAGkg82Wa5nlLcD2n4MkjMoEN1GclATy80smy/+Nd3FmLashZBmqyNFIV5uxVJa28v6EU1Fu4m7P59VYQwQ8krH6cjs0RmxVI1zJywVHRutjoM46ymqL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWGDQDr0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750754133; x=1782290133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WyQDQWnqq81OoIwpxZisCxByRiTBJQZ/Ifg54KE6Tv4=;
  b=DWGDQDr0c9WjW+NCxIWo3Cj9nOT1OHEujYd96VXZdp6tbWwJr0EzSQol
   zAuYsyaVqVZSJzlLimoe+gzJ9kq7jQEd9FIm1uvXf0lM4PSY2GZLejq83
   DlvyOU5gNRvW7KEK4q7a2GyAX2T7KYeqtjJX8fEznMb+5A8zfIviQNC3A
   pcYdRbMb34RExKACale2Jw0G1vC+9zXOVg9DQW67qXig39zVQTJte8Ii2
   4MSwu87jELOVXqlIOtKJ5erzdrpl/BmIIdux42Qw2UlR1h3LMJXIuvnGF
   baCwgf07nRMv+MpJ0lTMrCFak9k3lSKVzeYUXhnRz5oLwW2b7DO+rXtBc
   Q==;
X-CSE-ConnectionGUID: SLzij9CuQRm6H4h5F4l2HQ==
X-CSE-MsgGUID: XKGyYQ75R+yVXeAqxX9sAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53076016"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="53076016"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 01:35:32 -0700
X-CSE-ConnectionGUID: IjHWV/EAQoWkLJ+O+ajfSA==
X-CSE-MsgGUID: jjCN4NDjS8qGJDsLkEYJhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="175456235"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.224])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 01:35:28 -0700
Date: Tue, 24 Jun 2025 10:35:18 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Nirujogi, Pratap" <pnirujog@amd.com>, 
	Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org, 
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com, jai.luthra@ideasonboard.com, 
	tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com, 
	dantony@amd.com, vengutta@amd.com, Svetoslav.Stoilov@amd.com, 
	Yana.Zheleva@amd.com
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <425j7c6xvbbatdhxgjgjawzwfnjmjetg6rpnwfudbtg6qz6nay@dy5ldbuhtbvv>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623220503.GA15951@pendragon.ideasonboard.com>

Hi Laurent, Hi Pratap,

Thank you for the patch

On Tue, Jun 24, 2025 at 01:05:03AM +0300, Laurent Pinchart wrote:
> (CC'ing Mehdi)
> 
> On Mon, Jun 23, 2025 at 05:51:48PM -0400, Nirujogi, Pratap wrote:
> > On 6/16/2025 6:49 PM, Nirujogi, Pratap wrote:
> > >>> +static int ov05c10_probe(struct i2c_client *client)
> > >>> +{
> > >>> +     struct ov05c10 *ov05c10;
> > >>> +     u32 clkfreq;
> > >>> +     int ret;
> > >>> +
> > >>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10), 
> > >>> GFP_KERNEL);
> > >>> +     if (!ov05c10)
> > >>> +             return -ENOMEM;
> > >>> +
> > >>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
> > >>> +
> > >>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency", 
> > >>> &clkfreq);
> > >>> +     if (ret)
> > >>> +             return  dev_err_probe(&client->dev, -EINVAL,
> > >>> +                                   "fail to get clock freq\n");
> > >>
> > >> Let's try to land
> > >> https://lore.kernel.org/linux-media/20250521104115.176950-1- 
> > >> mehdi.djait@linux.intel.com/
> > >> and replace the code above with devm_v4l2_sensor_clk_get().
> > >>
> > > Ok, we will verify on our side.
> > 
> > We tried using devm_v4l2_sensor_clk_get() and found its required to add 
> > support for software_node to make it work with this driver.
> 
> Why is that ?
> 
> > Please refer 
> > the changes below and let us know if these should be submitted as a 
> > separate patch.

The helper is still not merged, so no patch is required.

I will see if a change is needed from the helper side or the OV05C10 side.

> 
> Mehdi, do you have any comment ?
> 

No comment for now: I will investigate this.

--
Kind Regards
Mehdi Djait

> > ---
> > @@ -645,16 +645,16 @@ struct clk *devm_v4l2_sensor_clk_get(struct device 
> > *dev, const char *id)
> >          const char *clk_id __free(kfree) = NULL;
> >          struct clk_hw *clk_hw;
> >          struct clk *clk;
> > -       bool acpi_node;
> > +       bool is_node;
> >          u32 rate;
> >          int ret;
> > 
> >          clk = devm_clk_get_optional(dev, id);
> >          ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > -       acpi_node = is_acpi_node(dev_fwnode(dev));
> > +       is_node = is_acpi_node(dev_fwnode(dev)) || 
> > is_software_node(dev_fwnode(dev));
> > 
> >          if (clk) {
> > -               if (!ret && acpi_node) {
> > +               if (!ret && is_node) {
> >                          ret = clk_set_rate(clk, rate);
> >                          if (ret) {
> >                                  dev_err(dev, "Failed to set clock rate: 
> > %u\n",
> > @@ -668,7 +668,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device 
> > *dev, const char *id)
> >          if (ret)
> >                  return ERR_PTR(ret);
> > 
> > -       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
> > +       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !is_node)
> >                  return ERR_PTR(-ENOENT);
> > 
> >          if (!id) {
> > ----
> 
> -- 
> Regards,
> 
> Laurent Pinchart

