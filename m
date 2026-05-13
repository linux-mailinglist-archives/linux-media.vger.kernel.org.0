Return-Path: <linux-media+bounces-61351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLnPOhcvBGo/FAIAu9opvQ
	(envelope-from <linux-media+bounces-61351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:58:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCF452F315
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 671FF30E6F77
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048183839B6;
	Wed, 13 May 2026 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oEfIujZT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51E63D79FF;
	Wed, 13 May 2026 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658895; cv=none; b=Lb+gCz9p2kXipRjPyFS2lKjEmIWibt5YDz1T+7JcSWYgoeeN0y3G1vqq2HKT0dx/PyO1Hq+MFUOWo9aLvm7CF/CVRGeDFwivGUBBWar7hjz0v+0Y4YUvtE+GjDRHD0uKAdYH7YBQfIZVjV+l9tzMdXYfQVGjlpHxK7oIu4q/xuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658895; c=relaxed/simple;
	bh=UJVIouv4Ts/OopCK3b7wLY0paQNXcLFhBkB4TXBBRu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JytGn0yQHUww4LCHvextB7pONOm/0rpwYhJU9L0PNObYWwxftdCfC3ieGfF9BcXUr+xEWsVexos6+ijha6MwVN3/8lV74bj0yhz8G+ZbnZpjw9cL91pWgSTNWnlLkxM7AzB9E5NJPzl5tNfr78XNp5Ddbl+BDEwL0gO2bt0PxUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oEfIujZT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BF3B229;
	Wed, 13 May 2026 09:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778658879;
	bh=UJVIouv4Ts/OopCK3b7wLY0paQNXcLFhBkB4TXBBRu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEfIujZTS3KRkRBQG7ZA5tZDziFjnQdjTCPFbucXek1ISzJ8VbDTGbiHnbOZbsqL3
	 2myndaNr1qvC+E5yRht4PRZmzDo+IsO+zdPCYY8yq3V110EqKSkpPCMkAdXT8zsC+7
	 /Vadv+1imWVVhBD6iJWgCXjnsConyhUoIjflY0DI=
Date: Wed, 13 May 2026 09:54:44 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, stable@vger.kernel.org
Subject: Re: [PATCH] media: rzv2h-ivc: Wait for frame end in stop_streaming
Message-ID: <agQmhGJGSVpuoTDS@zed>
References: <20260401-ivc-stop-streaming-v1-1-b7599982c280@ideasonboard.com>
 <ba485144c4d469c834b0f65ed3ce753a331e207a.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ytqmxrkyxmbf6yso"
Content-Disposition: inline
In-Reply-To: <ba485144c4d469c834b0f65ed3ce753a331e207a.camel@ndufresne.ca>
X-Rspamd-Queue-Id: 4BCF452F315
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-61351-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,10bi:email,10bit:email]
X-Rspamd-Action: no action


--ytqmxrkyxmbf6yso
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] media: rzv2h-ivc: Wait for frame end in stop_streaming
MIME-Version: 1.0

Hi Nicolas

   thanks for looking into this

On Tue, May 12, 2026 at 01:46:31PM -0400, Nicolas Dufresne wrote:
> Le mercredi 01 avril 2026 =C3=A0 17:35 +0200, Jacopo Mondi a =C3=A9crit=
=C2=A0:
> > From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> >
> > The rzv2h-ivc driver fails to handle back-2-back streaming sessions that
> > do not go through a peripheral reset. As the driver uses an autosuspend
> > delay of 2 seconds, it is quite possible that two consecutive streaming
> > sessions won't go through a suspend/resume sequence.
> >
> > If the peripheral is not reset the second streaming session hangs and no
> > frames are delivered to the ISP.
> >
> > This is because the stop_streaming() procedure implemented in the driver
> > doesn't match what's prescribed by the chip datasheet:
> >
> > 1) The chip manual suggests to poll the RZV2H_IVC_FM_INT_STAT_STPEND bit
> > =C2=A0=C2=A0 of RZV2H_IVC_REG_FM_INT_STA instead of polling on RZV2H_IV=
C_REG_FM_STOP
> > =C2=A0=C2=A0 and prescribes to clear the bit after polling has completed
> >
> > 2) More importantly: the RZV2H_IVC_REG_FM_STOP_FSTOP bit has to be set
> > =C2=A0=C2=A0 on RZV2H_IVC_REG_FM_STOP -only- if a frame transfer to the=
 ISP is in
