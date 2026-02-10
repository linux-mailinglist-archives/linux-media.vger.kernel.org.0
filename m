Return-Path: <linux-media+bounces-52518-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOcuClcpi2n1QQAAu9opvQ
	(envelope-from <linux-media+bounces-52518-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:49:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48511B022
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9520D3042475
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 12:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA101DF261;
	Tue, 10 Feb 2026 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wv2Zu+sF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0337E3A8F7
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727745; cv=none; b=ukPmdVWGEVyzDhUHdwFJl/prQPKX4p1pxluVQcC9GWQ/MO4oT+S1YpP19rPiQTB4Uaci7AyVk9w1EzMhOVilSgTqbKkmOzhCHR4SQuOEM0/SZt/OQIrNGx3XAntiD4H4Q4+YB3RXznBDEqZGHy20QBXpF7eLnboiBr/o9YgRxN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727745; c=relaxed/simple;
	bh=KDUozDgKNrcYnRGDo1n1kJC8HmUAI+T4KIhAXqN8OMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6nOQXhAq1ggLXk0GJW7lXKDBEA5ZlFQLtzRgWKVR+ox+tautSufPT1ZV8t3LseALzJYZvuHZFu4PEUB6KCgZ9+Qopc+RqqxPwgoqYiNagWGqhxTWzI2PF4Mx4ZtKYncMXW+BlFacncf90GrebUYs4+hQp7QKqRHkElZGe/XW3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wv2Zu+sF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770727744; x=1802263744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KDUozDgKNrcYnRGDo1n1kJC8HmUAI+T4KIhAXqN8OMQ=;
  b=Wv2Zu+sFPS03bZx3AbpoUAmGagGBcY41EEiztSPYxvmrua1VcBTrNE3x
   KMUTtizMiitg3DLfyoMIWx26Di3C/Wzpd+wgGsTevsIuU9oPyG80WAFAo
   NKv8M27WgET+ZAAtw8yy8ckuFAy6qYgZspxkU7m0CBolc4751JQrhqKPR
   WTvlbjjOk+jOYriGtnOXZP7ocXHkrB4++31fPghabZoZeakXEJRh9ybgU
   UVnyG4gqkQQbJu3uHdlQb3d5C2dVZcsKQxhkSnK0E0IX/WJBScNW5+rfh
   zWzxretwa/NmwEAwUtmLvgm22dLU049d3irZiruocNW4nH7bsXMIEP9ca
   w==;
X-CSE-ConnectionGUID: Z840gAU2Rhq8lQFIgq+tPQ==
X-CSE-MsgGUID: TJO1L1eyR/Ob0iTggylTuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71064123"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71064123"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 04:49:03 -0800
X-CSE-ConnectionGUID: iaTLE+4DTMG7fmQSeRzMaA==
X-CSE-MsgGUID: wQpPMkKaTAmRl5iVo5LQjA==
X-ExtLoop1: 1
Received: from ettammin-desk.ger.corp.intel.com (HELO alaakso-DESK) ([10.245.246.235])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 04:48:59 -0800
Date: Tue, 10 Feb 2026 14:48:56 +0200
From: Antti Laakso <antti.laakso@linux.intel.com>
To: johannes.goede@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, hverkuil+cisco@kernel.org,
	sakari.ailus@linux.intel.com, dongcheng.yan@intel.com,
	sre@kernel.org, hao.yao@intel.com, dan.scally@ideasonboard.com,
	miguel.vadillo@intel.com, ribalda@chromium.org,
	jason.z.chen@intel.com, Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH] media: ipu-bridge: Add DMI quirk for CVS-sensor
 dependency
Message-ID: <aYspOASwxCClZiaq@alaakso-DESK>
References: <20260210084152.332001-1-antti.laakso@linux.intel.com>
 <b558585e-6253-4e12-8451-f81eb3ad4867@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b558585e-6253-4e12-8451-f81eb3ad4867@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52518-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 3B48511B022
X-Rspamd-Action: no action

Hello Hans,

