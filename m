Return-Path: <linux-media+bounces-57530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA+vJvTWyWnE2wUAu9opvQ
	(envelope-from <linux-media+bounces-57530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 03:50:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C4F354A7F
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 03:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCF53300CC3A
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 01:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C653C19CD1D;
	Mon, 30 Mar 2026 01:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkfMSM/E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D7A22A817
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 01:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774835428; cv=pass; b=tnD71xV6gZvmq8N75iJdJVVylentu6Im5eZyTBhtzR4amRgzyr0AyTy1SlwKfwhF29BnlbrhSQQEpOw1iodDGk17F6Ho8H+vbtoJwRJ8b57c6a83UvCDO8H7m42BveTdtCvKtQxXcGshaET1SNya8BlnCvgDICT+zZr+J4N4O78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774835428; c=relaxed/simple;
	bh=3zmpkh1HOAtT9VdLxxFNLSo1VLNkiV6TEdXiOsrwqv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=fGRoNqg7kYJEGtz0fuHWovwAebugWi1p2Ybse5x/AkBXPBUQTE+zQShw+CkS/9Pj/FgWrO03+9/yUq6ZsUuNos/C+UQTv3XF5cRjbovJNpVOkBeO4gx5L2d/G20WDumUG3w0hvnxPKMZhP4p8gfYp413AuV4a1WhxLdC5ZIgSDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkfMSM/E; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35d932cc948so938998a91.2
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 18:50:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774835426; cv=none;
        d=google.com; s=arc-20240605;
        b=Ta5mCYfuTh1371ipZm+W6q4c5FYLn/MyNqn1ggnlzyTi+DTFJ0cnDKalNDJ6jNhFD6
         dwBpOFCZBe/XOaJEhc5Axn964EBqT+Cbg3tdPW31LVpfric6gzH2xlO/xmXBezcZlSAO
         9nv/qcGbp5J4doCAc/Rz6mfxfhYgWPrObON4imB/1F6gPekBVsf+/KBk6Q4MGm9f36PD
         PWRivGbO47ry94mNmqNzM9w9Aext6c/8TuMNluluPJdGvqITcDsMDTKDvwY9pViLyVzV
         RX2aGWqBvMC3x5Rvn6rfvfE082A+ODMllHIUurMG7MVIHw7uLdTBQVj+hrmy2bzTfOSo
         jCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J5FBIeneBNFUSJjshfpElbkvAz/Tk6TZKpg7T0/4sXM=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=PRXaHFaX4uFMSX/OQRxxYDQ0bKDpB0d80zNVl0zT8Y2v5rgs9d9x7CiUZG87pEjEW7
         WXJEEM8EfjWbionIacpOv9/rHFndgA8DDbK9aPOpOz+HWO7LEThhThKy8M4hq6DdF04n
         LMCDGbay9B7pR3UvwH6xea7e7EvqlCngPC0ePuz3wsSqwQcRaLltfkqh6O/WSJ2FmIj4
         amvYsHUHFkFQ5/8IHvYAzk81tFTDYTb7y6EToAilcBg3wDCI2fY4GSAwWMBIRGiY+FSV
         ZgaZsV3qnPW0YfVHc1+iH/XzBCDNq4XuATS5SQuKCP7LHuJtsr/FfgT5EkPDH53NbfWt
         QaMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774835426; x=1775440226; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5FBIeneBNFUSJjshfpElbkvAz/Tk6TZKpg7T0/4sXM=;
        b=NkfMSM/ExskgdeCAkNEYU6XfYdiLFPu901zqicZEPpgLCwHW5oVy12UdncRtGBuSPt
         BEBS+aIutdgkdXSXBrZ/XLf751mJjEk+flJDB1H9zEjgQQWQcslL5VGY1SaEjf03aK/9
         XY/tuqtvisK1bHkvHpTI2jITqf+fWfy6g9gMXtn4L8Jk7Esv0gchvMkUB+F893zsOotM
         fZkyDO7pJBBvlm0eJlI5JBVW44JiAZLec34pk942Ocmxb780344sdK8zH0zsD5nBQmS7
         ny0lJ7ZdqG3lZTPRDrSI2eqH5spjWywSb6tfctMqlN4vkTy7Nt5AyHZMKxsq/nAwmzH5
         QTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774835426; x=1775440226;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J5FBIeneBNFUSJjshfpElbkvAz/Tk6TZKpg7T0/4sXM=;
        b=GaXXpVx/0b9ZMvD9ccIt63ty6aPL3EXXhbfTRE4PJfgoJlXvLB4+64aicoTvv8b392
         wNSQUFTtc1FdUZAcP+YTvm7x5JR3zLvo84qWYkrh+J7phB4bn2FN0nB8gtHJJgtbl/wj
         aQpJVGcDwxLhP/xqZ0qhGTGLAfsAtEpbK68krUfajhZW1TR05ZyJ6crKAOcRn70Vnk4C
         ophJ9ZfRwgle0mzA5GOrTJjIMyjV8wZc0IV+Lhvz5MVAI7BoqUoljriFnIkrh0fxUTcy
         99C1h6P/lag7Xke/b0jqeuAGMzGZqd5mLPPdsdN2L3B+PyzXYoLCw6hmnnBYFn8Ex55m
         Yzjg==
X-Gm-Message-State: AOJu0Yy7OgJvSoJHd2Z1gerydFFJ+VeS7ksjXs5BpmeweKP1S56kkH2o
	W5V+y9zPHnzYfO5BQp8q6L5G2PzKlTVadwrFFMQVmvHJDlQqlDiXYT+qyqkx0ZwaSXqUWcSAgG2
	q9Hol75CRSSIvZbHMh4tUdECDaOcqXhYESnXiNXU=
X-Gm-Gg: ATEYQzy4zatpgNMkVMLtoEjhGFMjeEHDj58xv/DFLBmn/LX6OSL+gtww4XMy8y0f/dZ
	KqzOfVI5eqSLybHFnwNXL4PNGpiqraLE+n5MY4hVem1YyqjebQDs5pEtmLJltpw/0M9ArFT49d1
	G/ARNFprW2ZTK6ToqbEHmBmRfCbmzUYnUgMf/ZwbRIiUh33rZCfUM9DKX+gB8/kVWF6q9XIaTyX
	DmR7bUGAb1nl/gj2Fn7UF0Xb1/8GN4rszbguSSWMuRsramdA6roVLj9AHrzhO/YviiJUjEWPi59
	6exL1ozRDPOhRL6ZQIitIgqzu0ydVyfhVMAc6V/3wM2+MPCQwNgg5paDERVlPpJsbUaJDoee
X-Received: by 2002:a17:90b:1e4f:b0:35b:e56e:b58b with SMTP id
 98e67ed59e1d1-35c300321b2mr9984770a91.15.1774835426154; Sun, 29 Mar 2026
 18:50:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318084936.10626-1-esty5664@gmail.com>
In-Reply-To: <20260318084936.10626-1-esty5664@gmail.com>
From: Esther Zilberberg <esty5664@gmail.com>
Date: Mon, 30 Mar 2026 04:50:15 +0300
X-Gm-Features: AQROBzCEEFjBSs4Lwmr5HLTWQlKPQUfCSM9AXhKxo0s_cKQHgb7hiDY0LjVz-6w
Message-ID: <CAPMPFbgjVSB-W6tLJuCFdh_axWqSkJbtfNq+_ParWB9tYpqQxA@mail.gmail.com>
Subject: Re: [PATCH v4l-utils] v4l2-tracer: retrace: support all mplane planes
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57530-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[esty5664@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: F3C4F354A7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:50=E2=80=AFAM Esther Zilberberg <esty5664@gmail.=
com> wrote:
>
> For V4L2_BUF_TYPE_*_MPLANE buffers, retrace_v4l2_buffer()
> only restored the first plane from the JSON trace.
>
> Restore all planes by iterating over the "planes" array and
> reconstructing each struct v4l2_plane entry, assigning them
> into a properly allocated array.
>
> This ensures consistency with trace output and prevents
> incorrect buffer reconstruction for multiplanar formats.
>
> Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
> ---
>  utils/v4l2-tracer/retrace.cpp | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cp=
p
> index 010936c0..844c25c7 100644
> --- a/utils/v4l2-tracer/retrace.cpp
> +++ b/utils/v4l2-tracer/retrace.cpp
> @@ -284,9 +284,22 @@ struct v4l2_buffer *retrace_v4l2_buffer(json_object =
*ioctl_args)
>             buf->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>                 json_object *planes_obj;
>                 json_object_object_get_ex(m_obj, "planes", &planes_obj);
> -                /* TODO add planes > 0 */
> -               json_object *plane_obj =3D json_object_array_get_idx(plan=
es_obj, 0);
> -               buf->m.planes =3D retrace_v4l2_plane(plane_obj, buf->memo=
ry);
> +               buf->m.planes =3D (struct v4l2_plane *) calloc(buf->lengt=
h, sizeof(struct v4l2_plane));
> +        if (buf->m.planes =3D=3D nullptr) {
> +            line_info("\n\tMemory allocation failed.");
> +            free(buf);
> +            return nullptr;
> +        }
> +        for (__u32 i =3D 0; i < buf->length; i++) {
> +            json_object *plane_obj =3D json_object_array_get_idx(planes_=
obj, i);
> +            if (plane_obj =3D=3D nullptr)
> +                break;
> +            struct v4l2_plane *plane_ptr =3D retrace_v4l2_plane(plane_ob=
j, buf->memory);
> +            if (plane_ptr !=3D nullptr) {
> +                buf->m.planes[i] =3D *plane_ptr;
> +                free(plane_ptr);
> +            }
> +        }
>         }
>
>         if (buf->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE ||
> --
> 2.43.0
>
Hi,

Gentle reminder to review the patch below.

Thanks,
Esther

