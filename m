Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31790755953
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 04:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbjGQCFd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jul 2023 22:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjGQCFd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jul 2023 22:05:33 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7C1E58
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 19:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
 s=s31663417; t=1689559511; x=1690164311; i=herdler@nurfuerspam.de;
 bh=csbjK34gRmbdR6Yt6EuftDpK7+w/STqOTQT/+l4j/Ms=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gGO44juom2xKH8fKtp0fP6dVaSCozDM/OKeltH2gSkquou8BXjVNq0bfCyeoBPeOwI4J5/L
 5EwreBCNyT++DEv3Qyd6DKVH7O/9vM3XA4TOLgidn+v+w7vykuuHOfOG1iVFz7b9tuXsjRbd+
 AV2uNJinibTHFTAYRzwEV/UAGrpmz7q2fZN1jUdZlsBuaFgOklkBjWyjDyB/lKDIdXzEGxfYu
 Z0qajix8ePG1c422fFLtuK/6SBWITpVOJMZOlsRTJgSrPlUjJJBNQHxlhzlhjHwHB1Bpl71Yo
 f4aJAc3mhhWf5bGfBMlovzygCUmrpSPGr+0rG673ejSw5zl0q8XQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.179.15]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72oB-1qIm642sxD-008Zs8; Mon, 17
 Jul 2023 04:05:11 +0200
From:   Stefan Herdler <herdler@nurfuerspam.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
Subject: [PATCH v3 1/6] Add documentation for legacy DVB decoder API
Date:   Mon, 17 Jul 2023 04:04:41 +0200
Message-Id: <20230717020446.28877-2-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20230717020446.28877-1-herdler@nurfuerspam.de>
References: <20230717020446.28877-1-herdler@nurfuerspam.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c/ZK7yJ5fXttFEUwq2gib9MSyLM4XdP7U6MYpRu+D3uo/ctcnmQ
 RoL6JLB9aNUAxD2/+jpAjE0wwBWAsZyljlSQNUdocJ5DxcTiowaHMBFHVJ37YXdieoXQ5/p
 qyimm0CPjONlj/lxf+iWTlZuSTv/iHc7MGC0xwKfFOF4i3qdpwrn5Rq3bMBllUppKQIE/nI
 PZWs9XWG6QorVAB7AZmRg==
UI-OutboundReport: notjunk:1;M01:P0:/J+3w/1GjW8=;72GsUZVSOTEKi3XHgUIozaKHvpC
 5iFKxNFnGulNDEp6AODpF99ZYrrLjL2kgVrDmbh6C88d/6Pg/zibiz+FVowQ9v59LMgddNmTP
 ptiePfn3CsMFbxVLcn+BsjNacvN2WApKv2K8t+hqN5rdZ8x2JOSfLaGYBeF7MKc9iyLyQb/yO
 3WmsXara3RxaFC2C9Kkg7sUtCXl7EtTQWHYvuFMvlRvpd9Cak6QAtVKyKwULcX0vH38ACx5CN
 lNu7mm/YsilURMz2fNpdMlxn4UoN1v5Z7J5iei5wAJBR6pSoib2smCzL+so+QVZZP4yvTJWJB
 OYhHEoymnFru2VfRdFsUl/nu3tm034xkwWDPvEgGf6O5RJ8CdPnEg3IYZYZ6CR+H8AL6sXplQ
 F3KP4C0wybQeyRSoS84fvDinIBwIDGDjE6qy7EynjZF6LpBL54KjSHNtXWAAS2iXQU7PnPLka
 vvau9y8SpD03ZwIGsyNWkJpK9prOmrN8buCmuzV4r+CkNrKy8DhgMd0EokoiKeJiEmJsXlfxl
 jHV1Z+mHPLH1VdgZmxB5cByo6cpCOICcOzhlYq+ZJK55aHzlMS0TLWu0+hRDexm6C+dtiwKAz
 rDzoqXC7AnMUd49GvaLgV6dyj1nP1fJXgAEZmEQlDH+HVTHdk5GG6uwRX8SmmaARPl5TybZzf
 6ZGzdU2h+DZN8NzzkV5/xASbPeuxAGC4tKbjzE4gshsGCO18w5ImYgeGZRzunuwPo+r4DBNMd
 6Et1qmNewgf+iZvERHbyC3ikPrIgUD4m84lgqJlozaY24sLavkiCjDwHJnbxjss9fcr1bzDkf
 82s+PlZTEmsC1+puM6PHnG32xB1N+CoCNAzHXaEkjvlS3W/EUterPv98Qy1a7EJC5xlYOPbS/
 eCyHZawQks9SZZrQo7/zRVr9ebyDc1SgvVfHBcukuirdc1KuL9oVuSV+SZMz2zKhDn8XlEe9D
 KjiA2Ok2+De1ffn3p7lNymEb3lI=
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,NO_DNS_FOR_FROM,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new indexfile and link to it.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>
> Please place it dual licensed with GFDL and GPL 2.0.

