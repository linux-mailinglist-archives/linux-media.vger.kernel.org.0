Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323E02780A4
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 08:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbgIYGaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 02:30:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:57596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727143AbgIYGax (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 02:30:53 -0400
Received: from mail.kernel.org (ip5f5ad5bf.dynamic.kabel-deutschland.de [95.90.213.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D3FA238A0;
        Fri, 25 Sep 2020 06:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601015452;
        bh=zJOxucCXGY+/g1Zhqy7+Iy3zmsjOu4tR8o67hpj1+5I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lsYyWqZa7y7wXiGe7socT66ILOURtbU7poM4PG1HiYho0xp81v8N/4Z4FT4YBeJHo
         TNOvrHFkbbhAu4XVeCuddl/TaPR+ff0Fo+JpKIcCE5wSmq40BDtG2cUU6OGM0kM0Y9
         +7x0RlcfCQmEkuosdbJA6QYU6oP98QJbezWDkNOE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kLhFo-000R4u-6m; Fri, 25 Sep 2020 08:30:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3 8/8] media: docs: make RC documents more compatible with Sphinx 3.1+
Date:   Fri, 25 Sep 2020 08:30:46 +0200
Message-Id: <640bd982e40af548f916268ce01e17123e88f855.1601014299.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601014299.git.mchehab+huawei@kernel.org>
References: <cover.1601014299.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sphinx 3.x broke support for the cdomain.py extension, as the
c domain code was rewritten. Due to that, the c tags need to
be re-written, in order to use the new c domain notation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/rc/lirc-get-features.rst   |  9 ++++-----
 .../userspace-api/media/rc/lirc-get-rec-mode.rst   | 12 +++++++-----
 .../media/rc/lirc-get-rec-resolution.rst           |  8 ++++----
 .../userspace-api/media/rc/lirc-get-send-mode.rst  | 14 +++++++-------
 .../userspace-api/media/rc/lirc-get-timeout.rst    | 13 +++++++------
 Documentation/userspace-api/media/rc/lirc-read.rst | 10 +++-------
 .../media/rc/lirc-set-measure-carrier-mode.rst     |  8 ++++----
 .../media/rc/lirc-set-rec-carrier-range.rst        |  6 ++++--
 .../media/rc/lirc-set-rec-carrier.rst              |  8 ++++----
 .../media/rc/lirc-set-rec-timeout-reports.rst      |  8 ++++----
 .../media/rc/lirc-set-rec-timeout.rst              | 13 +++++++------
 .../media/rc/lirc-set-send-carrier.rst             |  8 ++++----
 .../media/rc/lirc-set-send-duty-cycle.rst          |  8 ++++----
 .../media/rc/lirc-set-transmitter-mask.rst         |  8 ++++----
 .../media/rc/lirc-set-wideband-receiver.rst        |  8 ++++----
 .../userspace-api/media/rc/lirc-write.rst          |  7 ++-----
 16 files changed, 73 insertions(+), 75 deletions(-)

diff --git a/Documentation/userspace-api/media/rc/lirc-get-features.rst b/Documentation/userspace-api/media/rc/lirc-get-features.rst
index 6846ae99848c..66a243dbd437 100644
--- a/Documentation/userspace-api/media/rc/lirc-get-features.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-features.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_get_features:
 
@@ -14,8 +15,9 @@ LIRC_GET_FEATURES - Get the underlying hardware device's features
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_GET_FEATURES, __u32 *features)
-    :name: LIRC_GET_FEATURES
+.. c:macro:: LIRC_GET_FEATURES
+
+``int ioctl(int fd, LIRC_GET_FEATURES, __u32 *features)``
 
 Arguments
 =========
@@ -26,11 +28,9 @@ Arguments
 ``features``
     Bitmask with the LIRC features.
 
-
 Description
 ===========
 
-
 Get the underlying hardware device's features. If a driver does not
 announce support of certain features, calling of the corresponding ioctls
 is undefined.
@@ -184,7 +184,6 @@ LIRC features
 
     Unused. Kept just to avoid breaking uAPI.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/rc/lirc-get-rec-mode.rst b/Documentation/userspace-api/media/rc/lirc-get-rec-mode.rst
index e8f397a87331..188478ed1233 100644
--- a/Documentation/userspace-api/media/rc/lirc-get-rec-mode.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-rec-mode.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_get_rec_mode:
 .. _lirc_set_rec_mode:
@@ -15,11 +16,13 @@ LIRC_GET_REC_MODE/LIRC_SET_REC_MODE - Get/set current receive mode.
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_GET_REC_MODE, __u32 *mode)
-	:name: LIRC_GET_REC_MODE
+.. c:macro:: LIRC_GET_REC_MODE
 
