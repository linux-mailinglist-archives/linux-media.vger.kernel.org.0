Return-Path: <linux-media+bounces-36540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B7AAF13BA
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A63DE17C344
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011D8265CD0;
	Wed,  2 Jul 2025 11:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDS9MSnP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07EA19995E;
	Wed,  2 Jul 2025 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455354; cv=none; b=dvsxafdZ2YZ2X44SMs+u0z2LIzn7ovaxao34QePzb2GThIxkGOJQHn8LngBsresbIk5KLQOSDy5zI2T+Yyaugfo7Ny4d7dRl+K3mdHCPawgjnENR5dvLrXDKWsRsEk4M2uHqgevEyTgqVo7eXsd/vfqabMZt5L+ytIZce9LS40g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455354; c=relaxed/simple;
	bh=Vxw7aNAX8A1faJJZOhV/LGmkoYcNCvRWyeHlbpMIZPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EX2eW7tsuWn91Fl+amiwkGkqIWh9I4WYe/BVe4mqnNpULwq03WRWgZ2v9wYbXhmun96GvTnQqasK44vGwLQ1+HqPoiKvKquMFL9H3m4bvk2ptOGd6RvVHnwezoz8iBLrFFJSrUuKKJYepZnM6J1GYStUCTUSztxEPPjMxvJousc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDS9MSnP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751455353; x=1782991353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Vxw7aNAX8A1faJJZOhV/LGmkoYcNCvRWyeHlbpMIZPA=;
  b=HDS9MSnPTKV85WuCQg+xToc3+Pxlqvt2fadZJ6LhNsyiKDx6hR7LYAZ/
   bdjOzlU1XdUe2HTfU9bPSZDO+aGTamfqD+87nJGU0OzKKCwkoIboP25ID
   5DwxW48US6XsQLGIN3SXSwmHG+fjgYjhrcikv4y/NOy8oi+booZRynXlG
   onRixBz+PWq4Xd7tOEjEPxRJH5NiFjblpMQhc7v5/gnZob23uiWZ1uQyO
   QL092qD6ayB8enUcM4/dQ7xmUvKqBDispDgz8vgtwG0WtL/akRS8/9UBj
   MSc9W0IaQd2sGEyLfGXP2kUK+dabZKKEhrOLLsDiADfBxoqk+0K830NDI
   A==;
