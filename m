Return-Path: <linux-media+bounces-23431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BDF9F239B
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 13:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BD96165431
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 12:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6FF17A5BE;
	Sun, 15 Dec 2024 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UazM4hye"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCBD1119A;
	Sun, 15 Dec 2024 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734264637; cv=none; b=jS+Mt0KiKpAQDTp2xXWHF67FXINL6rjG/kiKhanDUvJ5Gem8FQ+PJ3u4lzVNx78XXpc4dH0qSDDFMDAHoVvHRBsqjhINs+7coQdcV7OhkyySEZuJ0JcYUtwMlrVjin38H5m5JlGTEky23yhQG7E6mzxCZEoOBXNhp/jp67TEDsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734264637; c=relaxed/simple;
	bh=gqop87fE9QS0LtNMiI75Ht5vedT7Kqnrwh91p6h0U/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDOqqyqHaACpdF4bcIWKVwIXMuigL0vzrgO0VmA2MejX+Up7JfIp08WDeGc4j6pEg86g5PcaA5KTSQ/ssV40SUH5DRNxPRnqJmJP6QdebaPSs5V6u9r2sMwCwCCXk0Tg7JiX9s2DnZK1hW4Rie2BWxN4gAsIu85YdliY5oeyVPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UazM4hye; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734264636; x=1765800636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gqop87fE9QS0LtNMiI75Ht5vedT7Kqnrwh91p6h0U/A=;
  b=UazM4hyexhqv7N/9qQuhI0c3S54h7UQlthONA7W2HE4Sfyvldu075tIv
   OfwWFim87P2ATNJnJaaQf7qrMO05IOX3EydW7dpGaS9pdr2HHf4O3H/Nk
   T+v7CA+DMO+jGb5Yup5COJjbKdGh8JyFVElyaGvnXEhZF3EnB7RQoabNC
   +QHTCI/uYJsS3FuY5ktFjq8/hC3XCWGRPLR+FgKD1YeD9TtAOYYEDb2aM
   D0O4R8VvkUPbW7gOlYj9CdjguSNmlL4MixzbbcVW1bFH42Rqn82O57XLu
   TZ2RPZkj4MBLRqL7hVim3V/O4yvr/IY1Sx5ETBpZKFXRApZNknzMTxiNw
   A==;
X-CSE-ConnectionGUID: 7gR7XBKgSsWaIZ3NGrSLdw==
X-CSE-MsgGUID: MXuRF7wXT7alvnkWsaWOCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34807621"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="34807621"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 04:10:36 -0800
X-CSE-ConnectionGUID: 9YXs+b+xQQa5kFdWDE2LRw==
X-CSE-MsgGUID: kVZQeNQBTdCLvC40nk9Zug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101100576"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 04:10:33 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E347C120A17;
	Sun, 15 Dec 2024 14:10:30 +0200 (EET)
Date: Sun, 15 Dec 2024 12:10:30 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH v3 07/12] media: i2c: imx214: Add vblank and hblank
 controls
Message-ID: <Z17HNqjz4ecL3fiU@kekkonen.localdomain>
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
 <20241207-imx214-v3-7-ab60af7ee915@apitzsch.eu>
 <CAPybu_0Bdc03UrJNO42S1fBTvpuHUUExvkR1ont7VKdw2XBuKg@mail.gmail.com>
 <CAPybu_0Nk+p1rikH_t_zpEHx=KGnXfG+npr-XEnwtA4EnfJjuQ@mail.gmail.com>
 <Z1g1afPM1RRwD_EH@kekkonen.localdomain>
 <8255eb1a877a339a457979c8b4fc831f6fc5cc01.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8255eb1a877a339a457979c8b4fc831f6fc5cc01.camel@apitzsch.eu>

Hi André,

On Sat, Dec 14, 2024 at 11:45:16PM +0100, André Apitzsch wrote:
> Hi,
> 
> Am Dienstag, dem 10.12.2024 um 12:34 +0000 schrieb Sakari Ailus:
> > On Sun, Dec 08, 2024 at 10:19:51PM +0100, Ricardo Ribalda Delgado
> > wrote:
> > > > > +               state =
> > > > > v4l2_subdev_get_locked_active_state(&imx214->sd);
> > > > 
> > > > Sakari, I see that other drivers assume that the active is locked
> > > > in
> > > > set_ctrl. Is this correct?
> > > 
> > > imx214->sd.state_lock = imx214->ctrls.lock;
> > > 
> > > So I guess it is fine :)
> > 
> > Yes, it is.
> > 
> > Please also run this on the set:
> > 
> > $ ./scripts/checkpatch.pl --strict --max-line-length=80
> > 
> 
> there are a few lines that exceed 80 columns:
> 
> WARNING: line length of 85 exceeds 80 columns
> #163: FILE: drivers/media/i2c/imx214.c:576:
> +	imx214_update_pad_format(imx214, mode, &format->format, format->format.code);
> --
> WARNING: line length of 81 exceeds 80 columns
> #88: FILE: drivers/media/i2c/imx214.c:983:
> +		return dev_err_probe(dev, ret, "failed to set xclk frequency\n");
> --
> WARNING: line length of 82 exceeds 80 columns
> #138: FILE: drivers/media/i2c/imx214.c:1039:
> +		dev_err_probe(dev, ret, "failed to register sensor sub-device\n");
> --
> WARNING: line length of 86 exceeds 80 columns
> #491: FILE: drivers/media/i2c/imx214.c:359:
> +	{ IMX214_REG_EXCK_FREQ, IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000) },
> --
> WARNING: line length of 83 exceeds 80 columns
> #177: FILE: drivers/media/i2c/imx214.c:730:
> +		exposure_max = format->height + ctrl->val - IMX214_EXPOSURE_OFFSET;
> --
> WARNING: line length of 85 exceeds 80 columns
> #85: FILE: drivers/media/i2c/imx214.c:1231:
> +		if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> 
> 
> Is the strict 80 columns limit really necessary, as it would decrease
> readability?

For the array that could be the case but I think I'd wrap the rest.

-- 
Regards,

Sakari Ailus

