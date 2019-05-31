Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA4A31163
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 17:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfEaPeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 11:34:25 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41805 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfEaPeZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 11:34:25 -0400
Received: by mail-qk1-f195.google.com with SMTP id m18so6540194qki.8
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=bH+BZZJ2UtnoTzMFDMSETIGhgr+4WEBNZCo0dEz0Xj8=;
        b=vwiWYzmJ6gf/VXe55shtFsdqvQi5sfjphj0LB+Wxx8UUGjls+EA3L0PxB/ia2l02E5
         yjSbfyUYjNgaHK5I5Z4E+R6iV6oDEHQEDbH6fWjSmBC2Hr8kYxQxsRtKFKZQM5CAM8Nx
         ihRB4hj1V7Sw5Dj8zCX7SiLFbsDmzXYTXdIE23WMlJEas9Se4iPDtQ+vytRBiv0Q12fv
         jxl2MUum9a96TDl66mEdCXMlATMwR/RAxqdE9rM4YNSBB5SLahxeemk0WzRSWodwK3a2
         rYp10DcNkT/H0SMZEn34OwtTAhdIU9RQACGwk1UU4wHUf+rK42lkuJpPQC0feaRj9WXa
         itYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=bH+BZZJ2UtnoTzMFDMSETIGhgr+4WEBNZCo0dEz0Xj8=;
        b=VJFlB57jHG3IzxCmJvBvsGC5IjJGGu3B+bu3u7PA9f/CIPSpx1FD5n1PiJX9HtFvvK
         rns279mWhgpK6IlxGTp7TFnwSiPTUPJET3irilWP9FKEdalcdLRs81gwxBmU+v/cdzuD
         YJ6EABpUdXbVW/tT9xW4ajQhvmXiL/mVBlLiUVj4L6rlMPbYh+rfFb65oRZVnk2ApufH
         s9KsQMsfpTwQOqpd4DuOCpePh2TUImNwUD8Yt3Q6OTUbAeSU3ysTyqsKRmyBBbiTdLaS
         TR3tnF40lw28foIeYDERXzU/vNgIKBStMmED4TKvF2Z03PtA0eLNisKUON+wD2Lphu99
         ZHdA==
X-Gm-Message-State: APjAAAU3rlgAZ/EdOZjqr4WV1XcLHfx4ZFDuouDdpZGF7lMpBR7ZOela
        V9aISTzdip8Orqa1P4TuupRd2ql4cwc=
X-Google-Smtp-Source: APXvYqw8jlvw5kZUWmot7r0k6SkIkUb1cJ0l750mKWxaObain+ZnK8bS8r7UhelZzQ5/E5eLQ+rr4g==
X-Received: by 2002:a37:4ad2:: with SMTP id x201mr9008861qka.317.1559316864350;
        Fri, 31 May 2019 08:34:24 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id u185sm3749967qkf.67.2019.05.31.08.34.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 31 May 2019 08:34:21 -0700 (PDT)
Message-ID: <e16e87bfdeee242a1dfb8c62b6f1528b346c3a99.camel@ndufresne.ca>
Subject: Re: [v8] media: imx: add mem2mem device
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Sven Van Asbroeck <thesven73@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 31 May 2019 11:34:19 -0400
In-Reply-To: <fa48a38ee8e370c195a872ba302f70329d52dca5.camel@ndufresne.ca>
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
         <20190529154431.11177-1-TheSven73@gmail.com>
         <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
         <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
         <fa48a38ee8e370c195a872ba302f70329d52dca5.camel@ndufresne.ca>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-dzN1vv7G3VLk4umtVXad"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-dzN1vv7G3VLk4umtVXad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 29 mai 2019 =C3=A0 19:52 -0400, Nicolas Dufresne a =C3=A9crit :
> Le mercredi 29 mai 2019 =C3=A0 16:55 -0400, Sven Van Asbroeck a =C3=A9cri=
t :
> > Philipp and Fabio,
> >=20
> > On Wed, May 29, 2019 at 12:53 PM Fabio Estevam <festevam@gmail.com> wro=
te:
> > > Does this patch from Philipp fix the problem?
> > > https://git.pengutronix.de/cgit/pza/linux/commit/?h=3Dimx-drm/fixes&i=
d=3D137caa702f2308f7ef03876e164b0d0f3300712a
> >=20
> > I am now running 5.2-rc2 with Philipp's non-plus imx6q patch.
> >=20
> > Performance is still much worse than the Freescale baseline.
> >=20
> > I am not at all worried about vpu scaler performance, after all v8 is a=
n
> > in-progress patch.
> >=20
> > I am much more concerned about the CODA h264 slowdown. My 1080p30 test
> > video runs at half the speed compared to the Freescale kernel. The best=
 it
