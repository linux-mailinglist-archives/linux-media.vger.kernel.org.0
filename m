Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B46276FC0
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 13:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbgIXLWO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 07:22:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:49468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbgIXLWN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 07:22:13 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBA8C239A1;
        Thu, 24 Sep 2020 11:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600946532;
        bh=8q0NeK1iEJFxWv10SyZY2Z9vo3xQEz197fv4oj54u8w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EC0X0vWA5B7nQGxooTyZom8TRJp8D4G/jCdTHV0uR1ks03qnMibdrUPGZUPN1AQ0O
         iEfobmdZJ/4RoSQQFmv42rdFo1PLdBPhY8Wt1iH1RNVopcPxDv4k1UnkGAGnsCs/Ci
         Bd3uHB4mtOneX3JkuuwsMaxpX2nf0T1T+nwNH9rc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kLPKD-000AEW-Im; Thu, 24 Sep 2020 13:22:09 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: docs: make CEC documents compatible with Sphinx 3.1+
Date:   Thu, 24 Sep 2020 13:22:05 +0200
Message-Id: <fb55cdda730f305419207c804dab6dc76285ff87.1600945712.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600945712.git.mchehab+huawei@kernel.org>
References: <cover.1600945712.git.mchehab+huawei@kernel.org>
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
 .../userspace-api/media/cec/cec-func-close.rst     |  7 ++++---
 .../userspace-api/media/cec/cec-func-ioctl.rst     |  7 ++++---
 .../userspace-api/media/cec/cec-func-open.rst      |  7 ++++---
 .../userspace-api/media/cec/cec-func-poll.rst      | 11 ++++++-----
 .../media/cec/cec-ioc-adap-g-caps.rst              |  9 ++++++---
 .../media/cec/cec-ioc-adap-g-conn-info.rst         | 11 +++++++----
 .../media/cec/cec-ioc-adap-g-log-addrs.rst         | 14 +++++++++-----
 .../media/cec/cec-ioc-adap-g-phys-addr.rst         | 14 +++++++++-----
 .../userspace-api/media/cec/cec-ioc-dqevent.rst    |  9 ++++++---
 .../userspace-api/media/cec/cec-ioc-g-mode.rst     | 14 +++++++++-----
 .../userspace-api/media/cec/cec-ioc-receive.rst    | 14 +++++++++-----
 11 files changed, 73 insertions(+), 44 deletions(-)

diff --git a/Documentation/userspace-api/media/cec/cec-func-close.rst b/Documentation/userspace-api/media/cec/cec-func-close.rst
index 33c563f414a8..7771e40aa6e8 100644
--- a/Documentation/userspace-api/media/cec/cec-func-close.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-close.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
+.. c:namespace:: CEC
+
 .. _cec-func-close:
 
 ***********
@@ -21,13 +23,12 @@ Synopsis
 
 
 .. c:function:: int close( int fd )
-    :name: cec-close
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 
 Description
@@ -40,7 +41,7 @@ freed. The device configuration remain unchanged.
 Return Value
 ============
 
-:c:func:`close() <cec-close>` returns 0 on success. On error, -1 is returned, and
+:c:func:close() returns 0 on success. On error, -1 is returned, and
 ``errno`` is set appropriately. Possible error codes are:
 
 ``EBADF``
diff --git a/Documentation/userspace-api/media/cec/cec-func-ioctl.rst b/Documentation/userspace-api/media/cec/cec-func-ioctl.rst
index 3b88230fad80..3d2fed0470a8 100644
--- a/Documentation/userspace-api/media/cec/cec-func-ioctl.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-ioctl.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
+.. c:namespace:: CEC
+
 .. _cec-func-ioctl:
 
 ***********
@@ -20,13 +22,12 @@ Synopsis
 
 
 .. c:function:: int ioctl( int fd, int request, void *argp )
-   :name: cec-ioctl
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 ``request``
     CEC ioctl request code as defined in the cec.h header file, for
@@ -39,7 +40,7 @@ Arguments
 Description
 ===========
 
-The :c:func:`ioctl() <cec-ioctl>` function manipulates cec device parameters. The
+The :c:func:ioctl() function manipulates cec device parameters. The
 argument ``fd`` must be an open file descriptor.
 
 The ioctl ``request`` code specifies the cec function to be called. It
diff --git a/Documentation/userspace-api/media/cec/cec-func-open.rst b/Documentation/userspace-api/media/cec/cec-func-open.rst
index 887bfd2a755e..de43707768ca 100644
--- a/Documentation/userspace-api/media/cec/cec-func-open.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-open.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
+.. c:namespace:: CEC
+
 .. _cec-func-open:
 
 **********
