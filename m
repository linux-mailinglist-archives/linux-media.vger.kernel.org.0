Return-Path: <linux-media+bounces-62143-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPIZGrRkDGpXggUAu9opvQ
	(envelope-from <linux-media+bounces-62143-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:25:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5F157F935
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 522273055E52
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 13:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF03E348C63;
	Tue, 19 May 2026 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qruJVos6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E5140962C
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196779; cv=pass; b=mtop6Jd7RAIymt1Pk/gWv5DKwE50+/cFW2yaFjEuZaysprICV9/jYe+5H0CosX5By3gK3KSMfEM8jt+/d5i67Q1/flqDhl4NCr1Z+E2XYVD+d+i6sMmXUz+dpF+HOEwbzslCqwePL0a2LU9kJjySTOlK4hNgP6d5p308Ui09R4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196779; c=relaxed/simple;
	bh=d+tNP9HiaB7786A6QlxY1NJuf5fPzSCRaviYw3QklB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyukSmq826mPfeYXrFc+2Ww8FfqI4slwcL+25P2pIQnirtWgDIlPQdaBmGqHM9QrjaZnJma8twCu1GlUPJ30Qobq0jR3vtqeHj8qVdablfbZiROwS/ZkvUakqw2+ElGXyj+rCxFcnUBrOQXN05UJSL8mwck2oGj8FNnCG7jI1sM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qruJVos6; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c09c1d000so4173374d50.1
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 06:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779196776; cv=none;
        d=google.com; s=arc-20240605;
        b=LvXxAhn8BKJZfROQ+ewhod5skYiIdkAajaanAjPnD3HzeLvw/6l6KXDZJhasiJXi/i
         Cdb3KuwZqxNh3tNsl3IlH+dbaj5Fh71PR/tPi+6/w/mZkj1cG/2mn7LxLhgrvtv2t5vo
         BV4pRkBpxUs4oo1vm77qUtBHBA3+tyH7En6K9j/+a1d4p7Tu7v+qbGYUHBcF8rIizVVV
         QlBm0GbGjRUGCKr4pxL1SOhZ4L0KNjabgnKG7dpSExdIdDDpVFPZDoeLn5sMLOBrm5iT
         ULSSQlOIYQnT7Pcq5zCd4uT0M9X+gFpLgR5gaBp/B35FQd2Jgn9TwECyX8VS4A+upLdU
         Rq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d+tNP9HiaB7786A6QlxY1NJuf5fPzSCRaviYw3QklB4=;
        fh=91RntaMwxAR6rVB++SJCC5CfvFCuSbXWe7K8ZuWuBfE=;
        b=O13vNR2b+hyzXHHCX8g6/q9Y9YzOPqO5ABjLGFgfr6V/UXHQvVIzn+htq2b3ia7HuP
         gEI4wJCdkCV3isT+Dn00Rbu/C5ZPPSVRxmXievVjGYPnIyqnMGtzYs6rWVqqsQ8qu+F2
         fT8a483RgKGM5dCELMIF/XRhWLQCpMgV4QmK/VX8TXrcD8hVrjjT0yf3h3HlS8ZyBPx5
         ksZYkHTWZIhpdMbTi5fTiyo37XZzNlaObRMz7MLsokIYQVo8oyeg7AkoW+adqr37YdrH
         pzk0rtDT4SjLY6iMGUc3+5OKo4vZZQgCgv0waqDiSNOd9d70Swr9KPbtBUWLhw1xSsiJ
         OkhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779196776; x=1779801576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+tNP9HiaB7786A6QlxY1NJuf5fPzSCRaviYw3QklB4=;
        b=qruJVos61xVMVt3WX1+AILX6svsASTmEAKwudnn8sC+UCx5fors56J0PlNIzAgHta6
         moUXR59K9ZKzJL8xMstpIwrubZmzxgABpPjBKIdd/8qfFNNxWryg9EAPgNmQYSDEdRGS
         uCER9DMkUViPoJr+O4RTw5yRn6zmFiGnTVVtJSWblJ/IYs/docuEaPOg8KhzMXPKO155
         K90Eho7JA5MBbpSCRbLDL69DL4I1fJZTKUIeOSlehXMIUnL9pAETv5HDV/nDJZbjYBlQ
         TaDSsZOeG0QNWTu/RIbHES4ENS/ri2Ng6xaVmKZCUWrtuJCsmq5u6agkGDVC4jSZVTwQ
         ho+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196776; x=1779801576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d+tNP9HiaB7786A6QlxY1NJuf5fPzSCRaviYw3QklB4=;
        b=Hh0Hl8KrhkCsCzKVjsKWPihEYt4qA+gq2DDs4Z2zg1IWwA5zzu0Awy+Qvc/5PQGdCi
         w49JeLXSpaXGLnRsgUOAqrCuE1moGBTNwU5/JTbb1mAT67dAsXUd3g54iBMbV2wXdAlS
         pn5nX3nvhwnckWF4OAbJHfp03xa2zuERPNfp0odMDQWIywVnkePAdBt1DYsx1Jy3QN7/
         BMyJVBSwi/JwBGbpGuHMKAj1coBrMNnHFvmp4ZW4seNM+1XDh+wGRllwMwEewwnrNg7P
         AEHe3/btAFqpespdTpzdoomrXoQ+wIbES3Wja7QKPXLYb2t/3YVoU4bXy/e2/zksRzTT
         wBVw==
X-Forwarded-Encrypted: i=1; AFNElJ8Lm0iIgjo93asuC3+rlRTO/IK3gayNqUohIzdHh4pAUQ2FXzYF+yfYpkfp0tKtHDsC+sS1r6i17pbncg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZdjIHrhgkpS8QcRhFUG3ejARagzf0+PxuNH6wuWkWneo7oIRe
	g6pftSEQfIQwESfLybbSQkTE1BLzX3umND7lJW43uKH+z2VbmpWR7MNBSvbctSJO9h3Zztnk7LN
	oLgz4o/YFCfa2IY2ll9H8M8jWaVZ0YN0=
X-Gm-Gg: Acq92OEcbOqH7AcZz6vqodjuGPBtGFsfCKRjsDFl3rXtQHD+mb4airmTxMdjYZncLk0
	v5jFGOfokwvT7x8bXaFwunnHQjuof9R+5qBZdIcvSQCvkJqizvGSnaMl++oxSuMCbUwtdJLQPLA
	TuCXPGldljeO+70PdUEYlQouHK3tedUThdlmskKSz5vxGuziqIUrBHtmVTpfjWEe/yukEHyOun5
	AYCQg/pyYmXRH27E0YAwf6AH1D1IfMhMMcQATsW08de92mwEDhe4yAZI+dtgkqKv5ex6fZSo6no
	jmxg3VzwcCPjSn30ZZMtE+YYhbJCUj9XjLmWoCKNL290ejSb
X-Received: by 2002:a53:d005:0:b0:65c:6f05:ae25 with SMTP id
 956f58d0204a3-65e216d83d6mr14649417d50.30.1779196776397; Tue, 19 May 2026
 06:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com> <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com> <CAHijbEWqc2+kSkk3i_LxB2PQ6XwUetw1UkdUdXJfdv3zgKd1kA@mail.gmail.com>
 <38551bfe-75e1-4978-b57d-adc43cebc85e@amd.com>
In-Reply-To: <38551bfe-75e1-4978-b57d-adc43cebc85e@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 19 May 2026 15:19:24 +0200
X-Gm-Features: AVHnY4LOerIoiS4EJslI_YZhkER_543_y_7-NPEIgz5Ez-WK_fluwXi0cmnkr5s
Message-ID: <CAHijbEWHp960qvZFoK7+9ppHAqkAR7=UQhtMUccqWzGd_pFPQA@mail.gmail.com>
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org, 
	=?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62143-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,mailbox.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 1D5F157F935
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 10:18=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/18/26 14:58, Julian Orth wrote:
> > On Mon, May 18, 2026 at 2:41=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> ...
> >> It could be that we have eventfd integration for that as well now, but=
 in that case you could give the compositor an eventfd instead of a drm_syn=
cobj fd in the first place.
> >
> > Yes, all compositors use the DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to wait
> > async for the timeline point to materialize and/or be signaled. The
> > wayland protocol was the motivation for that ioctl.
> >
> >>
> >> So as far as I can see using drm_syncobj for software rendering really=
 doesn't make sense, eventfd is a much better fit for that use case.
> >
> > Using eventfd has some disadvantages:
> >
> > - We've just added syncobj support to vulkan:
> > https://github.com/KhronosGroup/Vulkan-Docs/issues/2473#issuecomment-44=
46117280.
> > For eventfd we would not only have to add yet another extension, that
> > would realistically only be exposed by llvmpipe, but also every
> > compositor and every client would have to support both extensions.
> > - Similarly, a new wayland protocol would need to be designed to
> > support sync over eventfd.
> > - Eventfd does not support timeline semantics. Meaning that you would
> > have to send two eventfds over the wire for each commit, one for the
> > acquire point and one for the release point. Whereas with syncobj you
> > only need to send two integers per commit.
> >
> > I don't see the advantage when drm_syncobj already does everything we n=
eed.
> >
> > You seem to believe that compositors would not be ready for this and
> > from that perspective I can understand your apprehension. But I can
> > assure you that compositors are already fully set up to support all of
> > the usecases I've described: The wayland protocol requires the
> > compositor to support wait before signal.
> Yeah that's much better than I thought it would be.
>
> And that eventfds don't support timeline points is indeed a pretty good a=
rgument.
>
> But I still don't see much justification for creating a /dev/syncobj devi=
ce, this is clearly something DRM specific.

The justification is given in the cover letter. To repeat them briefly:

1. This series makes the ability to manipulate syncobjs available
independently of attached hardware.
2. It makes it available under a consistent path /dev/syncobj.
3. It removes the need to translate between syncobjs fds and handles.

>
> What about using VGEM for this?

If the vgem render node were made available unconditionally under,
say, /dev/vgem and DRIVER_SYNCOBJ_TIMELINE were added to the driver,
then maybe that could solve points 1 and 2 above.

But it would not solve point 3 and it sounds like a hack to me to have
a render node available outside of /dev/dri.

>
> Regards,
> Christian.
>
> >
> >>
> >> Regards,
> >> Christian.