-.. c:function:: int ioctl( int fd, LIRC_SET_REC_MODE, __u32 *mode)
-	:name: LIRC_SET_REC_MODE
+``int ioctl(int fd, LIRC_GET_REC_MODE, __u32 *mode)``
+
+.. c:macro:: LIRC_SET_REC_MODE
+
+``int ioctl(int fd, LIRC_SET_REC_MODE, __u32 *mode)``
 
 Arguments
 =========
@@ -47,7 +50,6 @@ Return Value
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``ENODEV``
diff --git a/Documentation/userspace-api/media/rc/lirc-get-rec-resolution.rst b/Documentation/userspace-api/media/rc/lirc-get-rec-resolution.rst
index 3f08aa7c24a9..e29445c5ce16 100644
--- a/Documentation/userspace-api/media/rc/lirc-get-rec-resolution.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-rec-resolution.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_get_rec_resolution:
 
@@ -14,8 +15,9 @@ LIRC_GET_REC_RESOLUTION - Obtain the value of receive resolution, in microsecond
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_GET_REC_RESOLUTION, __u32 *microseconds)
-    :name: LIRC_GET_REC_RESOLUTION
+.. c:macro:: LIRC_GET_REC_RESOLUTION
+
+``int ioctl(int fd, LIRC_GET_REC_RESOLUTION, __u32 *microseconds)``
 
 Arguments
 =========
@@ -26,7 +28,6 @@ Arguments
 ``microseconds``
     Resolution, in microseconds.
 
-
 Description
 ===========
 
@@ -38,7 +39,6 @@ This ioctl returns the integer value with such resolution, with can be
 used by userspace applications like lircd to automatically adjust the
 tolerance value.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/rc/lirc-get-send-mode.rst b/Documentation/userspace-api/media/rc/lirc-get-send-mode.rst
index f93b30c92193..77472fb5608a 100644
--- a/Documentation/userspace-api/media/rc/lirc-get-send-mode.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-send-mode.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_get_send_mode:
 .. _lirc_set_send_mode:
@@ -15,11 +16,13 @@ LIRC_GET_SEND_MODE/LIRC_SET_SEND_MODE - Get/set current transmit mode.
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_GET_SEND_MODE, __u32 *mode )
-    :name: LIRC_GET_SEND_MODE
+.. c:macro:: LIRC_GET_SEND_MODE
 
-.. c:function:: int ioctl( int fd, LIRC_SET_SEND_MODE, __u32 *mode )
-    :name: LIRC_SET_SEND_MODE
+``int ioctl(int fd, LIRC_GET_SEND_MODE, __u32 *mode)``
+
+.. c:macro:: LIRC_SET_SEND_MODE
+
+``int ioctl(int fd, LIRC_SET_SEND_MODE, __u32 *mode)``
 
 Arguments
 =========
@@ -30,7 +33,6 @@ Arguments
 ``mode``
     The mode used for transmitting.
 
-
 Description
 ===========
 
@@ -44,14 +46,12 @@ modes the driver supports.
 Return Value
 ============
 
-
 .. tabularcolumns:: |p{2.5cm}|p{15.0cm}|
 
 .. flat-table::
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``ENODEV``
diff --git a/Documentation/userspace-api/media/rc/lirc-get-timeout.rst b/Documentation/userspace-api/media/rc/lirc-get-timeout.rst
index ec191a383d75..f5f3e06d6206 100644
--- a/Documentation/userspace-api/media/rc/lirc-get-timeout.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-timeout.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_get_min_timeout:
 .. _lirc_get_max_timeout:
@@ -16,11 +17,13 @@ range for IR receive.
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_GET_MIN_TIMEOUT, __u32 *timeout)
-    :name: LIRC_GET_MIN_TIMEOUT
+.. c:macro:: LIRC_GET_MIN_TIMEOUT
 
