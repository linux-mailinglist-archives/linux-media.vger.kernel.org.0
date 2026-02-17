Return-Path: <linux-media+bounces-52958-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKRaA0QilGmqAAIAu9opvQ
	(envelope-from <linux-media+bounces-52958-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:09:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CE2149B62
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 09:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A02CA3010D87
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518E42D59FA;
	Tue, 17 Feb 2026 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mu+AKKsS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36282D47EF
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315758; cv=none; b=VVeTfK0Dt1D8R12PDqYmOOiTlgoG/TzzzS+K9zjgf1/tU9J6Xx9c6w9FdRcVLS+yLmeRB3cf3M3egCuepA6dhCnQm6I4BI2IzQdkNLbQ8v6rWKT4BTeI5wVRCAOfBCNZOeWWAQFKlWpmri90CJ/j6sNTMbFyoQ54rr77TQD86Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315758; c=relaxed/simple;
	bh=J+MHF1gYO9DRiEZFLrsXiXWBMFldWBQWkOxV3Bcoe9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IU1+wnKomUOC9bgxEZskh+XRGtDDF+KBpQKK8dxJvTo+VaZxaqtmGwaCzKdYAZ45pybm5GzMa5Zh1DK1p0MVrSeGPInWJXSJnLyI7cQxk6EF/0g7dICRBUp364G+1miec9OCwl6nOoG6ims4RJWAyn9H9F80921OwzVhXWWkiIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mu+AKKsS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771315758; x=1802851758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J+MHF1gYO9DRiEZFLrsXiXWBMFldWBQWkOxV3Bcoe9I=;
  b=mu+AKKsS+Ml6ePlLm9BS2BSy/Ym+0bK72Ga2Uc8HCOR8XL4SKh8h9xA9
   M8diJDiB7e+VQMTksf4Oq3piMzqxMQPB4UugGY/heb5CoMurK2MzgkPkF
   w2Kn8mtYSqgfO1MEvzmlR5PIlF6YUS/+WBUIfCR5vMAyg6dA9Pa/w3GsX
   ZDQksF/6hm7ikEqhJpRbTvbOyLYNA4ZWY/u0FWhP1+o3NyujVCFx6TIqr
   ba/Iik6Pzpxl9XmRGMJzU02VBhVAlteMUhYQcSv7MEnMA6G2iKw+yL0Ed
   vkBqYC4b8aMe4Zep5B1uKjWc5QCxD4OTR/ooesT09QkbRzqsjSRFioMUr
   Q==;
X-CSE-ConnectionGUID: S5pj17xgTY2DkTKUq2uM9w==
X-CSE-MsgGUID: eLwcUP9SQ2WZ5P+2kfgG1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83745608"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="83745608"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 00:09:17 -0800
X-CSE-ConnectionGUID: gB/xGiihTjW6CmCPC8sz5w==
X-CSE-MsgGUID: 7CkmyqEDSP+WZCIm1Q2NaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="212900533"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 00:09:10 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A65D611FC4C;
	Tue, 17 Feb 2026 10:09:32 +0200 (EET)
Date: Tue, 17 Feb 2026 10:09:32 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 12/14] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_active_state
Message-ID: <aZQiPMYkUyj66-fa@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-13-sakari.ailus@linux.intel.com>
 <9db77489-4070-4a15-a733-01befbbef0b1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9db77489-4070-4a15-a733-01befbbef0b1@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52958-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 62CE2149B62
X-Rspamd-Action: no action

Hi Mirela,

On Mon, Feb 16, 2026 at 06:20:53PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 2/11/26 11:09, Sakari Ailus wrote:
> > Add v4l2_subdev_call_ci_active_state(), to call sub-device pad ops that
> > take struct v4l2_subdev_client_info pointer as an argument.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   include/media/v4l2-subdev.h | 49 ++++++++++++++++++++++++++++---------
> >   1 file changed, 38 insertions(+), 11 deletions(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 20cf0560c7f9..b22b05534447 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1912,6 +1912,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
> >                  __result;                                               \
> >          })
> > 
> > +#define v4l2_subdev_call_waive_fourth(first, second, third, fourth, rest...) \
> 
> waive is not very suggestive, maybe use drop instead?

I'll use that for v3.

-- 
Sakari Ailus

