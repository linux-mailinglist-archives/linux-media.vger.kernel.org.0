Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1366E28CD6F
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 14:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbgJML7n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 07:59:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:57420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727391AbgJMLyn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:43 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 13EEF2225F;
        Tue, 13 Oct 2020 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590080;
        bh=22a5l6Hf0yUtyosId6lhXH3QUxL5aOgd9d9m1cYYZrE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vwo9Vj/C6GGGBRBfEnTxnK3BkSyH4WStPnRNiwDpQpP4pJndlVNO22eczb38FNSU9
         D7CpNZIBCct3ABrp2GFykNF43RMze7+ICmsGishO0hajT9YgqsxXP14cDb5zOzU6aZ
         nw52yRynzQqfg7Ee/8Dpwwz/LondUhsnChawElg4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt3-006CU4-V2; Tue, 13 Oct 2020 13:54:37 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v6 19/80] media: docs: make MC documents more compatible with Sphinx 3.1+
Date:   Tue, 13 Oct 2020 13:53:34 +0200
Message-Id: <04668c79a2e525d9432f370db35a958ec9ffa9b8.1602589096.git.mchehab+huawei@kernel.org>
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
 .../media/mediactl/media-func-close.rst            | 10 +++-------
 .../media/mediactl/media-func-ioctl.rst            | 10 +++-------
 .../media/mediactl/media-func-open.rst             | 10 +++-------
 .../media/mediactl/media-ioc-device-info.rst       | 13 ++++---------
 .../media/mediactl/media-ioc-enum-entities.rst     | 11 ++++-------
 .../media/mediactl/media-ioc-enum-links.rst        | 13 ++++---------
 .../media/mediactl/media-ioc-g-topology.rst        | 14 ++++----------
 .../media/mediactl/media-ioc-request-alloc.rst     | 11 +++++------
 .../media/mediactl/media-ioc-setup-link.rst        | 10 ++++------
 .../media/mediactl/media-request-ioc-queue.rst     |  7 +++----
 .../media/mediactl/media-request-ioc-reinit.rst    |  8 ++++----
 .../userspace-api/media/mediactl/request-api.rst   |  5 +++--
 .../media/mediactl/request-func-close.rst          |  8 ++------
 .../media/mediactl/request-func-ioctl.rst          |  8 ++------
 .../media/mediactl/request-func-poll.rst           | 12 ++++--------
 15 files changed, 52 insertions(+), 98 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-func-close.rst b/Documentation/userspace-api/media/mediactl/media-func-close.rst
index ec571b34ce69..8ac2443e76c1 100644
--- a/Documentation/userspace-api/media/mediactl/media-func-close.rst
+++ b/Documentation/userspace-api/media/mediactl/media-func-close.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _media-func-close:
 
@@ -11,7 +12,6 @@ Name
 
 media-close - Close a media device
 
-
 Synopsis
 ========
 
@@ -19,16 +19,13 @@ Synopsis
 
     #include <unistd.h>
 
-
 .. c:function:: int close( int fd )
