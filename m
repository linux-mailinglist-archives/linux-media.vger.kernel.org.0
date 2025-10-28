Return-Path: <linux-media+bounces-45876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BF6C169AD
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 20:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D3633A8DED
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C5834E772;
	Tue, 28 Oct 2025 19:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ml626RzL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5944820F08C
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761679558; cv=none; b=qSTRkxRVUJqti69Ecw00lbbzC7sliWHUNyg1q7JDu1k9ehWnaofotAyZ7WagdBsxao65y5w8nRweg5uMiFYBgHzLo5P0fhsa62HEOknsFU8UCcISLwZaw3tDB9gcj+wVTRtER1L7y+RVeJhd64/ZJ32LOZxXp7wT7B1jre5yHdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761679558; c=relaxed/simple;
	bh=JnJCSC/JB5jNWlWVvM48Y/revXxgVuNcAPiV5jbbqO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsn/QmqT+uTTfSCYsBvsr8kvNF313suFElX2STLlZ6R9BGrdzSd9PSHMtO8rsV2PDDTKa25D17oUJ34HMIxF8lNdJmo4SyQdRPbfFaZaK8uQjdKy6He6mJfM3uh7wVzSPPFY2BLSi+kYh4K15axC5+8N4x1WTd3Sji/IOsI9m2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ml626RzL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761679556; x=1793215556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JnJCSC/JB5jNWlWVvM48Y/revXxgVuNcAPiV5jbbqO0=;
  b=Ml626RzL4Iek6apUBdR8huUmAWb8Ro4CtsukSK4a9VWuhNWWcLyJOFvt
   pf9bSgOE/WpV4n/j0zSbGbdiZYYLlTCxlBSO48QyEBw3L4SaKJR0ovyeH
   sZ7yGRoKzerZmfkirvzw4EYq9mZRcp1n95Np+Ypd6WBckotCeGyknRbNb
   mdeIcC6b+y/hnIFjhAGEN4XcDshryztRQGW80nzIKR0XG5YKTr5Isa0Zv
   wH1LJWPlFOrS9Y13AlejPlvCb74FE7jE8laYKbBnlZpBa7wD77hMleiTX
   kIk5xaclYUSV46xHq1HP6V80AnBjnG0Ve+GEGOvJDgPf09WrPcpW4Ouaa
   A==;
X-CSE-ConnectionGUID: kJjpmBXaRt+Qg31gKpWBDQ==
X-CSE-MsgGUID: IXutXuM8TTaua2cu4dGAgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89261846"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="89261846"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 12:25:55 -0700
X-CSE-ConnectionGUID: 3pea7jaTREGKxxKLB78GkA==
X-CSE-MsgGUID: pK18I2HPReS9haPuBL1TFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185077718"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 12:25:54 -0700
Date: Tue, 28 Oct 2025 20:25:47 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 19/25] media: i2c: ov01a10: Only set register 0x0305 once
Message-ID: <cdr3xo27kf4xbu7gn6n5pdx355ut6o3g4alk5vbifgh5bxo75d@iggcau5ejegy>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-20-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-20-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:27PM +0200, Hans de Goede wrote:
> Stop setting register 0x0305 to one value from mipi_data_rate_720mbps
> only to override it with a different value from sensor_1280x800_setting.
> 
> Instead directly set it to 0xf4.
>

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com> 

> Signed-off-by: Hans de Goede <hansg@kernel.org>

