Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3814369C004
	for <lists+linux-media@lfdr.de>; Sun, 19 Feb 2023 12:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjBSLMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Feb 2023 06:12:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjBSLMX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Feb 2023 06:12:23 -0500
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA51E3AF;
        Sun, 19 Feb 2023 03:12:21 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 91092EBA74;
        Sun, 19 Feb 2023 03:01:26 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id twkaz4URFD2u; Sun, 19 Feb 2023 03:01:25 -0800 (PST)
Date:   Sun, 19 Feb 2023 12:01:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1676804485; bh=s8GmYem4GGNHE2aSoWAinr+OiFpRuapItfASdeJrP6s=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=jRbGaVIbXp4EDYsfC35gXg/HUtdRznfAr+7V8ul+8OaXae8vOf16HFPR03HHmT7/3
         VJuDvfeCNDPOCSFiw8CAFqOZZpFrrefrv5osGV2xfIKsVHyyTqPZlKdRsg5Ow/FIbq
         /WfPFyhqwZ/1QByZagWpDjbtdqL+wkjGr7I3alI9Ocy4idf/rENkOcns+EA70GPueD
         nn0ueM45hPzNbDleh0cWcSOedkgjwbDyQxe//CHwG1A/b5yFADOPBtqP+HXooTOu6Z
         XgD38QAdbFKDhxGqNOlbN6fGX+WK1vg1WFg1juEQr3Uu25fAwLvpuMfckVUOvzCenA
         bhJEFQ7IdEx1w==
From:   Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm
Subject: [PATCHv3 2/2 RESEND] media api: Try to make enum usage clearer
Message-ID: <20230219120121.57a9d4d3.dorota.czaplejewicz@puri.sm>
In-Reply-To: <20221211125718.2815126-1-dorota.czaplejewicz@puri.sm>
References: <20221211125718.2815126-1-dorota.czaplejewicz@puri.sm>
Organization: Purism
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kH.oaGn_SIixzkwLbihog7M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/kH.oaGn_SIixzkwLbihog7M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This clarifies which side of the calls is responsible for doing what to whi=
ch parts of the struct.
It also expands the terse description of the access algorithm into more pro=
se-like, active voice description, which trades conciseness for ease of com=
prehension.

Fixed: typo "format" -> "frame size" in enum-frame-size
Added: no holes in the enumeration
Added: enumerations per what?
Added: who fills in what in calls
Changed: "given" -> "specified"

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
---
 .../v4l/vidioc-subdev-enum-frame-size.rst     | 44 ++++++++++++-------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame=
-size.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-=
size.rst
index c25a9896df0e..82b5d2538fa9 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.r=
st
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.r=
st
@@ -31,18 +31,30 @@ Arguments
 Description
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-This ioctl allows applications to enumerate all frame sizes supported by
-a sub-device on the given pad for the given media bus format. Supported
-formats can be retrieved with the
+This ioctl allows applications to access the enumeration of frame sizes
+supported by a sub-device on the specified pad
+for the specified media bus format.
+Supported formats can be retrieved with the
 :ref:`VIDIOC_SUBDEV_ENUM_MBUS_CODE`
 ioctl.
=20
-To enumerate frame sizes applications initialize the ``pad``, ``which``
-, ``code`` and ``index`` fields of the struct
-:c:type:`v4l2_subdev_mbus_code_enum` and
-call the :ref:`VIDIOC_SUBDEV_ENUM_FRAME_SIZE` ioctl with a pointer to the
-structure. Drivers fill the minimum and maximum frame sizes or return an
-EINVAL error code if one of the input parameters is invalid.
+The enumerations are defined by the driver, and indexed using the ``index`=
` field
+of the struct :c:type:`v4l2_subdev_mbus_code_enum`.
+Each pair of ``pad`` and ``code`` correspond to a separate enumeration.
+Each enumeration starts with the ``index`` of 0, and
+the lowest invalid index marks the end of the enumeration.
+
+Therefore, to enumerate frame sizes allowed on the specified pad
+and using the specified mbus format, initialize the
+``pad``, ``which``, and ``code`` fields to desired values,
+and set ``index`` to 0.
+Then call the :ref:`VIDIOC_SUBDEV_ENUM_FRAME_SIZE` ioctl with a pointer to=
 the
