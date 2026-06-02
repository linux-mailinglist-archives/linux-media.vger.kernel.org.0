Return-Path: <linux-media+bounces-63390-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id su7cLkzeHmpAWwAAu9opvQ
	(envelope-from <linux-media+bounces-63390-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:44:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C08F462E9C2
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:44:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QEUl+TWt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63390-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63390-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4436300D76E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5AA3DD51A;
	Tue,  2 Jun 2026 13:32:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE45A3264DA
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 13:32:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407134; cv=none; b=RlYVp4ygLwgEvPgVCPFnaFqAIv9ee1Kz29KYGta/5cKWJr8PqgXcgR4N3Z3Hysf2Gf81AxLS0XSrtAckhOiUJPDukAzdXRMN5/F8wvLe14z/cmuUAkVPnnHrXSdvLJx3tp+4bowZanC5mePNJwjMASNzO8HWqZiO+Przp1SRd64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407134; c=relaxed/simple;
	bh=ral+3CBZsWibxo+W+IBEdoXg2kzNJLG0eFVE6kD1AMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jMly6D8cK0rgQxyHYgN1y0yeMcjba/Ucxwnn6iGAi105HllGRxx7atOfScMWeeqvzyEuh27ujyMglmqyXoZHGGoBaeKScPSA+YEOJJABOgSL166VQ6N6/6rMqqeSBiY2oK4vnL9riD6UV1uk7tvZmc5lrVyr4+hEpeo/7vVLxdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEUl+TWt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E791F00893;
	Tue,  2 Jun 2026 13:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407132;
	bh=Lhp4dnYuNR1XiLuWKOtaCiX7ZKau23Bm4mQht24Hflg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QEUl+TWtzEssNToNgrluQj2evkNQm5WCdslI9i20bymjY3PRVMNMRoDwLZ+j/DyM2
	 fWTTX49hhj8TmH0gf5MoLraL/A+YZrsCUoSy8D3/4ZI2chcyv7tnzN4tqYmlyw83oE
	 5+rE4F4/T4d8R4xCyiX95ib1AYhnkuFCe18IjMv9xDj/pl43+jvguV+eH4bSK7iZrg
	 7QbuGg5O0sXSP9orwPxKJSEs4Bj8QrOfmmaWRaBa+0cj+IEEzBgdsSFlBoxADy2+Ow
	 KFkyC1Up56VR4kZs7oyq/yiUVgY0knstsK5yx7nasOHiFAMKOyKE3as1z2ZOFSqqCT
	 53FB9mUKihz+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/13] media: stm32: dcmipp: pixelproc: addition of
 dcmipp-pixelproc subdev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-10-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-10-3c76b5f93157@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 13:32:12 +0000
Message-Id: <20260602133212.88E791F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63390-lists,linux-media=lfdr.de];
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
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url,st.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C08F462E9C2

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing v4l2_ctrl_handler_free() calls cause a memory leak of the =
V4L2 control handler structures when the subdevice is unregistered or when =
initialization fails.
- [High] Integer division truncation in V4L2_SEL_TGT_COMPOSE clamping allow=
s userspace to trigger a divide-by-zero kernel panic.
- [Medium] Incorrect validation of pm_runtime_get_if_in_use() return value =
causes an unbalanced runtime PM put and negative usage count.
- [Medium] dcmipp_pixelproc_set_fmt() accepts unsupported color conversion =
combinations which subsequently cause streaming to fail.
--

commit 44b952f81ce4e958d08d721f7d7bb388641f1def
Author: Alain Volmat <alain.volmat@foss.st.com>
Date:   Tue Jun 2 13:14:07 2026 +0000

    media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev
   =20
    Addition of the driver for dcmipp-pixelproc subdev.  This subdev is the
    last one before the capture device at the tail of both main and
    aux pipelines.

> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelpro=
c.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
> new file mode 100644
> index 0000000000000..40394ebfd8279
> --- /dev/null
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c

[ ... ]

> +static int dcmipp_pixelproc_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct dcmipp_pixelproc_device *pixelproc =3D
> +		container_of(ctrl->handler,
> +			     struct dcmipp_pixelproc_device, ctrls);
> +
> +	if (pm_runtime_get_if_in_use(pixelproc->dev) =3D=3D 0)
> +		return 0;

[Severity: Medium]
Will this lead to an unbalanced put if pm_runtime_get_if_in_use() returns a
negative error code?

If runtime PM is disabled (e.g. during suspend or unbind),
pm_runtime_get_if_in_use() returns -EINVAL. Because the check only aborts
if the return value is exactly 0, it will proceed to access the hardware
registers and unconditionally call pm_runtime_put(pixelproc->dev). Since the
usage count was not incremented, this will underflow the counter. Should
this check for <=3D 0 instead?

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_PIXELPROC_GAMMA_CORRECTION:
> +		reg_write(pixelproc, DCMIPP_PxGMCR(pixelproc->pipe_id),
> +			  (ctrl->val ? DCMIPP_PxGMCR_ENABLE : 0));
> +		break;
> +	}
> +
> +	pm_runtime_put(pixelproc->dev);
> +
> +	return 0;
> +};

[ ... ]

