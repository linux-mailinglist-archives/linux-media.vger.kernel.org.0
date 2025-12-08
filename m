Return-Path: <linux-media+bounces-48437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C0CADBCB
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 17:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFA0330329EA
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 16:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AEB2E62DC;
	Mon,  8 Dec 2025 16:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDR/t93X"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C092D73BD;
	Mon,  8 Dec 2025 16:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765210941; cv=none; b=Bh81mDn0fd3LKByWxBB7MZtFT+FQZSyqdNMp+hz3qCoCCpHuiexr3p5IOORFZUshEUOAVOC5xQYSEgcIxTEX/2BJ9TKxBRHdJLALDDoq/M9zqIxSYO2WIJoU0TnRBxTZFXpAsnm+vsdOmOuZCgXjQ6jCLhgICH2PLAPPFuUmsas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765210941; c=relaxed/simple;
	bh=27bdRTTO40NY7AGXH0atS5QU+w1EWovhQk3VfG1Q5Qg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WoSKHHW5kJciTYhdH+7oIyE24moa2Lu+UoNk6J0QeOJNbc+9sevxNpdlx8/nvxIgV3UZCi635nCf0okeEJtI/qlzpCTr8bBGGpa+vVlF6fRuTvftn+38BCCWvDRAqKAxSW9MOYULOsr1vUDvmVIKsM9fhDAcdWqbsfwlmbeuQSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDR/t93X; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765210940; x=1796746940;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=27bdRTTO40NY7AGXH0atS5QU+w1EWovhQk3VfG1Q5Qg=;
  b=YDR/t93X26HzLFfGMvAnlrMMMiBQ1sIwgmlzajfGOdw8GO+Yc6+Noyd9
   ara7AVZJ6aJhUXAzN+wEfkZEAEz4vrWbXkg4hyp9i/QmqU6p9F5IpBF8N
   ZPHNXdKZcWUgeODUzT6HcUhcJOB4CO3Lo0xzLwhdukFuTlyhrxNfwwtbY
   k6fGIWdVncrfapU8wG0WoakcLzOLtpaatroFgc9sga9I0Bfxb8XamzdRJ
   dPNNziN48w9iH1DKkCtOpTiv5cUBi4LfZ6F4/NT8Pkjg5IlSqa0LAuU0m
   /pMvE5uyV+qCplvhsqmV0SUxr1LsYgmSdK/Pf/vhjkF2CMck7JO+iwn6j
   g==;
X-CSE-ConnectionGUID: 2iQC4mKGSru3fqhzgwbEOg==
X-CSE-MsgGUID: R1xD7TvJQpm1t62mSJ7o2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="70774779"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="70774779"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 08:22:19 -0800
X-CSE-ConnectionGUID: 1jrEg3qeQn+JKF0uia7vZQ==
X-CSE-MsgGUID: W63KB8FPQXCIDoStiYBoow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195987531"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 08:22:16 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Dec 2025 18:22:12 +0200 (EET)
To: Hao Yao <hao.yao@intel.com>
cc: Bingbu Cao <bingbu.cao@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, dan.scally@ideasonboard.com, 
    sakari.ailus@linux.intel.com, bingbu.cao@intel.com, 
    linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: int3472: Use actual clock frequency for
 DSM method
In-Reply-To: <9890dbd7-ee91-41fe-8436-03f60bd97419@intel.com>
Message-ID: <5cbe91d2-fde2-5676-e4c7-ade2f7ec5184@linux.intel.com>
References: <20251205095525.1264971-1-hao.yao@intel.com> <d4f08e2d-8257-ec95-9f67-7514240a4f82@linux.intel.com> <9890dbd7-ee91-41fe-8436-03f60bd97419@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Dec 2025, Hao Yao wrote:

> Hi Bingbu,
> 
> On 12/5/25 18:10, Bingbu Cao wrote:
> > Hao,
> > 
> > Thanks for the patch.
> > 
> > On 12/5/25 5:51 PM, Hao Yao wrote:
> > > The third argument (args[2]) to the _DSM method was hardcoded to 1,
> > > which corresponds to 19.2MHz. However, this argument should reflect
> > > the actual clock frequency from the sensor's ACPI data.
> > > 
> > > According to the DSM specification:
> > > - 1 = 19.2MHz
> > > - 3 = 24MHz
> > > 
> > 
> > What are the value 0 and 2? I think there are other frequencies.
> 
> Seems 0 and 2 are reserved for future options, as I can't get the clock output
> by setting these values.

Hi,

This looks like useful information to add into the changelog itself so if 
somebody later wonders this same thing, they can get the information 
easily.

--
 i.

> Best Regards,
> Hao Yao
> 
> > 
> > > Read the frequency from clk->frequency and set the DSM argument
> > > accordingly, with 19.2MHz as the default for unsupported frequencies.
> > > 
> > > This ensures the sensor receives the correct clock frequency as
> > > specified in its ACPI configuration.
> > > 
> > > Signed-off-by: Hao Yao <hao.yao@intel.com>
> > > ---
> > >   .../x86/intel/int3472/clk_and_regulator.c     | 21 ++++++++++++++++++-
> > >   1 file changed, 20 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> > > b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> > > index 9e052b164a1a..0502876284ee 100644
> > > --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> > > +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> > > @@ -19,23 +19,42 @@ static const guid_t img_clk_guid =
> > >   	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
> > >   		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
> > >   +/*
> > > + * The PCH clock frequency argument to the _DSM method:
> > > + * PCH_CLK_FREQ_19M = 19.2MHz (default)
> > > + * PCH_CLK_FREQ_24M = 24MHz
> > > + */
> > > +#define PCH_CLK_FREQ_19M	1
> > 
> > I like 19P2MHZ.
> > 
> > > +#define PCH_CLK_FREQ_24M	3
> > > +
> > >   static void skl_int3472_enable_clk(struct int3472_clock *clk, int
> > > enable)
> > >   {
> > >   	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
> > >   	union acpi_object args[3];
> > >   	union acpi_object argv4;
> > > +	u32 dsm_freq_arg;
> > >     	if (clk->ena_gpio) {
> > >   		gpiod_set_value_cansleep(clk->ena_gpio, enable);
> > >   		return;
> > >   	}
> > >   +	switch (clk->frequency) {
> > > +	case 24000000:
> > > +		dsm_freq_arg = PCH_CLK_FREQ_24M;
> > > +		break;
> > > +	case 19200000:
> > > +	default:
> > > +		dsm_freq_arg = PCH_CLK_FREQ_19M;
> > > +		break;
> > > +	}
> > > +
> > >   	args[0].integer.type = ACPI_TYPE_INTEGER;
> > >   	args[0].integer.value = clk->imgclk_index;
> > >   	args[1].integer.type = ACPI_TYPE_INTEGER;
> > >   	args[1].integer.value = enable;
> > >   	args[2].integer.type = ACPI_TYPE_INTEGER;
> > > -	args[2].integer.value = 1;
> > > +	args[2].integer.value = dsm_freq_arg;
> > >     	argv4.type = ACPI_TYPE_PACKAGE;
> > >   	argv4.package.count = 3;
> > > 
> > 
> 

