Return-Path: <linux-media+bounces-53175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL0LA0MhnGkZ/wMAu9opvQ
	(envelope-from <linux-media+bounces-53175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:43:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B31CD174187
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE5E13005E9A
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE01350287;
	Mon, 23 Feb 2026 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+OVcWzP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561CD1D5147;
	Mon, 23 Feb 2026 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839798; cv=none; b=JAIA2AStRV/CS8QLUVJ3rZ43az4BIrK3/mqN1sg4NHfG2MIl45PLqlaoxdTS/pFrUaH1ZrMwG4ak4oXzEfk9CLR1trKWqMVCBIAXBKlxh/SShsNGCa076LPkxw+idyRQ13SC3cnCmmBcgvSrMQClEVIN4NMbweJCZRlpZJc0K3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839798; c=relaxed/simple;
	bh=07uW4uvn2V15uKGNvC2oAHiIQAwX+ScRa++ryW7DWPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0EHAgkT5REd2SC6MKvzqPyqCEWvQTgPN2SK6zlNTsY+wJNaIxdIbu2/XffXH9YfbGE+alYoOi74+YD68U6a1EMZ0TBB+MYQB9LSE0xhOBibqdcFPg7qhN/i4RYBpAKfIu8kuaAl8I7bvE26wriedGCwgAjxU6FSWbKbAyPjL+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+OVcWzP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771839797; x=1803375797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=07uW4uvn2V15uKGNvC2oAHiIQAwX+ScRa++ryW7DWPs=;
  b=H+OVcWzP/MgC/ZU+sV+XyyH3AVlSE7/BP1cRg/m0W/8fVXedCxx4i/JX
   NRDVKo/3yTWUPMACakXL+g4KFHk+sK3XwGoyodCMp9mNiWB9QLEuvhuLG
   bqxMNbffxBmcfNVR6A3OveD7pe/2DIHSJUlyeTn35DqXABzoFqk596FNr
   DBtrmWq9UBrgEI0nhWkiHQW/Jc41F7bhAayaK/ln6qwJr+leXtSpjkto8
   mMxvOZ5XfsuHyBm+pq3GlUPL7LvKZqo+MqXAPsxnnz3bp8KUlZvL6/MV3
   lGQSh6Nnn26KapJt35J17fSw4zKnjo1T0rDDWUBcc2JvOsO8XwvDuxcBJ
   w==;
X-CSE-ConnectionGUID: QCOVQWq0Qz+aWawzRIfdcw==
X-CSE-MsgGUID: /7uERX8YQEmzljT1dFQAaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76441932"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="76441932"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 01:43:16 -0800
X-CSE-ConnectionGUID: wa5XkT+FTCSTd66BSc+x5Q==
X-CSE-MsgGUID: 0SeF7ea3TPCNJA9s+303LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="215647941"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.225])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 01:43:14 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E963511F908;
	Mon, 23 Feb 2026 11:43:38 +0200 (EET)
Date: Mon, 23 Feb 2026 11:43:38 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: cy_huang@richtek.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bryan Wu <cooloney@gmail.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	roger-hy.wang@mediatek.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v3] media: v4l2-flash: Enter LED off state after file
 handle closed
Message-ID: <aZwhSj4jhEOUKZ3x@kekkonen.localdomain>
References: <1106c60cb96786ade1f60c692e566c408d7d8174.1768209230.git.cy_huang@richtek.com>
 <f5980192-a878-47ed-9b38-8607fb7abdc2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5980192-a878-47ed-9b38-8607fb7abdc2@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53175-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[richtek.com,kernel.org,gmail.com,samsung.com,mediatek.com,vger.kernel.org,ideasonboard.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,intel.com:dkim]
X-Rspamd-Queue-Id: B31CD174187
X-Rspamd-Action: no action

Hi Jacek,

On Sat, Feb 21, 2026 at 04:48:48PM +0100, Jacek Anaszewski wrote:
> Hi ChiYuan,
> 
> On 1/12/26 10:20, cy_huang@richtek.com wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> > 
> > To make sure LED enter off state after file handle is closed, initiatively
> > configure LED_MODE to NONE. This can guarantee whatever the previous state
> > is torch or strobe mode, the final state will be off.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 42bd6f59ae90 ("media: Add registration helpers for V4L2 flash sub-devices")
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> > Still cannot pass patch integration check, send v3 patch to fix all.
> > 
> > v3
> > - Remove 'Reported-by' tag
> > - Fix identation check for patch integration
> > 
> > v2
> > - Fix commit message redudant space cause patch robot parsing error
> > 
> > Hi,
> >    We encounter an issue. When the upper layer camera process is crashed,
> > if the new process did not reinit the LED,  it will keeps the previous
> > state whatever it's in torch or strobe mode
> > 
> > OS will handle the resource management. So when the process is crashed
> > or terminated, the 'close' API will be called to release resources.
> > That's why we add the initiative action to trigger LED off in file
> > handle close is called.
> > ---
> >   drivers/media/v4l2-core/v4l2-flash-led-class.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > index 355595a0fefa..46606f5cc192 100644
> > --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > @@ -623,6 +623,12 @@ static int v4l2_flash_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >   		return 0;
> >   	if (led_cdev) {
> > +		/* If file handle is released, make sure LED enter off state */
> > +		ret = v4l2_ctrl_s_ctrl(v4l2_flash->ctrls[LED_MODE],
> > +				       V4L2_FLASH_LED_MODE_NONE);
> > +		if (ret)
> > +			return ret;
> > +
> >   		mutex_lock(&led_cdev->led_access);
> >   		if (v4l2_flash->ctrls[STROBE_SOURCE])
> > 
> > base-commit: 8ac28a6642d1cc8bac0632222e66add800b027fa
> 
> The patch itself looks good, but while at it I started wondering
> if we shouldn't move below STROBE_SOURCE access before the lock.
> I don't see now, why we placed it there.
> 
> Adding Sakari.

Thanks for cc'ing me.

The behaviour this patch changes has been around for a decade or so. I
wonder what breaks if we change it now. It works the same way as the sysfs
LED API, too, and I think common behaviour between the two APIs was the
reasoning back then as well.

-- 
Kind regards,

Sakari Ailus

