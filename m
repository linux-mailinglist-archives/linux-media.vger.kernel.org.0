Return-Path: <linux-media+bounces-50687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E01D1E586
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 12:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 051703016193
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913C637F8B0;
	Wed, 14 Jan 2026 11:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELdWO6Wf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7AF2BE629
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768389414; cv=none; b=SE0iEYNQc5jK+La6wx72GE2yMM9ZGX8UIieqgbUThnRQ5A7830d8WSlLdc7jf8w0T4msbN7XmbBapYrxcApQqoQo3gFBFqYHeOgU3+VzNDhEknBdHXwHTXiyUagU2ltwvHDmnp0V9UjEkFD2jElV/aLVp03sSUcDt63goUOHgwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768389414; c=relaxed/simple;
	bh=MDbwSdXfIbMpxipRHYf8KY27CY9M1XGTlYaxlvThKcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjxI4Z65421utmB78AQLOktHGBhNdI7ZHXgDHPC/4qNLcxjk06zghBunpkCA4q2KFRLDYf3QFcwlg4SUQG2Ql5SMZqqWtWsMahRFqW7yw0nMeeA2YP1vBBfJaqDU809dHcEyZqY7hHF9terAP+hiu0ZUTCtOAsioYDXv/IxUVuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELdWO6Wf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768389412; x=1799925412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MDbwSdXfIbMpxipRHYf8KY27CY9M1XGTlYaxlvThKcQ=;
  b=ELdWO6WfI4j/ZCiAu3qQSQrm9iLEWuCbnLVyr+Omquc+DTFF+r8pqnWK
   VdlH3f6AnZceUatVzNN1Y0dIKElucNjnspJ93ozcUS/gwX3U+XkiseLQL
   /h0Z74cuabJYbdaYhZg1mSCGU5RSnMsU5tY5t1l6crteDDTm/orpRsm4Q
   lIb1s1Pv00uiqJsxYLgl4bmRbqP+zYGuP69C6Y7JNGQ5+OqC/4zsNO89W
   nf8Sw62wvnkQIlv4E2CKVuteEqBIwlOJ7k07aSh/C9/Q+a2KuVSa7Upu2
   /+ClH0pvh6PHi7+5Vi9VXC2WieZKQHBRPs3Y8XB3Igs9XS5YXpzmFT6OD
   Q==;
X-CSE-ConnectionGUID: 8YKHrxEbS2mOIpKxYg+UIQ==
X-CSE-MsgGUID: 1/0oUv3KQI24xbxTQCjFSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73540479"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73540479"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 03:16:52 -0800
X-CSE-ConnectionGUID: rrCJV6hdTeqINxN33ETDiQ==
X-CSE-MsgGUID: qNtQUSufQIeoWYs7XpgWdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209702494"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.116])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 03:16:45 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8A64111F9B2;
	Wed, 14 Jan 2026 13:16:42 +0200 (EET)
Date: Wed, 14 Jan 2026 13:16:42 +0200
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
Subject: Re: [PATCH v11 34/66] media: ccs: Compute scaling configuration from
 sub-device state
Message-ID: <aWd7GqAYWijEOhda@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-35-sakari.ailus@linux.intel.com>
 <20250903210212.GZ3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903210212.GZ3648@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Sep 03, 2025 at 11:02:12PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> You seem to have missed taking my review comments from v9 into account
> here. As that was the case for other ccs patches earlier in this series
> I'll assume the rest of the ccs patches are also affected and will skip
> reviewing them. Please look at v9 and address the comments in v12.

The which parameter is removed by the next patch in the series. That was
the case already for v9. I think it's better keep that way as this patch
isn't entirely trivial either.

-- 
Regards,

Sakari Ailus

