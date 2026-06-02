Return-Path: <linux-media+bounces-63394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yRhHFEjeHmo+WwAAu9opvQ
	(envelope-from <linux-media+bounces-63394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:44:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FFA62E9BF
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:44:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oZuBrf2m;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63394-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63394-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80CDC300B639
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093273E172E;
	Tue,  2 Jun 2026 13:44:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336FF218E91
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 13:44:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407874; cv=none; b=tOenICngXlTocYD4uZ6eBiuJtOwvG93jx08A5dWBSdYOGK91jNkxMhSVrZdiMrC7mE8aAZ2nz9RzinpU4pmu3TTKWdtBgqN7Gun1e2SetunvRhJAWZ1kS2qgm8unPDu6ktDGadvCb9sCEFrA1dBkXGJ4xo1AD2b5mZ6bSAN6Yvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407874; c=relaxed/simple;
	bh=nzd3JMDgQEjIy3Z+51ag3ULeikoNYmUXi+7+EiMP4+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cp1CJjHjTxaNFazCTPhGlk0t/uNZkhI/8BAqp0SzGtqpdJG9S20Nmc1VSwT0CRnyzX+5Bn+ANPe4PJTX5wo63M8/d2bqirMfaAsdXH2Ihlig4npqm3ihtEpOahnMUwDltHEZJ4IK+2TM3QC2+jdIBHHx+xML0rsKct7bB88IH8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZuBrf2m; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4C11F00893;
	Tue,  2 Jun 2026 13:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407872;
	bh=kNmyJcsqzq5Z+jzzSerp2LXXrdOAiRAvu046pG3jypU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oZuBrf2mnhCxa0zbl0mjxrYYRmZiF2b7ZQNlV7U8DfrVW/fRNtHyBpUaVrkJSqK38
	 siEYpl99kkOBoAE5I2++5pXlCGlP0WK0sN9XAt6OYxQ7TD+RvSbIMwGUx3ZZuTJwCm
	 cbqGTr5a87hP1k8JO8nyDgp4Z0NrQumNwk6cna3v0x/OwYSdfmDoBYknU3o6t/AeDN
	 VPQ1ZbxrRREFJyrhMaSv9xswf+xUtIkxjoBWSdsYSqU/DS08oVn317S7HO+NqM3QuV
	 UX/8YXurHOTMQY/fu/YXvzlRPtpHqCBLLqJzE2bJBe2zh0nROH2RrniUh8UrWRTSCS
	 ZzcMOIho3Uypw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/13] media: stm32: dcmipp: add pixel-pipe support
 in bytecap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-11-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-11-3c76b5f93157@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 13:44:32 +0000
Message-Id: <20260602134432.BC4C11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63394-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90FFA62E9BF

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Unprivileged userspace can trigger kernel panics (`WARN_ON`) by re=
questing an unaligned width for the dump pipe.
- [High] Inadequate width and height alignment constraints for planar forma=
ts like YUV420 result in misaligned chroma strides and plane addresses.
- [High] Missing `else` block in `dcmipp_bytecap_link_validate` causes link=
 validation to unconditionally fail for pixel pipes when the source width i=
s unaligned.
- [High] Error handling for `pipe_id` initialization is defeated by a signe=
dness error, leading to out-of-bounds memory accesses.

Pre-existing issues:
- [Critical] NULL pointer dereference when restarting capture after queue s=
tarvation.
- [High] DMA addresses are permanently cached in `buf_prepare`, breaking DM=
ABUF and USERPTR memory models when backing memory changes.
- [High] A race condition between `stop_streaming` and the IRQ thread leads=
 to a Use-After-Free of V4L2 buffers.
--

commit fc3be1eca23ef149d9562a27aaccdb4c295d85ad
Author: Alain Volmat <alain.volmat@foss.st.com>
Subject: media: stm32: dcmipp: add pixel-pipe support in bytecap

