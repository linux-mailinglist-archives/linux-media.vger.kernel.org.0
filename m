Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA34755954
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 04:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjGQCFf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jul 2023 22:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjGQCFd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jul 2023 22:05:33 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B1BF1
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 19:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
 s=s31663417; t=1689559512; x=1690164312; i=herdler@nurfuerspam.de;
 bh=Ttj6vK0l2iFGMGEMKbeOwDXjBJWRYblOs9I8fDNjoyQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=oD7I/59+tYKZ8D0sfkQ9ZDxAlqTxjWnDzyKtNfX+4aFPM0hQ2QGmNJEVoZ+9U+MkqjVeshp
 1ykpA1/JRRSV144g0wNMWl91fN1ZCYBTpW3fInXoZZVjl1XcKHdz4Z5yAO1bWVlmzAQaAXaRE
 B5f5U4TOs/9Lk5MR5PSdlPRAHIoRplzE/5GFSkiAIWw1nBES5K6jQ5EglIq8S/xhEUPhIH835
 3cAbsugV07TLkudex9zcbDpyrgYDx4/x1xioNhxVufLCrvftF0NU0Z2+/MS7uM0Zff5E+QwRI
 oBRxVWZeofbJxlro0NuFqIYKAi4799Z6bddtytFrwwuOGtvuPV1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.179.15]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwwZX-1q2CaK40GR-00yU8a; Mon, 17
 Jul 2023 04:05:12 +0200
From:   Stefan Herdler <herdler@nurfuerspam.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
Subject: [PATCH v3 2/6] Add documentation for osd.h
Date:   Mon, 17 Jul 2023 04:04:42 +0200
Message-Id: <20230717020446.28877-3-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20230717020446.28877-1-herdler@nurfuerspam.de>
References: <20230717020446.28877-1-herdler@nurfuerspam.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3F01pS3IrE1s8X5obXmQ8aTjWjyYUMskEv8qmrFph/Yv6TeCP2b
 ayZROXMksXZxo1zIPsOKxvQAsTfKpQMKrXSxDnw5oFiNlR7YRGKL1fv1brCOWfVOj6k4kjI
 pCRqfio/64QiCP33wB/WN8zSKWfmNdope9m7rA471egsGYkZYGcc3qbQ9mG+Q1Hz/6kU3Dv
 Y5mrczmf6b05r+FF2MDQQ==
UI-OutboundReport: notjunk:1;M01:P0:RLEhT0p/oBM=;JeWcgY1Z/MIfo2pQXzeZTK6k+0o
 x23Xcyn4OGmd5bQ976lhMSGmfe6pPBXeX7P/Z5HV3zD7+ks/qZ227NcKW2YICoI/zT/U+JPEr
 35fNaWUSiZNzROQMWR/WckFpSRWVQyDzGALrEAUNsYl9nLnqYav1K29JhvRsPflA3R8SNMAdJ
 5Cy7qOZnhdUgiOJwCNmNQ0uZ+KgeliHTwESsdCrkrin2ZePzO7mADYPOq0VCKtipCLgdb0scf
 s7gXwIJNyBac67J7PGVRc444EcSpPLmfMCGIttwHiJjYKA/arHOy5MzudwFe/zWw6gPpZ4+d0
 8qXVWfStSnO5uZEvka6/NHOyHNgHyI/gnqceg977qCCoO1z2y6KRCtK56aufY5lbYoTncze3/
 G5OKnkyDAyz7KZ0w4yKlpVeDDQqFvuNHQohVpG8a767Am/uG25oMEJ2gXVRGOfXWaoRWX6I87
 9zA5JnrLq/9zLy7nfNQXoWZrEYMVG5hRJjfKPpT9vVNO1lqlfA1a3z0MOSyjx91n8OqFjCN9W
 TJODZCOlA5YvEEZM9Progw0V6Cv+llNhJ1cq0aFJjsUQ7YyWjtpuL4snu6QnGdbs6w6uRQdE+
 cBlp7XhA5Fpvx+tRAvFrJ2t6X6ABw+b0ydFsxKxx5dp2Sp/DP2VjuluPEs+qdBR4tnWyXq4M/
 Lv2iKNBco+9myc83Fdxq6KPj4dH5ETbnnlgNi7RW+AGZBzyIdf/VUvcY2DpgOS5SHBjSjpAgl
 yT8vy0pSBb9oWYg4tY+xx/YP7b0LppYbD86FUzZqZIeMv1bFFHAIvI+ng9xzbmuvZ3jisfykw
 X6BVznMA6jfYEUT9PcIKUJ+P269X5Si0GqDNjB4OPoQNyoYX9mF+W1GKo2u6LqZjfQqbr56jH
 6AlvP2nBCjZIhX4iwOTZVwoSoMxaw4js7TZaMHq5jLFx719+Ac+kz5xVS25Ixft+W59xh3493
 j4N1J6kWGcB6K0bwkg2oGQTTQJo=
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,NO_DNS_FOR_FROM,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new documentation file for osd.h

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

