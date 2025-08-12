Return-Path: <linux-media+bounces-39534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A267DB22091
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 10:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5296C167104
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5772E172D;
	Tue, 12 Aug 2025 08:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBxE0EYJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9BD14A60F;
	Tue, 12 Aug 2025 08:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986831; cv=none; b=XdoV/BDNWzuJgtOS8HounH9BfndNnEmXzpVQ122m72YmSGMy1kUwJOPsJ4xfZoVl/3kPAoimI4wdtyKk7MrMAy6q0aGHI4TzHuzmW+uh+4z1lOdekwSNknzVKvYUCENyuyC4fepNxMFuKbrvWvCAL2yiJMsb4jX2z0XW9aZgUMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986831; c=relaxed/simple;
	bh=l6LIpcn35RlQuRr0+4hqMdB454QrY+cXAkxgSf0Vucg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCD7j++pZUmQ2Jo8kYdlSPyhVeiqMF9Rm/SSyXBzKQ9QW0EWdvGo7A3DGYE2ddO0wMq3Z3R32HjgvD7uQxN6pzHoPXmhV20IIxCbGoVi+a43uxNUweeKMIAm3puv9sK7a9+wYTl9FXjOcfvoWTEQ3miMXZsxE8iG6pe8OGGsqCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBxE0EYJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754986830; x=1786522830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l6LIpcn35RlQuRr0+4hqMdB454QrY+cXAkxgSf0Vucg=;
  b=fBxE0EYJbkE2YJb89e0CIE5ZHZAPeZ2gu8e5rnxIm5E4oy8gyYmKximy
   Cdx/kUG8ewo2OlVwHdSxUkg9/51L/J4nfUZm/OaGSwBCzNnoSR0vospN9
   x6YsTdG5OFeoz5wZy05tw9fQKoEcv4rPk1GdquKR7aqNkFPB26Zreo7Wp
   SSbFH3bl89GfnRGc4WHM/VxVWDsHkoyD3720sC13DaEH5x70KgHNVmmc/
   TPOcDFOLu3Xp5ZNmNocrSgCKhi2aIhq+ogD6kOHx1rTTiQuF52i8o0LjO
   ART0Z0acHxkc1s/VSeICBkcxaTb7MVRmIVU3Pw3VjUA38MNvKhvPaKucb
   g==;
X-CSE-ConnectionGUID: FaCGISHYQ0GPdPvx5t+BXQ==
X-CSE-MsgGUID: /CP26QBCSpOzlEi1ITRtvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57400036"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57400036"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 01:20:29 -0700
X-CSE-ConnectionGUID: yxR/RFrmRPSqT6uj35ScEw==
X-CSE-MsgGUID: hxif269IQ+eBFvWMlaB98A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="203330077"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 01:20:25 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1BEEE11F83C;
	Tue, 12 Aug 2025 11:20:22 +0300 (EEST)
Date: Tue, 12 Aug 2025 08:20:22 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Du, Bin" <bin.du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com,
	Mario Limonciello <mario.limonciello@amd.com>, Richard.Gong@amd.com,
	anson.tsao@amd.com
Subject: Re: [PATCH v2 4/8] media: platform: amd: Add isp4 fw and hw interface
Message-ID: <aJr5RuD1lxnVBmed@kekkonen.localdomain>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-5-Bin.Du@amd.com>
 <aIclcwRep3F_z7PF@kekkonen.localdomain>
 <b033bf6c-c824-4f6d-8025-b6542ea8f35f@amd.com>
 <aJnYE2Z7F-PK1VHL@kekkonen.localdomain>
 <20250811123102.GC30760@pendragon.ideasonboard.com>
 <50f0958b-5234-4a89-a57e-5d330cca13af@amd.com>
 <20250812073432.GF30054@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812073432.GF30054@pendragon.ideasonboard.com>

Hi Laurent, Bin,

