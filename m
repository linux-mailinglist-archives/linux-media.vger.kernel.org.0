Return-Path: <linux-media+bounces-58815-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDFdHk+U32leWQAAu9opvQ
	(envelope-from <linux-media+bounces-58815-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 15:36:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5634404E50
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 15:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27736303D321
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 13:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E87727B340;
	Wed, 15 Apr 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XZxiFnH5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABFA1DC198
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260146; cv=none; b=ajunakX3l4/3C76ofMdGkcMWXraajRpviJQ0Wq8VPeNX50xVwQP74d5K5sLD+XyFiwWHJ83hLRnEtjK3UdwN/S2VHqnj/RunBjFLH7KE0gk4cev/BZgcx6TXR512EQEctkwbsJZLQwZVM5PIehJM+52YTkQdcKdaIr0wkYEHlm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260146; c=relaxed/simple;
	bh=RS7UJtHhCPH+05QWgzFgMkLSeubM8auCuZPsL79baZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4byyaRqzeZvNrKJCTsyk1Q/1IlISJ0Ad5pCyT0Cbr2YMK8zC6J5HBiq3txgR0yb25yBxtfPcueK2kxBMg8yI0RQuFcR++BNH+XXwyjXmHce6bNV9GSWWmmEON+pcGRhXLz2hvS1gTCQ4jc+fTsVgdyjQKl7gqTw/XtCzQ3SHN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XZxiFnH5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3746BF04;
	Wed, 15 Apr 2026 15:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776260049;
	bh=RS7UJtHhCPH+05QWgzFgMkLSeubM8auCuZPsL79baZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZxiFnH5kEG641rkaGTcS3R766fu4TliHxBPgDyNkGwtA/RxQ2K5LZZrPxwXRzsyR
	 NlqGvhA1LsVjEX3zoparahKCKrumcnrEY/7hjSTJXv76yseiudE7AgqlrTeTfbIWm7
	 0b3I1wSHNR/nQw1LTFzNJw3VxUnOHqweJYmsWZ1E=
Date: Wed, 15 Apr 2026 15:35:39 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, jai.luthra@ideasonboard.com
Subject: Re: [PATCH 1/1] media: Documentation: Improve PIXEL_RATE control
 documentation
Message-ID: <ad-RcFZO67FgrIqx@zed>
References: <20260414103559.1021712-1-sakari.ailus@linux.intel.com>
 <ad5d_I4LGrLLEVK2@zed>
 <ad6OuAisjkvnesdz@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad6OuAisjkvnesdz@kekkonen.localdomain>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58815-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: D5634404E50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Tue, Apr 14, 2026 at 10:00:08PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Apr 14, 2026 at 05:46:51PM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Tue, Apr 14, 2026 at 01:35:59PM +0300, Sakari Ailus wrote:
> > > Document explicitly that the PIXEL_RATE control reflects the actual
> > > frequency at which the pixels are read in the pixel array. It is thus
> > > orthogonal to analogue binning.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > > index 6d516f041ca2..8616bcd67270 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > > @@ -41,6 +41,11 @@ Image Process Control IDs
> > >      The configuration of the frame rate is performed by selecting the desired
> > >      horizontal and vertical blanking. The unit of this control is Hz.
> > >
> > > +    Note that this control isn't affected by analogue binning as the pixels are
> > > +    still being read at the same frequency as without analogue binning, only
> > > +    what is being read is different (a single pixel value vs. a binned pixel
> > > +    value based on the values of two or more pixels).
> > > +
> >
> > This breaks the model implemented to support "special" (aka analogue
> > ?) binning mode on imx219 where we double the pixel rate to express an
> > higher frame rate and halve the blanking values before writing them to
> > registers
>
> Note that this patch is a clarification to the existing documentation, not
> a change as such. It was never expected to be used as it is currently in
> the imx219 driver.
>
> >
> > I guess we have to keep this mode working not to break existing
> > userspace, also because it's the only way we can have it working
> > without the introduction of the FLL and LLP controls.
>
> The other option is indeed to leave the HBLANK as-is but based on a
> discussion with Jai I decided to write a patch to remove the rate
> multiplier. Overall I'd say it'd be better to change this now rather than
> leave imx219 using a different interface behaviour than the rest.
>

imx219 is PiCamera module v2, it's very popular, I would be careful
changing it. If I'm not mistaken (please confirm) your series now
require userspace to program FLL and LLP in units of two lines when
using binning. What would happen to existing userspace with the new
version ?

Again, I would defer it to Dave as the maintainer.

> >
> > With the new model and FLL and LLP controls, I presume analog binning
> > would require userspace to program halved FLL and LLP values ?
>
> The userspace would in fact use LLP and FLL as the sensor does, there's no
> need to divide or multiply these values with another variable.
>
> >
> > Currently in your proposal of V4L2_CID_BINNING_FACTORS it doesn't seem
> > there is a way to distinguish between  a digital and an analogue
> > binning mode, they're both 2x2 so I guess it's the driver that has to
> > realize that if FLL and LLP are smaller the [output width + blank] it
> > has to activate the analogue binning mode ?
>
> The driver is indeed responsible for setting the limits for FLL and LLP (or
> blanking) controls depending on binning and analogue cropping
> configuration, a sensor supporting analogue binning is not a special case
> as such.

Maybe I wasn't clear

The imx219 supports 2 different 2x2 binning modes

#define IMX219_BINNING_X2		0x01
#define IMX219_BINNING_X2_ANALOG	0x03

We currently use X2_ANALOG unconditionally, and your patches do not
change this, I agree.

My thinking was in general, is there a need to distinguish between a
2x2 digital binning and a 2x2 analog binning ? Does the new API allow
to do so ?

>
> >
> >
> > >  ``V4L2_CID_TEST_PATTERN (menu)``
> > >      Some capture/display/sensor devices have the capability to generate
> > >      test pattern images. These hardware specific test patterns can be
>
> --
> Kind regards,
>
> Sakari Ailus

