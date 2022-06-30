Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06A15561394
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 09:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233254AbiF3Hrl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 03:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbiF3Hrj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 03:47:39 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BD53BA73;
        Thu, 30 Jun 2022 00:47:38 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f39so32285072lfv.3;
        Thu, 30 Jun 2022 00:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=UJma+hccqR5aqdoWvaqvkY0KbcCLV9ny5JEaD9S2u7M=;
        b=YsssRIgBJ4hH6NGsrQmjAexl+5bN6RdvMeHUlgervuYq9fjv0KDDtquiYHBTQN8rgm
         01kBucqpHWTcK+SFwwFoSOTZkRUXfCtLFujjBy0SPHeNvSXv2brREZ10dKuGrlRbsA2P
         +JA2dWwNnTazYoVAzL48+cpufcqr0kZ6Cc74TtQhT7w9rPrX4hPktewBtWTw95tWIdUr
         tpGqtqRVBQhvHrNFCv955subKAs2NmuQ2AEuXMFFbDwU/ds0+amXc59GR0IjPkCZhcTp
         qkeIs8TPpl6asX0zrUBybwwS/oiBqo+pM/sNgMUfMQZBerqcDmkZQMIwcCl9QxUrsqzv
         0Ehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=UJma+hccqR5aqdoWvaqvkY0KbcCLV9ny5JEaD9S2u7M=;
        b=LXqYZu9BbsT/Pspf+6DV9FiXKpOYQo1gXYtcQ/kWjHbS33l8l2FMza6xV/0xtCUBWz
         gzG3Lp8GJb58dEWm5b0ifBtrWZFcZrtWU9CH4Uc6/LpS3VK/ZaoiD4jmYUJM/tpIIQu4
         5pcJ3RwKDpO7uGFF4Tdf4Khh/iKkuRf05PF6mthBCpxqEqu89tAeQd8oaw8/woDmfwuz
         Q0xxqXPAY5EkN/76DTeeLIOtV07MyyB6IWg59KUS1bI+aZ7TA4RBAueYGXRfvq0FY1ic
         GoGOv23dxWUT+SMkO8N3q15EVFh1/3BHYQHldDS6Zv5jQ/z7OfFsHcG38yuG3wY3j6y8
         6LRA==
X-Gm-Message-State: AJIora+gdeoP4FRxu4CfQzKXiLnjOnufR91dTKlqdHuZ2hxOpxhk6kc7
        pec/irV9f/ZGtshmQNrITw8=
X-Google-Smtp-Source: AGRyM1tGRBxLTD0woETHcejT21FiPEBCTfhEzG8IQ/H7WUS7PKFJs64Tpk6PnTQBlZnU2Vmy5JcjQg==
X-Received: by 2002:ac2:44b1:0:b0:47f:6279:5f45 with SMTP id c17-20020ac244b1000000b0047f62795f45mr4417086lfm.283.1656575256706;
        Thu, 30 Jun 2022 00:47:36 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id c4-20020a196544000000b0047f6fe39bb9sm2967958lfj.27.2022.06.30.00.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 00:47:36 -0700 (PDT)
Date:   Thu, 30 Jun 2022 10:47:25 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Dennis Tsiang <dennis.tsiang@arm.com>
Cc:     Simon Ser <contact@emersion.fr>,
        Normunds Rieksts <Normunds.Rieksts@arm.com>, airlied@linux.ie,
        tzimmermann@suse.de, Liviu Dudau <Liviu.Dudau@arm.com>,
        linux-kernel@vger.kernel.org,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
        david.harvey-macaulay@arm.com, Lisa Wu <lisa.wu@arm.com>,
        nd <nd@arm.com>, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/1] [RFC] drm/fourcc: Add new unsigned
 R16_UINT/RG1616_UINT formats
Message-ID: <20220630104725.602bff9a@eldfell>
In-Reply-To: <o1qcCo8e19pmmNe-YJbPkmu4SBrOQ_E3u7eqdrcXUzdBccLtFswL_ARTpbrX9C10tippuy5ieXAsqdf7H47JuT7Hqa1NlizAPqVuRM0kRt4=@emersion.fr>
References: <AS8PR08MB81117652E417826E741154B8F8B99@AS8PR08MB8111.eurprd08.prod.outlook.com>
        <20220627175026.6a5dd239@eldfell>
        <05513f59-0bd9-77cd-36d4-41027bc339be@arm.com>
        <o1qcCo8e19pmmNe-YJbPkmu4SBrOQ_E3u7eqdrcXUzdBccLtFswL_ARTpbrX9C10tippuy5ieXAsqdf7H47JuT7Hqa1NlizAPqVuRM0kRt4=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PWI1bJaQrT8/Yn7UW=rAv+v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/PWI1bJaQrT8/Yn7UW=rAv+v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Jun 2022 14:53:49 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Wednesday, June 29th, 2022 at 16:46, Dennis Tsiang <dennis.tsiang@arm.=
