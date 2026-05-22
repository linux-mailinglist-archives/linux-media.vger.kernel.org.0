Return-Path: <linux-media+bounces-62593-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBCiN2wyEGp4UwYAu9opvQ
	(envelope-from <linux-media+bounces-62593-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:39:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 928E55B24D5
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A7033063F06
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBDB3CB91F;
	Fri, 22 May 2026 10:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgGyU12e"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63FF3C4B86;
	Fri, 22 May 2026 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445737; cv=none; b=R+H19o998RB9jTK7lwwLrutKHcufM/bVIV2/bXQ9Dpu8Hkjne4bbYJomFaVkusO7kzpwcwZUYmjxyVvOCUKjMu+tucRgT/mdVUnee6Ay7oI6sj0YszIgli46qydGF/Wq6SveVOhguUZMCp7cwYZqrJgzLgsAwvSguvN9IpNqjLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445737; c=relaxed/simple;
	bh=o80USRSoOccAjZ0/+LbXX+qxTLzgZyZiobgDeEHQ1+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYz/JKR79teEJbNWLMdzWCrBtphjIx9iksQp3uYk9q2JrOZqaeQX1vmTRrre8jCW8FRNUHWgmoLr/9OsqBCVoa3ApuU593PW9mzhlUUJ9yTqFVsw3KewScSOt4qCI1SzD2JOgMzDKsBipPVwE08FFcQJae74kEotulJ6e1Htm9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgGyU12e; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779445736; x=1810981736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=o80USRSoOccAjZ0/+LbXX+qxTLzgZyZiobgDeEHQ1+U=;
  b=VgGyU12eDAO/sTp0dqlCdcR1Ibul0/K1Zii1sJi/VMGxHJAcjsSM8f5E
   TqmVIVNPl7xVWr91uf2gFLr5g1nGhqeJE64u2PBJI97wGTmZvWOvlFGOP
   +VCC2Ve4fcAV0VY0kHDE2voJiVXN0l55I5Arzuvkqbg282vAXwcJFK4h0
   Cl3yrSAn66rsrjgjGtJ6Ub8PulFgvnjbQovCkkECgBlhZS+r20SrZCeom
   O8DtOgRtHrNIhWW23vvlgeZGDpFm6DgQH3ui5H6gJP+1d0mNsGPUYOI2G
   GOAHXDX24mZAFTWSNP0kO4Px0ru21VCPMMUQUihATgMHfCCJD4nMviv+M
   w==;
X-CSE-ConnectionGUID: nlU/wtjlQlOInBCB9OiKNQ==
X-CSE-MsgGUID: +8ZcvxkDRkyxaDKSLZzDaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="103052273"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="103052273"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:28:55 -0700
X-CSE-ConnectionGUID: L4nas1MgQJyvuR4w2vBveQ==
X-CSE-MsgGUID: CGSZjljdTVKDuo6whHqd1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="245860596"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.224])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:28:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 99493121C7F;
	Fri, 22 May 2026 13:28:47 +0300 (EEST)
Date: Fri, 22 May 2026 13:28:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Eugen Hristev <ehristev@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Fix log status runtime access
Message-ID: <ahAv3430zwqeDXnQ@kekkonen.localdomain>
References: <20260521-bcmpipm-v1-1-3eba88d88045@kernel.org>
 <4d7deb19-d384-497e-8139-c977a9f3679d@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d7deb19-d384-497e-8139-c977a9f3679d@yoseli.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62593-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 928E55B24D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Eugen, Jean-Michel,

On Fri, May 22, 2026 at 10:31:51AM +0200, Jean-Michel Hautbois wrote:
> Hi Eugen,
> 
> Thanks for the fix, the issue is real, but I think the patch leaks a runtime
> PM reference.
> 
> Le 21/05/2026 à 20:09, Eugen Hristev a écrit :
> > When requesting log status, the block might be powered
> > off, but registers are being read.
> > Avoid reading the registers if the device is not
> > resumed, thus also avoid powering up the device just
> > for log status.

Please rewrap this, most editors can do that automatically.

> > 
> > Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> > Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> > ---
> >   drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > index 8d28ba0b59a3..818694f007e2 100644
> > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -2052,6 +2052,10 @@ static int unicam_log_status(struct file *file, void *fh)
> >   		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
> >   	dev_info(unicam->dev, "V4L2 format:         %08x\n",
> >   		 node->fmt.fmt.pix.pixelformat);
> > +
> > +	if (!pm_runtime_get_if_in_use(unicam->dev))
> > +		return 0;
> > +
> 
> pm_runtime_get_if_in_use() returns 1 and increments the usage counter is
> active and in use.

Also, should this be pm_runtime_get_if_active() instead?

> 
> I think we need to add:
> pm_runtime_put(unicam->dev);
> 
> Just before the return 0;
> 
> BTW, we may miss a dev_info explaining why the live data is skipped when the
> device is suspended ?

-- 
Regards,

Sakari Ailus

