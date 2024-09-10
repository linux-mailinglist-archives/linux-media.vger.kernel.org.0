Return-Path: <linux-media+bounces-18068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA25973369
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 12:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0CF2B2379D
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 10:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3AE191F61;
	Tue, 10 Sep 2024 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANtSZ2qx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E4418C00C;
	Tue, 10 Sep 2024 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963724; cv=none; b=P29LycxBEx18PwVi1L7gCLyX6F554kpCnH4UXXyKPwMlktvoYPOyq1FTDXmVnW7D2jfboUY8Vgs+4h7H3ZFVbB0CHiMl/CwqKk3C3scmviu60Nz9XXrTJGMVZQ8ZbaYfBDGG0+OFIZ25mMOXSK/A56jvEulu8B37HJ2H3aRPbZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963724; c=relaxed/simple;
	bh=UrcW67GFtZitZSckWZ2pJka2BxV3vmkG5mbEl6ujStw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgHOtlEcjS3285yK/UJYZP4FDyzNSyEZXSr2jLcBkwWYERnkBnv8IHAEIbH09ELuteGUYz/8M5gX7Lw6Y4/aU9oQoRv9kwIb5q2+/96ACPeh/miPG8ITTym+67xOe9MIW+2vsfm/oe0cX8G8wHZfsEpsj+mpZmtGuDrGio+DwxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANtSZ2qx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725963722; x=1757499722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UrcW67GFtZitZSckWZ2pJka2BxV3vmkG5mbEl6ujStw=;
  b=ANtSZ2qxImfcQbmAkATG+s2Q+778fQCSPF+oAbmPcGVS3ouCDsl5ClR6
   MXdgJlooDKULV31UQKcur+ZBZFlYUFFLNCFNTZqvqWD3IqwVK9ErNWRLc
   Ms/Aqf/mxTTRpjOpc8037XB/6mkyU1LR3h3css99KQLY499CWgVO26FCq
   GuWzslejsXHz+0DnDSl4M+Hx/66JWW5PxHLiT5TFYMi+2iFvCEzkB20jM
   4gszIqmGkrQdkxiJ0U/kVBa4ZBxFtNrP3q649xzkPuyV30FGfbvK3kpD/
   Tisr6RiIqSvjoekYzt3f45/Vrk5j979DG0KFe3e0AxYxKCXymBNFO4+Ld
   g==;
X-CSE-ConnectionGUID: DN43Cd8jSbWBTNg+o5zF8w==
X-CSE-MsgGUID: qD3UCKyQSX6JJrQDZrLIGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="50115035"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="50115035"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:22:02 -0700
X-CSE-ConnectionGUID: 6btEr7/7TtGJVjsOVFXSrQ==
X-CSE-MsgGUID: g83Bpbn9QcSDxmE+uNa4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="66785837"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:21:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9D70611F83C;
	Tue, 10 Sep 2024 13:21:54 +0300 (EEST)
Date: Tue, 10 Sep 2024 10:21:54 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <ZuAdwpUHQn4fdDjc@kekkonen.localdomain>
References: <40cc1e95-b9fc-4c27-9428-1698d0bf9d25@ideasonboard.com>
 <763b3147-d7cb-44a7-b73b-8f7f4fd622ab@ideasonboard.com>
 <yib2r4wisxvk3kgogbjqawrpmfq6lcezfk4xjmftj44jzkbclc@icapodv2ffzk>
 <d5188c0a-4a52-4378-89b1-48f606e448cc@ideasonboard.com>
 <ggtlreq5gyhzfdv6yzeuia46y7fxpuyvg236prig52t43xsl2a@crlqks2nhfpe>
 <20240909134516.GA9448@pendragon.ideasonboard.com>
 <Zt8ZysTT5DIZr-J7@kekkonen.localdomain>
 <jdtjdspf4qyrgn6jmyxeab5ueo53wjd5vuhvlpin3pdiyifwht@dndfcqnmv7sd>
 <49e375a3-d8e4-4b58-9456-1e6395b02a07@ideasonboard.com>
 <20240910101137.GD6996@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910101137.GD6996@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Sep 10, 2024 at 01:11:37PM +0300, Laurent Pinchart wrote:
> On Tue, Sep 10, 2024 at 12:56:38PM +0300, Tomi Valkeinen wrote:
> > On 10/09/2024 12:19, Jacopo Mondi wrote:
> > 
> > > However, I think this current patch is correct (assuming the above
> > > reasoning on i2c sensor drivers is correct) and doesn't require
> > > CONFIG_PM, so I would be tempted to keep this version.
> > 
> > I think the existence of this discussion alone proves my point that we 
> > should only support PM-case, unless !PM is a requirement =).
> 
> For me it proves there's a dire need to document the runtime PM API in a
> way that a human could understand :-)
> 
> > But if you do want to keep !PM:
> > 
> > Is there a reason why not mark the device as active with 
> > pm_runtime_set_active() after calling pispbe_runtime_resume and before 
> > accessing the device? That feels like the most logical way to use the 
> > function, and it would be right regardless whether the core will enable 
> > the parents before probe() or not.
> 
> Does pm_runtime_set_active() resume the parent ?

No, it simply sets the device's runtime PM status.

> 
> > And not related to the BE or CFE drivers, but it strikes me odd that to 
> > support PM and !PM we need to play with these tricks. I think the core 
> > should just do the right thing if the driver does pm_runtime_get_sync() 
> > even with !PM (although maybe the time has passed to be able to do that).
> 
> The runtime PM concepts are nice, but the API is wrong in my opinion.
> Instead of being designed to expose the internals of runtime PM, it
> should focus on usability from a driver point of view first.

It's been moving a little bit to that direction, largely with new helper
functions.

I²C devices have been powered on for probe since commit a76e9bd89ae70 .
Relation to runtime PM wasn't considered at the time, apparently.

-- 
Kind regards,

Sakari Ailus

