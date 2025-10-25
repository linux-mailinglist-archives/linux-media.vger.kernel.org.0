Return-Path: <linux-media+bounces-45564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB34C09F90
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 22:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CE933AF693
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 20:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7992E093B;
	Sat, 25 Oct 2025 20:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9FmfB20"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668EC1E1C22
	for <linux-media@vger.kernel.org>; Sat, 25 Oct 2025 20:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761423429; cv=none; b=b0sBJurzHzrBm+YQTrRWnCpHZtaW4SQnHiIEehAziCU4qm5JrbzvwY24qia1YX7ygLT8aHy/UJ2Mhxs/vJBPhwn6EcNXocF6KNENhadaFru/nyvTnsiiA183+nvU+O3cH+2pocYmjdSPaurmW6wu2wvEMdR7A5aoGF1firefTLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761423429; c=relaxed/simple;
	bh=FztDRHz91KVVz9TyDRcaUviqr87MkQnOI91fjHBfc6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVIXEYZWIaTIvlxjXGbgS9cqMfv8EGGrw1pARHnFtcfx6lSE1Fo/ulOrzQxepbskTJWBj2UcEeBWGiZo0evIS+uZ6AzAChRr/mjj1wMozvqBov+0OzxZJSnmAr14Z0CIeYSABjeAb2dJkNl96uBL4oULSWAbu69iTjSZZXTz3GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9FmfB20; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761423428; x=1792959428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FztDRHz91KVVz9TyDRcaUviqr87MkQnOI91fjHBfc6c=;
  b=U9FmfB204zT9LIXE7e1RcmsbEt5wSiGMF1lOdToRgb0jdMTiJ1ms4R/6
   ga4mdWOcj+Hu5FwWf75EAALZ/CAUYyH89YPUjxm4Dauo/lC6K8Qk+Orbb
   j9yuzRwybV6hG+an7AjvQzoS+U+Wgg+S1Njl0493rEG9WtUt6G3NHptep
   0xZ7u9A6B/5wsNOGsNoiBcGzvpvr46TxTSYF2CpmljGfPyqmO/rBzxPjj
   SVDBGqmnKSdFNAApIpe2l9pyNuZLUTVrOaHucsLCZhrpKciTLKDQNFbA/
   6yzQqtKx1uh7lS+sSWK3N6RU/5UYy6wcSrvP3OtkMGsFFpNIcCYBhfUYb
   Q==;
X-CSE-ConnectionGUID: Q41j5w2STt20qiysCcq5sQ==
X-CSE-MsgGUID: czeF8IXHSG6yJKb5QO+3LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66177364"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="66177364"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 13:17:07 -0700
X-CSE-ConnectionGUID: SmifMYsTRD2tvs5ZQ728ew==
X-CSE-MsgGUID: UI/Sj+dwQMORGErmUDimcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="188753278"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.178])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 13:17:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4DB5211FC72;
	Sat, 25 Oct 2025 23:17:03 +0300 (EEST)
Date: Sat, 25 Oct 2025 23:17:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] media: ov02c10: fix orientation on Thinkpad T14s
 Gen6 (Snapdragon)
Message-ID: <aP0wP3adzgPcIcXY@kekkonen.localdomain>
References: <20250820-ov02c10-fix-v1-0-3fcca2cfbfbf@kernel.org>
 <qn6vtfm42jqtheqbd4vlkrdekea5ntk2hvd7bl4jfxf4chjood@7wrvzmtnfiv7>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qn6vtfm42jqtheqbd4vlkrdekea5ntk2hvd7bl4jfxf4chjood@7wrvzmtnfiv7>

Hi Sebastian,

On Sat, Oct 25, 2025 at 12:34:18AM +0200, Sebastian Reichel wrote:
> Hi Sakari,
> 
> On Wed, Aug 20, 2025 at 02:13:18AM +0200, Sebastian Reichel wrote:
> > When testing the camera patches for Snapdragon X1E I noticed the
> > image is upside-down on my T14s Gen6. After some investigation
> > it looks like issues with the sensor driver have recently been
> > reported, but not yet been fixed. It seems sensible to do this
> > ASAP (while the driver is not yet used much) to avoid potential
> > regressions when changing the VFLIP default.
> 
> Can you take a look / merge this series? It has been over two months
> already and I hoped this would be handled quite quickly considering
> this is a not very complicated simple fix.

Thanks for the ping. I thought this was already merged but apparently not.
Either way, it's in my tree now.

-- 
Kind regards,

Sakari Ailus

