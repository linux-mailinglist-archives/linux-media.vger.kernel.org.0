Return-Path: <linux-media+bounces-18617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE69871FB
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76239B2B087
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7271AC883;
	Thu, 26 Sep 2024 10:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwk1Gk56"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B00F17BB30
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347701; cv=none; b=X6mFbJbX9gMySLi0fZDlMGiRPsxaQvUTulI4cULpK83AGb1Qgq3/Mkh2tVTvmdFfEvMlxe26a3t4zqjYe8KUHFZraoU/DXEB2AspRrf7IVq9Aoo7OmVDtD6dp62DDP/soKTxRUuoTuaqHV8ZYpdNsoD4Aa6Ww1YXk8DGFszSdsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347701; c=relaxed/simple;
	bh=xGL49dih6zY8V7dgT2Oly0wkh4FoBoXTaaWYLBxmJxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFpxdEMd0GN6k3uht/5+RE7p/pOqHjoSG9gk7U6OsvmekgupkZkeapWcxkSZ9SutkksEC90AhgSIFVtRNJob/+pxkPvGub6ufaqA2Q/IO2L4A78B+cZWpAIeq3ZYFGaXyQOqfg3csi9kx8Vobm5xlia7nmyL75lddX0DkSaKl3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwk1Gk56; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727347700; x=1758883700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xGL49dih6zY8V7dgT2Oly0wkh4FoBoXTaaWYLBxmJxw=;
  b=cwk1Gk56qK12wC8ZU8rootngmOggrAKRCr08MhBTdq1kdmuY0USPg/Sa
   pp10W0HjLsIToGmTd5dAybsvPJm4foII4xjNUfdjMHJWP7xodNGIo97tM
   RUe4+nnBpIfPqCaTt8KXczRokom6OH4CSi+3ZoziM1moCQ1qhaCJXqWAp
   zX0xU28HxqzF0SNYzvp9nL2Duo0WAkcnuhhJ4V/aMSn6Lff3Wrq5Kw8sn
   gJ8781DuF1mVcDE8cmVnkhhFR5ZqMU9JkIWxEkmq7Hl5XY02vxxo5dxn7
   hqTSnZWAldF7b1x2TE8hlJgqT+m2cIpCFHkdo+7Cb5cNd5yPOugvTi9bj
   Q==;
X-CSE-ConnectionGUID: +WtRYPpzQBCwRPOeEYG1Pw==
X-CSE-MsgGUID: 0hn/9vy4QjG3CTjHmcl7hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="51848407"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="51848407"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 03:48:19 -0700
X-CSE-ConnectionGUID: dRZ/Fd8nRl6CDVFe9J/7uQ==
X-CSE-MsgGUID: IVXuTIqiQRaDCPJDamimag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="72108188"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 03:48:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A3BAA11F843;
	Thu, 26 Sep 2024 13:48:11 +0300 (EEST)
Date: Thu, 26 Sep 2024 10:48:11 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <ZvU76zS-UDbEEd-2@kekkonen.localdomain>
References: <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
 <20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
 <20240918132323.2a384f87@sal.lan>
 <20240925195653.GJ30399@pendragon.ideasonboard.com>
 <20240926003815.6537fdbb@foz.lan>
 <20240926103002.GB21788@pendragon.ideasonboard.com>
 <ZvU5sF7KC03x-LMu@kekkonen.localdomain>
 <20240926104154.GE21788@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926104154.GE21788@pendragon.ideasonboard.com>

On Thu, Sep 26, 2024 at 01:41:54PM +0300, Laurent Pinchart wrote:
> On Thu, Sep 26, 2024 at 10:38:40AM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Thu, Sep 26, 2024 at 01:30:02PM +0300, Laurent Pinchart wrote:
> > > > See, the main repository is hosted at linuxtv.org. We intend to avoid 
> > > > as much as possible rebases at the media tree at linuxtv.org, on both
> > > > fixes and next branches.
> > > > 
> > > > The media-committers tree at fdo is focused on executing patches at CI
> > > > and should only be used by committers. All other developers should base 
> > > > their work at the repository stored at linuxtv.org[1].
> > > 
> > > That I don't like. We want people working on the media subsystem to test
> > > the very latest code, and to base their work on the tree that their
> > > patches will land in. Otherwise there will be conflicts, and the risk of
> > > conflict will increase as we pick up pace with the new workflow and
> > > merge patches faster.
> > 
> > I was under the impression the tree at linuxtv.org would be synchronised
> > (very) often or even updated based on a git hook, effectively making it a
> > mirror.
> 
> If it's a mirror then it doesn't matter which tree people use :-)

No, it doesn't. We should probably provide both but do the synchronisation
better than it's done for linux-firmware.git.

-- 
Sakari Ailus