X-CSE-ConnectionGUID: gnIhc7sUSLKRKynG3DdHEw==
X-CSE-MsgGUID: ndyV5O1gTXOdNGGUqHankw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71312520"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="71312520"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:22:32 -0700
X-CSE-ConnectionGUID: LqwGz0d+R2KFw9ex5e0iFA==
X-CSE-MsgGUID: DUaygvNVQ32PgEZuQ9sT2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153675295"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.245.162])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:22:29 -0700
Received: from svinhufvud (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTPS id 6103544390;
	Wed,  2 Jul 2025 14:22:26 +0300 (EEST)
Date: Wed, 2 Jul 2025 14:22:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, u.kleine-koenig@baylibre.com,
	ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
	stable@vger.kernel.org, dongcheng.yan@linux.intel.com,
	hao.yao@intel.com
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
Message-ID: <aGUWccuwEhpT0zbw@svinhufvud>
References: <20250425104331.3165876-1-dongcheng.yan@intel.com>
 <5a04f105-3075-3226-6ad6-f2c3f31b29da@linux.intel.com>
 <116ea6fa-e9b8-4c28-bc31-f4d1589eb34b@intel.com>
 <aGUPsDglThYGc/3g@svinhufvud>
 <268e959b-84e8-ddb0-e760-46b7901b4c2e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <268e959b-84e8-ddb0-e760-46b7901b4c2e@linux.intel.com>

On Wed, Jul 02, 2025 at 02:09:04PM +0300, Ilpo Järvinen wrote:
> On Wed, 2 Jul 2025, Sakari Ailus wrote:
> 
> > Hi Dongcheng, Ilpo,
> > 
> > On Wed, Jul 02, 2025 at 06:23:19PM +0800, Yan, Dongcheng wrote:
> > > Hi Ilpo,
> > > 
> > > On 7/2/2025 6:19 PM, Ilpo Järvinen wrote:
> > > > On Fri, 25 Apr 2025, Dongcheng Yan wrote:
> > > > 
> > > >> Typically HDMI to MIPI CSI-2 bridges have a pin to signal image data is
> > > >> being received. On the host side this is wired to a GPIO for polling or
> > > >> interrupts. This includes the Lontium HDMI to MIPI CSI-2 bridges
> > > >> lt6911uxe and lt6911uxc.
> > > >>
> > > >> The GPIO "hpd" is used already by other HDMI to CSI-2 bridges, use it
> > > >> here as well.
> > > >>
> > > >> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> > > >> ---
> > > >>  drivers/platform/x86/intel/int3472/common.h   | 1 +
> > > >>  drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
> > > >>  2 files changed, 7 insertions(+)
> > > >>
> > > >> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> > > >> index 51b818e62a25..4593d567caf4 100644
> > > >> --- a/drivers/platform/x86/intel/int3472/common.h
> > > >> +++ b/drivers/platform/x86/intel/int3472/common.h
> > > >> @@ -23,6 +23,7 @@
> > > >>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
> > > >>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> > > >>  #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
> > > >> +#define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
> > > >>  
> > > >>  #define INT3472_PDEV_MAX_NAME_LEN				23
> > > >>  #define INT3472_MAX_SENSOR_GPIOS				3
> > > >> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> > > >> index 394975f55d64..efa3bc7af193 100644
> > > >> --- a/drivers/platform/x86/intel/int3472/discrete.c
> > > >> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> > > >> @@ -191,6 +191,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
> > > >>  		*con_id = "privacy-led";
> > > >>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> > > >>  		break;
> > > >> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> > > >> +		*con_id = "hpd";
> > > >> +		*gpio_flags = GPIO_ACTIVE_HIGH;
> > > >> +		break;
> > > >>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
> > > >>  		*con_id = "avdd";
> > > >>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> > > >> @@ -221,6 +225,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
> > > >>   * 0x0b Power enable
> > > >>   * 0x0c Clock enable
> > > >>   * 0x0d Privacy LED
> > > >> + * 0x13 Hotplug detect
> > > >>   *
> > > >>   * There are some known platform specific quirks where that does not quite
> > > >>   * hold up; for example where a pin with type 0x01 (Power down) is mapped to
> > > >> @@ -290,6 +295,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> > > >>  	switch (type) {
> > > >>  	case INT3472_GPIO_TYPE_RESET:
> > > >>  	case INT3472_GPIO_TYPE_POWERDOWN:
> > > >> +	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> > > >>  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
> > > >>  		if (ret)
> > > >>  			err_msg = "Failed to map GPIO pin to sensor\n";
> > > > 
> > > > I was informed about existance of this patch through an off-band channel 
> > > > (as I was not among receipients). In future, please include all relevant 
> > > > maintainers and MLs as receipients as indicated by 
> > > > scripts/get_maintainers.pl.
> > 
> > Hans used to handle these previously and I think that's why you weren't
> > cc'd.
> 
> I understand I'm relatively new to this and changes such as this can be 
> easily missed for relatively long time. However, it won't explain why 
> pdx86 ML was not included.
> 
> Usually it's an indication of using fragile patch sending routine if the 
> get_maintainers.pl provided receipients are not factored in at least 
> semi-automatically at the time of sending, and ends up easily missing 
> necessary receipients. So my suggestion is the original submitter looks 
> into the process used at the moment of sending the patches out.

I just posted v4, to the appropriate recipients I hope. Another int3472
conflicted with v3.

-- 
Regards,

Sakari Ailus

