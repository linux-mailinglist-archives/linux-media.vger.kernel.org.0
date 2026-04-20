Return-Path: <linux-media+bounces-59180-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AheFMKV5mnGyQEAu9opvQ
	(envelope-from <linux-media+bounces-59180-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 23:08:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B11433E55
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 23:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D378A300C02F
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 21:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E4D39F196;
	Mon, 20 Apr 2026 21:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KD8pU7bN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A0C946C
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 21:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776719291; cv=none; b=AUinFROPgGIWa6p6m5nAh2ZkAtcloN8rRMDkwjq/E+/c08owkMYvqDFnE8+2p7bJEBM1xAEignZgXPJjBEfr8XDsc98oYUxDaacV18e5IyJXQ4cj4+1tuA2VqI/GswQKrnYlXT5/D7+bRqE/JEm9MtLlkDuHdWlLwyaHQhBQnSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776719291; c=relaxed/simple;
	bh=V0Z2f2FlNQp589AYmLZFq/0ttOn5Pe5msLYYzHguMJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9wuh3cQhViJc9KkBGiRSf/nKv9s5c6AM79qbp+/wFdFCPYVMd7zIZUcBJhX25hMi+D5AqhX73LxczXl4SLiyvkluy4EDIRaw4PLXXQkBOHUSibAcvTemRUfzwYpJnpzs1E4s/3NuiqZIl9r5SV062yclcQn//VlJV8Xz2Squ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KD8pU7bN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776719290; x=1808255290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V0Z2f2FlNQp589AYmLZFq/0ttOn5Pe5msLYYzHguMJw=;
  b=KD8pU7bNtCsFQOozGI6GfP1mboqhKgXN3tc2rkSX6dox34VMgi1i4YvI
   t+zfyGtcaewV3TEc694ytIurf+E6qJvOH/jZQImZ4QCbmHJmRbBvfFvG/
   JUfytU+rgUva8Tt44FVMzp4AcAW7F1E82R17b8wle75v4m1Ey999/bodp
   k4BE2dP18FjievGsYC+a0/CqRf2YdnMkxB71GaoUg5EpCTFU6QR7Odtq+
   hmcfo0DO0j1b3sFBzSBA0vnmkRtaQY+nFR1E75OXRl4IH82BTCxQAWnew
   PBAgOHRowTLP1+vQsuPPGZdUWQtTJUHJXYlQVBvmIUEX61ILmiJbeYA/f
   w==;
X-CSE-ConnectionGUID: /c1djaapR0aZ1xnTfJikjA==
X-CSE-MsgGUID: rinXRQAOTDKWBn9S1MVJJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81518395"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="81518395"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 14:08:10 -0700
X-CSE-ConnectionGUID: JHydEtMdTFatnvQcRMr5hA==
X-CSE-MsgGUID: VoSGvz+fR0i4CMEdOSxNww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="255298913"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.228])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 14:08:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D170B11F910;
	Tue, 21 Apr 2026 00:08:01 +0300 (EEST)
Date: Tue, 21 Apr 2026 00:08:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 04/29] media: imx219: Scale the vblank limits
 according to rate_factor
Message-ID: <aeaVsZQVHsqlOtGP@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-5-sakari.ailus@linux.intel.com>
 <adipBTTrT3ovgO-i@zed>
 <adi3yTLPNEfVYCI6@kekkonen.localdomain>
 <adi7ngYVxwBARBm1@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adi7ngYVxwBARBm1@zed>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-59180-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63B11433E55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

On Fri, Apr 10, 2026 at 11:01:02AM +0200, Jacopo Mondi wrote:
> On Fri, Apr 10, 2026 at 11:41:45AM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Fri, Apr 10, 2026 at 10:28:27AM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > >
> > > On Wed, Apr 08, 2026 at 06:39:13PM +0300, Sakari Ailus wrote:
> > > > The limits for vertical blanking (and frame length in pixels) is related
> > > > to the properties of the hardware, it's not in half-line units the driver
> > > > uses. Multiply the vertical blanking limits by the rate_factor to satisty
> > > > hardware requirements.
> > > >
> > > > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >
> > > I'm not sure I understand this change.
> > >
> > > I think we have clarified the imx219 has a "special" binning mode
> > > where the ADC consumes two lines at a time, allowing an higher
> > > framerate.
> > >
> > > The driver accounts for that by doubling the PIXEL_RATE control value
> > > and halving the VBLANK and EXPOSURE controls values when writing them
> > > to registers.
> > >
> > > Userspace is not concerned with the special binning mode and is not
> > > required to halve the values it writes to the VBLANK and EXPOSURE controls.
> > >
> > > Doesn't the same apply to the limits ? Also, I presume but special
> > > binning mode is not well documented, the actual maximum register value
> > > for the frame length is still 0xfffe.
> > >
> > > What have I missed ?
> >
> > This patch indeed changes the limits of the VBLANK control. The maximum
> > frame length (in hardware) indeed is 0xfffe but the driver only allowed
> > frames up to 0x7fff lines before this patch.
> >
> 
> Isn't userspace still allowed to write values up to 0xfffe ?
> 
> What ends up in registers is halved because, again in my speculative
> understanding of the special binning mode, when using this special
> mode two lines at the time are sampled.

Two rows of pixels are indeed sampled at the same time, but after the
analogue binning, these are a single line of samples for the digital
processing steps of the sensor. The maximum value of the frame length in
lines registers is thus unaffected by analogue binning.

-- 
Kind regards,

Sakari Ailus

