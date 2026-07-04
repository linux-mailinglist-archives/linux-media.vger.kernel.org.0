Return-Path: <linux-media+bounces-66581-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jaB+Bpz5SGpBwQAAu9opvQ
	(envelope-from <linux-media+bounces-66581-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 14:16:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3370786D
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 14:16:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=lQXN2kPT;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66581-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66581-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BBEE300B45C
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 12:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0232031ED81;
	Sat,  4 Jul 2026 12:16:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB9234EEF7
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 12:16:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783167383; cv=none; b=dlkVGI/6ftmM9Spr3j/TRkoOWDKzgino8i+51WfwFbNbzqfBkuH2Vn6T6q94MF/jQK5HWusdzkNZSzU+1WkG/ZXu0dFV5+SA1E675CcVzA3EXe0FvgWESoJiMG7S4Fhsk9UXL1tY1eGwLCKUGTj+f/9/VdKgP5PLAc4wdOpZiwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783167383; c=relaxed/simple;
	bh=xhQgV14bcHK6645fVIadpaONbwTTdHdy2ABb7xhAX7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqckYqkaDy27yaUC6n0gXd78ZcVGXEbArDvT62d30OeSF3CEfh5lfKCv4tTWtQLa4NUakb+OylASXhqlsOrht7XPx2S2pajFKvY5fUtUN/EsroOqU2O+2XeuPmcnknMhaxsQdIXColQdxhfgF1ufUfbDgWX4eBLgdwBujaFO+mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQXN2kPT; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783167382; x=1814703382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xhQgV14bcHK6645fVIadpaONbwTTdHdy2ABb7xhAX7g=;
  b=lQXN2kPTYRzc6dC8znw2DJSNOLJSHqgAAcze24h5oWiPTHJfy9UFf368
   5saBeR/f+lCXi4PpaBsfCy/Ovb6raqN1vlvysERZ9XXUpsom/eypgEmrN
   6TOSLxtW2T0HEllQMuBflwEh9T5tHmqtYM/d1YQTQ2+McwNVQSpRVprIY
   ovb0L96ewX4jgpzRx2pBp1ST2CoCGDsNDeHIRz9LXsH0RPYqQwTPHnayy
   z7wD8eKv2oB8xLdD2NSDYZA71wYw2oKOUzMRjOGFbiaK244/GGbut13o9
   f3D9jpoKvX6L2vOeAqzQ4YUPSyFRnPLOpro4sGi/lEbFWan4Ut1GbbOAy
   A==;
X-CSE-ConnectionGUID: GsBmS5V4Tc2hBNnXNoo1ng==
X-CSE-MsgGUID: yLds5aVTQre2xrSzENBmcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87792021"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="87792021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 05:16:21 -0700
X-CSE-ConnectionGUID: mDplI5DRT16nAKOBBqgJig==
X-CSE-MsgGUID: JwYtuPbuQJuIOmWtyDxQQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="257184118"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 05:16:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 50EE8120221;
	Sat, 04 Jul 2026 15:16:13 +0300 (EEST)
Date: Sat, 4 Jul 2026 15:16:13 +0300
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
Subject: Re: [PATCH v6 13/16] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_state_{active,try}
Message-ID: <akj5jZqMtGip7NwC@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-13-sakari.ailus@linux.intel.com>
 <akVHAKPeDNzcqTIV@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akVHAKPeDNzcqTIV@lizhi-Precision-Tower-5810>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66581-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:from_mime,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1A3370786D

On Wed, Jul 01, 2026 at 12:57:36PM -0400, Frank Li wrote:
> On Wed, Jul 01, 2026 at 03:26:30PM +0300, Sakari Ailus wrote:
> > Add v4l2_subdev_call_ci_state_active(), and
> > v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> > take struct v4l2_subdev_client_info pointer as an argument. These ops
> > cannot be called using v4l2_subdev_call_state_active() or
> > v4l2_subdev_call_state_try() as the client_info argument precedes the
> > state argument.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-subdev.h | 95 +++++++++++++++++++++++++++++--------
> >  1 file changed, 74 insertions(+), 21 deletions(-)
> >
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index e08615179e7b..056eaa949786 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1964,6 +1964,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
> >  		__result;						\
> >  	})
> >
> > +#define v4l2_subdev_call_drop_fourth(first, second, third, fourth, rest...) \
> 
> Suppose this macro is internal used. is it better and __ prefix
> 	__v4l2_subdev_call_drop_fourth

I'll do that for v7.

-- 
Sakari Ailus