-.. c:function:: int ioctl( int fd, LIRC_GET_MAX_TIMEOUT, __u32 *timeout)
-    :name: LIRC_GET_MAX_TIMEOUT
+``int ioctl(int fd, LIRC_GET_MIN_TIMEOUT, __u32 *timeout)``
+
+.. c:macro:: LIRC_GET_MAX_TIMEOUT
+
+``int ioctl(int fd, LIRC_GET_MAX_TIMEOUT, __u32 *timeout)``
 
 Arguments
 =========
@@ -31,7 +34,6 @@ Arguments
 ``timeout``
     Timeout, in microseconds.
 
-
 Description
 ===========
 
@@ -47,7 +49,6 @@ that can be set.
    both ioctls will return the same value even though the timeout
    cannot be changed via :ref:`LIRC_SET_REC_TIMEOUT`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/rc/lirc-read.rst b/Documentation/userspace-api/media/rc/lirc-read.rst
index b94a349bd99e..d589560214f4 100644
--- a/Documentation/userspace-api/media/rc/lirc-read.rst
+++ b/Documentation/userspace-api/media/rc/lirc-read.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc-read:
 
@@ -11,7 +12,6 @@ Name
 
 lirc-read - Read from a LIRC device
 
-
 Synopsis
 ========
 
@@ -19,10 +19,7 @@ Synopsis
 
     #include <unistd.h>
 
-
 .. c:function:: ssize_t read( int fd, void *buf, size_t count )
-    :name: lirc-read
-
 
 Arguments
 =========
@@ -39,9 +36,9 @@ Arguments
 Description
 ===========
 
-:ref:`read() <lirc-read>` attempts to read up to ``count`` bytes from file
+:c:func:`read()` attempts to read up to ``count`` bytes from file
 descriptor ``fd`` into the buffer starting at ``buf``.  If ``count`` is zero,
-:ref:`read() <lirc-read>` returns zero and has no other results. If ``count``
+:c:func:`read()` returns zero and has no other results. If ``count``
 is greater than ``SSIZE_MAX``, the result is unspecified.
 
 The exact format of the data depends on what :ref:`lirc_modes` a driver
@@ -59,7 +56,6 @@ by hardware decoders. The :c:type:`rc_proto` member is set to the
 used for transmission, and ``scancode`` to the decoded scancode,
 and the ``keycode`` set to the keycode or ``KEY_RESERVED``.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/rc/lirc-set-measure-carrier-mode.rst b/Documentation/userspace-api/media/rc/lirc-set-measure-carrier-mode.rst
index 820d6bf28c1c..9bf9811a905a 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-measure-carrier-mode.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-measure-carrier-mode.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_set_measure_carrier_mode:
 
@@ -14,8 +15,9 @@ LIRC_SET_MEASURE_CARRIER_MODE - enable or disable measure mode
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_SET_MEASURE_CARRIER_MODE, __u32 *enable )
-    :name: LIRC_SET_MEASURE_CARRIER_MODE
+.. c:macro:: LIRC_SET_MEASURE_CARRIER_MODE
+
+``int ioctl(int fd, LIRC_SET_MEASURE_CARRIER_MODE, __u32 *enable)``
 
 Arguments
 =========
@@ -27,7 +29,6 @@ Arguments
     enable = 1 means enable measure mode, enable = 0 means disable measure
     mode.
 
-
 Description
 ===========
 
@@ -37,7 +38,6 @@ Enable or disable measure mode. If enabled, from the next key
 press on, the driver will send ``LIRC_MODE2_FREQUENCY`` packets. By
 default this should be turned off.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/rc/lirc-set-rec-carrier-range.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-carrier-range.rst
index e33e6a320b7a..530bc223930a 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-rec-carrier-range.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-rec-carrier-range.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_set_rec_carrier_range:
 
@@ -15,8 +16,9 @@ IR receive.
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_SET_REC_CARRIER_RANGE, __u32 *frequency )
-    :name: LIRC_SET_REC_CARRIER_RANGE
+.. c:macro:: LIRC_SET_REC_CARRIER_RANGE
+
+``int ioctl(int fd, LIRC_SET_REC_CARRIER_RANGE, __u32 *frequency)``
 
 Arguments
 =========
diff --git a/Documentation/userspace-api/media/rc/lirc-set-rec-carrier.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-carrier.rst
index a6784d5e59c8..28c928f1cc14 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-rec-carrier.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-rec-carrier.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_set_rec_carrier:
 
