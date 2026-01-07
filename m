Return-Path: <linux-media+bounces-50176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 636DED0042A
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 22:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F5333063820
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 21:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0C33128CA;
	Wed,  7 Jan 2026 21:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7/w7xJJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A244D3164B8
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 21:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767822899; cv=none; b=JdjFrBiFUC9InMWzhvBcQz3vp62+7pxBbdBqRjCWSf48K9CCnA1EfKFVAIFOzm0bXT8zYesjQTDA+F0VMpyV0+XRMTsyTUUMLmID7+sAa7s3aMrfBuU4BcZ22p4raZCY/WRRvKBCAZZlwyBBXeeyT8SsTigNo1790/lsOVGkZzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767822899; c=relaxed/simple;
	bh=QqVWsPw6hkmRF20zjLVKVKkmuDJtOsfIVcR5A5ZK8+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSMRusTHiDU+Zoeya6eCCupnILuwjYX9P8guLvSOOi0ytVWUz0v/vXU315fBRncjPFsB+FmhjFt+ihvgiJPcKdlHlNMWRR9mkup5IG9mvgB0U++VXRxz3bpR0hB8EBL07RamF7GWd73d3NMMl196KJdooHtyroK5A6dmPFQ8Y58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7/w7xJJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767822898; x=1799358898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QqVWsPw6hkmRF20zjLVKVKkmuDJtOsfIVcR5A5ZK8+o=;
  b=g7/w7xJJvlx9iXC0mily1TynkQJ73nC5soGOnVRV6Vh2yPTuQexnNXiD
   W6jYEdKS8j+44WO2uIRMknQ/MwgrjBC+lhEfE0MzLqGvHwDCiTcGlorNv
   2dBrqDb5ibtIosOmP17yJPArxXJLQuUO8SdV0Quk914YMqV/k4w83Xsrf
   ddWiytHmfJlY3gCa9QWQ+c0OyywtI+J/2Me0jqsmnAWAKQKuVLOgTUdt1
   iM0oP1gun+BMa/iM6FY9aou0mwdtPkA3Her1pKiqOwTwETb3PcRTRwwss
   boo5p3KpW5SrKlR3g5OX7rIfNDO0XmNM2Vd13Mhpg0VH3xpDI4/hB6mH+
   Q==;
X-CSE-ConnectionGUID: np+sqVDJQIyoP5pRTn2ubA==
X-CSE-MsgGUID: WRkE0PBaQnWhS0I+FiKu/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="71776413"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="71776413"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 13:54:57 -0800
X-CSE-ConnectionGUID: n3zOc2geT+mzpWhF84Us5g==
X-CSE-MsgGUID: SgI5vQWlSym3kFC5Vf1hpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="207178382"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.174])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 13:54:55 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B76A311FBDE;
	Wed, 07 Jan 2026 23:55:08 +0200 (EET)
Date: Wed, 7 Jan 2026 23:55:08 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org, tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com
Subject: Re: [PATCH v3 07/13] media: ipu6: Close firmware streams on
 streaming enable failure
Message-ID: <aV7WPPo7p09UTegL@kekkonen.localdomain>
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
 <20251230131013.75338-8-sakari.ailus@linux.intel.com>
 <6594dfc9-bfb9-a99e-fe92-da2493397e9d@linux.intel.com>
 <aVbRzJOgMxUc7ln6@kekkonen.localdomain>
 <f8efb83d-2b3d-d69d-0613-1b5e64503265@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8efb83d-2b3d-d69d-0613-1b5e64503265@linux.intel.com>

Hi Bingbu,

On Mon, Jan 05, 2026 at 11:07:02AM +0800, Bingbu Cao wrote:
> Sakari,
> 
> On 1/2/26 3:58 AM, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > On Wed, Dec 31, 2025 at 02:11:40PM +0800, Bingbu Cao wrote:
> >> Sakari,
> >>
> >> Thanks for the patch.
> >>
> >> On 12/30/25 9:10 PM, Sakari Ailus wrote:
> >>> When enabling streaming fails, the stream is stopped in firmware but not
> >>> closed. Do this to release resources on firmware side.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> >>> index dec8f5ffcfa5..919b77107cef 100644
> >>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> >>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> >>> @@ -1066,6 +1066,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> >>>  
> >>>  out_media_entity_stop_streaming_firmware:
> >>>  	stop_streaming_firmware(av);
> >>> +	close_streaming_firmware(av);
> >>
> >> It looks the close_streaming_firmware() has no chance to run if
> >> v4l2_subdev_disable_streams() above failed. Beside, the
> >> stop_streaming_firmware() is better called after subdev
> >> disable_streams().
> > 
> > Do you mean we wouldn't need to call stop_streaming_firmware() at all here?
> > That would be actually aligned with start_streaming_firmware() error
> > handling.
> >
> 
> I mean the code above:
>   	if (!state) {
> 		...
> 		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
> 						  stream_mask);
> 		if (ret) {
> 			...
> 			return ret;
> 		}
> 		close_streaming_firmware(av);
> 	} else {
> 
> close_streaming_firmware() should be called anyway.

Ah, good point. I guess in this case it'd be probably best to just ignore
the return value -- but maybe complain -- from disable_streams() above. I
can post a patch for that.

Presumably, the same stream wasn't disabled on the source (as we've been
called) so it'd take a bug somewhere for disable_streams() to return an
error.

-- 
Kind regards,

Sakari Ailus

