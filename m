Return-Path: <linux-media+bounces-966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E86FF7F7014
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 10:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7571F20ED2
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 09:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA47E1642B;
	Fri, 24 Nov 2023 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNEM7P16"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E6F11F
	for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 01:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700818701; x=1732354701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MV/+D1XV86IxJSoEcThDhtQ1YVEshIRkLZq9aJBTX3s=;
  b=mNEM7P16zrUoXxk8j2K9S5mgxzd2F/0WFXqs2semAo7BMXuB2UMP6Kf7
   qgs3chgdPuqFUX7b/jYAj7AgI3p2uP8M3BgwJt3m8JAEU7pjXumjx2nxd
   NIeX23faWuMhfE+WqY6jaNvozK0AKbKb+TnytWVV9us3LUtD3z8HZyPgg
   9npcbHVYBeHR0uOryyD4phsMNqPgfMiYoBMZwLwTniMX0xzf0li15BpMb
   8aelP3c3WNuxz0/1S7xIyfKt2ZiSOOULIPVu42Sdu26f8uYP34RAIam+B
   xKjg1rg2n8f3oGor9sPPBuZNikHRdU2jnoA0NLL56TWJ8AUl5R9V1WNKU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478606827"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="478606827"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 01:38:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="15918020"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 01:38:20 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D811911FC11;
	Fri, 24 Nov 2023 11:28:23 +0200 (EET)
Date: Fri, 24 Nov 2023 09:28:23 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Gregor Jasny <gjasny@googlemail.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>, Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: New v4l-utils release?
Message-ID: <ZWBstztyjJCtWsIx@kekkonen.localdomain>
References: <12b6687c-2517-4844-abd4-1e64f83c27b6@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12b6687c-2517-4844-abd4-1e64f83c27b6@googlemail.com>

On Wed, Nov 22, 2023 at 01:03:34PM +0100, Gregor Jasny wrote:
> Hello,
> 
> do you have any objections or blockers for a new v4l-utils release on the
> upcoming weekend?

No objections.

-- 
Sakari Ailus

