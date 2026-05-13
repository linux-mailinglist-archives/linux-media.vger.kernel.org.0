Return-Path: <linux-media+bounces-61369-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAjNCVxGBGowGgIAu9opvQ
	(envelope-from <linux-media+bounces-61369-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:37:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBAE530C24
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E40D830C54F3
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636563E5A01;
	Wed, 13 May 2026 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bwa/lhqT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDED43C4546;
	Wed, 13 May 2026 09:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663652; cv=none; b=pLzgroWEw1GiDFgpqUeYVt2gXtNcmKX2iSYI0ARkYyTFAwcv5FyPUaMtfaAbsLS1G5SBEV8nK/2BSGw2k/x1HdYHh6ioLhhYy/wMU5krT0HjSUwl7/n92Ic+LevcZzmi3ipac8l4M4xYG6XJWfr7tfFyYa3z3NKiLxS/dyggQIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663652; c=relaxed/simple;
	bh=e0xybfZFePYLi3G7Bg6XNSKIcW4UQ+bYbF94Mniq4b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpjGc3THHi1qpBzYpqRecA/HwsVFI71+7Hgs4QGsEh2gj7BtaTP3FRYawUdhGCLeRT1ZwPa1BWRp8V9fw3Y4RPHasvfDvAJVrDtQR/5DsvUNTGt71+aKb5qSyGN8KmjO2GhDrCX3m6X23FnNKXZDRNCkv13jyE+VCg7ZONbX1cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Bwa/lhqT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 354C5A06;
	Wed, 13 May 2026 11:14:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778663640;
	bh=e0xybfZFePYLi3G7Bg6XNSKIcW4UQ+bYbF94Mniq4b0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bwa/lhqTNA9bwYFBvyhPqo4cUJXgnWulNr2EswsrP7b3IK/iFoN/sEaOU0BaR5GjQ
	 ppEOmQGKlyLiv6jcP/a/zpEWV95+ftBHJzWAW0+knVN8dkNqPnXMEomR1mePeG72Aq
	 obVJhzw0/rNBnQIFrqMnQQomngtEbfHDbTch3LsA=
Date: Wed, 13 May 2026 11:14:05 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, stable@vger.kernel.org
Subject: Re: [PATCH] media: rzv2h-ivc: Wait for frame end in stop_streaming
Message-ID: <agRAFH92GlElVP47@zed>
References: <20260401-ivc-stop-streaming-v1-1-b7599982c280@ideasonboard.com>
 <ba485144c4d469c834b0f65ed3ce753a331e207a.camel@ndufresne.ca>
 <agQmhGJGSVpuoTDS@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2dytkfad7zmhptho"
Content-Disposition: inline
In-Reply-To: <agQmhGJGSVpuoTDS@zed>
X-Rspamd-Queue-Id: 1BBAE530C24
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61369-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


--2dytkfad7zmhptho
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] media: rzv2h-ivc: Wait for frame end in stop_streaming
MIME-Version: 1.0

Hello again Nicolas

On Wed, May 13, 2026 at 09:54:44AM +0200, Jacopo Mondi wrote:
> Hi Nicolas
>
>    thanks for looking into this
>
> On Tue, May 12, 2026 at 01:46:31PM -0400, Nicolas Dufresne wrote:
> > Le mercredi 01 avril 2026 =C3=A0 17:35 +0200, Jacopo Mondi a =C3=A9crit=
=C2=A0:
> > > From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > >
> > > The rzv2h-ivc driver fails to handle back-2-back streaming sessions t=
hat
> > > do not go through a peripheral reset. As the driver uses an autosuspe=
nd
> > > delay of 2 seconds, it is quite possible that two consecutive streami=
ng
> > > sessions won't go through a suspend/resume sequence.
> > >
> > > If the peripheral is not reset the second streaming session hangs and=
 no
