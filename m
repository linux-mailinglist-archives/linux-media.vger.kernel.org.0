Return-Path: <linux-media+bounces-50701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B100D1F020
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 14:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F93A300EE40
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 13:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6AA39A807;
	Wed, 14 Jan 2026 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/COzU0D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF9339A805
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 13:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396482; cv=none; b=L46kHAmVnfMhq+QKo6X0LyyNerNiQggStkIh9Mm0phB4LixvHQBtxnn4GAvk3oIkTX58VIbcrf7PaDbgeMGT20GkE4hMtGDEELrvaRX1Guqr3JePYCeg+ar2e9hLT2AQ5l3EfIEoBJK6e9W4kbHknuAibh0yJ3SsJ88xPEy/TpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396482; c=relaxed/simple;
	bh=8Mk41d+wbLXmd9xsDJRd9qZvlp0u48NZgYtyWrbX6Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dD1q5wd2J8tMQJbTAzWdBmCk942vN9rCLQjr7wjEYrImvbtGOIF8JD/VxI9GsUj9kBK8srQapl0qOf1vV7wgoiNRzFJiIiRSWOnXuUrrIdn6+vShM4SRNi+sCuQcbqq7aCOq7HlzdrXE0TReAdU2WC+z0QBZUwBmWWv5tOoz+YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/COzU0D; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768396481; x=1799932481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Mk41d+wbLXmd9xsDJRd9qZvlp0u48NZgYtyWrbX6Ss=;
  b=f/COzU0DbN9hAcB7ZA+HSJ8nrmeFsxjK6sGUAHeQ/edw5LXQZmJUQaUN
   XwHnn41pq1jPk/V2j+8cw5wDk48tVQM9QpWzLLB1H3elyr0oubXNHKhpz
   HiPKybv/kh+cy0jecROHL4a3E9nm/M0H5r4AAhy1jScEbB6Oq3VdsQViz
   8yaWjld7QRgQq+SXPDydnggv1ikcAPh7t75mcvh79OR7L44F0THPHuvZO
   QIPy6StZmxFzYWPBevTdAbVyJ4oFzE5uYJpTboJmHfgiB7qiYIy6khPXi
   9mbMIJeA5iYpJAyvMbjeXDKbc5AYWUVXNDWyGo3QVaEkDxSSMENjD4GZi
   w==;
X-CSE-ConnectionGUID: s6Qq5gJhSoemvb2y+HUjVw==
X-CSE-MsgGUID: 66WljtjzQ82D4Qn3yR3ADQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="72276803"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="72276803"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 05:14:41 -0800
X-CSE-ConnectionGUID: uT/bxbKRTgiL9WugsOrGaw==
X-CSE-MsgGUID: +T6x+y3pR4uGRIomlVj/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="235938319"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.158])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 05:14:39 -0800
Date: Wed, 14 Jan 2026 14:14:32 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>, 
	mehdi.djait@intel.com
Subject: Re: [PATCH 1/1] media: ov01a10: Fix test pattern assignment
Message-ID: <n3xke3e7trpry7n5f62gpxpb6qf4dvxdckhonj3r3tdqiy7je3@zkaixrffks55>
References: <20260113082512.102779-1-sakari.ailus@linux.intel.com>
 <988fe458-da1d-4042-92fa-8e1b80e09d5e@kernel.org>
 <a6768fbf-9efb-9fbd-75c1-c6ed5710931c@linux.intel.com>
 <61fe8284-9933-482d-80d2-8fe3b87d5ab7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61fe8284-9933-482d-80d2-8fe3b87d5ab7@kernel.org>

Hi Hans, Bingbu and Sakari,

On Wed, Jan 14, 2026 at 10:30:49AM +0100, Hans de Goede wrote:
> Hi Bingbu,
> 
> On 14-Jan-26 04:13, Bingbu Cao wrote:
> > Hans,
> > 
> > On 1/13/26 6:42 PM, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 13-Jan-26 09:25, Sakari Ailus wrote:
> >>> The test patterns of the test pattern menu control start from 1 whereas
> >>> register values start from 0. Fix this.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>> This goes on top of my recent ov01a10 series.
> >>>
> >>>  drivers/media/i2c/ov01a10.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> >>> index 3dbc77430e0e..0a66d8974974 100644
> >>> --- a/drivers/media/i2c/ov01a10.c
> >>> +++ b/drivers/media/i2c/ov01a10.c
> >>> @@ -319,7 +319,7 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
> >>>  static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
> >>>  {
> >>>  	if (pattern)
> >>> -		pattern |= OV01A10_TEST_PATTERN_ENABLE;
> >>> +		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
> >>
> >> Nack, copy paste of my reply to Bingbu's email where this change was requested:
> >>
> >> This was "pattern - 1" in the original v1 patch-set, the - 1 is dropped
> >> deliberately c2 because testing has shown that there is no difference
> >> between writing "0 | OV01A10_TEST_PATTERN_ENABLE" vs
> >> "1 | OV01A10_TEST_PATTERN_ENABLE" to the register.
> > 
> > Hans,
> > 
> > Thanks for the explanation.
> > 
> > From the specification, color bar type1 is not same type2, type1 is a
> > standard color bar, type2 is a top-bottom darker color bar, type3 is
> > right-left darker one.
> > 
> > Mehdi, did you confirm the description in specification is wrong?
> 
> Yes Mehdi did confirm this, see:
> 
> https://lore.kernel.org/linux-media/jgzovuqvd5csxwzmzf5asri7xvftoyb4lqyywtfdsrsgdvwz7i@neqszepmzw3m/
> 
> Here is a table of register values ( + OV01A10_TEST_PATTERN_ENABLE) + test-pattern
> seen in testing:
> 
> 0: Standard Color Bar
> 1: Standard Color Bar
> 2: Left-Right Darker Color Bar
> 3: Bottom-Top Darker Color Bar

Yes I confirm this when testing/reviewing the series from Hans.

--
Kind Regards
Mehdi Djait

