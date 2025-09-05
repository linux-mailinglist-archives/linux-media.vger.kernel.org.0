Return-Path: <linux-media+bounces-41812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9A8B451DD
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 662C456340C
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734553093DD;
	Fri,  5 Sep 2025 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAo/W1Up"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C880727FB28
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 08:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061762; cv=none; b=BzH1jus7M9tj8YPV3NE6B067R0cbBTAB49231qM7Ml9tb6aALqySwR5YT4T3uFqQEgud07u8PQwyyBYLvYz71fwLaFiEj1JFHzJmoLpAQfW1/WgSf2OHrrZDW3gC2O5u9J9F32HSDj1W+D+a9gUmiTCPWUFhbbORRQskoFPoD0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061762; c=relaxed/simple;
	bh=zf+3JsvKOG6fQD5XeeQVjsflmRftpLkAWn2Al7SZEi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/dlRNSliSF77Mb/PIhZM9IyA0Dvu9Uf1HbnR9VY6EtExKLWrfGY1cJvQIRNYS0oVe3uxGnitK3H/vtpRgbHRJAdadQuPXcxB4kwk9Th1IhqRuTpAj81DfgjsR86/26G0nt3gC/fy0VAZHHfFDKSuKuFaH5+sASmzQQ96Wq3FGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAo/W1Up; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757061761; x=1788597761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zf+3JsvKOG6fQD5XeeQVjsflmRftpLkAWn2Al7SZEi0=;
  b=hAo/W1Upv3PPbc7cZQw7hgIzjoSUhsbmyWDB3F/nB7vy0RPF9Flr4uej
   xHKAz0Br693tiU3MznnaLWK3AqWMBkPDzrbl/zGs7rQXQ+30VBaDyabXE
   acVqt2FMba/Cq2zW9+KHywNtVcVf3EUUx0iLC51AUoCg8Mu82c+umlu6k
   DLCFZeGbqNAwC9K8PboL9AXE+Rsp5dzf9a3DamjC1ncDI7KLZh0YHWVMr
   2AFzH5msq4zMMbyj3CP91/Ke6t5BoKHHQY7YolWmj1Q5V8K5qVmUdrMHY
   t8abRKt092HhUjdtJGQUs/Nx5dQusxcP5qpIj20LlOgy7TQRNygkio9Je
   g==;
X-CSE-ConnectionGUID: dGga7HMLQXSUy1gkTevh0Q==
X-CSE-MsgGUID: jZJEMLe+QUWV/KpUpeNMSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70026112"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="70026112"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 01:42:40 -0700
X-CSE-ConnectionGUID: 6sQ4EaDPSNuw3KEqwHAJbg==
X-CSE-MsgGUID: G5TrC+ALQiaxJ37waY/W7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="203040192"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.241])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 01:42:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 798C1121F43;
	Fri, 05 Sep 2025 11:42:36 +0300 (EEST)
Date: Fri, 5 Sep 2025 11:42:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v2 10/72] media: i2c: hi556: Replace client->dev usage
Message-ID: <aLqifDc9FqUh_oiC@kekkonen.localdomain>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
 <20250812214620.30425-11-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812214620.30425-11-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Wed, Aug 13, 2025 at 12:45:18AM +0300, Laurent Pinchart wrote:
> The driver needs to access the struct device in many places, and
> retrieves it from the i2c_client itself retrieved with
> v4l2_get_subdevdata(). Store it as a pointer in struct hi556 and access
> it from there instead, to simplify the driver.
> 
> While at it, fix a mistake in the sort order of include statements.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Avoiding v4l2_get_subdevdata is a big plus. But instead of adding the dev
field to every driver's context struct, could you use the dev field that
exists in struct v4l2_subdev already?

Should we repeat the pattern in this patch, the context structs of sensor
(and other drivers) would be rather large.

-- 
kind regards,

Sakari Ailus

