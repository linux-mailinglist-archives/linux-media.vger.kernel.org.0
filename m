Return-Path: <linux-media+bounces-11905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8D58CF916
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 08:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95523281F49
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 06:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD1312E63;
	Mon, 27 May 2024 06:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rqzk1GdZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E912E3F7;
	Mon, 27 May 2024 06:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716791341; cv=none; b=qvk1Goc+mOCkeyAqpBuePGWfhg/uzlDQUDu427uh8VVqKy61q1VPZFn8US+IKtHUnchtv61+6BjnqZZs3MNynErve9cAz5vperMpEB3fprUhc5mUfQuP4noWAnyNPf5M3RcrWyIAhWzzT6+KGEfHA4WJ1Gzz4vH5d3JxkzU85CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716791341; c=relaxed/simple;
	bh=pinZAqIq0fek5EBdAQ53Yyws1XvkSCwWytUCnfhXbw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPBEMLoUQWiKAv7HY+lV+PmD33czFwEtvonxA1ZOKsCKhFOY3oBJoKumyp83ZVtUrLohhRLzoeYCVDxmAyBbqz4agp1oQFSlqtkGU4WpdwjsOqH24JwG89tDRnyGOYwI+ZBwtittaJkJZTiMMbyB1YRU0eakZHTH6Aqo//d5N10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rqzk1GdZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716791339; x=1748327339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pinZAqIq0fek5EBdAQ53Yyws1XvkSCwWytUCnfhXbw4=;
  b=Rqzk1GdZdcdzPJ4xPzF0bdPXSPNzAhY8d9nBJ2KjxAZPgPxpi56JqHwI
   CwkFZozNU2HzFRT8OzOZSQznJqwCwUF+BsdTx+AWH+zARRIyosQaKERfy
   bbCdCnbqJrDNOLUGL7Pfi9kV7/0mbL/z6R7zNTiAfgHIg9eviAizXsbq+
   rZ8Q/h1xy6hess5Hu026o1RbEsKUazR0febIEu75KnLGN3ldsGMDBRzZJ
   WjD3PpASgGurOBgV7UM3nlC7I1vkNL5WpbNTUpdUS9vcoLCLuu9Sxt1YS
   IvFGMsDbs+lKEkXOIvHS5XCOTdCU5Lan4yp5iNdTbDPDRhWZx0ODFWr8g
   A==;
X-CSE-ConnectionGUID: 4IV8gIHKQCKYLxiBDXxNgQ==
X-CSE-MsgGUID: pPUE2zJAQKG0sPb3jGLF5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="12932518"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="12932518"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 23:28:59 -0700
X-CSE-ConnectionGUID: kh05NKg+R7mVbEOl6ZyXpg==
X-CSE-MsgGUID: 1bwzVecxT7S5GsW9QSnxIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="34728862"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 23:28:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 47D0511FB89;
	Mon, 27 May 2024 09:28:54 +0300 (EEST)
Date: Mon, 27 May 2024 06:28:54 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC] dt-bindings: media: video-interfaces: How to describe
 physical lanes for CSI-2 C-PHY
Message-ID: <ZlQoJtxXBqrwI8_U@kekkonen.localdomain>
References: <20240525220747.GD1900917@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240525220747.GD1900917@ragnatech.se>

Hejssan Niklas,

On Sun, May 26, 2024 at 12:07:47AM +0200, Niklas Söderlund wrote:
> 1. We could add a new generic property to fulfill the 'lane-polarities' 
>    function for C-PHY, 'lane-polarities-mipi-cphy'. That would only be 
>    valid for C-PHY buses.
> 
>    The structure would be the same as for lane-polarities but the items 
>    enum would allow a value from 0-5 for each entry in the array. And we 
>    could define mappings in dt-bindings/media/video-interfaces.h to 
>    allow names in DTS, MEDIA_BUS_CSI2_CPHY_{ABC,CBA,ACB,CAB,BAC,BCA}?
> 
>    This feels wrong as we already have 'lane-polarities' and it is used 
>    for CSI-2 D-PHY configurations already.

Could you add a property for this called "line-orders" with matching data
line order in MIPI DisCo for Imaging specification
<URL:https://www.mipi.org/specifications/mipi-disco-imaging>?

The polarity isn't a right term here as it's not a differential pair as on
D-PHY.

-- 
Hälsningar,

Sakari Ailus

