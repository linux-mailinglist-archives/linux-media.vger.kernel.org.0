Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671AF29815F
	for <lists+linux-media@lfdr.de>; Sun, 25 Oct 2020 11:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415278AbgJYKxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Oct 2020 06:53:01 -0400
Received: from aibo.runbox.com ([91.220.196.211]:45814 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405705AbgJYKxB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Oct 2020 06:53:01 -0400
X-Greylist: delayed 2447 seconds by postgrey-1.27 at vger.kernel.org; Sun, 25 Oct 2020 06:53:00 EDT
Received: from [10.9.9.72] (helo=submission01.runbox)
        by mailtransmit02.runbox with esmtp (Exim 4.86_2)
        (envelope-from <post@jbechtel.de>)
        id 1kWd0W-0003rm-9q
        for linux-media@vger.kernel.org; Sun, 25 Oct 2020 11:12:12 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated alias (535840)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kWd0E-0006L2-Dy
        for linux-media@vger.kernel.org; Sun, 25 Oct 2020 11:11:55 +0100
Date:   Sun, 25 Oct 2020 11:08:31 +0100
From:   Jonas Bechtel <post@jbechtel.de>
To:     linux-media@vger.kernel.org
Subject: Lots of hurdles for webcam usage (UVC/v4l2loopback and more?)
Message-ID: <20201025110831.73d2cd11@mmluhan>
X-Mailer: Claws Mail ~3.16
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Dear Linux Media developers,

just wanted to tell you that it's not easy to use an old but working camcorder for videoconferencing with (GNU/)Linux.

See my tries below. So far there's no _well_ working situation, but you can make it somehow running for the browser with v42lloopback + v4lcompat.so.

Unfortunately this message of mine is probably not feasible for a productive see-bug-find-error-patch-code workflow. My personal guess is that lots of programs which use video4linux were implemented as #worksforme influencing each other in using odd ioctl variations. There seems to be missing some instance which straightens common interface usage conventions.

BR
 Jonas



Setting: 

Linux 4.19.67
v4l2loopback 0.12.1, started with
    devices=6
    video_nr=10,11,12,13,14,15
    card_label=loop10a,loop11b,loop12c,loop13d,loop14e,loop15f
Camcorder Panasonic NV-GS11, webcam mode, driver uvcvideo, on video0 (and video1)
qv4l2 1.16.3 (seemingly same effects on 1.20+ (recent git))
ffmpeg 4.1.4
vlc 3.0.8
Firefox 68.7.0esr and 78.4.0esr (no difference)




Setting up video11:
I had to code some initialization program as v4l2loopback-ctl is invoking gst-launch-1.0 which doesn't accept RGB3 setting.
ioctl(fd, VIDIOC_S_FMT, {V4L2_BUF_TYPE_VIDEO_OUTPUT, {width=320, height=240, pixelformat=RGB3})
ioctl(fd, VIDIOC_S_PARAM, {V4L2_BUF_TYPE_VIDEO_CAPTURE[but could probably be _OUTPUT as well], {timeperframe=1/15}})


Setting up video12:
v4l2loopback-ctl set-caps "video/x-raw, format=UYVY, width=320, height=240" /dev/video12
sudo v4l2loopback-ctl set-fps 15 /dev/video12


Note that you only can configure format for loop once. After first stream use, v4l2loopback driver block further changes.


Feeding the loop:
ffmpeg -f v4l2 -i /dev/video0 -an -filter_complex "[0]format=rgb24" -f v4l2 /dev/video11
OR
ffmpeg -f v4l2 -i /dev/video0 -an -filter_complex "[0]format=yuv420p" -f v4l2 /dev/video12
(or yuv422p)



build process for qv4l2 (v4l-utils), recent from git:
QT_SELECT=5 needed, in order to make "moc" be found by qtchooser.




Every of the methods has, if working at all, has at least a delay of ~ 500 ms to real life.




Camcorder - ffplay -> OK (despite the typical SEGV on close)

Camcorder - Firefox -> AbortError (but keeps device node blocked/reserved against others)

Camcorder - Firefox+v4lcompat.so -> Same 

Camcorder - vlc -> cannot start streaming: Input/output error [__001, see bottom]
Camcorder - vlc+v4l2compat.so -> Same

Camcorder - qv4l2 click on Play -> OK (MJPG)

Camcorder - qv4l2 choose RGB3/YV12/..., click on play -> grey picture. Program has to be restarted.

Camcorder - v4l2ucp -> OK, working under any circumstances (but it's only function is to set the physical zoom)





Camcorder - ffmpeg -vf format=rgb24 - video11 - Firefox -> AbortError

Camcorder - ffmpeg -vf format=rgb24 - video11 - Firefox+v4lcompat.so -> OK, but after tab-close camera not accessible any more. Not usable after accidently having opened video0 (OverConstrainedError).

Camcorder - ffmpeg -vf format=rgb24 - video11 - vlc -> OK
Camcorder - ffmpeg -vf format=rgb24 - video11 - vlc+v4l2compat.so -> OK

Camcorder - ffmpeg -vf format=rgb24 - video11 - qv4l2 -> High CPU load on settings panel (mass ioctls on VIDIOC_DQEVENT). When clicking "play" cpu load sinks but no image window opens.

Camcorder - ffmpeg -vf format=yuv422p or =yuv420p - video12 - qv4l2 -> Same



Camcorder - ffmpeg -vf format=yuv422p or =yuv420p - video12 - vlc/Firefox+v4lcompat.so -> unidentifiable picture content, repeated, heavily colorized
Firefox show still image with yuv420p and live image with yuv422p.

Camcorder - ffmpeg -vf format=yuv422p or =yuv420p - video12 - vlc/Firefox -> Same

Camcorder - ffmpeg -vf format=yuv422p - video12 - ffplay -> Same
Camcorder - ffmpeg -vf format=yuv420p - video12 - ffplay -> Same still image, additionally heavily complaining about wrong buffer sizes




Firefox with v4l2compat seems to perform some preselection (only deletes entries in webcam list), whereas Firefox without v4l2compat always shows all devices /dev/video* (but you have to no the order by heart because the names of the webcams don't get exposed to the websites)




[__001]
$ LANG=C vlc v4l2:///dev/video0
VLC media player 3.0.8 Vetinari (revision 3.0.8-0-gf350b6b5a7)
[5721c270] main libvlc: Running vlc with the default interface. Use 'cvlc' to use vlc without interface.
libv4l2: error turning on stream: Input/output error
[e9c00b90] v4l2 demux error: cannot start streaming: Input/output error
[e9c00b90] v4l2 demux error: not a radio tuner device
libv4l2: error turning on stream: Input/output error
[e9c02540] v4l2 stream error: cannot start streaming: Input/output error
QObject::~QObject: Timers cannot be stopped from another thread

Last ioctl before first Input/output error was:
ioctl(22, VIDIOC_STREAMON, [V4L2_BUF_TYPE_VIDEO_CAPTURE]) = -1 EIO (Input/output error)






