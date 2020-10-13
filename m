Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F050528CDA6
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 14:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbgJMMBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 08:01:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:57642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727382AbgJMLym (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:42 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F012221FC;
        Tue, 13 Oct 2020 11:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590080;
        bh=LwOArSpTP20nI9G50WhOo2j8DQQMKkmQjlArryB8tsI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GtGL42a88FpGiy7LoOTljy0FuZL9Ckniowjgu7JIAKVbBJVss8gXbWEakjNwps0nn
         ++0Ivv8t/6QID1ST/6Qo/yOiqfT2tfn3H4/qHgfxSAdE4rEfGoXqTWTo9IfG6ADBV0
         cYesEt72isPy4At/2EX8VmDkNne62GGO7k4VuWTQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt3-006CTn-Hg; Tue, 13 Oct 2020 13:54:37 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v6 16/80] media: docs: make CEC documents compatible with Sphinx 3.1+
Date:   Tue, 13 Oct 2020 13:53:31 +0200
Message-Id: <13cf74a294fc1e7302da045bb8b2ba8c84ce12a3.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
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
 .../media/cec/cec-func-close.rst              | 10 +++-------
 .../media/cec/cec-func-ioctl.rst              | 11 ++++------
 .../userspace-api/media/cec/cec-func-open.rst | 10 +++-------
 .../userspace-api/media/cec/cec-func-poll.rst | 14 +++++--------
 .../media/cec/cec-ioc-adap-g-caps.rst         | 10 +++++-----
 .../media/cec/cec-ioc-adap-g-conn-info.rst    | 11 +++++-----
 .../media/cec/cec-ioc-adap-g-log-addrs.rst    | 20 ++++++++-----------
 .../media/cec/cec-ioc-adap-g-phys-addr.rst    | 15 +++++++-------
 .../media/cec/cec-ioc-dqevent.rst             | 15 +++++---------
 .../media/cec/cec-ioc-g-mode.rst              | 16 +++++++--------
 .../media/cec/cec-ioc-receive.rst             | 18 ++++++++---------
 11 files changed, 63 insertions(+), 87 deletions(-)

diff --git a/Documentation/userspace-api/media/cec/cec-func-close.rst b/Documentation/userspace-api/media/cec/cec-func-close.rst
index 33c563f414a8..409e70a5f80f 100644
--- a/Documentation/userspace-api/media/cec/cec-func-close.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-close.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: CEC
 
 .. _cec-func-close:
 
@@ -11,7 +12,6 @@ Name
 
 cec-close - Close a cec device
 
-
 Synopsis
 ========
 
@@ -19,16 +19,13 @@ Synopsis
 
     #include <unistd.h>
 
-
 .. c:function:: int close( int fd )
-    :name: cec-close
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
-
+    File descriptor returned by :c:func:`open()`.
 
 Description
 ===========
@@ -36,11 +33,10 @@ Description
 Closes the cec device. Resources associated with the file descriptor are
 freed. The device configuration remain unchanged.
 
-
 Return Value
 ============
 
-:c:func:`close() <cec-close>` returns 0 on success. On error, -1 is returned, and
+:c:func:`close()` returns 0 on success. On error, -1 is returned, and
 ``errno`` is set appropriately. Possible error codes are:
 
 ``EBADF``
diff --git a/Documentation/userspace-api/media/cec/cec-func-ioctl.rst b/Documentation/userspace-api/media/cec/cec-func-ioctl.rst
index 3b88230fad80..7c93f86de6cc 100644
--- a/Documentation/userspace-api/media/cec/cec-func-ioctl.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-ioctl.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: CEC
 
 .. _cec-func-ioctl:
 
@@ -18,15 +19,13 @@ Synopsis
 
     #include <sys/ioctl.h>
 
