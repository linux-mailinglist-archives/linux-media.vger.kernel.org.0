Return-Path: <linux-media+bounces-1348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B72D47FD419
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 11:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 703B4283339
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07CA1B272;
	Wed, 29 Nov 2023 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKtkqDDn"
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 29 Nov 2023 02:26:50 PST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C59C4;
	Wed, 29 Nov 2023 02:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701253610; x=1732789610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PAI5mu2vOQLNfBq6uCf/1RnujVA0d7SiwZnOV/K8ThI=;
  b=aKtkqDDnmkQ7J84Tp0ydc10SoWMO4R4w+tEc1ixu/iwAsUWNLK7DbWaG
   y6JyPZYdg1Ts7BQQXHJGIUVUo6/K2J2iCoAety39CT47muEcBz09tIkI6
   Yi0ODJPICiFW1PJbNhuYgsTtxkAfF2PJ39rzUyba0sPLk0Rb/qLOs32by
   +cG+H6XM+FMoXh8aTCTwI/KKoD6gNt/HhkWvAoRO5eJjdbN/z6bPSHRMi
   023jBDAJJC5jiwVrx7PIWBnNzAXI67lrBe26A5zdZVdFmewFdJbRmbSYE
   VDVRFNx7Oxowh5DJxkFpWXIuifiVGjpXkk1z2ynC4YwLV1CRNZiHD2+AW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="121910"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="121910"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 02:25:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762269751"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="762269751"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga007.jf.intel.com with SMTP; 29 Nov 2023 02:25:38 -0800
Received: by stinkbox (sSMTP sendmail emulation); Wed, 29 Nov 2023 12:25:37 +0200
Date: Wed, 29 Nov 2023 12:25:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-doc@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
Message-ID: <ZWcRoTJ9VgOqZ3ts@intel.com>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
 <87h6l66nth.fsf@intel.com>
 <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
 <ZWXv1Oi_sH0BRWao@intel.com>
 <20231129121259.47746996@eldfell>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129121259.47746996@eldfell>
X-Patchwork-Hint: comment

On Wed, Nov 29, 2023 at 12:12:59PM +0200, Pekka Paalanen wrote:
> On Tue, 28 Nov 2023 15:49:08 +0200
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > Should we perhaps start to use the (arguably hideous)
> >  - void f(struct foo *bar)
> >  + void f(struct foo bar[static 1])
> > syntax to tell the compiler we don't accept NULL pointers?
> > 
> > Hmm. Apparently that has the same problem as using any
> > other kind of array syntax in the prototype. That is,
> > the compiler demands to know the definition of 'struct foo'
> > even though we're passing in effectively a pointer. Sigh.
> 
> 
> __attribute__((nonnull)) ?

I guess that would work, though the syntax is horrible when
you need to flag specific arguments.

-- 
Ville Syrjälä
Intel