> +static int dcmipp_pixelproc_set_fmt(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *state,
> +				    struct v4l2_subdev_format *fmt)
> +{
> +	struct dcmipp_pixelproc_device *pixelproc =3D v4l2_get_subdevdata(sd);
> +
> +	if (v4l2_subdev_is_streaming(sd))
> +		return -EBUSY;
> +
> +	dcmipp_pixelproc_adjust_fmt(pixelproc, &fmt->format, fmt->pad);
> +
> +	if (IS_SINK(fmt->pad)) {

[ ... ]

> +	} else {
> +		struct v4l2_rect *compose =3D
> +			v4l2_subdev_state_get_compose(state, 0);
> +
> +		/* AUX (pipe_nb 2) cannot perform color conv */
> +		if (pixelproc->pipe_id =3D=3D 2) {
> +			struct v4l2_mbus_framefmt *sink_fmt =3D
> +				v4l2_subdev_state_get_format(state, 0);
> +
> +			fmt->format =3D *sink_fmt;
> +			fmt->format.code =3D
> +				dcmipp_pixelpipe_src_format(fmt->format.code);
> +		}
> +
> +		fmt->format.width =3D compose->width;
> +		fmt->format.height =3D compose->height;
> +	}
> +
> +	/* Update the selected pad format */
> +	*v4l2_subdev_state_get_format(state, fmt->pad) =3D fmt->format;

[Severity: Medium]
Does this allow userspace to request unsupported color conversion formats
that will cause streaming to fail later?

According to the V4L2 API, set_fmt should automatically adjust any requested
format to a supported one so that streaming succeeds. Currently, for the ma=
in
pipe, unsupported combinations of colorimetry and quantization (e.g. YUV601
full-range to YUV601 limited-range) are accepted here verbatim, but then
dcmipp_pixelproc_colorconv_config() correctly rejects them during streamon,
causing VIDIOC_STREAMON to fail unexpectedly.

> +
> +	return 0;
> +}
> +
> +static int dcmipp_pixelproc_set_selection(struct v4l2_subdev *sd,
> +					  struct v4l2_subdev_state *state,
> +					  struct v4l2_subdev_selection *s)
> +{

[ ... ]

> +	case V4L2_SEL_TGT_COMPOSE:
> +		s->r.top =3D 0;
> +		s->r.left =3D 0;
> +		s->r.width =3D clamp_t(u32, s->r.width,
> +				     crop->width / DCMIPP_MAX_DOWNSCALE_RATIO,
> +				     crop->width);
> +		s->r.height =3D clamp_t(u32, s->r.height,
> +				      crop->height / DCMIPP_MAX_DOWNSCALE_RATIO,
> +				      crop->height);

[Severity: High]
Can userspace configure a compose width or height of 0 here, leading to a
divide-by-zero crash during stream configuration?

If crop->width is less than DCMIPP_MAX_DOWNSCALE_RATIO (which is 64), the
division crop->width / DCMIPP_MAX_DOWNSCALE_RATIO truncates to 0. This allo=
ws
s->r.width to be clamped to a minimum of 0. When streaming starts,
dcmipp_pixelproc_set_crop_downscale() divides by compose->width, resulting =
in
a kernel panic.

> +		*compose =3D s->r;
> +
> +		dev_dbg(pixelproc->dev, "s_selection: compose (%d,%d)/%ux%u\n",
> +			compose->left, compose->top,
> +			compose->width, compose->height);
> +		break;

[ ... ]

> +static void dcmipp_pixelproc_release(struct v4l2_subdev *sd)
> +{
> +	struct dcmipp_pixelproc_device *pixelproc =3D v4l2_get_subdevdata(sd);
> +
> +	kfree(pixelproc);

[Severity: High]
Does this leak the V4L2 control handler structures memory?

v4l2_ctrl_handler_init() and v4l2_ctrl_new_custom() dynamically allocate
memory for the controls during dcmipp_pixelproc_ent_init(). However,
v4l2_ctrl_handler_free() is never called here when releasing the subdevice,
which will cause a memory leak when the driver is unbound.

> +}

[ ... ]

> +struct dcmipp_ent_device *
> +dcmipp_pixelproc_ent_init(const char *entity_name,
> +			  struct dcmipp_device *dcmipp)
> +{

[ ... ]

> +	pixelproc->sd.ctrl_handler =3D &pixelproc->ctrls;
> +	if (pixelproc->ctrls.error) {
> +		ret =3D pixelproc->ctrls.error;
> +		dev_err(pixelproc->dev, "control initialization error %d\n", ret);
> +		kfree(pixelproc);

[Severity: High]
Is a call to v4l2_ctrl_handler_free() missing here as well before returning,
to clean up any partially initialized controls on the error path?

> +		return ERR_PTR(ret);
> +	}
> +
> +	/* Initialize ved and sd */
> +	ret =3D dcmipp_ent_sd_register(&pixelproc->ved, &pixelproc->sd,
> +				     &dcmipp->v4l2_dev, entity_name,
> +				     MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER,
> +				     ARRAY_SIZE(pads_flag), pads_flag,
> +				     &dcmipp_pixelproc_int_ops,
> +				     &dcmipp_pixelproc_ops,
> +				     NULL, NULL);
> +	if (ret) {
> +		kfree(pixelproc);
> +		return ERR_PTR(ret);
> +	}
> +
> +	pixelproc->ved.dcmipp =3D dcmipp;
> +
> +	return &pixelproc->ved;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-stm32-dcmi=
pp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com?part=3D10