Everything is used by the AV7110 driver, except 3 OSD_Commands.
Remarks has been placed there.

That's probably the best solution.
Removing would create a gap in the enumeration.
Omitting in the documentation would make header and documentation
inconsistent again.



 .../media/dvb/legacy_dvb_osd.rst              | 883 ++++++++++++++++++
 1 file changed, 883 insertions(+)
 create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_osd.r=
st

diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_osd.rst b/Do=
cumentation/userspace-api/media/dvb/legacy_dvb_osd.rst
new file mode 100644
index 000000000000..eb4754bb00d0
=2D-- /dev/null
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_osd.rst
@@ -0,0 +1,883 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later OR GPL-2.0
+
+.. c:namespace:: dtv.legacy.osd
+
+.. _dvb_osd:
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+DVB OSD Device
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+The DVB OSD device controls the OnScreen-Display of the AV7110 based
+DVB-cards with hardware MPEG2 decoder. It can be accessed through
+``/dev/dvb/adapter?/osd0``.
+Data types and ioctl definitions can be accessed by including
+``linux/dvb/osd.h`` in your application.
+
+The OSD is not a frame-buffer like on many other cards.
+It is a kind of canvas one can draw on.
+The color-depth is limited depending on the memory size installed.
+An appropriate palette of colors has to be set up.
+The installed memory size can be identified with the `OSD_GET_CAPABILITY`=
_
+ioctl.
+
+OSD Data Types
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+OSD_Command
+-----------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    typedef enum {
+	/* All functions return -2 on "not open" */
+	OSD_Close =3D 1,
+	OSD_Open,
+	OSD_Show,
+	OSD_Hide,
+	OSD_Clear,
+	OSD_Fill,
+	OSD_SetColor,
+	OSD_SetPalette,
+	OSD_SetTrans,
+	OSD_SetPixel,
+	OSD_GetPixel,
+	OSD_SetRow,
+	OSD_SetBlock,
+	OSD_FillRow,
+	OSD_FillBlock,
+	OSD_Line,
+	OSD_Query,
+	OSD_Test,
+	OSD_Text,
+	OSD_SetWindow,
+	OSD_MoveWindow,
+	OSD_OpenRaw,
+    } OSD_Command;
+
+Commands
+~~~~~~~~
+
+.. note::  All functions return -2 on "not open"
+
+.. flat-table::
+    :header-rows:  1
+    :stub-columns: 0
+
+    -  ..
+
+       -  Command
+
+       -  | Used variables of ``struct`` `osd_cmd_t`_.
+          | Usage{variable} if alternative use.
+
+       -  :cspan:`2` Description
+
+
+
+    -  ..
+
+       -  ``OSD_Close``
+
+       -  -
+
+       -  | Disables OSD and releases the buffers.
+          | Returns 0 on success.
+
+    -  ..
+
+       -  ``OSD_Open``
+
+       -  | x0,y0,x1,y1,
+          | BitPerPixel[2/4/8]{color&0x0F},
+          | mix[0..15]{color&0xF0}
+
+       -  | Opens OSD with this size and bit depth
+          | Returns 0 on success,
+          | -1 on DRAM allocation error,
+          | -2 on "already open".
+
+    -  ..
+
+       -  ``OSD_Show``
+
+       - -
+
+       -  | Enables OSD mode.
+          | Returns 0 on success.
+
+    -  ..
+
+       -  ``OSD_Hide``
+
+       - -
+
+       -  | Disables OSD mode.
+          | Returns 0 on success.
+
+    -  ..
+
+       -  ``OSD_Clear``
+
+       - -
+
+       -  | Sets all pixel to color 0.
+          | Returns 0 on success.
+
+    -  ..
+
+       -  ``OSD_Fill``
+
+       -  color
+
+       -  | Sets all pixel to color <color>.
+          | Returns 0 on success.
+
+    -  ..
+
+       -  ``OSD_SetColor``
+
+       -  | color,
+          | R{x0},G{y0},B{x1},
+          | opacity{y1}
+
+       -  | Set palette entry <num> to <r,g,b>, <mix> and <trans> apply
+          | R,G,B: 0..255
+          | R=3DRed, G=3DGreen, B=3DBlue
+          | opacity=3D0:      pixel opacity 0% (only video pixel shows)
+          | opacity=3D1..254: pixel opacity as specified in header
+          | opacity=3D255:    pixel opacity 100% (only OSD pixel shows)
+          | Returns 0 on success, -1 on error.
+
+    -  ..
+
+       -  ``OSD_SetPalette``
+
+       -  | firstcolor{color},
+          | lastcolor{x0},data
+
+       -  | Set a number of entries in the palette.
+          | Sets the entries "firstcolor" through "lastcolor" from the
+            array "data".
+          | Data has 4 byte for each color:
+          | R,G,B, and a opacity value: 0->transparent, 1..254->mix,
+            255->pixel
+
+    -  ..
+
+       -  ``OSD_SetTrans``
+
+       -  transparency{color}
+
+       -  | Sets transparency of mixed pixel (0..15).
+          | Returns 0 on success.
+
+    -  ..
+
+       -  ``OSD_SetPixel``
+
+       -  x0,y0,color
+
+       -  | Sets pixel <x>,<y> to color number <color>.
+          | Returns 0 on success, -1 on error.
+
+    -  ..
+
+       -  ``OSD_GetPixel``
+
+       -  x0,y0
+
+       -  | Returns color number of pixel <x>,<y>,  or -1.
+          | Command currently not supported by the AV7110!
+
+    -  ..
+
+       -  ``OSD_SetRow``
+
+       -  x0,y0,x1,data
+
+       -  | Fills pixels x0,y through  x1,y with the content of data[].
+          | Returns 0 on success, -1 on clipping all pixel (no pixel
+            drawn).
+
+    -  ..
+
+       -  ``OSD_SetBlock``
+
+       -  | x0,y0,x1,y1,
+          | increment{color},
+          | data
+
+       -  | Fills pixels x0,y0 through  x1,y1 with the content of data[].
+          | Inc contains the width of one line in the data block,
+          | inc<=3D0 uses block width as line width.
+          | Returns 0 on success, -1 on clipping all pixel.
+
+    -  ..
+
+       -  ``OSD_FillRow``
+
+       -  x0,y0,x1,color
+
+       -  | Fills pixels x0,y through  x1,y with the color <color>.
+          | Returns 0 on success, -1 on clipping all pixel.
+
+    -  ..
+
+       -  ``OSD_FillBlock``
+
+       -  x0,y0,x1,y1,color
+
+       -  | Fills pixels x0,y0 through  x1,y1 with the color <color>.
+          | Returns 0 on success, -1 on clipping all pixel.
+
+    -  ..
+
+       -  ``OSD_Line``
+
+       -  x0,y0,x1,y1,color
+
+       -  | Draw a line from x0,y0 to x1,y1 with the color <color>.
+          | Returns 0 on success.
+
+    -  ..
+
+       -  ``OSD_Query``
+
+       -  | x0,y0,x1,y1,
+          | xasp{color}; yasp=3D11
+
+       -  | Fills parameters with the picture dimensions and the pixel
+            aspect ratio.
+          | Returns 0 on success.
+          | Command currently not supported by the AV7110!
+
+    -  ..
+
+       -  ``OSD_Test``
+
+       -  -
+
+       -  | Draws a test picture.
+          | For debugging purposes only.
+          | Returns 0 on success.
+    -  ..
+
+       -  ``OSD_Text``
+
+       -  x0,y0,size,color,text
+
+       -  Draws a text at position x0,y0 with the color <color>.
+
+    -  ..
+
+       -  ``OSD_SetWindow``
+
+       -  x0
+
+       -  Set window with number 0<x0<8 as current.
+
+    -  ..
+
+       -  ``OSD_MoveWindow``
+
+       -  x0,y0
+
+       -  Move current window to (x0, y0).
+
+    -  ..
+
+       -  ``OSD_OpenRaw``
+
+       -  | x0,y0,x1,y1,
+          | `osd_raw_window_t`_ {color}
+
+       -  Open other types of OSD windows.
+
+Description
+~~~~~~~~~~~
+
+The ``OSD_Command`` data type is used with the `OSD_SEND_CMD`_ ioctl to
+tell the driver which OSD_Command to execute.
+
+
+-----
+
+osd_cmd_t
+---------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    typedef struct osd_cmd_s {
+	OSD_Command cmd;
+	int x0;
+	int y0;
+	int x1;
+	int y1;
+	int color;
+	void __user *data;
+    } osd_cmd_t;
+
+Variables
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``OSD_Command cmd``
+
+       -  `OSD_Command`_ to be executed.
+
+    -  ..
+
+       -  ``int x0``
+
+       -  First horizontal position.
+
+    -  ..
+
+       -  ``int y0``
+
+       -  First vertical position.
+
+    -  ..
+
+       -  ``int x1``
+
+       -  Second horizontal position.
+
+    -  ..
+
+       -  ``int y1``
+
+       -  Second vertical position.
+
+    -  ..
+
+       -  ``int color``
+
+       -  Number of the color in the palette.
+
+    -  ..
+
+       -  ``void __user *data``
+
+       -  Command specific Data.
+
+Description
+~~~~~~~~~~~
+
+The ``osd_cmd_t`` data type is used with the `OSD_SEND_CMD`_ ioctl.
+It contains the data for the OSD_Command and the `OSD_Command`_ itself.
+The structure has to be passed to the driver and the components may be
+modified by it.
+
+
+-----
+
+
+osd_raw_window_t
+----------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    typedef enum {
+	OSD_BITMAP1,
+	OSD_BITMAP2,
+	OSD_BITMAP4,
+	OSD_BITMAP8,
+	OSD_BITMAP1HR,
+	OSD_BITMAP2HR,
+	OSD_BITMAP4HR,
+	OSD_BITMAP8HR,
+	OSD_YCRCB422,
+	OSD_YCRCB444,
+	OSD_YCRCB444HR,
+	OSD_VIDEOTSIZE,
+	OSD_VIDEOHSIZE,
+	OSD_VIDEOQSIZE,
+	OSD_VIDEODSIZE,
+	OSD_VIDEOTHSIZE,
+	OSD_VIDEOTQSIZE,
+	OSD_VIDEOTDSIZE,
+	OSD_VIDEONSIZE,
+	OSD_CURSOR
+    } osd_raw_window_t;
+
+Constants
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``OSD_BITMAP1``
+
+       -  :cspan:`1` 1 bit bitmap
+
+    -  ..
+
+       -  ``OSD_BITMAP2``
+
+       -  2 bit bitmap
+
+    -  ..
+
+       -  ``OSD_BITMAP4``
+
+       -  4 bit bitmap
+
+    -  ..
+
+       -  ``OSD_BITMAP8``
+
+       -  8 bit bitmap
+
+    -  ..
+
+       -  ``OSD_BITMAP1HR``
+
+       -  1 Bit bitmap half resolution
+
+    -  ..
+
+       -  ``OSD_BITMAP2HR``
+
+       -  2 Bit bitmap half resolution
+
+    -  ..
+
+       -  ``OSD_BITMAP4HR``
+
+       -  4 Bit bitmap half resolution
+
+    -  ..
+
+       -  ``OSD_BITMAP8HR``
+
+       -  8 Bit bitmap half resolution
+
+    -  ..
+
+       -  ``OSD_YCRCB422``
+
+       -  4:2:2 YCRCB Graphic Display
+
+    -  ..
+
+       -  ``OSD_YCRCB444``
+
+       -  4:4:4 YCRCB Graphic Display
+
+    -  ..
+
+       -  ``OSD_YCRCB444HR``
+
+       -  4:4:4 YCRCB graphic half resolution
+
+    -  ..
+
+       -  ``OSD_VIDEOTSIZE``
+
+       -  True Size Normal MPEG Video Display
+
+    -  ..
+
+       -  ``OSD_VIDEOHSIZE``
+
+       -  MPEG Video Display Half Resolution
+
+    -  ..
+
+       -  ``OSD_VIDEOQSIZE``
+
+       -  MPEG Video Display Quarter Resolution
+
+    -  ..
+
+       -  ``OSD_VIDEODSIZE``
+
+       -  MPEG Video Display Double Resolution
+
+    -  ..
+
+       -  ``OSD_VIDEOTHSIZE``
+
+       -  True Size MPEG Video Display Half Resolution
+
+    -  ..
+
+       -  ``OSD_VIDEOTQSIZE``
+
+       -  True Size MPEG Video Display Quarter Resolution
+
+    -  ..
+
+       -  ``OSD_VIDEOTDSIZE``
+
+       -  True Size MPEG Video Display Double Resolution
+
+    -  ..
+
+       -  ``OSD_VIDEONSIZE``
+
+       -  Full Size MPEG Video Display
+
+    -  ..
+
+       -  ``OSD_CURSOR``
+
+       -  Cursor
+
+Description
+~~~~~~~~~~~
+
+The ``osd_raw_window_t`` data type is used with the `OSD_Command`_
+OSD_OpenRaw to tell the driver which type of OSD to open.
+
+
+-----
+
+
+osd_cap_t
+---------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    typedef struct osd_cap_s {
+	int  cmd;
+    #define OSD_CAP_MEMSIZE         1
+	long val;
+    } osd_cap_t;
+
+Variables
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int  cmd``
+
+       -  Capability to query.
+
+    -  ..
+
+       -  ``long val``
+
+       -  Used to store the Data.
+
+Supported capabilities
+~~~~~~~~~~~~~~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``OSD_CAP_MEMSIZE``
+
+       -  Memory size installed on the card.
+
+Description
+~~~~~~~~~~~
+
+This structure of data used with the `OSD_GET_CAPABILITY`_ call.
+
+
+-----
+
+
+OSD Function Calls
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+OSD_SEND_CMD
+------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: OSD_SEND_CMD
+
+.. code-block:: c
+
+    int ioctl(int fd, int request =3D OSD_SEND_CMD, enum osd_cmd_t *cmd)
+
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Pointer to the location of the structure `osd_cmd_t`_ for this
+          command.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl sends the `OSD_Command`_ to the card.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``EINVAL``
+
+       -  Command is out of range.
+
+
+-----
+
+
+OSD_GET_CAPABILITY
+------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: OSD_GET_CAPABILITY
+
+.. code-block:: c
+
+    int ioctl(int fd, int request =3D OSD_GET_CAPABILITY,
+    struct osd_cap_t *cap)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals ``OSD_GET_CAPABILITY`` for this command.
+
+    -  ..
+
+       -  ``unsigned int *cap``
+
+       -  Pointer to the location of the structure `osd_cap_t`_ for this
+          command.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl is used to get the capabilities of the OSD of the AV7110 based
+DVB-decoder-card in use.
+
+.. note::
+    The structure osd_cap_t has to be setup by the user and passed to the
+    driver.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+
+    -  ..
+
+       -  ``EINVAL``
+
+       -  Unsupported capability.
+
+
+-----
+
+
+open()
+------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    #include <fcntl.h>
+
+.. c:function:: int open(const char *deviceName, int flags)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``const char *deviceName``
+
+       -  Name of specific OSD device.
+
+    -  ..
+
+       -  :rspan:`3` ``int flags``
+
+       -  :cspan:`1` A bit-wise OR of the following flags:
+
+    -  ..
+
+       -  ``O_RDONLY``
+
+       -  read-only access
+
+    -  ..
+
+       -  ``O_RDWR``
+
+       -  read/write access
+
+    -  ..
+
+       -  ``O_NONBLOCK``
+       -  | Open in non-blocking mode
+          | (blocking mode is the default)
+
+Description
+~~~~~~~~~~~
+
+This system call opens a named OSD device (e.g.
+``/dev/dvb/adapter?/osd0``) for subsequent use.
+
+Return Value
+~~~~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``ENODEV``
+
+       -  Device driver not loaded/available.
+
+    -  ..
+
+       -  ``EINTERNAL``
+
+       -  Internal error.
+
+    -  ..
+
+       -  ``EBUSY``
+
+       -  Device or resource busy.
+
+    -  ..
+
+       -  ``EINVAL``
+
+       -  Invalid argument.
+
+
+-----
+
+
+close()
+-------
+
+Synopsis
+~~~~~~~~
+
+.. c:function:: int close(int fd)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_ .
+
+Description
+~~~~~~~~~~~
+
+This system call closes a previously opened OSD device.
+
+Return Value
+~~~~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``EBADF``
+
+       -  fd is not a valid open file descriptor.
=2D-
2.34.0

