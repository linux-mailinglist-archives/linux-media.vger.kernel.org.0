Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 427F75EA08
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 19:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfGCRHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 13:07:38 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46929 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfGCRHi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 13:07:38 -0400
Received: by mail-qt1-f193.google.com with SMTP id h21so2283534qtn.13
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=iDFeFMyT2U7JQmce0VUJLeDvLUOySf0ELUoe2q9TOhY=;
        b=WK1LTosJfDKwwIrJLaNLGi1PA5EhRaBD+WQuzXg8rfDSAf7xjQRs7cHW9igpOAG9/9
         +RKIX/h3ZoUMLfQbkhD6S4qrntlz1gzUw56mdWC2I64VPAsmld0qtFfd07gv4eHuzD5k
         Luewx4VQiZEFQ+SAwdEreWovzqqoIpo5/aEXC5yezjhwK1ThkMVPuiUiF4S7zEqO8rcw
         2+C5TO7iNikn7hB5I3ToYVn2q8U7EIWMxjFDjeF3md8USVQwY4C56fjqk0m+OBM4gjiN
         fP0aEr6J4Kr4SGQKSl0qnJaKpSJSG9PpPmJKCH+GTKwAvju+0NABu4N5HqOmElu8QhBQ
         Lq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=iDFeFMyT2U7JQmce0VUJLeDvLUOySf0ELUoe2q9TOhY=;
        b=SAyXDsz0cBApI8eVz6cDDlSz7aAcwskldAn019zVpsingPYJqvotZMMb0iCT9QoHd9
         W99qXshPSB16pZYvsD+x8tVvx2AdwMpzQDg4AEP06nQxc7pKVFTmLPuULCLyijN8vi5R
         yz0g72LxLuXf5PY6Muy5o32K6YnYR0lnKluiG4VdQ+DqombjBDt8i64RrO+4fHY0HL2L
         HnaPOss56kHMUhnp01h4bN6pP6EZbOFBXLsq3LWlpdkolFryexSXKIKClkTZUQyri5+c
         MNXfOXYlCPxXRwAx/UbMsiKkuMJA0Ce1CttdqTlf/CKR9p2Qzs/EDW3nJDzT+SIvXag+
         DiHg==
X-Gm-Message-State: APjAAAVDQHlFEhNHl5nj1Vkhi8ypHTzbBylCQCCrIknHKQf08mkig8z1
        w6a3tnTWDve9W5ETGwUJMfnWtQ==
X-Google-Smtp-Source: APXvYqxnXmlq2XfogmijD7TtlQbONsZgaV0EFWmc8VsIoskHbtJQwpEWfiSLUO38Og7TutdVW4HZjA==
X-Received: by 2002:ac8:689a:: with SMTP id m26mr31563036qtq.192.1562173657048;
        Wed, 03 Jul 2019 10:07:37 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id w19sm1034941qkj.66.2019.07.03.10.07.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 10:07:35 -0700 (PDT)
Message-ID: <ab95840aebab924f1326be99563f7db5dea3767a.camel@ndufresne.ca>
Subject: Re: [PATCHv4 0/2] Document memory-to-memory video codec interfaces
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
Date:   Wed, 03 Jul 2019 13:07:33 -0400
In-Reply-To: <CAAFQd5A0gg4RCKkPd-m2_5=ZyDzZ7hnH9AnTrt7ciXQPPHZU2Q@mail.gmail.com>
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
         <1cb8cc0c89f0017962226fdb84ae11e763fdd233.camel@ndufresne.ca>
         <CAAFQd5A0gg4RCKkPd-m2_5=ZyDzZ7hnH9AnTrt7ciXQPPHZU2Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-dfbemp9bAxOuHi8Q1srM"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-dfbemp9bAxOuHi8Q1srM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 juillet 2019 =C3=A0 18:04 +0900, Tomasz Figa a =C3=A9crit :