> > =C2=A0=C2=A0 progress. Setting the RZV2H_IVC_REG_FM_STOP_FSTOP bit when=
 no frame is
> > =C2=A0=C2=A0 being transferred causes the polling routine to timeout an=
d the next
> > =C2=A0=C2=A0 streaming session fails to start
> >
> > As a frame transfer of an image in 1920x1080@10bi takes 5 milliseconds
> > at most, it is quite possible that the frame transfer completion interr=
upt
> > races with the stop procedure.
> >
> > Instead of forcing a frame transfer abort, simply wait for the
> > in-progress transfer to complete by polling the ivc->vvalid_ifp status
> > variable in an hand-rolled loop that allows to inspect the variable
> > while holding the spinlock, to allow the irq handler to complete the
> > current buffer.
> >
> > With this change, streaming back-2-back without suspending the
> > peripheral works successfully.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control =
block
> > driver")
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> > As detailed in the commit message, re-starting a streaming session
> > without going through a peripheral reset doesn't currently work.
> >
> > I initially thought this is because the stop_streaming() procedure
> > implemented in the rzv2h-ivc driver does not comply with what is
> > prescribed by the chip manual.
> >
> > So I went and modified it according to the manual.
> >
> > Unfortunately, even by following the suggested procedure, once
> > RZV2H_IVC_REG_FM_STOP is set and a forceful frame transfer abort is
> > started, the RZV2H_IVC_FM_INT_STAT_STPEND bit takes a long time to
> > clear, during which is most often times the case the current in-progress
> > transfer completes by itself. If this happen, then a peripheral
> > reset is required to restart streaming regardless if I forcefully clear
> > the RZV2H_IVC_REG_FM_STOP_FSTOP and RZV2H_IVC_FM_INT_STAT_STPEND bits.
> >
> > I have tried several strategies to properly forcefully stop an
> > in-progress transfer and handle the potential race betwee the
> > transfer-complete irq and the polling the RZV2H_IVC_REG_FM_INT_STA
> > register (which could potentially sleep), but it's still quite easy to
> > get races between frame completion and the forced stop procedure unless
> > I hold on to the ivc->spinlock preventing the irq handler to run.
> >
> > Once I timed the transfer time for a 1920x1080@10bit frame to 5 milli-s=
econds
> > at most I decided to simply wait for the current in-progress transfer to
> > complete, as this seems the most reliable way to be able to re-start
> > streaming without resetting the peripheral.
> > ---
> > =C2=A0.../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c=C2=A0=C2=A0 | 31=
 ++++++++++++++++++---
> > -
> > =C2=A01 file changed, 26 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> > b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> > index b167f1bab7ef..932fed38cf3f 100644
> > --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> > +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> > @@ -297,12 +297,33 @@ static int rzv2h_ivc_start_streaming(struct vb2_q=
ueue
> > *q, unsigned int count)
> > =C2=A0static void rzv2h_ivc_stop_streaming(struct vb2_queue *q)
> > =C2=A0{
> > =C2=A0	struct rzv2h_ivc *ivc =3D vb2_get_drv_priv(q);
> > -	u32 val =3D 0;
> > +	unsigned int loop =3D 5;
> > =C2=A0
> > -	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP,
> > RZV2H_IVC_REG_FM_STOP_FSTOP);
> > -	readl_poll_timeout(ivc->base + RZV2H_IVC_REG_FM_STOP,
> > -			=C2=A0=C2=A0 val, !(val & RZV2H_IVC_REG_FM_STOP_FSTOP),
> > -			=C2=A0=C2=A0 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
> > +	/*
> > +	 * If no frame transfer is in progress, we're done, otherwise, wait
> > for
> > +	 * the transfer to complete.
> > +	 *
> > +	 * Transferring a 1920x1080@10bit frame to the ISP takes less than 5
> > +	 * msec so sleep for 2.5 msec (+- 25%) and give up after 5 attempts.
> > +	 */
> > +	for (; loop > 0; loop--) {
> > +		unsigned int vvalid_ifp;
> > +
> > +		/*
> > +		 * Inspect the ivc->vvalid_ifp variable holding the spinlock
> > not
> > +		 * to the race with the rzv2h_ivc_buffer_done() call in the
> > irq
> > +		 * handler.
> > +		 */
> > +		scoped_guard(spinlock_irq, &ivc->spinlock) {
> > +			vvalid_ifp =3D ivc->vvalid_ifp;
> > +		}
> > +		if (vvalid_ifp < 2)
> > +			break;
> > +
> > +		fsleep(2500);
> > +	}
> > +	if (!loop)
> > +		dev_err(ivc->dev, "Failed to stop streaming\n");
>
> Would simply using vb2_wait_for_all_buffers() worked for your use case ? =
Or does

Good suggestion. Let me explain why I think vb2_wait_for_all_buffers()
doesn't really apply here, but as I realized while writing this email
maybe I'm getting requirements wrong, so my below recollection might
not be accurate.

vb2_wait_for_all_buffers() waits until the driver doesn't call
vb2_buffer_done() all the buffers it has been given. Not unusually,
the IVC keeps a list of queued buffers and processes them one after
the other.

Now, assume stop_streaming() is called while a buffer transfer is in
progress. What we can do here is

1) forcefully stop the transfer and return the current buffer in ERROR
state and then complete in ERROR state all the buffers queued to the
driver
2) wait until the transfer competes, return the current buffer in DONE
state and then complete in ERROR state all the buffers queued to the
driver

