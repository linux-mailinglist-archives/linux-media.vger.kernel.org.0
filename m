Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A4537BD05
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 14:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbhELMxD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 08:53:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:52780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231389AbhELMwz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 08:52:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CEA661434;
        Wed, 12 May 2021 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620823902;
        bh=qN4Xto9q7BDAdXgMgIL7kT5vL081HfY6IT10ClR3inc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DGeLH8hN5cv5F/plR/w5nPL2vN/UHSeumvMtO8JYvmtrXodeHPvgDClbohFVfZ5yz
         oCmRFs6m0i4oq5UPCiCL0Nn3pW9eOvhj/2Ekf+yj04zljGP0uQSTkiKAJm70UtGCAZ
         +K+Pslo5TUV4ItKS3qkMMgS8byCGC8WR6a1nvezjJxMbXJVbwz/FmFLhYxPLFoUWyT
         lcMEH/sxAZMsJ9seaR8a6SEncDgW+NHTPAi9v5tjSdZ/PffxRp4LjC40dc7GoiGFfd
         F3IQZGf8nnBpkw8kNQSz0YvKy2peSt8EvSGQa/4BxAIJmhiYgkOK9EeiYFZhWXg1U2
         /kM3pnblXT2iA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lgoKy-0018hp-N4; Wed, 12 May 2021 14:51:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 16/40] docs: userspace-api: media: dvb: Use ASCII subset instead of UTF-8 alternate symbols
Date:   Wed, 12 May 2021 14:50:20 +0200
Message-Id: <ce5783afc7452bfe1eb8d812c18f498cf78d34b1.1620823573.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620823573.git.mchehab+huawei@kernel.org>
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The conversion tools used during DocBook/LaTeX/Markdown->ReST conversion
and some automatic rules which exists on certain text editors like
LibreOffice turned ASCII characters into some UTF-8 alternatives that
are better displayed on html and PDF.

While it is OK to use UTF-8 characters in Linux, it is better to
use the ASCII subset instead of using an UTF-8 equivalent character
as it makes life easier for tools like grep, and are easier to edit
with the some commonly used text/source code editors.

Also, Sphinx already do such conversion automatically outside literal blocks:
   https://docutils.sourceforge.io/docs/user/smartquotes.html

So, replace the occurences of the following UTF-8 characters:

	- U+00a0 (' '): NO-BREAK SPACE
	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK
	- U+201c ('“'): LEFT DOUBLE QUOTATION MARK
	- U+201d ('”'): RIGHT DOUBLE QUOTATION MARK

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/dvb/audio-set-bypass-mode.rst       | 2 +-
 Documentation/userspace-api/media/dvb/audio.rst             | 2 +-
 Documentation/userspace-api/media/dvb/dmx-fopen.rst         | 2 +-
 Documentation/userspace-api/media/dvb/dmx-fread.rst         | 2 +-
 Documentation/userspace-api/media/dvb/dmx-set-filter.rst    | 2 +-
 Documentation/userspace-api/media/dvb/intro.rst             | 6 +++---
 Documentation/userspace-api/media/dvb/video.rst             | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst b/Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst
index ecac02f1b2fc..80d551a2053a 100644
--- a/Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst
@@ -50,7 +50,7 @@ Description
 
 This ioctl call asks the Audio Device to bypass the Audio decoder and
 forward the stream without decoding. This mode shall be used if streams
-that can’t be handled by the Digital TV system shall be decoded. Dolby
+that can't be handled by the Digital TV system shall be decoded. Dolby
 DigitalTM streams are automatically forwarded by the Digital TV subsystem if
 the hardware can handle it.
 
diff --git a/Documentation/userspace-api/media/dvb/audio.rst b/Documentation/userspace-api/media/dvb/audio.rst
index eaae5675a47d..aa753336b31f 100644
--- a/Documentation/userspace-api/media/dvb/audio.rst
+++ b/Documentation/userspace-api/media/dvb/audio.rst
@@ -11,7 +11,7 @@ TV hardware. It can be accessed through ``/dev/dvb/adapter?/audio?``. Data
 types and ioctl definitions can be accessed by including
 ``linux/dvb/audio.h`` in your application.
 
