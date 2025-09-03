Return-Path: <linux-media+bounces-41699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAB0B4233C
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4362D1BA3155
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC29730E829;
	Wed,  3 Sep 2025 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzTMhIem"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD392F8BC8
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908754; cv=none; b=Arh2opU2qGTX9O4FnDcOexcc6YaQU6tdY6WiApZt5H3KA7z42IMsPVjHh9CxVoIsJF4PM9kfzvHq5qFc1SsL/OOCDckRA4rzNTfFT9tbL8zGHm/uDM2CfcJYaRLo/G1t8q55tH+LQhOqx3m9uW2lqIy02p7X9TVYi+H6UBppfd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908754; c=relaxed/simple;
	bh=gIsWXx+GalG27/kNDEKyS63IHCVbsBzVxLGGYy5iS28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llV+tOy8yqNQ1/kV41/utIHPHJuuVDqlelC5YYeMt4Kb1x/I1CNMwjiVf64g6AEWF3BoTa5B+hy9o663okmm4xkP59sQW0Vnx347vUzBnlB/H7h3odPk1uDv2+y/uyWpRzkGesvnylEzD9BgeixbPyzZ1YACpjtKSyMCmw6RZ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzTMhIem; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756908753; x=1788444753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gIsWXx+GalG27/kNDEKyS63IHCVbsBzVxLGGYy5iS28=;
  b=ZzTMhIem9LBIXe4Aq1akVVnvpjXRSMTLOQn+m9OZF1Z7bs8iSj5EChi7
   o/7g5stfTbnhULI5mhkQXIsxNNCRoxJDxbiPSUcE0aKS5cqPweu9z/I+i
   t69PgGA/+4Z16/lqav8QTPv8vt9sGG0WNyfxJz6zrQY28MjN/3BLySc+M
   t5KuXMpPo9nucpBh/CkgvHwJo0lJ2opSBJNZNjdPw+qUTeysK5qk35prB
   mMRruo2q1gKz3gXz54Blw8WVdjpQrTgBlZjOxrm7PIlK9xd7l0q8dAifQ
   pfjhxfRNp0d/MbyPWQw+oxufbe5FxnnOaLqPQDaLxfAYkd/0+A2Mjb7BL
   A==;
X-CSE-ConnectionGUID: ML0uoKpbTSiS8Q71gHJRkQ==
X-CSE-MsgGUID: Ze38Ws8FTCyp1kkJpA5NSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69836336"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="69836336"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 07:12:31 -0700
X-CSE-ConnectionGUID: iGNM+sCxTXq6i2xEkD5v2Q==
X-CSE-MsgGUID: i4sxrhbaS7yxSrafE6yPRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="171162220"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 07:12:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6734811F99F;
	Wed, 03 Sep 2025 17:12:22 +0300 (EEST)
Date: Wed, 3 Sep 2025 17:12:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 03/66] media: Documentation: There are either
 immutable or mutable routes
Message-ID: <aLhMxr9o3SP5iMe0@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-4-sakari.ailus@linux.intel.com>
 <20250903132226.GE3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903132226.GE3648@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Sep 03, 2025 at 03:22:26PM +0200, Laurent Pinchart wrote:
> On Mon, Aug 25, 2025 at 12:50:04PM +0300, Sakari Ailus wrote:
> > Document that each sub-device may have either immutable or mutable routes,
> > not both of them.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/userspace-api/media/v4l/dev-subdev.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index f30a98a9cf78..4da67ee0b290 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -594,6 +594,11 @@ and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
> >  called on the sub-device. Such newly created routes have the device's default
> >  configuration for format and selection rectangles.
> >  
> > +A sub-device may only have either immutable routes (routes that have
> > +``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``) flag set or routes that are all user-created
> 
> ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE`` flag set) or routes that are all user-created
> 
> > +or user-removable (routes that do not have ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``
> > +flag). This is subject to change in the future.
> 
> I'd add
> 
> Mixing immutable and non-immutable routes is not allowed.
> 
> between the two sentences.

This became:

Mixing static and non-static routes is not allowed in the same sub-device.

-- 
Sakari Ailus

