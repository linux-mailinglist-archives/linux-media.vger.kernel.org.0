Return-Path: <linux-media+bounces-54068-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMTGGspWpWmh9gUAu9opvQ
	(envelope-from <linux-media+bounces-54068-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:22:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF77D1D576F
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6A543027D99
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 09:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471FC38F237;
	Mon,  2 Mar 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9StlWFC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A9E19E992;
	Mon,  2 Mar 2026 09:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443327; cv=none; b=EeGi+0ZhgLsoaunI88JHMsQ+CTCaxb96D+9AafuiIO8PraEbnFqyCo1KjS/X3y2evDZ6yGLrlEqaUGjqyt0vl8dKG6ljH4lgaikYZyknOc7weF9PnHfRHjCul5HMN3KBmLujb6SC4DKdj9vPKVchkAuVvIm4pP4fPx7JFkiX+Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443327; c=relaxed/simple;
	bh=+Nd0XzZ3rH/cvBvTNRRmkHy3yGtEPXKKdWv1M/SbkpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tjm4j2HjTvd7Vi4+DTrUxIYEByIKN6fmLSRjGPhB5mYopQ69euXPWs2j4fwd+5t4gu0ZdnN3xJgbm6gOV9JH9CJsmj1N3+v3VsH2JaNF8EgvLTHbQj914UvpqM6AcrHpV60EfdoLdZDJVIrk6GHs95/LWmQjexA1dMNES5MCqTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9StlWFC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772443326; x=1803979326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Nd0XzZ3rH/cvBvTNRRmkHy3yGtEPXKKdWv1M/SbkpQ=;
  b=m9StlWFCMESvmO25WTJwnhw0C1ZI7aRz0lFSyYIspaTUqh/3XCeu1zhD
   /a0OMf+Sgfawg2NNGIZCy9Ir6Ha50I8vXckspIRdDQn/rk/BSpuEsDjBq
   qsZBkeRB8OVIseCcdKsBQLhPLVompbIWWJQV68DUpz+vdZTxPrgJULefM
   b3pHndfOKxO3gEZvoYCND2ASIfXvnQb+wOH1ABwa/yt8BBHleS6gvTqe7
   U9C8pxRjI1ecq6M3py7rzSjdagxmuV9+yDPtTK7Ro4JPuBI+2ohWORBCM
   5GgtuODCR3SfcMl2mh/42PN5J3cDmcvKUdK//lAtiGoyNjD2yHmp/3TIH
   g==;
X-CSE-ConnectionGUID: QXXnSvrgTFmF4TrQZp6d/g==
X-CSE-MsgGUID: q1pQyluXQ8mDGy/deSuw4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73511408"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73511408"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:22:05 -0800
X-CSE-ConnectionGUID: 1o4TvgzNQKmKGdRP9C7DPg==
X-CSE-MsgGUID: 0TbvCP3IRqeSGCNvDHqtPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="217619396"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.89])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:22:03 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2F46E11F8CF;
	Mon, 02 Mar 2026 11:22:30 +0200 (EET)
Date: Mon, 2 Mar 2026 11:22:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: cy_huang@richtek.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bryan Wu <cooloney@gmail.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	roger-hy.wang@mediatek.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v3] media: v4l2-flash: Enter LED off state after file
 handle closed
Message-ID: <aaVW1ukZ8pGit5Us@kekkonen.localdomain>
References: <1106c60cb96786ade1f60c692e566c408d7d8174.1768209230.git.cy_huang@richtek.com>
 <f5980192-a878-47ed-9b38-8607fb7abdc2@gmail.com>
 <aZwhSj4jhEOUKZ3x@kekkonen.localdomain>
 <b600e509-a58c-42e4-91bc-d5222638b48f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b600e509-a58c-42e4-91bc-d5222638b48f@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54068-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: BF77D1D576F
X-Rspamd-Action: no action

Hi Jacek,

