Return-Path: <linux-media+bounces-41213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 098B7B3940C
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 08:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B78A24615E0
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 06:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20902283FE2;
	Thu, 28 Aug 2025 06:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDORU8VC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F6B2459E1;
	Thu, 28 Aug 2025 06:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756363417; cv=none; b=GT3zyHsJbiCr3Lmtf5enS76xtfUopuNvKsbu/9a8dRUvo/zmrxzcs3BWRFGNwQY39LMYjhrvQTEDfZC6FAo931HQgoeovTclkGBEk+DaDIJKtNRemLEwA55zUop+EAhRQ8jN2CHjI0NN9zAXlBw6d+34x2uAewnkFk9tsYN1FYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756363417; c=relaxed/simple;
	bh=M7DlXuvjNRvbxDjfU6Hgqq3z7Tettns8ZF0GBofznLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tz+hh24aJUnmHaYyzbpy3UsVYs5R5pFFZGoKmOWuyTj4WTSMZ3vbKey0JPiUkPnIyeMh8w3ezJXY6Cp0mq9TcgO0v1JVemzgqMnnLhgw02EcTNRm+iYrh38LVOS2PGHwMnQNm3W5S3Y8lmmAg7V8FT1u4j3sw9KhAXJIoVbDtGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDORU8VC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756363416; x=1787899416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=M7DlXuvjNRvbxDjfU6Hgqq3z7Tettns8ZF0GBofznLE=;
  b=hDORU8VCf6UxUVv7jPyj40G9K0633wC7zcdHwaa8c8HIwQyr0wv1tK7g
   rxIWiLBQWKBnAy8mSRf1/TL74kDGlwE8Ze4sbmDwCaBsPVt1IbUzP0nz5
   9sSFnfY0e8uzJt55eHVZ7FZz/8XCxXaAcMZZbhoD9338X9fFGug5egvLz
   rm9s7tw7yO2LZ9zweoIwobZnaG3OiQdNmqyW5Sh5J+GRRr3BvCUcFTpBS
   nH0j1PWoiIKfRR+S+6LU3IoQ+ewnsjejJmVyTAQUUyXs6p/kE1XNhEr9I
   mkBoczz6TppMy6zQGOn+flomVQm7iuioxZvo81z0scJEHFWkKgAjl3woI
   A==;
X-CSE-ConnectionGUID: HzwC42OLTIWgdiNAuelLCA==
X-CSE-MsgGUID: v3KrmNF3QXS7+lqYpKgkBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62457456"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62457456"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 23:43:35 -0700
X-CSE-ConnectionGUID: oGkqi8Y3S/a3fQK65jqtug==
X-CSE-MsgGUID: YVyzVa03QxG78bszNklgEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="174203151"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.33])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 23:43:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BA2B611FC49;
	Thu, 28 Aug 2025 09:43:30 +0300 (EEST)
Date: Thu, 28 Aug 2025 09:43:30 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Qianfeng Rong <rongqianfeng@vivo.com>, Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"open list:MT9V111 APTINA CAMERA SENSOR" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] media: i2c: mt9v111: fix incorrect type for ret
Message-ID: <aK_6kuoXr2Es209t@kekkonen.localdomain>
References: <20250827123916.504189-1-rongqianfeng@vivo.com>
 <20250827123916.504189-3-rongqianfeng@vivo.com>
 <xbmwlnflzhfhapyt5dinqqsdurxgu5imlqixudopb7z32eteth@cs7hulza54e3>
 <411e9db5-5339-4527-bb3d-473b339a6572@vivo.com>
 <x3wogjf6vgpkisdhg3abzrx7v7zktmdnfmqeih5kosszmagqfs@oh3qxrgzkikf>
 <8cf9d7a6-9950-4086-8b81-ddaa68639410@vivo.com>
 <bceety6ir4doadxo7zeixc3vve5faewtqhofsilkcjcbppwu4p@zdis66vyayi2>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bceety6ir4doadxo7zeixc3vve5faewtqhofsilkcjcbppwu4p@zdis66vyayi2>

