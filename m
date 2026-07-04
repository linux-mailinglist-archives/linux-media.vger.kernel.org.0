Return-Path: <linux-media+bounces-66580-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FMkgI2D5SGo4wQAAu9opvQ
	(envelope-from <linux-media+bounces-66580-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 14:15:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3DB707854
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 14:15:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="D9GoMt/X";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66580-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66580-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A755300FB41
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 12:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9F739F19F;
	Sat,  4 Jul 2026 12:15:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA584B672
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 12:15:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783167322; cv=none; b=TkhK3aolP/kGMvYA/GgnS8TVjsL/AU3N2poy7yeYBkARY9W4MWdoCXT7MPfnTVRMD4NOsUZP3Nk9nvEM3Reu8dQWWBqMFNXQ/Puo7uBj34dNeyawz8w2U4eguyhUL3YQACkR1IQV1lb2q6SlzSznsZ8FhVL38shFEiDlSfYTIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783167322; c=relaxed/simple;
	bh=bkWiDDC34T8hEu5bjc+D5YiypGloBKYY/SCufkCq0uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4yZFsebqUu6x5gem30jZPl9gxpQHMNeiFr7qQZsbChpE6gEYttDtvRZuPc/ZAyJx2oFeuEZgCEf88q/iJ3VZPFItkWpFHqN/x8BmDE2nBof/6P3n1Ffj9mjPj0CuAZoF2eDWcJfmztn/l4Nkj2w4UwblXWpynl6CPwq78joyGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9GoMt/X; arc=none smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783167321; x=1814703321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bkWiDDC34T8hEu5bjc+D5YiypGloBKYY/SCufkCq0uo=;
  b=D9GoMt/XFm54gC20cyRbv0pf1Qkbl1DE+SIsSD2ky6TuPbr5fV1mURK7
   +iL+X/R07vxVVHz1QMAt2VJjwoH05GN/RW0X4K12O+lQgsUpdo3s8fg79
   d+Be47ue0j7GtC4u2023NIJOq9A9J1Z8LJlmvdmGOVgpYXcGJK4j1wKqs
   Q/dDeN7WQUFhjDGBYYYJh/NJgcBAde74XONjWp9C/oyQVj9T8Z+ZScXFB
   o3+zq1kC97A5h3qRURxjVU7Ub5bGFKPED52u2bdi9VDqrIwqLBWWQs2VG
   f4Y1C2s4XFYsqwMziSWu9v+kBMHBtzj/U/XupDbcQcLXZM/anme6QZuXE
   Q==;
X-CSE-ConnectionGUID: AC/hKIh7T7ufRIPxQRMeew==
X-CSE-MsgGUID: 8kul9o65T+O4oyJs15eiAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83971720"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="83971720"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 05:15:20 -0700
X-CSE-ConnectionGUID: +AH4+H8IT4qB9FI3n4xqOQ==
X-CSE-MsgGUID: Xada18xmRAyyBqg4Nv2kag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="258194617"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 05:15:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 32FA0120221;
	Sat, 04 Jul 2026 15:15:13 +0300 (EEST)
Date: Sat, 4 Jul 2026 15:15:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v6 09/16] media: v4l2-subdev: Always call get_fmt() if
 set_fmt() is unavailable
Message-ID: <akj5Uc6BCloMfotp@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-9-sakari.ailus@linux.intel.com>
 <akVDYmAnEckbecpA@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akVDYmAnEckbecpA@lizhi-Precision-Tower-5810>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66580-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@oss.nxp.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE3DB707854

Hi Frank,

On Wed, Jul 01, 2026 at 12:42:10PM -0400, Frank Li wrote:
> On Wed, Jul 01, 2026 at 03:26:26PM +0300, Sakari Ailus wrote:
> > Many drivers implement set_fmt() pad op that simply returns the format
> > just as get_fmt() would do,
> 
> Does get_fmt() do actualy thing? according to naming, it should just
> fetch some information.
> 
> If only fetch information, set_fmt() can do nothing, why need call get_fmt()?

Most drivers that support a single format (largely some trivial
register-list based sensor drivers) use v4l2_subdev_get_fmt() as the
set_fmt() pad op callback. There are also drivers that omit this
altogether, making VIDIOC_SUBDEV_S_FMT return -ENOTTY. Beyond that, as the
client_info argument will be added soon to set_fmt() but not to get_fmt()
pad op, v4l2_subdev_get_fmt() can no longer be used to retrieve the format.

This patch aligns the behaviour so all drivers that support set_fmt() do
support get_fmt() as well and remove some driver code in the process while
addressing the third point above.

-- 
Regards,

Sakari Ailus

