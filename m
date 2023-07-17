Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27176755959
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 04:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjGQCFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jul 2023 22:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjGQCFf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jul 2023 22:05:35 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FA1E59
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 19:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
 s=s31663417; t=1689559513; x=1690164313; i=herdler@nurfuerspam.de;
 bh=6OK+51PxWkpr71LO+waoHMTQ1eiHtOD8mEdk2Zfv/Dk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=mo6VW4fC7EPQyN+M+vudfzReybSp9CZrKZgdoqaIyhXSBprPtUmrZR2tVXEJmd7KVnNmelc
 oLKy1UTqX2cF3GNtwZXI2+pMGTyHILsBlIvPj/CPZJdBeTgEZ8m+QRTWFM6lOi5CRWee9sDTc
 Q704WPAxiDSbwIGMwX/ar7DR/CWjHw4Rev/N+YocbaJqAw1fambpvt55YhOYJcSkZdE1dU/Ed
 9Pm1mZBwaeIR9jOwDZogADbrT3MmA/kH7LExk4kiaHk0TNhrWvv8SvPJ1re533tD20JUwYaU3
 THKog+3eZOTFuFCfNxueCTV7tZ561YuxU9NGjfy5pOWbzj8HhLiw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.179.15]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnJlc-1pbxAz0OgO-00jFCN; Mon, 17
 Jul 2023 04:05:13 +0200
From:   Stefan Herdler <herdler@nurfuerspam.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
Subject: [PATCH v3 6/6] Add documentation for video.h (function calls)
Date:   Mon, 17 Jul 2023 04:04:46 +0200
Message-Id: <20230717020446.28877-7-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20230717020446.28877-1-herdler@nurfuerspam.de>
References: <20230717020446.28877-1-herdler@nurfuerspam.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:znmhnkXcWLq1MSHMPn/h27SaSF/AEahogIqNBVjzA3opi51S+DB
 QB4nRo0yhw6lCpLsw2SuNtJwMRH1rynK1yONOJuGCKyTDg4bBz++InAn3v859fOtfRZQVrR
 1MARY7/HpQQWlVv2KPac/DtKQ2s51NNWYZGmg6upJjeBIcbFFwfkWllTs8m1DIGYe3xes0q
 OWnAo4s/eqJAytd9rkzNQ==
UI-OutboundReport: notjunk:1;M01:P0:TLQXWNX9txY=;DMVIoNHZRefkVLUM0kLFV+rBuy7
 GkcCnPo5GnfR31vQFKCbfaP+j9Hj6oOB60kdET5wmKHUNjMjSiP1ODFBO74cgnDWkYDWWyluN
 vjrsIIIMsYzDp+PPVHHEVys8z4HWZSraBjsPvEhlXDIjsbnV4vO+1Grp7e7Bd3kNQcej4yHWk
 spm0uWnZNJdpcv+vaZUTV+uHWOvhIh2+R574CkcJQcSs4JSu93DdwgydmkhgVVh/j8G/SoFlF
 kPxRBddDSsNtBmr52alHQ9K8O367IAzrz7pahbwi6KjJLJ+iEGIF3HfkZIc0dz38NH+YD3Usm
 VgcYDyUxpTJZebSozQQkGomQAcPpN6imUohOcKyGshIrzsZV7zhW22WRlsVpypZ3S/tT36sYl
 D2h8k3zNjoIF01QEssF+2aCH30fO15NJ/VYlJqMR5cPAGGqjNKu3M+q9zUV0bhMccHtjh/eW3
 k8sgHBQt1o83tP6M290AnPjL3thcsRmgVCbjOswR6SGmj5ZT6RSJoHC1WPJXQuwHobI2nr36O
 /JtQ/lYR5XOOMFZq1nvOE22bTbHNQWhQd7F/ZalDt8BrLBL9bp3Xlmpb6MrkBqxx8hKbpo1cb
 Gpq96I+bE8jKVMLebHF4LOsoDVcGQIljQsY95epyx3Hzd+RlpxUUDKmkAvqkj3eZN5Y3FrniZ
 b9Q/WLICrGe1Cxqhh7OJjcRIrt1VqV0rK4dfHAYc+P+JzQCqgGCJAkrSF8c1VU35XS1uGEQ9U
 0MNyUZVvkYwhIOSHUfr580K9A5JnUwxRk8ptOxyVpl0j1mwfvlkyx80sRU6Q/OjlCuoC6Cxlw
 X7/wwzwpKDNsXzelD+N+86H9B4bOHvl59sYZwKdt/52/TZ4hbHxqs3aUY0XlFv0YlUsbbLBUw
 q77fHJ1Z0uPpVos/XC564v2RKseongbiKmURupoLyGCFxctXGHiEvvG9lHcEe10/mzeEGhmol
 cKKbIQqRAWbZNA4EKj5xwo1DfwI=
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,NO_DNS_FOR_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Step 2: Add documentation for function calls.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