-
-.. c:function:: int ioctl( int fd, int request, void *argp )
-   :name: cec-ioctl
+``int ioctl(int fd, int request, void *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``request``
     CEC ioctl request code as defined in the cec.h header file, for
@@ -35,11 +34,10 @@ Arguments
 ``argp``
     Pointer to a request-specific structure.
 
-
 Description
 ===========
 
-The :c:func:`ioctl() <cec-ioctl>` function manipulates cec device parameters. The
+The :c:func:`ioctl()` function manipulates cec device parameters. The
 argument ``fd`` must be an open file descriptor.
 
 The ioctl ``request`` code specifies the cec function to be called. It
@@ -51,7 +49,6 @@ their parameters are located in the cec.h header file. All cec ioctl
 requests, their respective function and parameters are specified in
 :ref:`cec-user-func`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/cec/cec-func-open.rst b/Documentation/userspace-api/media/cec/cec-func-open.rst
index 887bfd2a755e..d86563a34b9e 100644
--- a/Documentation/userspace-api/media/cec/cec-func-open.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-open.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: CEC
 
 .. _cec-func-open:
 
@@ -18,10 +19,7 @@ Synopsis
 
     #include <fcntl.h>
 
-
 .. c:function:: int open( const char *device_name, int flags )
-   :name: cec-open
-
 
 Arguments
 =========
@@ -42,11 +40,10 @@ Arguments
 
     Other flags have no effect.
 
-
 Description
 ===========
 
-To open a cec device applications call :c:func:`open() <cec-open>` with the
+To open a cec device applications call :c:func:`open()` with the
 desired device name. The function has no side effects; the device
 configuration remain unchanged.
 
@@ -54,11 +51,10 @@ When the device is opened in read-only mode, attempts to modify its
 configuration will result in an error, and ``errno`` will be set to
 EBADF.
 
-
 Return Value
 ============
 
-:c:func:`open() <cec-open>` returns the new file descriptor on success. On error,
+:c:func:`open()` returns the new file descriptor on success. On error,
 -1 is returned, and ``errno`` is set appropriately. Possible error codes
 include:
 
diff --git a/Documentation/userspace-api/media/cec/cec-func-poll.rst b/Documentation/userspace-api/media/cec/cec-func-poll.rst
index 2d87136e9a3f..980bbfc0bcce 100644
--- a/Documentation/userspace-api/media/cec/cec-func-poll.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-poll.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: CEC
 
 .. _cec-func-poll:
 
@@ -11,7 +12,6 @@ Name
 
 cec-poll - Wait for some event on a file descriptor
 
-
 Synopsis
 ========
 
@@ -19,9 +19,7 @@ Synopsis
 
     #include <sys/poll.h>
 
-
 .. c:function:: int poll( struct pollfd *ufds, unsigned int nfds, int timeout )
-   :name: cec-poll
 
 Arguments
 =========
@@ -35,14 +33,13 @@ Arguments
 ``timeout``
    Timeout to wait for events
 
-
 Description
 ===========
 
-With the :c:func:`poll() <cec-poll>` function applications can wait for CEC
+With the :c:func:`poll()` function applications can wait for CEC
 events.
 
-On success :c:func:`poll() <cec-poll>` returns the number of file descriptors
+On success :c:func:`poll()` returns the number of file descriptors
 that have been selected (that is, file descriptors for which the
 ``revents`` field of the respective struct :c:type:`pollfd`
 is non-zero). CEC devices set the ``POLLIN`` and ``POLLRDNORM`` flags in
@@ -53,13 +50,12 @@ then the ``POLLPRI`` flag is set. When the function times out it returns
 a value of zero, on failure it returns -1 and the ``errno`` variable is
 set appropriately.
 
-For more details see the :c:func:`poll() <cec-poll>` manual page.
-
+For more details see the :c:func:`poll()` manual page.
 
 Return Value
 ============
 
-On success, :c:func:`poll() <cec-poll>` returns the number structures which have
+On success, :c:func:`poll()` returns the number structures which have
 non-zero ``revents`` fields, or zero if the call timed out. On error -1
 is returned, and the ``errno`` variable is set appropriately:
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
index 7f25365ce0fb..c7309a2fcbce 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: CEC
 
 .. _CEC_ADAP_G_CAPS:
 
@@ -14,18 +15,18 @@ CEC_ADAP_G_CAPS - Query device capabilities
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_G_CAPS, struct cec_caps *argp )
-    :name: CEC_ADAP_G_CAPS
+.. c:macro:: CEC_ADAP_G_CAPS
+
+``int ioctl(int fd, CEC_ADAP_G_CAPS, struct cec_caps *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
 
-
 Description
 ===========
 
@@ -62,7 +63,6 @@ returns the information to the application. The ioctl never fails.
       - CEC Framework API version, formatted with the ``KERNEL_VERSION()``
 	macro.
 
-
 .. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.6cm}|
 
 .. _cec-capabilities:
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
index 6818ddf1495c..13116b0b5c17 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
@@ -2,6 +2,8 @@
 ..
 .. Copyright 2019 Google LLC
 ..
+.. c:namespace:: CEC
+
 .. _CEC_ADAP_G_CONNECTOR_INFO:
 
 *******************************
