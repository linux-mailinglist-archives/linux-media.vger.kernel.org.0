Return-Path: <linux-media+bounces-50400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC8D116A2
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CA72308792F
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 09:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5700834678B;
	Mon, 12 Jan 2026 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QK+sdNAK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09319320A31;
	Mon, 12 Jan 2026 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768208814; cv=none; b=A+QeinKHHM7Cz0gvEBDhxcqM7Eh3AealQ/Jpn+awH588F00oXz04v+sI9Ya1pu/TCxPFbKRZ8HtB/tObKVsZn1+t4aqyt9kObPbav0z45vpPkHEwRvUi213TJiC6DqstAiE5p3Qu0m4NR5yFRzGaLCTWtRvk9DFgicJ5fsmawh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768208814; c=relaxed/simple;
	bh=YXQwUi6CbHLP0TzMIivNOpRsW/+ra/2WlhvdJDlywXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBDnRz9GM9UhmnIyF++DcbdGhlGAjQVgq8rrjuQSIMZ0gxjYe4Q39ZtbBTiFMM7xPVzJmZvVd6OWQ6iYuch128Ys3qSt/gDFZtCbH5ZxL12aRtmdZ/3Cq++jOSq4b1rL+bvXEQvW1uuS/6cUDs7saZe1KDr55F6AGpF9l7QoUCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QK+sdNAK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768208813; x=1799744813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YXQwUi6CbHLP0TzMIivNOpRsW/+ra/2WlhvdJDlywXA=;
  b=QK+sdNAKIr2N+i1XyZAlyFzOIjcQdBgqCnoaydhKgD9AWGA1Hlqv4wOH
   fCFDOaTI6APZpp9OEc3Af/vPgEPSITSDlC8uU5dJy3L0GjoqFntFp+9oG
   00sBzU1hVKpOe/Js6fzYHWRQsZsYpoUelYBzrTxl/oXvRpmts5uckUhCg
   zxjJYTz8FpcmS1lM32APoamUTQSZlk2dJpygz7olNmgyIYPqujvZ8T4M7
   bBpV9RiR2GPajoviX3XfMY0VYsfwQPj7Hbo0FmNrVXJgTuVNjddBZoe2h
   swOYRQuHSlOqDHs8mwkKaSXpCTCePRXNLKUQ3riqqZCZl6jOpKHT90VcE
   w==;
X-CSE-ConnectionGUID: vZXfiT9xQNeAB1eTCWPq8A==
X-CSE-MsgGUID: tp2c6BTAT76VLTVb0ClrLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="92146485"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="92146485"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:06:52 -0800
X-CSE-ConnectionGUID: 8qZxiBSgT46TXyCBn6s6SQ==
X-CSE-MsgGUID: mhP6ojN2QHacUb6+tklSUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204058135"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:06:51 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E7AB4121DC3;
	Mon, 12 Jan 2026 11:06:48 +0200 (EET)
Date: Mon, 12 Jan 2026 11:06:48 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: imx412: wait for NVM read (T7) before
 programming mode registers
Message-ID: <aWS5qIA1Hfrr-3Yb@kekkonen.localdomain>
References: <tjF2Z2nt6dR-T_d-5cSpzZqItgoMsUzNmUBQ-jucG9SMQ9Q4y9cCrW4aya-hRJR0dQG-q63OBmZajTWMbxfeUA==@protonmail.internalid>
 <20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com>
 <dc68db73-163e-4443-b334-31e2ae529e99@kernel.org>
 <1344ad43-a4c4-4e37-ae4e-eddd2c577b3f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344ad43-a4c4-4e37-ae4e-eddd2c577b3f@oss.qualcomm.com>

Hi Wenmeng, Bryan,

On Mon, Jan 12, 2026 at 11:07:39AM +0800, Wenmeng Liu wrote:
> 
> 
> On 1/9/2026 8:32 PM, Bryan O'Donoghue wrote:
> > This delay should go at the end of the operation that requires the delay
> > not at the start of the streaming operation.

I would have thought that, too, but I understand there's an issue with an
Arducam module. It's also not exactly clear to me if all other registers
are writable at the sensor identification time or is the required delay
only concerning starting streaming (I'd hope so).

Also see
<URL:https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/pm-resume-delay>.
I haven't posted these yet, but I think it'd be useful to avoid extra
delays here and elsewhere.

> > 
> > The delay after the stream write, should be related to the stream write
> > command, not the antecedent - the command that came before
> > start_streaming.
> > 
> > Basically I think you need to put your delay into the CCI_ID read NVM
> > parameter load routine so that it guarantees its own completion.
> > 
> > Because for argument's sake if start_streaming() were not to be the
> > thing to happen after CCI_ID/NVM loading, the logic would no longer
> > work.
> > 
> > And you need a Fixes: tag for this patch too.
> 
> Reading the sensor ID only occurs during the sensor probe process. After the
> probe is completed, the IMX577 will power down. When stream on occurs, the
> driver will power on again and then start streaming, but the sensor ID is
> not read during the stream on process.I have tested this change on imx577
> modules of different models.
> 
> So this change can only happen during power on or stream on.
> 
> Hi Bryan, Sakari,
> May I ask if you have any suggestions regarding this?

Could you add a comment this delay is there for the Arducam module (and
which one), that doesn't work without it?

-- 
Kind regards,

Sakari Ailus

