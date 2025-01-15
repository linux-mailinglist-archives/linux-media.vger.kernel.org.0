Return-Path: <linux-media+bounces-24790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF8AA12602
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 15:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B349B1889A4C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 14:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677CA78F5A;
	Wed, 15 Jan 2025 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVGP9UdA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6920A762EF;
	Wed, 15 Jan 2025 14:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736951369; cv=none; b=Cb0lkmNAAeVjUrhA5Rf9WappftlFLU82Oeu0Esb63mBBu6trr/7hKs89sIyV9UW6pugzZGUlbtX4KaGTBPjViIU9go68rtn7SS9bBL1MltgHwPCZypsxpFZw36pWZ6daZHo8n78qq4EgOsiEr4yh10vvHN0Kqzv6wrpWeY3HE6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736951369; c=relaxed/simple;
	bh=bnuWO/C3+k6oi/82ch0rmc3SO9j5T7hqEql20zr6nkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvz5v2azQxYcozwh/MlL7srwVTrKmHoUFFPUwSgLwfwjtSoAC2LGGdu2n4PJkNtSo0vMcZuonHNsvNOlCpjOO8ao1Jr7lKqA3z1y1LT0NxHAC6M5tLrMnCeojRxMjvYLUo8DLqxbchAJsaZNLiBPYeAqlXBBSiYCEzfTgWc3Uwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVGP9UdA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736951368; x=1768487368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bnuWO/C3+k6oi/82ch0rmc3SO9j5T7hqEql20zr6nkU=;
  b=AVGP9UdAklPgMTkeQPvPErddeoikHiodUxGxJY816YtqysgHId8oKL91
   mZ/tJUCrhYt0RJt50/9uWgJAolK5aGRrdcsWD8g2xXo4btV6Z6Ds4xz8t
   5dlzcWjA7X3TNswVJ2xWG5j4dOzjW4kMa/QXcKsar2vJCYSPTk+qA6Cnu
   T0ZLJaSk8BbQJ2nE642EZrM/5MKkIx5OvXN4SrH+qsGt/ziPnaQfzMVK5
   lfzxT2m+Hqqt9leXTHAXuQgTWj2GIt8NKYSv49gD0K2Q616/zEewMM/VX
   6zfUR0R4DyAfU2tIrgdCnVU462dHax7L520hB2SIaQYU/EXPtBQG8UKbi
   g==;
X-CSE-ConnectionGUID: ygO4Pld4TIKEIAe45BPUwg==
X-CSE-MsgGUID: OIqVKeykRyuPumMwM7dOmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36982920"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="36982920"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:29:25 -0800
X-CSE-ConnectionGUID: 34GC2+6MReusspnaMKvNzQ==
X-CSE-MsgGUID: 04YyJ9MHQSyoqKYk6TyY5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="105746081"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:29:24 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6791011F88A;
	Wed, 15 Jan 2025 16:29:21 +0200 (EET)
Date: Wed, 15 Jan 2025 14:29:21 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 18/19] media: i2c: ds90ub960: Configure serializer using
 back-channel
Message-ID: <Z4fGQY_9xIPQXSUD@kekkonen.localdomain>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-18-e0b9a1f644da@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-ub9xx-improvements-v1-18-e0b9a1f644da@ideasonboard.com>

Moi,

On Fri, Jan 10, 2025 at 11:14:18AM +0200, Tomi Valkeinen wrote:
> @@ -2956,6 +3033,36 @@ static int ub960_init_rx_ports_ub9702(struct ub960_data *priv)
>  	if (ret)
>  		return ret;
>  
> +	for_each_active_rxport(priv) {
> +		if (it.rxport->ser.addr >= 0) {
> +			/*
> +			 * Set serializer's I2C address if set in the dts file,
> +			 * and freeze it to prevent updates from the FC.
> +			 */
> +			ub960_rxport_write(priv, it.nport, UB960_RR_SER_ID,
> +					   it.rxport->ser.addr << 1 |
> +					   UB960_RR_SER_ID_FREEZE_DEVICE_ID,
> +					   &ret);
> +		}
> +
> +		/* Set serializer I2C alias with auto-ack */
> +		ub960_rxport_write(priv, it.nport, UB960_RR_SER_ALIAS_ID,
> +				   it.rxport->ser.alias << 1 |
> +				   UB960_RR_SER_ALIAS_ID_AUTO_ACK, &ret);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for_each_active_rxport(priv) {
> +		if (fwnode_device_is_compatible(it.rxport->ser.fwnode,
> +						"ti,ds90ub971-q1")) {

I guess one instance is fine but consider using match data instead.

> +			ret = ub960_rxport_bc_ser_config(it.rxport);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
>  	if (ub960_enable_sscg) {
>  		ret = ub960_enable_sscg_ub9702(priv);
>  		if (ret)

-- 
Terveisin,

Sakari Ailus

