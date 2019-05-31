Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7A130F4F
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 15:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfEaNxS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 09:53:18 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44695 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfEaNxR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 09:53:17 -0400
Received: by mail-qt1-f196.google.com with SMTP id x47so871834qtk.11
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 06:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=Q+D0hlDbbJSdE6MMMtU2S5W0S8EECzf+XlFfBswEIbs=;
        b=ZOWJSB9cRKfmqEp0VmfykQWZW7lXZVzcRCLnX0kMg+ZbYzjKuVO3ouIootdQD5bYT5
         q9rBnRG+xhESY5kBEbHbTk2fjj6z2ma5hvlHTSp4ti4TE6EkNdGMUYjuUtFyahKf+udW
         GosGF9T2FXnZairpCS81Jq7X/dYqmBtNCw9iV3EdbtKNphnu4Zh9UkexkIIBYEHRRb3v
         t27XmZ+QsE+FVv0w8PCcCIRlqDYJJ86auxmOZ+9TctaOo2zxFI05ihHw9GkYdvd8SzWT
         bD5x5807NYkdpSklIRIgD24CJbcbBJk+KLrpb9RZ89qWt5/s8LtwU+InGTeuYN0q4Cff
         qzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=Q+D0hlDbbJSdE6MMMtU2S5W0S8EECzf+XlFfBswEIbs=;
        b=TEPp36yIipQNa2uvH0/x6+f8d1jktNSptIJ3jldAooIhUGZPsw9IVACXZm8PHUMw5U
         Yop/EsPfTD/nEUKEySVAPfzxErA+ghSUBZj5+/34KyonK92/MrrFOf60brIW9gVAbqUu
         GegGRcjL94gDaMeF8Ny1lAiiNHE+qGCIiYz5l+Da3EGYdiruJ8ItXeU9NWNpxZQhRqBg
         D5tyZ+j0BREHZVlxBthVDaK6GROuwgqwgL2VDVTWia2DdU+xVcyvhQn7X3MA3rBAIp4Q
         RQ6eApo1O7RZIQu7qygBNo5UcDeKUyBoeZ6yN41GLMmfvQA167/wVDwIm99j5jHgoYuc
         KFZw==
X-Gm-Message-State: APjAAAUEbB5F5BYGA5HOOBJIOt6KFEf9NDLkWmmfQeRW+6q9fHLda3RP
        LLU+yjh3l/KvQietccWnV6tgqA==
X-Google-Smtp-Source: APXvYqzr18Q78FiVgF7Le/xd71YPfsQEitxkkvVP0nk1nTT8kZsZfKNAa0IiE6Q7W1qFkiVSy4GIMQ==
X-Received: by 2002:ac8:265b:: with SMTP id v27mr9494276qtv.29.1559310796398;
        Fri, 31 May 2019 06:53:16 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id m55sm2968551qta.30.2019.05.31.06.53.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 31 May 2019 06:53:14 -0700 (PDT)
Message-ID: <d325988a749b5084471c7f8198f851af58f2ac01.camel@ndufresne.ca>
Subject: Re: [PATCH 10/10] venus: dec: make decoder compliant with stateful
 codec API
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Malathi Gottam <mgottam@codeaurora.org>
Date:   Fri, 31 May 2019 09:53:12 -0400
In-Reply-To: <ee62fdb0-d8fa-0695-9088-5aaef48e485f@linaro.org>
References: <20190117162008.25217-1-stanimir.varbanov@linaro.org>
         <20190117162008.25217-11-stanimir.varbanov@linaro.org>
         <60b3efff-31c1-bc04-8af9-deebb8bc013a@xs4all.nl>
         <fe51ae1e-6d2e-36bd-485a-d85520ad2386@linaro.org>
         <CAAFQd5Co3G1J4+HOcjtCb7p3rhLcm+1E=mPr2d=AtdOSuF_eKg@mail.gmail.com>
         <c56930e0-be6f-2ade-fcea-8ee0ff6247ec@linaro.org>
         <CAAFQd5CNGsnqjpLsWSTf=8r+hSfyOgD8SU-tn5EbHCCuuSgH6A@mail.gmail.com>
         <01b6683f-9378-e6f2-501f-e2213e6c690d@xs4all.nl>
         <CAAFQd5Dw-1A2gXuC54Z7808L6Vm9mjPpE7Kbj-TZC18_k_FgVA@mail.gmail.com>
         <a9b11ba0-adca-f974-67a5-a0fe54689bba@xs4all.nl>
         <CAAFQd5CMpQ4ODyeBPnOv4w9ktqPsiqJtSkpRhAx+XgQ=Lz9crQ@mail.gmail.com>
         <ee62fdb0-d8fa-0695-9088-5aaef48e485f@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-P37kap29/vNh3RaerlJJ"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-P37kap29/vNh3RaerlJJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 31 mai 2019 =C3=A0 11:01 +0300, Stanimir Varbanov a =C3=A9crit =