Changed to GFDL OR GPL-2.0 like in "media/glossary.rst".

GPL 2.0 is fine for me too, but the old documentation, my work is based on=
, was GFDL.
Can we just change the license?
That's not mine to judge.



 .../media/dvb/legacy_dvb_apis.rst             |  1 +
 .../media/dvb/legacy_dvb_decoder_api.rst      | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_decod=
er_api.rst

diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst b/D=
ocumentation/userspace-api/media/dvb/legacy_dvb_apis.rst
index b97d56ee543c..ffe8325749e5 100644
=2D-- a/Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst
@@ -23,3 +23,4 @@ DVB-S2, DVB-T2, ISDB, etc.
     :maxdepth: 1

     frontend_legacy_dvbv3_api
+    legacy_dvb_decoder_api
diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_decoder_api.=
rst b/Documentation/userspace-api/media/dvb/legacy_dvb_decoder_api.rst
new file mode 100644
index 000000000000..f6e2f28b1fcb
=2D-- /dev/null
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_decoder_api.rst
@@ -0,0 +1,61 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later OR GPL-2.0
+
+.. _legacy_dvb_decoder_api:
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+Legacy DVB MPEG Decoder APIs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+.. _legacy_dvb_decoder_notes:
+
+General Notes
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+This API has originally been designed for DVB only and is therefore limit=
ed to
+the :ref:`legacy_dvb_decoder_formats` used in such digital TV-broadcastsy=
stems.
+
+To circumvent this limitations the more versatile :ref:`V4L2 <v4l2spec>` =
API has
+been designed. Which replaces this part of the DVB API.
+
+Nevertheless there have been projects build around this API.
+To ensure compatibility this API is kept as it is.
+
+.. attention:: Do **not** use this API in new drivers!
+
+    For audio and video use the :ref:`V4L2 <v4l2spec>` and ALSA APIs.
+
+    Pipelines should be set up using the :ref:`Media Controller  API<medi=
a_controller>`.
+
+Practically the decoders seem to be treated differently. The application =
typically
+knows which decoder is in use or it is specially written for one decoder =
type.
+Querying capabilities are rarely used because they are already known.
+
+
+.. _legacy_dvb_decoder_formats:
+
+Data Formats
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The API has been designed for DVB and compatible broadcastsystems.
+Because of that fact the only supported data formats are ISO/IEC 13818-1
+compatible MPEG streams. The supported payloads may vary depending on the
+used decoder.
+
+Timestamps are always MPEG PTS as defined in ITU T-REC-H.222.0 /
+ISO/IEC 13818-1, if not otherwise noted.
+
+For storing recordings typically TS streams are used, in lesser extent PE=
S.
+Both variants are commonly accepted for playback, but it may be driver de=
pendent.
+
+
+
+
+Table of Contents
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. toctree::
+    :maxdepth: 2
+
+    legacy_dvb_video
+    legacy_dvb_audio
+    legacy_dvb_osd
=2D-
2.34.0