@@ -16,18 +18,18 @@ CEC_ADAP_G_CONNECTOR_INFO - Query HDMI connector information
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_G_CONNECTOR_INFO, struct cec_connector_info *argp )
-    :name: CEC_ADAP_G_CONNECTOR_INFO
+.. c:macro:: CEC_ADAP_G_CONNECTOR_INFO
+
+``int ioctl(int fd, CEC_ADAP_G_CONNECTOR_INFO, struct cec_connector_info *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
 
-
 Description
 ===========
 
@@ -57,7 +59,6 @@ is only available if the ``CEC_CAP_CONNECTOR_INFO`` capability is set.
     * - }
       -
 
-
 .. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.6cm}|
 
 .. _connector-type:
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
index 1ca893270ae9..c760c07b6b3f 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: CEC
 
 .. _CEC_ADAP_LOG_ADDRS:
 .. _CEC_ADAP_G_LOG_ADDRS:
@@ -13,21 +14,22 @@ Name
 
 CEC_ADAP_G_LOG_ADDRS, CEC_ADAP_S_LOG_ADDRS - Get or set the logical addresses
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_G_LOG_ADDRS, struct cec_log_addrs *argp )
-   :name: CEC_ADAP_G_LOG_ADDRS
+.. c:macro:: CEC_ADAP_G_LOG_ADDRS
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_S_LOG_ADDRS, struct cec_log_addrs *argp )
-   :name: CEC_ADAP_S_LOG_ADDRS
+``int ioctl(int fd, CEC_ADAP_G_LOG_ADDRS, struct cec_log_addrs *argp)``
+
+.. c:macro:: CEC_ADAP_S_LOG_ADDRS
+
+``int ioctl(int fd, CEC_ADAP_S_LOG_ADDRS, struct cec_log_addrs *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`cec_log_addrs`.
@@ -148,7 +150,6 @@ logical address types are already defined will return with error ``EBUSY``.
         give the CEC framework more information about the device type, even
         though the framework won't use it directly in the CEC message.
 
-
 .. tabularcolumns:: |p{7.8cm}|p{1.0cm}|p{8.7cm}|
 
 .. _cec-log-addrs-flags:
@@ -185,7 +186,6 @@ logical address types are already defined will return with error ``EBUSY``.
 
 	All other messages are ignored.
 
-
 .. tabularcolumns:: |p{7.8cm}|p{1.0cm}|p{8.7cm}|
 
 .. _cec-versions:
@@ -211,7 +211,6 @@ logical address types are already defined will return with error ``EBUSY``.
       - 6
       - CEC version according to the HDMI 2.0 standard.
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _cec-prim-dev-types:
@@ -257,7 +256,6 @@ logical address types are already defined will return with error ``EBUSY``.
       - 7
       - Use for a video processor device.
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _cec-log-addr-types:
@@ -306,7 +304,6 @@ logical address types are already defined will return with error ``EBUSY``.
 	Control).
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _cec-all-dev-types-flags:
@@ -348,7 +345,6 @@ logical address types are already defined will return with error ``EBUSY``.
       - This supports the CEC Switch or Video Processing type.
 
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst
index a10443be1b26..fb22f6894f26 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: CEC
 
 .. _CEC_ADAP_PHYS_ADDR:
 .. _CEC_ADAP_G_PHYS_ADDR:
@@ -13,21 +14,22 @@ Name
 
 CEC_ADAP_G_PHYS_ADDR, CEC_ADAP_S_PHYS_ADDR - Get or set the physical address
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_G_PHYS_ADDR, __u16 *argp )
-    :name: CEC_ADAP_G_PHYS_ADDR
+.. c:macro:: CEC_ADAP_G_PHYS_ADDR
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_S_PHYS_ADDR, __u16 *argp )
-    :name: CEC_ADAP_S_PHYS_ADDR
+``int ioctl(int fd, CEC_ADAP_G_PHYS_ADDR, __u16 *argp)``
+
+.. c:macro:: CEC_ADAP_S_PHYS_ADDR
+
+``int ioctl(int fd, CEC_ADAP_S_PHYS_ADDR, __u16 *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to the CEC address.
@@ -71,7 +73,6 @@ For example, the EDID for each HDMI input of the TV will have a
 different physical address of the form a.0.0.0 that the sources will
 read out and use as their physical address.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
index 3bc81fc5a73f..736fda5ad73d 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: CEC
 
 .. _CEC_DQEVENT:
 
@@ -11,22 +12,21 @@ Name
 
 CEC_DQEVENT - Dequeue a CEC event
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_DQEVENT, struct cec_event *argp )
-    :name: CEC_DQEVENT
+.. c:macro:: CEC_DQEVENT
+
+``int ioctl(int fd, CEC_DQEVENT, struct cec_event *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
 
-
 Description
 ===========
 
@@ -72,7 +72,6 @@ it is guaranteed that the state did change in between the two events.
         the HDMI driver is still configuring the device or because the HDMI
         device was unbound.
 
-
 .. c:type:: cec_event_lost_msgs
 
 .. tabularcolumns:: |p{1.0cm}|p{2.0cm}|p{14.5cm}|
@@ -94,7 +93,6 @@ it is guaranteed that the state did change in between the two events.
 	replied to within a second according to the CEC specification,
 	this is more than enough.
 
-
 .. tabularcolumns:: |p{1.0cm}|p{4.4cm}|p{2.5cm}|p{9.6cm}|
 
 .. c:type:: cec_event
@@ -130,7 +128,6 @@ it is guaranteed that the state did change in between the two events.
     * - }
       -
 
