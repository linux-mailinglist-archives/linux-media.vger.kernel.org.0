Return-Path: <linux-media+bounces-41214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3471EB3941B
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 08:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABAA568642A
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 06:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEAE27A904;
	Thu, 28 Aug 2025 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlgaaPQf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC22238C36;
	Thu, 28 Aug 2025 06:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756363545; cv=none; b=lmc3MnmqYMPQShN/DhrW8/KCAZmctcIvcZDP5A8yFMRc8DOHe2TZWJ/GShwUscHVXJqL7y3n6YOi1V/wkpIjfnCSpxqdOpiqyV698qYXq1lhB4SE9bcHSw6dJAQtBwOaiJP7MZvhXcPHCn5awL7YQbeAvQphvkxPgNyw3Hz1iEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756363545; c=relaxed/simple;
	bh=M4Ol/UZfhcqhi3p7GQnpIV39qjkfR/ShHgpefs9avQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0xlRP5TLy0YjV6z4JIjAxdTjl6fmAM90wKjrVKxf6uzvPglUDuvJ0ycN2keSY18GApg/OtqhAMPVOJFDhP4hP42W6IItoloVxruQvUlZP4knWSkztg/bgvVu3JTPhKYg6TqU+RjYwUJfJDfxeDVXR1hlkmMeUUU0cjFznF+UDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlgaaPQf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756363543; x=1787899543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=M4Ol/UZfhcqhi3p7GQnpIV39qjkfR/ShHgpefs9avQg=;
  b=RlgaaPQfLsbgc5Q7Sse2pmUsN9vaOYSPZmkmg1LpAQxKigeM7JrY6Mj5
   os+ZYaM1aEMwNGU7dEWKsYCl1+Ds81XtM7/FyMwK9qkJa53hCEct7lp3+
   Ui2UisQsHhNOHVNcTufba74VZs5i7UTa7p8QixVG3iyoQzGm4eRQ6FdKz
   gB0MAD1c9UMFiZY/LMU17wchsuNh0QkNffW2CytM1aipwQ4jgH2pY9rlq
   +LZqK+EA4UILc8/fH72DFNj1QcvMEKSg12VnBS+SPC/BmaqzYp8hDXTIL
   h4czaHC7kExtbcoIHRd1FOltarW2bA/Q9JZ/y7sp6AV3Duy17o1HJsl5u
   A==;
X-CSE-ConnectionGUID: 29tHynbNRxGgyZlZKecg1w==
X-CSE-MsgGUID: 1KfdbZ+PRu6/jFvFWpiM5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69331891"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="69331891"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 23:45:42 -0700
X-CSE-ConnectionGUID: cUS4qsHISR2DslNq97DNdg==
X-CSE-MsgGUID: hxVgT/QyTsicRpZANZo8gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="175329055"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.33])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 23:45:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5DAF711FC49;
	Thu, 28 Aug 2025 09:45:37 +0300 (EEST)
Date: Thu, 28 Aug 2025 09:45:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Qianfeng Rong <rongqianfeng@vivo.com>, Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"open list:MT9V111 APTINA CAMERA SENSOR" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] media: i2c: mt9v111: fix incorrect type for ret
Message-ID: <aK_7Ec9pPsYUQmHC@kekkonen.localdomain>
References: <20250827123916.504189-1-rongqianfeng@vivo.com>
 <20250827123916.504189-3-rongqianfeng@vivo.com>
 <xbmwlnflzhfhapyt5dinqqsdurxgu5imlqixudopb7z32eteth@cs7hulza54e3>
 <411e9db5-5339-4527-bb3d-473b339a6572@vivo.com>
 <x3wogjf6vgpkisdhg3abzrx7v7zktmdnfmqeih5kosszmagqfs@oh3qxrgzkikf>
 <8cf9d7a6-9950-4086-8b81-ddaa68639410@vivo.com>
 <bceety6ir4doadxo7zeixc3vve5faewtqhofsilkcjcbppwu4p@zdis66vyayi2>
 <aK_6kuoXr2Es209t@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aK_6kuoXr2Es209t@kekkonen.localdomain>