@@ -20,7 +22,6 @@ Synopsis
 
 
 .. c:function:: int open( const char *device_name, int flags )
-   :name: cec-open
 
 
 Arguments
@@ -46,7 +47,7 @@ Arguments
 Description
 ===========
 
-To open a cec device applications call :c:func:`open() <cec-open>` with the
+To open a cec device applications call :c:func:open() with the
 desired device name. The function has no side effects; the device
 configuration remain unchanged.
 
@@ -58,7 +59,7 @@ EBADF.
 Return Value
 ============
 
-:c:func:`open() <cec-open>` returns the new file descriptor on success. On error,
+:c:func:open() returns the new file descriptor on success. On error,
 -1 is returned, and ``errno`` is set appropriately. Possible error codes
 include:
 
diff --git a/Documentation/userspace-api/media/cec/cec-func-poll.rst b/Documentation/userspace-api/media/cec/cec-func-poll.rst
index 2d87136e9a3f..3da4a96fb921 100644
--- a/Documentation/userspace-api/media/cec/cec-func-poll.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-poll.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
+.. c:namespace:: CEC
+
 .. _cec-func-poll:
 
 **********
@@ -21,7 +23,6 @@ Synopsis
 
 
 .. c:function:: int poll( struct pollfd *ufds, unsigned int nfds, int timeout )
-   :name: cec-poll
 
 Arguments
 =========
@@ -39,10 +40,10 @@ Arguments
 Description
 ===========
 
-With the :c:func:`poll() <cec-poll>` function applications can wait for CEC
+With the :c:func:poll() function applications can wait for CEC
 events.
 
-On success :c:func:`poll() <cec-poll>` returns the number of file descriptors
+On success :c:func:poll() returns the number of file descriptors
 that have been selected (that is, file descriptors for which the
 ``revents`` field of the respective struct :c:type:`pollfd`
 is non-zero). CEC devices set the ``POLLIN`` and ``POLLRDNORM`` flags in
@@ -53,13 +54,13 @@ then the ``POLLPRI`` flag is set. When the function times out it returns
 a value of zero, on failure it returns -1 and the ``errno`` variable is
 set appropriately.
 
-For more details see the :c:func:`poll() <cec-poll>` manual page.
+For more details see the :c:func:poll() manual page.
 
 
 Return Value
 ============
 
-On success, :c:func:`poll() <cec-poll>` returns the number structures which have
+On success, :c:func:poll() returns the number structures which have
 non-zero ``revents`` fields, or zero if the call timed out. On error -1
 is returned, and the ``errno`` variable is set appropriately:
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
index 7f25365ce0fb..f19e2e4e3f3d 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
+.. c:namespace:: CEC
+
 .. _CEC_ADAP_G_CAPS:
 
 *********************
@@ -14,14 +16,15 @@ CEC_ADAP_G_CAPS - Query device capabilities
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_G_CAPS, struct cec_caps *argp )
-    :name: CEC_ADAP_G_CAPS
+.. c:macro:: CEC_ADAP_G_CAPS
+
+``int`` :c:expr:`ioctl(int fd, CEC_ADAP_G_CAPS, struct cec_caps *argp)`
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 ``argp``
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
index 6818ddf1495c..68a6dcfedfe0 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
@@ -1,7 +1,9 @@
 .. SPDX-License-Identifier: GPL-2.0
 ..
 .. Copyright 2019 Google LLC
-..
+
+.. c:namespace:: CEC
+
 .. _CEC_ADAP_G_CONNECTOR_INFO:
 
 *******************************
@@ -16,14 +18,15 @@ CEC_ADAP_G_CONNECTOR_INFO - Query HDMI connector information
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_G_CONNECTOR_INFO, struct cec_connector_info *argp )
-    :name: CEC_ADAP_G_CONNECTOR_INFO
+.. c:macro:: CEC_ADAP_G_CONNECTOR_INFO
+
+``int`` :c:expr:`ioctl(int fd, CEC_ADAP_G_CONNECTOR_INFO, struct cec_connector_info *argp)`
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 ``argp``
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
index 1ca893270ae9..fafee09cd156 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
+.. c:namespace:: CEC
+
 .. _CEC_ADAP_LOG_ADDRS:
 .. _CEC_ADAP_G_LOG_ADDRS:
 .. _CEC_ADAP_S_LOG_ADDRS:
@@ -17,17 +19,19 @@ CEC_ADAP_G_LOG_ADDRS, CEC_ADAP_S_LOG_ADDRS - Get or set the logical addresses
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_G_LOG_ADDRS, struct cec_log_addrs *argp )
-   :name: CEC_ADAP_G_LOG_ADDRS
+.. c:macro:: CEC_ADAP_G_LOG_ADDRS
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_S_LOG_ADDRS, struct cec_log_addrs *argp )
-   :name: CEC_ADAP_S_LOG_ADDRS
+``int`` :c:expr:`ioctl(int fd, CEC_ADAP_G_LOG_ADDRS, struct cec_log_addrs *argp)`
+
+.. c:macro:: CEC_ADAP_S_LOG_ADDRS
+
+``int`` :c:expr:`ioctl(int fd, CEC_ADAP_S_LOG_ADDRS, struct cec_log_addrs *argp)`
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 ``argp``
     Pointer to struct :c:type:`cec_log_addrs`.
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst
index a10443be1b26..ba5bca26fbd8 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
+.. c:namespace:: CEC
+
 .. _CEC_ADAP_PHYS_ADDR:
 .. _CEC_ADAP_G_PHYS_ADDR:
 .. _CEC_ADAP_S_PHYS_ADDR:
@@ -17,17 +19,19 @@ CEC_ADAP_G_PHYS_ADDR, CEC_ADAP_S_PHYS_ADDR - Get or set the physical address
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_G_PHYS_ADDR, __u16 *argp )
-    :name: CEC_ADAP_G_PHYS_ADDR
+.. c:macro:: CEC_ADAP_G_PHYS_ADDR
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_S_PHYS_ADDR, __u16 *argp )
-    :name: CEC_ADAP_S_PHYS_ADDR
+``int`` :c:expr:`ioctl(int fd, CEC_ADAP_G_PHYS_ADDR, __u16 *argp)`
+
+.. c:macro:: CEC_ADAP_S_PHYS_ADDR
+
+``int`` :c:expr:`ioctl(int fd, CEC_ADAP_S_PHYS_ADDR, __u16 *argp)`
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 ``argp``
     Pointer to the CEC address.
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
index 3bc81fc5a73f..394e3c3acf9d 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
+.. c:namespace:: CEC
+
 .. _CEC_DQEVENT:
 
 *****************
@@ -15,14 +17,15 @@ CEC_DQEVENT - Dequeue a CEC event
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_DQEVENT, struct cec_event *argp )
-    :name: CEC_DQEVENT
+.. c:macro:: CEC_DQEVENT
+
+``int`` :c:expr:`ioctl(int fd, CEC_DQEVENT, struct cec_event *argp)`
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 ``argp``
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst b/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
index 2093e373c93c..a2daf4017e91 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
+.. c:namespace:: CEC
+
 .. _CEC_MODE:
 .. _CEC_G_MODE:
 .. _CEC_S_MODE:
@@ -13,17 +15,19 @@ CEC_G_MODE, CEC_S_MODE - Get or set exclusive use of the CEC adapter
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_G_MODE, __u32 *argp )
-   :name: CEC_G_MODE
+.. c:macro:: CEC_G_MODE
 
-.. c:function:: int ioctl( int fd, CEC_S_MODE, __u32 *argp )
-   :name: CEC_S_MODE
+``int`` :c:expr:`ioctl(int fd, CEC_G_MODE, __u32 *argp)`
+
+.. c:macro:: CEC_S_MODE
+
+``int`` :c:expr:`ioctl(int fd, CEC_S_MODE, __u32 *argp)`
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 ``argp``
     Pointer to CEC mode.
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-receive.rst b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
index 9d629d46973c..c0689c52e3f7 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
+.. c:namespace:: CEC
+
 .. _CEC_TRANSMIT:
 .. _CEC_RECEIVE:
 
@@ -16,17 +18,19 @@ CEC_RECEIVE, CEC_TRANSMIT - Receive or transmit a CEC message
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_RECEIVE, struct cec_msg \*argp )
-    :name: CEC_RECEIVE
+.. c:macro:: CEC_RECEIVE
 
-.. c:function:: int ioctl( int fd, CEC_TRANSMIT, struct cec_msg \*argp )
-    :name: CEC_TRANSMIT
+``int`` :c:expr:`ioctl(int fd, CEC_RECEIVE, struct cec_msg *argp)`
+
+.. c:macro:: CEC_TRANSMIT
+
+``int`` :c:expr:`ioctl(int fd, CEC_TRANSMIT, struct cec_msg *argp)`
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 ``argp``
     Pointer to struct cec_msg.
-- 
2.26.2

