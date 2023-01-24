Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9091679D5C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 16:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234846AbjAXPYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 10:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234819AbjAXPYj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 10:24:39 -0500
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F021226597
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 07:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1674573876; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LmEbbidIyF1SVkGm3dQMbiDUeW7k1xG4mwczWbLqcpw=;
        b=juDUtH+TxPygPdaCCSUgHJVq7OLlcKZbttIL/Typf22KB5SnL3Pj154XZ9dX3HThSWuQI+
        cY+6QNDMk53Hcthc69YwrXqXkNLOc3NmVEjhPqheQegENiE9pYb9Zai7PZploBR2kqiDrW
        qP/zZfVPlnQprLTDFqLJdNrEyLqZkBU=
Message-ID: <e3d1d835e9be0a4ffa6524f69dd6329f48205619.camel@crapouillou.net>
Subject: Re: RFC: dma_resv_unlock() and ww_acquire_ctx scope
From:   Paul Cercueil <paul@crapouillou.net>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Date:   Tue, 24 Jan 2023 15:24:33 +0000
In-Reply-To: <61349cff-c06c-3958-c1cf-9713e12bc313@amd.com>
References: <730e5a40874c0e5bf66ddcb9fe7b2e4f28e09b1a.camel@crapouillou.net>
         <33c2d360-31f9-da8b-127a-d473029192e6@linux.intel.com>
         <Y8kltaITYoTEl9SQ@phenom.ffwll.local>
         <61349cff-c06c-3958-c1cf-9713e12bc313@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 19 janvier 2023 =C3=A0 12:44 +0100, Christian K=C3=B6nig a =C3=A9c=
rit=C2=A0:
> Am 19.01.23 um 12:12 schrieb Daniel Vetter:
> > On Thu, Jan 19, 2023 at 11:37:39AM +0100, Maarten Lankhorst wrote:
> > > On 2023-01-19 11:24, Paul Cercueil wrote:
> > > > Hi,
> > > >=20
> > > > Just a reflexion I have after an intensive (and intense)
> > > > debugging
> > > > session.
> > > >=20
> > > > I had the following code:
> > > >=20
> > > >=20
> > > > int my_dma_resv_lock(struct dma_buf *dmabuf)
> > > > {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ww_acquire_c=
tx ctx;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ww_acquire_init(&ct=
x, &reservation_ww_class);
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D dma_resv_lo=
ck_interruptible(dmabuf->resv, &ctx);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret !=3D -EDEADLK)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return ret;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D dma_resv_lock_slow_interruptible(dmab=
uf-
> > > > >resv,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ctx);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > > > }
> > > >=20
> > > >=20
> > > > Then I would eventually unlock the dma_resv object in the
> > > > caller
> > > > function. What made me think this was okay, was that the API
> > > > itself
> > > > suggests it's okay - as dma_resv_unlock() does not take the
> > > > "ww_acquire_ctx" object as argument, my assumption was that
> > > > after the
> > > > dma_resv was locked, the variable could go out of scope.
> > > >=20
> > > > I wonder if it would be possible to change the API a little
> > > > bit, so
> > > > that it is less prone to errors like this. Maybe by doing a
> > > > struct copy
> > > > of the initialized ctx into the dma_resv object (if at all
> > > > possible),
> > > > so that the original can actually go out of scope, or maybe
> > > > having
> > > > dma_resv_unlock() take the ww_acquire_ctx as argument, even if
> > > > it is
> > > > not actually used in the function body - just to make it
> > > > obvious that
> > > > it is needed all the way to the point where the dma_resv is
> > > > unlocked.
> > > >=20
> > > > This email doesn't have to result in anything, I just thought
> > > > I'd share
> > > > one point where I feel the API could be made less error-prone.
> > > Hey,
> > >=20
> > > This example code will fail eventually. If you have
> > > DEBUG_LOCK_ALLOC
> > > enabled, a fake lock is inited in ww_acquire_init. If you don't
> > > free it
> > > using ww_acquire_fini(), lockdep will see that you free a live
> > > lock that was
> > > never released. PROVE_LOCKING will also complain that you never
> > > unlocked the
> > > ctx fake lock.
> > >=20
> > > If you do call ww_acquire_fini, you will get a loud complain if
> > > you never
> > > released all locks, because ctx->acquired is non-zero.
>=20
> The problem isn't that dma_resv_unlock() doesn't need the ctx, the=20
> problem is that in this example the ctx object isn't properly cleaned
> up=20
> and used.

Ah, that's a very good point :)

> As long as you only need to grab one lock the ctx should be NULL.
> Only=20
> when you grab multiple locks the ctx is used to make sure that you
> can=20
> detect and handle deadlocks between those different locks.

Understood. I will use NULL then.

Cheers,
-Paul

> So using the ctx correctly also makes the lifetime of that object
> much=20
> more clear since it needs to stay around at least until all locks are
> taken.
>=20
> > >=20
> > > Try with PROVE_LOCKING, your example will receive a lockdep
> > > splat. :)
> > Also CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy any time you change ww code
> > please.
> > Otherwise it's just not fully tested.
>=20
> Yeah, completely agree to both.
>=20
> Christian.
>=20
> > -Daniel
>=20

