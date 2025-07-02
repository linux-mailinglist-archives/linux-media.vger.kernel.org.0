Return-Path: <linux-media+bounces-36501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 016DCAF0B61
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 08:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B75713B6A1B
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 06:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AA220A5EB;
	Wed,  2 Jul 2025 06:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRIudNsQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25910F9;
	Wed,  2 Jul 2025 06:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751436788; cv=none; b=Q2ahYMuzpM7t/GFT/c13FF9t4/j81R40hoUCJanwryDt8zAKesivlHdLBTnAJjIeVH1F1+Et5SA/uliVbpES4p/R5od49lzIsO4cNwkxUIfHqMSsvhXNUsuMEU0Yx9Wx8UQDk8WqI1CvJ6eq8Y8dWnM1CwDUl8ZqMku7jrTxBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751436788; c=relaxed/simple;
	bh=RuXcJnHnMBSm7KBXV++9qAcB1WdxHm4Igl4BzqjwcqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W29EJDIm2tw63rlcif4oVqHrrExDutbk0Sr/U5NsLJM/2diWFgWUePtkWcuQlTg952jCAbcdpvdpHCqcuNz3C5GLrZYcej9F00CEiE16y7SG3W+aQG0qLydrwftKl0FTbG2WCxwqoyTdE6ANzbgEuAmEMtRSdF409Y5k9mMcsPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRIudNsQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751436787; x=1782972787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RuXcJnHnMBSm7KBXV++9qAcB1WdxHm4Igl4BzqjwcqU=;
  b=GRIudNsQe9XxYd7aL/2LTQkTRUAAgdPWwhSu9zPFIaR28B8GFDYeAF1M
   jddg6Txk0cXgZ1Q7G5D0SPcIcNleeJJhrHzwTSmSx1LNhnKhdHB8XleWd
   M5XFNvz5BHY5bS557q9pwoCcSymLwJjqV6+yzX4lrz+OY4zHCJjqBLsIP
   03IQrn1RrvPoM+7LiFwIleFv3CxGkwETW+cjVDzECKzl5dTyWsEWGtZBS
   R8bxLSzIP0QATi8b+mKyCWpwITI9Bje895einU/bMGrccivndPW8CYgbe
   fxO4fjUTQeCzLNqaLacBU4JLKDH7yFFxA5ZZMateEUZoV77+ZFapYHkoA
   w==;
