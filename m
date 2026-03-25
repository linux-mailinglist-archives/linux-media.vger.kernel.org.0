Return-Path: <linux-media+bounces-57036-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DGLCP/aw2lwuQQAu9opvQ
	(envelope-from <linux-media+bounces-57036-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:54:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E0A3253F2
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE11230D50C6
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92493D47CD;
	Wed, 25 Mar 2026 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8F0v3G2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2CD18D636
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774442833; cv=none; b=actmxTzMHDYuOOX7CVlh47G12niBqYckHBg5YqAJOIxkR5LMAClZd90vXWlq/7Z3Pr1MAUm5dCZ4JiFlyhaidfKQ1N+n1Gx75h2d/dBVYEHxItt3pEtzWiR4EU2mbGHkdLi4fylN8/8E4kpcgdg0ZBjaqgOkS8cvmyI1d4pgKGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774442833; c=relaxed/simple;
	bh=fA3f8AQoROyXUUIYlEE3KhoZy01GYNFg+V7dib2Anp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siMPmnX0euKyuNTyCCi1BrKek8qnGS4uABRxExwB41s2B46wwFgYv8IbrgQvyrSJcZ2da4CKW6tYscvxNlqY7BOKzZJ2WsTzuRNNkBo3hxbG22b14JnIKnWKAHddkYHsj5i29jnIgXIKCSiOcGl6P99VZw7l06d+5wnuPWcYvpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8F0v3G2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774442832; x=1805978832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fA3f8AQoROyXUUIYlEE3KhoZy01GYNFg+V7dib2Anp4=;
  b=l8F0v3G2CIPNrD3oM6b9rVsC9cKazUs/NhF+xCX+dgbqltJ2xIeOtPLg
   DE64FWeBumSPhHsds/HhXkiIMwO3OdIvv+VNO+FdqDbaEaBnH2J01t3DF
   UbBNqTEVzRzar0dk4vCenj6uHIIM3JU5cDRXm7LTywbW1hi5UO2AWjOcY
   r8Ck7Eozs36/gtb+RrxEAKJmRUW6b8GfNNa+fPdIHR239aZf7TVrJJQqO
   k0OJLsO5alhUQJ4EZot6hGMOY+1qAfPJYwgQgbCj7SbYTyBNmoRaSxN+O
   WtoGY/ofnvb11pNAHEOe4Nm/CgaQZ5E4TMHsm6Tik4Mpmrx7iZg9bkcwA
   Q==;
X-CSE-ConnectionGUID: 25Oaw6vWR8+3TUD7Zrt/RA==
X-CSE-MsgGUID: 4Dd/K4PDSP+5c92QYYqESQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86848336"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86848336"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:47:11 -0700
X-CSE-ConnectionGUID: 1HgM/STOTRGeE2yGQwxnGg==
X-CSE-MsgGUID: B445U2lVRWmfHNj6AYJvNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="247699210"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:47:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C9723121CF9;
	Wed, 25 Mar 2026 14:47:08 +0200 (EET)
Date: Wed, 25 Mar 2026 14:47:08 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
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
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v3 06/22] media: imx219: Don't update exposure limits
 while setting format
Message-ID: <acPZTCd_tgKS2xRN@kekkonen.localdomain>
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
 <20260325105818.1176816-7-sakari.ailus@linux.intel.com>
 <CAPY8ntAmcychf6qCJzpSwPGW8nj116gMjwJk=gGvWMeV0=qEZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntAmcychf6qCJzpSwPGW8nj116gMjwJk=gGvWMeV0=qEZg@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-57036-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88E0A3253F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dave,

On Wed, Mar 25, 2026 at 12:37:54PM +0000, Dave Stevenson wrote:
> Hi Sakari
> 
> On Wed, 25 Mar 2026 at 10:58, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Don't update exposure limits explicitly while setting format. This is
> > already done through the s_ctrl() callback.
> 
> done through the s_ctrl() callback for V4L2_CID_VBLANK.
> 
> I believe this change leaves a potential for future failure if any
> modes get added because the ctrl handler framework swallows any s_ctrl
> that doesn't change the value.
> vblank is an offset on top of height. exposure is absolute in the
> number of lines.

That's a fair point. I'll postpone doing this patch for now or squash it
with something else. With the Common Raw Sensor Model, the driver
internally uses frame length in lines and line length in pixels so the
problem goes away by itself.

> 
> As an example, take the current mode of 1920x1080 with fll_def 1763,
> therefore a vblank of 1763-1080 = 683, and max exposure of 1080-4 =
> 1076. Add a new mode of 640x480 with fll_def of 1163, therefore vblank
> is 1163-480 = 683, and max exposure is 480-4 = 476. set_pad_format for
> either mode will set vblank to 683. As it's the same value,
> imx219_set_ctrl will not be called to update vblank, leaving the wrong
> max exposure value.
> 
> You could add V4L2_CTRL_FLAG_EXECUTE_ON_WRITE to V4L2_CID_VBLANK to
> always call s_ctrl, but that would have a larger downside if userspace
> repeatedly set it to the same value.

I agree.

> 
> It doesn't affect any of the current modes, but it's going to be a
> very ugly one for the unwary. imx219 is often pointed to as a
> reference for those writing new drivers, so this would likely
> propagate.

I hope no new modes will be added to this driver. The Common Raw Sensor
Model support makes it freely configurable. I hope to send an update on
that soon.

-- 
Regards,

Sakari Ailus

