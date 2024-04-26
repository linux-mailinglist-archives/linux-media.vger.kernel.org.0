Return-Path: <linux-media+bounces-10235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4598B3D9D
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 19:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 555D0286C79
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 17:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBBC15AD8A;
	Fri, 26 Apr 2024 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kd4ZS9sQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE3F2230C
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714151309; cv=none; b=ck5dNPFN+Xhnd8UttZIkEpRm7ickHe99hUHAXjB5ywIK+gtYHh32DG+q+rdLgytiQNZrZmQmQNdBZQoPGvbdHD6luBTIYsAh52hHYmDGF2jEU0a2aH9vyVAzXcOKf6PJzWRvJlxcqvAyY4HlE494PQiz+jwXlcXKZ2qQ+DuNkMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714151309; c=relaxed/simple;
	bh=JapWoKjgo5o56uVtYMfSQHcIRbrByzEpia7KRL4P5aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zegmbxbwd1vACwZ3WHrXO48NNw554NWwhTqO6F5s5X2/9lQJGoOjPwIJvI+rgrgUcMKbmBPa2zkpy3NgYJQmXP3iE5qpOHlDtFpg2kcr57jkr+ucXn89pRqRblePQRpyxKNG6BhXiGpIYY++z12FAtkJUSDApbxiJMxoTpOgvZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kd4ZS9sQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714151308; x=1745687308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JapWoKjgo5o56uVtYMfSQHcIRbrByzEpia7KRL4P5aE=;
  b=kd4ZS9sQDJPZXxYxOnLiYxuqQYsC0g4L/OiXauXj7DcfQ06YSLl7+Ojv
   o2idMbMKsfn9TfVwR126Lr0O/P9tj3sPt7PLnCv/K76H/Gx/bGKj9551g
   uXdYbl0bj94NkzI0jbBBzBzJE1G2fFQmoFReEbkRFS3BKle28qQdmkef3
   onshEtQO+LgOMq/GkujZm/o31c688ylbJlYA/e3wFLwSMUofdUnNv2iyy
   Ym1S3ksAjTQNltLeYfyhscbMCnvAruFy4PLwIMHc0tl6Njxnswiqz19ZL
   kchlWM3KlXDQcF7z52ngC21DX+rzRi6a8EFbMX1NzvUXXTr+eV5j4/sD9
   A==;
X-CSE-ConnectionGUID: bfTFGppLRHeMZw5g143NAA==
X-CSE-MsgGUID: zjlMreIbTQuVuExnxcpraw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27409663"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="27409663"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 10:08:28 -0700
X-CSE-ConnectionGUID: 8BOZcgSlRZKYOnOw4+FG8g==
X-CSE-MsgGUID: 48Kg9KUIRgSnd/71LNp1PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="30138158"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 10:08:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s0P3e-00000001P4C-3fBM;
	Fri, 26 Apr 2024 20:08:22 +0300
Date: Fri, 26 Apr 2024 20:08:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.10-2
Message-ID: <Zivfhs29Ra_YyED8@smile.fi.intel.com>
References: <5f89adf7-23e3-4966-ac50-838335b13207@redhat.com>
 <20240426111533.2b717d57@sal.lan>
 <57b7f59a-8549-44d5-95fd-4402951d4bd2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57b7f59a-8549-44d5-95fd-4402951d4bd2@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 26, 2024 at 07:04:10PM +0200, Hans de Goede wrote:
> On 4/26/24 12:15 PM, Mauro Carvalho Chehab wrote:
> > Em Tue, 16 Apr 2024 11:33:51 +0200
> > Hans de Goede <hdegoede@redhat.com> escreveu:
> > 
> >> Hi Mauro, Hans,
> >>
> >> Here is a second round of atomisp changes for 6.10,
> >> this pull-request supersedes / replace my
> >> "media: atomisp: Changes for 6.10-1" pull-request.
> >>
> >> Various cleanup patches from Jonathan Bergh and Andy +
> >> a set of patches from me which has been reviewed
> >> by Andy and Kieran.
> > 
> > Atomisp patches applied, thanks!
> > 
> > I had to do a rebase here first, as it seems some patches were 
> > merged already on this series and on the previous one.
> > 
> > Please double-check if I picked everything, and rebase your
> > tree on the top of media-stage before the next PR, to avoid
> > potential issues during patch review.
> 
> Thank you for merging all the patches.
> 
> I have done a rebase of my media-atomisp tree and all patches
> there were skipped as "previously applied commit", so everything
> looks good.

I would recommend to double check with the real diff between two branches
(like old one, possibly rebased on old media tree) and new one.

I remember some (Git versions?) time I got this message while the content
was slightly different, hence from that time I learnt to double check with
the actual diff.

-- 
With Best Regards,
Andy Shevchenko



