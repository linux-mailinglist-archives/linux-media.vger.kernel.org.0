Return-Path: <linux-media+bounces-56088-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOIEMnhXuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56088-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:30:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 512B22AAE4C
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B21E3065320
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A9A3CBE82;
	Tue, 17 Mar 2026 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UiLr3jrT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UK58Y3V2"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A3A375F6B
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754032; cv=pass; b=gQZFB6VRm6hTTJERHqLm9BHXU5kF+1BZBN+dOlZrNrKp3pJC72fw9m+vGdVNu14rT0LWZ+VC9V+LFLt+nW8ekPWJARw5o177hVmBspfsRGXMRt9czMxFhiUYCdQbG6MZ4QspgAtakbNdFXXTl68dJogKy1fDoyovHAhu9QXDyGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754032; c=relaxed/simple;
	bh=UzgddgqhFdqzTE3QV1N9pFKm7E1LqVP1UG93RCCIM1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnRJ2eKNUz1piQo0TYu6qEC0GU/dq2c095D2yt5v+HNP77i2uIE5akxHK2OyhqZQJPJkLh4kgvOyzKqklOAXeuwbGcpp5JyFHp5BCrK8C4BSugqCdhAucf+3iyfN/FgsEzyAWJeRN2GvOGzDS9lzBFwoIYGmMIZtbbTz6sg5hYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UiLr3jrT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UK58Y3V2; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773754029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L4FUNPc6f1bhV7WD9fv0D8/C/A5IwN8Vmj1JWhN1GCg=;
	b=UiLr3jrTX7uOgO2uRTYUGfv/X82kIbPrLH5++rYYO3Cu31U24UBBZueTk77/T3OBED74Y1
	go126+BCpCbjo4pcc400L7hS2C1cAuFeVlByxz4Tw1/DkjiGl4f/PipGS+vCzbBvEwBOKw
	SNJ2F4T0VqUJr4LQNCcxTf8Cz1Jg0Pc=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-HAPM_FzjPNSa_7n5EhfxjQ-1; Tue, 17 Mar 2026 09:27:08 -0400
X-MC-Unique: HAPM_FzjPNSa_7n5EhfxjQ-1
X-Mimecast-MFC-AGG-ID: HAPM_FzjPNSa_7n5EhfxjQ_1773754028
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67bb5dbf5bbso35233965eaf.2
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 06:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773754027; cv=none;
        d=google.com; s=arc-20240605;
        b=fDkR36Z8su1cIHDr8cTRiLkyb65XmL8SYuPwN71uqXgrIFiwSJ+V2yMSgu9MM3o1h5
         LYPRgpjowmWjQhtqn4HR8hIFr+ZXxA5QE5PLwPA2+aMB/JUjI5fyA07l28qFW09+o9n8
         2+PxhT8Bhu1wRYYRw+I1IsKWw6n06Uzihgxy+ZtNCXv50WgHitzIfyieVMZv1GzHq3GN
         MAwC3e8fpKkoHneOve7WOBixNJWSoI1VQrJOxf+z1lUmuSTwBUwtuxx/SRdXfr2OGLRi
         x0KiV3CdyslEn58zTUZqa9os2FSbHageXLX13SbAJr+lpGpI92OOHecug7YCUu6duN/q
         YfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L4FUNPc6f1bhV7WD9fv0D8/C/A5IwN8Vmj1JWhN1GCg=;
        fh=fxV6KVESbn0QM/ne35i4WrJClkyptAeUG5Rzt4iwLAY=;
        b=JBRt9GtayGN9OAcRXNQjDT7M2KjS8KVsvyTyomyT9L2cF3FHyDhl0sZleU5A1lTgO1
         8MU4l/eqxKsGEwyoR2esEvd0HJTAmdTil4iFMjq5oyuBuuhMKQqwVhey+odZ6XDMdsV/
         7mlj2C7eTj1+46GMpYZZB6ApKNeB4615ClBdSIS9uogn6RsTGbE1XVGG8w2Sh9cCKL8G
         yHbu7K8pYBa61IHa6ipIxfmEh5Gltkfgw2XXxvudCp3ZfzEsiKWrL/iwq6f1LoMtCp8w
         GRV09XNYJJ47Qwu098+WdnTs7TvaY/xbQ8XoUa3Rj6dqzDNbAj+AiSWoPuGiXK2NVsOV
         RgOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773754027; x=1774358827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4FUNPc6f1bhV7WD9fv0D8/C/A5IwN8Vmj1JWhN1GCg=;
        b=UK58Y3V2gWceY8iY0d5QyMWwqGvL8qGPxPvuWyvRHGUtFah2RUvLtMc8A9pQ12rPQY
         /LN/Wd0VmqVIWn0hXjeku/QA/uW0aYoB281MQNk/pMGO1/CUni9sK/ExtZL/utDl1dxC
         h1DqBgsm0+Pp4sLmgMsxnx8bu5C4RkMznp/Fa7EBaZWCOYyq0H7MxoGJT68rAzmuq8fX
         gA3e7RnE45821vye5ZOgxhO+fGETcLy5LyfspDc7+7AiiGeKxV5USvQG/eGf2Io+VHvY
         85S1SpDFyHMgXMmCPrukvlANEd5ns91Zfq1sbvHKEVdvovMGzFVx40Dhpz7DcIuGxzo6
         Hifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773754027; x=1774358827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4FUNPc6f1bhV7WD9fv0D8/C/A5IwN8Vmj1JWhN1GCg=;
        b=gp2nRT2crS8CZM5TWRZz5cNqu8NqTCcoAN7gRa1zKqNUJDjtBXTZihzSyVG8w3PW8X
         YLCqj2v+pyn+/6M24BH49vkvqsKZnvROPnsdrmfBgLMcm/ttx+FD3NUvilt7EtlzGiIt
         PnxsGAiE5lqYHmQuFx1BrykgWyJsFnum363PxQyBCSYB2r/cAXwSi5FKcBjzgn1DRynf
         mrL8VHnMi9RrTby4DjUpLz2a7WVY8DQTnKG2wG7g4wBX5s3dZLhjmLk1oY10kWt9AVQS
         lX3e4CiMBnZc14d80Pw1iEnPxrBUgp6KA6Fr5yn0fAeVMGJW2wQaykiaSK3+OB0J1aMH
         2jHw==