> > can do is 28fps, which results in visible 'jerks' in the video. Note th=
at
> > this is without using the scaler.
> >=20
> > Questions:
> > - is the performance slowdown a known issue?
> > - is there anything I've missed in the gstreamer pipelines below?
> > - is there anything I can do to help?
> >=20
> > A) mainline 5.2-rc2 with Philipp's latest non-plus patch:
> > $ time gst-launch-1.0 filesrc
> > location=3D/home/default/jellyfish-10-mbps-hd-h264.mkv ! matroskademux =
!
> > h264parse ! v4l2h264dec ! kmssink can-scale=3D0 sync=3D0
> > real 0m 32.01s
>=20
> kmssink element still have some issues as it renders using the legacy
> KMS API and makes an synchronous vblank wait before returning. In many
> cases, the proper workaround is to do:
>=20
>   ... ! v4l2h264dec ! queue ! kmssink can-scale=3D0 sync=3D0
>=20
> In order to measure the decoding performance without having the display
> being involved you can also do:
>=20
>   ... ! v4l2h264dec ! fpsdisplaysink text-overlay=3D0 video-sink=3Dfakevi=
deosink sync=3D0 -v
>=20
> In order to benefit from the best of this driver, you should also use
> the latest GStreamer 1.16.0. It contains latest fixes from Philipp and
> I, including some performance improvement.

So I have done more tests with kmssink, and noticed a large drop in
performance too. As I suspected, it's related to unreported latency (as
this is not live, it's in fact processing-deadline). What I did to test
this (this is stock 1.16.0, with the plugins-base-tools installed).

GST_TRACERS=3D"latency(flags=3Delement+reported)" GST_DEBUG=3D"GST_TRACER:7=
" gst-launch-1.0 filesrc location=3DVideos/jellyfish-10-mbps-hd-h264.mkv ! =
parsebin ! v4l2h264dec ! queue max-size-bytes=3D0 ! fpsdisplaysink text-ove=
rlay=3D0 video-sink=3D"kmssink can-scale=3D0" 2> gst.log
gst-stats-1.0 gst.log

Which yield this (filtered the output):
Element Latency Statistics:
	0xf281c8.v4l2h264dec0.src: mean=3D338373215 min=3D83527400 max=3D424823314

Element Reported Latency:
	0xf281c8.v4l2h264dec0: min=3D0 max=3D0 ts=3D0:00:01.786671738

So the decoder reports no latency, which is not a problem for offline
playback, but has a 338 ms average latency (with variation from 83 to
424 ms). I think when that latency (this is the processing latency)
goes up, QoS events are sent by the sink to the decoder which will do
early skips in order to ensure a swift catch up, but also to skip any
other processing in the case there would be some converter between the
decoder and the sink. But it seems the skip algo is too agressive and
makes things worst. I'll work on that. Meanwhile, you can workaround
with:

  ... ! kmssink can-scale=3D0 qos=3D0

Now, if that pipeline was live, this would be a problem. For other
decoders, we use V4L2_CID_MIN_BUFFERS_FOR_CAPTURE as the decoder
latency in frames. That usually represent the DPB depth, but CODA
capture queue is not actually the frames we are decoding to, but a pool
of frames we convert into. I think to make CODA really usable for live
playback with high depth DPB, we'll need a new control that expose this
latency. Exposing it through this one would make userspace allocate too
many buffers for now reason.

>=20
> > B) Freescale kernel:
> > $ time gst-launch-0.10 filesrc
> > location=3D/home/default/jellyfish-10-mbps-hd-h264.mkv ! decodebin !
> > mfw_v4lsink sync=3D0
> > Running time 0:00:14.781129554 render fps 59.941

--=-dzN1vv7G3VLk4umtVXad
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPFJfAAKCRBxUwItrAao
HPYCAJ0YPncyes3LlDVmxL+ceZEz9/mhpACeJBBTrnicad8yKeJiE84LbNumNyY=
=l56k
-----END PGP SIGNATURE-----

--=-dzN1vv7G3VLk4umtVXad--

