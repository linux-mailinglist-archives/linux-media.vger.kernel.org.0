Return-Path: <linux-media+bounces-50561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9834CD18F98
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 13:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ABBA303E0F8
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 12:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B7C38F237;
	Tue, 13 Jan 2026 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrDoTOwe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C2E38F24C
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308533; cv=none; b=oi9xXujPYs/zHY+LAZGPIZv06Vp/bFUfp0OsmlIWO13GCEMQJqs0emYE2zmruOAvmUCpPfaf9gvc1WwI7Xvj+EmEsdtE9UuwlqtRbgIZxgU1hBuvTLI1ya0p7+3MBGABRSrubo8uOcODa6IBYxy7iaNDOMDr78lmNAffph5fURs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308533; c=relaxed/simple;
	bh=27Il2Uta2OSUeaUvjcN/LuIioAbWg7MqFbxNONgoubA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHLQ3DbsdYK7F8To3Ac4GWRH0dYF8Wv+BqrxfzDfXSW8lzV12s5ar2pV8dmXH/c4ewi4gQaSVs5Prarymk5GyRG4Tvzr4fq0gdjWpPrztALVtqc4ZkNFvUMeUjeCdhB/6EizzfzZj41RvDLNN9riNgjhNZdfDJ3ggtv0Ld72PF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrDoTOwe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768308530; x=1799844530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=27Il2Uta2OSUeaUvjcN/LuIioAbWg7MqFbxNONgoubA=;
  b=VrDoTOwe1s9mijT/riUYSVJrcdYjaovL8j1HBY+QEoHMCtGRyPx4UsMF
   MMJq1C+PkBuoMimMshHoSbXpWrw5X6JkZL+bHWqBICd71f0TOvFKTFvm3
   /4Gnc4nPOH8V3577LMNdjzlUhYjTDsNwQkBCAOjV8uOkd+YXDo6bpe71n
   67mp6SPh6jmeROqsDjJB0bMJlEp6TGeaqJRDaJzxhsjGqSFDczyTS8tbJ
   qDa0kE4wSMvpgFRDtR9woHgJTGocueq3wy8nn7bfhFQAxru1tAnP5P13v
   qM2LmcZJv01dgplc68geh8+7BtU4a9iYtx1wJ8bTSrK0bJpyBZaMjDVH7
   Q==;
X-CSE-ConnectionGUID: Cp3UzCUTSGa6dsT7IUYB5w==
X-CSE-MsgGUID: lJg7tM/WRVSH2Ugl2WN97A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92258895"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="92258895"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:48:50 -0800
X-CSE-ConnectionGUID: ptDGHS2bQ6KQxEvd0dMdSw==
X-CSE-MsgGUID: bHNQf/NJTs2ldH+wwXB1Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208538315"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.182])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:48:45 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ACE3A11F9B2;
	Tue, 13 Jan 2026 14:48:42 +0200 (EET)
Date: Tue, 13 Jan 2026 14:48:42 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 21/64] media: uapi: Add V4L2_CID_METADATA_LAYOUT
 control
Message-ID: <aWY_KgQ2tZEyLSaZ@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-22-sakari.ailus@linux.intel.com>
 <f24e58ee-c027-49b7-bdd6-99e374177be1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f24e58ee-c027-49b7-bdd6-99e374177be1@nxp.com>

Hi Mirela,

On Wed, Jul 23, 2025 at 02:51:04PM +0300, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 6/19/25 14:57, Sakari Ailus wrote:
> > 
> > 
> > The metadata layout control defines the layout of the metadata on the bus.
> > It is used on sub-devices that use generic metadata mbus codes on at least
> > on one of the pads.
> 
> Please replace "on at least on one of the pads" with "on at least one of the
> pads".

Yes.

> 
> Is this meant to be a read-only control?

CCS can support multiple metadata layouts so in general, no, but almost
always. :-)

-- 
Kind regards,

Sakari Ailus