This commit adds pixel pipe capture support to the existing bytecap driver =
to
avoid code duplication, since buffer handling and format manipulation are
similar. It differentiates dump and pixel pipes by introducing a pipe_id and
adds support for configuring the pixel packer on pixel pipes.

> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.=
c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
> index bd6f2d68df80c..d4432a9fa0e24 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
> @@ -168,6 +274,73 @@ static const struct v4l2_pix_format fmt_default =3D {
>  	.xfer_func =3D DCMIPP_XFER_FUNC_DEFAULT,
>  };
> =20
> +static inline int hdw_pixel_alignment(u32 format)
> +{
> +	/* 16 bytes alignment required by hardware */
> +	switch (format) {
> +	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_NV21:
> +	case V4L2_PIX_FMT_YUV420:
> +	case V4L2_PIX_FMT_YVU420:
> +	case V4L2_PIX_FMT_NV16:
> +	case V4L2_PIX_FMT_NV61:
> +	case V4L2_PIX_FMT_GREY:
> +		return 4;/* 2^4 =3D 16 pixels =3D 16 bytes */

[Severity: High]
Does this provide an adequate alignment constraint for planar formats like=
=20
YUV420? Since the chroma plane stride is width / 2, a width of 16 pixels=20
yields an 8-byte chroma stride. Since buf_prepare() asserts 16-byte alignme=
nt=20
across all planes, will this trigger the WARN_ON() checks for unaligned=20
strides and plane addresses?

[ ... ]
> @@ -192,19 +365,20 @@ static int dcmipp_bytecap_try_fmt_vid_cap(struct fi=
le *file, void *priv,
>  {
>  	struct dcmipp_bytecap_device *vcap =3D video_drvdata(file);
>  	struct v4l2_pix_format *format =3D &f->fmt.pix;
> -	const struct dcmipp_bytecap_pix_map *vpix;
> +	/* Take into consideration the width constraint of the pixel packer */
> +	unsigned int walign =3D (vcap->pipe_id !=3D 0 ?
> +			       hdw_pixel_alignment(format->pixelformat) : 0);
>  	u32 in_w, in_h;

[Severity: High]
If walign is 0 for the dump pipe, unaligned widths can be negotiated. Will
this cause the unconditional WARN_ON() checks in dcmipp_bytecap_buf_prepare=
()
to trigger on user-controlled unaligned geometry?

[ ... ]
> @@ -494,25 +701,26 @@ static void dcmipp_bytecap_stop_streaming(struct vb=
2_queue *vq)
> =20
>  	/* Disable pipe */
> -	reg_clear(vcap, DCMIPP_P0FSCR, DCMIPP_P0FSCR_PIPEN);
> +	reg_clear(vcap, DCMIPP_PxFSCR(vcap->pipe_id), DCMIPP_PxFSCR_PIPEN);
> =20
>  	/* Clear any pending interrupts */
> -	reg_write(vcap, DCMIPP_CMFCR, DCMIPP_CMIER_P0ALL);
> +	reg_write(vcap, DCMIPP_CMFCR, DCMIPP_CMIER_PxALL(vcap->pipe_id));
> =20
>  	spin_lock_irq(&vcap->irqlock);
> =20
> @@ -525,7 +733,8 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_=
queue *vq)
> =20
>  	spin_unlock_irq(&vcap->irqlock);

[Severity: High]
This is a pre-existing issue, but does dcmipp_bytecap_stop_streaming() lack
synchronization with the IRQ thread? The buffers are freed and vcap->active=
 is
cleared, but vcap->next remains intact. If the IRQ thread executes concurre=
ntly,
can it swap the dangling next pointer into active and use it, leading to a
Use-After-Free?

[ ... ]
> @@ -541,7 +750,9 @@ static int dcmipp_bytecap_buf_prepare(struct vb2_buff=
er *vb)
>  	struct dcmipp_bytecap_device *vcap =3D  vb2_get_drv_priv(vb->vb2_queue);
>  	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
>  	struct dcmipp_buf *buf =3D container_of(vbuf, struct dcmipp_buf, vb);
> +	struct v4l2_pix_format *format =3D &vcap->format;
>  	unsigned long size;
> +	int ret;
> =20
>  	size =3D vcap->format.sizeimage;
> =20
> @@ -557,6 +768,24 @@ static int dcmipp_bytecap_buf_prepare(struct vb2_buf=
fer *vb)
>  		/* Get memory addresses */
>  		buf->addr =3D vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
>  		buf->size =3D vb2_plane_size(&buf->vb.vb2_buf, 0);
> +
> +		ret =3D frame_planes(buf->addr,
> +				   buf->addrs, buf->strides, buf->sizes,
> +				   format->width, format->height,
> +				   format->pixelformat);
> +		if (ret) {
> +			dev_err(vcap->dev, "%s: Unsupported pixel format (%x)\n",
> +				__func__, format->pixelformat);
> +			return ret;
> +		}
> +
> +		/* Check for 16 bytes alignment required by hardware */
> +		WARN_ON(buf->addrs[0] & 15);
> +		WARN_ON(buf->strides[0] & 15);
> +		WARN_ON(buf->addrs[1] & 15);
> +		WARN_ON(buf->strides[1] & 15);
> +		WARN_ON(buf->addrs[2] & 15);
> +
>  		buf->prepared =3D true;

[Severity: High]
This is a pre-existing issue, but does setting buf->prepared =3D true here
permanently cache the DMA addresses? If userspace uses V4L2_MEMORY_DMABUF a=
nd
queues a different file descriptor on the same buffer index, it seems the
driver will skip updating the hardware addresses and DMA into the old memor=
y.

[ ... ]
> @@ -690,7 +919,7 @@ dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_b=
ytecap_device *vcap)
>  		 * for next frame). On-going frame capture will continue until
>  		 * FRAME END but no further capture will be done.
>  		 */
> -		reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);
> +		reg_clear(vcap, DCMIPP_PxFCTCR(vcap->pipe_id), DCMIPP_PxFCTCR_CPTREQ);
> =20
>  		dev_dbg(vcap->dev, "Capture restart is deferred to next buffer queuein=
g\n");
>  		vcap->next =3D NULL;
> @@ -707,7 +936,13 @@ dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_=
bytecap_device *vcap)
>  	 * This register is shadowed and will be taken into
>  	 * account on next VSYNC (start of next frame)
>  	 */
> -	reg_write(vcap, DCMIPP_P0PPM0AR1, vcap->next->addr);
> +	reg_write(vcap, DCMIPP_PxPPM0AR1(vcap->pipe_id), vcap->next->addrs[0]);