For reasons explained above, below the commit message, I ditched
option 1).

So now, we have to wait for the current transfer in progress, return the
current buffer and then complete all the queued ones. Only at this
point we could call vb2_wait_for_all_buffers(), but that would be
useless as we have completed all buffers.

Now, all of this is under the assumption that we aim to complete
buffers in the same order as they have been queued. So the currently
in-progress buffer has to be competed first, then we can return all
the other ones. Surprisingly I didn't find this requirement mentioned
in the VIDIOC_STREAMOFF documentation, nor I clearly found this
requirement being enforced in the v4l2-compliance tests.

Iff we can complete buffers out of order then yes, I can complete all
queued buffers in error state first, then let the current in-progress
one complete and just calling vb2_wait_for_all_buffers() here.

I'll check with Hans about the ordering requirement.

> RZV2H_IVC_REG_FM_STOP mask off IRQ causing buffers to never be signalled ?

This patch removes usage of RZV2H_IVC_REG_FM_STOP.

Thanks
  j

>
> > =C2=A0
> > =C2=A0	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_ERROR);
> > =C2=A0	video_device_pipeline_stop(&ivc->vdev.dev);
> >
> > ---
> > base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
> > change-id: 20260331-ivc-stop-streaming-2c992277b050
> >
> > Best regards,



--ytqmxrkyxmbf6yso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAmoELkQACgkQcjQGjxah
Vjz2bg/7Bgt8YBat9GnvzLBn/rQuwa/gal/ViPUZlmCk7pC2hv2FEpM/UfcK3GT7
jB5gU8YL6zSDd3+aUB9hokWeTi0mDA8IgqFdzLMZsenxA2ajo4FELCufVuWI02Xy
5Hndy2A9DXCwStTY5Y5lY82is3zTkRuOpLFQM0xuY2k+ktnmRJzLsUVzz8adOVZU
tRSZINl1OC2eQ67EUNGa7Nr0PKo/JlhNFwdPi4n2+GzsLTQ34Tgut48lOYDylGix
irvtktrSRtRW9N/ANRjeOuCFg0MN7iH/ULbDkaoEV4r3kBjXXJs9VAAfGL34cB04
p6KM9Ncuutqzb5q/waRn02n0B+q7ICay0FA4zDE/XCQiduq5TxMAB69iEZcPN5ZR
CMXas4FiHxAXatHwGKMQQVHTgch8NrXyFqLIdBC/0zinLxPHlm0A0mqWRQFB11yr
J2/FNyiWg4jaI1VzE5D22HTbd/EPuK52t9nYNdSRH4eYJiesQEXBKZJdXPdk5V7d
8oiRWF9WRWATextzqFdyvZSj+ZDfuThhhnLbXc5N4DvFhdBBrge7iGEwKRXltB1t
2dW3Cek7xgSWeMUmae4g3843xwP7MnhVNBnBAyHgRNopms4UzFaCtTvPA2Du3VoN
rAxWBzEq59dHGhJUHLnrPQ1snILN/2iBX2wtIZ2U68r7Z289nS0=
=dIAE
-----END PGP SIGNATURE-----

--ytqmxrkyxmbf6yso--

