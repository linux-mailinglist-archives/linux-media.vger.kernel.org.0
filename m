Return-Path: <linux-media+bounces-2237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5C880EC64
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 13:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F26AB20D1D
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 12:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673735FF17;
	Tue, 12 Dec 2023 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5+M+PHN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7A4AC
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 04:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702385171; x=1733921171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JKRSg/WDJg0PsU1UnwdUZvGAF7mD5CG4APRHbwifx80=;
  b=T5+M+PHNUjObeZWNznpM2y6r9HI8MdtxrLcr7I5vQmKKNfKy4LyfmNZO
   jViqbRHpMhr0qWSlEKDSxAXRCXXLWmdaRZeYC3ibGycTwvRbnS7F2bK5Y
   PWfeoSXQNScHqVnvSn0nbQhm/6+nDoVXNK/TZJPbUC6gw+WAy19NF+I6x
   CGS6IvcNP7ghS4kGGnB7wJjiAc+vN8++a4qkda4tKkvBundGdt90bBVp/
   6B0PL2UwSeCJOx27FjsTgcxW0frwFxqUAx52Aw3Buvurg9wzuSKiqkMCj
   xiIU+40FrQ4XBDYQj8z5DuXiSMec459+7UQ+jUEvW+12ZMTPPvnblqJla
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="385210246"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="385210246"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 04:46:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="839423430"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="839423430"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 04:46:01 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E90F211F7E4;
	Tue, 12 Dec 2023 14:45:58 +0200 (EET)
Date: Tue, 12 Dec 2023 12:45:58 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: imx415: Add more clock configurations
Message-ID: <ZXhWBswzk88EAojU@kekkonen.localdomain>
References: <20231205090557.298680-1-alexander.stein@ew.tq-group.com>
 <20231205090557.298680-3-alexander.stein@ew.tq-group.com>
 <ZXhGAR2fhEOjHXcJ@kekkonen.localdomain>
 <2167674.irdbgypaU6@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2167674.irdbgypaU6@steina-w>

Hi Alexander,

On Tue, Dec 12, 2023 at 01:18:18PM +0100, Alexander Stein wrote:
> Hi Sakari,
> 
> Am Dienstag, 12. Dezember 2023, 12:37:37 CET schrieb Sakari Ailus:
> > Hi Alexander,
> > 
> > On Tue, Dec 05, 2023 at 10:05:56AM +0100, Alexander Stein wrote:
> > > Complete the list from "INCK Setting" section in IMX415-AAQR-C
> > > (Rev. E19504, 2019/05/21)
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > 
> > Could you address these smatch warnings, and run
> > 
> > 	./scripts/checkpatch.pl --strict --max-line-length=80
> > 
> > on the patches?
> > 
> > drivers/media/i2c/imx415.c:402:30: warning: decimal constant 2376000000 is
> > between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers
> > are very likely to produce unsigned long (and a
> > warning) here
> > drivers/media/i2c/imx415.c:417:30: warning: decimal constant 2376000000 is
> > between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers
> > are very likely to produce unsigned long (and a
> > warning) here
> > drivers/media/i2c/imx415.c:432:30: warning: decimal constant 2376000000 is
> > between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers
> > are very likely to produce unsigned long (and a
> > warning) here
> 
> Interesting, I don't have these warnings here. Is this some more recent 
> checkpath.pl not in next?

Not checkpatch.pl but smatch <URL:https://github.com/error27/smatch>.

> I've addressed this and some 80 char length warnings as well. As I've
> sent out v2 this morning already, I'm waiting a bit more bevore v3.

Ack.

-- 
Sakari Ailus

