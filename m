Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B95386CC5
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 00:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241953AbhEQWPM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 18:15:12 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:36655 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233512AbhEQWPL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 18:15:11 -0400
X-Greylist: delayed 537 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 May 2021 18:15:10 EDT
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4FkY8L0S1vzyQJ;
        Tue, 18 May 2021 08:04:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1621289095;
        bh=3zQXipN+5rOCvuSWYiWEGaHiIwQkUt3DbG1nZj86/GA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HR05GDKDWir9rgKkNqrsP3gB9XDLsEcqyIvUHVkqm/81SVLRh95UaKWlAzs1Sv6FS
         EdvTZ8ePSqaUgMoCtJCdWuOxNjbJmVGI/qoV1ZtToTpr7LyBtOkCSmwQWJNLB1FxbS
         xNnTzmmQMrtA4DtMnGhNGAiHbbBLeNAGOEU/cyfS97qKdCVfXGRHy5wqGsG6rUZXQw
         YK79e1iKJTXf5ReYrjvWE3sClmplCce00k8aYXkPKYKAgDp44J2EI76SN2V7aApLp+
         J7h8ZC+kEmV6Ye048s2mUco9cIxyfmgfOdrsuXWrSuhKR1oSXX9qdoN0b7AYBFGXb8
         giw94aHB87aDg==
Date:   Tue, 18 May 2021 08:04:42 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
Message-ID: <20210518080442.28080686@elm.ozlabs.ibm.com>
In-Reply-To: <CAKMK7uFsRPod-tAJ8ZrzXM6B_+5VgvRs-U0_TiG75da62cnVnw@mail.gmail.com>
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
        <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
        <YJVijmznt1xnsCxc@phenom.ffwll.local>
        <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
        <CAKMK7uELBbkhFBQoSfvMx+AKnbk-fgbamBm3sC20-dJwMq3Xmg@mail.gmail.com>
        <YJjg3DRnG1RG6VDK@infradead.org>
        <CAKMK7uFsRPod-tAJ8ZrzXM6B_+5VgvRs-U0_TiG75da62cnVnw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aggeSpPGRwf/ibiafiFMPrw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/aggeSpPGRwf/ibiafiFMPrw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, 17 May 2021 17:29:35 +0200 Daniel Vetter <daniel.vetter@ffwll.ch> w=
rote:
>
> On Mon, May 10, 2021 at 9:30 AM Christoph Hellwig <hch@infradead.org> wro=
te:
> >
> > On Mon, May 10, 2021 at 09:16:58AM +0200, Daniel Vetter wrote: =20
> > > > End result: not pulling it, unless somebody can explain to me in sm=
all
> > > > words why I'm wrong and have the mental capacity of a damaged roden=
t. =20
> > >
> > > No rodents I think, just more backstory of how this all fits. tldr;
> > > pin_user_pages is the only safe use of this vb2 userptr thing. =20
> >
> > Yes, which is why I advocate for just ripping the follow_pfn path
> > out entirely.  It could have been used for crazy ad dangerous peer to
> > peer transfers outside of any infrastructure making it safe, or for
> > pre-CMA kernel memory carveouts for lage contiguous memory allocations
> > (which are pretty broken by design as well).  So IMHO the only sensible
> > thing is to remove this cruft entirely, and if it breaks a currently
> > working setup (which I think is unlikely) we'll have to make sure it
> > can work the proper way. =20
>=20
> Since I'm not getting any cozy consenus vibes here on any option I
> think I'll just drop this.
>=20
> Stephen, can you pls drop
>=20
> git://anongit.freedesktop.org/drm/drm topic/iomem-mmap-vs-gup
>=20
> from linux-next? It's not going anywhere. I'll also go ahead and
> delete the branch, to make sure you catch this update :-)

I have dropped this now.  Thanks for letting me know.

--=20
Cheers,
Stephen Rothwell

--Sig_/aggeSpPGRwf/ibiafiFMPrw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCi6HoACgkQAVBC80lX
0GyNzAf+PsJKuLMSyGdrI9Eb1SKOtnkBb4Phs9Z2XAd9Ch2v94oPoiB9Q+2fMR3X
YDjZPndyD/LzF1qIRGWDZLhcf8FBU80ZXRNxTfw+yjoH9wcj+cQl5Nlw/qTdINnZ
FI/aXekpdIFmzXYWl3+6h2RCq/C/+/fl3hIDqRyNgSRWIx+oqk97eSB4WEnynGLB
ng3poVuFFymwD/y9fDhCyEKfwjEDZqu+fiaYS0Jvl+e9nx19iScrMtm9jVmS7F4Y
yHItNAj7wnhP+UqJ4Xs2LoQv+AfX0amYwjVqen/f4mEY5cVwBgMmTiVi/7I9nQVe
5nXKiM/GXzrpZDuYnZelmd+uAsn+Gw==
=3/Jz
-----END PGP SIGNATURE-----

--Sig_/aggeSpPGRwf/ibiafiFMPrw--