[Severity: Critical]
This is a pre-existing issue, but is there a risk of a NULL pointer derefer=
ence
here when restarting capture after queue starvation? If the queue runs empt=
y,
dcmipp_bytecap_process_frame() completes the last buffer and sets vcap->act=
ive
to NULL. If userspace resumes capture by queuing two new buffers, it seems
list_next_entry() will dereference vcap->active while it is NULL.

[ ... ]
> @@ -743,29 +978,39 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int ir=
q, void *arg)
>  {
>  	struct dcmipp_bytecap_device *vcap =3D
>  			container_of(arg, struct dcmipp_bytecap_device, ved);
> +	u32 cmsr2_pxframef;
> +	u32 cmsr2_pxvsyncf;
> +	u32 cmsr2_pxovrf;
>  	size_t bytesused =3D 0;
> =20
>  	spin_lock_irq(&vcap->irqlock);
> =20
> +	cmsr2_pxovrf =3D DCMIPP_CMSR2_PxOVRF(vcap->pipe_id);
> +	cmsr2_pxvsyncf =3D DCMIPP_CMSR2_PxVSYNCF(vcap->pipe_id);
> +	cmsr2_pxframef =3D DCMIPP_CMSR2_PxFRAMEF(vcap->pipe_id);
> +
>  	/*
>  	 * If we have an overrun, a frame-end will probably not be generated,
>  	 * in that case the active buffer will be recycled as next buffer by
>  	 * the VSYNC handler
>  	 */
> -	if (vcap->cmsr2 & DCMIPP_CMSR2_P0OVRF) {
> +	if (vcap->cmsr2 & cmsr2_pxovrf) {
>  		vcap->count.errors++;
>  		vcap->count.overrun++;
>  	}
> =20
> -	if (vcap->cmsr2 & DCMIPP_CMSR2_P0FRAMEF) {
> +	if (vcap->cmsr2 & cmsr2_pxframef) {
>  		vcap->count.frame++;
> =20
>  		/* Read captured buffer size */
> -		bytesused =3D reg_read(vcap, DCMIPP_P0DCCNTR);
> +		if (vcap->pipe_id =3D=3D 0)
> +			bytesused =3D reg_read(vcap, DCMIPP_P0DCCNTR);
> +		else
> +			bytesused =3D vcap->format.sizeimage;
>  		dcmipp_bytecap_process_frame(vcap, bytesused);
>  	}
> =20
> -	if (vcap->cmsr2 & DCMIPP_CMSR2_P0VSYNCF) {
> +	if (vcap->cmsr2 & cmsr2_pxvsyncf) {
>  		vcap->count.vsync++;
>  		if (vcap->state =3D=3D DCMIPP_WAIT_FOR_BUFFER) {
>  			vcap->count.underrun++;

[Severity: High]
This is a pre-existing issue, but as mentioned above regarding
dcmipp_bytecap_stop_streaming(), does the IRQ thread miss checking for the
DCMIPP_STOPPED state? If so, it looks like it can swap the dangling next po=
inter
into active and use it.

[ ... ]
> @@ -826,6 +1071,26 @@ static int dcmipp_bytecap_link_validate(struct medi=
a_link *link)
>  	if (ret < 0)
>  		return 0;
> =20
> +	/* On pixel pipes there can be alignment constraints */
> +	if (vcap->pipe_id !=3D 0) {
> +		u32 width_aligned;
> +		/*
> +		 * Depending on the format & pixelpacker constraints, vcap width is
> +		 * different from mbus width.  Compute expected vcap width based on
> +		 * mbus width
> +		 */
> +		width_aligned =3D round_up(source_fmt.format.width,
> +					 1 << hdw_pixel_alignment(vcap->format.pixelformat));
> +
> +		if (width_aligned !=3D vcap->format.width ||
> +		    source_fmt.format.height !=3D vcap->format.height) {
> +			dev_err(vcap->dev, "Wrong width or height %ux%u (%ux%u expected)\n",
> +				vcap->format.width, vcap->format.height,
> +				width_aligned, source_fmt.format.height);
> +			return -EINVAL;
> +		}
> +	}
> +
>  	if (source_fmt.format.width !=3D vcap->format.width ||
>  	    source_fmt.format.height !=3D vcap->format.height) {

[Severity: High]
Are we missing an else block here? If the alignment block above successfully
matches the aligned width, this unconditional exact-match check will run
afterward. If the source width was unaligned, they won't match exactly, cau=
sing
link validation to unconditionally fail for pixel pipes.

[ ... ]
> @@ -870,6 +1145,22 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(c=
onst char *entity_name,
>  	if (!vcap)
>  		return ERR_PTR(-ENOMEM);
> =20
> +	/* Retrieve the pipe_id */
> +	vcap->pipe_id =3D dcmipp_name_to_pipe_id(entity_name);
> +	if (vcap->pipe_id < 0) {
> +		dev_err(dev, "failed to retrieve pipe_id\n");
> +		goto err_free_vcap;
> +	}

[Severity: High]
Since vcap->pipe_id is a u32, this check (vcap->pipe_id < 0) evaluates to f=
alse.
If dcmipp_name_to_pipe_id() returns a negative error code like -EINVAL, wil=
l it
be treated as a massive positive integer, leading to out-of-bounds I/O memo=
ry
accesses when used in register offset calculations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-stm32-dcmi=
pp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com?part=3D11

