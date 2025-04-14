Return-Path: <linux-media+bounces-30142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC8A87D29
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 12:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33C39162C8B
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 10:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F04267712;
	Mon, 14 Apr 2025 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gouGev/n"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D759E190679
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 10:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625524; cv=none; b=R8tLIen6DkkvoF0MH2aYmxvHnV+Evjzhaxvw8BqiwMfvw/Wjg2s/550fgoq504shQHjepefdO4w1EfChSqWmQNQ2TSSx81fIojMsTYZGn2S5EnbYpTck9hnmaCLzlFtHLN27drCndtkwjzKlULxw3jATAQDkG8H8ptAwPis7o0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625524; c=relaxed/simple;
	bh=aokJeeqI8OZnbyjPq7evYNv4zNWim5TMB6IAXEkej3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hD6RbIyTD4tf28maFvfQxx3J4uScKI1Uy8cgoFmjJqypRmIj5mQuh4CgU18ATfwJ5x5KQOz+kSrZgbjVI0DhbCivLaVOIq2NfXb0vhmZFqbjpItn9Ek5UdfmLRDmPDTVn+n8EF0ms8RJgLHbx/BGqaN2ax2fOCoN56hnszge5dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gouGev/n; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625523; x=1776161523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aokJeeqI8OZnbyjPq7evYNv4zNWim5TMB6IAXEkej3I=;
  b=gouGev/nNp3lIWlC532MJ6J3jy+f7qZlFWFF5Yq1xct73rOKZ7WToMeI
   cVI/p3TaXvx7F7SOmmvmOwBN/Y1OttDWuvtxfSkD8IoGiPAko2LVacaiw
   p9j1dPwp9Urzz7/Nuonko/RJl3aKhUcWtGKZvfdgawUkQNE5efBqb9sV0
   I8oiPSIDmYO8bk5LEioaNJGEuluRQMPK7vDdTNedYmpy35klqgVbODhXW
   B32Uq3ACrVhBdOxerC15FGr0gPR8JDyMYi+gdcYlWJTWvOJZm5k4Jd54G
   f+2bf+3/CnqRBRetnI4T8V3ibwhaMe7y+G4tBQ2JUBLOQhUF1baS2JkwB
   g==;
X-CSE-ConnectionGUID: GtvC2UCMSUGoDj3FXOguSA==
X-CSE-MsgGUID: sAC6dS42T9KA9tdwa4qW7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45796016"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45796016"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:12:02 -0700
X-CSE-ConnectionGUID: U29tnDEkQtWRK4JBKWtz2g==
X-CSE-MsgGUID: Km9OHm2KQJOO8RPtSM++Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134832712"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.254.14])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:12:01 -0700
Date: Mon, 14 Apr 2025 12:11:58 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 0/7] media: intel/ipu6: continue on ipu7 code sharing
 preparation
Message-ID: <Z/zfbpSmzCDOW9mo@linux.intel.com>
References: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
 <Z_fk_ofTOzsvbRwZ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_fk_ofTOzsvbRwZ@kekkonen.localdomain>

On Thu, Apr 10, 2025 at 03:34:22PM +0000, Sakari Ailus wrote:
> Hi Stanislaw,
> 
> On Mon, Apr 07, 2025 at 03:40:30PM +0200, Stanislaw Gruszka wrote:
> > Move and rename more structures to isys.h. Add accessors to make 
> > further transformation easier.
> > 
> > This is on top of:
> > https://git.linuxtv.org/sailus/media_tree.git/log/?h=devel
> > plus:
> > https://lore.kernel.org/linux-media/20250317073856.162147-1-stanislaw.gruszka@linux.intel.com/
> > https://lore.kernel.org/linux-media/20250401090953.473339-1-stanislaw.gruszka@linux.intel.com/
> > 
> > Stanislaw Gruszka (7):
> >   media: intel/ipu6: Use isd name in isys.h
> >   media: intel/ipu6: Remove line_align
> >   media: intel/ipu6: Move common structures definitions to isys.h
> >   media: intel/ipu6: Rename common structures
> >   media: intel/ipu6: Remove deprecated lock comment
> >   media: intel/ipu6: Introduce isys and dev accessors macros
> >   media: intel/ipu6: Start using accessors to get dev pointer
> 
> My main comment to the set is naming. Can we do so that we keep the current
> scheme (ipu or ipu-isys prefix, with or without IPU generation number) and
> then reconsider this question when the result (hopefully including IPU 7
> ISYS support) is in upstream?

Ok, I'll use ipu_isys_ prefix for functions, structures and some macros.
However for some macros I think it would make sense to skip ipu prefix to
make the names shorter.

Regards
Stanislaw

> The rest seems entirely reasonable to me -- but see my other comments, too.
> 
> -- 
> Kind regards,
> 
> Sakari Ailus