@@ -11,12 +12,12 @@ Name
 
 LIRC_SET_REC_CARRIER - Set carrier used to modulate IR receive.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_SET_REC_CARRIER, __u32 *frequency )
-    :name: LIRC_SET_REC_CARRIER
+.. c:macro:: LIRC_SET_REC_CARRIER
+
+``int ioctl(int fd, LIRC_SET_REC_CARRIER, __u32 *frequency)``
 
 Arguments
 =========
@@ -37,7 +38,6 @@ Set receive carrier used to modulate IR PWM pulses and spaces.
    If called together with :ref:`LIRC_SET_REC_CARRIER_RANGE`, this ioctl
    sets the upper bound frequency that will be recognized by the device.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst
index 55be65df7d5a..83e7155c5796 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout-reports.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_set_rec_timeout_reports:
 
@@ -14,8 +15,9 @@ LIRC_SET_REC_TIMEOUT_REPORTS - enable or disable timeout reports for IR receive
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_SET_REC_TIMEOUT_REPORTS, __u32 *enable )
-    :name: LIRC_SET_REC_TIMEOUT_REPORTS
+.. c:macro:: LIRC_SET_REC_TIMEOUT_REPORTS
+
+``int ioctl(int fd, LIRC_SET_REC_TIMEOUT_REPORTS, __u32 *enable)``
 
 Arguments
 =========
@@ -27,7 +29,6 @@ Arguments
     enable = 1 means enable timeout report, enable = 0 means disable timeout
     reports.
 
-
 Description
 ===========
 
@@ -40,7 +41,6 @@ should be turned off.
 
    This ioctl is only valid for :ref:`LIRC_MODE_MODE2 <lirc-mode-mode2>`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/rc/lirc-set-rec-timeout.rst b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout.rst
index e91a0daecde6..8f3f9adf54ab 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-rec-timeout.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-rec-timeout.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_set_rec_timeout:
 .. _lirc_get_rec_timeout:
@@ -15,11 +16,13 @@ LIRC_GET_REC_TIMEOUT/LIRC_SET_REC_TIMEOUT - Get/set the integer value for IR ina
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_GET_REC_TIMEOUT, __u32 *timeout )
-    :name: LIRC_GET_REC_TIMEOUT
+.. c:macro:: LIRC_GET_REC_TIMEOUT
 
-.. c:function:: int ioctl( int fd, LIRC_SET_REC_TIMEOUT, __u32 *timeout )
-    :name: LIRC_SET_REC_TIMEOUT
+``int ioctl(int fd, LIRC_GET_REC_TIMEOUT, __u32 *timeout)``
+
+.. c:macro:: LIRC_SET_REC_TIMEOUT
+
+``int ioctl(int fd, LIRC_SET_REC_TIMEOUT, __u32 *timeout)``
 
 Arguments
 =========
@@ -30,7 +33,6 @@ Arguments
 ``timeout``
     Timeout, in microseconds.
 
-
 Description
 ===========
 
@@ -45,7 +47,6 @@ given value should be set.
 
    The range of supported timeout is given by :ref:`LIRC_GET_MIN_TIMEOUT`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/rc/lirc-set-send-carrier.rst b/Documentation/userspace-api/media/rc/lirc-set-send-carrier.rst
index e199aac7d8e0..e3810ba58746 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-send-carrier.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-send-carrier.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_set_send_carrier:
 
@@ -11,12 +12,12 @@ Name
 
 LIRC_SET_SEND_CARRIER - Set send carrier used to modulate IR TX.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_SET_SEND_CARRIER, __u32 *frequency )
-    :name: LIRC_SET_SEND_CARRIER
+.. c:macro:: LIRC_SET_SEND_CARRIER
+
+``int ioctl(int fd, LIRC_SET_SEND_CARRIER, __u32 *frequency)``
 
 Arguments
 =========
@@ -32,7 +33,6 @@ Description
 
 Set send carrier used to modulate IR PWM pulses and spaces.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst b/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst
index a9074f4fb058..52a072529af9 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_set_send_duty_cycle:
 
