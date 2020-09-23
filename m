Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA27227594E
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 16:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgIWOCU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 10:02:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:49324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbgIWOCU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 10:02:20 -0400
Received: from coco.lan (ip5f5ad5c8.dynamic.kabel-deutschland.de [95.90.213.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31540221F0;
        Wed, 23 Sep 2020 14:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600869737;
        bh=/Sa4Fd49FLuwnAE9zi43dYsBxaHdQIaOk7jTf/1qtSE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aa2AV/VgTEg1VPsmQVAfWtSC7CQc33huwLSpaJB/92ShZBtriDtA1hTQzvKKs5QN5
         vmH94uEmcjI9wCKXwftw8E+YhjnFd15maGNDuqxIqJDkt5opxo167uuG4OaX1CL+JE
         d5aHI/gulCn0B+6zpAaoSmOtG5Vy54GkMQSwSqc8=
Date:   Wed, 23 Sep 2020 16:02:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH RFC] Make the docs build "work" with Sphinx 3.x
Message-ID: <20200923160210.7cd16161@coco.lan>
In-Reply-To: <20200923135318.48bb93f5@coco.lan>
References: <20200904102925.52fcd2a1@lwn.net>
        <20200921222639.GY32101@casper.infradead.org>
        <87sgbaqnp9.fsf@intel.com>
        <20200922105656.11043bd9@lwn.net>
        <20200923110106.192e313f@coco.lan>
        <20200923135318.48bb93f5@coco.lan>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 23 Sep 2020 13:53:18 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Wed, 23 Sep 2020 11:01:06 +0200
> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> 
> > Em Tue, 22 Sep 2020 10:56:56 -0600
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> >   
> > > On Tue, 22 Sep 2020 10:23:46 +0300
> > > Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > >     
> > > > > Should we be converting the kernel-doc script to output 3.0-style markup
> > > > > for structs?      
> > > > 
> > > > IIUC it's not backwards compatible with Sphinx pre-3.0, so you'd either
> > > > have to require Sphinx 3.0 or have kernel-doc emit both, depending on
> > > > the Sphinx version.    
> > > 
> > > Certainly before requiring 3.0 we should, like, actually make it work with
> > > 3.0...  People with time to do that appear to be rather scarce at the
> > > moment, though.  I'll get to it eventually but I have a few other things
> > > on my plate as well.    
> > 
> > Tried to build now with Sphinx 3.2.1. There are thousands of warnings:
> > 
> > 	build succeeded, 3423 warnings.
> > 
> > Like those:
> > 
> > 	Documentation/driver-api/basics.rst: WARNING: Duplicate C declaration, also defined in 'core-api/workqueue'.
> > 	Declaration is 'unsigned long delay'.
> > 
> > And those:
> > 
> > 	./include/uapi/linux/firewire-cdev.h:38: WARNING: Type must be either just a name or a typedef-like declaration.
> > 	If just a name:
> > 	  Error in declarator or parameters
> > 	  Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
> > 	    struct fw_cdev_event_iso_interrupt
> > 	    ------^
> > 	If typedef-like declaration:
> > 	  Error in declarator or parameters
> > 	  Invalid C declaration: Expected identifier in nested name. [error at 34]
> > 	    struct fw_cdev_event_iso_interrupt
> > 	    ----------------------------------^
> > 
> > If I'm not mistaken, one of the reasons why cdomain was added is
> > due to the duplicate C declaration.
> > 
> > -
> > 
> > I guess changing kernel-doc to produce Sphinx 3.x syntax and
> > raise the bar requiring 3.0 to be the minimal version would be
> > one alternative, but this won't solve the duplicated C declarations. 
> > 
> > Does Sphinx 3.x have some way to enable "local" C references?
> > 
> > Another one could be to make cdomain compatible with 3.x and
> > make it handle the differences. Not sure how easy/hard would be
> > to do that.  
> 
> Ok, I checked the code of cdomain.py. It sounds that Markus
> tried to make cdomain compatible with Sphinx 3.x[1]:
> 
> 	https://github.com/return42/linuxdoc/commit/48f09de2aff80169b7b9be5b0f2431ad8954e5cc
> 
> [1] Yet, he ended disabling cdomain.py at his latest commit there:
> 
> 	https://github.com/return42/linuxdoc/commit/70673dcf69e705e08d81f53794895dc15c4920b3#diff-40ccfb63661f88fd819794047febd54d
> 
>     (Basically, if Sphinx > 3.0, the cdomain.py is just an alias for c.py)
> 
> I was hoping that porting such change would be enough for docs to build
> with Sphinx 3.2, but it isn't[2]. It seems that the entire Cdomain code
> was re-written:
> 
> 	https://github.com/sphinx-doc/sphinx/commit/0f49e30c51b5cc5055cda5b4b294c2dd9d1df573#r38750737
> 
> There are now some environment vars that are required. Some of them
> have things like:
> 
>         lastSymbol = self.env.temp_data['c:last_symbol']  # type: Symbol
>         assert lastSymbol
> 
> If those aren't found, Sphinx crashes.
> 
> So, making anything that would be compatible with both Sphinx 2.x
> and Sphinx 3.x seems very painful.
> 
> It sounds to me that we need to make a choice here about how to
> proceed. We have a few alternatives:
> 
> 1) stick forever with Sphinx 2.x syntax. We may end needing to 
>    support a fork of Sphinx, if we follow this direction, as
>    nobody currently fix bugs on older versions of Sphinx;
> 
> 2) switch to use Sphinx 3.x c domains and drop support for
>    version < 3.x;

