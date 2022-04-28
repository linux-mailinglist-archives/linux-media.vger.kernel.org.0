Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBD15134C5
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 15:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346914AbiD1NUO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 09:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346910AbiD1NUG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 09:20:06 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2BA554B8
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 06:16:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 6404A1F45786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651151811;
        bh=kctxlG5b7xeWvSXqu4NdAJc58xKdWPIlKfVzEP8l5/U=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=BdTaUmO2fdCJvh9COOxJ/CmK9qf2FaqRznlS6pf7zZAwO/3g744pRZamZah775DCR
         VGeJ2pwiL8owA/G8gleqJ6qHuVrepQvtk2xvUYYQ/Mc1tXUOHQlBpIFjJu3Z777tko
         hcdy4l4/xqH+Z8bVWU6mlfMhXTEgfTaMA8gm3QgY5VFoWh04/efxVLVtg0jiUhv/sr
         xlToGhrTS7cSRlOqHJbhaURF9ntxLrmBErFuTcNcgDKfQWPakyMmBxq3ZDZAIUyAER
         uwvCf54tG5Z/EOLsZmihIRkLp90B0jN9t9p8fZWfVE1edHgHCTIRCkd9WANAi6h2+Y
         3UMF/aaEr/btw==
Message-ID: <ba3f5fa632a53218974ab1640ae72e2315d7518e.camel@collabora.com>
Subject: Re: Hantro JPEG Encoding Padding Bug
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        linux-media@vger.kernel.org
Cc:     wens@csie.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Date:   Thu, 28 Apr 2022 09:16:40 -0400
In-Reply-To: <2351438.KPpaG06aq8@archbook>
References: <2351438.KPpaG06aq8@archbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 28 avril 2022 =C3=A0 14:04 +0200, Nicolas Frattaroli a =C3=A9crit=
=C2=A0:
> Hello,
>=20
> yesterday I enabled the Hantro JPEG encoder on my RK3566[1], and noticed
> a peculiar thing: when encoding a 1920x1080 video[2] with gstreamer
> through the hardware JPEG encoder using v4l2jpegenc, it'd result in a
> 1920x1088 output with a green bar at the bottom[3].
>=20
> I asked on the #linux-media IRC channel on OFTC about this, and was told
> by Nicolas Dufresne (hello, fellow Nicolas!) that I should post to this
> list to make sure this doesn't fall through the cracks.
>=20
> The kernel used was based on 5.18-rc4, and the GStreamer version is
> 1.20.1.
>=20
> The GStreamer command used was:
>=20
> gst-launch-1.0 filesrc location=3Dpanduroll.mp4 ! \
>                qtdemux name=3Ddemux demux.video_0 ! decodebin ! \
>                videoconvert ! v4l2jpegenc ! matroskamux ! \
>                filesink location=3Dpandu_but_mjpeg.mkv

I've reproduced the issue, it looks like GStreamer videoencoder does not ca=
ll
S_SELECTION. Older driver were simply using the CAPTURE width/height and wo=
uld
set the crop automatically, hence why it worked in other cases. Here's a pa=
tch
to fix GStreamer, looking for feedback.


diff --git a/subprojects/gst-plugins-good/sys/v4l2/gstv4l2object.c
b/subprojects/gst-plugins-good/sys/v4l2/gstv4l2object.c
index 8609d823ec..de791aa936 100644
--- a/subprojects/gst-plugins-good/sys/v4l2/gstv4l2object.c
+++ b/subprojects/gst-plugins-good/sys/v4l2/gstv4l2object.c
@@ -3190,7 +3190,6 @@ gst_v4l2_object_reset_compose_region (GstV4l2Object *=
 obj)
   struct v4l2_selection sel =3D { 0 };
=20
   GST_V4L2_CHECK_OPEN (obj);
-  GST_V4L2_CHECK_NOT_ACTIVE (obj);
=20
   sel.type =3D obj->type;
   sel.target =3D V4L2_SEL_TGT_COMPOSE_DEFAULT;
@@ -4353,7 +4352,6 @@ gst_v4l2_object_set_crop (GstV4l2Object * obj, struct
v4l2_rect * crop_rect)
   struct v4l2_crop crop =3D { 0 };
=20
   GST_V4L2_CHECK_OPEN (obj);
-  GST_V4L2_CHECK_NOT_ACTIVE (obj);
=20
   sel.type =3D obj->type;
   sel.target =3D V4L2_SEL_TGT_CROP;
diff --git a/subprojects/gst-plugins-good/sys/v4l2/gstv4l2videoenc.c
b/subprojects/gst-plugins-good/sys/v4l2/gstv4l2videoenc.c
index 19496b73f0..04fab87a48 100644
--- a/subprojects/gst-plugins-good/sys/v4l2/gstv4l2videoenc.c
+++ b/subprojects/gst-plugins-good/sys/v4l2/gstv4l2videoenc.c
@@ -342,6 +342,9 @@ gst_v4l2_video_enc_set_format (GstVideoEncoder * encode=
r,
     return FALSE;
   }
=20
+  /* best effort */
+  gst_v4l2_object_setup_padding (self->v4l2output);
+
   self->input_state =3D gst_video_codec_state_ref (state);
=20
   GST_DEBUG_OBJECT (self, "output caps: %" GST_PTR_FORMAT, state->caps);
@@ -876,6 +879,9 @@ gst_v4l2_video_enc_decide_allocation (GstVideoEncoder *
   }
   gst_caps_unref (caps);
=20
+  /* best effort */
+  gst_v4l2_object_setup_padding (self->v4l2capture);
+
   if (gst_v4l2_object_decide_allocation (self->v4l2capture, query)) {
     GstVideoEncoderClass *enc_class =3D GST_VIDEO_ENCODER_CLASS (parent_cl=
ass);
     ret =3D enc_class->decide_allocation (encoder, query);
---


>=20
> Regards,
> Nicolas Frattaroli
>=20
> [1]: https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D6=
36371
> [2]: https://overviewer.org/~pillow/up/cd92d13cc0/panduroll.mp4
> [3]: https://overviewer.org/~pillow/up/f46371b207/pandu_but_mjpeg.mkv
>=20
>=20

