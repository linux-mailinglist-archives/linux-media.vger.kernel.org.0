Return-Path: <linux-media+bounces-4297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623A83FAFD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F18BA285B30
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 23:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAFD45958;
	Sun, 28 Jan 2024 23:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="RnlIHslp"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D874C600
	for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 23:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706484831; cv=none; b=RVKqsRmf748EGCHiq+4xdmSXEjHrQCQQMp7+jZnV+Yl1A+XWAPwtL9j9hjCyo3sXw6xLXU/fZvYx9Cl4RxDc7ljwVeT+9fGcFCVCYm3C5KMlIDi/c23T7s47QQ3z+rmBp5vaYMZs9k5lG+yfE5wxX+1i4N2+24UoU8Uxm0JkiTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706484831; c=relaxed/simple;
	bh=xo4cvtDiz8FLr0yCePVIBe3UgiYnKLx7zPYvTIKtT5c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GjBlh3JGWzAtUrks3FGcrW2wwR30AmQ23FJPTn5EDoMZEQWguZmLYxXsOzlMzSMcnhDJbeMva/aEdd7xhvMAGqLAb44tGG17QBJ7H7zrNwGC2XizK2fJwQNFO8YxEyNsYpf7pFZeFvHQRFqdWBVb3j0Eoi87oIWMs6BZT666soY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=RnlIHslp; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
	s=s31663417; t=1706484819; x=1707089619; i=herdler@nurfuerspam.de;
	bh=xo4cvtDiz8FLr0yCePVIBe3UgiYnKLx7zPYvTIKtT5c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=RnlIHslp+Nokm4pY4BIBLCLX+kFJJPjctcKBFg2aW/HKoSQfk4DUuuHLRdRVXGNV
	 K6tOJfZfQzlFp+Cw8M5UuwE91BVlr5Y1ZlV25DcGCf/dTvpgXaq1ivxwhgwlc6v3/
	 p5nt4xBdk8HCI0juYask61sNwSOmQJEnYREl5z2H82Tg5RKdvdwgWTlx4HyHIn916
	 XrxVTxrc0jc/Y7zFv7oIeT8anL6HNYmaf76G0Uthaom9kz9vfWxNIakSN8MCDXc24
	 T4AZl/GaMmAs1rQTohA0N5/AeXGMatk7pjjD8BY6gHuneyrowO/hacsfUi+onHbKx
	 ztegyYx2YP/1lnw5QA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.173.202]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlT2-1qkPn329R8-00jrzp; Mon, 29
 Jan 2024 00:33:39 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v4 1/6] media: docs: uAPI: dvb/decoder: completing the documentation
Date: Mon, 29 Jan 2024 00:32:44 +0100
Message-Id: <20240128233249.32794-2-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:m4+IjJ+Ynul1hOOmRta+B0c5JBstIE9zWbmDx7Bm2RXpWGfvK3v
 3lCFZwlQrfkfNrNi/3Ww36QtUCV/X4cbP09CH4rdrQWuuisJmyQARBtmpf1W1yv2VjX6kPZ
 IfBGJnSkfH5XE8wuXsDzr3n/Dym5fyHL5Z7DnZZCDnHPvzwuC/6Kb5FtvZEITYw22FhBnk0
 yHVN20bpf0ngurshBHgcw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cTiWOuk5BPQ=;wJdVT7tKp9NiYSqQe7YplpbCH8h
 QTv3zAj09BrwRbffJcVQJBhXgod9mp9Dtyz7NVCVxBf88q/qtxj9MCxrP+uJ9LT7EO/sv9tNj
 L9sDG5ygcOJieAdxJapUS2bO4PowVhD0PZeos6uEwr+0QTXJO2v8niALpwr08JPKlZ+Zy0Rtp
 E7QWILfqyoVkaC7Gx0+5d8Ll64TSX2/tjztt2r4LIZ6lVK/oifZYjb2VQWV/r/hIrgB2nNKgJ
 wzOPQyjSJ+JFWuHWNut4piot5B74lEJ6PBDrrp5u62SpDzZ8V+zDfCzoOO2Ddbd9gq5W+QdIa
 wMYjECBpB3G8o2WzDRwa0lKy6x+UFmNhkl+KtC/jYypaQAi+7d5bYWb1PYUefJys9oITPoyE7
 a1loL9UV6widkx1AiY6sjfwYhxoJfhuion6fuDRCn8vraPMr5stSWBVnwbcBIbbLnMYG/covT
 wGuPMnlZHAcJHbD5GD9tQ63UHINHLa5TqWTMW6mswD2mQz5QVKYGEG+GKbtqHdfh77pXSdO9u
 uYyPAbHEyANMvihVjv8porycR0FRRvcrLse/t5cfO5d3J/OmGYIw41lUc4FFoIQFALVISFohS
 L8O8JNIeA6ut8PLRajl3ID1nNHlS7KW1NyNhu9lEZE4EHvo9pWc8eNQTga1yauJHQaGn/cE5n
 JK5h1m+HntP2wO448nGBKqOgkwNpcI4JJMJypTRGrmnjun96jAKtgJhQR9bvMYaVDnOpXG90i
 3OS/mkACl1LuaSH5JkeayKIS0o3E44i4QEviiQW9tMHAUxnn+OmSgzs+UJR4p7z1sufCzqTyn
 rk7dQnK+NOUq3zedYTr1KizsLLDfoRylxPSRzgkvm9ZUW1iCHRDpBqGcad/cREShVLjd2wnpH
 GVzFlaNtgWdnHCUebQoGaU6D/PRliMKD9J0mFgms00eBcWdLMQMqTUiSstf0VnpgtsIbgDR+J
 ChJIVuCfXrb1TR3AkgRXpTOJ/5E=

The existing documentation of the legacy DVB Decoder API was incomplete.

Revising the documentation, adding missing parts and arranging the
documentation files new.

This patch contains the new index file and links to it.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

Changes since v3:
* Adjust title and description to better match existing documentation.


[PATCH v3] ------------------------------------------------------------


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


