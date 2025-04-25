Return-Path: <linux-media+bounces-30975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 709DAA9BE34
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 07:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5AC91B68347
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 05:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEA322A800;
	Fri, 25 Apr 2025 05:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrlAwQ7N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895CFCA6B;
	Fri, 25 Apr 2025 05:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745560488; cv=none; b=uSPLLzdFK2nYx/XcocIS6nCNfzHDRwZPjg8TzSGROPtwbi7U7Gnk/8iRQH7HLgb0uxy67oBeyTz0rIArT3y29IQyoPRFfggfpIMm5YvzlxFbKYkkuGcGvsdmG3E6XeupvrJKgm7R0GT6x0fUxr903/eId96StZxOm5rdMKt18j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745560488; c=relaxed/simple;
	bh=zENiA+8d0IhJjfPxWwwfs9ZcAsneaxT6zAQN291Gz1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxoCLV60xIqqYs68bZ/3ume01/omVZw/oOun5Q94TYuHbbTuoA3AdDzO9OV/OsFtQIKOyhpR6b3eh18AM49aRHS3cNHJPoSCwrrcJJ+XUzAL48MvXETXuinVr5km931MohuD9UhboCnmQTDYy6mk9VpGm5suNXch746bTo98PPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrlAwQ7N; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745560486; x=1777096486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zENiA+8d0IhJjfPxWwwfs9ZcAsneaxT6zAQN291Gz1Q=;
  b=JrlAwQ7NhjA7cfaG8vN2M91Tl0AdzdnbvoXBjnnYMc2YYSpWnT4XxhEV
   7P5bOljpyVOt0quekymJpQeYZE7W9BPbi13V4KDNQAjX0LypkTQ/qrHxu
   iVbcNd6jP3p32X8jmdbrssZfaAZbB1EylhR4h+zPQ5sSZtC4GC7rwDBJC
   k3zxDvfEoRYzZ+fkXbMWZhrnUykQp5C2Hg2CfYYwQNvN9Ak1gox0qMpDA
   WVxRo2zRNnbqxyYpdYwHAA9rhnKmL7a5XcR/P7+KTpGkEcSLO0m6feZ5+
   Bp6QrenzOye/AmwKCCIVwOzVK2uUaX447Hrn1hG+r6rw6DUlnDCi2JLDF
   A==;
X-CSE-ConnectionGUID: ZvdfP55GRg2uC9wTSBCmBw==
X-CSE-MsgGUID: m8WVFhCNRB6dBORfS7BLcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57414116"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="57414116"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 22:54:46 -0700
X-CSE-ConnectionGUID: nNYDGWTXTR6rc05PW2jwvw==
X-CSE-MsgGUID: G6VaPPKST1GLakkZd0kQKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132809043"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 22:54:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8C48511FA28;
	Fri, 25 Apr 2025 08:54:40 +0300 (EEST)
Date: Fri, 25 Apr 2025 05:54:40 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"Shravan.Chippa@microchip.com" <Shravan.Chippa@microchip.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/9] media: i2c: imx334: Miscellaneous cleanups and
 improvements
Message-ID: <aAsjoNHVHzCxmA_6@kekkonen.localdomain>
References: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
 <PN3P287MB1829D27A21BFFEC97C8F5B678BB22@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3P287MB1829D27A21BFFEC97C8F5B678BB22@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang,

On Tue, Apr 15, 2025 at 09:23:41AM +0000, Tarang Raval wrote:
> Hi Sakari, Kieran
> 
> Do you have any further comments or feedback on this patch series? 

Thanks for the ping. They're now in my tree.

-- 
Regards,

Sakari Ailus

