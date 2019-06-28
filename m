Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 860A959DC4
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 16:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfF1Oby (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 10:31:54 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:39424 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfF1Oby (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 10:31:54 -0400
Received: by mail-qk1-f195.google.com with SMTP id i125so4964694qkd.6
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=Uju8gAoL2FSd0BoR2yjK3o7K4quQv4RFLaEwScDClBg=;
        b=MZjUebscuzehbtzLPoCchK24ZvHPRqg0Dg+M5nNFg1PHjVsnaiipZXRRwADO9KMivP
         gKqu130CVmBN+4HGttgftwRlA47gK96rKvD8cuBm4MN3GKGShK+llu3b9f/AsB/XCswY
         VlYBjOjzPCh8tJxxOa7FWtmIj8FCiyXUQTrcBVz0/F1Q2hWefZ8aFfq5JB4v80qB9zyM
         j1nnW181y71R9txmE6RBcGE512mKe0uJrF1Jz9Wqx+7CyN2TMKHw28XLSLm0oe9kKYRN
         eMsWJfpJXZ9jY9qcdMtShWExoHqo5Y2IeNnxpHyHne/lqQY27nglHFrZo02OD+TWtac0
         /apA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=Uju8gAoL2FSd0BoR2yjK3o7K4quQv4RFLaEwScDClBg=;
        b=mkwidYYz4PckRSsS6gHZZngA9hkjLFTs55ij9iQSBKFQVeorae4tvh0l/8lHNaktUn
         uN7Q4t9qvKo92Izp1bvG2ylSzRwyWkCUiCb5WzRyodO0m/hIJQ4/3PnOlwsoL7lbdv1d
         tEQ84RFg3WgGYZ5RFEyA0rE32S2AupSnz4YuYwu0lyNZkWJZ+PIbQYy7LhULfU4Yxlxq
         xbI87+To6Jga9W2t5tzkrkSQp140Xd15cBwA0AYAO43U3Yj+oDv7qGhfQYQRTatAGcnc
         CYQO1nyFnvnCRsFXXrI1OPA0jnJLGXJU0UO6k2XNLQu81NnH+qxIEuLmeF6JrTA5n2+w
         QWOQ==
X-Gm-Message-State: APjAAAVTcYvIoS4/qL1xCGiGUsT5g4hGNX2WQYAg1eUzUxO6TuADd/RW
        oap20f09fggVNn5BfFKLstLEaw==
X-Google-Smtp-Source: APXvYqxKTGW2Go5hPw8aWvdYhpCS5FVsz7IC7uVCxo2hCWeWk3BNhw7CAy+F73STHxlNFRbv9/JoFQ==
X-Received: by 2002:a37:7786:: with SMTP id s128mr8231301qkc.345.1561732313154;
        Fri, 28 Jun 2019 07:31:53 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id w80sm1138593qka.74.2019.06.28.07.31.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 07:31:52 -0700 (PDT)
Message-ID: <18f834cb4885357ce6274115096911d90b9c17ea.camel@ndufresne.ca>
Subject: Re: [PATCH v2 00/11] Venus stateful Codec API
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 28 Jun 2019 10:31:50 -0400
In-Reply-To: <eba506ce-4d63-649a-80e6-efad20125263@xs4all.nl>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
         <9c3399a8-4fc6-3117-10ee-3395cee034da@xs4all.nl>
         <997204c7-c702-868c-9a49-52fefc9ab3d2@linaro.org>
         <eba506ce-4d63-649a-80e6-efad20125263@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-7GNINHKy+QfnqJkWj32i"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-7GNINHKy+QfnqJkWj32i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 28 juin 2019 =C3=A0 16:25 +0200, Hans Verkuil a =C3=A9crit :
> On 6/28/19 4:23 PM, Stanimir Varbanov wrote:
> > Hi Hans,
> >=20
> > On 6/28/19 4:37 PM, Hans Verkuil wrote:
> > > On 6/28/19 2:59 PM, Stanimir Varbanov wrote:
> > > > Hello,
> > > >=20
> > > > Here is v2 of the Venus transition to stateful codec API
> > > > compliance. The v2 can be found at [1].
> > > >=20
> > > > Changes since v1:
> > > >  * codec_state is now enum
> > > >  * dropped IS_OUT and IS_CAP macros and use vb2_start_streaming_cal=
led()
> > > >  * corrected g_fmt and reconfig logic
> > > >  * s/vdec_dst_buffers_done/vdec_cancel_dst_buffers
> > > >  * use v4l2_m2m_ioctl_try_decoder_cmd M2M helper
> > > >  * various fixes to make v4l2-compliance pass the streaming test
> > > >=20
> > > > To test the streaming with --stream-from-hdr v4l2-compliance option=
 I have
> > > > to make the following hack (it is needed because the size of decode=
r input
> > > > buffers (OUTPUT queue) is not enough for the h264 bitstream, i.e th=
e driver
> > > > default resolution is 64x64 but the h264 stream is 320x240):
> > > >=20
> > > > diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4=
l2-compliance/v4l2-test-buffers.cpp
> > > > index c71dcf65b721..dc0fcf20d3e4 100644
> > > > --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > > > @@ -1294,6 +1294,11 @@ int testMmap(struct node *node, unsigned fra=
me_count, enum poll_mode pollmode)
> > > >                                         fmt.s_sizeimage(fmt.g_sizei=
mage(p) * 2, p);
> > > >                         }
> > > >                         fail_on_test(q.create_bufs(node, 1, &fmt));
> > > > +
> > > > +                       for (unsigned p =3D 0; p < fmt.g_num_planes=
(); p++)
> > > > +                               fmt.s_sizeimage(fmt.g_sizeimage(p) =
* 2, p);
> > > > +                       node->s_fmt(fmt);
> > > > +
> > > >                         fail_on_test(q.reqbufs(node, 2));
> > > >                 }
> > > >                 if (v4l_type_is_output(type))
> > >=20
> > > Does the venus driver set sizeimage based on the given output resolut=
ion?
> >=20
> > Yes.
> >=20
> > > E.g. if v4l2-compliance would first set the output resolution to 320x=
240,
> > > is the returned sizeimage value OK in that case?
> >=20
> > Yes.
> >=20
> > Here are few options to me:
> >  - set the correct resolution
> >  - set 0x0 and sizeimage at some arbitrary value (1 or 2MB). Despite if
> > the bitstream is 4K it will not be enough if the bitrate is huge.
> >  - invent some mechanism to trigger reconfiguration on the OUTPUT queue
> > as well (similar to the CAPTURE queue)
> >=20
> > > And this also means that the venus driver requires each buffer to hav=
e
> > > a single compressed frame, right? I.e. it can't be spread over multip=
le
> > > OUTPUT buffers.
> >=20
> > I cannot say for sure but that is how all downstream cases uses it i.e.
> > one compressed frame per input buffer. I wonder if you fill input
> > decoder buffer with many compressed frames in one input decoder buffer
> > how you pass the timestamp for every packet?
> >=20
> > > We really need to let userspace know about such restrictions.
> > >=20
> > > Stanimir, can you list the restrictions of the decoder for the variou=
s
> > > codecs?
> >=20
> > What you mean? Restrictions like "one compressed frame per input buffer=
"?
> >=20
>=20
> Yes :-)

I think I just had the same discussions through some RPi patches
reviews. All the stateless codec drivers we have so far assumes full
frames and some wording iirc specified this in the spec at some point.
That removes ambiguity for timestamps application. Even though,
timestamps in V4L2 are useless for B-Frame enabled streams (ffmpeg and
GStreamer will ignore them).

Nicolas

--=-7GNINHKy+QfnqJkWj32i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXRYk1gAKCRBxUwItrAao
HEd7AJoD6UTL2Ch2lIuU3By7HzfYUqaOmgCgu6kMeEhOmohXcnAqEsjr9N8otzU=
=y1YL
-----END PGP SIGNATURE-----

--=-7GNINHKy+QfnqJkWj32i--

