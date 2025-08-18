Return-Path: <linux-media+bounces-40128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F80B2A02C
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B242018A1691
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE31031063E;
	Mon, 18 Aug 2025 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aamuVr2g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE43009EF;
	Mon, 18 Aug 2025 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755515686; cv=none; b=JMb4jYUiYFGXFiLhCMwy41urNTe5kOXKGAKmmB+TlY5GQ/iQMotMLdOGRT8MLvOyzkM0+JAXHt6in35fuGwWjMOUJfG2LOL9/X20aWCPYKBdZT2spwMnluatILGmFAc0JbRAshpgA7bFsuLoRd1uV9GZW/3PtU/cU2aJo0E0tMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755515686; c=relaxed/simple;
	bh=QGK+8BU43Z/BLfmsImDku8HtvcxMQmdcoWqcXyADLeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2/0/DybdJ8oP7NABAR3jLJhRuvn8tFlEf7o1eCKVoN53LGxZG68mXDJ8bH3VgjJ8OnwEdGWBfzSkLMHQdibbGovJy1h5HV6AKGjK9af2NyhQgi/gQ5Ln1898Bw0q+6DE9woP2BQMPJmjmVRO79l6ayrIJfROwIpMg8smNzcNkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aamuVr2g; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755515685; x=1787051685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QGK+8BU43Z/BLfmsImDku8HtvcxMQmdcoWqcXyADLeM=;
  b=aamuVr2gO+0Mg68e6s0JDue8jTUvoUaYteFsJEjbuxNayPJloBE4gyye
   u1opSK47lm+0Oxml0sYK1sAZ2lGv/ET/uwW+k76PG6ILPulQ3zdmq7UYx
   mALb++BDfD4xr56XZro2kYXP4nWcqPS8Pq8AsmaLommSVZCYKRAoDN/81
   2gk+vs5UFU1Jr7ySku/L1Uf5GlQm6u0HqMKnmRFhonbJX9ESjvA7vi4qm
   3cPtXcJzUOkxqTlXb+fyhZdlI/6FC4gWDvoNoiorUZ+ykcGinu7GlbbpQ
   M2sxI7FKwse0iYQdDbHkYG/Dx0ffM/eyI18+0fTgsn1h6AQ4pf+QGzJO1
   Q==;
X-CSE-ConnectionGUID: atYJse1XQkqw7sGHax2e6A==
X-CSE-MsgGUID: AbwLk5WzQ7Ksq/lqF/BOLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57691299"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57691299"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 04:14:44 -0700
X-CSE-ConnectionGUID: tjX8Qo3mSp6UVkCsC5F00w==
X-CSE-MsgGUID: XhMFdXstTkyHp4iT5G9jqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171789223"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.252])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 04:14:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ECB35120230;
	Mon, 18 Aug 2025 14:14:39 +0300 (EEST)
Date: Mon, 18 Aug 2025 11:14:39 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Will Whang <will@willwhang.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: imx585: Add Sony IMX585 image-sensor
 driver
Message-ID: <aKMLH_S5J_8EENwa@kekkonen.localdomain>
References: <20250816055432.131912-1-will@willwhang.com>
 <20250816055432.131912-3-will@willwhang.com>
 <7e27b69b-40df-4ac4-aebf-dbd00044b71b@kernel.org>
 <CAFoNnrxbzcF+YranTL8Von3BkROhq8X=RX5sa90M6PYgS_vjkQ@mail.gmail.com>
 <daa45e3e-84a6-4c39-854a-1429fb68d415@kernel.org>
 <CAFoNnrw4yRKGL_m0=g14C583o13ptC6e84TN---ABdyeg8jMhg@mail.gmail.com>
 <04fd00bb-beb4-4f35-88fb-bf1cc7691505@kernel.org>
 <CAFoNnrxd_2=9aJqo9yQ8bcDsyW9pVRCfmUU6tOHoeX5wEB2AhA@mail.gmail.com>
 <11e35902-a19a-44b2-b816-15a495048d41@kernel.org>
 <CAFoNnrxT83nz0qxf8HTapqOXuEQ0Vh+RbxyqRGQy_sJp9nzpAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFoNnrxT83nz0qxf8HTapqOXuEQ0Vh+RbxyqRGQy_sJp9nzpAg@mail.gmail.com>

Hi Will,

On Sun, Aug 17, 2025 at 12:53:49AM -0700, Will Whang wrote:
> You are asking me to code a bug in the driver and the arguments don't
> make sense.
> As much as I appreciate your feedback, I want a working driver
> upstream and will have to point to the existing code base to prove
> that it works.

Please do address Krysztof's comments, otherwise there won't be progress in
upstreaming this driver. I can recommend reading section "The active low
and open drain semantics" in Documentation/driver-api/gpio/consumer.rst .

-- 
Regards,

Sakari Ailus