Based on what it was described here:

	https://github.com/sphinx-doc/sphinx/issues/7421

I worked on a RFC patch converting one of the media files
(the CEC one, mentioned at the issue) in order to use the
new Sphinx 3.1 C domain.

Yet, it sounds that the c:namespace is broken on Sphinx 3.2.1:

	Documentation/userspace-api/media/cec/cec-func-close.rst:23: WARNING: Duplicate C declaration, also defined in 'media/dvb/video-fclose'.
	Declaration is 'int close( int fd )'.
	Documentation/userspace-api/media/cec/cec-func-close.rst: WARNING: Duplicate C declaration, also defined in 'media/dvb/video-fclose'.
	Declaration is 'int close(int fd)'.
	Documentation/userspace-api/media/cec/cec-func-close.rst: WARNING: Duplicate C declaration, also defined in 'media/dvb/video-fclose'.
	Declaration is 'int fd'.
	Documentation/userspace-api/media/cec/cec-func-open.rst:22: WARNING: Duplicate C declaration, also defined in 'media/dvb/video-fopen'.
	Declaration is 'int open( const char *device_name, int flags )'.
	Documentation/userspace-api/media/cec/cec-func-open.rst: WARNING: Duplicate C declaration, also defined in 'media/dvb/video-fopen'.
	Declaration is 'int open(const char *deviceName, int flags)'.
	Documentation/userspace-api/media/cec/cec-func-open.rst: WARNING: Duplicate C declaration, also defined in 'media/dvb/video-fopen'.


Or maybe it has to be defined on each individual .rst file that
uses an specific domain?

Thanks,
Mauro

RFC: convert CEC userspace docs to use Sphinx 3.1 domains

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/userspace-api/media/cec/cec-api.rst b/Documentation/userspace-api/media/cec/cec-api.rst
index 4d229ed8a1d9..3c33d7f3bcf6 100644
--- a/Documentation/userspace-api/media/cec/cec-api.rst
+++ b/Documentation/userspace-api/media/cec/cec-api.rst
@@ -1,6 +1,8 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 .. include:: <isonum.txt>
 
+.. c:namespace:: CEC
+
 .. _cec:
 
 #########################################
@@ -44,3 +46,5 @@ Revision History
 :revision: 1.0.0 / 2016-03-17 (*hv*)
 
 Initial revision