com> wrote:
>=20
> > Thanks for your comments. This is not intended to be used for KMS, where
> > indeed there would be no difference. This proposal is for other Graphics
> > APIs such as Vulkan, which requires the application to be explicit
> > upfront about how they will interpret the data, whether that be UNORM,
> > UINT .etc. We want to be able to import dma_bufs which create a VkImage
> > with a "_UINT" VkFormat. However there is currently no explicit mapping
> > between the DRM fourccs + modifiers combos to "_UINT" VkFormats. One
> > solution is to encode that into the fourccs, which is what this RFC is
> > proposing. =20
>=20
> As a general comment, I don't think it's reasonable to encode all of the
> VkFormat information inside DRM FourCC. For instance, VkFormat has SRGB/U=
NORM
> variants which describe whether pixel values are electrical or optical
> (IOW, EOTF-encoded or not). Moreover, other APIs may encode different
> information in their format enums.

Yeah, do not add any of that information to the DRM pixel format codes.

There is *so much* other stuff you also need to define than what's
already mentioned, and which bits you need for the API at hand depends
totally on the API at hand. After the API has defined some parts of the
metadata, the API user has to take care of the remaining parts of the
metadata in other ways, like dynamic range or color space.

Besides, when you deal with dmabuf, you already need to pass a lot of
metadata explicitly, like the pixel format, width, height, stride,
modifier, etc. so it's better to add more of those (like we will be
doing in Wayland, and not specific to dmabuf even) than to try make
pixel formats a huge mess through combinatorial explosion and sometimes
partial and sometimes conflicting image metadata.

You might be able to get a glimpse of what all metadata there could be
by reading
https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/pixels_colo=
r.md
.

Compare Vulkan formats to e.g.
https://docs.microsoft.com/en-us/windows/win32/api/dxgicommon/ne-dxgicommon=
-dxgi_color_space_type
and you'll see that while DXGI color space enumeration is mostly about
other stuff, it also has overlap with Vulkan formats I think, at least
the SRGB vs. not part.

Btw. practically all buffers you see used, especially if they are 8
bpc, they are almost guaranteed to be "SRGB" non-linearly encoded, but
do you ever see that fact being explicitly communicated?

Then there is the question that if you have an SRGB-encoded buffer, do
you want to read out SRGB-encoded or linear values? That depends on
what you are doing with the buffer, so if you always mapped dmabuf to
Vulkan SRGB formats (or always to non-SRGB formats), then you need some
other way in Vulkan for the app to say whether to sample encoded or
linear (electrical or optical) values. And whether texture filtering is
done in encoded or linear space, because that makes a difference too.

IOW, there are cases where the format mapping depends on the user of the
buffer and not only on the contents of the buffer.

Therefore you simply cannot create a static mapping table between two
format definition systems when the two systems are fundamentally
different, like Vulkan and DRM fourcc.


Thanks,
pq

--Sig_/PWI1bJaQrT8/Yn7UW=rAv+v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmK9VQ0ACgkQI1/ltBGq
qqdSnw//dKU1Je3JNCuVm7l04PD/fNdNZkQAya5N7nCGJ+3573oOu+IsmD6qJNyu
n20Q8gV0EaRAmptxeCwPlQTzLdlqC711c1lDAaA3TQEmyOIYH2rk/dq0VHnuW2LK
9VCnHiLCfa7apbWrZE+qqVPhwtU1JVLZGke9UbOaDMZ4cnx5+9ckejmsGlshL+ZP
2BHtfNcQT+V47+9/IjJh5dWdVwzSiCh3psArhuEbxq4jfJNhzrUqvY8bQpUfd/ja
Q4SYPEaH8OmZvFYzrnIdnM6f8wYNLfwF2JXpIGXdS8TLhbJlfdZj7OIaEek8/Nlx
Rr79cscBYX0nFUlAkmrKWSpbq+WpC9vaB9uJaZLQyAZj5GHjW+OqKi83moyvVhBt
6fAZKehEugRhSeACMltFQEChCx5yFMj9eACHozzO241xvKZHoGMh2xJfZpOYLjnV
d6zpXmjwgXWyIgtx4BzTRAA12eI7tt3k4YjrbzrUsSf6zdgT/7NfHw07n4+THynl
sWf+evSYCIOIU1ajkDc+zbbKNnybs3d4W0v0UmVwIFZs8lXJXWg+Bgjt1mtKwNV1
18fY0bE7g2bcLvMltRgWgBmEyIRIOqI6NqWIifF0WvRcdD2WH7j0qQiADWvVP8dd
Yg4tpsuRPFHI71FZ/3fHzAC2+4of6iF7R//bdg18h8JSuivblHk=
=FXx7
-----END PGP SIGNATURE-----

--Sig_/PWI1bJaQrT8/Yn7UW=rAv+v--