@@ -15,8 +16,9 @@ IR transmit.
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_SET_SEND_DUTY_CYCLE, __u32 *duty_cycle)
-    :name: LIRC_SET_SEND_DUTY_CYCLE
+.. c:macro:: LIRC_SET_SEND_DUTY_CYCLE
+
+``int ioctl(int fd, LIRC_SET_SEND_DUTY_CYCLE, __u32 *duty_cycle)``
 
 Arguments
 =========
@@ -28,7 +30,6 @@ Arguments
     Duty cicle, describing the pulse width in percent (from 1 to 99) of
     the total cycle. Values 0 and 100 are reserved.
 
-
 Description
 ===========
 
@@ -38,7 +39,6 @@ Currently, no special meaning is defined for 0 or 100, but this
 could be used to switch off carrier generation in the future, so
 these values should be reserved.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/rc/lirc-set-transmitter-mask.rst b/Documentation/userspace-api/media/rc/lirc-set-transmitter-mask.rst
index 1f5527427281..68f4cc2e3ae3 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-transmitter-mask.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-transmitter-mask.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_set_transmitter_mask:
 
@@ -14,8 +15,9 @@ LIRC_SET_TRANSMITTER_MASK - Enables send codes on a given set of transmitters
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_SET_TRANSMITTER_MASK, __u32 *mask )
-    :name: LIRC_SET_TRANSMITTER_MASK
+.. c:macro:: LIRC_SET_TRANSMITTER_MASK
+
+``int ioctl(int fd, LIRC_SET_TRANSMITTER_MASK, __u32 *mask)``
 
 Arguments
 =========
@@ -26,7 +28,6 @@ Arguments
 ``mask``
     Mask with channels to enable tx. Channel 0 is the least significant bit.
 
-
 Description
 ===========
 
@@ -42,7 +43,6 @@ When an invalid bit mask is given, i.e. a bit is set, even though the device
 does not have so many transitters, then this ioctl returns the number of
 available transitters and does nothing otherwise.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/rc/lirc-set-wideband-receiver.rst b/Documentation/userspace-api/media/rc/lirc-set-wideband-receiver.rst
index 2c43b620b3f3..be5321c4a91f 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-wideband-receiver.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-wideband-receiver.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc_set_wideband_receiver:
 
@@ -14,8 +15,9 @@ LIRC_SET_WIDEBAND_RECEIVER - enable wide band receiver.
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, LIRC_SET_WIDEBAND_RECEIVER, __u32 *enable )
-    :name: LIRC_SET_WIDEBAND_RECEIVER
+.. c:macro:: LIRC_SET_WIDEBAND_RECEIVER
+
+``int ioctl(int fd, LIRC_SET_WIDEBAND_RECEIVER, __u32 *enable)``
 
 Arguments
 =========
@@ -27,7 +29,6 @@ Arguments
     enable = 1 means enable wideband receiver, enable = 0 means disable
     wideband receiver.
 
-
 Description
 ===========
 
@@ -47,7 +48,6 @@ reduced range of reception.
     carrier reports. Trying to disable wide band receiver while carrier
     reports are active will do nothing.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/rc/lirc-write.rst b/Documentation/userspace-api/media/rc/lirc-write.rst
index 421de2cfa4ca..c1c3230d4fd6 100644
--- a/Documentation/userspace-api/media/rc/lirc-write.rst
+++ b/Documentation/userspace-api/media/rc/lirc-write.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: RC
 
 .. _lirc-write:
 
@@ -11,7 +12,6 @@ Name
 
 lirc-write - Write to a LIRC device
 
-
 Synopsis
 ========
 
@@ -19,9 +19,7 @@ Synopsis
 
     #include <unistd.h>
 
-
 .. c:function:: ssize_t write( int fd, void *buf, size_t count )
-    :name: lirc-write
 
 Arguments
 =========
@@ -38,7 +36,7 @@ Arguments
 Description
 ===========
 
-:ref:`write() <lirc-write>` writes up to ``count`` bytes to the device
+:c:func:`write()` writes up to ``count`` bytes to the device
 referenced by the file descriptor ``fd`` from the buffer starting at
 ``buf``.
 
@@ -64,7 +62,6 @@ for the protocol or the scancode is not valid for the specified protocol,
 ``EINVAL`` is returned. The write function blocks until the scancode
 is transmitted by the hardware.
 
-
 Return Value
 ============
 
-- 
2.26.2

