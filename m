Return-Path: <linux-media+bounces-54897-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFoVGkJurWme2wEAu9opvQ
	(envelope-from <linux-media+bounces-54897-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 13:40:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2382303C8
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 13:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C634F30180B4
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 12:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2AC36F411;
	Sun,  8 Mar 2026 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZ1tBFQH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F0527F749;
	Sun,  8 Mar 2026 12:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772973621; cv=none; b=uQ710sSjctj214CR04gePz3QuMtAUJzvrihGNtA0uqQRGaMJHuxESllfxgvDZ2ruZn7mEY/8uL9FMDFsp5ouhVkAoSuLH7UtrnR3o2E7NZgCCkvlfkt9lQV3Erd3zTouAjWWZWZ8GuQhJlcvCJX3o9vlR8IYUN7G3jowtZFfTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772973621; c=relaxed/simple;
	bh=zbhtCbttgtMn5lFau9Gez8kwNEMkXCFdMTQtkiSITIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUivuThCy9qTNVeZVTLv2z5/7NoSh4rgkJ3WdHBLSGy5Spj7zpOzrJ9v+mK/jNx8fNFvGy9ZeJFdPhvVsXEy6HExP1FUwANX07QRfMoZ65xj0m/R5YBP29AcZgvkIOOeoDRdF61f/2B7Qph6s5GScynZQt/yTsnRPy7ZLrnTKvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZ1tBFQH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772973619; x=1804509619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zbhtCbttgtMn5lFau9Gez8kwNEMkXCFdMTQtkiSITIg=;
  b=cZ1tBFQH7MuNrTMz/21j1Fzi12bdnYZtltJtF4IxCXDwrz9E3DeX2xo8
   OFrql6/PEkupV/6MlfdJhVJkg/+ipjuzL4nCu5jrk7gQ9HSJVJFe9DH/+
   AhCkJjCW1JBWYMNc1S4bCFvYA0YSquUMPvgC4Bqg/uM68gD+dwReGlgHN
   7py2jmjft3KStYwwWwtdUfDwA4MC3kJPAid+d7WUi20tCI5s5P4cHUzq3
   u5Ou1AMWrZ4Vo5nzewisDeSuLTkI5wPDGKNlxoqDx4KWafsMB1ACeIDIh
   xze+XpyMpYQlM//QxW6XXLsMxnEXuXTGhPcf7f8x29l5xmrXSybiCv5zJ
   Q==;
X-CSE-ConnectionGUID: c0tP5ibIQ9Wsnul1mvkA2g==
X-CSE-MsgGUID: uF5w0fjFR7WCoq76DEAguQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="61587708"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="61587708"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 05:40:18 -0700
X-CSE-ConnectionGUID: HkapVZWaSWyLtiDRtBE1MA==
X-CSE-MsgGUID: ao7zcG5vSIawFOjqk+EinA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="218685603"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.88])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 05:40:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A7C6F121D15;
	Sun, 08 Mar 2026 14:40:45 +0200 (EET)
Date: Sun, 8 Mar 2026 14:40:45 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Dang Huynh <dang.huynh@mainlining.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip: rkcif: Add missing MUST_CONNECT flag to
 pads
Message-ID: <aa1uTfimVo5H05Q7@kekkonen.localdomain>
References: <20260129-rkcif-null-v1-1-90788ec347f5@mainlining.org>
 <9bb4eced-5710-49ac-99cf-fa0b1d1459b1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bb4eced-5710-49ac-99cf-fa0b1d1459b1@collabora.com>
X-Rspamd-Queue-Id: AC2382303C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54897-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Michael,

On Fri, Feb 13, 2026 at 09:06:47AM +0100, Michael Riesch wrote:
> Hi Dang,
> 
> Thanks for the patch -- and sorry for the late reply.
> 
> On 1/29/26 08:24, Dang Huynh wrote:
> > The pads missed checks for connected devices which may a null dereference
> > when the stream is enabled.
> > 
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 0000000000000020
> > pc : rkcif_interface_enable_streams+0x48/0xf0
> > lr : rkcif_interface_enable_streams+0x44/0xf0
> > Call trace:
> >  rkcif_interface_enable_streams+0x48/0xf0
> >  v4l2_subdev_enable_streams+0x26c/0x3f0
> >  rkcif_stream_start_streaming+0x140/0x278
> >  vb2_start_streaming+0x74/0x188
> >  vb2_core_streamon+0xe0/0x1d8
> >  vb2_ioctl_streamon+0x60/0xa8
> >  v4l_streamon+0x2c/0x40
> >  __video_do_ioctl+0x34c/0x400
> >  video_usercopy+0x2d0/0x800
> >  video_ioctl2+0x20/0x60
> >  v4l2_ioctl+0x48/0x78
> > 
> > Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
> > Fixes: 85411d17bee9 ("media: rockchip: rkcif: add abstraction for interface and crop blocks")
> > Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> 
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks, I added Cc: stable to this one.

-- 
Regards,

Sakari Ailus