-    :name: mc-close
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <mc-open>`.
-
+    File descriptor returned by :c:func:`open()`.
 
 Description
 ===========
@@ -36,11 +33,10 @@ Description
 Closes the media device. Resources associated with the file descriptor
 are freed. The device configuration remain unchanged.
 
-
 Return Value
 ============
 
-:ref:`close() <media-func-close>` returns 0 on success. On error, -1 is returned, and
+:c:func:`close()` returns 0 on success. On error, -1 is returned, and
 ``errno`` is set appropriately. Possible error codes are:
 
 EBADF
diff --git a/Documentation/userspace-api/media/mediactl/media-func-ioctl.rst b/Documentation/userspace-api/media/mediactl/media-func-ioctl.rst
index 35ed549bec0e..9e9a838f4795 100644
--- a/Documentation/userspace-api/media/mediactl/media-func-ioctl.rst
+++ b/Documentation/userspace-api/media/mediactl/media-func-ioctl.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _media-func-ioctl:
 
@@ -11,7 +12,6 @@ Name
 
 media-ioctl - Control a media device
 
-
 Synopsis
 ========
 
@@ -19,15 +19,13 @@ Synopsis
 
     #include <sys/ioctl.h>
 
-
-.. c:function:: int ioctl( int fd, int request, void *argp )
-    :name: mc-ioctl
+``int ioctl(int fd, int request, void *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <mc-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``request``
     Media ioctl request code as defined in the media.h header file, for
@@ -36,7 +34,6 @@ Arguments
 ``argp``
     Pointer to a request-specific structure.
 
-
 Description
 ===========
 
@@ -52,7 +49,6 @@ their parameters are located in the media.h header file. All media ioctl
 requests, their respective function and parameters are specified in
 :ref:`media-user-func`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/mediactl/media-func-open.rst b/Documentation/userspace-api/media/mediactl/media-func-open.rst
index 2c2595157ea3..24487cb0a308 100644
--- a/Documentation/userspace-api/media/mediactl/media-func-open.rst
+++ b/Documentation/userspace-api/media/mediactl/media-func-open.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _media-func-open:
 
@@ -11,7 +12,6 @@ Name
 
 media-open - Open a media device
 
-
 Synopsis
 ========
 
@@ -19,9 +19,7 @@ Synopsis
 
     #include <fcntl.h>
 
-
 .. c:function:: int open( const char *device_name, int flags )
-    :name: mc-open
 
 Arguments
 =========
@@ -33,11 +31,10 @@ Arguments
     Open flags. Access mode must be either ``O_RDONLY`` or ``O_RDWR``.
     Other flags have no effect.
 
-
 Description
 ===========
 
-To open a media device applications call :ref:`open() <media-func-open>` with the
+To open a media device applications call :c:func:`open()` with the
 desired device name. The function has no side effects; the device
 configuration remain unchanged.
 
@@ -45,11 +42,10 @@ When the device is opened in read-only mode, attempts to modify its
 configuration will result in an error, and ``errno`` will be set to
 EBADF.
 
-
 Return Value
 ============
 
-:ref:`open() <func-open>` returns the new file descriptor on success. On error,
+:c:func:`open()` returns the new file descriptor on success. On error,
 -1 is returned, and ``errno`` is set appropriately. Possible error codes
 are:
 
diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst b/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
index cde1ddfc0bfb..0c4c5d2cfcb2 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-device-info.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _media_ioc_device_info:
 
@@ -11,24 +12,22 @@ Name
 
 MEDIA_IOC_DEVICE_INFO - Query device information
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, MEDIA_IOC_DEVICE_INFO, struct media_device_info *argp )
-    :name: MEDIA_IOC_DEVICE_INFO
+.. c:macro:: MEDIA_IOC_DEVICE_INFO
 
+``int ioctl(int fd, MEDIA_IOC_DEVICE_INFO, struct media_device_info *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <media-func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`media_device_info`.
 
-
 Description
 ===========
 
@@ -38,7 +37,6 @@ a struct :c:type:`media_device_info`. The driver
 fills the structure and returns the information to the application. The
 ioctl never fails.
 
-
 .. c:type:: media_device_info
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -48,7 +46,6 @@ ioctl never fails.
     :stub-columns: 0
     :widths:       1 1 2
 
-
     *  -  char
        -  ``driver``\ [16]
        -  Name of the driver implementing the media API as a NUL-terminated
@@ -94,7 +91,6 @@ ioctl never fails.
        -  Reserved for future extensions. Drivers and applications must set
 	  this array to zero.
 
-
 The ``serial`` and ``bus_info`` fields can be used to distinguish
 between multiple instances of otherwise identical hardware. The serial
 number takes precedence when provided and can be assumed to be unique.
@@ -102,7 +98,6 @@ If the serial number is an empty string, the ``bus_info`` field can be
 used instead. The ``bus_info`` field is guaranteed to be unique, but can
 vary across reboots or device unplug/replug.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-enum-entities.rst b/Documentation/userspace-api/media/mediactl/media-ioc-enum-entities.rst
index 93e35f198f47..92dd8ecd538c 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-enum-entities.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-enum-entities.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _media_ioc_enum_entities:
 
@@ -11,24 +12,22 @@ Name
 
 MEDIA_IOC_ENUM_ENTITIES - Enumerate entities and their properties
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, MEDIA_IOC_ENUM_ENTITIES, struct media_entity_desc *argp )
-    :name: MEDIA_IOC_ENUM_ENTITIES
+.. c:macro:: MEDIA_IOC_ENUM_ENTITIES
 
+``int ioctl(int fd, MEDIA_IOC_ENUM_ENTITIES, struct media_entity_desc *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <media-func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`media_entity_desc`.
 
-
 Description
 ===========
 
@@ -49,7 +48,6 @@ Entity IDs can be non-contiguous. Applications must *not* try to
 enumerate entities by calling MEDIA_IOC_ENUM_ENTITIES with increasing
 id's until they get an error.
 
-
 .. c:type:: media_entity_desc
 
 .. tabularcolumns:: |p{1.5cm}|p{1.7cm}|p{1.6cm}|p{1.5cm}|p{11.2cm}|
@@ -136,7 +134,6 @@ id's until they get an error.
     *  - }
        -
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-enum-links.rst b/Documentation/userspace-api/media/mediactl/media-ioc-enum-links.rst
index f3e94c7b5dc3..3bc98a6a2ec5 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-enum-links.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-enum-links.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _media_ioc_enum_links:
 
@@ -11,24 +12,22 @@ Name
 
 MEDIA_IOC_ENUM_LINKS - Enumerate all pads and links for a given entity
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, MEDIA_IOC_ENUM_LINKS, struct media_links_enum *argp )
-    :name: MEDIA_IOC_ENUM_LINKS
+.. c:macro:: MEDIA_IOC_ENUM_LINKS
 
+``int ioctl(int fd, MEDIA_IOC_ENUM_LINKS, struct media_links_enum *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <media-func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`media_links_enum`.
 
-
 Description
 ===========
 
@@ -53,7 +52,6 @@ outbound links can be retrieved with :ref:`MEDIA_IOC_ENUM_ENTITIES`.
 Only forward links that originate at one of the entity's source pads are
 returned during the enumeration process.
 
-
 .. c:type:: media_links_enum
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -82,7 +80,6 @@ returned during the enumeration process.
        -  Reserved for future extensions. Drivers and applications must set
           the array to zero.
 
-
 .. c:type:: media_pad_desc
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -110,7 +107,6 @@ returned during the enumeration process.
           the array to zero.
 
 
-
 .. c:type:: media_link_desc
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -137,7 +133,6 @@ returned during the enumeration process.
        -  Reserved for future extensions. Drivers and applications must set
           the array to zero.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-g-topology.rst b/Documentation/userspace-api/media/mediactl/media-ioc-g-topology.rst
index 9b7d2296b7fd..8f8b3b586edd 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-g-topology.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-g-topology.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _media_ioc_g_topology:
 
@@ -11,24 +12,22 @@ Name
 
 MEDIA_IOC_G_TOPOLOGY - Enumerate the graph topology and graph element properties
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, MEDIA_IOC_G_TOPOLOGY, struct media_v2_topology *argp )
-    :name: MEDIA_IOC_G_TOPOLOGY
+.. c:macro:: MEDIA_IOC_G_TOPOLOGY
 
+``int ioctl(int fd, MEDIA_IOC_G_TOPOLOGY, struct media_v2_topology *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <media-func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`media_v2_topology`.
 
-
 Description
 ===========
 
@@ -120,7 +119,6 @@ desired arrays with the media graph elements.
 	  converted to a 64-bits integer. It can be zero. if zero, the ioctl
 	  won't store the links. It will just update ``num_links``
 
-
 .. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.7cm}|
 
 .. c:type:: media_v2_entity
@@ -158,7 +156,6 @@ desired arrays with the media graph elements.
        -  Reserved for future extensions. Drivers and applications must set
 	  this array to zero.
 
-
 .. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.7cm}|
 
 .. c:type:: media_v2_interface
@@ -192,7 +189,6 @@ desired arrays with the media graph elements.
        -  Used only for device node interfaces. See
 	  :c:type:`media_v2_intf_devnode` for details.
 
-
 .. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.7cm}|
 
 .. c:type:: media_v2_intf_devnode
@@ -245,7 +241,6 @@ desired arrays with the media graph elements.
        -  Reserved for future extensions. Drivers and applications must set
 	  this array to zero.
 
-
 .. tabularcolumns:: |p{1.6cm}|p{3.2cm}|p{12.7cm}|
 
 .. c:type:: media_v2_link
@@ -282,7 +277,6 @@ desired arrays with the media graph elements.
        -  Reserved for future extensions. Drivers and applications must set
 	  this array to zero.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-request-alloc.rst b/Documentation/userspace-api/media/mediactl/media-ioc-request-alloc.rst
index ea05ff0c5382..9195b4b8bf20 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-request-alloc.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-request-alloc.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _media_ioc_request_alloc:
 
@@ -11,24 +12,22 @@ Name
 
 MEDIA_IOC_REQUEST_ALLOC - Allocate a request
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, MEDIA_IOC_REQUEST_ALLOC, int *argp )
-    :name: MEDIA_IOC_REQUEST_ALLOC
+.. c:macro:: MEDIA_IOC_REQUEST_ALLOC
 
+``int ioctl(int fd, MEDIA_IOC_REQUEST_ALLOC, int *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <media-func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to an integer.
 
-
 Description
 ===========
 
@@ -51,7 +50,7 @@ Finally, the file descriptor can be :ref:`polled <request-func-poll>` to wait
 for the request to complete.
 
 The request will remain allocated until all the file descriptors associated
-with it are closed by :ref:`close() <request-func-close>` and the driver no
+with it are closed by :c:func:`close()` and the driver no
 longer uses the request internally. See also
 :ref:`here <media-request-life-time>` for more information.
 
diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
index e2aa51015783..23208300cb61 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _media_ioc_setup_link:
 
@@ -11,24 +12,22 @@ Name
 
 MEDIA_IOC_SETUP_LINK - Modify the properties of a link
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, MEDIA_IOC_SETUP_LINK, struct media_link_desc *argp )
-    :name: MEDIA_IOC_SETUP_LINK
+.. c:macro:: MEDIA_IOC_SETUP_LINK
 
+``int ioctl(int fd, MEDIA_IOC_SETUP_LINK, struct media_link_desc *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <media-func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`media_link_desc`.
 
-
 Description
 ===========
 
@@ -53,7 +52,6 @@ non-dynamic link will return an ``EBUSY`` error code.
 If the specified link can't be found the driver returns with an ``EINVAL``
 error code.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst b/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst
index ca1b33196242..04b33db2bb45 100644
--- a/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst
+++ b/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _media_request_ioc_queue:
 
@@ -11,13 +12,12 @@ Name
 
 MEDIA_REQUEST_IOC_QUEUE - Queue a request
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int request_fd, MEDIA_REQUEST_IOC_QUEUE )
-    :name: MEDIA_REQUEST_IOC_QUEUE
+.. c:macro:: MEDIA_REQUEST_IOC_QUEUE
 
+``int ioctl(int request_fd, MEDIA_REQUEST_IOC_QUEUE)``
 
 Arguments
 =========
@@ -25,7 +25,6 @@ Arguments
 ``request_fd``
     File descriptor returned by :ref:`MEDIA_IOC_REQUEST_ALLOC`.
 
-
 Description
 ===========
 
diff --git a/Documentation/userspace-api/media/mediactl/media-request-ioc-reinit.rst b/Documentation/userspace-api/media/mediactl/media-request-ioc-reinit.rst
index cfd503bdef70..57567b87b985 100644
--- a/Documentation/userspace-api/media/mediactl/media-request-ioc-reinit.rst
+++ b/Documentation/userspace-api/media/mediactl/media-request-ioc-reinit.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _media_request_ioc_reinit:
 
@@ -11,13 +12,12 @@ Name
 
 MEDIA_REQUEST_IOC_REINIT - Re-initialize a request
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int request_fd, MEDIA_REQUEST_IOC_REINIT )
-    :name: MEDIA_REQUEST_IOC_REINIT
+.. c:macro:: MEDIA_REQUEST_IOC_REINIT
 
+``int ioctl(int request_fd, MEDIA_REQUEST_IOC_REINIT)``
 
 Arguments
 =========
@@ -33,7 +33,7 @@ this request ioctl can be used to re-initialize a previously allocated
 request.
 
 Re-initializing a request will clear any existing data from the request.
-This avoids having to :ref:`close() <request-func-close>` a completed
+This avoids having to :c:func:`close()` a completed
 request and allocate a new request. Instead the completed request can just
 be re-initialized and it is ready to be used again.
 
diff --git a/Documentation/userspace-api/media/mediactl/request-api.rst b/Documentation/userspace-api/media/mediactl/request-api.rst
index c0fa4dbb2b28..6c4cbd9f08a5 100644
--- a/Documentation/userspace-api/media/mediactl/request-api.rst
+++ b/Documentation/userspace-api/media/mediactl/request-api.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _media-request-api:
 
@@ -93,7 +94,7 @@ regardless of whether a request is in use or not.
    Setting the same control through a request and also directly can lead to
    undefined behavior!
 
-User-space can :ref:`poll() <request-func-poll>` a request file descriptor in
+User-space can :c:func:`poll()` a request file descriptor in
 order to wait until the request completes. A request is considered complete
 once all its associated buffers are available for dequeuing and all the
 associated controls have been updated with the values at the time of completion.
@@ -115,7 +116,7 @@ Recycling and Destruction
 -------------------------
 
 Finally, a completed request can either be discarded or be reused. Calling
-:ref:`close() <request-func-close>` on a request file descriptor will make
+:c:func:`close()` on a request file descriptor will make
 that file descriptor unusable and the request will be freed once it is no
 longer in use by the kernel. That is, if the request is queued and then the
 file descriptor is closed, then it won't be freed until the driver completed
diff --git a/Documentation/userspace-api/media/mediactl/request-func-close.rst b/Documentation/userspace-api/media/mediactl/request-func-close.rst
index 04e00bb9defd..f4b8eb385ad7 100644
--- a/Documentation/userspace-api/media/mediactl/request-func-close.rst
+++ b/Documentation/userspace-api/media/mediactl/request-func-close.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC.request
 
 .. _request-func-close:
 
@@ -11,7 +12,6 @@ Name
 
 request-close - Close a request file descriptor
 
-
 Synopsis
 ========
 
@@ -19,9 +19,7 @@ Synopsis
 
     #include <unistd.h>
 
-
 .. c:function:: int close( int fd )
-    :name: req-close
 
 Arguments
 =========
@@ -29,7 +27,6 @@ Arguments
 ``fd``
     File descriptor returned by :ref:`MEDIA_IOC_REQUEST_ALLOC`.
 
-
 Description
 ===========
 
@@ -38,11 +35,10 @@ are freed once all file descriptors associated with the request are closed
 and the driver has completed the request.
 See :ref:`here <media-request-life-time>` for more information.
 
-
 Return Value
 ============
 
-:ref:`close() <request-func-close>` returns 0 on success. On error, -1 is
+:c:func:`close()` returns 0 on success. On error, -1 is
 returned, and ``errno`` is set appropriately. Possible error codes are:
 
 EBADF
diff --git a/Documentation/userspace-api/media/mediactl/request-func-ioctl.rst b/Documentation/userspace-api/media/mediactl/request-func-ioctl.rst
index 1e1c5edb860c..4fb3d2ef32d1 100644
--- a/Documentation/userspace-api/media/mediactl/request-func-ioctl.rst
+++ b/Documentation/userspace-api/media/mediactl/request-func-ioctl.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _request-func-ioctl:
 
@@ -11,7 +12,6 @@ Name
 
 request-ioctl - Control a request file descriptor
 
-
 Synopsis
 ========
 
@@ -19,9 +19,7 @@ Synopsis
 
     #include <sys/ioctl.h>
 
-
-.. c:function:: int ioctl( int fd, int cmd, void *argp )
-    :name: req-ioctl
+``int ioctl(int fd, int cmd, void *argp)``
 
 Arguments
 =========
@@ -36,7 +34,6 @@ Arguments
 ``argp``
     Pointer to a request-specific structure.
 
-
 Description
 ===========
 
@@ -52,7 +49,6 @@ their parameters are located in the media.h header file. All request ioctl
 commands, their respective function and parameters are specified in
 :ref:`media-user-func`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/mediactl/request-func-poll.rst b/Documentation/userspace-api/media/mediactl/request-func-poll.rst
index 92947213d3d5..ce0043dbe7da 100644
--- a/Documentation/userspace-api/media/mediactl/request-func-poll.rst
+++ b/Documentation/userspace-api/media/mediactl/request-func-poll.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
+.. c:namespace:: MC
 
 .. _request-func-poll:
 
@@ -11,7 +12,6 @@ Name
 
 request-poll - Wait for some event on a file descriptor
 
-
 Synopsis
 ========
 
@@ -19,9 +19,7 @@ Synopsis
 
     #include <sys/poll.h>
 
-
 .. c:function:: int poll( struct pollfd *ufds, unsigned int nfds, int timeout )
-   :name: request-poll
 
 Arguments
 =========
@@ -35,14 +33,13 @@ Arguments
 ``timeout``
    Timeout to wait for events
 
-
 Description
 ===========
 
-With the :c:func:`poll() <request-func-poll>` function applications can wait
+With the :c:func:`poll()` function applications can wait
 for a request to complete.
 
-On success :c:func:`poll() <request-func-poll>` returns the number of file
+On success :c:func:`poll()` returns the number of file
 descriptors that have been selected (that is, file descriptors for which the
 ``revents`` field of the respective struct :c:type:`pollfd`
 is non-zero). Request file descriptor set the ``POLLPRI`` flag in ``revents``
@@ -53,11 +50,10 @@ set appropriately.
 Attempting to poll for a request that is not yet queued will
 set the ``POLLERR`` flag in ``revents``.
 
-
 Return Value
 ============
 
-On success, :c:func:`poll() <request-func-poll>` returns the number of
+On success, :c:func:`poll()` returns the number of
 structures which have non-zero ``revents`` fields, or zero if the call
 timed out. On error -1 is returned, and the ``errno`` variable is set
 appropriately:
-- 
2.26.2

