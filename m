Return-Path: <linux-media+bounces-35759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605DBAE6267
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C611402DEC
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974942820A5;
	Tue, 24 Jun 2025 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="glS1arOc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE48284B4F;
	Tue, 24 Jun 2025 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760890; cv=none; b=YzizQTT3ocyeKlg3e4LNi8Tl6zQS3oyjX02ef1SL4bI5jLRTwon7f3dMN0d4em86j9z7vQrwnB1DXqYtLg4H5bJXQTgZgeD5RxpkzeWvc1cU0eIiqS3OlZmwVJ3vJSubO/SftW9roV+PPzqslO3tIp+RgFtMbhSwzk8vmbAbpG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760890; c=relaxed/simple;
	bh=xDpe5jVrfQCNNcsPrQu4ixRrP8NOQXLLuUnqA0uqakk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiFkxKBRAm7W7+DoqDcr8sRuTPlIB8POs7uifUsTz3PWFAmDMG599FF6nWxAeUxlCJnhCst+usVYOSRWPiiXghJShLuTOU+qCnj7zKgmjobl4sOwbxcnSERaoobVToG66pIhuG3pZ5R/Lg4vpIE1xMuwXB58P9C96uK1oORwugE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=glS1arOc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-34-99-nat.elisa-mobile.fi [85.76.34.99])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5D678741;
	Tue, 24 Jun 2025 12:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760869;
	bh=xDpe5jVrfQCNNcsPrQu4ixRrP8NOQXLLuUnqA0uqakk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=glS1arOcoKOgAxc/xb131V/R9QliS9sEGow75/IvE63yFhmrzXvAFhEV893BDPEHt
	 8oTQPJMYmhuJYcUyiCNRrbRsQ0xq6gRcQrriWU9e5MMdVfIeWzKBjSWoc4O75EwoUB
	 eaPB2plIOIbRvE+HjlBx5gF506BpQQ0WUeOONjWQ=
Date: Tue, 24 Jun 2025 13:27:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
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
Message-ID: <20250624102745.GG15951@pendragon.ideasonboard.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
 <425j7c6xvbbatdhxgjgjawzwfnjmjetg6rpnwfudbtg6qz6nay@dy5ldbuhtbvv>
 <aFp7tuXkU1jayPum@kekkonen.localdomain>
 <aFp78tqHhe_IhV6d@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFp78tqHhe_IhV6d@kekkonen.localdomain>

On Tue, Jun 24, 2025 at 10:20:34AM +0000, Sakari Ailus wrote:
> On Tue, Jun 24, 2025 at 10:19:35AM +0000, Sakari Ailus wrote:
> > On Tue, Jun 24, 2025 at 10:35:18AM +0200, Mehdi Djait wrote:
> > > On Tue, Jun 24, 2025 at 01:05:03AM +0300, Laurent Pinchart wrote:
> > > > On Mon, Jun 23, 2025 at 05:51:48PM -0400, Nirujogi, Pratap wrote:
> > > > > On 6/16/2025 6:49 PM, Nirujogi, Pratap wrote:
> > > > > >>> +static int ov05c10_probe(struct i2c_client *client)
> > > > > >>> +{
> > > > > >>> +     struct ov05c10 *ov05c10;
> > > > > >>> +     u32 clkfreq;
> > > > > >>> +     int ret;
> > > > > >>> +
> > > > > >>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10), 
> > > > > >>> GFP_KERNEL);
> > > > > >>> +     if (!ov05c10)
> > > > > >>> +             return -ENOMEM;
> > > > > >>> +
> > > > > >>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
> > > > > >>> +
> > > > > >>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency", 
> > > > > >>> &clkfreq);
> > > > > >>> +     if (ret)
> > > > > >>> +             return  dev_err_probe(&client->dev, -EINVAL,
> > > > > >>> +                                   "fail to get clock freq\n");
> > > > > >>
> > > > > >> Let's try to land
> > > > > >> https://lore.kernel.org/linux-media/20250521104115.176950-1- 
> > > > > >> mehdi.djait@linux.intel.com/
> > > > > >> and replace the code above with devm_v4l2_sensor_clk_get().
> > > > > >>
> > > > > > Ok, we will verify on our side.
> > > > > 
> > > > > We tried using devm_v4l2_sensor_clk_get() and found its required to add 
> > > > > support for software_node to make it work with this driver.
> > > > 
> > > > Why is that ?
> > > > 
> > > > > Please refer 
> > > > > the changes below and let us know if these should be submitted as a 
> > > > > separate patch.
> > > 
> > > The helper is still not merged, so no patch is required.
> > > 
> > > I will see if a change is needed from the helper side or the OV05C10 side.
> > 
> > I wonder if there's a better way to figure out if you're running on a DT or
> > ACPI based system than getting the device's parents and checking which one
> > you find first, DT or ACPI. I think that should work for now at least.
> 
> Or, rather, checking for non-OF node here would probably work the best. I
> wouldn't expect these to be software node based on DT systems ever.

Until it happens :-) And we'll handle it then.

-- 
Regards,

Laurent Pinchart