Possibly unused:
struct video_command
ioctl VIDEO_COMMAND
ioctl VIDEO_TRY_COMMAND
ioctl VIDEO_GET_FRAME_COUNT

Out of tree only usage:
VIDEO_SET_STREAMTYPE



VIDEO_COMMAND:
False positive on AV7110 driver. The driver uses identical symbol names.

The ioctl VIDEO_COMMAND has been introduced 2007 way after the AV7110
driver.
The log says it has been added to support the cx23415 decoder and has
probably never used for enything else.
And AFAIK has the cx23415 decoder been switched to V4L2-API some time ago.



VIDEO_SET_STREAMTYPE:
Used by the "Enigma2" set top boxes only.
Stream type definitions are from there.



>> +VIDEO_GET_EVENT
>> +---------------
[...]
> Same comments as I did for demux event applies here: what happens if
> userspace misses the event?
>
> Btw, this explanation is a lot better than the one at demux. You
> should probably place something like that there too... there is
> block/nonblock mode for the demux event? Do they behave the same?

I'm a little confused here, a demux event doesn't seem to exist any more.
Are you referring to the legacy "dvb_frontend_event"?

I could place some documentation there, but I'm not sure, if it really
applies there too.
Anyway, I have to take a closer look before, but I would like to finish
this files first ;-).



 .../media/dvb/legacy_dvb_video.rst            | 1632 +++++++++++++++++
 1 file changed, 1632 insertions(+)

diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst b/=
Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
index 165fd6005a07..918ef3f84f72 100644
=2D-- a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
@@ -796,3 +796,1635 @@ Description

 A call to `VIDEO_GET_CAPABILITIES`_ returns an unsigned integer with the
 following bits set according to the hardware's capabilities.