+structure.
+
+A successful call will return with minimum and maximum frame sizes filled =
in.
+Repeat with increasing ``index`` until ``EINVAL`` is received.
+``EINVAL`` means that either no more entries are available in the enumerat=
ion,
+or that an input parameter was invalid.
=20
 Sub-devices that only support discrete frame sizes (such as most
 sensors) will return one or more frame sizes with identical minimum and
@@ -72,26 +84,28 @@ information about try formats.
=20
     * - __u32
       - ``index``
-      - Number of the format in the enumeration, set by the application.
+      - Index of the frame size in the enumeration belonging to the given =
pad and format.
+	Filled in by the application.
     * - __u32
       - ``pad``
       - Pad number as reported by the media controller API.
+	Filled in by the application.
     * - __u32
       - ``code``
       - The media bus format code, as defined in
-	:ref:`v4l2-mbus-format`.
+	:ref:`v4l2-mbus-format`. Filled in by the application.
     * - __u32
       - ``min_width``
-      - Minimum frame width, in pixels.
+      - Minimum frame width, in pixels. Filled in by the driver.
     * - __u32
       - ``max_width``
-      - Maximum frame width, in pixels.
+      - Maximum frame width, in pixels. Filled in by the driver.
     * - __u32
       - ``min_height``
-      - Minimum frame height, in pixels.
+      - Minimum frame height, in pixels. Filled in by the driver.
     * - __u32
       - ``max_height``
-      - Maximum frame height, in pixels.
+      - Maximum frame height, in pixels. Filled in by the driver.
     * - __u32
       - ``which``
       - Frame sizes to be enumerated, from enum
--=20
2.38.1


--Sig_/kH.oaGn_SIixzkwLbihog7M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExKRqtqfFqmh+lu1oADBpX4S8ZncFAmPyAYEACgkQADBpX4S8
ZndOXg//YlxeVv/TCSUVeFs6NS1p8XkvKfjUvVe914lM5+U7dcddS6SmrptnTykO
IgMBmp0iuP3ZNbosO3vuBEF10mtSXOVgXv9Csp1Hq7hLBJBOkfVAQ2rdu4CtAeHx
brN7oq7IcNDNFoeRYXrcbnuTJv0r80gh78woy1yw6l+3guQ5LmR7kI2L26C7p9n7
JgWw7+MCsc/k0NE9mlyaBPR2i6pcuOCZB8TCcLV/m9/3EQ4v+zf+E44x1qlAA2kp
946lUiTLZcZavAzW2knMIOAjAmWMpf4hlXpdDXkOKJDPzhQqPo3T/FqfR1k71jXR
qLiLL8EbNKEg/xtVsETEXbL8nPbCxSvX58Cc4qwc0dyLar18gFI20lpaCXYL6dDs
hZpan1Ldfy65/CEWTODElwi5SJcis/FrE5C2jLw1PFNwFyi4qcb00F5tLuPx+CM6
14Pxb3liwNHrKY/pc+e8qmIgjCKRMPF/xVxF0Xictxq25Q6owR/pvW1joP81Zc+P
jnxWKMYo9hkuEFx64ti7WONoTmJ4Mvm5DMk6dMmOR2Q9ZSDVyo0Mv8f0018YmHD2
rgNBVeuok3tOa+kvA48PuT6Nr6QUDPaoLo1ICCyE4XGkQtssT1wntxoaZS88WIbF
PVNbqj2ZfaHvEJTuwth30vXxIn22TUxKxK+TXJFof/b3aKKEMJA=
=yH6v
-----END PGP SIGNATURE-----

--Sig_/kH.oaGn_SIixzkwLbihog7M--
