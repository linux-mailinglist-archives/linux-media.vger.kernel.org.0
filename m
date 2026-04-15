Return-Path: <linux-media+bounces-58821-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOLPJZqj32miXAAAu9opvQ
	(envelope-from <linux-media+bounces-58821-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:41:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7AE4056D0
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 546EA3094F36
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 14:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061012F069D;
	Wed, 15 Apr 2026 14:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mYe+qLqs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D0E33F8CA
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776263922; cv=none; b=mQf8do6cwFRBsTr8ku/+fH9GqJQlCiqoL+cdXmOiCaIDIYOs6T57omFuHya6sMVr2W7W6Ye/CqhCId61EKjkGZKx6KI6vqtFh7uuSAGSrVEO2JGXl1ckDLQRpgRDm3WpRJht6BHCjvGJtAoHMv/RCs+OjohkhM30KAKAjzNJDxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776263922; c=relaxed/simple;
	bh=tQ0oB9SB/6RkMWN+wXVbE1GI4dbYnDmtgqDdSFVz9Es=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=pkUuZixrw1CMglPG5LK9OnQsjviQe8sOW6cAtXkL9T5waaSHTm6WWQt4GekM44Efj8ziecBDl1A+yzCgYRUNqKI2X9AmX1XQKSF3XaM1vBr5ncqIy9UJqEIG/Z28th1DqmiatzOSqcQ55OXcCf30jvgrgiW6aCIQnVUDcHIZl+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mYe+qLqs reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:51df:7e0d:3bc9:3b1b:3f69])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46477A06;
	Wed, 15 Apr 2026 16:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776263822;
	bh=tQ0oB9SB/6RkMWN+wXVbE1GI4dbYnDmtgqDdSFVz9Es=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mYe+qLqsamatQxyymnO9kt+Pnd42K5EvtmkQPN21GNu1oSKbBR49Nzp2TmnfKYb5b
	 QT2dukdgQ1KXbahObwXR0ubAxmr0JlUF6xkTbyh9L2YU4apk+T/017RVKI7y28BD18
	 D6SwIpbv4hCtic58+0uRUWFw3akjCMZBDmz/XugU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <adi17tFyi5uX1GpP@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com> <20260408153939.969381-6-sakari.ailus@linux.intel.com> <adi17tFyi5uX1GpP@zed>
Subject: Re: [PATCH v4 05/29] media: imx219: Fix vertical blanking and exposure for analogue binning
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@idea
 sonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 15 Apr 2026 20:08:31 +0530
Message-ID: <177626391137.489396.6706972719698320660@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58821-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:-];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,idea sonboard.com,ti.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.004];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 0B7AE4056D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

Thank you for the patch, and sorry for the late response. I finally got
time to test this out, there are some significant issues.

Did you test the behaviour with an IMX219 sensor before and after this
series?

What I see is the following before this series:

    | Mode | HBLANK | VBLANK | Pixel Rate | Observed FPS | Formula FPS | Er=
ror
    % |
    |---|---:|---:|---:|---:|---:|---:|
    | 640x480 | 2920 | 1227 | 364800000 | 60.07 | 60.03 | 0.07 |
    | 640x480 | 4000 | 1227 | 364800000 | 46.09 | 46.06 | 0.07 |
    | 640x480 | 6000 | 1227 | 364800000 | 32.20 | 32.18 | 0.05 |
    | 640x480 | 2920 | 2000 | 364800000 | 41.32 | 41.32 | 0.00 |
    | 640x480 | 2920 | 3000 | 364800000 | 29.45 | 29.45 | 0.01 |
    | 1640x1232 | 1920 | 475 | 364800000 | 60.07 | 60.03 | 0.07 |
    | 1640x1232 | 3000 | 475 | 364800000 | 46.09 | 46.06 | 0.07 |
    | 1640x1232 | 5000 | 475 | 364800000 | 32.20 | 32.18 | 0.05 |
    | 1640x1232 | 1920 | 1000 | 364800000 | 45.91 | 45.91 | -0.00 |
    | 1640x1232 | 1920 | 2000 | 364800000 | 31.71 | 31.71 | 0.01 |
    | 1920x1080 | 1528 | 683 | 182400000 | 30.01 | 30.01 | 0.01 |
    | 1920x1080 | 2500 | 683 | 182400000 | 23.43 | 23.41 | 0.10 |
    | 1920x1080 | 4000 | 683 | 182400000 | 17.48 | 17.48 | 0.02 |
    | 1920x1080 | 1528 | 1200 | 182400000 | 23.20 | 23.20 | -0.01 |
    | 1920x1080 | 1528 | 2000 | 182400000 | 17.18 | 17.18 | 0.03 |