X-CSE-ConnectionGUID: X5AzhQtTT/uorZfkK+PpDA==
X-CSE-MsgGUID: IdiqThBAQHWE6r5qEP26OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71145348"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="71145348"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 23:13:05 -0700
X-CSE-ConnectionGUID: BXrY2u5TR7S4OJNg1T4UTA==
X-CSE-MsgGUID: M+BfM0soSXShxmL9ODZYrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="185021874"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.245.162])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 23:12:59 -0700
Received: from svinhufvud (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTPS id 76A4244369;
	Wed,  2 Jul 2025 09:12:53 +0300 (EEST)
Date: Wed, 2 Jul 2025 09:12:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
Cc: "Nirujogi, Pratap" <pnirujog@amd.com>,
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
Message-ID: <aGTN5PbfyHTw529O@svinhufvud>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <20250614225257.GO10542@pendragon.ideasonboard.com>
 <f6d1d8f7-d953-4f86-a196-f713726bd5f8@amd.com>
 <ec790d0e-4bdb-49b9-80ad-f44e1b700a5e@linux.intel.com>
 <702594a4-ebc3-471e-8551-d94f0dee2982@amd.com>
 <0d45fca3-5b6f-42e5-acec-bca2dda25f15@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d45fca3-5b6f-42e5-acec-bca2dda25f15@linux.intel.com>

Hi Dongcheng, Pratap,

On Wed, Jul 02, 2025 at 02:08:26PM +0800, Yan, Dongcheng wrote:
> Hi Pratap,
> 
> On 7/1/2025 6:31 AM, Nirujogi, Pratap wrote:
> > Hi Sakari, Hi Laurent,
> > 
> > On 6/29/2025 3:40 AM, Sakari Ailus wrote:
> >> Caution: This message originated from an External Source. Use proper
> >> caution when opening attachments, clicking links, or responding.
> >>
> >>
> >> Hi Pratap,
> >>
> >> On 6/17/25 01:33, Nirujogi, Pratap wrote:
> >> ...
> >>>>>>> +static const struct cci_reg_sequence ov05c10_2888x1808_regs[] = {
> >>>>>>> + { CCI_REG8(0xfd),  0x00 },
> >>>>>>> + { CCI_REG8(0x20),  0x00 },
> >>>>>>> + { CCI_REG8(0xfd),  0x00 },
> >>>>>>> + { CCI_REG8(0x20),  0x0b },
> >>>>>>> + { CCI_REG8(0xc1),  0x09 },
> >>>>>>> + { CCI_REG8(0x21),  0x06 },
> >>>>>>> + { CCI_REG8(0x14),  0x78 },
> >>>>>>> + { CCI_REG8(0xe7),  0x03 },
> >>>>>>> + { CCI_REG8(0xe7),  0x00 },
> >>>>>>> + { CCI_REG8(0x21),  0x00 },
> >>>>>>> + { CCI_REG8(0xfd),  0x01 },
> >>>>>>> + { CCI_REG8(0x03),  0x00 },
> >>>>>>> + { CCI_REG8(0x04),  0x06 },
> >>>>>>> + { CCI_REG8(0x05),  0x07 },
> >>>>>>> + { CCI_REG8(0x06),  0x44 },
> >>>>>>> + { CCI_REG8(0x07),  0x08 },
> >>>>>>> + { CCI_REG8(0x1b),  0x01 },
> >>>>>>> + { CCI_REG8(0x24),  0xff },
> >>>>>>> + { CCI_REG8(0x32),  0x03 },
> >>>>>>> + { CCI_REG8(0x42),  0x5d },
> >>>>>>> + { CCI_REG8(0x43),  0x08 },
> >>>>>>> + { CCI_REG8(0x44),  0x81 },
> >>>>>>> + { CCI_REG8(0x46),  0x5f },
> >>>>>>> + { CCI_REG8(0x48),  0x18 },
> >>>>>>> + { CCI_REG8(0x49),  0x04 },
> >>>>>>> + { CCI_REG8(0x5c),  0x18 },
> >>>>>>> + { CCI_REG8(0x5e),  0x13 },
> >>>>>>> + { CCI_REG8(0x70),  0x15 },
> >>>>>>> + { CCI_REG8(0x77),  0x35 },
> >>>>>>> + { CCI_REG8(0x79),  0x00 },
> >>>>>>> + { CCI_REG8(0x7b),  0x08 },
> >>>>>>> + { CCI_REG8(0x7d),  0x08 },
> >>>>>>> + { CCI_REG8(0x7e),  0x08 },
> >>>>>>> + { CCI_REG8(0x7f),  0x08 },
> >>>>>>> + { CCI_REG8(0x90),  0x37 },
> >>>>>>> + { CCI_REG8(0x91),  0x05 },
> >>>>>>> + { CCI_REG8(0x92),  0x18 },
> >>>>>>> + { CCI_REG8(0x93),  0x27 },
> >>>>>>> + { CCI_REG8(0x94),  0x05 },
> >>>>>>> + { CCI_REG8(0x95),  0x38 },
> >>>>>>> + { CCI_REG8(0x9b),  0x00 },
> >>>>>>> + { CCI_REG8(0x9c),  0x06 },
> >>>>>>> + { CCI_REG8(0x9d),  0x28 },
> >>>>>>> + { CCI_REG8(0x9e),  0x06 },
> >>>>>>> + { CCI_REG8(0xb2),  0x0f },
> >>>>>>> + { CCI_REG8(0xb3),  0x29 },
> >>>>>>> + { CCI_REG8(0xbf),  0x3c },
> >>>>>>> + { CCI_REG8(0xc2),  0x04 },
> >>>>>>> + { CCI_REG8(0xc4),  0x00 },
> >>>>>>> + { CCI_REG8(0xca),  0x20 },
> >>>>>>> + { CCI_REG8(0xcb),  0x20 },
> >>>>>>> + { CCI_REG8(0xcc),  0x28 },
> >>>>>>> + { CCI_REG8(0xcd),  0x28 },
> >>>>>>> + { CCI_REG8(0xce),  0x20 },
> >>>>>>> + { CCI_REG8(0xcf),  0x20 },
> >>>>>>> + { CCI_REG8(0xd0),  0x2a },
> >>>>>>> + { CCI_REG8(0xd1),  0x2a },
> >>>>>>> + { CCI_REG8(0xfd),  0x0f },
> >>>>>>> + { CCI_REG8(0x00),  0x00 },
> >>>>>>> + { CCI_REG8(0x01),  0xa0 },
> >>>>>>> + { CCI_REG8(0x02),  0x48 },
> >>>>>>> + { CCI_REG8(0x07),  0x8f },
> >>>>>>> + { CCI_REG8(0x08),  0x70 },
> >>>>>>> + { CCI_REG8(0x09),  0x01 },
> >>>>>>> + { CCI_REG8(0x0b),  0x40 },
> >>>>>>> + { CCI_REG8(0x0d),  0x07 },
> >>>>>>> + { CCI_REG8(0x11),  0x33 },
> >>>>>>> + { CCI_REG8(0x12),  0x77 },
> >>>>>>> + { CCI_REG8(0x13),  0x66 },
> >>>>>>> + { CCI_REG8(0x14),  0x65 },
> >>>>>>> + { CCI_REG8(0x15),  0x37 },
> >>>>>>> + { CCI_REG8(0x16),  0xbf },
> >>>>>>> + { CCI_REG8(0x17),  0xff },
> >>>>>>> + { CCI_REG8(0x18),  0xff },
> >>>>>>> + { CCI_REG8(0x19),  0x12 },
> >>>>>>> + { CCI_REG8(0x1a),  0x10 },
> >>>>>>> + { CCI_REG8(0x1c),  0x77 },
> >>>>>>> + { CCI_REG8(0x1d),  0x77 },
> >>>>>>> + { CCI_REG8(0x20),  0x0f },
> >>>>>>> + { CCI_REG8(0x21),  0x0f },
> >>>>>>> + { CCI_REG8(0x22),  0x0f },
> >>>>>>> + { CCI_REG8(0x23),  0x0f },
> >>>>>>> + { CCI_REG8(0x2b),  0x20 },
> >>>>>>> + { CCI_REG8(0x2c),  0x20 },
> >>>>>>> + { CCI_REG8(0x2d),  0x04 },
> >>>>>>> + { CCI_REG8(0xfd),  0x03 },
> >>>>>>> + { CCI_REG8(0x9d),  0x0f },
> >>>>>>> + { CCI_REG8(0x9f),  0x40 },
> >>>>>>> + { CCI_REG8(0xfd),  0x00 },
> >>>>>>> + { CCI_REG8(0x20),  0x1b },
> >>>>>>> + { CCI_REG8(0xfd),  0x04 },
> >>>>>>> + { CCI_REG8(0x19),  0x60 },
> >>>>>>> + { CCI_REG8(0xfd),  0x02 },
> >>>>>>> + { CCI_REG8(0x75),  0x05 },
> >>>>>>> + { CCI_REG8(0x7f),  0x06 },
> >>>>>>> + { CCI_REG8(0x9a),  0x03 },
> >>>>>>> + { CCI_REG8(0xa2),  0x07 },
> >>>>>>> + { CCI_REG8(0xa3),  0x10 },
> >>>>>>> + { CCI_REG8(0xa5),  0x02 },
> >>>>>>> + { CCI_REG8(0xa6),  0x0b },
> >>>>>>> + { CCI_REG8(0xa7),  0x48 },
> >>>>>>> + { CCI_REG8(0xfd),  0x07 },
> >>>>>>> + { CCI_REG8(0x42),  0x00 },
> >>>>>>> + { CCI_REG8(0x43),  0x80 },
> >>>>>>> + { CCI_REG8(0x44),  0x00 },
> >>>>>>> + { CCI_REG8(0x45),  0x80 },
> >>>>>>> + { CCI_REG8(0x46),  0x00 },
> >>>>>>> + { CCI_REG8(0x47),  0x80 },
> >>>>>>> + { CCI_REG8(0x48),  0x00 },
> >>>>>>> + { CCI_REG8(0x49),  0x80 },
> >>>>>>> + { CCI_REG8(0x00),  0xf7 },
> >>>>>>> + { CCI_REG8(0xfd),  0x00 },
> >>>>>>> + { CCI_REG8(0xe7),  0x03 },
> >>>>>>> + { CCI_REG8(0xe7),  0x00 },
> >>>>>>> + { CCI_REG8(0xfd),  0x00 },
> >>>>>>> + { CCI_REG8(0x93),  0x18 },
> >>>>>>> + { CCI_REG8(0x94),  0xff },
> >>>>>>> + { CCI_REG8(0x95),  0xbd },
> >>>>>>> + { CCI_REG8(0x96),  0x1a },
> >>>>>>> + { CCI_REG8(0x98),  0x04 },
> >>>>>>> + { CCI_REG8(0x99),  0x08 },
> >>>>>>> + { CCI_REG8(0x9b),  0x10 },
> >>>>>>> + { CCI_REG8(0x9c),  0x3f },
> >>>>>>> + { CCI_REG8(0xa1),  0x05 },
> >>>>>>> + { CCI_REG8(0xa4),  0x2f },
> >>>>>>> + { CCI_REG8(0xc0),  0x0c },
> >>>>>>> + { CCI_REG8(0xc1),  0x08 },
> >>>>>>> + { CCI_REG8(0xc2),  0x00 },
> >>>>>>> + { CCI_REG8(0xb6),  0x20 },
> >>>>>>> + { CCI_REG8(0xbb),  0x80 },
> >>>>>>> + { CCI_REG8(0xfd),  0x00 },
> >>>>>>> + { CCI_REG8(0xa0),  0x01 },
> >>>>>>> + { CCI_REG8(0xfd),  0x01 },
> >>>>
> >>>> Please replace these with names macros where possible. I'm sure quite a
> >>>> few of the registers configured here are documented in the datasheet.
> >>>> The registers that configure the mode (analog crop, digital crop,
> >>>> binning, skipping, ...) should be computed dynamically from the subdev
> >>>> pad format and selection rectangles, not hardcoded.
> >>>>
> >>> I agree, but we get the sensor settings based on our requirements from
> >>> the vendor, i will check if we can get some more info regarding the
> >>> crop, binning, skipping etc...
> >>
> >> Some of this infomation should be available in the datasheet. Use at
> >> least the register names that can be found, for those that can't there's
> >> not much that could be done.
> >>
> > Sorry to say that I don't have the details in this case. We have
> > previously reached out to the sensor vendor, but they are not willing to
> > disclose any of these details. We hope for your understanding of the
> > constraints we're facing and truly value your support.
> > 
> 
> If you have a spec of OV05C10 (I assume you do, as the developer of this
> driver), it is not a issue.
> Take P0:0x14 as an example, it's named as DPLL_NC_SEL in spec and set to
> 0x78 in your reglist ov05c10_2888x1808_regs. If define all named
> registers rather than the confusing magic hardcode, the driver code will
> be more readable and easy to review.
> I think this is what Sakari thought.

Yes. And even if it happens that a register write slips to a wrong list,
we can fix it later.

-- 
Kind regards,

Sakari Ailus

