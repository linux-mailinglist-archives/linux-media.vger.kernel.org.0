Return-Path: <linux-media+bounces-60252-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF4lOG1R+GmQsQIAu9opvQ
	(envelope-from <linux-media+bounces-60252-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 09:57:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E502C4B9BA0
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 09:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C19AE30086B5
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 07:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39358314B73;
	Mon,  4 May 2026 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrXLITtU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADB33033D6;
	Mon,  4 May 2026 07:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881400; cv=none; b=TNQOFLWxc9GobZLBNU4EMbePqIUOCTaazIr8huD5wCBorcX6oduEcghk8u/jiGVmBBrXK+aCb+OAEwu+Li7eG7laYEnzJBu64csosg1OFk/gjPf62BJorIMmN39BQv9UJsk0nyIaxqfzJPWQ6ng/vvSMv7dVvAdazsPLjT9u9gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881400; c=relaxed/simple;
	bh=EU6GNMPxyqZpjatfpAqkrmjlNPcqAxcQGexzOkAfu0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESSl03gMzroynf7IX4DcywvuygrBH7bphw+YmOSq01Ged/WhiM5hMf6wZTWaRD0OgYWJEUq8J2m1uuGwJUi5y9OQ38fFE/BCoAY8YJa8SpleWFg1s10u0lB8v8s4mDwBwjDW5gbV8Al3QSh4GpUDi05LfphMexXOYTS0rDtnPcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrXLITtU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777881400; x=1809417400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EU6GNMPxyqZpjatfpAqkrmjlNPcqAxcQGexzOkAfu0w=;
  b=LrXLITtUxdHC4SWJ/MEhJWbn4KLyvQS1GeetJRLWcpyXOtDGWKqvA8sh
   b3O5XS233WdtJCrqLr4Pexw9+QLKEzWqGaPgL+wJzlBVbafSGnXImTOD3
   C55eYmWtGG3hz60u91mj5lo9tg6du9JLqoqP+CWhJNdgEObQ0LB0g/Kze
   xYmmko+8x9D8CNQ8gKp1JKSradRi9l52t/JdyFjdvpfwQLUpRYIefOIRx
   TeAAdBXSd8NWtiROuBewxEtbk14NouM/Gdd+V2VAP1xqcsxIduIk7lIq9
   v2CVpxwM/blXDsZeEI928C9ut5iDImqV13ZfEddKnbQxVWWnvzbLdp4Ki
   w==;
X-CSE-ConnectionGUID: X6hIBdWnRWSufaSfY57znQ==
X-CSE-MsgGUID: N60SBKrgTaijisu7eI4eXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78441258"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78441258"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 00:56:39 -0700
X-CSE-ConnectionGUID: lCvPEamETZq0u/3UJ7xUqg==
X-CSE-MsgGUID: pT1gv9KjQPilMC7nT4onIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="235705935"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.114])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 00:56:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A7621121CC4;
	Mon, 04 May 2026 10:56:34 +0300 (EEST)
Date: Mon, 4 May 2026 10:56:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 3/6] media: i2c: lm3560: Optimize mutex lock usage
Message-ID: <afhRMmtzOwQllJ6-@kekkonen.localdomain>
References: <20260503164445.215540-1-clamor95@gmail.com>
 <20260503164445.215540-4-clamor95@gmail.com>
 <afg8JPS3KGMO4xj9@kekkonen.localdomain>
 <CAPVz0n1JjHY2R3fEhkt4Ejwq81K=uHVrZQjkJ5dUDYJOFN_mmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n1JjHY2R3fEhkt4Ejwq81K=uHVrZQjkJ5dUDYJOFN_mmQ@mail.gmail.com>
X-Rspamd-Queue-Id: E502C4B9BA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60252-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]

Hi Svyatoslav,