> > > frames are delivered to the ISP.
> > >
> > > This is because the stop_streaming() procedure implemented in the dri=
ver
> > > doesn't match what's prescribed by the chip datasheet:
> > >
> > > 1) The chip manual suggests to poll the RZV2H_IVC_FM_INT_STAT_STPEND =
bit
> > > =C2=A0=C2=A0 of RZV2H_IVC_REG_FM_INT_STA instead of polling on RZV2H_=
IVC_REG_FM_STOP
> > > =C2=A0=C2=A0 and prescribes to clear the bit after polling has comple=
ted
> > >
> > > 2) More importantly: the RZV2H_IVC_REG_FM_STOP_FSTOP bit has to be set
> > > =C2=A0=C2=A0 on RZV2H_IVC_REG_FM_STOP -only- if a frame transfer to t=
he ISP is in
> > > =C2=A0=C2=A0 progress. Setting the RZV2H_IVC_REG_FM_STOP_FSTOP bit wh=
en no frame is
> > > =C2=A0=C2=A0 being transferred causes the polling routine to timeout =
and the next
> > > =C2=A0=C2=A0 streaming session fails to start
> > >
> > > As a frame transfer of an image in 1920x1080@10bi takes 5 milliseconds
> > > at most, it is quite possible that the frame transfer completion inte=
rrupt
> > > races with the stop procedure.
> > >
> > > Instead of forcing a frame transfer abort, simply wait for the
> > > in-progress transfer to complete by polling the ivc->vvalid_ifp status
> > > variable in an hand-rolled loop that allows to inspect the variable
> > > while holding the spinlock, to allow the irq handler to complete the
> > > current buffer.
> > >
> > > With this change, streaming back-2-back without suspending the
> > > peripheral works successfully.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Contro=
l block
> > > driver")
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > ---
> > > As detailed in the commit message, re-starting a streaming session
> > > without going through a peripheral reset doesn't currently work.
> > >
> > > I initially thought this is because the stop_streaming() procedure
> > > implemented in the rzv2h-ivc driver does not comply with what is
> > > prescribed by the chip manual.
> > >
> > > So I went and modified it according to the manual.
> > >
> > > Unfortunately, even by following the suggested procedure, once
> > > RZV2H_IVC_REG_FM_STOP is set and a forceful frame transfer abort is
> > > started, the RZV2H_IVC_FM_INT_STAT_STPEND bit takes a long time to
> > > clear, during which is most often times the case the current in-progr=
ess
> > > transfer completes by itself. If this happen, then a peripheral
> > > reset is required to restart streaming regardless if I forcefully cle=
ar
> > > the RZV2H_IVC_REG_FM_STOP_FSTOP and RZV2H_IVC_FM_INT_STAT_STPEND bits.
> > >
> > > I have tried several strategies to properly forcefully stop an
> > > in-progress transfer and handle the potential race betwee the
> > > transfer-complete irq and the polling the RZV2H_IVC_REG_FM_INT_STA
> > > register (which could potentially sleep), but it's still quite easy to
> > > get races between frame completion and the forced stop procedure unle=
ss
> > > I hold on to the ivc->spinlock preventing the irq handler to run.
> > >
> > > Once I timed the transfer time for a 1920x1080@10bit frame to 5 milli=
-seconds
> > > at most I decided to simply wait for the current in-progress transfer=
 to
> > > complete, as this seems the most reliable way to be able to re-start
> > > streaming without resetting the peripheral.
> > > ---
> > > =C2=A0.../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c=C2=A0=C2=A0 | =
31 ++++++++++++++++++---
> > > -
> > > =C2=A01 file changed, 26 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video=
=2Ec
> > > b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> > > index b167f1bab7ef..932fed38cf3f 100644
> > > --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> > > +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> > > @@ -297,12 +297,33 @@ static int rzv2h_ivc_start_streaming(struct vb2=
_queue
> > > *q, unsigned int count)
> > > =C2=A0static void rzv2h_ivc_stop_streaming(struct vb2_queue *q)
> > > =C2=A0{
> > > =C2=A0	struct rzv2h_ivc *ivc =3D vb2_get_drv_priv(q);
> > > -	u32 val =3D 0;
> > > +	unsigned int loop =3D 5;
> > > =C2=A0
> > > -	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP,
> > > RZV2H_IVC_REG_FM_STOP_FSTOP);
> > > -	readl_poll_timeout(ivc->base + RZV2H_IVC_REG_FM_STOP,
> > > -			=C2=A0=C2=A0 val, !(val & RZV2H_IVC_REG_FM_STOP_FSTOP),
> > > -			=C2=A0=C2=A0 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
> > > +	/*
> > > +	 * If no frame transfer is in progress, we're done, otherwise, wait
> > > for
> > > +	 * the transfer to complete.
> > > +	 *
> > > +	 * Transferring a 1920x1080@10bit frame to the ISP takes less than 5
> > > +	 * msec so sleep for 2.5 msec (+- 25%) and give up after 5 attempts.
> > > +	 */
> > > +	for (; loop > 0; loop--) {
> > > +		unsigned int vvalid_ifp;
> > > +
> > > +		/*
> > > +		 * Inspect the ivc->vvalid_ifp variable holding the spinlock
> > > not
> > > +		 * to the race with the rzv2h_ivc_buffer_done() call in the
> > > irq
> > > +		 * handler.
> > > +		 */
> > > +		scoped_guard(spinlock_irq, &ivc->spinlock) {
> > > +			vvalid_ifp =3D ivc->vvalid_ifp;
> > > +		}
> > > +		if (vvalid_ifp < 2)
> > > +			break;
> > > +
> > > +		fsleep(2500);
> > > +	}
> > > +	if (!loop)
> > > +		dev_err(ivc->dev, "Failed to stop streaming\n");
> >
> > Would simply using vb2_wait_for_all_buffers() worked for your use case =
? Or does
>
> Good suggestion. Let me explain why I think vb2_wait_for_all_buffers()
> doesn't really apply here, but as I realized while writing this email
> maybe I'm getting requirements wrong, so my below recollection might
> not be accurate.
>
> vb2_wait_for_all_buffers() waits until the driver doesn't call
> vb2_buffer_done() all the buffers it has been given. Not unusually,
> the IVC keeps a list of queued buffers and processes them one after
> the other.
>
> Now, assume stop_streaming() is called while a buffer transfer is in
> progress. What we can do here is
>
> 1) forcefully stop the transfer and return the current buffer in ERROR
> state and then complete in ERROR state all the buffers queued to the
> driver
> 2) wait until the transfer competes, return the current buffer in DONE
> state and then complete in ERROR state all the buffers queued to the
> driver
>
> For reasons explained above, below the commit message, I ditched
> option 1).
>
> So now, we have to wait for the current transfer in progress, return the
> current buffer and then complete all the queued ones. Only at this
> point we could call vb2_wait_for_all_buffers(), but that would be
> useless as we have completed all buffers.
>
> Now, all of this is under the assumption that we aim to complete
> buffers in the same order as they have been queued. So the currently
> in-progress buffer has to be competed first, then we can return all
> the other ones. Surprisingly I didn't find this requirement mentioned
> in the VIDIOC_STREAMOFF documentation, nor I clearly found this
> requirement being enforced in the v4l2-compliance tests.
>
> Iff we can complete buffers out of order then yes, I can complete all
> queued buffers in error state first, then let the current in-progress
> one complete and just calling vb2_wait_for_all_buffers() here.
>
> I'll check with Hans about the ordering requirement.
>