Hi Jacopo, Qianfeng,

On Thu, Aug 28, 2025 at 08:40:22AM +0200, Jacopo Mondi wrote:
> Hi Qianfeng
> 
> On Thu, Aug 28, 2025 at 10:08:07AM +0800, Qianfeng Rong wrote:
> >
> > 在 2025/8/28 0:24, Jacopo Mondi 写道:
> > > [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > Hi Qianfeng
> > >
> > > On Wed, Aug 27, 2025 at 11:41:26PM +0800, Qianfeng Rong wrote:
> > > > 在 2025/8/27 20:58, Jacopo Mondi 写道:
> > > > > [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > > > >
> > > > > Hi Qianfeng
> > > > >
> > > > > On Wed, Aug 27, 2025 at 08:39:10PM +0800, Qianfeng Rong wrote:
> > > > > > Change "ret" from unsigned int to int type in mt9v111_calc_frame_rate()
> > > > > > to store negative error codes or zero returned by __mt9v111_hw_reset()
> > > > > > and other functions.
> > > > > >
> > > > > > Storing the negative error codes in unsigned type, doesn't cause an issue
> > > > > > at runtime but it's ugly as pants.
> > > > > >
> > > > > > No effect on runtime.
> > > > > well, I'm not sure that's true.
> > > > >
> > > > > The code goes as
> > > > >
> > > > >           ret = __mt9v111_hw_reset(mt9v111);
> > > > >           if (ret == -EINVAL)
> > > > >                   ret = __mt9v111_sw_reset(mt9v111);
> > > > >           if (ret)
> > > > >                   return ret;
> > > > >
> > > > > And if ret is unsigned the condition ret == -EINVAL will never be met.
> > > > >
> > > > > I guess this actually fixes a bug, doesn't it ?
> > > > > You can add:
> > > > >
> > > > > Cc: stable@vger.kernel.org
> > > > > Fixes: aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
> > > > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > >
> > > > > Thanks
> > > > >     j
> > > > I have written a test program on the arm64 platform:
> > > >
> > > > unsigned int ret = -ENOMEM;
> > > >
> > > > if (ret == -ENOMEM)
> > > >      pr_info("unsigned int ret(%u) == -ENOMEM\n", ret);
> > > > else
> > > >      pr_info("unsigned int ret(%u) != -ENOMEM\n", ret);
> > > >
> > > > Output log is: unsigned int ret(4294967284) == -ENOMEM
> > > Indeed, I was very wrong and ignoring the C integer promotion rules.
> > >
> > > If I read right the "6.3.1.8 Usual arithmetic conversions" section of
> > > the C11 specs I found freely available online (ISO/IEC 9899:201x), in
> > > particular:
> > >
> > > if the operand that has unsigned integer type has rank greater or
> > > equal to the rank of the type of the other operand, then the operand with
> > > signed integer type is converted to the type of the operand with unsigned
> > > integer type.
> > >
> > > Indeed the above doesn't introduce any functional change (as the
> > > 'rank' of an unsigned int is the same as the one of an int [1])
> > >
> > > I would anyway consider it at least a "logical" fix, as comparing an
> > > unsigned int to a negative error code is misleading for the reader at
> > > the least.
> > >
> > > Thanks anyway for testing.
> > >
> > > [1] Section "6.3.1.1"
> > > The rank of any unsigned integer type shall equal the rank of the corresponding
> > > signed integer type, if any.
> >
> >
> > Thank you for letting me know about this.  It's a great learning experience
> > through our discussions-cheers!
> >
> > Do I still need to submit the v2 version with the following additions?
> >
> > Cc: stable@vger.kernel.org
> > Fixes: aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> I would do so anyway, yes.
> 
> For sure you can keep my tag ;)

No need to resend on my behalf -- it'll be just some additional Patchwork
churn.

b4 apparently applied the rest of the tags except Cc:; I'll add that.

Thanks!

-- 
Kind regards,

Sakari Ailus

