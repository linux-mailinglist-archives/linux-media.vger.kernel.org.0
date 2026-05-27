Return-Path: <linux-media+bounces-62889-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF8MISLZFmpGtQcAu9opvQ
	(envelope-from <linux-media+bounces-62889-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:44:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1AA5E38C6
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE54D3053BA6
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E543FF1AC;
	Wed, 27 May 2026 11:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQ8EdfyZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7F53FD14D;
	Wed, 27 May 2026 11:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882160; cv=none; b=Rk98oy/r9FanJPRr2Ff0D5xPrVtD3wxdE8YtAMiXLUZQJ0odIUQ+UXhWcrn66cUBRPhZEkzyt49k/ljySYiz0FKmHnOG6Zyh4qnN5cqYnK+gvDsHztrkMgqHzB7AoeZvwrX/8o3ogR/P2yQ5YFQXpulx+jMg6Ol342UqTX4tKHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882160; c=relaxed/simple;
	bh=G7QYnqtHPeANOBPcW1EE7Gu1c0G8PkEqDIa9Sk/J14I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GreKoxr0Y5uuUjnTPa1JGSI6zd5CdsLb1LDqq1xmBz/rjmmcyqxmRioPJ4GodvKDCpuZeBqkI4hLolrDEcjuNmblil8ehu7f7TLYJQv0GlmpaERVGyX2QGo+zJeZq7OoPt6y+f3EqLMSCWtJDClT8VO3iF+sqylIkI3qojsa5v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQ8EdfyZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779882157; x=1811418157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G7QYnqtHPeANOBPcW1EE7Gu1c0G8PkEqDIa9Sk/J14I=;
  b=QQ8EdfyZMpt0bvb/38pD5mjHWnIy5VtIcXAWSR67+R9UOkMKELD9/wuI
   7zdXp8RPWKofULcZ5f9O1oCI4zMBGbHgoX9CoV6ricjDqkOvCrORzesR4
   1ifWTpr3FNJWbdrhlG6QdW9GwOFSUyFh1dszM9clvrqGGcn1kYsqK0Qc/
   eoXsgG8FCl0K6LFHEmR6FQ9rLpHqwfoeidkZArthCj8U03Zs9lEh9nP7q
   gWBUmnQcO4ov1cpBN4RKylDEBGehuAbno36Z4fVmSqbcyzcSd0JumQ9zg
   qrP1VQjSB95M0coRI7tj8+JtdK5BaFvyehXhlolLXGLOSIB29okvlYi1Q
   Q==;
X-CSE-ConnectionGUID: dZ++iiA+StO2eOCMuUptIA==
X-CSE-MsgGUID: L+5mHWATRtCI0QjzzrmrGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84334320"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="84334320"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:42:35 -0700
X-CSE-ConnectionGUID: zegLo+vNS/Sx4Piu78CE2g==
X-CSE-MsgGUID: y41KjkWoTmCnGziDra/iQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="265813501"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:42:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8D2C1120EBD;
	Wed, 27 May 2026 14:42:27 +0300 (EEST)
Date: Wed, 27 May 2026 14:42:27 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: tarang.raval@siliconsignals.io,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <ahbYo3CSzkYI3jF9@kekkonen.localdomain>
References: <20260522031121.11968-1-hpa@redhat.com>
 <20260522031121.11968-3-hpa@redhat.com>
 <ahDdMZjID07dRDhZ@kekkonen.localdomain>
 <CAEth8oGWfYpC2umZ49g5qEp_QoZXNKNJ6vMu2EtmnOy6BxZGBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEth8oGWfYpC2umZ49g5qEp_QoZXNKNJ6vMu2EtmnOy6BxZGBg@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-62889-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: AB1AA5E38C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kate,

On Wed, May 27, 2026 at 02:14:24PM +0800, Kate Hsuan wrote:
> > > +struct imx471 {
> > > +     struct v4l2_subdev sd;
> > > +     struct media_pad pad;
> > > +
> > > +     struct v4l2_ctrl_handler ctrl_handler;
> > > +     /* V4L2 Controls */
> > > +     struct v4l2_ctrl *link_freq;
> > > +     struct v4l2_ctrl *pixel_rate;
> > > +     struct v4l2_ctrl *vblank;
> > > +     struct v4l2_ctrl *hblank;
> > > +     struct v4l2_ctrl *vflip;
> > > +     struct v4l2_ctrl *hflip;
> > > +     struct v4l2_ctrl *exposure;
> >
> > Do you need all these? At least link_freq remains effectively unused.
> I'll tweak these ctrl based on
> https://libcamera.org/sensor_driver_requirements.html.

I rather meant that you're assigning all of these fields but then not using
them. You could thus remove the fields and the assignments. But I can't say
which ones, apart from link_freq.

-- 
Kind regards,

Sakari Ailus