:
> Hi,
>=20
> On 5/27/19 11:18 AM, Tomasz Figa wrote:
> > On Mon, May 27, 2019 at 4:39 PM Hans Verkuil <hverkuil@xs4all.nl> wrote=
:
> > > On 5/27/19 5:51 AM, Tomasz Figa wrote:
> > > > On Tue, May 21, 2019 at 9:27 PM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
> > > > > On 5/21/19 11:09 AM, Tomasz Figa wrote:
> > > > > > Hi Stan,
> > > > > >=20
> > > > > > On Mon, May 20, 2019 at 11:47 PM Stanimir Varbanov
> > > > > > <stanimir.varbanov@linaro.org> wrote:
> > > > > > > Hi Tomasz,
> > > > > > >=20
> > > > > > > On 4/24/19 3:39 PM, Tomasz Figa wrote:
> > > > > > > > On Wed, Apr 24, 2019 at 9:15 PM Stanimir Varbanov
> > > > > > > > <stanimir.varbanov@linaro.org> wrote:
> > > > > > > > > Hi Hans,
> > > > > > > > >=20
> > > > > > > > > On 2/15/19 3:44 PM, Hans Verkuil wrote:
> > > > > > > > > > Hi Stanimir,
> > > > > > > > > >=20
> > > > > > > > > > I never paid much attention to this patch series since =
others were busy
> > > > > > > > > > discussing it and I had a lot of other things on my pla=
te, but then I heard
> > > > > > > > > > that this patch made G_FMT blocking.
> > > > > > > > >=20
> > > > > > > > > OK, another option could be to block REQBUF(CAPTURE) unti=
l event from hw
> > > > > > > > > is received that the stream is parsed and the resolution =
is correctly
> > > > > > > > > set by application. Just to note that I'd think to this l=
ike a temporal
> > > > > > > > > solution until gstreamer implements v4l events.
> > > > > > > > >=20
> > > > > > > > > Is that looks good to you?
> > > > > > > >=20
> > > > > > > > Hmm, I thought we concluded that gstreamer sets the width a=
nd height
> > > > > > > > in OUTPUT queue before querying the CAPTURE queue and so ma=
king the
> > > > > > > > driver calculate the CAPTURE format based on what's set on =
OUTPUT
> > > > > > > > would work fine. Did I miss something?
> > > > > > >=20
> > > > > > > Nobody is miss something.
> > > > > > >=20
> > > > > > > First some background about how Venus implements stateful cod=
ec API.
> > > > > > >=20
> > > > > > > The Venus firmware can generate two events "sufficient" and
> > > > > > > "insufficient" buffer requirements (this includes decoder out=
put buffer
> > > > > > > size and internal/scratch buffer sizes). Presently I always s=
et minimum
> > > > > > > possible decoder resolution no matter what the user said, and=
 by that
> > > > > > > way I'm sure that "insufficient" event will always be trigger=
ed by the
> > > > > > > firmware (the other reason to take this path is because this =
is the
> > > > > > > least-common-divider for all supported Venus hw/fw versions t=
hus common
> > > > > > > code in the driver). The reconfiguration (during codec Initia=
lization
> > > > > > > sequence) is made from STREAMON(CAPTURE) context. Now, to mak=
e that
> > > > > > > re-configuration happen I need to wait for "insufficient" eve=
nt from
> > > > > > > firmware in order to know the real coded resolution.
> > > > > > >=20
> > > > > > > In the case of gstreamer where v4l2_events support is missing=
 I have to
