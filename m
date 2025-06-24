Return-Path: <linux-media+bounces-35768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B10AE63E5
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 462757A36C9
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 11:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887EB28D8F1;
	Tue, 24 Jun 2025 11:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dv95ynRM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E221A42F;
	Tue, 24 Jun 2025 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765885; cv=none; b=gzFz81TkrqiV9d05u6OPQ2s8FSC4fdu3Vc9nXy3BU/Yhze6PdgdSMSjfwsCFo02h10J/tQCcYERzm0686wYTLJVyvasOgtDyfOyt9pmQPGln25INCE3SQ2lUiybGLlejgcmZ8ErC3ioKJvbcD5q61ltxV4hoT+95zXiNknQHT7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765885; c=relaxed/simple;
	bh=de+zyq3lrV3HiIb5ljhQjZo7EhZ0lt/ItXJ0k6bqSGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpHFlpnvuGvKUqtz0qtsVd7Lkne2wXDBooPa7bTN5R42LRr9crIyDhcOn7LonmFcjKvHzakgCCMpN3SWGRgIb3VOcMe8DUIVNX2nL23FGmxH1bilPVV9Ji3wmQlrHFbPve/MwJeB56TABJk+q1aAo3FTO88SVrDWPhHHRI81YZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dv95ynRM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750765884; x=1782301884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=de+zyq3lrV3HiIb5ljhQjZo7EhZ0lt/ItXJ0k6bqSGE=;
  b=Dv95ynRMunb+lt4w4730FjMc9bqA0LuUwxDm1tXS0TEd4owGkO2byeUz
   ZANsTPg7lqqy0KD/M+igv/BRNbJBa9bYG+X2k1DmgfGhaOS8HHio2LIV7
   +S0e1mvwNvWh837+f3zNkymOBSVpDlr/BWJ9rWb+gyL/5bU01NA7eGIBV
   JGPpHOjoMn2zHqJfMFpvvZXk+d7pnQGW71ikN8Yuyc6YfvL0zqKGuDVW6
   q6gCBFkULe+5bvaxky4gbv5v0tT6k8Z9+owTZ8KIWBGEEhB6eWRKT4IKa
   dOw/kfz7FpgvOVjdII2c7zu09T8pTJoANxhD2LSg39wEy2LT0zgv2fyq6
   g==;
X-CSE-ConnectionGUID: EsAzseI5TJGuVp8HB0oEMw==
X-CSE-MsgGUID: j3TXK+9iTiiBdIOFII5vNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63264984"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="63264984"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:51:23 -0700
X-CSE-ConnectionGUID: yQEfPmseTV29fMMZblvo4g==
X-CSE-MsgGUID: 7X13RnkiQti+h/L08v8a8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="156472590"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.201])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:51:22 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7DB8411F742;
	Tue, 24 Jun 2025 14:51:17 +0300 (EEST)
Date: Tue, 24 Jun 2025 11:51:17 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/3] platform/x86: int3472: Add board data for Dell
 7212
Message-ID: <aFqRNXasQE2wvL0G@kekkonen.localdomain>
References: <20250520-djrscally-ov5670-v2-0-104ae895aecf@ideasonboard.com>
 <20250520-djrscally-ov5670-v2-2-104ae895aecf@ideasonboard.com>
 <aFlXSrZH1f4BbB3M@kekkonen.localdomain>
 <c5ec1707-5007-4417-bc54-303924598a1e@kernel.org>
 <a26ae32c-e5b2-08b7-bc47-6a84881502f4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a26ae32c-e5b2-08b7-bc47-6a84881502f4@linux.intel.com>

On Tue, Jun 24, 2025 at 02:41:33PM +0300, Ilpo Järvinen wrote:
> I'm fine with taking it in through the media tree.
> 
> Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thanks, Ilpo!

-- 
Sakari Ailus

