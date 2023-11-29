Return-Path: <linux-media+bounces-1357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E4B7FD5F0
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 12:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A67FDB216E8
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 11:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0863B1D528;
	Wed, 29 Nov 2023 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVIY59PY"
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 29 Nov 2023 03:41:49 PST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8703C4;
	Wed, 29 Nov 2023 03:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701258110; x=1732794110;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=w91TqZU/Sz95TBAtE+lLgPRTyMnYI3/7ak+ZXvIxwqY=;
  b=IVIY59PY2nmI34Vxl+3e70xlIK4bnrx6q7yyTPt0My8bGdNinYgSBbIy
   OElb5mjET9zVtpoTq2JdYV8ARKdl/9dOPQVFUD88SimIq1a6D4swPHpAB
   ai5mXguu4Ry/0T3sdLLLw89UzK4FJhAB98+lufdce4aTwJn5uANQGFGpw
   olcagkl67s51Jz3KcyksvcIxoJcCWmgS1w3g7yST8g2X/lhyj7Vs6e/L9
   0IcME2kDIFWl2vVo0W3LRa0GBFnp9CFLTyT1hwT0gtMaJPZOtG1PS971k
   /bNjkOxwyKglRkseeGlrVr5gvIGNUyI4unFHw+5IC/7u8LHLMTOMasbNL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="35035"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="35035"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 03:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="942291528"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="942291528"
Received: from dstavrak-mobl.ger.corp.intel.com (HELO localhost) ([10.252.60.61])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 03:40:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Thomas
 Zimmermann
 <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>, Jonathan Corbet
 <corbet@lwn.net>, linux-kernel@vger.kernel.org, Samuel Holland
 <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org, Hans Verkuil
 <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai
 <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
In-Reply-To: <kygezdrfz56zj6lmq6l5s5yyys2urgq3id7r5n4mb3afn5kc5q@eswnd6a2ihqc>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
 <87h6l66nth.fsf@intel.com>
 <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
 <ZWXv1Oi_sH0BRWao@intel.com>
 <2mnodqvu2oo674vspiy4gxhglu3it5cq47acx5itnbwevgc4cf@c7h2bvnx3m2n>
 <8734wo7vbx.fsf@intel.com>
 <kygezdrfz56zj6lmq6l5s5yyys2urgq3id7r5n4mb3afn5kc5q@eswnd6a2ihqc>
Date: Wed, 29 Nov 2023 13:40:38 +0200
Message-ID: <87ttp46b49.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
> On Wed, Nov 29, 2023 at 11:38:42AM +0200, Jani Nikula wrote:
>> On Wed, 29 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
>> > Hi Ville,
>> >
>> > On Tue, Nov 28, 2023 at 03:49:08PM +0200, Ville Syrj=C3=A4l=C3=A4 wrot=
e:
>> >> On Tue, Nov 28, 2023 at 02:29:40PM +0100, Maxime Ripard wrote:
>> >> > On Tue, Nov 28, 2023 at 02:54:02PM +0200, Jani Nikula wrote:
>> >> > > On Tue, 28 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
>> >> > > > All the drm_connector_init variants take at least a pointer to =
the
>> >> > > > device, connector and hooks implementation.
>> >> > > >
>> >> > > > However, none of them check their value before dereferencing th=
ose
>> >> > > > pointers which can lead to a NULL-pointer dereference if the au=
thor
>> >> > > > isn't careful.
>> >> > >=20
>> >> > > Arguably oopsing on the spot is preferrable when this can't be ca=
used by
>> >> > > user input. It's always a mistake that should be caught early dur=
ing
>> >> > > development.
>> >> > >=20
>> >> > > Not everyone checks the return value of drm_connector_init and fr=
iends,
>> >> > > so those cases will lead to more mysterious bugs later. And proba=
bly
>> >> > > oopses as well.
>> >> >=20
>> >> > So maybe we can do both then, with something like
>> >> >=20
>> >> > if (WARN_ON(!dev))
>> >> >    return -EINVAL
>> >> >=20
>> >> > if (drm_WARN_ON(dev, !connector || !funcs))
>> >> >    return -EINVAL;
>> >> >=20
>> >> > I'd still like to check for this, so we can have proper testing, an=
d we
>> >> > already check for those pointers in some places (like funcs in
>> >> > drm_connector_init), so if we don't cover everything we're inconsis=
tent.
>> >>=20
>> >> People will invariably cargo-cult this kind of stuff absolutely
>> >> everywhere and then all your functions will have tons of dead
>> >> code to check their arguments.
>> >
>> > And that's a bad thing because... ?
>> >
>> > Also, are you really saying that checking that your arguments make sen=
se
>> > is cargo-cult?
>>=20
>> It's a powerful thing to be able to assume a NULL argument is always a
>> fatal programming error on the caller's side, and should oops and get
>> caught immediately. It's an assertion.
>
> Yeah, but we're not really doing that either. We have no explicit
> assertion anywhere. We take a pointer in, and just hope that it will be
> dereferenced later on and that the kernel will crash. The pointer to the
> functions especially is only deferenced very later on.
>
> And assertions might be powerful, but being able to notice errors and
> debug them is too. A panic takes away basically any remote access to
> debug. If you don't have a console, you're done.
>
>> We're not talking about user input or anything like that here.
>>=20
>> If you start checking for things that can't happen, and return errors
>> for them, you start gracefully handling things that don't have anything
>> graceful about them.
>
> But there's nothing graceful to do here: you just return from your probe
> function that you couldn't probe and that's it. Just like you do when
> you can't map your registers, or get your interrupt, or register into
> any framework (including drm_dev_register that pretty much every driver
> handles properly if it returns an error, without being graceful about
> it).

Those are all dynamic things that can fail.

Quite different from passing NULL dev, connector, or funcs to
drm_connector_init() and friends.

I think it's wrong to set the example that everything needs to be
checked, everything needs to return an error, every call needs to check
for error return, all the time, everywhere. People absolutely will cargo
cult that, and that's what Ville is referring to.

If you pass NULL dev, connector, or funcs to drm_connector_init() I
think you absolutely deserve to get an oops.

For dev, you could possibly not have reached the function with NULL
dev. (And __drm_connector_init() has dev->mode_config before the check,
so you'll get a static analyzer warning about dereference before the
check.) If you have NULL connector, you didn't check for allocation
failure earlier. If you have NULL funcs, you just passed NULL, because
it's generally supposed to be a pointer to a static const struct.

>> Having such checks in place trains people to think they *may* happen.
>
> In most cases, kmalloc can't fail. We seem to have a very different
> policy towards it.

Again, dynamic in nature and can fail.

>> While it should fail fast and loud at the developer's first smoke test,
>> and get fixed then and there.
>
> Returning an error + a warning also qualifies for "fail fast and loud".
> But keeps the system alive for someone to notice in any case.

But where do you draw the line? If we keep adding these checks to things
that actually can't happen, we teach developers we need to check for
impossible things. And we teach them not to trust anything.

I scroll down the file and reach
drm_connector_attach_edid_property(). Should we NULL check connector?
Should we change the function to int and return a value? Should the
caller check the value? Then there's drm_connector_attach_encoder(). And
drm_connector_has_possible_encoder(). And so on and so forth.

Where do you draw the line?


BR,
Jani.


--=20
Jani Nikula, Intel