> On Wed, Jun 5, 2019 at 12:19 AM Nicolas Dufresne <nicolas@ndufresne.ca> w=
rote:
> > Le lundi 03 juin 2019 =C3=A0 13:28 +0200, Hans Verkuil a =C3=A9crit :
> > > Since Thomasz was very busy with other things, I've taken over this
> > > patch series. This v4 includes his draft changes and additional chang=
es
> > > from me.
> > >=20
> > > This series attempts to add the documentation of what was discussed
> > > during Media Workshops at LinuxCon Europe 2012 in Barcelona and then
> > > later Embedded Linux Conference Europe 2014 in D=C3=BCsseldorf and th=
en
> > > eventually written down by Pawel Osciak and tweaked a bit by Chrome O=
S
> > > video team (but mostly in a cosmetic way or making the document more
> > > precise), during the several years of Chrome OS using the APIs in
> > > production.
> > >=20
> > > Note that most, if not all, of the API is already implemented in
> > > existing mainline drivers, such as s5p-mfc or mtk-vcodec. Intention o=
f
> > > this series is just to formalize what we already have.
> > >=20
> > > Thanks everyone for the huge amount of useful comments to previous
> > > versions of this series. Much of the credits should go to Pawel Oscia=
k
> > > too, for writing most of the original text of the initial RFC.
> > >=20
> > > This v4 incorporates all known comments (let me know if I missed
> > > something!) and should be complete for the decoder.
> > >=20
> > > For the encoder there are two remaining TODOs for the API:
> > >=20
> > > 1) Setting the frame rate so bitrate control can make sense, since
> > >    they need to know this information.
> > >=20
> > >    Suggested solution: require support for ENUM_FRAMEINTERVALS for th=
e
> > >    coded pixelformats and S_PARM(OUTPUT). Open question: some drivers
> > >    (mediatek, hva, coda) require S_PARM(OUTPUT), some (venus) allow b=
oth
> > >    S_PARM(CAPTURE) and S_PARM(OUTPUT). I am inclined to allow both si=
nce
> > >    this is not a CAPTURE vs OUTPUT thing, it is global to both queues=
.
> >=20
> > I agree, as long as it's documented. I can imagine how this could be
> > confusing for new users.
> >=20
> > > 2) Interactions between OUTPUT and CAPTURE formats.
> > >=20
> > >    The main problem is what to do if the capture sizeimage is too sma=
ll
> > >    for the OUTPUT resolution when streaming starts.
> > >=20
> > >    Proposal: width and height of S_FMT(OUTPUT) are used to
> > >    calculate a minimum sizeimage (app may request more). This is
> > >    driver-specific.
> > >=20
> > >    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
> > >    for the encoder (i.e. we don't support mid-stream resolution
> > >    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
> > >    supported. See https://patchwork.linuxtv.org/patch/56478/ for
> > >    the patch adding this flag.
> > >=20
> > >    Of course, if we start to support mid-stream resolution
> > >    changes (or other changes that require a source change event),
> > >    then this flag should be dropped by the encoder driver and
> > >    documentation on how to handle the source change event should
> > >    be documented in the encoder spec. I prefer to postpone this
> > >    until we have an encoder than can actually do mid-stream
> > >    resolution changes.
> > >=20
> > >    If sizeimage of the OUTPUT is too small for the CAPTURE
> > >    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
> > >    then the second STREAMON (either CAPTURE or OUTPUT) will
> > >    return -ENOMEM since there is not enough memory to do the
> > >    encode.
> >=20
> > You seem confident that we will know immediately if it's too small. But
> > what I remember is that HW has an interrupt for this, allowing
> > userspace to allocate a larger buffer and resume.
> >=20
> > Should we make the capture queue independent of the streaming state, so
> > that we can streamoff/reqbufs/.../streamon to resume from an ENOMEM
> > error ? And shouldn't ENOMEM be returned by the following capture DQBUF
> > when such an interrupt is raised ?
> >=20
>=20
> The idea was that stopping the CAPTURE queue would reset the encoder,
> i.e. start encoding a new, independent stream after the streaming
> starts again. Still, given that one would normally need to reallocate
> the buffers on some significant stream parameter change, that would
> normally require emitting all the relevant headers anyway, so it
> probably doesn't break anything?

The capture buffer size is a prediction, so even without any parameters
changes, the size could become insufficient. On the other hand, we have
managed to predict quite well so far in many applications.

Note, I didn't remember that encoder CAPTURE queue streamoff was the
one triggering the reset. In GStreamer, I always streamoff both, so I
never had to think about this. One thing is clear though, it will be
really hard to extend later with this hard relationship between
allocation, streaming state and encoder state. I'm sure we can survive
this, there is probably plenty of workaround, including spreading
encoded data across multiple buffer as Hans suggested.

>=20
> Best regards,
> Tomasz

--=-dfbemp9bAxOuHi8Q1srM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXRzg1QAKCRBxUwItrAao
HMraAKC88zEuzXd6pu0fMQkMWBE3oSD3KACgt2V2wZKA8sgVtLy3w7QAvAa1Ilo=
=8xgV
-----END PGP SIGNATURE-----

--=-dfbemp9bAxOuHi8Q1srM--

