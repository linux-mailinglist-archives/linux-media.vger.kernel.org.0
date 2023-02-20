Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D45D69C709
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 09:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbjBTIx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 03:53:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjBTIx5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 03:53:57 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F079013;
        Mon, 20 Feb 2023 00:53:51 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id i9so602327lfc.6;
        Mon, 20 Feb 2023 00:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=trdU/6mZ4q/7CXRXpWi9nWU7w+Kvl3oqkNpwnPL/xoY=;
        b=azGbtfYk+TZRcFnh0hwpFLW2w98LQp4ZhJllv0TIkOe7zj8GlJl5S+XpZoTAG4TdBJ
         XHrECHIIuZFxlI0jOGbPIRjLjp29kFnrf8q1QYLHIrRQMDdDVw622BQePfbruj1uInec
         YpnUpDYKU4oBjNs/mswVwX4ydicK6ewSZIxO11or5LYowag9KdyQn3qRlNnJh72UrVjU
         QHFAX1l7Th0hMZXApsOL8Hdfs0GDs8SjifG93E69m2OQDS6XoxzvIVxXxAR3S8TN0tKC
         BmSlEoPkgseU5j5e61AUhgV1etJ/Okhme6ZlLLalSY90UuYasgbWtK59V6AwEaJl/twA
         Nm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=trdU/6mZ4q/7CXRXpWi9nWU7w+Kvl3oqkNpwnPL/xoY=;
        b=UA1yexoo7KqFYAdfRE+nMgG+P4s6V8qoM9TeCpkf0GKX8hM2VtBPQrLzYDVfEbUIjw
         Q7zhOca0/DShQMnsi0GE5RgJ2x4uWXJYOuB5LXaHD1FMBW3Gzrgm7Tk/r6Lwq88KOG8R
         TgfEUetlrRC3Jz/KNPbvAgzI2sSy2sdLByWeyQdiSGj1ZnP8TgtUf1SF6YEi/dhp6vMw
         sMaj+SH4CCBeSa5FsNrqMvjbMyoTZrkQKFk80eUzxRN+Ipq9WuALjnyWTBLiGJZ33jsa
         +0K+VI3mlWeDciTjfe8n9nH0L01Jo5BGiX+FeRzAerLyBTHq2vk2XK8J3sIVMPX55ycD
         2peg==
X-Gm-Message-State: AO0yUKU3x27YqsnFtQBFEBtWHMc4WLcP6YgF1maNkXhvFMQU+fEgzFUE
        OSJZDWA46Ppbf9+SC7LJMUo=
X-Google-Smtp-Source: AK7set+chHdtsONmBxQKyeY3ayi/UIiPA+HEV1eVQ7sK7gsxB+50rZIjxz2VEjts5QnZPfmkKKBw6w==
X-Received: by 2002:ac2:5307:0:b0:4b6:f30c:c7a9 with SMTP id c7-20020ac25307000000b004b6f30cc7a9mr284863lfh.1.1676883229906;
        Mon, 20 Feb 2023 00:53:49 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id f25-20020ac25339000000b004d865c781eesm251470lfh.24.2023.02.20.00.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 00:53:49 -0800 (PST)
Date:   Mon, 20 Feb 2023 10:53:45 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
        Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Simon Ser <contact@emersion.fr>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
Message-ID: <20230220105345.70e46fa5@eldfell>
In-Reply-To: <20230218211608.1630586-7-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
        <20230218211608.1630586-7-robdclark@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wnWeB2/6YYExS1Py=pCZ2ib";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/wnWeB2/6YYExS1Py=pCZ2ib
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 18 Feb 2023 13:15:49 -0800
Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>=20
> Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
> wait (as opposed to a "housekeeping" wait to know when to cleanup after
> some work has completed).  Usermode components of GPU driver stacks
> often poll() on fence fd's to know when it is safe to do things like
> free or reuse a buffer, but they can also poll() on a fence fd when
> waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
> lets the kernel differentiate these two cases.
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Hi,

where would the UAPI documentation of this go?
It seems to be missing.

If a Wayland compositor is polling application fences to know which
client buffer to use in its rendering, should the compositor poll with
PRI or not? If a compositor polls with PRI, then all fences from all
applications would always be PRI. Would that be harmful somehow or
would it be beneficial?


Thanks,
pq

> ---
>  drivers/dma-buf/sync_file.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index fb6ca1032885..c30b2085ee0a 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -192,6 +192,14 @@ static __poll_t sync_file_poll(struct file *file, po=
ll_table *wait)
>  {
>  	struct sync_file *sync_file =3D file->private_data;
> =20
> +	/*
> +	 * The POLLPRI/EPOLLPRI flag can be used to signal that
> +	 * userspace wants the fence to signal ASAP, express this
> +	 * as an immediate deadline.
> +	 */
> +	if (poll_requested_events(wait) & EPOLLPRI)
> +		dma_fence_set_deadline(sync_file->fence, ktime_get());
> +
>  	poll_wait(file, &sync_file->wq, wait);
> =20
>  	if (list_empty(&sync_file->cb.node) &&


--Sig_/wnWeB2/6YYExS1Py=pCZ2ib
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPzNRoACgkQI1/ltBGq
qqe77A//VJjJucK06UFHDO7Zu3DgjaELDyU40vdJCa9iz91ZDSzArZnKxVbTGdBk
yJ+wWbQP/18GcPB49moFu/VY5FZWt8NzAgEGd7phYI7nE9EOoL3yo/8xMMjLAZYS
lDeBsEDYav7xiCr1Y5y4zM3/pp+9RZWN4VIc3eEFNc+DBZojirvB2dNO7g2JC/Gu
gmZWfl6UY83SEUEo9jzf7vBQJ+J7lLcsZ/OoL7l8289AF9CRSKOX/01qNc18nhhT
ZU6P0MoIlJK8CcFMXBvVlo7PkFdayZBELiZUaZb1uBhDCmCcN0jD3rZlYT8knUQ5
051QX7vJ7fHma9vOu729Rbdy+zAg+k/y2H2NZG9HaKknsbObhbv/GLHr8KXvJCP3
oUaxw87cx+tR1+WMhGq7wDUIwj59byxURD4T1ZSrGLvodOEk/BoYEaOKOUeicXfp
XcHhPdOi6mnPr8X34AlZx6PBrcGyHD65NI884dwmkikB1LhMAY9FFOejVje8Gj9a
ImS22N1SI0EvelgP6QNobhyP4AhYz63FQBKOVH3P11AkbvzBov555LsTt0nkxyyF
14jExe1mrErutmQo274Km3nnAjq4yg18/oRqNBM1ntS4KIl0EyqIqOcptPELnyKv
ieAzCXRvgipizQG+wbhAZphPqYtMMpHsSofY8iA0XDSBHQs8O+Y=
=hARr
-----END PGP SIGNATURE-----

--Sig_/wnWeB2/6YYExS1Py=pCZ2ib--
