Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7B36B2E9B
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 21:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbjCIUYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 15:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjCIUYh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 15:24:37 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D62561A96;
        Thu,  9 Mar 2023 12:24:36 -0800 (PST)
Received: from 2603-8080-2102-63d7-c4a8-7e10-0391-f3ff.res6.spectrum.com (2603-8080-2102-63d7-c4a8-7e10-0391-f3ff.res6.spectrum.com [IPv6:2603:8080:2102:63d7:c4a8:7e10:391:f3ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: gfxstrand)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E34F660301A;
        Thu,  9 Mar 2023 20:24:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1678393474;
        bh=iHVcle3qz6S4204P78xSSiIZLX3fAIlrxoRx24QoWEc=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Rm6Rb5jgc4KgSZ8CIfxw997YRUUmkZyouZw0049no8/knLpJh1cwuNXsK/1sjbIlq
         EV4GUg2aXqjzfFjkkvApU/rKcF1vgyQ1UmLeSCvTlrN1MkR79+4o+E1BMkgIGGCYLh
         /K/hvQHYHoJm8xfVcnW4szl1obTlHP0QloefieBQQYyOFF/uKmLwXQqPYeHqT+44Vl
         qRmbCLyJ7vApu05NcHSu020jX2svAQm3WaPzSQ34yW2qeyQsLNouNRX9l4f3zDxVlz
         XzdOH8rIvgBs+CecGqmP1IQURW8IhD+uxtTOll9MFa+N9QvhSHHNtCeki9Mw7Kx40K
         gVFSwyUGI5Y4g==
Message-ID: <c9e0c6fdcd642192a59a2fea95941a773ea7b3e3.camel@collabora.com>
Subject: Re: [PATCH RFC 01/18] rust: drm: ioctl: Add DRM ioctl abstraction
From:   Faith Ekstrand <faith.ekstrand@collabora.com>
To:     Asahi Lina <lina@asahilina.net>,
        =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Karol Herbst <kherbst@redhat.com>,
        Ella Stanforth <ella@iglunix.org>, Mary <mary@mary.zone>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-sgx@vger.kernel.org,
        asahi@lists.linux.dev
Date:   Thu, 09 Mar 2023 14:24:25 -0600
In-Reply-To: <11ce9291-c17f-e73d-fb5d-13d5386fe6be@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
         <20230307-rust-drm-v1-1-917ff5bc80a8@asahilina.net>
         <D9Cyx-9kbjaeb8QVBFqapDyctoDdVyu5uXEJDR41sdXUDXM1VgdRicV5huJDwfC3-T2J-R_DYHH8JZ1_aRdgbeYZFT78J9QveeeYbiTq4yU=@protonmail.com>
         <11ce9291-c17f-e73d-fb5d-13d5386fe6be@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2023-03-09 at 15:04 +0900, Asahi Lina wrote:
> On 08/03/2023 02.34, Bj=C3=B6rn Roy Baron wrote:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // SAFETY: This is just the ioctl
> > > argument, which hopefully has the right type
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // (we've done our best checking the
> > > size).
> >=20
> > In the rust tree there is the ReadableFromBytes [1] trait which
> > indicates that it is safe to read arbitrary bytes into the type.
> > Maybe you could add it as bound on the argument type when it lands
> > in rust-next? This way you can't end up with for example a struct
> > containing a bool with the byte value 2, which is UB.
>=20
> There's actually a much bigger story here, because that trait isn't
> really very useful without a way to auto-derive it. I need the same
> kind
> of guarantee for all the GPU firmware structs...
>=20
> There's one using only declarative macros [1] and one using proc
> macros
> [2]. And then, since ioctl arguments are declared in C UAPI header
> files, we need a way to be able to derive those traits for them...
> which
> I guess means bindgen changes?

It'd be cool to be able to auto-verify that uAPI structs are all
tightly packed and use the right subset of types.  Maybe not possible
this iteration but it'd be cool to see in future.  I'd like to see it
for C as well, ideally.

~Faith
