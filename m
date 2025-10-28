Return-Path: <linux-media+bounces-45851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4966CC15FF0
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3404A4E3C88
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 16:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2EF347BB6;
	Tue, 28 Oct 2025 16:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OB96Vgw2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6089347BD7
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670636; cv=none; b=XN3qkcEoECKmTtGTQ+RzhKEwb32tr7Z5daeG9mwi0CyzY/97r74TYV62cQYXPEkPgi6WM4GMhPlTjwLDB/WdMA1qBC6wVWME9q25Ib0kvWFUyNx0TJZmGX6xi+FUMzsk+uYqzdFEz0Vpwclrkjc6/YP5iNST/YMi7+2B0SE8sdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670636; c=relaxed/simple;
	bh=9mQKSwc9Em8ydfh3pMsdNNldasMYlXUUtXikIfqKNgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=posKlUwsMAgtIK4ELbglSR7p4azSc15LqIKIyXiWfuFmInEF8jckwSIjM3d3IX8GBRNWE/HYvkt9/AUSwCoPcWSnC4SBg9wO6cs55o7DSi25wZPv2uSV6gwrHCeBGAcHUJWUVzoxC44hcPMKxCcrHAPBE/1hXSshjHIgCVyKK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OB96Vgw2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761670634; x=1793206634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9mQKSwc9Em8ydfh3pMsdNNldasMYlXUUtXikIfqKNgc=;
  b=OB96Vgw2yL3uaY5RWxZFFGuQD0Tazf/iijxrvD0pc5PEmDQh9JuExikV
   rFnenVIeBtxl0FjcRcNumSyShBYz9InRVYOrHBiHhQ58DELhdrb6ttXYT
   Izc9YXoTq9pMRUZfU4Mbmslk9brGM9EargDtrqIueFZOmXYQqFyorgylb
   nw0TSeYDHvUWh+uU79ZVdzdoZhPajb6wOqZF5HSaMHENNpcUuwa7uI5IF
   /JYkSxVeUaBF3zt5ueEtHjOFkjryOm3eLh471x6t612YTAFk8AO2OuRD/
   B7BU2IRxOv3s0vSjhtkxaUEXuMwJ64IdApM08UHi4ALFt3muqUOXIBO2B
   A==;
X-CSE-ConnectionGUID: l82LvDm8TAeUAEUnKeGeCw==
X-CSE-MsgGUID: o91ujER5QtifqA+Ffy2aRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62983061"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="62983061"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:57:14 -0700
X-CSE-ConnectionGUID: dwlOvFY2TuikG1iMsadubg==
X-CSE-MsgGUID: J9lNhhMeSFG5oK1ZWEmirA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185100819"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:57:12 -0700
Date: Tue, 28 Oct 2025 17:57:05 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 07/25] media: i2c: ov01a10: Change default vblank value
 to a vblank resulting in 30 fps
Message-ID: <tjtgvrfs5nvdtbhjiuyacog2oebvw7n6qv5z73yj6zbjceqmbv@umr2iohmbbdj>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-8-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-8-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:15PM +0200, Hans de Goede wrote:
> The ov01a10 is quite a small sensor, which does not capture a lot of
> light, increase the default vblank so that the sensor runs at 30 fps
> by default, doubling the default exposure.
> 

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Hans de Goede <hansg@kernel.org>

