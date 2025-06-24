Return-Path: <linux-media+bounces-35767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F19AE63CB
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 965001924D57
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 11:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEA228C843;
	Tue, 24 Jun 2025 11:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsHVH/Wu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8351EBA09;
	Tue, 24 Jun 2025 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765597; cv=none; b=GspmYx3isoeJXiqc+AzgDhMTmmcGibLgEb8lq89mr5/LSaQJL1UR+FIm14RGUoyZsve11hY74i6KE8eoHbFmjh7lmUT6IYZpK1LOKi0dl9a+GYySsylc/Zg8gCZI3aRC6jqBPNYhLqSDosNK6JnmwDiGfzegQUWgi6bwfzMmc8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765597; c=relaxed/simple;
	bh=Aq9GD2THfqFXMbWItD81A4DWQCtFtMOiUc3S2GCPJMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQz0Y/SGZyH9w7IgVIcrE0De1NOEOxT8igufNVwPdKWsMQa9lKbg6HCCish5xh/HoQy4/2uaE4tnHQlv4qX0ODIbDPKQMSwHi/LI1xjAkjj6bhhHs4PWYgbqsWCPZJUhTUuaPcEER/Mxv7SkqrCljl/uQ1fFTBvCtmwW7AoaAUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsHVH/Wu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750765596; x=1782301596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Aq9GD2THfqFXMbWItD81A4DWQCtFtMOiUc3S2GCPJMY=;
  b=OsHVH/WuzzAIchm8vrneTB0NzP75WbpC8zE/7tPgkE8sMO8CnhJkFkML
   fhDhMiKPUQ1E/jKEbk9dMBXpucdXm4Do7Ksz+lKw255PrqIA3278vG+qd
   glXvtR81qmuQz09r3DKXr7GhPW4XJO51JP4OA0QOUYIexjvhy2eL3ob18
   AiIMV3IPUq3v/UEF14Wf6n6BtoOPaPhwbvViDerZyWV63jmhTUv6jRMg6
   F50KaYpY7hgWe71ld0MXXqxpUZ5Hb5oQZ/HJMcyiW3i097XQq6K9KEGBM
   yIRfJcQ6SshwEP4Q92A/3IovnAovOWpEw8WC8RpSszdlirNJ5Ee2ZCntR
   w==;
X-CSE-ConnectionGUID: v+/US/TqQ++WwFPTzfuJfQ==
X-CSE-MsgGUID: F0X7bjy/QuGVAXcDtszJcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63694013"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="63694013"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:46:35 -0700
X-CSE-ConnectionGUID: Ydx9rhrBQc+u94FJjhhIjQ==
X-CSE-MsgGUID: zQie7ZLdSTig2uGW7zzDJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152400921"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.201])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:46:30 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3361911F742;
	Tue, 24 Jun 2025 14:46:27 +0300 (EEST)
Date: Tue, 24 Jun 2025 11:46:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <aFqQEwdzSY123xps@kekkonen.localdomain>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nixg4efp3zkdpd6h7kp6wkvam63batpoknov2nkgu36voks6bk@gzuackzl3l5g>

Hi Mehdi,

On Tue, Jun 24, 2025 at 01:27:03PM +0200, Mehdi Djait wrote:
> Hi Laurent, Hi Sakari,
> 
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
> 
> - software_node can also be used on DT systems
> 
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

I'm in favour of the latter but both should be workable.

Speaking of return values, devm_clk_get_optional() may also return
-EPROBE_DEFER. That needs to be handled.

And further on -EPROBE_DEFER, I think the helper should return
-EPROBE_DEFER if the "clock-frequency" property doesn't exist on non-OF
nodes. That signals the required software nodes required on Intel Windows
definitions/ipu-bridge or AMD systems aren't in place yet so really probing
should be deferred. This would allow removing the hacks that return
-EPROBE_DEFER in sensor drivers when no graph endpoint is found.

-- 
Regards,

Sakari Ailus

