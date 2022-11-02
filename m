Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C35616308
	for <lists+linux-media@lfdr.de>; Wed,  2 Nov 2022 13:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbiKBMuo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Nov 2022 08:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbiKBMun (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Nov 2022 08:50:43 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABA2140B0
        for <linux-media@vger.kernel.org>; Wed,  2 Nov 2022 05:50:41 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g12so28089290lfh.3
        for <linux-media@vger.kernel.org>; Wed, 02 Nov 2022 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n+S578bZxz2KcommcqJrY31qfDvwV5Xe3fXepG3Q5nQ=;
        b=lwmsWbnBjj6ItrnYJyQhF59gtMtcsv4sg6n3ptSCmdIXC5oIm46q09bnckTaETBGHl
         cr49Xd6S3sSZmvBkxCaNsO8Ff3GsihDwcR4GglKs3ByiRLmhVIW14lyjY9X1MQRPnE8b
         MrbTuK+/z0bVKashGzCxDraaDM5xyr7CI0uFN9UOgdkCeGBS9duUb9awS0QYBy6zfBDX
         3x26pOmkxIhkLo+SiodrGDoVpqB/vggYqag8xntvglOGNzqGLQ/mzcL72KWCij7M277M
         Fsy6rjDfPuuv7h28iT1xcNR3SZSO/HgZlhO5kqrf/CKikGuwqPbaU3qZDyw8Ep5576nI
         f0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+S578bZxz2KcommcqJrY31qfDvwV5Xe3fXepG3Q5nQ=;
        b=7wIWXFnQigPweQIbekVh936InKxT79GDUc60IJslnbFf3ZUR1cOPait9In5ygX6ESc
         wJ3k6jWlEhL4Pb9HGV07DXpL2g7TdT3oE/njgsVWzPQdPNhdyTxqGtvxEyYjW08gsM3Z
         6hKX3t+w9WbCl0sDkE69LrfS6y64MWxWqcfQC2navP81XJ0//V//Pl2JR93WGHg9xVEY
         9xG4dn0BpAyQrrNSPkq0tba6w9F4YJQAS3bjEYleF9Ltqa4SWLBAwMZFxsn2himCSUW+
         P2Hk44yfz3I9vaPsoF8evW+BgrJ/Q1/dbysksEdoVC5kcbMl0jgHQRVueyFP6YRlpplN
         7Lkw==
X-Gm-Message-State: ACrzQf0n12V1qePAat08/VZQv9fbdUuGhEMEUlFm4LXWCz5dVyL1Zzaf
        gFOdVyjelIqZZsdXwCdvW9I=
X-Google-Smtp-Source: AMsMyM5bAQWWdC7A5xnHxVhke5uPQGK5MBDVpNQ0iOLOSSOPcu+6wIV3uj1eYQRZLjMri4oPKxX+6A==
X-Received: by 2002:ac2:4c46:0:b0:4a2:5e0c:d03c with SMTP id o6-20020ac24c46000000b004a25e0cd03cmr8776005lfk.607.1667393439277;
        Wed, 02 Nov 2022 05:50:39 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id m2-20020a056512358200b004acff58a951sm2006697lfr.133.2022.11.02.05.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 05:50:39 -0700 (PDT)
Date:   Wed, 2 Nov 2022 14:50:36 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Stone <daniel@fooishbar.org>,
        Lucas Stach <l.stach@pengutronix.de>, sumit.semwal@linaro.org,
        daniel@ffwll.ch, robdclark@gmail.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: Re: Try to address the DMA-buf coherency problem
Message-ID: <20221102145036.30c70134@eldfell>
In-Reply-To: <cc470b3d-a611-044f-2b35-cc827c962f9b@gmail.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
        <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
        <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
        <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
        <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
        <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
        <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
        <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
        <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
        <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
        <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
        <20221102141954.7d362068@eldfell>
        <cc470b3d-a611-044f-2b35-cc827c962f9b@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/brihWUWYCZRWXADe2oqnIE7";
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

--Sig_/brihWUWYCZRWXADe2oqnIE7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Nov 2022 13:27:18 +0100
Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:

> Am 02.11.22 um 13:19 schrieb Pekka Paalanen:
> > On Wed, 2 Nov 2022 12:18:01 +0100
> > Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:
> > =20
> >> Am 01.11.22 um 22:09 schrieb Nicolas Dufresne: =20
> >>> [SNIP] =20
> >>>>> But the client is just a video player. It doesn't understand how to
> >>>>> allocate BOs for Panfrost or AMD or etnaviv. So without a universal
> >>>>> allocator (again ...), 'just allocate on the GPU' isn't a useful
> >>>>> response to the client. =20
> >>>> Well exactly that's the point I'm raising: The client *must* underst=
and
> >>>> that!
> >>>>
> >>>> See we need to be able to handle all restrictions here, coherency of=
 the
> >>>> data is just one of them.
> >>>>
> >>>> For example the much more important question is the location of the =
data
> >>>> and for this allocating from the V4L2 device is in most cases just n=
ot
> >>>> going to fly. =20
> >>> It feels like this is a generic statement and there is no reason it c=
ould not be
> >>> the other way around. =20
> >> And exactly that's my point. You always need to look at both ways to
> >> share the buffer and can't assume that one will always work.
> >>
> >> As far as I can see it you guys just allocate a buffer from a V4L2
> >> device, fill it with data and send it to Wayland for displaying.
> >>
> >> To be honest I'm really surprised that the Wayland guys hasn't pushed
> >> back on this practice already. =20
> > What should we Wayland people be pushing back on exactly? And where is
> > our authority and opportunity to do so?
> >
> > The Wayland protocol dmabuf extension allows a graceful failure if the
> > Wayland compositor cannot use the given dmabuf at all, giving the
> > client an opportunity to try something else. =20
>=20
> That's exactly what I meant with pushing back :)
>=20
> I wasn't aware that this handling is already implemented.

Well... it's "optional". The Wayland dmabuf protocol has two cases for
a client/app:

a) you do the right thing and wait for the compositor to ack that the
   dmabuf works (the reply should come pretty much immediately, not
   needing the compositor to actually composite), or