On Thu, Aug 28, 2025 at 09:43:30AM +0300, Sakari Ailus wrote:
> Hi Jacopo, Qianfeng,
> 
> On Thu, Aug 28, 2025 at 08:40:22AM +0200, Jacopo Mondi wrote:
> > Hi Qianfeng
> > 
> > On Thu, Aug 28, 2025 at 10:08:07AM +0800, Qianfeng Rong wrote:
> > >
> > > 在 2025/8/28 0:24, Jacopo Mondi 写道:
> > > > [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > > >
> > > > Hi Qianfeng
> > > >
> > > > On Wed, Aug 27, 2025 at 11:41:26PM +0800, Qianfeng Rong wrote:
> > > > > 在 2025/8/27 20:58, Jacopo Mondi 写道:
> > > > > > [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > > > > >
> > > > > > Hi Qianfeng
> > > > > >
> > > > > > On Wed, Aug 27, 2025 at 08:39:10PM +0800, Qianfeng Rong wrote:
> > > > > > > Change "ret" from unsigned int to int type in mt9v111_calc_frame_rate()
> > > > > > > to store negative error codes or zero returned by __mt9v111_hw_reset()
> > > > > > > and other functions.
> > > > > > >
> > > > > > > Storing the negative error codes in unsigned type, doesn't cause an issue
> > > > > > > at runtime but it's ugly as pants.
> > > > > > >
> > > > > > > No effect on runtime.
> > > > > > well, I'm not sure that's true.
> > > > > >
> > > > > > The code goes as
> > > > > >
> > > > > >           ret = __mt9v111_hw_reset(mt9v111);
> > > > > >           if (ret == -EINVAL)
> > > > > >                   ret = __mt9v111_sw_reset(mt9v111);
> > > > > >           if (ret)
> > > > > >                   return ret;
> > > > > >
> > > > > > And if ret is unsigned the condition ret == -EINVAL will never be met.
> > > > > >
> > > > > > I guess this actually fixes a bug, doesn't it ?
> > > > > > You can add:
> > > > > >
> > > > > > Cc: stable@vger.kernel.org
> > > > > > Fixes: aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
> > > > > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > >
> > > > > > Thanks
> > > > > >     j
> > > > > I have written a test program on the arm64 platform:
> > > > >
> > > > > unsigned int ret = -ENOMEM;
> > > > >
> > > > > if (ret == -ENOMEM)
> > > > >      pr_info("unsigned int ret(%u) == -ENOMEM\n", ret);
> > > > > else
> > > > >      pr_info("unsigned int ret(%u) != -ENOMEM\n", ret);
> > > > >
> > > > > Output log is: unsigned int ret(4294967284) == -ENOMEM
> > > > Indeed, I was very wrong and ignoring the C integer promotion rules.
> > > >
> > > > If I read right the "6.3.1.8 Usual arithmetic conversions" section of
> > > > the C11 specs I found freely available online (ISO/IEC 9899:201x), in
> > > > particular:
> > > >
> > > > if the operand that has unsigned integer type has rank greater or
> > > > equal to the rank of the type of the other operand, then the operand with
> > > > signed integer type is converted to the type of the operand with unsigned
> > > > integer type.
> > > >
> > > > Indeed the above doesn't introduce any functional change (as the
> > > > 'rank' of an unsigned int is the same as the one of an int [1])
> > > >
> > > > I would anyway consider it at least a "logical" fix, as comparing an
> > > > unsigned int to a negative error code is misleading for the reader at
> > > > the least.
> > > >
> > > > Thanks anyway for testing.
> > > >
> > > > [1] Section "6.3.1.1"
> > > > The rank of any unsigned integer type shall equal the rank of the corresponding
> > > > signed integer type, if any.
> > >
> > >
> > > Thank you for letting me know about this.  It's a great learning experience
> > > through our discussions-cheers!
> > >
> > > Do I still need to submit the v2 version with the following additions?
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > 
> > I would do so anyway, yes.
> > 
> > For sure you can keep my tag ;)
> 
> No need to resend on my behalf -- it'll be just some additional Patchwork
> churn.

I missed there were four other patches. If you intend to add Fixes: tags to
them, too, I'd resend the set. But if there was no actual bug, it should be
fine as-is.

-- 
Sakari Ailus