On Tue, Feb 10, 2026 at 10:45:54AM +0100, johannes.goede@oss.qualcomm.com wrote:
> Hi Antti,
> 
> On 10-Feb-26 09:41, Antti Laakso wrote:
> > A supplier-consumer dependency should exist between the CVS and sensor.
> > However, this dependency is missing on Dell Pro Max 16 Premium laptop.
> > 
> > To initialize these devices correctly for this laptop, add DMI match
> > table to ignore broken dependency.
> > 
> > Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> 
> Are you sure the dependency is really missing ?
> 
> ATM the kernel has the CVS ACPI-hwid (HID) listed in 
> drivers/acpi/scan.c: acpi_ignore_dep_ids[] :
> 
> static const char * const acpi_ignore_dep_ids[] = {
> 	...
>         "INTC10DE", /* Intel CVS LNL */
>         "INTC10E0", /* Intel CVS ARL */
> 	...
> };
Oh, I missed this list, thanks for pointing it out.
Removing CVS IDs from the list fixed the issue.

> 	
> because there is no upstream driver for it and cameras do work OOTB
> on a whole bunch of laptop models (Lenovo Arrow Lake / Lunar LAke
> ThinkPads) work fine without the CVS driver.
> 
> It does seem that only the Dell models actually need the driver,
> also see: https://bugzilla.redhat.com/show_bug.cgi?id=2413656
> 
> Please try removing the 2 lines I mentioned above, it is likely
> that will fix things. Note those can only be removed though
> after the CVS driver from: https://github.com/intel/vision-drivers
> has actually been upstreamed.
> 
> Maybe you can help with upstreaming the driver ?
> 
> Regards,
> 
> Hans
> 
> p.s.
> 
> About the upstreaming of:
> 
> https://github.com/intel/vision-drivers.git
> 
> Note there is both a regular driver as well as integrated update
> support into that driver. Which is something which might just
> as well be done from userspace. For upstreaming my advice would
> be to start with stripping out the upstream support, which I think
> will also be what Richard will prefer (+Cc Richard).
> 
> Even if we do somehow need some kernel support for updating
> we don't need that just to get the cameras working and getting
> things upstream without it will be much easier and will allow
> us to redesign the update support (preferably punting it to
> userspace) before upstreaming that part.
> 
> After removing the update support I do not believe that there
> will be a whole lot code left in the driver. Just some code to
> put the MITM vision chip in pass-through mode.
> 
> Upstreaming the remaining code / minimal driver should be
> relatively easy.
> 
> Note this will also require testing on Lenovo laptops which
> seem to have the ACPI node describing the CVS chip but not
> the actual CVS chip causing i2c transfers to it to fail,
> so the driver will need to recognize this case and still
> mark the dependency as resolved instead of error-ing out
> otherwise the camera support on these Lenovo laptops will
> regress.
> 
> 
> 
> 
> 
> > ---
> >  drivers/media/pci/intel/ipu-bridge.c | 25 +++++++++++++++++++++++--
> >  1 file changed, 23 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> > index b2b710094914..8dee6dfb51b3 100644
> > --- a/drivers/media/pci/intel/ipu-bridge.c
> > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > @@ -121,6 +121,18 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
> >  	{} /* Terminating entry */
> >  };
> >  
> > +/* DMI matches for systems where sensor-CVS dependency is missing. */
> > +static const struct dmi_system_id missing_dependency_dmi_ids[] = {
> > +	{
> > +		.matches = {
> > +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell Pro Max 16 Premium MA16250"),
> > +		},
> > +		.driver_data = "OVTI08F4",
> > +	},
> > +	{} /* Terminating entry */
> > +};
> > +
> >  static const struct ipu_property_names prop_names = {
> >  	.clock_frequency = "clock-frequency",
> >  	.rotation = "rotation",
> > @@ -163,13 +175,22 @@ static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev
> >  		struct acpi_device *consumer, *ivsc_adev;
> >  
> >  		acpi_handle handle = acpi_device_handle(ACPI_PTR(adev));
> > -		for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1)
> > +		for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1) {
> > +			const struct dmi_system_id *dmi_id;
> > +
> > +			dmi_id = dmi_first_match(missing_dependency_dmi_ids);
> > +			if (dmi_id &&
> > +			    acpi_dev_hid_match(adev, dmi_id->driver_data))
> > +				return ivsc_adev;
> > +
> >  			/* camera sensor depends on IVSC in DSDT if exist */
> > -			for_each_acpi_consumer_dev(ivsc_adev, consumer)
> > +			for_each_acpi_consumer_dev(ivsc_adev, consumer) {
> >  				if (ACPI_PTR(consumer->handle) == handle) {
> >  					acpi_dev_put(consumer);
> >  					return ivsc_adev;
> >  				}
> > +			}
> > +		}
> >  	}
> >  
> >  	return NULL;
> 

