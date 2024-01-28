Return-Path: <linux-media+bounces-4298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD3C83FAFE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8736C285B93
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 23:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A145445976;
	Sun, 28 Jan 2024 23:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="R36aYLhQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438F54C60B
	for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 23:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706484832; cv=none; b=Zw/+6lK+RXfui/kWlcs843jY/RSKajsPZP2KQbEd+Lipd74779e845x6Y1EvjtRCRM8NnTANU5+H0DT5xhA81ppsOamkzf2xXqg6T0Pfgg3Ek87NOUuFe7lbjI4PEAmcZyDTpPF2tvWnvdGvh+ETQlSQfd4FLnG83Q+8tGANaxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706484832; c=relaxed/simple;
	bh=ZUU0/xqA2+Wo49XVSEhX2tfar7PAKL2kzDPND/ITHNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BMPrzO2bgeib7FBPOJPs7SW3qfqm9gYT6/UQwsgc0AyZY3ex0r4e15WnWRXDGNcByg493NHjmsoKM3DIgCcK85sYwTioy2sixNxbuf9VbXf5VgUVWEONrXZu08K7opuUjba4F6OJTTy4p02UNPmvgf/edn4CTgen+fZzrDlZw0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=R36aYLhQ; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
	s=s31663417; t=1706484819; x=1707089619; i=herdler@nurfuerspam.de;
	bh=ZUU0/xqA2+Wo49XVSEhX2tfar7PAKL2kzDPND/ITHNQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=R36aYLhQRvvzimrYGRA6e4mfvJgE1m1M9/oSYyJnQa8qT0nG6VFiCf8fnsbUttQB
	 w8zGhdYxb779Dbtl57ds8itF7spw0urEZE4uj4tynZQDApXk9gtNVwXVW7JqjIKbS
	 nd35Hl7JTBIgTLpC3KTUHvD3IDx1ku3HoSdkqPj13bosucs1B/oF5GgPH+KL//Pf2
	 HQZnW4f7iDMiSpbyJUfWChhYxT29a/Mm79Q3u86UHeNXuHl5gKH3Q6Fdlb3eQ+N5d
	 kjptFZFH01kplaLCIU6c3qFBIYMgsCwlT6K2bcxyIwhaQUA/ycs1nF/+VwY8ObJXl
	 ks0HfdEeQg6IQiiIAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.173.202]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE6L-1rnhaC351H-00KglU; Mon, 29
 Jan 2024 00:33:39 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v4 2/6] media: docs: uAPI: dvb/osd: completing the documentation
Date: Mon, 29 Jan 2024 00:32:45 +0100
Message-Id: <20240128233249.32794-3-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240128233249.32794-1-herdler@nurfuerspam.de>
References: <20240128233249.32794-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Txcx335oLuzJX3F/hnAE1qoOfQqiFdPsMoUk1oscrAcbbotqeFx
 6A/ZtHE6qQ62T8zcrZOVpLo5CZ5LUKNdIyGn1TkVqAKLqo6/wVubYOCLyQxTz8e6iwOtlda
 VBGh1/RtcH7p2ERpUFodDgISUO0lMeCjYH4Ea/oRfImbqAdSRbNPpOyjWJzuJURVL3rQnCO
 eGQSkKR5Mp62sfdARgFQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MQx/1gz7rBM=;2HDErCwTdceZSNJBEHMjNnEk3Vo
 fl1DfLPmvVLHOS9OtXvPQc0PhPFoau1Alk8taXBn1qidpyPXy95HdwBquB4rmLF0FvepKmK5q
 ncGo8iLF5xoRa9p/yPkeL6hZpcqfmk7jZbYKVDGEhapKjmBKn9vHrNqOqRG6Ip43WOZArhKIY
 d9ObWTewgn5cDVbOVhET/AZ4oLTPNqCK644d2pyBhmrSg6abaOlifVznzvMjrJ4g/5ehhPf9c
 HdjMyQNFq6FVrx/CrOGh7awe5elyYXbK40bJ4T1N2S9cwQ2TAuoxgALCejeO7ukLzy8inGnDm
 f7wHQARD+3xrZJ+X9JkDJwmapxukZoxyqLo+w62rJR307jvrKqMYkHZemnYA0+ilb75V8qf/5
 08G2FkkXfJSe/yQlbFg6ZQfk13up4OeN1tJWtJgL3XeXGCJFWUlyF+kuKGWdgKv+z6ejF/ahK
 /+zg3uMbAwepB1Xz2hT+bFi4E0EoPrdiYIb+uXl7eg/iL/DCfhT1HCeWc6zCfQEtEkYXbG+Lg
 Q8ksLOmqtL19VFx/W3zEVbsiIvj/UJno1fbVS0uAcStcO9dv4x6tLDmJL9OJ+NB3z40/6OtmA
 k7X51K37qOiGF0YG7LV8sz/sEmR+sQl/eRavrmPALfxI5IHbFRXvusWG3xsl1fzljXpEkYSQY
 y3sdQb5VpNW8h19zkZC+lkGhCYJu9zgysbL/UmO8quvUSZ2KztiZrCCdLwY6cNtez40MOLVIq
 E64L6adZAkWLy5mYpWFElll31irP22X3Np4izS50l5vDkh15WUD8J7x+o47DAPoU1Cc0rE6cV
 w3qvueY/Owt89zX2vrs6v2EqTvrauKwJcbvBDGOvLemLx/y60gHR/cHgAx+j74myWFAiCTIXJ
 Q5a6dsyZUKGpUhRB1cMuMqHjhzN28WqyCHltzcQMkrdk2H0eGfrIUB6lPCCGuftqMT/z8DGaI
 AEhtQ2NqaH1jvvpR28KAch46sUU=

The existing documentation of the legacy DVB Decoder API was incomplete.

Revising the documentation, adding missing parts and arranging the
documentation files new.

This patch contains the documentation of osd.h.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

Changes since v3:
* Adjust title and description to better match existing documentation.


[PATCH v3] ------------------------------------------------------------

Everything is used by the AV7110 driver, except 3 OSD_Commands.
Remarks have been placed there.

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


