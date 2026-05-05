Return-Path: <linux-media+bounces-60337-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L/fIn6S+Wm/9wIAu9opvQ
	(envelope-from <linux-media+bounces-60337-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 08:47:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 101924C74E7
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 08:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80A5A301FAA0
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 06:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECEB3C0605;
	Tue,  5 May 2026 06:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9Rz1AkW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42422E06E4
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777963642; cv=none; b=UVhVjhtFecl+kBLEyfIqMnIMUAlxqnfeHZOZqqltaMXFR6MPhRdE//QM3dOhTZt1sGmU3NsS7VisTiyMAy8WB1iZuuvkXI+QEIj/UuXGtfHMJE3T7pdaV9EO5nZvIQgxfhrxtFxINjcyIX2ywZBvDF3Dysnyz+6osJwSVRMCwtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777963642; c=relaxed/simple;
	bh=CZluX2EIYFB8hbLRQlwSNAYJ4/j8kMTZONjBj4PV74Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESqy1TnU3tUa0h5Ybea1A2uMeDeQ0D3fWhAjPb36UEb3vNJ2CmNCmjhnNBSx+HiFDOTW1ORpnWmULLm5UyPCpvkxH5m+golq/F7FwHWf/bn6AVaE/XTu1kwioImBxCi1+BIxSzPrVUDaPSpKk+Q8I9pbucF4lNwxdD2+Lr95xHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9Rz1AkW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777963641; x=1809499641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CZluX2EIYFB8hbLRQlwSNAYJ4/j8kMTZONjBj4PV74Y=;
  b=k9Rz1AkWGyFTFeRCS6OkriA2k1jGIhKWypL1EXkToQ96oJgz+tYyX3h/
   6wuThgDU7VVn5s2o+oduAwsmhm4IEN/R6F0X1bFYmYw6oZV0I46LEhemK
   /nosDjUdfbidyOkdwbN9zjeVVw+vxgSyQjJpv2yWpER/gypC4L+L0GXE6
   0f4Nx9S13JfJ/7n9ZXvsZpIWaoQXE4uZ/p+k/Di+WVTh2331EWjvoPxj5
   2Aow8N5hrWcQLl4ToaUzn66jLbp/9vm77MTY1z56+0LBPAoqw89PgWOIA
   UGIbd7px6Vv5b2EgwhumwePwmJjbHaBNfxn35xTDr5WSbfck/i869Gkfd
   A==;
X-CSE-ConnectionGUID: upGoNCpiRh+OjEcV3V+CkA==
X-CSE-MsgGUID: XDyxnFW0Qo2EB/z6RsCKFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="104276178"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="104276178"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 23:47:20 -0700
X-CSE-ConnectionGUID: lRa4Ip+MQ5+G+QDbwcA61g==
X-CSE-MsgGUID: r/2RrsmTTzSBgolyN6g94w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="259398043"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.23])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 23:47:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7E198121CB0;
	Tue, 05 May 2026 09:47:14 +0300 (EEST)
Date: Tue, 5 May 2026 09:47:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
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
Subject: Re: [PATCH v4 20/29] media: uapi: Bump the STREAMS bit a little
Message-ID: <afmScndzmOPELxj4@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-21-sakari.ailus@linux.intel.com>
 <a5520b2c-b290-481d-a02c-36a2272bb41f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5520b2c-b290-481d-a02c-36a2272bb41f@kernel.org>
X-Rspamd-Queue-Id: 101924C74E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-60337-lists,linux-media=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,kekkonen.localdomain:mid]

Hi Hans,

Thanks for the review.

On Tue, May 05, 2026 at 08:33:43AM +0200, Hans Verkuil wrote:
> On 08/04/2026 17:39, Sakari Ailus wrote:
> > Bump the V4L2_SUBDEV_CAP_STREAMS by one bit up, order to avoid confusing
> > libcamera with streams that has moved forward from the original libcamera
> > implementation. The bit can presumably be taken into use but only after
> > the other free bits.
> 
> The commit log must explain why this is safe to do. In this case because
> v4l2_subdev_enable_streams_api is currently always false, which means
> that this capability is always removed.
> 
> It's also not clear to me why this is important for libcamera. Since
> the streams API is still disabled, any libcamera code depending on it
> should be purely for testing, right?

Libcamera uses streams if supported by the kernel, but the streams support
in this set doesn't match with what libcamera expects. In other words,
without this patch libcamera breaks if you enable streams support on all
drivers that support streams.

I'll elaborate this in the commit message in v5.

> 
> Regardless, this uAPI change needs to be documented a lot better.
> 
> Regards,
> 
> 	Hans
> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/uapi/linux/v4l2-subdev.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > index 2347e266cf75..6160c3e21436 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -196,8 +196,11 @@ struct v4l2_subdev_capability {
> >  /* The v4l2 sub-device video device node is registered in read-only mode. */
> >  #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
> >  
> > +/* Reserved, old STREAMS bit libcamera used before API stabilisation. */
> > +/* #define V4L2_SUBDEV_CAP_STREAMS_PRELIMINARY	0x00000002 */
> > +
> >  /* The v4l2 sub-device supports routing and multiplexed streams. */
> > -#define V4L2_SUBDEV_CAP_STREAMS			0x00000002
> > +#define V4L2_SUBDEV_CAP_STREAMS			0x00000004
> >  
> >  /*
> >   * Is the route active? An active route will start when streaming is enabled
> 

-- 
Regards,

Sakari Ailus