X-Forwarded-Encrypted: i=1; AJvYcCWZak3lQXTxSMaCAN1ZBD+ytfooIEDfL+RaTNHmNx/QZDzD8Iy0vDUcmecg4tksf/dK6EZtQJI6JMGg1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFi0nLZbPDvL/coeMX19KEhqeETfHfycEcGRZ5FTmi8uFMsqeg
	dJ6plZgUSQChqbOhdeNkg3FwAJQ/nTfDq0f7DWLP9A6CkTXW6hySNsw/u5qMhvCdRlQr4uzberT
	U9IAn1YvPxISwK0ZRYsu5sRFvJVN6yilvsSzuNiaD1/hcI5LgLfMaJuUBmulFx0XMbX7V0S/0ZU
	j3eXMruj3zIF1RiJyvAqyK2LW3RFjlCT357JInNdTxUDesWhw=
X-Gm-Gg: ATEYQzzY2ZxQfi2D7VJ/wheRqfzQ2M15dtWR1ZYgZKKIIT518xXFJFvUhOJBxMLb5Fs
	KF9+GYhTaVBBYDY8fH/X0qyrlf9+t9uFMQgRvqIGgg+PqnYSOVQWzPl0NKSU2m5FztXdBfXXTJ0
	Cp5psI88G5he5VNWUDQAhIvqAKL3PeAUf1C5qBWE1GzOGcOjgOtS3iQGDfbwkinoJYvBVXIdF/P
	euhsw==
X-Received: by 2002:a05:6820:4511:b0:67b:c174:66bf with SMTP id 006d021491bc7-67bdaa38ef8mr8765200eaf.47.1773754027465;
        Tue, 17 Mar 2026 06:27:07 -0700 (PDT)
X-Received: by 2002:a05:6820:4511:b0:67b:c174:66bf with SMTP id
 006d021491bc7-67bdaa38ef8mr8765167eaf.47.1773754026677; Tue, 17 Mar 2026
 06:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316085704.352669-1-hpa@redhat.com> <abh9evUPzozh40k-@kekkonen.localdomain>
 <a3f89715-b937-4858-9a44-8d8d634cf97a@oss.qualcomm.com>
