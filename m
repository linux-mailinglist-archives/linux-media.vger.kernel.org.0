Return-Path: <linux-media+bounces-38553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D75B138EE
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 12:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C52133B6886
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 10:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42EB254AE7;
	Mon, 28 Jul 2025 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcUNhneK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC64C26AF3;
	Mon, 28 Jul 2025 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753698487; cv=none; b=RqjWHfCJ0EMzpmmuJK/t+I5VW+eoMnOf84c0N0efKeDoPZ62ZcAApJ0+o51oCz50gcsxAQ77+RUSKRZ0gnpGQUE//bjhAImYnehLrOA4bEoaU5k8Hkwj+XHdiiNK/5dEwlaKwau3f4DWxifm9EZg++RTsPFIMNnjWMbyFBXcIqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753698487; c=relaxed/simple;
	bh=3AnWV7DkyxpUinOHa2NdfWkE9BXbV1glkkPC/peih7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COVDGHt1xBfI7CmyCtNyJgpzBxhopiM4prFj39prCgZbJZLSY9kcNa8/7zWYL2lcbFEfI6wLKYh4cpgfjJQBMQWM58lhoJVLhh/S/8pfyIx0HWRdRD3zt8VzDvFEJUqqpyeeJ7XutV8uzHyDTZ/FArmw3rQBXX7BT96PutneamA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcUNhneK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753698486; x=1785234486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3AnWV7DkyxpUinOHa2NdfWkE9BXbV1glkkPC/peih7Y=;
  b=VcUNhneKxQ4XMyGmBZUe0F+OH/KXgpvFVniXunfInlzikCtXm9cYa/XJ
   YjKkVa6w/9C8leiNjJ62p06MjvzKA+vurlQEiWlTkgMzDaw1nu9ZCfSOb
   FH14yV1LqWgnfQAvVnd7utaXQ6febOVda641OQJoCEHjsDboL3GOcQpZE
   MtC07IHM6A39uLzaMTDanp54b0ect7yHUUE2Wwx44XO3emqOOSm7f8Y0t
   37w+aduo93GnI7MYSzILnjV3TlPJTGky8Cuk8hOJMD5a+DkYX+o9QaOSY
   GkU5JtIGkGTAvIgs+2djYGvbenx2dyKLlKNHJ3j7PLFUPh0+4wpqkMoMi
   A==;
X-CSE-ConnectionGUID: y/cGMFp0T3KGEU4OBYDCAQ==
X-CSE-MsgGUID: PeEjrfLGS5O+R4Wm2+htXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55826513"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55826513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 03:28:05 -0700
X-CSE-ConnectionGUID: XsCgo5pRTpKbIkiqcHjbig==
X-CSE-MsgGUID: mwAAXCYLSiSRImYODtjYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="193345808"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.254])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 03:28:02 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3CE2C120317;
	Mon, 28 Jul 2025 10:28:24 +0300 (EEST)
Date: Mon, 28 Jul 2025 07:28:24 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, Svetoslav.Stoilov@amd.com
Subject: Re: [PATCH v2 3/8] media: platform: amd: Add helpers to configure
 isp4 mipi phy
Message-ID: <aIcmmLi_pNGAYYtN@kekkonen.localdomain>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-4-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618091959.68293-4-Bin.Du@amd.com>

Hi Bin,

On Wed, Jun 18, 2025 at 05:19:54PM +0800, Bin Du wrote:
> +struct isp4phy_mipi_reg_seq {
> +	u16 addr;
> +	u16 mask;
> +	u16 data;
> +};
> +
> +union isp4phy_mipi_0 {
> +	struct {
> +		u32 shutdownz : 1;
> +		u32 rstz : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_1 {
> +	struct {
> +		u32 mode : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_2 {
> +	struct {
> +		u32 rxdatawidthhs_0 : 2;
> +		u32 rxdatawidthhs_1 : 2;
> +		u32 rxdatawidthhs_2 : 2;
> +		u32 rxdatawidthhs_3 : 2;
> +	} bit;
> +	u32 value;
> +};
> +
> +struct isp4phy_mipi_3 {
> +	u32 reserved;
> +};
> +
> +union isp4phy_mipi_4 {
> +	struct {
> +		u32 enableclk : 1;
> +		u32 enable_0 : 1;
> +		u32 enable_1 : 1;
> +		u32 enable_2 : 1;
> +		u32 enable_3 : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_5 {
> +	struct {
> +		u32 forcerxmode_0 : 1;
> +		u32 forcerxmode_1 : 1;
> +		u32 forcerxmode_2 : 1;
> +		u32 forcerxmode_3 : 1;
> +		u32 forcerxmode_clk : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_6 {
> +	struct {
> +		u32 turndisable_0 : 1;
> +		u32 turndisable_1 : 1;
> +		u32 turndisable_2 : 1;
> +		u32 turndisable_3 : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_7 {
> +	struct {
> +		u32 ready : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_ind_idx {
> +	struct {
> +		u32 addr : 16;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_ind_data {
> +	struct {
> +		u32 data : 16;
> +	} bit;
> +	u32 value;
> +};
> +
> +union isp4phy_mipi_ind_wack {
> +	struct {
> +		u32 ack : 1;
> +		u32 pslverr : 1;
> +	} bit;
> +	u32 value;
> +};
> +
> +struct isp4phy_mipi_reg {
> +	union isp4phy_mipi_0 isp_mipi_phy0;
> +	union isp4phy_mipi_1 isp_mipi_phy1;
> +	union isp4phy_mipi_2 isp_mipi_phy2;
> +	struct isp4phy_mipi_3 isp_mipi_phy3;
> +	union isp4phy_mipi_4 isp_mipi_phy4;
> +	union isp4phy_mipi_5 isp_mipi_phy5;
> +	union isp4phy_mipi_6 isp_mipi_phy6;
> +	union isp4phy_mipi_7 isp_mipi_phy7;
> +	u32 reserve;
> +	union isp4phy_mipi_ind_idx isp_mipi_phy_ind_idx;
> +	union isp4phy_mipi_ind_data isp_mipi_phy_ind_data;
> +	union isp4phy_mipi_ind_wack isp_mipi_phy_inc_wack;
> +};

One more thing. Is there an endianness issue here?

Overall the CPU endianness may be big or little while the device endianness
is little, presumably. You should use __le* types and functions to convert
the endianness when dealing with the messages to and from the device.

-- 
Kind regards,

Sakari Ailus

