Return-Path: <linux-media+bounces-41585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24898B401DB
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 324E83B665D
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 13:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E42127EFE1;
	Tue,  2 Sep 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZS7mEIYw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34432D9EF8
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817945; cv=none; b=FXrrwEeBq1uoDdcOlHZlk/ZA9VqBWWPDqyhCf8ZqXE60FWfmDerbyypYZ3JQe7bUyTB8V8Eya4fSabfzqqIb5s3aBJaWKATq6071G9oeMsRmjibYqjveAYVYMgO/VGyKia39idWZgjBNzZzu59CSRNyrfM1AUPAE6j2T0vkVXJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817945; c=relaxed/simple;
	bh=WoBFC6gjfBo7B0qsGmWgaSEKY+wV+EzZ6xbDVPQsSh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQ8wlpuCBwjZhVdgHswzh7+98RIbxEvu+TI/u/r+BQLipaHu69qPvwsV2kwjWRjENRi/Pa0zsSE5Avt/q5iNzXXfc0X7M10WoZM2HULTIiTFIAhwReiIrMhLzs/6+hQyP08zHFTXtDQP1dTTyu4wmTa8CVTi4/EoM3aHCthUIDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZS7mEIYw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756817944; x=1788353944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WoBFC6gjfBo7B0qsGmWgaSEKY+wV+EzZ6xbDVPQsSh4=;
  b=ZS7mEIYwMOutXYhJsacbgwYuAxyXJpPYzmTSM59iQZVRw7NN4zSsk28F
   arw5tmGzIobQsCRnV4G9CWpMD8vwJsvINy7gtjBY3J5FFKvdhzry73NIZ
   JPgZaYsJmWtFgy0iEPsX1EGOvpHVMawfXZGMU67YGu+eiaziQ3ufO3NpQ
   JsP8lgvDbISvpcCavgUJlaCe3vYVPN8/X6O1AYOaobpuEE9jbIykgimic
   /MzrHethl0JL3PN8MeDkJYl1uJVls0+T+JLbOkn55r0i2NxXx9THVi++3
   TH6w1xlZxakLN4J/CLZAfuW8zw/IgUXp5a5xaXeNlV6ARFEyZUYuR8xWH
   w==;
X-CSE-ConnectionGUID: qIiWREqjRmy9FczhiSvZiw==
X-CSE-MsgGUID: Gl4kmA0gRq2WLMQSYbJHKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59026399"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59026399"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:58:50 -0700
X-CSE-ConnectionGUID: T7edUfZTTROSgCQp8IlV5w==
X-CSE-MsgGUID: 5uACnNtdQZO03dDXP5li6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171431760"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 05:58:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EC0DD11F739;
	Tue, 02 Sep 2025 15:58:38 +0300 (EEST)
Date: Tue, 2 Sep 2025 15:58:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
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
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 14/66] media: Documentation: Refer to internal pads
 in metadata documentation
Message-ID: <aLbp_nBzA6EwJbsR@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-15-sakari.ailus@linux.intel.com>
 <tjvbo4qgvlb2iqqeys4pucz3w535fmqqnl2zz5cvmwigrz2prw@wgmeur7h4t5e>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tjvbo4qgvlb2iqqeys4pucz3w535fmqqnl2zz5cvmwigrz2prw@wgmeur7h4t5e>

Hi Jacopo,

On Mon, Sep 01, 2025 at 02:08:01PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:15PM +0300, Sakari Ailus wrote:
> > Metadata is intended to be used with internal pads when it comes to the
> > source of the data. Document this.
> 
> The commit title and description do not match the patch content
> anymore
> 
> With these updated:
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks for the review. I used this:

media: Documentation: Refer to metadata layout in metadata documentation

Using generic metadata mbus codes requires the use of
V4L2_CID_METADATA_LAYOUT control to define the metadata layout. Document
this in generic metadata format documentation.

-- 
Sakari Ailus