On Tue, Aug 12, 2025 at 10:34:32AM +0300, Laurent Pinchart wrote:
> On Tue, Aug 12, 2025 at 11:36:23AM +0800, Du, Bin wrote:
> > Many thanks Laurent Pinchart for the comments.
> > 
> > On 8/11/2025 8:31 PM, Laurent Pinchart wrote:
> > > On Mon, Aug 11, 2025 at 11:46:27AM +0000, Sakari Ailus wrote:
> > >> On Tue, Jul 29, 2025 at 05:12:03PM +0800, Du, Bin wrote:
> > >>> On 7/28/2025 3:23 PM, Sakari Ailus wrote:
> > >>>> On Wed, Jun 18, 2025 at 05:19:55PM +0800, Bin Du wrote:
> > >>>>> ISP firmware controls ISP HW pipeline using dedicated embedded processor
> > >>>>> called ccpu.
> > >>>>> The communication between ISP FW and driver is using commands and
> > >>>>> response messages sent through the ring buffer. Command buffers support
> > >>>>> either global setting that is not specific to the steam and support stream
> > >>>>> specific parameters. Response buffers contains ISP FW notification
> > >>>>> information such as frame buffer done and command done. IRQ is used for
> > >>>>> receiving response buffer from ISP firmware, which is handled in the main
> > >>>>> isp4 media device. ISP ccpu is booted up through the firmware loading
> > >>>>> helper function prior to stream start.
> > >>>>> Memory used for command buffer and response buffer needs to be allocated
> > >>>>> from amdgpu buffer manager because isp4 is a child device of amdgpu.
> > >>>>
> > >>>> Please rewrap this, some lines above are quite short.
> > >>>>
> > >>> Thanks, the line after the short line is supposed to be a new paragraph?
> > >>> Should we put all the description in one paragraph?
> > >>
> > >> One or more paragraphs work fine, but a new paragraph is separated from the
> > >> previous one by another newline.
> > >>
> > >> ...
> > > 
> > > Paragraphs are defined as a block of text that convey one idea. They
> > > should be visually separated by a space. As we can't have fractional
> > > line spacing in plain text, paragraphs need to be separated by a blank
> > > line. This is a typography rule that maximizes readability. There should
> > > be no line break between sentences in a single paragraph.
> > > 
> > > Whether you write commit messages, formal documentation or comments in
> > > code, typography is important to give the best experience to readers.
> > > After all, a block of text that wouldn't focus on the readers would have
> > > no reason to exist.
> > > 
> > > 
> > > Now compare the above with
> > > 
> > > 
> > > Paragraphs are defined as a block of text that convey one idea. They
> > > should be visually separated by a space.
> > > As we can't have fractional line spacing in plain text, paragraphs need
> > > to be separated by a blank line.
> > > This is a typography rule that maximizes readability. There should be no
> > > line break between sentences in a single paragraph. Whether you write
> > > commit messages, formal documentation or comments in code, typography is
> > > important to give the best experience to readers.
> > > After all, a block of text that wouldn't focus on the readers would have
> > > no reason to exist.
> > 
> > Really appreciate the detailed guide, will follow it. May I summarize 
> > like this? 1 Separate paragraphs by a blank line. 2 Don't add line break 
> > between sentences in a single paragraph, an exception to this is commit 
> > message, because of the 75-character patch check limit, line break can 
> > be added, but it should at the 75-character limit boundary
> 
> When I wrote "line break", I meant breaking the line after a sentence,
> before the 75 columns limits. Text blocks should always be wrapped (at
> 75 columns in commit messages, or 80 in kernel code). What you should
> avoid is line breaks not related to the columns limit.
> 
> This is fine:
> 
> This paragraph has a long sentence that does not hold on a single line
> of 72 characters and therefore needs to be wrapped. There is no line
> break otherwise, for instance between the first and second sentence, or
> within a sentence.
> 
> This is not right:
> 
> This paragraph has a long sentence that does not hold on a single line
> of 72 characters and therefore needs to be wrapped.
> There is a line break between the first and second sentence,
> and also a line break in the second sentence, which are not fine.

I wonder if this should make it to kernel documentation. I've come across
many new developers recently who would definitely benefit from this.

Also, most editors can rewrap paragraphs of text (e.g. Emacs M-q or Joe C-k
C-j).

-- 
Kind regards,

Sakari Ailus

