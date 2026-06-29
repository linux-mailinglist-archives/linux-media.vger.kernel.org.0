Return-Path: <linux-media+bounces-66002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6JEiA0ikQmqB/AkAu9opvQ
	(envelope-from <linux-media+bounces-66002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:58:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD8B6DD8E4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:58:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=fCzB1CeB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66002-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66002-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 254E13033713
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877C3466B44;
	Mon, 29 Jun 2026 16:55:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7923FE674
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 16:55:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752139; cv=none; b=sFm7DTu9aucTrQE0a6SJamhckZpHbhUy8WYADvoexAx4u7s6mjIBN6Mnpqt7qZFT3YWmIlhLA9OMaOj/Ykwl03aMKKbn5pJc+O56I54/ShjgNvXcU3hI6aOGJuZ6gCkNZ9zD9qK62hkIwkPjQYRtmvPvPSodQfm6XqtUhl44ODI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752139; c=relaxed/simple;
	bh=kbPAf7YpLlZc5bzQbQF1PRE1ySCgi10wVxvekKvTY/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+QvkTuO83HBkFsxBpmwAl8YV7Zpv7n1y4Ax7SDmwe3pKegdKNxL9seKZ12cfp1oxPzRQgeK5hAuIlihN/4HForie7nPAdAFFpamRlXkBbW8lgcN45WC9NeZf2gVuqKKsSLM3BsBVllvWsXbb/XCj9yrVWwvav7F75KybMfZ6W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fCzB1CeB; arc=none smtp.client-ip=209.85.218.43
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1254b73d63so204409166b.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 09:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782752136; x=1783356936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdDvT+dlGC0xvYRdpBwl1fNLEwC7/L1F2NnN+5tRd2g=;
        b=fCzB1CeBqQ/YyWuonC0oM6zVvHBeXif5KAXzjZD257QtrC20QInL55Gvn4uTHWviug
         sTQu8LzZ0LXPZLfJMs4leNwuX110KMYB7B2c0TbKOs3+MHUR2i5tMEGbTJBcMuBHPsdR
         t3BEuXPGGnUQx45JpMsrPkWlJRbqvcZCMphjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782752136; x=1783356936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VdDvT+dlGC0xvYRdpBwl1fNLEwC7/L1F2NnN+5tRd2g=;
        b=BMmiJXelzug7JKBw/l9134fU4cmRQkzvEAnaU96b0LHdaXe8dVK0yX2xWO3ydLqGw1
         d2Zdt6JunC2nXgaZhxAxMiFOBgXQlzX7vZ8gNp1SQG0A2pDYnVdyHXqFMahxKsNsH+yC
         Nh0oTXelWHC5ZKclFtf77ErQm5r7cbKpTUY7zSiZDSp7wFKl4A7gPY17rt1AWUPwLJ04
         nmvEnBOq1hNLGP+HNGnxff5eGPA+c85d6W4wITZjfe9VahiSvcxhk9TnD3igDDj31yR5
         nioLfRqS3FCfgp5o4WFEJW7AaVbIFOKCU2JL3cvNbwBI68yhH06TQO8/nbMOGxCLwsOB
         rkFw==
X-Gm-Message-State: AOJu0Yybirb1KF2pktAJUFSvzvR6oKbytXPdgrCZJWqmWgTkLGA4rxCc
	lXD4OOsnh1SNKKkDio/K1p5TLJIxR8Ts/zWdX3LpucC3RwuKUN3YN13lrIkQ5fgHV5MxRFslLZZ
	a5vo+/U7U
X-Gm-Gg: AfdE7cmA+VwT3OcYLjcKv6hhUBXMPK/hHSmIGVHQX5wUG1cVtTV2StR0sWPeNUxW4/I
	gJzYbS94fy8zAvqYiK8qiqggpQGo6gsSqlWon/8WlkuaDviNPW+x4hYT7jrG28eZraVitmqTXOz
	Rm3xEt3bWSWjLiRwZy6WGsgyT0vACx0mvc61udw3KC0iI819DbRfIrgtfS6T6j0EeokYre8aIq9
	bMr0pmQPCdt/mooezqNKtjc0HNJelYe29X/OWWES5FFWFmlju7ddJ+FkNNHdB2LUETqbYzyKLBq
	TOCMUrrRXDwMxNQYfTUvB6iRDPsMJePYGCJvjeqrVo2fmQ/pzWTYzNW90jVoKEw5S+4Ni5j5ahL
	ue6DKtO8rpMidViKmCoJJM3Gg0FXLYnQ79VRIiCTFea4sccuTZugy7ge5hGECUEV0MSJp0X1F4q
	VndipXp002jw5UrT9Mg1b9zwzmfcE2tBVvzJ+k6ldJhLAd/bQqKA==
X-Received: by 2002:a17:907:970f:b0:c12:11d5:719c with SMTP id a640c23a62f3a-c1287385cd4mr2451966b.50.1782752136003;
        Mon, 29 Jun 2026 09:55:36 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe6220esm822687066b.45.2026.06.29.09.55.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 09:55:35 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-697df404e32so7386062a12.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 09:55:35 -0700 (PDT)
X-Received: by 2002:a17:907:6d0f:b0:c12:34ed:e102 with SMTP id
 a640c23a62f3a-c12873f3660mr1656266b.64.1782752134042; Mon, 29 Jun 2026
 09:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
In-Reply-To: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 18:55:21 +0200
X-Gmail-Original-Message-ID: <CANiDSCviTcv6mYmE9Ha8xh7r+kEuwGUoT18sdb2J=HzTFVhLoQ@mail.gmail.com>
X-Gm-Features: AVVi8Ce_rnwLjH5DwCHFT9VtntUrxzTNKFdFGZajXWnLuw9BcGgpRG8aoTwZeVU
Message-ID: <CANiDSCviTcv6mYmE9Ha8xh7r+kEuwGUoT18sdb2J=HzTFVhLoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: uvcvideo: add quirks for per-device stream
 error handling
To: =?UTF-8?Q?Pol_Fern=C3=A1ndez_Fern=C3=A1ndez?= <fernandezfernandezpol@gmail.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66002-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fernandezfernandezpol@gmail.com,m:linux-media@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chromium.org:dkim,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FD8B6DD8E4

Hi Pol

What application are you using to fetch frames? It should not process
frames with the error flag.

If you cannot fix your application, why don't you set the parameter no_prod=
 to 0

Something like:
rmmod uvcvideo
modprobe uvcvideo nodrop=3D0

Regards!

On Mon, 29 Jun 2026 at 18:38, Pol Fern=C3=A1ndez Fern=C3=A1ndez
<fernandezfernandezpol@gmail.com> wrote:
>
> The UVC_STREAM_ERR bit in the payload header signals that the device
> could not deliver a frame correctly. By default, uvcvideo delivers
> these frames to userspace with V4L2_BUF_FLAG_ERROR when uvc_no_drop_param
> is set (the default). Applications that rely on strict JPEG decoders
> (e.g. libjpeg) will display gray bands for the incomplete portion of
> the image, since libjpeg fills undecodable MCU rows with a neutral gray
> when the EOI marker is missing.
>
> Add UVC_QUIRK_DROP_STREAM_ERR to force-drop frames flagged with
> UVC_STREAM_ERR for specific devices, regardless of the uvc_no_drop_param
> module parameter. This ensures applications never receive truncated frame=
s
> from devices known to set UVC_STREAM_ERR on genuine encoding errors.
> The existing uvc_queue_to_stream() helper is used to reach the device
> quirks from within uvc_queue_buffer_complete().
>
> Additionally, uvcvideo unconditionally overrides the camera's probed
> wCompQuality with the maximum value returned by GET_MAX. For devices
> whose firmware treats wCompQuality=3D0 as an adaptive encoding mode (wher=
e
> the encoder adjusts quality dynamically to fit within the available USB
> bandwidth), this override increases encoding pressure and can contribute
> to UVC_STREAM_ERR events. Add UVC_QUIRK_NO_FORCE_QUALITY to preserve
> the camera's default quality value during probe negotiation.
>
> Signed-off-by: Pol Fern=C3=A1ndez Fern=C3=A1ndez <fernandezfernandezpol@g=
mail.com>
> ---
>  drivers/media/usb/uvc/uvc_queue.c | 3 ++-
>  drivers/media/usb/uvc/uvc_video.c | 3 ++-
>  drivers/media/usb/uvc/uvcvideo.h  | 2 ++
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvc=
video.h
> index XXXXXXX..XXXXXXX 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -81,6 +81,8 @@
>  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF         0x00020000
>  #define UVC_QUIRK_MSXU_META            0x00040000
> +#define UVC_QUIRK_DROP_STREAM_ERR      0x00080000
> +#define UVC_QUIRK_NO_FORCE_QUALITY     0x00100000
>
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uv=
c_video.c
> index XXXXXXX..XXXXXXX 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -451,7 +451,8 @@ int uvc_probe_video(struct uvc_streaming *stream,
>                 if (ret < 0)
>                         goto done;
>
> -               probe->wCompQuality =3D probe_max.wCompQuality;
> +               if (!(stream->dev->quirks & UVC_QUIRK_NO_FORCE_QUALITY))
> +                       probe->wCompQuality =3D probe_max.wCompQuality;
>         }
>
>         for (i =3D 0; i < 2; ++i) {
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uv=
c_queue.c
> index XXXXXXX..XXXXXXX 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -357,7 +357,8 @@ static void uvc_queue_buffer_complete(struct kref *re=
f)
>         struct vb2_buffer *vb =3D &buf->buf.vb2_buf;
>         struct uvc_video_queue *queue =3D vb2_get_drv_priv(vb->vb2_queue)=
;
>
> -       if (buf->error && !uvc_no_drop_param) {
> +       if (buf->error && (!uvc_no_drop_param ||
> +           (uvc_queue_to_stream(queue)->dev->quirks & UVC_QUIRK_DROP_STR=
EAM_ERR))) {
>                 uvc_queue_buffer_requeue(queue, buf);
>                 return;
>         }
> --
> 2.43.0
>


--=20
Ricardo Ribalda