> > > > > > > block (wait for firmware event) REQBUF(CAPTURE) (vb2::queue_s=
etup) or
> > > > > > > STREAMON(CAPTURE) (vb2::start_streaming).
> > > > > > >=20
> > > > > > > I tried to set the coded resolution to the firmware as-is it =
set by
> > > > > > > gstreamer but then I cannot receive the "sufficient" event fo=
r VP8 and
> > > > > > > VP9 codecs. So I return back to the solution with minimum res=
olution above.
> > > > > > >=20
> > > > > > > I'm open for suggestions.
> > > > > >=20
> > > > > > I think you could still keep setting the minimum size and wait =
for the
> > > > > > "insufficient" event. At the same time, you could speculatively
> > > > > > advertise the expected "sufficient" size on the CAPTURE queue b=
efore
> > > > > > the hardware signals those. Even if you mispredict them, you'll=
 get
> > > > > > the event, update the CAPTURE resolution and send the source ch=
ange
> > > > > > event to the application, which would then give you the correct
> > > > > > buffers. Would that work for you?
> > > > >=20
> > > > > As I understand it this still would require event support, which =
gstreamer
> > > > > doesn't have.
> > > >=20
> > > > I don't think it matches what I remember from the earlier discussio=
n.
> > > > As long as Gstreamer sets the visible resolution (from the containe=
r
> > > > AFAIR) on OUTPUT, the driver would adjust it to something that is
> > > > expected to be the right framebuffer resolution and so Gstreamer wo=
uld
> > > > be able to continue. Of course if the expected value doesn't match,=
 it
> > > > wouldn't work, but it's the same as currently for Coda AFAICT.
> > > >=20
> > > > > I think it is OK to have REQBUFS sleep in this case. However, I w=
ould only
> > > >=20
> > > > Why REQBUFS? While that could possibly allow us to allocate the rig=
ht
> > > > buffers, Gstreamer wouldn't be able to know the right format, becau=
se
> > > > it would query it before REQBUFS, wouldn't it?
> > >=20
> > > Oops, you are right. It's got to be in G_FMT(CAPTURE), but *only* if
> > > nobody subscribed to the SOURCE_CHANGE event.
> > >=20
> > > > For this reason, s5p-mfc makes G_FMT(CAPTURE) blocking and if we
> > > > decide to forcefully keep the compatibility, even with in drivers, =
we
> > > > should probably do the same here.
> > > >=20
> > > > > enable this behavior if the application didn't subscribe to the S=
OURCE_CHANGE
> > > > > event. That's easy enough to check in the driver. And that means =
that if the
> > > > > application is well written, then the driver will behave in a com=
pletely
> > > > > standard way that the compliance test can check.
> > > >=20
> > > > I guess one could have some helpers for this. They would listen to =
the
> > > > source change events internally and block / wake-up appropriate ioc=
tls
> > > > whenever necessary.
> > >=20
> > > I really do not want this for new drivers. gstreamer should be fixed.
> > > A blocking G_FMT is just plain bad. Only those drivers that do this, =
can
> > > still block if nobody subscribed to EVENT_SOURCE_CHANGE.
> >=20
> > Yeah and that's why I just suggested to mimic coda, which doesn't
> > block, but apparently gstreamer still works with it.
>=20
> Unfortunately in Venus case that is not an easy task (as I tried to
> explain why above).
>=20
> To have an unified and common code for all different SoCs and
> firmware/hardware versions I decided to set the minimum supported
> resolution for the decoder (no matter what the user said) and trigger
> the reconfiguration event always. Something more, I need the event also
> to retrieve the minimum capture buffers
> (V4L2_CID_MIN_BUFFERS_FOR_CAPTURE) and sizes for capture and
> internal/scratch buffers as well, thus I really need to wait for that
> event.

And to add to this, CODA driver is special, since it has a third buffer
queue, the queue expose on the CAPTURE device does not need to be
representative of the DPB depth.

>=20
> So, just to confirm - you are fine with blocking G_FMT (not REQBUF) when
> the user doesn't subscribe for v4l2 events?
>=20
> > > > Another question: If we intend this to be implemented in new driver=
s
> > > > too, should it be documented in the spec?
> > >=20
> > > We most certainly do NOT want to implement this in new drivers.
> > >=20
> >=20
> > Makes sense.
> >=20
> > When venus was merged initially, did it already have a blocking G_FMT?
>=20
> No it isn't.
>=20

--=-P37kap29/vNh3RaerlJJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPExyAAKCRBxUwItrAao
HAVSAJsG2ebiNuXTt6PjTUJnhgRKvJbkSgCgyboMNkUR9bblAFC9x2m/orsmYF0=
=/yI/
-----END PGP SIGNATURE-----

--=-P37kap29/vNh3RaerlJJ--

