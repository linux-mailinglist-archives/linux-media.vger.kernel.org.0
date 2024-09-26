Return-Path: <linux-media+bounces-18613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F26239871B1
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82045288CB0
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2831AE875;
	Thu, 26 Sep 2024 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eViiPSQz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ABB1AE85B
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347131; cv=none; b=WDBi9D52rMPUeAwvxS3elX7KHSyldl4qsaPy0Auc7z87Ex+gHXskSVRcQySQocGG9l3u9cZ28tDuTJ8jpzPK/B6+5X2mmC00K2Xz60wkXpHX2L1hVfk+/ZGHGBhnLw2RSoXKGeG8z2MM88Kq+dEROMOcjN2mfgsJWme3/gBVAd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347131; c=relaxed/simple;
	bh=POOc6vT8kwAk+EkbWfPFea9v3Wh2pDNmQSkBLxDKdkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8+ZzZbUqNj7X7cyjrYPeXlk7HGayKGmaW9LJfs29jDnWxT9pTU5hp3ZOUhEhfoqav3M4wpdRf2StxLRTqR1UHRTGlA84EnHu3U456zrnM49SLh4Fj+lTfE3zx22t2TK6Yd96HIFRyZ23Sx7X1jgFwkAeWlp5yrAECc5c22BKIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eViiPSQz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727347130; x=1758883130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=POOc6vT8kwAk+EkbWfPFea9v3Wh2pDNmQSkBLxDKdkE=;
  b=eViiPSQz7MNHjdTEzjN50doPCMQF+oLsT/9xysGVGjo8CuRSdmZ4Iu6r
   B1LZbOfeag27pSm1cVJKrIvnp1DkOJCBqlaKl/yQd8DWOYLfHJKOsTN8a
   QCffqQ4JsL43nLpHKUjtNkYYdTToP2H0cgnmLKvon4K5aEWAcIxxhqihr
   TSWxEZrNkpsVQTm1GNN+NaqZOPhh4mJIsaB5O6Af+s8f2gt9rJVhnRJ8I
   0iUdnqqllYo7QE7+WcfpKoFJB9/m6qDZdFcESprsNjGRQ5cAnwQRhSYrv
   pt8Hbt3An/q7isJ4uV1oPfT6oP01LgBfTbH8oyJ7yPXAK5/14WWKXTSfA
   w==;
X-CSE-ConnectionGUID: k9yZBk5mTXm5Sk8J3S6BdQ==
X-CSE-MsgGUID: t1y5L7hPStSMnHTeLti5Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="30226833"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="30226833"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 03:38:49 -0700
X-CSE-ConnectionGUID: WfALO+UGSJCjivtlcEhOPg==
X-CSE-MsgGUID: RHQ1ojJiSjuVIVlTt0d+3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="76178239"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 03:38:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DFA6F11F843;
	Thu, 26 Sep 2024 13:38:40 +0300 (EEST)
Date: Thu, 26 Sep 2024 10:38:40 +0000
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
Message-ID: <ZvU5sF7KC03x-LMu@kekkonen.localdomain>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
 <20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
 <20240918132323.2a384f87@sal.lan>
 <20240925195653.GJ30399@pendragon.ideasonboard.com>
 <20240926003815.6537fdbb@foz.lan>
 <20240926103002.GB21788@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926103002.GB21788@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Sep 26, 2024 at 01:30:02PM +0300, Laurent Pinchart wrote:
> > See, the main repository is hosted at linuxtv.org. We intend to avoid 
> > as much as possible rebases at the media tree at linuxtv.org, on both
> > fixes and next branches.
> > 
> > The media-committers tree at fdo is focused on executing patches at CI
> > and should only be used by committers. All other developers should base 
> > their work at the repository stored at linuxtv.org[1].
> 
> That I don't like. We want people working on the media subsystem to test
> the very latest code, and to base their work on the tree that their
> patches will land in. Otherwise there will be conflicts, and the risk of
> conflict will increase as we pick up pace with the new workflow and
> merge patches faster.

I was under the impression the tree at linuxtv.org would be synchronised
(very) often or even updated based on a git hook, effectively making it a
mirror.

-- 
Kind regards,

Sakari Ailus

