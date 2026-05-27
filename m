Return-Path: <linux-media+bounces-62892-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LYSFVbcFmofuAcAu9opvQ
	(envelope-from <linux-media+bounces-62892-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:58:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B0C5E3C04
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BD7A30451CF
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53070401493;
	Wed, 27 May 2026 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFQV38mY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1066129BDB1
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 11:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882858; cv=pass; b=Jw9th6T6ayOr8cVbTSQ/0wwUViUxEdixR3RuJAPKPLl5pKiqu9zw7QzRS7d6n+ceFwNt9YQKsprjV3jRV4fWjuijrMuXsfR0S6B59/4kCHYiWBU3YZwNcHcQtpbcr7CSmBVO/IldOU4p//PAb8oBNZK0QLZKlGTlhj2DQezH59Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882858; c=relaxed/simple;
	bh=r7JV4Qlc/632i94GYxXPKPWstQRLKr2HGMAhVUjmiKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8mEujiKbvPN8umfNqSBilCc8d2Gp/vDPElmEZv/R+AxIoDFv1ZsfEa7uZwm2myzenNuiQjSHNDyaX7KpcmkRrUKuNWNqwAQqmm1IEqJ6jqO2uCOtAFNJcsyiHdia0wCQ6XaEAsajZmoN9988rhAHWBafaUeGpwLPUrlXqmCjjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFQV38mY; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dcdaf06498so7507708a34.2
        for <linux-media@vger.kernel.org>; Wed, 27 May 2026 04:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779882855; cv=none;
        d=google.com; s=arc-20240605;
        b=IBgZv+2H+Bdcdg4SlU2YXOFRwGVNJXTG1vO8ARvZPl+Oq1ZLsU0/1grKPiHIZQMvMm
         zANmViInlFjWZv0Rv1AL/vk23NeTgevE2ietp0HxW2HQS6PQYH170nSyVUiy+p82VyWj
         8ju1UzjYCyJV7HfLPiSg5R6ahJaX2E5PSbnN/wkZsvnIcPffX5XFMGD4sX/OzXqFdW4G
         MA1wF/pNXkTjNpIoGQ+/1RLi1AZnkrQlAqjeZVl38cMxY6OM5GH+rdVfdWahExw1MX6i
         0fnG+VZyz9oqXTNuFBHLnTX9V4tE3+vyQ3qJqxk/Vkpq3RF7J8GWrHGuRE737bgc6KRV
         bXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=;
        fh=GP5zbwGsHIVGgxC1Fihe1L0ZnEh2ifkPL/J4fskmbDU=;
        b=RYtDC3VYwgZwDPZ0P0mra2viNTfsOKIjwglNol71wNtSZhTPc2kiRzm4SKzzjT7QUZ
         oEgPO1I7irc2Uq1SeoQ3uA0RJ2yAN9suXuUY/pbleQooN4tm+wBI4LmXFZSR94W+PvtU
         daMg+0qeu3wLewo3iVK24Z1zrCLmwb2l73i2nEPcplGze8yht4XzAMv4dgordFD7KGDX
         Q836Migr75TVMt/ICncmOWR9osOREQPqstdRQ8/moHGfnJAIh5aJJxrUtMCYGcriAh1N
         T1H4MvPY1QxgEwpp3brU1uM40Ksqv5IgYkCdeX2qXOVQ30pQMPpL51y9VqZ4eUdTRMbH
         t+ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779882855; x=1780487655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=;
        b=AFQV38mYg7Kznofm6ukE2qntxLctnCTEl/73rI6fpknkzW8lPJ3PktusTva+MlvLiA
         Fmc+pm3aItCBZ6MQhcdTtDPTG5RFN1TnH48jGJjVvuWtgtH738qt7kHANBvtVMLOZK3o
         V0DJoez+Xu5R/K4OAkB3ASBQxLGPpcHUd1gcL/LczXhORkVUdVEg8n7qcf37MC2WVk0a
         NyBJqkFDj9A+idtRPxYyk3Jo44Js/DS0GdCapR81EMLQg7mMTdL3nxPcM74XQbCPkX/s
         KjiN941DcR9RaGsCpcpoWdHKR2nlNPd2yFSnnUWmStmjhc+0dB8+4M/2nv5AOcf3OM8K
         Eeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779882855; x=1780487655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=;
        b=i1QK9ZEN8uxYzpwvS9xDXGR8HZqFjv9eKVqmvd7mxLozlQTCwvSEZ76ejl3Iu+cvDJ
         RTvSGk5OjGnrB06OgHTlJBS/CSjQHDqbHO9QJk9ceTlPqg4CGuVQbVLT4bREJJ0+P7jC
         7Xl5owexWaR6iOPBGzHEQWJTCsWi0Dgqreaz/kpHqtVYv0fumBTR/s45Bpar1QEWQ6se
         vdbn6ovB4KRj3U3XJMgh3j0GeCJw6FyOOHR5A7vP/AEWi6mMrroDSPSiWi8evrQ4ZeQk
         xab1v7QE5bXa2/o+UbDRxRINSj1JyYYi9uATFdCiY4fLGg6xHgYzJBIVz/yy56RehZaH
         83mg==
X-Gm-Message-State: AOJu0Yz1lnB4AIYF2DfUh6c1KWIzWB+DDNQokVHYQtnHMx6yinHj7SWN
	GFiJV2tTKqZf0upIx4oRfJUi4Eug+/tKDI/zg+ZnNamFYV9Nan8lSx9+Y1pcWcSOCTFLiTCvs0J
	TR/rD3rSikgJzrgJYR/WJ7LfzwIpNWQo=
X-Gm-Gg: Acq92OGJEzu+tBP0/AA2yDNZCWLjTA5mVbPjatmTHp6qMIzZo8fT1jcZNUWfAPQbMf+
	6mG2YPGJOfCEjGjQKynO2shKrtngoWgXBpKQnt4TcFjqRDN76qHK4G94FVGLml8X0lO20REzLj8
	+A/at9goqtVj11yog1Ppe/wdtJ12cUVE1ET7IxlyMGOPwqGbF+CB1OrFEpntZPifDXnAjnf7Wb7
	M8zmrg4O+cuS0L7jljc3DrF8Vlv1EY4ugqIUyAS48xvV8sG0jOSa9/5wMHJHAPUFeVRnC8yvxOJ
	kutas4eBw23gm7QpoyqweE8sKdA+nTWsLORDZ81Y/Xr9YFHfALCBOVUHvD+i2x6Yh5g=
X-Received: by 2002:a05:6820:4dcc:b0:67e:251a:bd3e with SMTP id
 006d021491bc7-69d7eb50ef8mr12523541eaf.18.1779882855023; Wed, 27 May 2026
 04:54:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-11-paulk@sys-base.io>
 <CAMxPZkiKBFsPA5x6KpBajGqO5xqxD5AOd26j3uwqnQko1VzknQ@mail.gmail.com> <ahakVq7Fv78ODicG@shepard>
In-Reply-To: <ahakVq7Fv78ODicG@shepard>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 27 May 2026 15:23:44 +0330
X-Gm-Features: AVHnY4IBJ2USZh9zewtK1mpREASscLC7umJs8sYSO8dfl7Vqb2mCAkjyaVX__p0
Message-ID: <CAMxPZkjQGFxGeafUhCSn82PnWeRpW3YQ-5ZTZUwE1psTq2hJiw@mail.gmail.com>
Subject: Re: [PATCH 10/16] media: sun6i-csi: Add support for MC-centric format enumeration
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62892-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C8B0C5E3C04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul,

On Wed, May 27, 2026 at 11:29=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Arash,
>
> On Wed 27 May 26, 09:20, arash golgol wrote:
> > On Mon, May 18, 2026 at 2:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-ba=
se.io> wrote:
> > >
> > > Use the dedicated helper to check possible pixelformats against the
> > > provided mbus code in order to support MC-centric format enumeration.
> > >
> > > Note that multiple pixelformats may be returned for a given mbus code=
.
> > >
> > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > ---
> > >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++=
--
> > >  1 file changed, 34 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture=
.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > index a836fa7f081a..409c28621093 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > @@ -773,14 +773,43 @@ static int sun6i_csi_capture_querycap(struct fi=
le *file, void *priv,
> > >  static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
> > >                                       struct v4l2_fmtdesc *fmtdesc)
> > >  {
> > > +       const struct sun6i_csi_capture_format *capture_format;
> > > +       const struct sun6i_csi_bridge_format *bridge_format;
> > > +       u32 mbus_code =3D fmtdesc->mbus_code;
> > >         u32 index =3D fmtdesc->index;
> > > +       unsigned int index_valid =3D 0;
> > > +       unsigned int i;
> > > +
> > > +       /* Video-node-centric enumeration. */
> > > +       if (!mbus_code) {
> > > +               if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > > +                       return -EINVAL;
> > > +
> > > +               fmtdesc->pixelformat =3D
> > > +                       sun6i_csi_capture_formats[index].pixelformat;
> > > +               return 0;
> > > +       }
> > >
> > > -       if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > > +       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> > > +       if (!bridge_format)
> > >                 return -EINVAL;
> > >
> > > -       fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pix=
elformat;
> > > +       for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++)=
 {
> > > +               capture_format =3D &sun6i_csi_capture_formats[i];
> > >
> > > -       return 0;
> > > +               if (!sun6i_csi_capture_format_check(capture_format,
> > > +                                                   bridge_format))
> > > +                       continue;
> > > +
> > > +               if (index_valid =3D=3D index) {
> > > +                       fmtdesc->pixelformat =3D capture_format->pixe=
lformat;
> > > +                       return 0;
> > > +               }
> > > +
> > > +               index_valid++;
> > > +       }
> > > +
> > > +       return -EINVAL;
> > >  }
> > >
> > >  static int sun6i_csi_capture_enum_framesize(struct file *file, void =
*fh,
> > > @@ -1076,7 +1105,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_de=
vice *csi_dev)
> > >
> > >         strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
> > >                 sizeof(video_dev->name));
> > > -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_=
STREAMING;
> > > +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_=
STREAMING |
> > > +                                V4L2_CAP_IO_MC;
> > >         video_dev->vfl_dir =3D VFL_DIR_RX;
> > >         video_dev->release =3D video_device_release_empty;
> > >         video_dev->fops =3D &sun6i_csi_capture_fops;
> > > --
> > > 2.54.0
> > >
> >
> > Tested on a LicheePi Zero Dock (V3s) with the following pipeline:
> >
> > ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture
> >
> > I verified that mbus-code-based format enumeration works correctly
> > from userspace and that the reported capture formats change according
> > to the selected media bus format.
> >
> > I could also successfully start streaming with several of the
> > enumerated capture formats (e.g. YUYV and BA81)
>
> Excellent, thank-you very much for testing this!
>