+
+
+-----
+
+
+Video Function Calls
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+
+VIDEO_STOP
+----------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_STOP
+
+.. code-block:: c
+
+	int ioctl(fd, VIDEO_STOP, int mode)
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
+       -  :cspan:`1` Equals ``VIDEO_STOP`` for this command.
+
+    -  ..
+
+       -  :rspan:`2` ``int mode``
+
+       -  :cspan:`1` Indicates how the screen shall be handled.
+
+    -  ..
+
+       -  TRUE  ( !=3D 0 )
+
+       -  Blank screen when stop.
+
+    -  ..
+
+       -  FALSE ( =3D=3D 0 )
+
+       -  Show last decoded frame.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl is for Digital TV devices only. To control a V4L2 decoder use
+the V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
+
+This ioctl call asks the Video Device to stop playing the current
+stream. Depending on the input parameter, the screen can be blanked out
+or displaying the last decoded frame.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_PLAY
+----------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_PLAY
+
+.. code-block:: c
+
+	int ioctl(fd, VIDEO_PLAY)
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
+       -  Equals ``VIDEO_PLAY`` for this command.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl is for Digital TV devices only. To control a V4L2 decoder use
+the V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
+
+This ioctl call asks the Video Device to start playing a video stream
+from the selected source.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_FREEZE
+------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_FREEZE
+
+.. code-block:: c
+
+	int ioctl(fd, VIDEO_FREEZE)
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
+       -  Equals ``VIDEO_FREEZE`` for this command.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl is for Digital TV devices only. To control a V4L2 decoder use
+the V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
+
+This ioctl call suspends the live video stream being played, if
+VIDEO_SOURCE_DEMUX is selected. Decoding and playing are frozen.
+It is then possible to restart the decoding and playing process of the
+video stream using the `VIDEO_CONTINUE`_ command.
+If VIDEO_SOURCE_MEMORY is selected in the ioctl call
+`VIDEO_SELECT_SOURCE`_, the Digital TV subsystem will not decode any more
+data until the ioctl call `VIDEO_CONTINUE`_ or `VIDEO_PLAY`_ is performed=
.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_CONTINUE
+--------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_CONTINUE
+
+.. code-block:: c
+
+	int ioctl(fd, VIDEO_CONTINUE)
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
+       -  Equals ``VIDEO_CONTINUE`` for this command.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl is for Digital TV devices only. To control a V4L2 decoder use
+the V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
+
+This ioctl call restarts decoding and playing processes of the video
+stream which was played before a call to `VIDEO_FREEZE`_ was made.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_SELECT_SOURCE
+-------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_SELECT_SOURCE
+
+.. code-block:: c
+
+	int ioctl(fd, VIDEO_SELECT_SOURCE, video_stream_source_t source)
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
+       -  Equals ``VIDEO_SELECT_SOURCE`` for this command.
+
+    -  ..
+
+       -  `video_stream_source_t`_ ``source``
+
+       -  Indicates which source shall be used for the Video stream.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl is for Digital TV devices only. This ioctl was also supported
+by the V4L2 ivtv driver, but that has been replaced by the ivtv-specific
+``IVTV_IOC_PASSTHROUGH_MODE`` ioctl.
+
+This ioctl call informs the video device which source shall be used for
+the input data. The possible sources are demux or memory. If memory is
+selected, the data is fed to the video device through the write command
+using the struct `video_stream_source_t`_. If demux is selected, the data
+is directly transferred from the onboard demux-device to the decoder.
+
+The data fed to the decoder is also controlled by the PID-filter.
+Output selection: :c:enum:`dmx_output` ``DMX_OUT_DECODER``.
+
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_SET_BLANK
+---------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_SET_BLANK
+
+.. code-block:: c
+
+	int ioctl(fd, VIDEO_SET_BLANK, int mode)
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
+       -  :cspan:`1` Equals ``VIDEO_SET_BLANK`` for this command.
+
+    -  ..
+
+       -  :rspan:`2` ``int mode``
+
+       -  :cspan:`1` Indicates if the screen shall be blanked.
+
+    -  ..
+
+       -  TRUE  ( !=3D 0 )
+
+       -  Blank screen when stop.
+
+    -  ..
+
+       -  FALSE ( =3D=3D 0 )
+
+       -  Show last decoded frame.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the Video Device to blank out the picture.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_GET_STATUS
+----------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_GET_STATUS
+
+.. code-block:: c
+
+	int ioctl(fd, int request =3D VIDEO_GET_STATUS,
+	struct video_status *status)
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
+       -  Equals ``VIDEO_GET_STATUS`` for this command.
+
+    -  ..
+
+       -  ``struct`` `video_status`_ ``*status``
+
+       -  Returns the current status of the Video Device.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the Video Device to return the current status of
+the device.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_GET_EVENT
+---------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_GET_EVENT
+
+.. code-block:: c
+
+	int ioctl(fd, int request =3D VIDEO_GET_EVENT,
+	struct video_event *ev)
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
+       -  Equals ``VIDEO_GET_EVENT`` for this command.
+
+    -  ..
+
+       -  ``struct`` `video_event`_ ``*ev``
+
+       -  Points to the location where the event, if any, is to be stored=
.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl is for DVB devices only. To get events from a V4L2 decoder
+use the V4L2 :ref:`VIDIOC_DQEVENT` ioctl instead.
+
+This ioctl call returns an event of type `video_event`_ if available. A
+certain number of the latest events will be cued and returned in order of
+occurrence. Older events may be discarded if not fetched in time. If
+an event is not available, the behavior depends on whether the device is
+in blocking or non-blocking mode. In the latter case, the call fails
+immediately with errno set to ``EWOULDBLOCK``. In the former case, the
+call blocks until an event becomes available. The standard Linux poll()
+and/or select() system calls can be used with the device file descriptor
+to watch for new events. For select(), the file descriptor should be
+included in the exceptfds argument, and for poll(), POLLPRI should be
+specified as the wake-up condition. Read-only permissions are sufficient
+for this ioctl call.
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
+       -  ``EWOULDBLOCK``
+
+       -  :cspan:`1` There is no event pending, and the device is in
+          non-blocking mode.
+
+    -  ..
+
+       -  ``EOVERFLOW``
+
+       -  Overflow in event queue - one or more events were lost.
+
+
+-----
+
+
+VIDEO_SET_DISPLAY_FORMAT
+------------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_SET_DISPLAY_FORMAT
+
+.. code-block:: c
+
+	int ioctl(fd, int request =3D VIDEO_SET_DISPLAY_FORMAT,
+	video_display_format_t format)
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
+       -  Equals ``VIDEO_SET_DISPLAY_FORMAT`` for this command.
+
+    -  ..
+
+       -  `video_displayformat_t`_ ``format``
+
+       -  Selects the video format to be used.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the Video Device to select the video format to be
+applied by the MPEG chip on the video.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_STILLPICTURE
+------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_STILLPICTURE
+
+.. code-block:: c
+
+	int ioctl(fd, int request =3D VIDEO_STILLPICTURE,
+	struct video_still_picture *sp)
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
+       -  Equals ``VIDEO_STILLPICTURE`` for this command.
+
+    -  ..
+
+       -  ``struct`` `video_still_picture`_ ``*sp``
+
+       -  Pointer to the location where the struct with the I-frame
+          and size is stored.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the Video Device to display a still picture
+(I-frame). The input data shall be the section of an elementary video
+stream containing an I-frame. Typically this section is extracted from a
+TS or PES recording. Resolution and codec (see `video capabilities`_) mus=
t
+be supported by the device. If the pointer is NULL, then the current
+displayed still picture is blanked.
+
+e.g. The AV7110 supports MPEG1 and MPEG2 with the common PAL-SD
+resolutions.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_FAST_FORWARD
+------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_FAST_FORWARD
+
+.. code-block:: c
+
+	int ioctl(fd, int request =3D VIDEO_FAST_FORWARD, int nFrames)
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
+       -  Equals ``VIDEO_FAST_FORWARD`` for this command.
+
+    -  ..
+
+       -  ``int nFrames``
+
+       -  The number of frames to skip.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the Video Device to skip decoding of N number of
+I-frames. This call can only be used if ``VIDEO_SOURCE_MEMORY`` is
+selected.
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
+       -  ``EPERM``
+
+       -  Mode ``VIDEO_SOURCE_MEMORY`` not selected.
+
+
+-----
+
+
+VIDEO_SLOWMOTION
+----------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_SLOWMOTION
+
+.. code-block:: c
+
+	int ioctl(fd, int request =3D VIDEO_SLOWMOTION, int nFrames)
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
+       -  Equals ``VIDEO_SLOWMOTION`` for this command.
+
+    -  ..
+
+       -  ``int nFrames``
+
+       -  The number of times to repeat each frame.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the video device to repeat decoding frames N number
+of times. This call can only be used if ``VIDEO_SOURCE_MEMORY`` is
+selected.
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
+       -  ``EPERM``
+
+       -  Mode ``VIDEO_SOURCE_MEMORY`` not selected.
+
+
+-----
+
+
+VIDEO_GET_CAPABILITIES
+----------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_GET_CAPABILITIES
+
+.. code-block:: c
+
+	int ioctl(fd, int request =3D VIDEO_GET_CAPABILITIES, unsigned int *cap)
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
+       -  Equals ``VIDEO_GET_CAPABILITIES`` for this command.
+
+    -  ..
+
+       -  ``unsigned int *cap``
+
+       -  Pointer to a location where to store the capability information=
.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the video device about its decoding capabilities.
+On success it returns an integer which has bits set according to the
+defines in `video capabilities`_.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_CLEAR_BUFFER
+------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_CLEAR_BUFFER
+
+.. code-block:: c
+
+	int ioctl(fd, int request =3D VIDEO_CLEAR_BUFFER)
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
+       -  Equals ``VIDEO_CLEAR_BUFFER`` for this command.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call clears all video buffers in the driver and in the
+decoder hardware.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_SET_STREAMTYPE
+--------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_SET_STREAMTYPE
+
+.. code-block:: c
+
+	int ioctl(fd, int request =3D VIDEO_SET_STREAMTYPE, int type)
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
+       -  Equals ``VIDEO_SET_STREAMTYPE`` for this command.
+
+    -  ..
+
+       -  ``int type``
+
+       -  Stream type.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl tells the driver which kind of stream to expect being written
+to it.
+Intelligent decoder might also not support or ignore (like the AV7110)
+this call and determine the stream type themselves.
+
+Currently used stream types:
+
+.. flat-table::
+    :header-rows:  1
+    :stub-columns: 0
+
+    -  ..
+
+       -  Codec
+
+       -  Stream type
+
+    -  ..
+
+       -  MPEG2
+
+       -  0
+
+    -  ..
+
+       -  MPEG4 h.264
+
+       -  1
+
+    -  ..
+
+       -  VC1
+
+       -  3
+
+    -  ..
+
+       -  MPEG4 Part2
+
+       -  4
+
+    -  ..
+
+       -  VC1 SM
+
+       -  5
+
+    -  ..
+
+       -  MPEG1
+
+       -  6
+
+    -  ..
+
+       -  HEVC h.265
+
+       -  | 7
+          | DREAMBOX: 22
+
+    -  ..
+
+       -  AVS
+
+       -  16
+
+    -  ..
+
+       -  AVS2
+
+       -  40
+
+Not every decoder supports all stream types.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_SET_FORMAT
+----------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_SET_FORMAT
+
+.. code-block:: c
+
+	int ioctl(fd, int request =3D VIDEO_SET_FORMAT, video_format_t format)
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
+       -  Equals ``VIDEO_SET_FORMAT`` for this command.
+
+    -  ..
+
+       -  `video_format_t`_ ``format``
+
+       -  Video format of TV as defined in section `video_format_t`_.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl sets the screen format (aspect ratio) of the connected output
+device (TV) so that the output of the decoder can be adjusted
+accordingly.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_GET_SIZE
+--------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_GET_SIZE
+
+.. code-block:: c
+
+	int ioctl(int fd, int request =3D VIDEO_GET_SIZE, video_size_t *size)
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
+       -  :cspan:`1` File descriptor returned by a previous call,
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals ``VIDEO_GET_SIZE`` for this command.
+
+    -  ..
+
+       -  `video_size_t`_ ``*size``
+
+       -  Returns the size and aspect ratio.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl returns the size and aspect ratio.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_GET_PTS
+-------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_GET_PTS
+
+.. code-block:: c
+
+	int ioctl(int fd, int request =3D VIDEO_GET_PTS, __u64 *pts)
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
+       -  Equals ``VIDEO_GET_PTS`` for this command.
+
+    -  ..
+
+       -  ``__u64 *pts``
+
+       -  Returns the 33-bit timestamp as defined in ITU T-REC-H.222.0 /
+          ISO/IEC 13818-1.
+
+          The PTS should belong to the currently played frame if possible=
,
+          but may also be a value close to it like the PTS of the last
+          decoded frame or the last PTS extracted by the PES parser.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+For V4L2 decoders this ioctl has been replaced by the
+``V4L2_CID_MPEG_VIDEO_DEC_PTS`` control.
+
+This ioctl call asks the Video Device to return the current PTS
+timestamp.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_GET_FRAME_COUNT
+---------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_GET_FRAME_COUNT
+
+.. code-block:: c
+
+	int ioctl(int fd, VIDEO_GET_FRAME_COUNT, __u64 *pts)
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
+       -  Equals ``VIDEO_GET_FRAME_COUNT`` for this command.
+
+    -  ..
+
+       -  ``__u64 *pts``
+
+       -  Returns the number of frames displayed since the decoder was
+          started.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+For V4L2 decoders this ioctl has been replaced by the
+``V4L2_CID_MPEG_VIDEO_DEC_FRAME`` control.
+
+This ioctl call asks the Video Device to return the number of displayed
+frames since the decoder was started.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_COMMAND
+-------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_COMMAND
+
+.. code-block:: c
+
+	int ioctl(int fd, int request =3D VIDEO_COMMAND,
+	struct video_command *cmd)
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
+       -  Equals ``VIDEO_COMMAND`` for this command.
+
+    -  ..
+
+       -  `struct video_command`_ ``*cmd``
+
+       -  Commands the decoder.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+For V4L2 decoders this ioctl has been replaced by the
+:ref:`VIDIOC_DECODER_CMD` ioctl.
+
+This ioctl commands the decoder. The `struct video_command`_ is a
+subset of the ``v4l2_decoder_cmd`` struct, so refer to the
+:ref:`VIDIOC_DECODER_CMD` documentation for
+more information.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+VIDEO_TRY_COMMAND
+-----------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: VIDEO_TRY_COMMAND
+
+.. code-block:: c
+
+	int ioctl(int fd, int request =3D VIDEO_TRY_COMMAND,
+	struct video_command *cmd)
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
+       -  Equals ``VIDEO_TRY_COMMAND`` for this command.
+
+    -  ..
+
+       -  `struct video_command`_ ``*cmd``
+
+       -  Try a decoder command.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+For V4L2 decoders this ioctl has been replaced by the
+:ref:`VIDIOC_TRY_DECODER_CMD <VIDIOC_DECODER_CMD>` ioctl.
+
+This ioctl tries a decoder command. The `struct video_command`_ is a
+subset of the ``v4l2_decoder_cmd`` struct, so refer to the
+:ref:`VIDIOC_TRY_DECODER_CMD <VIDIOC_DECODER_CMD>` documentation
+for more information.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
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
+.. c:function:: 	int open(const char *deviceName, int flags)
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
+       -  Name of specific video device.
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
+This system call opens a named video device (e.g.
+/dev/dvb/adapter?/video?) for subsequent use.
+
+When an open() call has succeeded, the device will be ready for use. The
+significance of blocking or non-blocking mode is described in the
+documentation for functions where there is a difference. It does not
+affect the semantics of the open() call itself. A device opened in
+blocking mode can later be put into non-blocking mode (and vice versa)
+using the F_SETFL command of the fcntl system call. This is a standard
+system call, documented in the Linux manual page for fcntl. Only one
+user can open the Video Device in O_RDWR mode. All other attempts to
+open the device in this mode will fail, and an error-code will be
+returned. If the Video Device is opened in O_RDONLY mode, the only
+ioctl call that can be used is `VIDEO_GET_STATUS`_. All other call will
+return an error code.
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
+       -  :cspan:`1` Device driver not loaded/available.
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
+.. c:function:: 	int close(int fd)
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
+Description
+~~~~~~~~~~~
+
+This system call closes a previously opened video device.
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
+
+
+-----
+
+
+write()
+-------
+
+Synopsis
+~~~~~~~~
+
+.. c:function:: size_t write(int fd, const void *buf, size_t count)
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
+       -  ``void *buf``
+
+       -  Pointer to the buffer containing the PES data.
+
+    -  ..
+
+       -  ``size_t count``
+
+       -  Size of buf.
+
+Description
+~~~~~~~~~~~
+
+This system call can only be used if VIDEO_SOURCE_MEMORY is selected
+in the ioctl call `VIDEO_SELECT_SOURCE`_. The data provided shall be in
+PES format, unless the capability allows other formats. TS is the
+most common format for storing DVB-data, it is usually supported too.
+If O_NONBLOCK is not specified the function will block until buffer space
+is available. The amount of data to be transferred is implied by count.
+
+.. note:: See: :ref:`DVB Data Formats <legacy_dvb_decoder_formats>`
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
+       -  ``EPERM``
+
+       -  :cspan:`1` Mode ``VIDEO_SOURCE_MEMORY`` not selected.
+
+    -  ..
+
+       -  ``ENOMEM``
+
+       -  Attempted to write more data than the internal buffer can hold.
+
+    -  ..
+
+       -  ``EBADF``
+
+       -  fd is not a valid open file descriptor.
=2D-
2.34.0