And after this series

    | Mode | HBLANK | VBLANK | Pixel Rate | Observed FPS | Formula FPS | Er=
ror
    % |
    |---|---:|---:|---:|---:|---:|---:|
    | 640x480 | 2920 | 1227 | 182400000 | 30.02 | 30.02 | 0.02 |
    | 640x480 | 4000 | 1227 | 182400000 | 23.03 | 23.03 | 0.00 |
    | 640x480 | 6000 | 1227 | 182400000 | 16.09 | 16.09 | -0.02 |
    | 640x480 | 2920 | 2000 | 182400000 | 20.66 | 20.66 | 0.00 |
    | 640x480 | 2920 | 3000 | 182400000 | 14.72 | 14.72 | -0.02 |

So while the "formula" still works, we can't achieve high FPS capture we
could before.

With minimum blankings I could get around ~190 FPS capture before. Now it's
just ~70 FPS.

And I couldn't even stream the any other mode than 640x480, because S_FMT
on the sensor gives an error:

$ media-ctl -V '"imx219 1-0010":0 [fmt:SRGGB10_1X10/1920x1080 field:none]'
Unable to setup formats: Numerical result out of range (34)

This patch sets vblank ranges and default values which don't work out:
   - 1920x1080: min =3D 1080, default =3D 683
   - 1640x1232: min =3D 616, default =3D -379

Quoting Jacopo Mondi (2026-04-10 14:12:22)
> Hi Sakari
>=20
> On Wed, Apr 08, 2026 at 06:39:14PM +0300, Sakari Ailus wrote:
> > When vertical analogue binning is in use, the minimum frame length in
> > lines decreases to around half of the normal. In relation to the sensor=
's
> > output size this means vertical blanking can be negative but that's not=
 an
> > issue as control values are signed. Remove the workaround for this
> > non-issue that doubled the pixel rate, frame length in lines and exposu=
re
> > time.
>=20
> I don't think this was a workaround. Doubling the pixel rate and
> halving the values written to registers for EXPOSURE and VBLANK
> allowed userspace to maintain a consistent view while the driver
> accounts for the special binning mode where, at least in my latest
> understanding, the sensor averages two lines before passing them to
> the ADC.
>=20
> I am missing in which case, with the current driver implementation,
> the vertical blanking can be negative.
>=20
> >
> > The resulting change also fixes the minimum, the maximum and the step
> > values for the control.
> >
> > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for anal=
og binning")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>=20
> Jai, and others including Dave and me, have spent quite some time
> testing and implementing proper support for the special analogue
> binning mode for this sensor. Of course we might have missed something
> obvious, but I'm still missing what you're trying to fix here.
>=20

So, I tend to agree with Jacopo here. There's been a lot of effort to get
this sensor give correct and high FPS frames.

As we discussed offline, I don't mind the model where we have negative
values for blankings, but the sensor should still work the same way, i.e.
the same FPS range is supported with the new blanking and pixel rate model.

Otherwise that would count as breaking the userspace, especially for
probably the most widely used sensor out there :/

Thanks,
    Jai

> > ---
> >  drivers/media/i2c/imx219.c | 29 +++++++++--------------------
> >  1 file changed, 9 insertions(+), 20 deletions(-)
> >

[snip]