-
 .. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{11.0cm}|
 
 .. _cec-events:
@@ -204,7 +201,6 @@ it is guaranteed that the state did change in between the two events.
 	if the 5V is high, then an initial event will be generated for that
 	filehandle.
 
-
 .. tabularcolumns:: |p{6.0cm}|p{0.6cm}|p{10.9cm}|
 
 .. _cec-event-flags:
@@ -230,7 +226,6 @@ it is guaranteed that the state did change in between the two events.
         This is an indication that the application cannot keep up.
 
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst b/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
index 2093e373c93c..d3387b1fa7c5 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: CEC
 
 .. _CEC_MODE:
 .. _CEC_G_MODE:
@@ -13,17 +14,19 @@ CEC_G_MODE, CEC_S_MODE - Get or set exclusive use of the CEC adapter
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_G_MODE, __u32 *argp )
-   :name: CEC_G_MODE
+.. c:macro:: CEC_G_MODE
 
-.. c:function:: int ioctl( int fd, CEC_S_MODE, __u32 *argp )
-   :name: CEC_S_MODE
+``int ioctl(int fd, CEC_G_MODE, __u32 *argp)``
+
+.. c:macro:: CEC_S_MODE
+
+``int ioctl(int fd, CEC_S_MODE, __u32 *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to CEC mode.
@@ -101,7 +104,6 @@ Available initiator modes are:
 	then an attempt to become one will return the ``EBUSY`` error code
 	error.
 
-
 Available follower modes are:
 
 .. tabularcolumns:: |p{6.6cm}|p{0.9cm}|p{10.0cm}|
@@ -193,7 +195,6 @@ Available follower modes are:
 	the process has the ``CAP_NET_ADMIN`` capability. If that is not
 	set, then the ``EPERM`` error code is returned.
 
-
 Core message processing details:
 
 .. tabularcolumns:: |p{6.6cm}|p{10.9cm}|
@@ -272,7 +273,6 @@ Core message processing details:
 	and then just pass the message on to the follower(s).
 
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-receive.rst b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
index 9d629d46973c..b2fc051e99f4 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: CEC
 
 .. _CEC_TRANSMIT:
 .. _CEC_RECEIVE:
@@ -12,21 +13,22 @@ Name
 
 CEC_RECEIVE, CEC_TRANSMIT - Receive or transmit a CEC message
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_RECEIVE, struct cec_msg \*argp )
-    :name: CEC_RECEIVE
+.. c:macro:: CEC_RECEIVE
 
-.. c:function:: int ioctl( int fd, CEC_TRANSMIT, struct cec_msg \*argp )
-    :name: CEC_TRANSMIT
+``int ioctl(int fd, CEC_RECEIVE, struct cec_msg *argp)``
+
+.. c:macro:: CEC_TRANSMIT
+
+``int ioctl(int fd, CEC_TRANSMIT, struct cec_msg *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct cec_msg.
@@ -194,7 +196,6 @@ View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
 	supports this, otherwise it is always 0. This counter is only
 	valid if the :ref:`CEC_TX_STATUS_ERROR <CEC-TX-STATUS-ERROR>` status bit is set.
 
-
 .. tabularcolumns:: |p{6.2cm}|p{1.0cm}|p{10.3cm}|
 
 .. _cec-msg-flags:
@@ -228,7 +229,6 @@ View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
 	capability. If that is not set, then the ``EPERM`` error code is
 	returned.
 
-
 .. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{11.0cm}|
 
 .. _cec-tx-status:
@@ -298,7 +298,6 @@ View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
       - The transmit timed out. This should not normally happen and this
 	indicates a driver problem.
 
-
 .. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{11.0cm}|
 
 .. _cec-rx-status:
@@ -335,7 +334,6 @@ View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
 	reply was interrupted.
 
 
-
 Return Value
 ============
 
-- 
2.26.2

