Return-Path: <linux-media+bounces-22687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 170A99E50FB
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9A2D160664
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905F51CF7A1;
	Thu,  5 Dec 2024 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjR8lTe0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8259B193429
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733390145; cv=none; b=XU7bUs7ORVF/XNlbdTerDj8IEsfmAkBbOH0vOYFUqiFrKjfKQTfQyNMKth7PpDraG1NfQ6Gz5KpIz7rQ3a1sDG7Vcvy3ZaXUHuHAQpO3TOD6Uy2+k9eRNsYMX/V+hhzR73aCvGtmk/9rlHVHEFkO2pqs3r6DwLgfDtHnWXkBsM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733390145; c=relaxed/simple;
	bh=q7ONWUigJWby80TYFMLatyOTsn14XZm3m1aGEjG4tAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnCco/XKSIS4bzrR6BVGMP5jJ1AKTMvBROkhQrV/ZcTcK7qfYl4nT2Ox9vYAb67j6oLNZueJsdRKa3Dwk4UFpMkVDtRlidEfbBjafKHywxf4F05/ocTNz7eHNB+jbn0KUnhGpgwzX1TdHYi8GqxWT0a6Hvbujm6JKhbZUdD+4Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjR8lTe0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733390143; x=1764926143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q7ONWUigJWby80TYFMLatyOTsn14XZm3m1aGEjG4tAY=;
  b=NjR8lTe0LeR8YtAnKgEn+vraxN4lbD1M8FG1H1EBzT5L+eQsncw1Va37
   QUwhLMgMVdXHkuq1fGTz+1X7M7Zm13zQU1EhQrhkdc98EyVedEtlrIJ0n
   kx1bkKi9hXpkrsFYhzu1dqziI+HKpeBWFnT6Zr/TfbM8EIZdRvHjd7qQ3
   B/io02fOtudfMLwDZck2zL44CGKzhYsEYkPGRz5b3VsdokkTZ0UZxBgxK
   234mdsqMylJbnlCnWegTjnVCZyBAGOav5GroV/Waw0fmaoOp/Dt9m4AHc
   mXpaC0KX+Pc1bh0qaRg0aIzi27SHykTacfhliksx67oZyBob7ca770hjp
   g==;
X-CSE-ConnectionGUID: DNvm7E1zR86NpLPPD17s1A==
X-CSE-MsgGUID: Dkd4/e2KRH2ScLwwckn1uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33609116"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33609116"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:15:43 -0800
X-CSE-ConnectionGUID: NeVhhxDdQ/aZsyy6AIC6VQ==
X-CSE-MsgGUID: WpLirMl7SJehmV6kQ+jdeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94120206"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:15:42 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DE61511F775;
	Thu,  5 Dec 2024 11:15:38 +0200 (EET)
Date: Thu, 5 Dec 2024 09:15:38 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [v3,00/15] media: i2c: ds90ub9xx: Misc fixes and improvements
Message-ID: <Z1FvOiiNbl7jrqil@kekkonen.localdomain>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
 <67505692.920a0220.1e4a28.5c89@mx.google.com>
 <dce7f8d3-f682-448a-982b-3890f223bedf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dce7f8d3-f682-448a-982b-3890f223bedf@ideasonboard.com>

On Wed, Dec 04, 2024 at 03:44:53PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 04/12/2024 15:18, Patchwork Integration wrote:
> > Dear Tomi Valkeinen:
> > 
> > Thanks for your patches! Unfortunately media-ci detected some issues:
> > 
> > # Test media-patchstyle:./0001-media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put.patch
> > WARNING: ./0001-media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put.patch: Don't Cc Sakari. They are already in Signed-off-by
> > WARNING: ./0001-media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put.patch: Don't Cc Ailus. They are already in Signed-off-by
> > WARNING: ./0001-media-i2c-ds90ub9x3-Fix-extra-fwnode_handle_put.patch: Don't Cc <sakari.ailus@linux.intel.com>. They are already in Signed-off-by
> 
> What could these mean?

Cc'd Ricardo.

-- 
Sakari Ailus

