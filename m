Return-Path: <linux-media+bounces-36894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEB2AFA3DA
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 11:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F04E7172F79
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 09:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DCB1EF09D;
	Sun,  6 Jul 2025 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fD8M5i1J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2267735972;
	Sun,  6 Jul 2025 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751793073; cv=none; b=TNTiNrkBxWpE6VcUTW7E5IxquywFqPo0Nyin/2o4gOandsgojmAN2OCtQGr1M386n8gx7bF5o98kWLGGaxfsi3o9Cz1huZPgzSaDP30JBNcSmEFJ8aNlfZG22jWE0mD3DiCBNZ3b0krUcW6jejyx/use09gS5kio2Cmw3JCrufI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751793073; c=relaxed/simple;
	bh=4/MwW2GFqctxs8AwHFUVz/ovktRzCYfQs/DtWq+q+Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJ0O/O/vDud9KEZAAj1VIqTRBaN+VRCq6Lk5DYv0k2ERfU4x4zctrvSVlG60nrbIxYmiP0NKZrIgfu1s9ZF6ZXVjWmxn6QCLUXObw3dKkAo3+ElUaRo0N02vL2dCA8oGFXLxqzQtAd59E3m3yK2L/McEvzaX5oSwGxnu7gWjTaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fD8M5i1J; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751793072; x=1783329072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4/MwW2GFqctxs8AwHFUVz/ovktRzCYfQs/DtWq+q+Tc=;
  b=fD8M5i1JVv48UnHC/ZSXjbJVLYFMZrw0T4Xn+dmCZr8tK0Hh/2lFD5Rc
   G2vOxpR8R+HU+jDUl3UurFVvd+RweAKbcvq+e8tunsW6JYYplgFktb7Kr
   QFU5slizzVUKz57rHUThdYn4xYosBH63T5xLm9ayfKv6njGYFrpY93YXv
   YUpxl49foRoJsNxHpzKSARDr5FGY/4q3Atqph9RBtBiLklDgvdyw9y8z6
   T0KhnNE1eiylHhB44DUG32lPBTqsVFvxI1/wIj/HJf8ylxKCgGbTD7Bef
   71Ipa/EV4xnqIrTxaUDiJUxWQDsGqRo7JuFBDNqPekUKKwlVdPHM5s8hI
   w==;
X-CSE-ConnectionGUID: FWwHqtZcRnyyjacCtiJ7jg==
X-CSE-MsgGUID: JlzNgX1oQ06UgHmuI5N8mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="54008307"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="54008307"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 02:11:12 -0700
X-CSE-ConnectionGUID: jOcQzLO/Q36lCbTAGdlLzQ==
X-CSE-MsgGUID: BBERMaveRQeTDCeutEmg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="158989402"
Received: from johunt-mobl9.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.198])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 02:11:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6E1A91202F1;
	Sun,  6 Jul 2025 12:11:12 +0300 (EEST)
Date: Sun, 6 Jul 2025 09:11:12 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Nirujogi, Pratap" <pnirujog@amd.com>
Cc: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hao Yao <hao.yao@intel.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
	jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com,
	king.li@amd.com, dantony@amd.com, vengutta@amd.com,
	dongcheng.yan@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <aGo9sDWSiZGvOhR4@kekkonen.localdomain>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <20250614225257.GO10542@pendragon.ideasonboard.com>
 <f6d1d8f7-d953-4f86-a196-f713726bd5f8@amd.com>
 <ec790d0e-4bdb-49b9-80ad-f44e1b700a5e@linux.intel.com>
 <702594a4-ebc3-471e-8551-d94f0dee2982@amd.com>
 <0d45fca3-5b6f-42e5-acec-bca2dda25f15@linux.intel.com>
 <aGTN5PbfyHTw529O@svinhufvud>
 <91985c5e-fc69-4d12-b5b0-3dff0ba1b078@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91985c5e-fc69-4d12-b5b0-3dff0ba1b078@amd.com>

Hi Pratap,

On Wed, Jul 02, 2025 at 12:47:40PM -0400, Nirujogi, Pratap wrote:
> > > If you have a spec of OV05C10 (I assume you do, as the developer of this
> > > driver), it is not a issue.
> > > Take P0:0x14 as an example, it's named as DPLL_NC_SEL in spec and set to
> > > 0x78 in your reglist ov05c10_2888x1808_regs. If define all named
> > > registers rather than the confusing magic hardcode, the driver code will
> > > be more readable and easy to review.
> > > I think this is what Sakari thought.
> > 
> > Yes. And even if it happens that a register write slips to a wrong list,
> > we can fix it later.
> > 
> I agree with the suggestion on proper naming of register offsets, but
> unfortunately we lack access to the spec. We are completely relying on the
> sensor vendor for these sequences, which they are not willing to share the
> details.

I find it difficult to believe a company such as AMD would use a camera
sensor without having documentation on it. It is essentially required for
hardware design, too.

Have you asked around?

-- 
Kind regards,

Sakari Ailus

