Return-Path: <linux-media+bounces-25557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A4A255D0
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EC9E1887F2E
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B731FF5EB;
	Mon,  3 Feb 2025 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHbNpsvP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876BE1FF1D1;
	Mon,  3 Feb 2025 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574898; cv=none; b=J/og2vVkrk9GtF8Da8lnHA1K8whrTNODiQFT31Ctz04mfuomdg/ZX8xE8876xJoYVlPVU5PcLWaWu/QE9We5rVywNWn5j9H0MfWB0M8GupLmhZYNUmVYFMpkdHJeQ6w4AJyg+ml0d4v43phpFmoNhspSQ8VazxqKnK6M0pdZHTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574898; c=relaxed/simple;
	bh=pxBsDryYysUk5RGdj93AKHty2qshqoUSgijWPp94MU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3antNV3nwdcL0MxbVO2gwJpLEIX6tfgtVrcYEXuOxyB4+vApsE6WVFX5jj/r8ts2txmA1qF8Qi7psdIl01TzF2kbz6xR8TlCK5ZXpH0zbBZ0yH1yElJj9CiAQxoboGouBzwMFlcO3Xd3uTL4mamlLNhCZWckaxraVpxc7RzIzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHbNpsvP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738574896; x=1770110896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pxBsDryYysUk5RGdj93AKHty2qshqoUSgijWPp94MU0=;
  b=LHbNpsvPSDJwhjc9wWKt5IwVLbxYJh1kpdBMdnGtctZ0BbHjp1dG/fxL
   NdCPcIEhUmkQ+ayCJN179esOCEq1k2xcmweigehE+ONIwhCPPQQH/fjEL
   rdWRW5YqmDY6zhPrKTEI8rxq+G+ukwSt+DzTpefwEhJP26x70J05BQHEm
   QvcHzXVDBDP4nJBESDrXFlJYMORIaOggMu+lcx5/7pS9K2SR5XbynhUBh
   opeprSZeBX5y63YGhJmwM/CXu3rjLnoJh8FqfLqgvp74SmNgCy7HoW2h7
   fmTqgFc3gGdCVN8rBNqcHz1B86xMNRX4CZzorQU3M01aHU5MxXqesUmJs
   Q==;
X-CSE-ConnectionGUID: KtweuBZhQaq3WazMKrqi8g==
X-CSE-MsgGUID: SKUL0j/QSE+kR1Cv/yDG1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49316218"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="49316218"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:28:15 -0800
X-CSE-ConnectionGUID: Wfct2Ct0TG61mVE05KyWaQ==
X-CSE-MsgGUID: I8Dv+shSQ9K1v2+U2+Fkbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110136472"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:28:13 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C5EA611F9C3;
	Mon,  3 Feb 2025 11:28:10 +0200 (EET)
Date: Mon, 3 Feb 2025 09:28:10 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 18/19] media: i2c: ds90ub960: Configure serializer using
 back-channel
Message-ID: <Z6CMKqFkx59ZCy8i@kekkonen.localdomain>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-18-e0b9a1f644da@ideasonboard.com>
 <Z4fGQY_9xIPQXSUD@kekkonen.localdomain>
 <15fbe245-e031-4bf5-9d17-2ee807081e18@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15fbe245-e031-4bf5-9d17-2ee807081e18@ideasonboard.com>

On Fri, Jan 24, 2025 at 03:29:43PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 15/01/2025 16:29, Sakari Ailus wrote:
> > Moi,
> > 
> > On Fri, Jan 10, 2025 at 11:14:18AM +0200, Tomi Valkeinen wrote:
> > > @@ -2956,6 +3033,36 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
> > >   	if (ret)
> > >   		return ret;
> > > +	for_each_active_rxport(priv) {
> > > +		if (it.rxport->ser.addr >= 0) {
> > > +			/*
> > > +			 * Set serializer's I2C address if set in the dts file,
> > > +			 * and freeze it to prevent updates from the FC.
> > > +			 */
> > > +			ub960_rxport_write(priv, it.nport, UB960_RR_SER_ID,
> > > +					   it.rxport->ser.addr << 1 |
> > > +					   UB960_RR_SER_ID_FREEZE_DEVICE_ID,
> > > +					   &ret);
> > > +		}
> > > +
> > > +		/* Set serializer I2C alias with auto-ack */
> > > +		ub960_rxport_write(priv, it.nport, UB960_RR_SER_ALIAS_ID,
> > > +				   it.rxport->ser.alias << 1 |
> > > +				   UB960_RR_SER_ALIAS_ID_AUTO_ACK, &ret);
> > > +
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	for_each_active_rxport(priv) {
> > > +		if (fwnode_device_is_compatible(it.rxport->ser.fwnode,
> > > +						"ti,ds90ub971-q1")) {
> > 
> > I guess one instance is fine but consider using match data instead.
> 
> This is checking the model of the (remote) serializer, not the deserializer
> (which this driver deals with).
> 
> Unfortunately we need to do some early configuration before the serializer
> driver probes, and that configuration depends on the serializer model.
> 
> We could, perhaps, get the serializer models once and store it in the rxport
> data for later use.

Ack.

-- 
Sakari Ailus