b) you just send the dmabuf and continue as if it always worked. If it
   doesn't, you might get a protocol error later and be disconnected.

Guess which one Mesa uses?

I've been told Mesa has no way to handle a failure there, so it
doesn't. I would not be surprised if others just copy that behaviour.

I recall personally being against adding option b) to begin with, but
there it is, added for Mesa IIRC.


> > The Wayland protocol also
> > tells clients which DRM rendering device at minimum the dmabuf needs to
> > be compatible with. It even tells which KMS device the dmabuf could be
> > put on direct scanout if the dmabuf was suitable for that and direct
> > scanout is otherwise possible. =20
>=20
> Yeah, perfect. Exactly that's what's needed here.
>=20
> > What the client (application) does with all that information is up to
> > the client. That code is not part of Wayland.
> >
> > I'm sure we would be happy to add protocol for anything that
> > https://github.com/cubanismo/allocator needs to become the universal
> > optimal buffer allocator library. =20
>=20
>  From what you wrote it's already perfectly covered.

Cool. Now if clients would just use it...


Thanks,
pq

> >> This only works because the Wayland as well as X display pipeline is
> >> smart enough to insert an extra copy when it find that an imported
> >> buffer can't be used as a framebuffer directly. =20
> > The only fallback Wayland compositors tend to do is use OpenGL/Vulkan
> > rendering for composition if direct scanout on a KMS plane does not
> > work. There are many reasons why direct scanout may not be possible in
> > addition to hardware and drivers not agreeing to do it with the given
> > set of buffers.
> >
> > A general purpose (read: desktop) Wayland compositor simply cannot live
> > without being able to fall back from KMS composition to software/GPU
> > composition.
> >
> > But yes, there are use cases where that fallback is as good as failing
> > completely. Those are not desktops but more like set-top-boxes and TVs.=
 =20
>=20
> Completely agree to this approach.
>=20
> The only problem is that media players tend to not implement a way to=20
> allow direct scanout because of those fallback paths.
>=20
> But as you said that's their decision.
>=20
> Thanks,
> Christian.
>=20
> >
> >
> > Thanks,
> > pq =20
>=20


--Sig_/brihWUWYCZRWXADe2oqnIE7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmNiZ5wACgkQI1/ltBGq
qqepyA/9GV9P033rXPCFrilvhhuN6shjhxVt6YoTMEwhVB+CLWe7HdpIev6TY58S
QwGy3o+42LXeMy/JvbQZuGJSi/EmlaMAXwACcp86v2iDgW3w19yolbYU6D/OqhUJ
7WgeRkn7ecdc3io+UTr8z8nsBCBjJYZvd/0WRmtiLbPm4KUR5f+Mja9BBh7XNoOh
6ddhKTuvI+zPL+EnCahyuosaesBgApVq+wxThaG457dLMF1j8GgsOhGDpIKpLvGm
CJ/BhpVLJW4+neDP0qDwWjYks2Pze/9fW+K64J7qyDv2CYa2CxqIV1v2mcU0wRFs
5wwKDNNpQfpPcZtiGPUuqn39TgNWRj8TGk4DAglC33MY5FN3a+Aj7y6ljpzVGAFR
df59hBlaPajNOtJxajiFZjcHWU+sKvSV21yYQZRH+8v+eC/2Z3oJToY8P/8fAaWe
mkcTaECcpN/cHs/bIRo7lCVVwat/vaCJ5eoLgigASgH+Jjl0wAEXXRTUTciiT2Ju
qlbpmNVHTMEtNfN4stlQoo7eGePT8zKOb4Tg6Ln+97pTB5PTH+kdDFu9mR8uF6qm
ctpNYXrjwtvGVPYesun1lC1l57suM/RUsxYIxMgpCHedGhplb+th0j3C2XaMcWN4
RDFbglgw/rAcblzV2xrlLSH7+OWRasM8L8lMGrCRlJqZkQdyiPM=
=kAMo
-----END PGP SIGNATURE-----

--Sig_/brihWUWYCZRWXADe2oqnIE7--
