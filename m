Return-Path: <linux-media+bounces-40833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4217B32C09
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 22:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D88C682800
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 20:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BB622836C;
	Sat, 23 Aug 2025 20:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqzXa311"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0507120C001
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755982305; cv=none; b=jcasEuEaA80xrSOnRlEX0YqVS753RomutE76AYklfNb48ZmsUqPfzHHsYXkJjUN3ou5/8p8EohMoGSP2JRw+vs5/4gvu2wIfT8yQuHBKLDwYsMzDqDCQgcnZ1NOjpMdBkswRQLYMcQlzMwgZItCqg2PF0ef2Zfgh7QCFsqhuS0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755982305; c=relaxed/simple;
	bh=xTNU2V1qh2SxQBCX9PyAL2AVe5HU2+Jjj8s5D+OKLNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krJk+SruvyBgmJCynAQ1NJaM7ajhcCdNHeknx4AL3F6oisy4e8ldOFKTF9VuA4AKX7fxxOHaA3r4ZEHzEDBlNoL5AhHy2lp9HUsnUK3vU5+9PDzFOQOnKRSDkeCIIjXHEYmm7QsxnNOkYWTe1e7jieTDbrD8qUGDrG8y7ihMEwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqzXa311; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755982304; x=1787518304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xTNU2V1qh2SxQBCX9PyAL2AVe5HU2+Jjj8s5D+OKLNw=;
  b=BqzXa311Sw3wZQvw9OU+c5wbvuRxDTHrj2aLdK4z5eG7WLL9y7nJRKzt
   3RvyLo35gWNkmUbBrKdZIZD3A51yBjBizSIyuyjio4VpOGGSHo38n9Xgs
   yhzXHvmhQABkDOBoZkbB5jheJlCJUM/BZiIHaxK9X8m7ZIZ5jqduAskjb
   +xguxxQuzLJ+iNI/ZQzHDH9AA27R/pWSlYL0bq4sUONvaYMZ27lscQorz
   p1APHkOhEJJFJM6o4OkMsZ8jbc705zsRr8rqzqVFY2ch18CO4KYKyiNwB
   w5yUlMvcDgg1joZ2fZxvMQc5LrGieb41wkTdUeatLVzrbuDDM2NEz6oA3
   w==;
X-CSE-ConnectionGUID: F2DR2QymQfeOCck2nIuvqg==
X-CSE-MsgGUID: qj/lQxwGQo6wl59a0ZwFMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68519336"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68519336"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 13:51:42 -0700
X-CSE-ConnectionGUID: 2z/BPKfjSAOmjOlRYV7A9A==
X-CSE-MsgGUID: 22T+18kgQFGkW6WZiOrz2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169788666"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.228])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 13:51:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5016911F95E;
	Sat, 23 Aug 2025 23:51:37 +0300 (EEST)
Date: Sat, 23 Aug 2025 23:51:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: i2c: og01a1b: Change I2C interface controls to
 V4L2 CCI
Message-ID: <aKop2YEyFJztjWFb@kekkonen.localdomain>
References: <20250822203632.159005-1-vladimir.zapolskiy@linaro.org>
 <PN3P287MB182948539FAD0BCE7E105B838B3CA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <d6b281a5-3872-450e-b37e-10fe7ff63bcc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6b281a5-3872-450e-b37e-10fe7ff63bcc@linaro.org>

Hi Vladimir, Tarang,

On Sat, Aug 23, 2025 at 04:33:26PM +0300, Vladimir Zapolskiy wrote:
> > > +       { CCI_REG8(0x3667), 0x80 },
> > > +       { CCI_REG8(0x4d00), 0x4a },
> > > +       { CCI_REG8(0x4d01), 0x18 },
> > > +       { CCI_REG8(0x4d02), 0xbb },
> > > +       { CCI_REG8(0x4d03), 0xde },
> > > +       { CCI_REG8(0x4d04), 0x93 },
> > > +       { CCI_REG8(0x4d05), 0xff },
> > > +       { CCI_REG8(0x4d09), 0x0a },
> > > +       { CCI_REG8(0x37aa), 0x16 },
> > 
> > Many registers are being written multiple times. I don't think this is
> > helpful, so we can remove
> > 
> > Some repeated registers I found:
> > 
> > 0x37aa: 0x07 > 0x10 > 0x16 (written 3 times)
> > 0x38a8: 0x70 > 0xF0 (written 2 times)
> > 0x38c4: 0x0c > 0x09 (written 2 times)
> > 
> > ... there are likely many more.
> > 
> > You can simply keep the last value and remove the other entries.
> 
> I'll check it, thank you. As I've said above it's quite out of the
> scope for the change, but apparently it should precede the CCI change.

I guess any order is fine, just keep CCI conversion separate from the rest,
please.

-- 
Kind regards,

Sakari Ailus

