Return-Path: <linux-media+bounces-8352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE4D894D81
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 10:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 744781F21FB9
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 08:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CD51E525;
	Tue,  2 Apr 2024 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E74YeOc6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF985336D;
	Tue,  2 Apr 2024 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712046640; cv=none; b=eTNzMfH3iKna50deSf74UsG1li9zgNiBvjA/ZuQUwsEW2xbJ7dTraiQIKw1LxUpqvQNVVSl1SWO/MRXcg4StWJkrCEmoT5PQ2nWxXqNAnBusV27/bMVBUus8/SM0mhVc3VTc8TDuBNa6IZboQRdgHL7qYQN1GMJB7JrTlLeg+7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712046640; c=relaxed/simple;
	bh=7Rl5BPvI/Ej8BgbbZqS3ytTufi+0LmvK7tU/JJ1vqGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLvQfo8acZgwdO/8asBDGsV3q33FXQaGe7Lgpky/CURVdGJYELQMPm3hOVMHghlh/spcywkMqMWxNw62YQdgpPb2x90Y0Rs0to3ETdKrzcwtuqxxnUQcMRq3bj8JF6ryIHcsg44TZjISIT3ByORF7OKVQKNc2MOppgh3TzNi1FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E74YeOc6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712046639; x=1743582639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7Rl5BPvI/Ej8BgbbZqS3ytTufi+0LmvK7tU/JJ1vqGQ=;
  b=E74YeOc6vRdn688lcpdFHOQqRHoMzsN2QSO/f/UdFogRC9uPgVh9yBy3
   4wWBn4LUfyoSj4oHgZRvgu7koKJvukqG0mMPjupZKN5ctnmi9Fz3Lakxi
   cGBbBkcbjl1n2TJs5zUnMUPzF30A8ssHtMwcBmHZcchIm2ayNZPqO9Xao
   N3KZkiml/s1NFFJ/dhx+A2a6zeh34nNcqUpbpV6ix3imIvA4ARqk6e4Ta
   0ZeQq2lsXCf0vWcXNgbw/BqXP5LRVVSbcq6cHIq/Gsz5NnPhzRwuPEdGE
   CY6FPyLG3wlMitkxF0WO+1tPsiAza7M2GinziQvbMivN6BTsFzCzBwhiz
   Q==;
X-CSE-ConnectionGUID: K0WZtDbdSW+givhsvEP0tQ==
X-CSE-MsgGUID: tO8QDCv9SoKkbqz8+qfnEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="11033411"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="11033411"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 01:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="17812182"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 01:30:35 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B493A11F81D;
	Tue,  2 Apr 2024 11:30:31 +0300 (EEST)
Date: Tue, 2 Apr 2024 08:30:31 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: rmfrfs@gmail.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] media: dt-bindings: ovti,ov2680: Document
 clock/data-lanes
Message-ID: <ZgvCJ5F6KlhVGRPC@kekkonen.localdomain>
References: <20240326231033.2048193-1-festevam@gmail.com>
 <ZgPtolH796HER4cP@kekkonen.localdomain>
 <CAOMZO5AYjNPWZfy_dN12K9JNwWaWThpMs0W-FzETF5k8fobgeg@mail.gmail.com>
 <ZgSeACFfBAmOPXdt@kekkonen.localdomain>
 <CAOMZO5BGYhnhOrBRS9zBeYYJFHXnQkqZCAV2wGtdpmiA3HZTqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BGYhnhOrBRS9zBeYYJFHXnQkqZCAV2wGtdpmiA3HZTqA@mail.gmail.com>

Hi Fabio,

On Mon, Apr 01, 2024 at 12:03:15PM -0300, Fabio Estevam wrote:
> Hi Sakari,
> 
> On Wed, Mar 27, 2024 at 7:30 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > > In this case, the correct fix would be to remove 'clock-lanes' and
> > > 'data-lanes' from imx7s-warp.dts.
> >
> > Agreed.
> 
> I tried removing 'clock-lanes' and  'data-lanes', but it did not work:
> 
> ov2680 1-0036: error -EINVAL: only a 1-lane CSI2 config is supported
> ov2680 1-0036: probe with driver ov2680 failed with error -22

If it's a problem with the driver, you should fix the driver instead of
working around it in DT. Just remove the check.

> 
> I will send a v2 that documents 'clock-lanes', 'data-lanes', and
> 'link-frequencies'.

-- 
Regards,

Sakari Ailus