-Please note that some Digital TV cards don’t have their own MPEG decoder, which
+Please note that some Digital TV cards don't have their own MPEG decoder, which
 results in the omission of the audio and video device.
 
 These ioctls were also used by V4L2 to control MPEG decoders implemented
diff --git a/Documentation/userspace-api/media/dvb/dmx-fopen.rst b/Documentation/userspace-api/media/dvb/dmx-fopen.rst
index 8f0a2b831d4a..50b36eb4371e 100644
--- a/Documentation/userspace-api/media/dvb/dmx-fopen.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-fopen.rst
@@ -82,7 +82,7 @@ appropriately.
     :widths: 1 16
 
     -  -  ``EMFILE``
-       -  “Too many open files”, i.e. no more filters available.
+       -  "Too many open files", i.e. no more filters available.
 
 The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/Documentation/userspace-api/media/dvb/dmx-fread.rst b/Documentation/userspace-api/media/dvb/dmx-fread.rst
index 78e9daef595a..88c4cddf7c30 100644
--- a/Documentation/userspace-api/media/dvb/dmx-fread.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-fread.rst
@@ -34,7 +34,7 @@ Description
 
 This system call returns filtered data, which might be section or Packetized
 Elementary Stream (PES) data. The filtered data is transferred from
-the driver’s internal circular buffer to ``buf``. The maximum amount of data
+the driver's internal circular buffer to ``buf``. The maximum amount of data
 to be transferred is implied by count.
 
 .. note::
diff --git a/Documentation/userspace-api/media/dvb/dmx-set-filter.rst b/Documentation/userspace-api/media/dvb/dmx-set-filter.rst
index f43455b7adae..1b8c8071b14f 100644
--- a/Documentation/userspace-api/media/dvb/dmx-set-filter.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-set-filter.rst
@@ -37,7 +37,7 @@ parameters provided. A timeout may be defined stating number of seconds
 to wait for a section to be loaded. A value of 0 means that no timeout
 should be applied. Finally there is a flag field where it is possible to
 state whether a section should be CRC-checked, whether the filter should
-be a ”one-shot” filter, i.e. if the filtering operation should be
+be a "one-shot" filter, i.e. if the filtering operation should be
 stopped after the first section is received, and whether the filtering
 operation should be started immediately (without waiting for a
 :ref:`DMX_START` ioctl call). If a filter was previously set-up, this
diff --git a/Documentation/userspace-api/media/dvb/intro.rst b/Documentation/userspace-api/media/dvb/intro.rst
index a935f3914e56..6784ae79657c 100644
--- a/Documentation/userspace-api/media/dvb/intro.rst
+++ b/Documentation/userspace-api/media/dvb/intro.rst
@@ -107,7 +107,7 @@ Audio and video decoder
       a Systems on a Chip (SoC) integrated circuit.
 
       It may also not be needed for certain usages (e.g. for data-only
-      uses like “internet over satellite”).
+      uses like "internet over satellite").
 
 :ref:`stb_components` shows a crude schematic of the control and data
 flow between those components.
@@ -148,9 +148,9 @@ individual devices are called:
 
 -  ``/dev/dvb/adapterN/caM``,
 
-where ``N`` enumerates the Digital TV cards in a system starting from 0, and
+where ``N`` enumerates the Digital TV cards in a system starting from 0, and
 ``M`` enumerates the devices of each type within each adapter, starting
-from 0, too. We will omit the “``/dev/dvb/adapterN/``\ ” in the further
+from 0, too. We will omit the "``/dev/dvb/adapterN/``\ " in the further
 discussion of these devices.
 
 More details about the data structures and function calls of all the
diff --git a/Documentation/userspace-api/media/dvb/video.rst b/Documentation/userspace-api/media/dvb/video.rst
index 38a8d39a1d25..808705b769a1 100644
--- a/Documentation/userspace-api/media/dvb/video.rst
+++ b/Documentation/userspace-api/media/dvb/video.rst
@@ -16,7 +16,7 @@ stream, not its presentation on the TV or computer screen. On PCs this
 is typically handled by an associated video4linux device, e.g.
 **/dev/video**, which allows scaling and defining output windows.
 
-Some Digital TV cards don’t have their own MPEG decoder, which results in the
+Some Digital TV cards don't have their own MPEG decoder, which results in the
 omission of the audio and video device as well as the video4linux
 device.
 
-- 
2.30.2

