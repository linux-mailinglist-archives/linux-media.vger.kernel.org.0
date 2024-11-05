Return-Path: <linux-media+bounces-20929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9159BCC57
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 13:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE6981C21CB0
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3EB1D5150;
	Tue,  5 Nov 2024 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j51gBfj+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758C91420A8;
	Tue,  5 Nov 2024 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730808444; cv=none; b=pNVRtop0dCqx2xOhUrlWugIM0Fpe00eObbmI3u5+vedMWqPFnwtvlj+m+UgHHZKCZI5QEH39hll1DKUTsod+Lpfp0MlDOE47QfS5PYwux6LmEGGA/FS/dHo9/Zg7tJHoWh9er13Fz6wE2uo3C1BDLwlPwQlB5JZrobtOhaOUs5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730808444; c=relaxed/simple;
	bh=on3mcO94tt7KilM9d2YbIAEw+E9ZgvnJ6HbM8d0j6x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HleYdMZNn/WDQTumKJBdvq29XzMnk+P0YUOJfPigQTJX7M/nkm6OiBqrpKM7A+qoDBsNvzjAWrXbb7VMGJt3eCFmlRe8Al0txm1XXBo3zhdQCfeNZwreZyNmBATXLzyUQ2BxILD4K+Zja8/ua3gvG/sXh4xlOrgYXg3DuOFrSj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j51gBfj+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730808443; x=1762344443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=on3mcO94tt7KilM9d2YbIAEw+E9ZgvnJ6HbM8d0j6x0=;
  b=j51gBfj+uFDxsHZe/Yw8paQi5eHDple5mrQHG/S0vCdF/auAVb6tievJ
   E9ntXjDnRqlei/gpVQ2s9Nvr64ZII0ZDOpBySTfHYts9WpDaydfKfyHF5
   DDWFbMLBi/m6tnwjh735A6CdTWsQ118sE+JBSykmH530eBYdeDcjfscqi
   4R1tq8bdBYJ1nYMQXOR1WXcOtZZBx226RPZFSBcYrfhz0qHLIUVVu0CtJ
   7qpKV86qF/rLPlBxqTm5qdqjLN9ZSSxWfd6iSCtWRzeAkLQf8b9tLBh4v
   sFmwWtUYAh1qGBh9wMZOnZTM0Nu5jqlqsxmfBgJg+seZAI8iSDkVB+6cq
   w==;
X-CSE-ConnectionGUID: EFZCiLkfSaC44NxDaMsE+w==
X-CSE-MsgGUID: ok+wK4EkS2qGzHF755MKxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30773613"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="30773613"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 04:07:22 -0800
X-CSE-ConnectionGUID: izD8ZC3LRC+jy9k7Ch1Tsw==
X-CSE-MsgGUID: kme8k7LyQwy7LStBLSdT+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="89130796"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 04:07:19 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1EC6D11F9C3;
	Tue,  5 Nov 2024 14:07:16 +0200 (EET)
Date: Tue, 5 Nov 2024 12:07:16 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 08/10] media: i2c: ov5645: Report streams using frame
 descriptors
Message-ID: <ZyoKdCFLo2yeK9S4@kekkonen.localdomain>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241018153230.235647-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018153230.235647-9-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

On Fri, Oct 18, 2024 at 04:32:28PM +0100, Prabhakar wrote:
> +	code = v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0)->code;

This doesn't compile. I've dropped the patch for now.

-- 
Sakari Ailus