+
+.. c:namespace:: NULL
diff --git a/Documentation/userspace-api/media/cec/cec-func-close.rst b/Documentation/userspace-api/media/cec/cec-func-close.rst
index 33c563f414a8..4849b315739b 100644
--- a/Documentation/userspace-api/media/cec/cec-func-close.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-close.rst
@@ -21,13 +21,12 @@ Synopsis
 
 
 .. c:function:: int close( int fd )
-    :name: cec-close
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 
 Description
@@ -40,7 +39,7 @@ freed. The device configuration remain unchanged.
 Return Value
 ============
 
-:c:func:`close() <cec-close>` returns 0 on success. On error, -1 is returned, and
+:c:func:close() returns 0 on success. On error, -1 is returned, and
 ``errno`` is set appropriately. Possible error codes are:
 
 ``EBADF``
diff --git a/Documentation/userspace-api/media/cec/cec-func-ioctl.rst b/Documentation/userspace-api/media/cec/cec-func-ioctl.rst
index 3b88230fad80..a584d21afd73 100644
--- a/Documentation/userspace-api/media/cec/cec-func-ioctl.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-ioctl.rst
@@ -20,13 +20,12 @@ Synopsis
 
 
 .. c:function:: int ioctl( int fd, int request, void *argp )
-   :name: cec-ioctl
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 ``request``
     CEC ioctl request code as defined in the cec.h header file, for
@@ -39,7 +38,7 @@ Arguments
 Description
 ===========
 
-The :c:func:`ioctl() <cec-ioctl>` function manipulates cec device parameters. The
+The :c:func:ioctl() function manipulates cec device parameters. The
 argument ``fd`` must be an open file descriptor.
 
 The ioctl ``request`` code specifies the cec function to be called. It
diff --git a/Documentation/userspace-api/media/cec/cec-func-open.rst b/Documentation/userspace-api/media/cec/cec-func-open.rst
index 887bfd2a755e..ce108e699dd7 100644
--- a/Documentation/userspace-api/media/cec/cec-func-open.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-open.rst
@@ -20,7 +20,6 @@ Synopsis
 
 
 .. c:function:: int open( const char *device_name, int flags )
-   :name: cec-open
 
 
 Arguments
@@ -46,7 +45,7 @@ Arguments
 Description
 ===========
 
-To open a cec device applications call :c:func:`open() <cec-open>` with the
+To open a cec device applications call :c:func:open() with the
 desired device name. The function has no side effects; the device
 configuration remain unchanged.
 
@@ -58,7 +57,7 @@ EBADF.
 Return Value
 ============
 
-:c:func:`open() <cec-open>` returns the new file descriptor on success. On error,
+:c:func:open() returns the new file descriptor on success. On error,
 -1 is returned, and ``errno`` is set appropriately. Possible error codes
 include:
 
diff --git a/Documentation/userspace-api/media/cec/cec-func-poll.rst b/Documentation/userspace-api/media/cec/cec-func-poll.rst
index 2d87136e9a3f..1e1d95303b78 100644
--- a/Documentation/userspace-api/media/cec/cec-func-poll.rst
+++ b/Documentation/userspace-api/media/cec/cec-func-poll.rst
@@ -21,7 +21,6 @@ Synopsis
 
 
 .. c:function:: int poll( struct pollfd *ufds, unsigned int nfds, int timeout )
-   :name: cec-poll
 
 Arguments
 =========
@@ -39,10 +38,10 @@ Arguments
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
@@ -53,13 +52,13 @@ then the ``POLLPRI`` flag is set. When the function times out it returns
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
index 7f25365ce0fb..d74b6d0d44c6 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
@@ -14,14 +14,15 @@ CEC_ADAP_G_CAPS - Query device capabilities
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
 
@@ -36,32 +37,29 @@ returns the information to the application. The ioctl never fails.
 
 .. tabularcolumns:: |p{1.2cm}|p{2.5cm}|p{13.8cm}|
 
-.. c:type:: cec_caps
+.. c:struct:: cec_caps
 
