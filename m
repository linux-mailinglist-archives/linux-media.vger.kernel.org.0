Return-Path: <linux-media+bounces-18350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6EE97B48E
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 22:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 980FE284BAB
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 20:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5A7188A13;
	Tue, 17 Sep 2024 20:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zg1AgZyz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751213B1A1
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 20:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726604654; cv=none; b=KsUF1VWYisJyAxK7ydNZg3muAvq3JeAXbZq+xRQcSVH6uqgVqXIvkT5vD3KPh/13tJRu1jCXI9542kkFFrdOKjyV2vwB9I5bXlTMjZX4E5lx77TWqdpqoU0/WjBzGTQhOLPq21QbBJ45kp42URQO9Nuh28VU/xY9JTy9BF4NEio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726604654; c=relaxed/simple;
	bh=ELMhtrpyr5Q3EYlZktKwi9lTjvDhA54yvZ+pXO//L5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8N0CY01ZJPQ9e6dhR580HYFa3XRdAPrsNw/96W///ft0qcTKUk0X1h3D/jD4PDPMkIfGRSvbuBuxrWL/y+DlSSL38KX5z4PcUMsdukxRHrDa1AfdQm5Ejlsfr5HLhBA3deav32yQ6S7y6/yf9RTTgev5z5Ab9kbRoP44ukKjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zg1AgZyz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726604652; x=1758140652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ELMhtrpyr5Q3EYlZktKwi9lTjvDhA54yvZ+pXO//L5A=;
  b=Zg1AgZyzTXLO3nWnPPmFbytTktv5yXmoXG0R95geQzsxTAurlNHstELs
   HaxNerGWNm2qX+sSbfGNbrW4LSduENiMecKRLsZGmCyDCOsgJj8TNG+aQ
   d1uKE1ALPOEUumWDub8kp+3CeNENR6jBEZr4a6qr2Xs/yy0KzVCDq6UWv
   9VnxWCsqu0xrIgE7aMdWUfxScnBVOVTo9Q9x/8N7bJfN2HywOe+ldH/eD
   Fyaf1Z0KpZhaIgZvH8gRMHvIg6l8PNNGxEicu7WQpLW9QPPBq0a1u11W3
   UmlZEtQEVrU9MAwQE2kX4wnOWuiDKMLJRcpFzxnw2h6nDogAZ4n0DJjlU
   Q==;
X-CSE-ConnectionGUID: khggZvg3RRSG37SzAGCFrw==
X-CSE-MsgGUID: 9D9cwQP3TgCy5L3Jqz8xqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="29274204"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="29274204"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 13:24:12 -0700
X-CSE-ConnectionGUID: OlEBJOaOSaa2pvSxfOfnjQ==
X-CSE-MsgGUID: 4+/2XjtxTLqsgzFLlmiLjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="100144784"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 13:24:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B8A8311F855;
	Tue, 17 Sep 2024 16:17:54 +0300 (EEST)
Date: Tue, 17 Sep 2024 13:17:54 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH 2/2] media: Documentation: Update
 {enable,disable}_streams documentation
Message-ID: <ZumBghexAr_n5_hs@kekkonen.localdomain>
References: <20240917124345.16681-1-sakari.ailus@linux.intel.com>
 <20240917124345.16681-2-sakari.ailus@linux.intel.com>
 <20240917130047.GC17350@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917130047.GC17350@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Sep 17, 2024 at 04:00:47PM +0300, Laurent Pinchart wrote:
> On Tue, Sep 17, 2024 at 03:43:45PM +0300, Sakari Ailus wrote:
> > Document the expected {enable,disable}_streams callback behaviour for
> > drivers that are stream-unaware i.e. don't specify the
> > V4L2_SUBDEV_CAP_STREAMS sub-device capability flat. In this specific case,
> > the mask argument can be ignored.
> 
> Wouldn't it be better to use BIT(0) in that case to simplifiy
> interoperability with stream-aware devices ?

That's indeed the current implementation.

-- 
Regards,

Sakari Ailus

