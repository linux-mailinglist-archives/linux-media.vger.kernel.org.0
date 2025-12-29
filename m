Return-Path: <linux-media+bounces-49636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D58CE67BC
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 12:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CE31300E7B0
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 11:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC8F2FBDF5;
	Mon, 29 Dec 2025 11:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9DOU20v"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6330B28A1D5;
	Mon, 29 Dec 2025 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767006862; cv=none; b=B1HzqSBGG91HNJnEJYvEISMQoyJD7ajiXEb1msByOaW4SGxX5K/d1Ho0Fs+1qNmW8y3wqlE7qlp1K4FOJBc2l/WYJoMw8V+W7Gjw/I3mMMJ9HuUSXkNsivUd7lCLVilYnrHjPJ1iAIzkE3h46ebwtIcxkCxyuPAnpvuFWEKpDCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767006862; c=relaxed/simple;
	bh=tzMWyGzDvkR93+MIsbVPUSBPShySdJo2u5fGCPTDLDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Npw3zXnRQVz1rJT9HpjuRKRNWuEFP+LwQNcS7BsaCCo153FYKR/oP7cRy1S6khH+nvPasH8StwNCN9oemGXE/oiNNKWdsV7bDDixPQIDCdC1mhU0Y6OKi4+a+aJzUmCDBZ4/lVs/yTbSaMbbMGasUQczFi0kG5QRKuXHdjjrCPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9DOU20v; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767006860; x=1798542860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tzMWyGzDvkR93+MIsbVPUSBPShySdJo2u5fGCPTDLDY=;
  b=m9DOU20vpbBpCpj8XVCB1x3bD3+aHQV2Wer8+YjdCsHKuy3xiNtqgyEy
   LBOTnNfYqYIOA8oIEBEo6IMY1mIRzkweqII2p2SKGkbvAkn9hEYi6XBcc
   llOEEzXNVjv7MUtCXa53j70aT3gcpvufZyDl53CKwcD1wtx9Gh6/zRt56
   7u+i3VuP1VaEncZNJsduzrf3Mhw05W9VGsn74PiYtC6twmdYYfYfMo8g4
   J+a2rzrE26csNPPVPInMXGI7nE7UT05z5bSDoa2lSyHPMo501yJNx+h+j
   QfVwmxoGzgjUNXmUdgRhaaqVvQesrnyB6UTlovzNgKRe5fTfFl8s8yQ34
   Q==;
X-CSE-ConnectionGUID: b5tfc5s/TVW6puD9vgTLkw==
X-CSE-MsgGUID: mL2g3829TIC9btp38xaOzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="91271951"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="91271951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 03:14:19 -0800
X-CSE-ConnectionGUID: eyapc0BTQOGoPXqrx51acw==
X-CSE-MsgGUID: jouYL/5LTQywze2inlF+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="201172128"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.22])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 03:14:15 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3138C12063E;
	Mon, 29 Dec 2025 13:14:21 +0200 (EET)
Date: Mon, 29 Dec 2025 13:14:21 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
	sjoerd@collabora.com, dan.carpenter@linaro.org,
	hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 12/18] media: cadence: csi2rx: add multistream support
Message-ID: <aVJijbfKT1uT0ejG@kekkonen.localdomain>
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-13-r-donadkar@ti.com>
 <aR8PMEHTJJVlg0YM@kekkonen.localdomain>
 <c08199da-fa69-494f-bbaa-caf0cb943cde@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c08199da-fa69-494f-bbaa-caf0cb943cde@ti.com>

Hi Rishikesh,

On Tue, Dec 09, 2025 at 03:13:34PM +0530, Rishikesh Donadkar wrote:
> > > @@ -538,6 +595,36 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
> > >   	return 0;
> > >   }
> > > +static int csi2rx_s_stream_fallback(struct v4l2_subdev *sd, int enable)
> > What do you need this for? I presume you'd have a sub-device driver
> > downstream calling this, but wouldn't you always use {en,dis}able_streams
> > from that driver?
> 
> 
> Yes, Downstream consumer driver that call this are TI Shim and StarFive
> JH7110 CAMSS. TI Shim uses {en,dis}able_streams, the StarFive JH7110 CAMSS
> calls the s_stream. I will change the StarFive JH7110 CAMSS to use
> {en,dis}able_streams.

Thanks!

-- 
Sakari Ailus

