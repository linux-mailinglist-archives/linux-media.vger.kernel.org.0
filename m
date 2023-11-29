Return-Path: <linux-media+bounces-1321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 192B77FD23E
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A8981C210DA
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 09:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1023B14003;
	Wed, 29 Nov 2023 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQamiLbz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D063F10E2;
	Wed, 29 Nov 2023 01:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701249512; x=1732785512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fg/SG84dFmw5xtLeQyneQ3hhwKW3Ii9jSwQZ6X2juJ0=;
  b=MQamiLbz8b1au58frvr4aW9c6w7O+QkaVm9PVFXB1iVuaeGjHC6fUZzM
   U0DbvbiiqTfpPEPt+lbekKuQ7RXuQLVtVbxVz57vPrGH0k5DjhXFmUdic
   HP+H4Onz+6xoWhoCMrtYZj7iBEUWIBwR4CA6vqThgov2zn0QYhbxtBaKm
   3klzhHYJkrERcVwRMGgkj4FojhhpHyuudnqCRL6P1l5f2woOTf+jDOn33
   OhVdTnfKyGXRP60X7WkuVxOz+HB86HO+tSpsYHjTs4vbN42exEbHsrQqg
   qbvuj6iTZjn6/CA/VgXXg6W8qQxPZSgkuRIWp+iKjnXEUvVm1RmDgRBrp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392876798"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392876798"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 01:18:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762242261"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="762242261"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga007.jf.intel.com with SMTP; 29 Nov 2023 01:18:25 -0800
Received: by stinkbox (sSMTP sendmail emulation); Wed, 29 Nov 2023 11:18:24 +0200
Date: Wed, 29 Nov 2023 11:18:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
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
Message-ID: <ZWcB4Ak8QnwkhObR@intel.com>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
 <87h6l66nth.fsf@intel.com>
 <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
 <ZWXv1Oi_sH0BRWao@intel.com>
 <2mnodqvu2oo674vspiy4gxhglu3it5cq47acx5itnbwevgc4cf@c7h2bvnx3m2n>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2mnodqvu2oo674vspiy4gxhglu3it5cq47acx5itnbwevgc4cf@c7h2bvnx3m2n>
X-Patchwork-Hint: comment

On Wed, Nov 29, 2023 at 10:11:26AM +0100, Maxime Ripard wrote:
> Hi Ville,
> 
> On Tue, Nov 28, 2023 at 03:49:08PM +0200, Ville Syrjälä wrote:
> > On Tue, Nov 28, 2023 at 02:29:40PM +0100, Maxime Ripard wrote:
> > > On Tue, Nov 28, 2023 at 02:54:02PM +0200, Jani Nikula wrote:
> > > > On Tue, 28 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
> > > > > All the drm_connector_init variants take at least a pointer to the
> > > > > device, connector and hooks implementation.
> > > > >
> > > > > However, none of them check their value before dereferencing those
> > > > > pointers which can lead to a NULL-pointer dereference if the author
> > > > > isn't careful.
> > > > 
> > > > Arguably oopsing on the spot is preferrable when this can't be caused by
> > > > user input. It's always a mistake that should be caught early during
> > > > development.
> > > > 
> > > > Not everyone checks the return value of drm_connector_init and friends,
> > > > so those cases will lead to more mysterious bugs later. And probably
> > > > oopses as well.
> > > 
> > > So maybe we can do both then, with something like
> > > 
> > > if (WARN_ON(!dev))
> > >    return -EINVAL
> > > 
> > > if (drm_WARN_ON(dev, !connector || !funcs))
> > >    return -EINVAL;
> > > 
> > > I'd still like to check for this, so we can have proper testing, and we
> > > already check for those pointers in some places (like funcs in
> > > drm_connector_init), so if we don't cover everything we're inconsistent.
> > 
> > People will invariably cargo-cult this kind of stuff absolutely
> > everywhere and then all your functions will have tons of dead
> > code to check their arguments.
> 
> And that's a bad thing because... ?
> 
> Also, are you really saying that checking that your arguments make sense
> is cargo-cult?
> 
> We're already doing it in some parts of KMS, so we have to be
> consistent, and the answer to "most drivers don't check the error"
> cannot be "let's just give on error checking then".
> 
> > I'd prefer not to go there usually.
> > 
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
> Honestly, I don't care as long as it's something we can unit-test to
> make sure we make it consistent. We can't unit test a complete kernel
> crash.

Why do you want to put utterly broken code into a unit test?

-- 
Ville Syrjälä
Intel

