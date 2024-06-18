Return-Path: <linux-media+bounces-13495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8040590C3C4
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 08:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95B421C20C47
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 06:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD145025E;
	Tue, 18 Jun 2024 06:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZig6J7I"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69C6481A3
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 06:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718692797; cv=none; b=KQqAqfOMwS2cD5UNXvFmKOULlx3l1Y8+TNHYSynpTyVk/p9pEhDPNaHBkswm9Q1JCAj2WhH8WLF40IC87jmy6EidiNV+0lDhnRrX3raQlDmkhEc9O12LR95uIloB6hXdTDsFIM34IQhA2oDm4BytgFDLobJSDegbALPkj8hqnHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718692797; c=relaxed/simple;
	bh=wiO0fhIipAAIvEzumNnXNRmklCY9YAi7GLDzVgIdGT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQm5nTIwpsqEHsDn8Lv2X5u1YY88tjrj4vq0wztsxPrtVEu5k1CjTu+pZf5ju5RhQqClhAiXCvXmR4ZhZumGzaVU9B/QTVUvU3VJevS4Il7E1GmiuG3cIp0vjFZK2uVvpamfvgJaMD1ZmlbHbz831aRUWNxYbgyveBMbPzJXZ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZig6J7I; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718692796; x=1750228796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wiO0fhIipAAIvEzumNnXNRmklCY9YAi7GLDzVgIdGT4=;
  b=PZig6J7IjTHxezzxKRI4LGXaOAlJCS1x0028gHyX8gxr4/l8UHOb8Dw4
   kyuxcVv6i/o7IkXoXHwsKfnEXoINbmVuVIZ16UhvOZHb9Qz+WuAe2xDrY
   8S0tILAOAmGiX6fKif8jjsQ54zywgtFFD1oVhN5WfMSL97mYf4KlZDZz7
   GKqXDp+9OlQuXa7+N+eee47swCFtysEfaK7M/Nbl/v5il3Ps+iH/y38E7
   BknVIonsQu1lPTBt7j6wgIpYyjLN0yi2azsJWXRD77M9xAizbecx4zDYJ
   lPDapKqxwrCYta+VMlRaSl/VtLMSce0PMvuK5j3OcaKiFI1z6EOCs8Iq1
   Q==;
X-CSE-ConnectionGUID: xml8+WT1Re2lfdzrVNcYRg==
X-CSE-MsgGUID: Ad+VkaoBSz6inaVqi9DifA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="12124732"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="12124732"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 23:39:55 -0700
X-CSE-ConnectionGUID: RfHOoAgOSPa5Beq3sp+cqg==
X-CSE-MsgGUID: 1D0nWPUYQ1OlDGIyrPAZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="45899602"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 23:39:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E462711F7E1;
	Tue, 18 Jun 2024 09:39:51 +0300 (EEST)
Date: Tue, 18 Jun 2024 06:39:51 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 25/26] media: mc: Enforce one-time registration
Message-ID: <ZnErt2bYTQhEzdUG@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-26-sakari.ailus@linux.intel.com>
 <85b8a8d5-eb84-40ee-95c7-497bd2e7b110@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85b8a8d5-eb84-40ee-95c7-497bd2e7b110@xs4all.nl>

Hi Hans,

On Mon, Jun 17, 2024 at 12:42:02PM +0200, Hans Verkuil wrote:
> On 10/06/2024 12:05, Sakari Ailus wrote:
> > A media devnode may be registered only once. Enforce this by setting the
> > minor to -1 in init.
> > 
> > Registration initialises the character device and sets up the device name.
> > These should take place only once during the lifetime of the media device.
> 
> This has nothing to do with patch 23/26, right?
> 
> I would move this to before that patch.

Sounds good.

> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

-- 
Sakari Ailus