Happy to help.

> > However, I could not fully validate actual format conversion behavior
> > (e.g. MEDIA_BUS_FMT_YUYV8_2X8 to NV12) because my OV7670 setup
> > currently has non-functional test patterns except for 'shifting-1'
> > mode.
>
> That's fine. I don't think I have tested it recently either.
>
> > Tested-by: Arash Golgol <arash.golgol@gmail.com>
> >
> > PS:
> >
> > While testing this patch I also noticed that
> > VIDIOC_SUBDEV_ENUM_MBUS_CODE reports duplicate entries for:
> >  - MEDIA_BUS_FMT_UYVY8_2X8
> >  - MEDIA_BUS_FMT_UYVY8_1X16
> > on sun6i-csi-bridge.
>
> I just had a look and you are definitely right, the entries are clearly
> duplicates and at the same time all the relevant formats are included, so=
 they
> are not taking the place of another format that was forgotten.
>
> You're welcome to submit a patch to remove these entries if you'd like,
> or I could do it otherwise.
>

Thanks, I'll send a small patch to remove the duplicate mbus format entries=
.

> By the way would you be interested in testing the H.264 encoder support f=
or
> V3/V3s once I send a first version for it? I had written initial support =
for
> it a while ago (did not send it to the list) and now that my work on the =
V4L2
> stateless uAPI has reached a point of usability I will probably try to up=
date
> my rework of the cedrus driver to use it.
>

Yes, I would definitely be interested in testing the H.264 encoder
support on V3s once you post it. I previously did some experiments
with Cedrus on V3s (bootlin, cedrus/h264-encoding branch).

Looking forward to it!

--=20
Regards,
Arash Golgol