On Mon, Feb 23, 2026 at 07:32:16PM +0100, Jacek Anaszewski wrote:
> Hi Sakari,
> 
> On 2/23/26 10:43, Sakari Ailus wrote:
> > Hi Jacek,
> > 
> > On Sat, Feb 21, 2026 at 04:48:48PM +0100, Jacek Anaszewski wrote:
> > > Hi ChiYuan,
> > > 
> > > On 1/12/26 10:20, cy_huang@richtek.com wrote:
> > > > From: ChiYuan Huang <cy_huang@richtek.com>
> > > > 
> > > > To make sure LED enter off state after file handle is closed, initiatively
> > > > configure LED_MODE to NONE. This can guarantee whatever the previous state
> > > > is torch or strobe mode, the final state will be off.
> > > > 
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: 42bd6f59ae90 ("media: Add registration helpers for V4L2 flash sub-devices")
> > > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > > ---
> > > > Still cannot pass patch integration check, send v3 patch to fix all.
> > > > 
> > > > v3
> > > > - Remove 'Reported-by' tag
> > > > - Fix identation check for patch integration
> > > > 
> > > > v2
> > > > - Fix commit message redudant space cause patch robot parsing error
> > > > 
> > > > Hi,
> > > >     We encounter an issue. When the upper layer camera process is crashed,
> > > > if the new process did not reinit the LED,  it will keeps the previous
> > > > state whatever it's in torch or strobe mode
> > > > 
> > > > OS will handle the resource management. So when the process is crashed
> > > > or terminated, the 'close' API will be called to release resources.
> > > > That's why we add the initiative action to trigger LED off in file
> > > > handle close is called.
> > > > ---
> > > >    drivers/media/v4l2-core/v4l2-flash-led-class.c | 6 ++++++
> > > >    1 file changed, 6 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > > index 355595a0fefa..46606f5cc192 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
> > > > @@ -623,6 +623,12 @@ static int v4l2_flash_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > > >    		return 0;
> > > >    	if (led_cdev) {
> > > > +		/* If file handle is released, make sure LED enter off state */
> > > > +		ret = v4l2_ctrl_s_ctrl(v4l2_flash->ctrls[LED_MODE],
> > > > +				       V4L2_FLASH_LED_MODE_NONE);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +
> > > >    		mutex_lock(&led_cdev->led_access);
> > > >    		if (v4l2_flash->ctrls[STROBE_SOURCE])
> > > > 
> > > > base-commit: 8ac28a6642d1cc8bac0632222e66add800b027fa
> > > 
> > > The patch itself looks good, but while at it I started wondering
> > > if we shouldn't move below STROBE_SOURCE access before the lock.
> > > I don't see now, why we placed it there.
> > > 
> > > Adding Sakari.
> > 
> > Thanks for cc'ing me.
> > 
> > The behaviour this patch changes has been around for a decade or so. I
> > wonder what breaks if we change it now. It works the same way as the sysfs
> > LED API, too, and I think common behaviour between the two APIs was the
> > reasoning back then as well.
> 
> The thing is that v4l2_flash_open() disables LED sysfs interface via
> led_sysfs_disable() and v4l2_flash_close() enables it via
> led_sysfs_enable(). led_sysfs_{enable|disable}() modify the state of
> LED_SYSFS_DISABLE flag.
> 
> Therefore it is only the led_sysfs_{enable|disable}() API that needs to
> be called under led_access lock, since the LED subsystem sysfs handlers
> test the LED_SYSFS_DISABLE flag under the same lock, and return -EBUSY
> in case it is set.
> 
> The call to v4l2_flash_close() is synchronized internally in V4L2 core
> I believe.
> 
> Therefore I think that we can safely move the
> "if (v4l2_flash->ctrls[STROBE_SOURCE])" condition before the lock.
> 
> Otherwise we would have to put this new v4l2_ctrl_s_ctrl() call,
> added in this patch also under the lock because why not. It would spark
> questions in the future asking how it is different from the above
> "v4l2_ctrl_s_ctrl(v4l2_flash->ctrls[LED_MODE]" case.

My concern really is that this is not a bugfix but a change of an existing
UAPI that's been out there for a decade. Such a change is likely to cause
troubles to the users. Let's see what others think.

-- 
Kind regards,

Sakari Ailus

