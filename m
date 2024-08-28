Return-Path: <linux-media+bounces-16982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2BF961FF6
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 08:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C95A1C23569
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 06:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FDC157E88;
	Wed, 28 Aug 2024 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzCk+gah"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDA914A4F3;
	Wed, 28 Aug 2024 06:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724827575; cv=none; b=PWq+RVBx6V5ovkfyNjA6ybnxtgQeITx9yayQQjw31U8KTRM8BhD/L/2kNMu3ZIaP4JZ5ROQn0Jtqv6LtK1liHdluv965AroNDY4igskOH0SMzHN7glVlVusFoYUjEtaQS7iPH4hsERamhO1EQh6cuVZbqICIgSXTQpaIN1UekPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724827575; c=relaxed/simple;
	bh=fpY9H9GjtEgIiaqgnzGHzh7DPyae/RrxiJ8Fw5a5YqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gi6VbZxsxTS/Cr/2ASuTAYW6w2rssVJfujklEyLy2260ucfmtSTS38+1tyZn3gabvUFrZt3xcTSMnWtvZ3AvFQgS3l4SsmRR730wdKPlUBUI1bChz2/PnF1vwRzjZiBTbCQNbj652z4fHIPDsamjgPGy0JNMOfVa5BQqZY4h4A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzCk+gah; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724827574; x=1756363574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fpY9H9GjtEgIiaqgnzGHzh7DPyae/RrxiJ8Fw5a5YqU=;
  b=XzCk+gahyUnEuzPg/+zBTkVU45trz+IgbuJ7Nd8qZCRlePPJ4H28hwVJ
   RqABA/fRvYRKpta/OReu7H5824Hc+C8SAvuLjDMGVDHmCBlG/OvmfJTjo
   3oJicabyCyuehBUsFdYTmjOErYdVaorwyEzjDcl2Ysl87r3OV4iqYRl0+
   EpeHLScUAC6TdBI7MHYeD1E0Z5M25sJRrkvenFLeM0TYpfg4SwqBaBB4T
   pBYlEvdj9aq38XGwn6IuXeg//s4GFpupRsnF0ysZRLiogp67quAUC3xpB
   GkkDYo8GYFIzypQzQHYjaD5O1IinAoHgT9EppTZItiOIGkbHDoWwKXjlE
   w==;
X-CSE-ConnectionGUID: Nz/Lm8vkRTaV8XkALx01nw==
X-CSE-MsgGUID: 9mjVwyk4SyqNtVrgcTTfkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34496458"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="34496458"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 23:46:01 -0700
X-CSE-ConnectionGUID: tRbTdyOCSbWnjb7mTd3kXQ==
X-CSE-MsgGUID: 2dWqVf08SwCa2TdIYzzD2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="67934198"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 23:45:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 605E611F8B3;
	Wed, 28 Aug 2024 09:45:54 +0300 (EEST)
Date: Wed, 28 Aug 2024 06:45:54 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	20240627151806.3999400-2-tomm.merciai@gmail.com
Subject: Re: [PATCH v2 0/2] MAX96714/7 style fixup
Message-ID: <Zs7HolNmvxhvm1aY@kekkonen.localdomain>
References: <20240701-gmsl2-drivers-style-fixup-v2-0-6b02bd6c1e41@collabora.com>
 <Zqil0ykVdWAj47-J@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zqil0ykVdWAj47-J@kekkonen.localdomain>

On Tue, Jul 30, 2024 at 08:35:31AM +0000, Sakari Ailus wrote:
> Hi Julien,
> 
> On Mon, Jul 01, 2024 at 11:31:41AM +0200, Julien Massot wrote:
> > There was still some open comments from Sakari that haven't been
> > addressed.
> > 
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> 
> This no longer applies to the current media stage tree. Could you rebase
> it, please?

Oh, it depended on the test pattern patch. Even better. Thanks!

-- 
Sakari Ailus

