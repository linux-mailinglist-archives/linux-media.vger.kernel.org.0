Return-Path: <linux-media+bounces-64233-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XNcaA1wFJ2qrqAIAu9opvQ
	(envelope-from <linux-media+bounces-64233-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:09:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 547166598E3
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:09:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=oM8Vxg1X;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64233-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64233-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C3F43045B13
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 18:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C88383C77;
	Mon,  8 Jun 2026 18:06:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0393C382289
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 18:06:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941982; cv=pass; b=Jt2sw7GwcLkUBKn4m/EG4ku6+Y0UlG2+1Q/Ctj1HMRUMyBWlWALi/3c1HIaeng13ofQp5ZmXNVNqOHAySxvgolObY4oNI3aF+2y+qnIPn73cp/ztxTQZTiT/l5wh2hRERdAkVvrrnNgpDz9C+uawuxubTYwUE1G5eYjVutMuNwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941982; c=relaxed/simple;
	bh=5JNVXy9uJUh+MRKOYsCPM4hnKfoXVm7ZsO/j0woVB78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LjRZzuO+80u0UQtgbSR9EPkoHPJWkRfzhAf5hSy8mXrB2PRRq2IfXdcnvl6LLSqRAYZxgKwPuHeUonlfOfZLbC3Ii4DPvCQbh4OIWVts4zfwaK4TLvnh973sPdLKWD63yGp9D1koVzEU9eKAq5dWoXJjjhTLzsrqGGhAeWrLJ+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=oM8Vxg1X; arc=pass smtp.client-ip=209.85.128.171
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7ea6923cc94so47024807b3.3
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 11:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780941979; cv=none;
        d=google.com; s=arc-20240605;
        b=lmMwjsqGqVoeCkz4HQktCl/3pvDKn+2v82Xx/9oCQZpwO3HAUP7VNRIMSUBjv59y+6
         MgtzOiW/4VgxwD5amKha2hLVl0QeRexWQsz/so3h0aLRoVi2n4fHvDmxQqfTQl4V2dVm
         8ev6l8NOMW5sqMqeTizRcIp5hAO6O+utS5RhdgJ628et4FTzZbKRrzF+OmjxJu0iN0Q6
         vvM4BjO5p/4ck5p367VdRxvbkaF0HlE7+66tbBqOa0iuX9CAc0c/VNNdjF/t5Pe9qwm0
         mSTW90HFB6snuho/izDKVByHVU/NyABEibnr7YdDvPcvVH2yJGQsyGluQW4e6PCfeFfu
         +SVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WNL1u4Mal4zuvQen36P4b9B/C+OP0/OU5K2mciduDVE=;
        fh=rV5H4WI1A4La5zSHrBh93lBApT5ADuyGfVgPu1Mu8x0=;
        b=jvOCwObfEBO0qmce+9FiT7m8Xo8IcqY/4Iy3fGlOM0lpqsR4OJLLUodlUa8ZpLGEPf
         A11XHPMEbxuQYaspp7YReQR6WcG0E+axXvAAThFSuBDYoUhPiFBuNKpkQHg7C4GT+pFE
         ni6yWnAvS+K/0EQvNykzSR82d71uy2hPzG/kPTze/+wjaXYpRQB+uqdi5lUCd0fWO1pS
         O8DdS/743O0oOikdxSUAvpLQykVe704wIdBXMmPh2wbT8pyenXDOBi7V4ABtEk8p1WE/
         FykHppEd7otmHxnWU4W4izuP3LzT74WHxZG/1cHIpKUQY3r/1P8iwUJsFBMEZwuhipfK
         DtDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1780941979; x=1781546779; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WNL1u4Mal4zuvQen36P4b9B/C+OP0/OU5K2mciduDVE=;
        b=oM8Vxg1XObfrNtuCfXN2+lIOgGVJuk9vAWJttkyrLy3BVgLL7pwa8m7zfIfF5z6dMd
         cEqGSWy4vlukYoM0ec/BWvHfsvt/OYFByDZV15ivw8LXOHQgVujPM7aUx3JEDMCY6b8B
         zvavvOY2zB+3jmjO1Hj2fPejIt/RlhkOGTijCZqOs324E9l88R1ntC/tzKUMQWUf2ew6
         MN6PpFYMZEhzsYPCmTxIHdY/Q2UEZBh2+q8lVtD1C1dLrhNnL3/7uZt/VXxol6OAEQX0
         78MeDm9LMhX8ldjjffEpe2QazwVXi4WVjTZm6WUjtEGIdy6stc2DsBNp5CZ4Xc/aKZ5w
         FUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941979; x=1781546779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNL1u4Mal4zuvQen36P4b9B/C+OP0/OU5K2mciduDVE=;
        b=HHIH4HErno+iCNVx/YroCqqBbFNlY1k6rji5Hx/Jl3O5ySHs5ijJe6b9ac6UDB7X7S
         VtFmxSZu6HBTfUKH5VayJUcbT2qGcqsA7qMDdjWudK+UNQ00K7bhtPP0VHRW+xu/FIUv
         df0e5VkI09OKo920GWWsEWBP+UgBEHJnsSn63AqZtJIeb0WrFGNMCBSqDNOmn9eyIl4I
         lznmM8oYw+jie6w9Px4oI/IgYu23esqyFuELCiJ4kK8GIaua1nH21hVfv6iF+d4eFkQq
         O4h2h69WlaUI42a72HnxvhYwuJIckFTvFwe3YEOvBfid8TuuFBkmvbpBkypcQ31XUVWK
         6VCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ap2gaN2l4++0ZEwnj3DklPRkxcu0bM9oLRo6eR/XcQe9DXJW+NKLApYnIQRMKbHAm0wWDeDFPskX0Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS8NphNJ24gSrtuANn9oWbqcAWbkjXIUP046D3rTnCU+ERWdab
	if8UBS4KMwzdsqLC6ouASMj2/YUQ3pLszN+puwWgZyJwCHy8hvhAMmEccOVnVfY4/ZQsU5Gp2Pq
	0LN9sHrBHEzApmtYryvJwJ3pJyAlbZ/0lkd0UjBP7Lw==
X-Gm-Gg: Acq92OFUQbvUiGYNe2oX3rRw5edBll2cxTNXv3Y/QEfDZlgXgY+gezWSZoFhjBsOYRb
	5LedJVwbv/p4iTsyPhf7dkgDZ4kigXJU55Mg2t7FZiSulg+ge4J5tPci/o9u9yReDyy1UeOXoTm
	BOhyBpqkzkJ1//ntle3NJMSX4d3zTzju5Bbdpi960eYWoMOw2nte54oDWlE2ZTMqiUtD3O1GgR7
	SIIkVVOznTI4lJtix2EPSUzVHz1PU0YfEoWCXXT6Vycr7kxypkdWXOQDOuAFk08LfjWtv+uikFm
	WDAgr751i1tOPvZ7+dqY4lKDQiyLx7dZxjOhS8jsDqZMeCfbC82xT++3ZdytvWlC8zgYgEFVTdF
	gDa9v8s+tT6WJcdGqV2iGiRnMkm6xNhRvZeA=
X-Received: by 2002:a05:690c:23c3:b0:798:4f55:2c5e with SMTP id
 00721157ae682-7ed0c80bfcamr155228637b3.30.1780941978758; Mon, 08 Jun 2026
 11:06:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com> <aiZnQgyEBkZH7er0@zed> <178091466607.16054.13972332068848565738@freya>
In-Reply-To: <178091466607.16054.13972332068848565738@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 8 Jun 2026 19:06:03 +0100
X-Gm-Features: AVVi8Cd1bMFnRkLlaXSIFq2ilcwPYQNBAB6m4QWF5AHP2z6mRA3KWL-L4pdhbS0
Message-ID: <CAPY8ntBshAPkN_7Swz4qpbOjhpu5Gfnd5VkZPrgUgUoNrM0pEg@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and
 exposure for analogue binning
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans@jjverkuil.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64233-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,jjverkuil.nl,vger.kernel.org,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,kernel.org,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:email,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 547166598E3

Hi Jai, Jacopo, Sakari, and Laurent

On Mon, 8 Jun 2026 at 11:31, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Jacopo, Sakari,
> ++ Dave, Hans and Laurent,
>
> Quoting Jacopo Mondi (2026-06-08 12:28:46)
> > Hi Sakari
> >
> > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > When vertical analogue binning is in use, the minimum frame length in
> > > lines decreases to around half of the normal. In relation to the sensor's
> > > output size this means vertical blanking can be negative but that's not an
> > > issue as control values are signed. Remove the workaround for this
> >
> > Didn't we just discussed two weeks ago in media summit how negative
> > blankings are a bad idea, and of all drivers one could decide to play
> > with imx219 is probably the worse due it's large use base and the fact
> > libcamera doesn't support negative blankings ?
> >
> > Have I missed something ?

I'll agree that I don't like the concept of negative blanking as it is
very counter-intuitive.

However libcamera *does* appear to support negative blanking through
the Pi pipeline handler.
Running with mainline Pi5 CFE driver, mainline libcamera, and imx219
with this patch series. If I ask for 1640x1232 at 79.07fps then
libcamera is setting V4L2_CID_VBLANK to -584 and giving me 79.07fps.
The code could do with an audit though as I do see some uint32_t
variables kicking around, so it could be more luck than judgement
(hmm, I see a value of 4294966712 being set).

> I think it would be helpful if I write down clearly how this sensor
> operates (to the best of my knowledge) so we can decide on the correct
> fix:
>
> --------------------
>
> IMX219 sensor has an active resolution of 3280x2464.
>
> The driver currently programs the sensor VT pixel clock as fixed for a
> given lane configuration.
>
> In 2-lane mode it reads 182.4 MPixel/second:
>
>     #define IMX219_PIXEL_RATE           182400000
>
> And the framerate is given by:
>
>     PIXEL_RATE / (FRAME_LENGTH * LINE_LENGTH)
>
> where FRAME_LENGTH and LINE_LENGTH are registers that include the active
> height and width along with blankings.
>
> There are restrictions on the minimum of the LINE_LENGTH register and
> minimum vertical blanking (32), which cap the framerate for the full resolution
> mode.
>
>     MIN_LINE_LENGTH: 0xd78 => 3448 pixels
>     MIN_FRAME_LENGTH: ACTIVE_HEIGHT + MIN_VBLANK (32) = 2464 + 32
>                            => 2496 lines
>
> The maximum frame rate is
>
>     182400000/(2496*3448) => ~ 21.2 frames/second
>
> --------------------
>
> A user might want to stream a lower resolution with the full field-of-view,
> let's take 1640x1232 (which is exactly 1/2 of active area) as an example.
>
> The sensor hardware can achieve this using two different binning modes:
>
>     2x2-binning (regval: 0x1)
>     2x2-analog-(special)-binning (regval: 0x3)
>
> The sensor pipeline looks like:
>
> active pixel array ->
>     analogue crop (none) ->
>         2x2 binning and ADC readout ->
>                 output to CSI-2 bus
>
> The mode names suggest that binning can happen either before or after ADC,
> but the datasheet is not very clear about the process. We can infer
> some details though. See below..

We did previously ask Sony for more information on the special binning
mode, but there wasn't anything more to be had. imx219 is now at least
12 years old (we started working with it in 2014), so those who knew
about it in Sony have generally moved on.

> --------------------
>
> With the "normal" 2x2-binning mode the sensor allows programming
> FRAME_LENGTH to a lower value. The driver still uses the min blanking of 32
> lines, but the height is now 1232, half of the 2464 before.
>
>     MIN_LINE_LENGTH: 0xd78 => 3448 pixels
>     MIN_FRAME_LENGTH: READOUT_HEIGHT + MIN_VBLANK = 1232 + 32
>                            => 1264 lines
>
> The maximum frame rate is
>
>     182400000/(1264*3448) => ~ 41.8 frames/second
>
> --------------------
>
> With the "special" 2x2-binning mode, the datasheet notes that FRAME_LENGTH
> register should be in units of 2 Lines instead of 1 Line. This means
> cutting it down by half once more:
>
>     MIN_FRAME_LENGTH: (READOUT_HEIGHT + MIN_VBLANK)/2 = (1232 + 32)/2
>                            => 632 lines
>
> While there is a slightly higher minimum enforced for the line length:
>
>     MIN_LINE_LENGTH: 0xde8 => 3560 pixels
>
> The maximum frame rate is
>
>     182400000/(632*3560) => ~ 81.0 frames/second
>
> ===================
>
> Through the minimum allowed values of the FRAME_LENGTH and LINE_LENGTH
> registers and maximum possible framerate, I think it is safe to say that:
>
>     2x2-binning => Readout half the pixels (do vertical averaging in the
>                                             analogue domain, before ADC
>                                             reads out the voltages)
>
>     2x2-special-binning => Readout a quarter of the pixels (???)
>
> FRAME_LENGTH being 1/4th of normal would seem to suggest that it is a 4x1
> binning (combining 4 lines instead of blocks of 2x2).. which does not make
> sense to me.
>
> My best guess is that in 2x2-special-binning mode the sensor does *both
> horizontal and vertical* averaging in the analogue domain, before the ADC
> reads out the voltages.
>
> A higher minimum LINE_LENGTH value for this mode is the best "hard"
> evidence I have for this guess unfortunately, as the datasheet is quite
> lacking on this topic.
>
> ====================
>
> The APIs before Sakari's series expose HBLANK and VBLANK controls instead
> of the actual FRAME_LENGTH/LINE_LENGTH registers to the userspace.
>
> The minimum value of FRAME_LENGTH is 632 when we are streaming 1640x1232,
> so the sensor registers would suggest that we have a *negative vertical
> blanking*. Which as Jacopo and Laurent both point out, does not make any
> conceptual sense whatsoever.
>
> What the driver does today to avoid these negative values is to double the
> PIXEL_RATE control value to 364800000 when using 2x2-special-binning mode
> (and thus userspace has no idea the FRAME_LENGTH/VBLANK is in units of
>  2xLines)
>
> As Sakari pointed out, that does not make any sense either. The sensor PLL
> values are completely unchanged, so the pixel readout must still be
> happening at the same rate. Moreover, the new raw sensor model will expose
> FRAME_LENGTH and LINE_LENGTH directly to userspace, and this hack of
> doubling the PIXEL_RATE breaks those calculations.

A model needs to describe the functional behaviour, even if it isn't
how the hardware actually implements it.

If the new model can't describe imx219 with a change of pixel clock
when binning, is it going to cope with the Starvis 2 sensors (eg
imx415, imx662 and imx678) where the HMAX register is in units related
to the input clock rather than pixel clock? Perhaps it can, but one of
those probably ought to be converted to prove the point (imx415 is in
mainline and fairly easily available).

A second case that needs to be considered by this generic model: there
are a bunch of sensors (imx378, imx477, imx519, and imx708 to name 4)
that have an exposure multiplication factor to allow for very long
exposure times / very low frame rates. How would that get represented?
The register is CIT_LSHIFT with permitted values from 0 (for off) to 7
(*128). "exposure time = COARSE_INTEG_TIME * 2^CIT_LSHIFT", and
likewise frame_length_lines gets multiplied by that value.

Is there a proposal on how to handle eg ov5647 where the PLL
configuration is changed between some of the modes for both pixel
clock and link frequency?
Or imx290 which changes link frequency for the modes, although it does
keep a common pixel clock? (I've never come up with a good reason for
the change in link frequency, just that the datasheet does it that
way).

> ===================
>
> If we want to support the new raw sensor model (that mandates the new
> FRAME_LENGTH and LINE_LENGTH controls) for this sensor we have to
> fix the PIXEL_RATE for sure. I see two options going forward:
>
> OPTION 1 (as proposed by Sakari):
>
>     Fix PIXEL_RATE to 182400000 and allow **negative values** for HBLANK
>     and VBLANK controls when using 2x2-special-binning mode.
>
>     This will break any userspace tools, many libcamera pipelines included,
>     that never expected those control values to be negative (even though
>     the API has always permitted those)

Will it actually break that much?
As much as I conceptually don't like negative values, as above the Pi
pipeline handlers in libcamera seem to just work.
Anyone using the sensor in a raw capacity and just setting a
precomputed value is going to break, but that's going to be the case
with any of the proposed changes.

> OPTION 2 (something that struck me today morning discussing with Jacopo):
>
>     Fix PIXEL_RATE to 182400000 but **adjust the HBLANK values** to go
>     lower to compensate, which will diverge from the sensor registers which
>     keep MIN_LINE_LENGTH fixed across both binning modes.
>
>     This will make the driver quite more complicated, but userspace
>     expectations of non-negative blankings will be met. And it's likely
>     that the sensor is internally doing pre-ADC averaging horizontally as
>     well, or so my best guess is.

It is true that the line length configured is sufficient that it could
be halved in order to keep the pixel rate the same. That would seem
feasible.

> Of course, there are other options to just leave this highly used sensor
> alone, or support embedded data and internal pads without mandating the new
> FRAME_LENGTH and LINE_LENGTH controls. But I personally would leave that as
> a last resort.

Is there a dependency stopping the embedded data and internal pads
patches being merged without the common raw sensor model?

  Dave

> > > non-issue that doubled the pixel rate, frame length in lines and exposure
> > > time.
> > >
> > > The resulting change also fixes the minimum, the maximum and the step
> > > values for the control.
> > >
> > > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> Thanks,
>     Jai
>
> > > ---
> > >  drivers/media/i2c/imx219.c | 37 ++++++++++++++-----------------------
> > >  1 file changed, 14 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index 3aebcbaa3fcd..3cee31758b7e 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -420,15 +420,6 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
> > >
> > >  }
> > >
> > > -static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
> > > -{
> > > -     u8 bin_h, bin_v;
> > > -
> > > -     imx219_get_binning(state, &bin_h, &bin_v);
> > > -
> > > -     return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
> > > -}
> > > -
> > >  /* -----------------------------------------------------------------------------
> > >   * Controls
> > >   */
> > > @@ -440,19 +431,17 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > >       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > >       const struct v4l2_mbus_framefmt *format;
> > >       struct v4l2_subdev_state *state;
> > > -     u32 rate_factor;
> > >       int ret = 0;
> > >
> > >       state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> > >       format = v4l2_subdev_state_get_format(state, 0);
> > > -     rate_factor = imx219_get_rate_factor(state);
> > >
> > >       if (ctrl->id == V4L2_CID_VBLANK) {
> > >               int exposure_max, exposure_def;
> > >
> > >               /* Update max exposure while meeting expected vblanking */
> > >               exposure_max = format->height + ctrl->val -
> > > -                     IMX219_EXPOSURE_OFFSET * rate_factor;
> > > +                     IMX219_EXPOSURE_OFFSET;
> > >               exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> > >                               exposure_max : IMX219_EXPOSURE_DEFAULT;
> > >               ret = __v4l2_ctrl_modify_range(imx219->exposure,
> > > @@ -479,7 +468,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > >               break;
> > >       case V4L2_CID_EXPOSURE:
> > >               cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > > -                       ctrl->val / rate_factor, &ret);
> > > +                       ctrl->val, &ret);
> > >               break;
> > >       case V4L2_CID_DIGITAL_GAIN:
> > >               cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > > @@ -496,7 +485,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > >               break;
> > >       case V4L2_CID_VBLANK:
> > >               cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> > > -                       (format->height + ctrl->val) / rate_factor, &ret);
> > > +                       format->height + ctrl->val, &ret);
> > >               break;
> > >       case V4L2_CID_HBLANK:
> > >               cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> > > @@ -837,8 +826,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >       const struct imx219_mode *mode;
> > >       struct v4l2_mbus_framefmt *format;
> > >       struct v4l2_rect *crop;
> > > -     u8 bin_h, bin_v, bin_hv;
> > > -     int ret;
> > > +     u8 bin_h, bin_v;
> > > +     int ret, bin_hv;
> > >
> > >       format = v4l2_subdev_state_get_format(state, 0);
> > >
> > > @@ -879,23 +868,25 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >       crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> > >
> > >       if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > -             unsigned int rate_factor = imx219_get_rate_factor(state);
> > >               int exposure_max;
> > >               int exposure_def;
> > >               int llp_min;
> > >               int pixel_rate;
> > >
> > >               /* Update limits and set FPS to default */
> > > +             int vblank_min = ((int)mode->height * (1 - bin_hv) / bin_hv) +
> > > +                     IMX219_VBLANK_MIN;
> > >               ret = __v4l2_ctrl_modify_range(imx219->vblank,
> > > -                                            IMX219_VBLANK_MIN * rate_factor,
> > > -                                            (IMX219_FLL_MAX - mode->height) *
> > > -                                            rate_factor, rate_factor,
> > > -                                            mode->fll_def - mode->height);
> > > +                                            vblank_min,
> > > +                                            IMX219_FLL_MAX - mode->height, 1,
> > > +                                            (int)(mode->fll_def / bin_hv) -
> > > +                                            (int)mode->height);
> > >               if (ret)
> > >                       return ret;
> > >
> > >               ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
> > > -                                      mode->fll_def - mode->height);
> > > +                                      (int)(mode->fll_def / bin_hv) -
> > > +                                      (int)mode->height);
> > >               if (ret)
> > >                       return ret;
> > >
> > > @@ -932,7 +923,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >                       return ret;
> > >
> > >               /* Scale the pixel rate based on the mode specific factor */
> > > -             pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
> > > +             pixel_rate = imx219_get_pixel_rate(imx219);
> > >               ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
> > >                                              pixel_rate, 1, pixel_rate);
> > >               if (ret)
> > > --
> > > 2.47.3
> > >
> > >