On Mon, May 04, 2026 at 10:37:40AM +0300, Svyatoslav Ryhel wrote:
> пн, 4 трав. 2026 р. о 09:26 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> >
> > Hi Svyatoslav,
> >
> > On Sun, May 03, 2026 at 07:44:42PM +0300, Svyatoslav Ryhel wrote:
> > > Pass the device's own mutex lock to the control handler so that the media
> > > framework can handle control access instead of managing it manually. The
> > > lock must be common to both sub-devices since they share same hardware,
> > > so the individual sub-device locks will not work here.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/media/i2c/lm3560.c | 19 ++++++-------------
> > >  1 file changed, 6 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> > > index edfb07587cab..5b568ed9536b 100644
> > > --- a/drivers/media/i2c/lm3560.c
> > > +++ b/drivers/media/i2c/lm3560.c
> > > @@ -162,14 +162,12 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
> > >       struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
> > >       int rval = -EINVAL;
> > >
> > > -     mutex_lock(&flash->lock);
> > > -
> > >       if (ctrl->id == V4L2_CID_FLASH_FAULT) {
> > >               s32 fault = 0;
> > >               unsigned int reg_val;
> > >               rval = regmap_read(flash->regmap, REG_FLAG, &reg_val);
> > >               if (rval < 0)
> > > -                     goto out;
> > > +                     return rval;
> > >               if (reg_val & FAULT_SHORT_CIRCUIT)
> > >                       fault |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
> > >               if (reg_val & FAULT_OVERTEMP)
> > > @@ -179,8 +177,6 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
> > >               ctrl->cur.val = fault;
> > >       }
> > >
> > > -out:
> > > -     mutex_unlock(&flash->lock);
> > >       return rval;
> > >  }
> > >
> > > @@ -190,8 +186,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
> > >       u8 tout_bits;
> > >       int rval = -EINVAL;
> > >
> > > -     mutex_lock(&flash->lock);
> > > -
> > >       switch (ctrl->id) {
> > >       case V4L2_CID_FLASH_LED_MODE:
> > >               flash->led_mode = ctrl->val;
> > > @@ -202,14 +196,12 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
> > >       case V4L2_CID_FLASH_STROBE_SOURCE:
> > >               rval = regmap_update_bits(flash->regmap,
> > >                                         REG_CONFIG1, 0x04, (ctrl->val) << 2);
> > > -             if (rval < 0)
> > > -                     goto err_out;
> > >               break;
> > >
> > >       case V4L2_CID_FLASH_STROBE:
> > >               if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
> > >                       rval = -EBUSY;
> > > -                     goto err_out;
> > > +                     break;
> > >               }
> > >               flash->led_mode = V4L2_FLASH_LED_MODE_FLASH;
> > >               rval = lm3560_mode_ctrl(flash);
> > > @@ -218,7 +210,7 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
> > >       case V4L2_CID_FLASH_STROBE_STOP:
> > >               if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
> > >                       rval = -EBUSY;
> > > -                     goto err_out;
> > > +                     break;
> > >               }
> > >               flash->led_mode = V4L2_FLASH_LED_MODE_NONE;
> > >               rval = lm3560_mode_ctrl(flash);
> > > @@ -239,8 +231,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
> > >               break;
> > >       }
> > >
> > > -err_out:
> > > -     mutex_unlock(&flash->lock);
> > >       return rval;
> > >  }
> > >
> > > @@ -328,6 +318,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
> > >       if (fault != NULL)
> > >               fault->flags |= V4L2_CTRL_FLAG_VOLATILE;
> > >
> > > +     hdl->lock = &flash->lock;
> > > +
> > >       if (hdl->error)
> > >               return hdl->error;
> > >
> > > @@ -363,6 +355,7 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
> > >       if (rval < 0)
> > >               goto err_out;
> > >       flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
> > > +     flash->subdev_led[led_no].state_lock = &flash->lock;
> >
> > I must have missed it earlier but you can use the control handler's mutex
> > here. As a result, I believe you can drop the driver's own mutex
> > altogether.
> >
> 
> Control handler mutexes are per device, but both devices share the
> same hardware so those mutexes will not prevent simultaneous access
> from both devices. For this reason driver's own mutex is used.

Right. You could still use one for the other handler.

Feel free to keep it as-is, too.

> 
> > >
> > >       rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
> > >       if (rval < 0) {
> >

-- 
Sakari Ailus

