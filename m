Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3AF20E3A
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 19:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbfEPRvX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 13:51:23 -0400
Received: from mail-qk1-f181.google.com ([209.85.222.181]:41465 "EHLO
        mail-qk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfEPRvX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 13:51:23 -0400
Received: by mail-qk1-f181.google.com with SMTP id g190so2801991qkf.8
        for <linux-media@vger.kernel.org>; Thu, 16 May 2019 10:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=TN70BBoKyj2vT/fFVG6syQpG39FsxxM9NqlpBOLPJiE=;
        b=tjMmAVjqJgHrd+A8b7OT4rB9IFZmZqYVGi+Wdz8cEIKky/SJDNWfhcEccF/NDxUY5Q
         HatMs8wztxGqm2ZgCUFplN9Rstmt8+cjf5oXP4eGX3vrHHmhjh/r05L5W78cgtNPyYI5
         LcwknSdX0LpxGBtBjlxgMVx7DZPH+GFA991XZBTZESGWcJmQAeiYjQP6cgeWuI3go2Kf
         wnvZNC2Utun+5kHPDo/iF7QF7EOYpr4f8iS+Cn+mDk7+GIigpdNB2cb8lPXvtD/6boT8
         m+Br8caEi5giU+0vAS8kHgwrL0f9eRqGIafe8mIGJd4CZHSVGna2mlvb56FNUwH7C2z+
         koog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=TN70BBoKyj2vT/fFVG6syQpG39FsxxM9NqlpBOLPJiE=;
        b=p7Zd5p9/MG/E620r2BGkAqRBhraDsvD6Ssqrlcq6AnqO1GuGrX0G9YMtfvIg4wbt1F
         tAtt/e/GXJjJTz1BvJ/B4vKNP4SjkPviHhl/jjqfcsvBqAJiQo3FBIcnNz+uinNHaF1Q
         b3PSDQGZ2SF5D7ZJHHwP1ofo+B9iazoPSHqAl+Xbi9If+pazBgKqD7BaexpCiSxBy1ho
         emKss8BO1+8dZdoyx7lHq2o2DGpTolMkZ0H9CWMAmDYkOpi8IKu1GKlIhTY1o5svld8k
         i1iNLqUVmojr7RFIfHWGh1ZHu9+pHCArgUzlJ1xd7vxqCzZdQqfF08yKav9LDLujgZMK
         FDag==
X-Gm-Message-State: APjAAAVh6uXDi/uX3amQ1jXPwT4J20Jios+zGNB+Q1TCk5rBaRI1qbM7
        efkgJG7XtjSt4HqVzNOk9unA7w==
X-Google-Smtp-Source: APXvYqyjIbP1NjlI1Ky7gSfZTESsowEjiaUDXBrapeOvoIBoR+5PRC+/0GbiNOuGq7mKah7AFi/Twg==
X-Received: by 2002:a05:620a:1108:: with SMTP id o8mr19841918qkk.126.1558029082090;
        Thu, 16 May 2019 10:51:22 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id q27sm4274356qtf.27.2019.05.16.10.51.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 16 May 2019 10:51:20 -0700 (PDT)
Message-ID: <ce6fc96774337a051840a5c8dbae241a488937dd.camel@ndufresne.ca>
Subject: Re: [RFC] media: uapi: Add VP8 low-level decoder API compound
 controls.
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        DVB_Linux_Media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com
Date:   Thu, 16 May 2019 13:51:18 -0400
In-Reply-To: <CAAFQd5CQDy4+eWEDpMhdO=ySPN6y__WmTm3PAsVFukO7Sm-dXg@mail.gmail.com>
References: <20190213211557.17696-1-ezequiel@collabora.com>
         <3507aedd6fd4be7ad66fa27a341faa36b4cef9dc.camel@collabora.com>
         <CAKQmDh_ZrwzxY6L2va1i0kumy1ipo2Hn7oeuR9BJMntKxLuYhQ@mail.gmail.com>
         <4812f69e53d1313678d0c54577793362e6d7ad2e.camel@collabora.com>
         <CAAFQd5CQDy4+eWEDpMhdO=ySPN6y__WmTm3PAsVFukO7Sm-dXg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-DCI8r05ws1fgCCHw79TG"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-DCI8r05ws1fgCCHw79TG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 25 f=C3=A9vrier 2019 =C3=A0 14:34 +0900, Tomasz Figa a =C3=A9crit =
:
> On Fri, Feb 15, 2019 at 9:06 AM Ezequiel Garcia <ezequiel@collabora.com> =
wrote:
> > On Wed, 2019-02-13 at 21:35 -0500, Nicolas Dufresne wrote:
> > > Le mer. 13 f=C3=A9vr. 2019 =C3=A0 16:23, Ezequiel Garcia
> > > <ezequiel@collabora.com> a =C3=A9crit :
> > > > Hi,
> > > >=20
> > > > On Wed, 2019-02-13 at 18:15 -0300, Ezequiel Garcia wrote:
> [snip]
> > > > > +     __u8 version;
> > > > > +
> > > > > +     /* Populated also if not a key frame */
> > > > > +     __u16 width;
> > > > > +     __u16 height;
> > > > > +     __u8 horizontal_scale;
> > > > > +     __u8 vertical_scale;
> > > > > +
> > > > > +     struct v4l2_vp8_segment_header segment_header;
> > > > > +     struct v4l2_vp8_loopfilter_header lf_header;
> > > > > +     struct v4l2_vp8_quantization_header quant_header;
> > > > > +     struct v4l2_vp8_entropy_header entropy_header;
> > > > > +
> > > > > +     __u8 sign_bias_golden;
> > > > > +     __u8 sign_bias_alternate;
> > > > > +
> > > > > +     __u8 prob_skip_false;
> > > > > +     __u8 prob_intra;
> > > > > +     __u8 prob_last;
> > > > > +     __u8 prob_gf;
> > > > > +
> > > > > +     __u32 first_part_size;
> > > > > +     __u32 first_part_offset; // this needed? it's always 3 + 7 =
* s->keyframe;
> > > >=20
> > > > As the comment says, it seems the first partition offset is always
> > > > 3 + 7 * s->keyframe. Or am I wrong?
> > >=20
> > > I can't find it in VA API or GStreamer parsers. Ideally we need to
> > > look in the spec, if it's calculated it does not belong here.
> > >=20
> >=20
> > Looking into the spec, I don't think it's part of it.
> >=20
> > > https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/blob/master/=
gst-libs/gst/codecparsers/gstvp8parser.h#L255
> > > https://github.com/intel/libva/blob/master/va/va_dec_vp8.h#L72
> > >=20
> > > Notice that VA splits this in two, the some part in the picture
> > > parameter, and some parts as SliceParameters. I believe it's to avoid
> > > having conditional field base on if key_frame =3D=3D 0.
> > >=20
> >=20
> > That might make sense. Something to look into.
>=20
> Yeah, sounds reasonable, although VAAPI naming is a bit off, since VP8
> doesn't have a notion of slices...

Agreed, VAAPI uses slices to fit their abstraction. VP8 is just a
special case where you only have one slice per frame. It's not needed
in this uAPI for the kernel.

>=20
> Best regards,
> Tomasz

--=-DCI8r05ws1fgCCHw79TG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXN2jFgAKCRBxUwItrAao
HPy+AJ0QOkImsG6+YwSwImaSBdF0EfVvpQCgn1gqCi9afr4KbrVaObgkNp2hNto=
=5H5j
-----END PGP SIGNATURE-----

--=-DCI8r05ws1fgCCHw79TG--

