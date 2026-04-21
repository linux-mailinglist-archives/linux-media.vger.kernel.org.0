Return-Path: <linux-media+bounces-59225-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PlKMLWg52nw+QEAu9opvQ
	(envelope-from <linux-media+bounces-59225-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 18:07:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A63BE43D229
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 18:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 237C0301BDA3
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 16:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F76363C4C;
	Tue, 21 Apr 2026 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2xDMyHR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB71E2614
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787477; cv=none; b=Q4+zCXgTQwxP2itc3mHWHEIq+HIj7MuWZHC9Bmfj3o7Vtund33pnSFvOA3WZ01qdGdbbRUVaSajZsj3Oq8g8RrouRkdbsoagrWFiZcquyG0eHAUPersi+tKm8JaNBYDEn/Oeq09TWYxdDOtYr097B40iMGPtr2yV+jDkTNskGFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787477; c=relaxed/simple;
	bh=a3Byel0mi1wXY8UkUAeCgJ0uEsjJAgVU7204iXe9ROA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbieAyYyDtQNADb1Bkbcwj7IU3QYZ5SxfD9U3CDtwEFbDqyAvMbuDeg2ZXSYUwH0uXXgEcs4d0PaLQEe+RTOGbDGO5dkqAxfmjiF21rNyaFcUp++YRXPhYtzUzL7LQHMdxWCHjJw4UtF3tvwPkX2n7exaMfMggTRpO/vFjdjv48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2xDMyHR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776787476; x=1808323476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a3Byel0mi1wXY8UkUAeCgJ0uEsjJAgVU7204iXe9ROA=;
  b=C2xDMyHRuqK+ZmFM9Jb/G+kaPEb/ST3XGrk4egzhwpwQ2lHMX9e03v/b
   nZXUWR0B9Si6ve5zx9Kf2OCpr8lscveKaMRWWBWCm5rVDmmiwvXf3MPKt
   CoHcrieVnKsnTzYAos94Ue2k0Agt9FCXliaeup0vNEfTk6oBVp99ZFOZc
   A5qLYTL8n7iil9Hu2TWth5MZv1B/0oE6FEKth9OxUbv1JvyHyX5SSAcU/
   bv4PcdfZ4J80mhl/6/itGKgNI19U/T0wNhNK9eJdxdiv8v4BrBjOwPCMk
   PN125MpbPPSdtRGsPP7hWHPofHL4VWXZ0aoanfzli31jaC2bOFpvWeI9N
   A==;
X-CSE-ConnectionGUID: QWBGtMu2TyK6xsHRLDYHBw==
X-CSE-MsgGUID: protytrET6mH25VZ4NG0PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="89195164"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="89195164"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:04:36 -0700
X-CSE-ConnectionGUID: sQHpPu2tSqy8Ev1cD2GpMw==
X-CSE-MsgGUID: xUXTRC8nSHyrr/MAHNji9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="231939806"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:04:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DB724120D05;
	Tue, 21 Apr 2026 19:04:26 +0300 (EEST)
Date: Tue, 21 Apr 2026 19:04:26 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 27/29] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_active_state
Message-ID: <aeegCr3fF5cb770c@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-28-sakari.ailus@linux.intel.com>
 <20260416173821.GA1824072@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416173821.GA1824072@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-59225-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A63BE43D229
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Thu, Apr 16, 2026 at 08:38:21PM +0300, Laurent Pinchart wrote:
> On Wed, Apr 08, 2026 at 06:39:36PM +0300, Sakari Ailus wrote:
> > Add v4l2_subdev_call_ci_active_state(), to call sub-device pad ops that
> > take struct v4l2_subdev_client_info pointer as an argument.
> 
> If we drop the client info parameter from .get_fmt(), the only driver
> calling this new macro will be
> drivers/media/platform/ti/cal/cal-video.c. I would just pass NULL
> explicitly there and drop this patch.

That'd make the arguments for set_fmt and get_fmt different. I'm not sure
if that'd be a problem in practice, perhaps not.

I could imagine in the end we'll need to include the client flags in more
callbacks than set_fmt(). It might not be a bad idea to add them to all pad
ops. Of course we could revisit this later when needed.

-- 
Regards,

Sakari Ailus

