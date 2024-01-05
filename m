Return-Path: <linux-media+bounces-3220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE9D825008
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 09:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1F4F1F23310
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 08:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7850622EE5;
	Fri,  5 Jan 2024 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIJ6bPzA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A872820DC8;
	Fri,  5 Jan 2024 08:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704443410; x=1735979410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yqHCtlTmTJcO38lbC2SPW6R6TtGpO8FQxb04uVEzvW4=;
  b=LIJ6bPzA/s5YItbBGXJg1Rozw1aQfDMbeAMmwJj6DpX+2Y2cuAjAaBX2
   wrRKb2YsTJ7r1FwZHQ7uy5MPo7x9puXE5nMe2kONhhdukJ71RcygVpMR/
   tDdZTLFBVSrU/I30UOJoOzIAlI/1ZXca5DMLp7zhPNSmnvGKYO9+wfav2
   uMD5a1vbdxQ0TglKDkDEp4A1QwsG6xsSAaXZTrtJ/HERo0NAfru0GeW5S
   94HQtve4OXbRscTd8K1qNBcbxvFSgex4niNuHpaPrJ92GGuxruko3OEOB
   O9vZqBBStQbrk29jx/3HgBojFsPa7vYKBFIgd2TZRVhUIVrZ41L8hdhTL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4567218"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4567218"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="773790066"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="773790066"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:30:08 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8619311F7E4;
	Fri,  5 Jan 2024 10:30:05 +0200 (EET)
Date: Fri, 5 Jan 2024 08:30:05 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] media: v4l: async: Fix double pointer free on
 v4l2_async_unregister_subdev()
Message-ID: <ZZe-DeImcJLVm7Vd@kekkonen.localdomain>
References: <20231130173232.130731-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11269FCC5199547299AFDAAF3868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB112699751EF10B9BEF3B7511B86672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB112699751EF10B9BEF3B7511B86672@TYCPR01MB11269.jpnprd01.prod.outlook.com>

Hi Biju,

On Thu, Jan 04, 2024 at 11:05:46AM +0000, Biju Das wrote:
> Hi All, 
> 
> Gentle ping. Are we happy with this fix? Please let me know.

Thanks for the patch.

The issue has been fixed by Sebastian's patch (commit
3de6ee94aae701fa949cd3b5df6b6a440ddfb8f2 in media tree master).

-- 
Regards,

Sakari Ailus