In-Reply-To: <a3f89715-b937-4858-9a44-8d8d634cf97a@oss.qualcomm.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 17 Mar 2026 21:26:55 +0800
X-Gm-Features: AaiRm50RaXd6USKYrl51k-CeYJDL0D32786Sdw_0Gdkvv255KeUEda962LrAvQQ
Message-ID: <CAEth8oG61B_rvz-c1tOD_Bk2c4FedoYBSiJmBAQjemz_RnTCYA@mail.gmail.com>
Subject: Re: [PATCH v11] media: Add t4ka3 camera sensor driver
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56088-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 512B22AAE4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

Thank you for providing the answer

On Tue, Mar 17, 2026 at 8:25=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Hi Sakari,
>
> On 16-Mar-26 23:00, Sakari Ailus wrote:
>
> <snip>
>
> >> diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
> >> new file mode 100644
> >> index 000000000000..d9af5e51f7a8
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/t4ka3.c
>
> <snip>
>
> >> +static struct v4l2_mbus_framefmt *t4ka3_get_active_format(struct t4ka=
3_data *sensor)
> >> +{
> >> +    struct v4l2_subdev_state *active_state =3D
> >> +            v4l2_subdev_get_locked_active_state(&sensor->sd);
> >> +
> >> +    return v4l2_subdev_state_get_format(active_state, 0);
> >> +}
> >> +
> >> +static struct v4l2_rect *t4ka3_get_active_crop(struct t4ka3_data *sen=
sor)
> >> +{
> >> +    struct v4l2_subdev_state *active_state =3D
> >> +            v4l2_subdev_get_locked_active_state(&sensor->sd);
> >> +
> >> +    return v4l2_subdev_state_get_crop(active_state, 0);
> >
> > Please avoid adding such helpers.
>
> The problem is that we need to know the active-fmt/-crop in some places
> without access to it. E.g. when the vblank ctrl gets set this influences
> the range of the exposure control, so we need active_fmt.height to
> calculate the values to pass to v4l2_ctrl_modify_range() and we need
> this from a v4l2_ctrl_ops.s_ctrl callback which does not get passed
> in the (active) fmt.
>
> Since the ctrl lock is used as the main sensor-driver lock too,
> we can always safely call v4l2_subdev_get_locked_active_state()
> in these cases, since we are always holding the lock.
>
> The alternative would be to store a copy of the active fmt/crop
> inside struct t4ka3_data, but I thought that the whole direction
> for sensor drivers was to stop having (and needing to update) their
> own shadow copy of the active_state and instead direct use
> the active_state ?
>
> <snip>
>
> >> +static int t4ka3_s_ctrl(struct v4l2_ctrl *ctrl)
> >> +{
> >> +    struct t4ka3_data *sensor =3D ctrl_to_t4ka3(ctrl);
> >> +    struct v4l2_mbus_framefmt *fmt;
> >> +    int ret;
> >> +
> >> +    /* Update exposure range on vblank changes */
> >> +    if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> >> +            ret =3D t4ka3_update_exposure_range(sensor);
> >> +            if (ret)
> >> +                    return ret;
> >> +    }
> >> +
> >> +    fmt =3D t4ka3_get_active_format(sensor);
> >
> > You could assign this in declaration.
> >
> >> +
> >> +    /* Only apply changes to the controls if the device is powered up=
 */
> >> +    if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
> >> +            t4ka3_set_bayer_order(sensor, fmt);
> >
> > Does this call belong here?
>
> Yes, if the hflip/vflip controls change then fmt->code needs to be
> updated to the now changed bayer-order. t4ka3_set_bayer_order()
> uses the cached ctrl->val values so it is cheap enough to
> always do this instead of checking if the changed ctrl is
> vflip or hflip.
>
> In case the sensor is actually streaming and we don't hit this path,
> the t4ka3_t_vflip()helper will return -EBUSY since changing
> the active fmt while streaming is not a good idea.
>
> Looking at this again, I do think that: t4ka3_t_vflip() should
> be renamed to t4ka3_update_hvflip() because the current name
> is weird.

I'll change the name of it.

>
> Regards,
>
> Hans
>
>


--=20
BR,
Kate


