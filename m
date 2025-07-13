Return-Path: <linux-media+bounces-37580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D9B0336C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 01:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 908E8189963F
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 23:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5B7204098;
	Sun, 13 Jul 2025 23:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="N5jw3Ay9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2181C700D;
	Sun, 13 Jul 2025 23:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752449030; cv=none; b=ZfaktqqzXnzZrRQros+OF07xF91cm6kf+9Yhos5rNG1P3TMXITYVQyXAglXViZbC7swTjRze+1680MhlhtloIlVXrYADUOUZ3O4l89YyPvgnMwP60MYO10iX+FmaGBPiv799ncWvepB17VbMzq1cmdIueA8IMep/wTrIlDfy8Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752449030; c=relaxed/simple;
	bh=cA4rX9hVcLuHkLO5DVQujs/MelYb6jKWeM75GDINJto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWdiJK4I55mdUsEGPuRm7OFRCyRqdw4zIj7FqNemOLReAh0ufSw5+ht0PGLxqVZ58GbMX6GJm7t6wixUES4aSmp+fHEkvPpuS2ZnwgkM0arYEkG+Ykx8dg7UUoLQQrddSbZhGIHfeZkEoqIvM7vfCANze/73uiD5RgnzDtAF0SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=N5jw3Ay9; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=ER8UgKQIqa0IsgF5LUsvKXvjQplxiyNLwUilByJWgfI=; b=N5jw3Ay9e485oPmz
	eh0Gc+Fe668DHaYrWZG6CHgT5QTOhGs84OkXGcsME7psbQBPF8CJwTNus47DjTSjHE5rVlu8k7jW/
	8F2xhoRQqk5Xy8o4H0KzPqNJzTr/7Twx/lpAiPd9D+slqr7xKa9De0r7paKVKA1gmd7YN3ardaChJ
	z4E4gS54Kv6MAkxK07Qo2mKCRGs2oAY4cSWdDXNdFOzZzC7XQs0KWQVuXEtWE6gcXI4WHsdZ8MCwi
	qDTYMSTXEOVBSiRiXZpk1lV5yrQLDHAIPGue2f/14fBMIhP9JuAPYMDgh5++p0cDGYeysy753yWnR
	XZ9kgWssC9GaduwkNw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1ub62j-00Fp80-1X;
	Sun, 13 Jul 2025 23:23:37 +0000
Date: Sun, 13 Jul 2025 23:23:37 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, michal.simek@amd.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: of xvip_enum_frame_size and xvip_get_format_by_code
Message-ID: <aHQ_-TCl02_mcHHz@gallifrey>
References: <aHPj_C6iGCEFDW98@gallifrey>
 <20250713230109.GA10401@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250713230109.GA10401@pendragon.ideasonboard.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 23:23:18 up 77 days,  7:36,  1 user,  load average: 0.05, 0.01, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> On Sun, Jul 13, 2025 at 04:51:08PM +0000, Dr. David Alan Gilbert wrote:
> > Hi,
> >   I noticed in xilinx-cip.c there's xvip_enum_frame_size()
> > which was added back in 2013 but seems unused in tree, however
> > I had a dig and I found
> >   https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841638/Xilinx+V4L2+TPG+driver
> > has a commit:
> >   https://github.com/Xilinx/linux-xlnx/commit/1c113b4aef14004152fefc0e8b8dbbcc2314566f#diff-bb594682a92148570df8826933cf8629
> >   from 2014 that uses it - but it looks like that commit never went
> > anywhere.
> > 
> > So is xvip_enum_frame_size() or not?
> > I also see xvip_get_format_by_code() looks unused, but I don't
> > see any uses of it, even digging in that wiki.
> 
> Those functions seem to have never been used in the mainline kernel.
> They were likely added to support drivers that have not been upstreamed.

Ah, shame.

> Both functions are used in the Xilinx BSP kernel.

OK, I'll stay clear.

Dave

> -- 
> Regards,
> 
> Laurent Pinchart
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