I asked Hans for clarification about the completion ordering
requirements.

My understanding is that if we could forcefully stop the current
in-progress transfer we then should return the buffer in ERROR state,
and buffers returned in ERROR state can be completed in any order.

If instead the current in-progress transfer has to be completed (as
this patch does) then the buffer has to be returned in DONE state, and
we should return it first and then complete all other buffers in ERROR
state.

So I would keep the patch as it if that's fine with you.


> > RZV2H_IVC_REG_FM_STOP mask off IRQ causing buffers to never be signalle=
d ?
>
> This patch removes usage of RZV2H_IVC_REG_FM_STOP.
>
> Thanks
>   j
>
> >
> > > =C2=A0
> > > =C2=A0	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_ERROR);
> > > =C2=A0	video_device_pipeline_stop(&ivc->vdev.dev);
> > >
> > > ---
> > > base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
> > > change-id: 20260331-ivc-stop-streaming-2c992277b050
> > >
> > > Best regards,
>
>



--2dytkfad7zmhptho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAmoEQN0ACgkQcjQGjxah
VjwZcRAAt4ZnF6z/3GCGIKbJMZE6zpvAftZVRt2vNh5bzbVHbEXs0WkBdlbyrDDO
b6pVmk0NVRJpJkTvJc49w7eBUHQXWLM2C4vAZ7a2h2Y9FcMzk94ETlJNJigETo/L
VbSWMCUYPGDWMGGwdnxMBYeXj/S45TQ4+5NwnMsaUVCY2mkpgWL8VD0lHaDULGS9
ddkB83PbX2Sp3tESOSjTsibFDerFGD+bqR3KwHrfrhOS0sXNZmlbyy/40V9T+jxU
/lU/sLfaaxN6yn5rgja1aVM2+B+xDmVuM6nWhzSFetGck/f/y7q+8gm3GngePFCC
dID9u20AgWartl9dznGKTaJeMZLmQd2e1uqRo7h7SCYtesyfe4De2TE6umWdIzOr
7VhdZHHw8rwwV7qfzugVKv1/wjEIbo2/fRGS/Be7+cd2e70NGuDIEzmGLvKNLUIf
GV1OB9iALk4xl6dj8hTbKqKUKMmI3fZwJ9l+kKm2oBs7BvIoURSY6jjBkTzLi1x+
BLB98dpjU6DDiFg6IaS3Ow2pmqKMrFjF9hMZmoaKGMPjAWN58GwoECMjwUzNzljg
o/pwtCp4LcLob0efB0TYxFzzFLI7hgt1TbgZ/y3vVUCfxw/deMjQbgB5Vj8+HQvV
xR27qE/Q6ZhDbuvk5sf/TFud0AgWI0fUhkvzXMTQApNcxWAxVGI=
=yNp6
-----END PGP SIGNATURE-----

--2dytkfad7zmhptho--

