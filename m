Return-Path: <linux-media+bounces-45853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 97460C1605D
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 470BB4E8128
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0529E3093BF;
	Tue, 28 Oct 2025 17:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgitMZSQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6276213E6A
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 17:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670928; cv=none; b=DYFEHg+prbuJxShSSx8Gf5Nst3cFktLD9THJyWsPpa+KXP9/fZ5wU9e8thwRv36hmnIpynT+kw/H7fsa8RlB616a7BY00Qym9G6Qd6DEL7SC9TaeI9kya945+4rcKwl4RaQs3UD8eoXYoZtYmvolVCPoJtmi+89RVJFBhrtLfrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670928; c=relaxed/simple;
	bh=FgO1q0nQPNf9tSIqXAB0j+VPH2J25KRU0MI33rbZ/4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKNmgYjYXnQsTPxDZhOQHAzfMDkqYzREaYh3aznv9dlfwt7XasCf5X9fxjXzKzzbY4ZUiLlgIGL14jmx+v8L5CqiC0wRcKCIugCHtAUA3DqKZk5NdcB8I0KHtMy/drZbdCx55khPnlN5Wa+N55Iht4UXY5y18H4dNYRTlpeVMnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgitMZSQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761670927; x=1793206927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FgO1q0nQPNf9tSIqXAB0j+VPH2J25KRU0MI33rbZ/4w=;
  b=QgitMZSQuqviH0bX5wC1svoijgUKB0KDo3tYgOv8fuIu/rfovdjftuf0
   BzlWyhSg9pyJg1Nn7qq20NShGIMlQzcck32SPp9ZGnZK5L6v6uAahoDES
   BoMCGnH2GE7m0o0s3NQBMdlZGmtYBcJTC76uX0PTU3HbSFtWXSf7ywYUP
   5Kj0f+4GPFAZeobQEeBiCnSjVn0S/brgPzBV+4QAgaHctD2t5v++HEs2z
   vTjGD9/vmF4AmCQz1HXmJpR0rX3s0kPkJVgWFPvKpDmjpwqP/3ANS8VU0
   OTnO5rT0iIFp5Wuizu43vWRGITDXD3Dc4KAuXZWolKR9XaTT3CTQKMSCr
   A==;
X-CSE-ConnectionGUID: uZXiDe1jQOihCv6yotNgMw==
X-CSE-MsgGUID: DiDyvKDbSn+QBZ30L7/OOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63681662"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63681662"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:02:06 -0700
X-CSE-ConnectionGUID: DcjQ1+5VQ2ud4afzIpwVNQ==
X-CSE-MsgGUID: LiI8QsdIR2KlLzoOoUMQlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189762006"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:02:03 -0700
Date: Tue, 28 Oct 2025 18:01:56 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 08/25] media: i2c: ov01a10: Convert to new CCI register
 access helpers
Message-ID: <vappfkngqfkvfm5c2hesxtkmptssojqlx25zrrgs52zqxpgh2j@iyx4lqdgyzcn>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-9-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-9-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:16PM +0200, Hans de Goede wrote:
> Use the new comon CCI register access helpers to replace the private
> register access helpers in the ov01a10 driver.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>

[..]

> +#define OV01A10_REG_DIGITAL_GAIN_B	CCI_REG24(0x350a)
> +#define OV01A10_REG_DIGITAL_GAIN_GB	CCI_REG24(0x3510)
> +#define OV01A10_REG_DIGITAL_GAIN_GR	CCI_REG24(0x3513)
> +#define OV01A10_REG_DIGITAL_GAIN_R	CCI_REG24(0x3516)

As mentioned in [PATCH 03/25] the digital gain loops after 0x3fff:
Should the digital gain registers be CCI_REG16() ?

--
Kind Regards
Mehdi Djait