-.. flat-table:: struct cec_caps
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 16
-
-    * - char
-      - ``driver[32]``
-      - The name of the cec adapter driver.
-    * - char
-      - ``name[32]``
-      - The name of this CEC adapter. The combination ``driver`` and
-	``name`` must be unique.
-    * - __u32
-      - ``available_log_addrs``
-      - The maximum number of logical addresses that can be configured.
-    * - __u32
-      - ``capabilities``
-      - The capabilities of the CEC adapter, see
-	:ref:`cec-capabilities`.
-    * - __u32
-      - ``version``
-      - CEC Framework API version, formatted with the ``KERNEL_VERSION()``
-	macro.
+    .. c:var:: char driver[32]
+
+         - The name of the cec adapter driver.
+
+    .. c:var:: char name[32]
+
+         - The name of this CEC adapter. The combination :c:var:`driver` and
+	   :c:var:`name` must be unique.
+
+    .. c:var:: __u32 available_log_addrs
+
+         - The maximum number of logical addresses that can be configured.
+
+    .. c:var:: __u32 capabilities
+
+	 - The capabilities of the CEC adapter, see :ref:`cec-capabilities`.
+
+    .. c:var:: __u32 version
 
+         - CEC Framework API version, formatted with the ``KERNEL_VERSION()``
+	   macro.
 
 .. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.6cm}|
 
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
index 6818ddf1495c..a40c81c0779a 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-conn-info.rst
@@ -16,14 +16,15 @@ CEC_ADAP_G_CONNECTOR_INFO - Query HDMI connector information
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
index 1ca893270ae9..7f5a17817c0e 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
@@ -17,17 +17,21 @@ CEC_ADAP_G_LOG_ADDRS, CEC_ADAP_S_LOG_ADDRS - Get or set the logical addresses
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_G_LOG_ADDRS, struct cec_log_addrs *argp )
+.. c:macro:: CEC_ADAP_G_LOG_ADDRS
+
+``int`` :c:expr:`ioctl(int fd, CEC_ADAP_G_LOG_ADDRS, struct cec_log_addrs *argp)`
    :name: CEC_ADAP_G_LOG_ADDRS
 
-.. c:function:: int ioctl( int fd, CEC_ADAP_S_LOG_ADDRS, struct cec_log_addrs *argp )
+.. c:macro:: CEC_ADAP_S_LOG_ADDRS
+
+``int`` :c:expr:`ioctl(int fd, CEC_ADAP_S_LOG_ADDRS, struct cec_log_addrs *argp)`
    :name: CEC_ADAP_S_LOG_ADDRS
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 ``argp``
     Pointer to struct :c:type:`cec_log_addrs`.
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst
index a10443be1b26..2d83be209dcb 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-phys-addr.rst
@@ -17,17 +17,19 @@ CEC_ADAP_G_PHYS_ADDR, CEC_ADAP_S_PHYS_ADDR - Get or set the physical address
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
index 3bc81fc5a73f..688f8e88dd86 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
@@ -15,14 +15,15 @@ CEC_DQEVENT - Dequeue a CEC event
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
index 2093e373c93c..482b5a455b9f 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-g-mode.rst
@@ -13,17 +13,19 @@ CEC_G_MODE, CEC_S_MODE - Get or set exclusive use of the CEC adapter
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
index 9d629d46973c..d5d8f63eeaf7 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
@@ -16,17 +16,20 @@ CEC_RECEIVE, CEC_TRANSMIT - Receive or transmit a CEC message
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, CEC_RECEIVE, struct cec_msg \*argp )
-    :name: CEC_RECEIVE
+.. c:macro:: CEC_RECEIVE
 
-.. c:function:: int ioctl( int fd, CEC_TRANSMIT, struct cec_msg \*argp )
+``int`` :c:expr:`ioctl(int fd, CEC_RECEIVE, struct cec_msg \*argp)`
+
+.. c:macro:: CEC_TRANSMIT
+
+``int`` :c:expr:`ioctl(int fd, CEC_TRANSMIT, struct cec_msg \*argp)`
     :name: CEC_TRANSMIT
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <cec-open>`.
+    File descriptor returned by :c:func:open().
 
 ``argp``
     Pointer to struct cec_msg.

