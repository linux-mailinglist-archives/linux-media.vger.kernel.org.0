Return-Path: <linux-media+bounces-63195-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id w2rJJDeiHGrhQwkAu9opvQ
	(envelope-from <linux-media+bounces-63195-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 23:03:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE79617F19
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 23:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75670302DF7F
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 21:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3059634B404;
	Sun, 31 May 2026 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="janKbgnb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32B91A5BAE;
	Sun, 31 May 2026 21:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780261342; cv=none; b=cTr6QBww/U+Q6Xwexb9O/pmBDFhn6ci2nF0Fw+sEGK2scIShG+9yq+1lU2meMi9vR6tW46teEjXToaT06jCselTBtB3E3yKD1WIQsqam71YhxfR1YlBy9r7yfkam/GrOCG2cvZCF7ViSf9ez4G4XmO3tRBpIrY/1hw6/kXdeX08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780261342; c=relaxed/simple;
	bh=G0ABCbeo67AuQPOwqQhkxGqx8eQZbUDLmehA7oopzrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBo1jCHPp4RGOMy5hkp6SN7PHuLO8B4EI6vtZ+dLDZ3UvCBHPY/poVpo9vYroZWPQaMBos71QvFNgqZn3RHhdjWcsD6VcAabfyCwnPK1LseaFNIKc57aP2aEVSgDihvmmZb/GI5pBMOyDMz0LWLNlmsfOkAlBZOYzhY1EMYA/3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=janKbgnb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780261341; x=1811797341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=G0ABCbeo67AuQPOwqQhkxGqx8eQZbUDLmehA7oopzrY=;
  b=janKbgnbzMIZuHaYIGtkrWiP/oXR59644/zdnYRlFky35V8gb2aZTLyl
   4qUIVClXU0NWjsXIuWDDbQEXXd0s1P+HLo0Gw8tvhcq3buHWKAu3HkwEY
   vmffG0WhvwqiyuxfZScu7mq1FU0nGOfpYcdFm4pKX4iKFUY+z0k7pMNaQ
   b08GHKXsNcemVbbzCKz/3u/7QEi07AYGiZSjyQCbk1cyg3wre2uy1Kc2H
   b4NELuROSJEHKspVcCrApX6wwWbmA84n7xtZVLJTCjMg1UNNfXhxLImAO
   fBriJHZ5YkId8UeeGc+aoI5dwBk7NTfYyLFuFEpvVmH6nMnxpBWyYmbd7
   g==;
X-CSE-ConnectionGUID: /ExZzM9HRhyL+BBQA2S87w==
X-CSE-MsgGUID: kdtYUXyvR7GZeivz19hv3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="92408428"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="92408428"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 14:02:20 -0700
X-CSE-ConnectionGUID: wd2j6lKLTxukaQOQzCxJ4A==
X-CSE-MsgGUID: yJYvhMyxTAKuVXCBUO69Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="240395281"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 14:02:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 184141203C2;
	Mon, 01 Jun 2026 00:02:09 +0300 (EEST)
Date: Mon, 1 Jun 2026 00:02:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Eugen Hristev <ehristev@kernel.org>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
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
Subject: Re: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
Message-ID: <ahyh0ZlwlZqr7VNa@kekkonen.localdomain>
References: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
 <1ddf8baa-47db-4b9d-9df6-a6075bc94593@yoseli.org>
 <5b63761b-07dd-4786-bc98-d8a1c48a2ef4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b63761b-07dd-4786-bc98-d8a1c48a2ef4@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63195-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DCE79617F19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Eugen, others,

On Fri, May 29, 2026 at 06:06:42PM +0300, Eugen Hristev wrote:
> On 5/29/26 08:12, Jean-Michel Hautbois wrote:
> > Hi Eugen,
> > 
> > Le 22/05/2026 à 17:28, Eugen Hristev a écrit :
> >> When requesting log status, the block might be powered off, but registers
> >> are being read.
> >> Avoid reading the registers if the device is not resumed, thus also avoid
> >> powering up the device just for log status.
> >>
> >> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> >> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> >> ---
> >> Changes in v2:
> >> - changed to use pm_runtime_get_if_active()
> >> - add corresponding put()
> >> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org
> >>
> >> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> >> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> >> To: Florian Fainelli <florian.fainelli@broadcom.com>
> >> To: Ray Jui <rjui@broadcom.com>
> >> To: Scott Branden <sbranden@broadcom.com>
> >> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> >> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> >> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> To: Hans Verkuil <hverkuil@kernel.org>
> >> To: Naushir Patuck <naush@raspberrypi.com>
> >> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >> Cc: linux-media@vger.kernel.org
> >> Cc: linux-rpi-kernel@lists.infradead.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-kernel@vger.kernel.org
> >> ---
> >>   drivers/media/platform/broadcom/bcm2835-unicam.c | 9 +++++++++
> >>   1 file changed, 9 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> >> index 8d28ba0b59a3..93815b8ab930 100644
> >> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> >> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> >> @@ -2052,6 +2052,13 @@ static int unicam_log_status(struct file *file, void *fh)
> >>   		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
> >>   	dev_info(unicam->dev, "V4L2 format:         %08x\n",
> >>   		 node->fmt.fmt.pix.pixelformat);
> >> +
> >> +	if (!pm_runtime_get_if_active(unicam->dev)) {
> > 
> > Well, if I am picky I would say that pm_runtime_get_if_active() can 
> > return -EINVAL if runtime PM is disabled for the device. It should then 
> > be tested against '<= 0' ?
> > 
> > I suppose this should not happen really often, as very few drivers 
> > actually test this case...
> 
> I saw that. Some do. This driver enables runtime pm in probe though. So
> I guess it cannot happen, unless runtime pm would not selected in kernel
> config, but the driver depends on PM.

Runtime PM can be disabled for a device via sysfs.

> 
> Ultimately I guess it's up to Sakari or Hans to decide whether it's
> worth checking for error code, but I picked the simpler path (and
> considering <depends on PM> in Kconfig) .

pm_runtime_put() musn't be called if there was an error as it decrements
usage_count unconditionally.

The vast majority of sensor drivers test for non-zero only and no-one has
complained. They should be fixed though...

> > 
> > With or without this small change:
> > Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > 
> > Thanks,
> > JM
> > 
> >> +		dev_info(unicam->dev,
> >> +			 "Live data N/A due to device inactive\n");
> >> +		return 0;
> >> +	}
> >> +
> >>   	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
> >>   	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
> >>   		 unicam_get_field(reg, UNICAM_PUM_MASK),
> >> @@ -2065,6 +2072,8 @@ static int unicam_log_status(struct file *file, void *fh)
> >>   	dev_info(unicam->dev, "Write pointer:       %08x\n",
> >>   		 unicam_reg_read(unicam, UNICAM_IBWP));
> >>   
> >> +	pm_runtime_put(unicam->dev);
> >> +
> >>   	return 0;
> >>   }
> >>   
> >>
> >> ---
> >> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> >> change-id: 20260521-bcmpipm-6c578e73239c
> >>
> >> Best regards,

-- 
Regards,

Sakari Ailus

