Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1427A2780AF
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 08:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgIYGbI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 02:31:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:57712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727176AbgIYGa4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 02:30:56 -0400
Received: from mail.kernel.org (ip5f5ad5bf.dynamic.kabel-deutschland.de [95.90.213.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 799AF22211;
        Fri, 25 Sep 2020 06:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601015452;
        bh=RxrUeiixruN+BrBdqPYnIbJV2gFqDH5tfRWD+eGKxXE=;
        h=From:To:Cc:Subject:Date:From;
        b=stIZd/bAZgfnOZMkmJ8kjAsZqwyNZX1/llGqBTMlC6a7dNHouvRibHc2HejOAYbVH
         NlRjFZgybO1exAvww8q8jU0sfZUyyaj+aImb0LNuXaU0kzuF/F5zbCnEvdjvaLrKsF
         DvTO8STIHx52wz5M9RwdG8ffmhDYhRuUvAyBmaDM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kLhFn-000R4a-KW; Fri, 25 Sep 2020 08:30:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Alexandre Courbot <acourbot@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jian-Jia Su <jjsu@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sean Young <sean@mess.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Subject: [PATCH v3 0/8] Improve support for building docs with Sphinx 3.1+
Date:   Fri, 25 Sep 2020 08:30:38 +0200
Message-Id: <cover.1601014299.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sphinx 3.x new c domain code broke the doc build on several ways:

- it broke the cdomains.py extension that were giving namespace
  support for C references;
- it broke the automarkup script;
- it broke c:type references that kernel-doc and other parts of the
  kernel were using to do cross-references with C declarations.

This series address only part of those issues. It halves the number
of warnings produced when Spinx 3.x is used.  Yet, we still
have 1.7 K warnings.

The good thing is that the media documentation is almost
clean of warnings (there are still some warnings at the glossary,
that are unrelated to C domains). 

At this version 3, I changed the first patch to only support
Sphinx 3.1+ namespaces. This is enough for fixing the issues
at the media docs. 

The second patch disables the automarkup extension on
Sphinx 3.x. Due to the C domain code re-write, the internal
representation of C references is different. It sounds that
the x-ref class needs to be "cexpr" or something like that,
but futher work is required. So, for now, let's just disable it.

Patch 3 makes kernel-doc aware of Sphinx version, and makes
it use a different syntax for Sphinx 3.x. I'm not sure if all
cases were covered there, but at least the most common
one (wrong usage of c:type reference) was covered.

The remaining patches change the media documentation
for it to use the c:namespace macro.

Mauro Carvalho Chehab (8):
  docs: cdomain.py: add support for a new Sphinx 3.1+ tag
  docs: conf.py: disable automarkup for Sphinx 3.x
  scripts: kernel-doc: make it more compatible with Sphinx 3.x
  media: docs: make CEC documents compatible with Sphinx 3.1+
  media: docs: make V4L documents more compatible with Sphinx 3.1+
  media: docs: make DVB documents more compatible with Sphinx 3.1+
  media: docs: make MC documents more compatible with Sphinx 3.1+
  media: docs: make RC documents more compatible with Sphinx 3.1+

 Documentation/conf.py                         |  4 +-
 Documentation/sphinx/cdomain.py               | 55 +++++++++++++-
 .../media/cec/cec-func-close.rst              | 10 +--
 .../media/cec/cec-func-ioctl.rst              | 11 +--
 .../userspace-api/media/cec/cec-func-open.rst | 10 +--
 .../userspace-api/media/cec/cec-func-poll.rst | 14 ++--
 .../media/cec/cec-ioc-adap-g-caps.rst         | 10 +--
 .../media/cec/cec-ioc-adap-g-conn-info.rst    | 11 +--
 .../media/cec/cec-ioc-adap-g-log-addrs.rst    | 20 ++---
 .../media/cec/cec-ioc-adap-g-phys-addr.rst    | 15 ++--
 .../media/cec/cec-ioc-dqevent.rst             | 15 ++--
 .../media/cec/cec-ioc-g-mode.rst              | 16 ++--
 .../media/cec/cec-ioc-receive.rst             | 18 ++---
 .../dvb/audio-bilingual-channel-select.rst    |  7 +-
 .../media/dvb/audio-channel-select.rst        |  8 +-
 .../media/dvb/audio-clear-buffer.rst          |  8 +-
 .../media/dvb/audio-continue.rst              |  7 +-
 .../userspace-api/media/dvb/audio-fclose.rst  |  7 +-
 .../userspace-api/media/dvb/audio-fopen.rst   |  7 +-
 .../userspace-api/media/dvb/audio-fwrite.rst  |  7 +-
 .../media/dvb/audio-get-capabilities.rst      |  8 +-
 .../media/dvb/audio-get-status.rst            |  8 +-
 .../userspace-api/media/dvb/audio-pause.rst   |  9 +--
 .../userspace-api/media/dvb/audio-play.rst    |  7 +-
 .../media/dvb/audio-select-source.rst         |  8 +-
 .../media/dvb/audio-set-av-sync.rst           |  8 +-
 .../media/dvb/audio-set-bypass-mode.rst       |  9 +--
 .../userspace-api/media/dvb/audio-set-id.rst  |  9 +--
 .../media/dvb/audio-set-mixer.rst             |  9 +--
 .../media/dvb/audio-set-mute.rst              |  8 +-
 .../media/dvb/audio-set-streamtype.rst        | 10 +--
 .../userspace-api/media/dvb/audio-stop.rst    |  9 +--
 .../userspace-api/media/dvb/ca-fclose.rst     |  7 +-
 .../userspace-api/media/dvb/ca-fopen.rst      |  7 +-
 .../userspace-api/media/dvb/ca-get-cap.rst    |  8 +-
 .../media/dvb/ca-get-descr-info.rst           |  9 ++-
 .../userspace-api/media/dvb/ca-get-msg.rst    | 10 +--
 .../media/dvb/ca-get-slot-info.rst            |  9 +--
 .../userspace-api/media/dvb/ca-reset.rst      |  9 +--
 .../userspace-api/media/dvb/ca-send-msg.rst   |  9 +--
 .../userspace-api/media/dvb/ca-set-descr.rst  |  8 +-
 .../userspace-api/media/dvb/dmx-add-pid.rst   | 10 +--
 .../userspace-api/media/dvb/dmx-expbuf.rst    | 11 +--
 .../userspace-api/media/dvb/dmx-fclose.rst    |  9 +--
 .../userspace-api/media/dvb/dmx-fopen.rst     |  5 +-
 .../userspace-api/media/dvb/dmx-fread.rst     |  7 +-
 .../userspace-api/media/dvb/dmx-fwrite.rst    |  6 +-
 .../media/dvb/dmx-get-pes-pids.rst            | 12 ++-
 .../userspace-api/media/dvb/dmx-get-stc.rst   | 12 ++-
 .../userspace-api/media/dvb/dmx-mmap.rst      | 15 ++--
 .../userspace-api/media/dvb/dmx-munmap.rst    | 14 ++--
 .../userspace-api/media/dvb/dmx-qbuf.rst      | 17 ++---
 .../userspace-api/media/dvb/dmx-querybuf.rst  |  9 +--
 .../media/dvb/dmx-remove-pid.rst              | 10 +--
 .../userspace-api/media/dvb/dmx-reqbufs.rst   |  9 +--
 .../media/dvb/dmx-set-buffer-size.rst         | 10 +--
 .../media/dvb/dmx-set-filter.rst              | 12 ++-
 .../media/dvb/dmx-set-pes-filter.rst          | 13 +---
 .../userspace-api/media/dvb/dmx-start.rst     | 11 +--
 .../userspace-api/media/dvb/dmx-stop.rst      |  9 +--
 .../media/dvb/fe-diseqc-recv-slave-reply.rst  |  9 +--
 .../media/dvb/fe-diseqc-reset-overload.rst    |  9 +--
 .../media/dvb/fe-diseqc-send-burst.rst        | 10 +--
 .../media/dvb/fe-diseqc-send-master-cmd.rst   |  9 +--
 .../dvb/fe-dishnetwork-send-legacy-cmd.rst    | 10 +--
 .../media/dvb/fe-enable-high-lnb-voltage.rst  | 10 +--
 .../userspace-api/media/dvb/fe-get-event.rst  | 12 +--
 .../media/dvb/fe-get-frontend.rst             | 12 +--
 .../userspace-api/media/dvb/fe-get-info.rst   | 11 +--
 .../media/dvb/fe-get-property.rst             | 15 ++--
 .../userspace-api/media/dvb/fe-read-ber.rst   |  9 +--
 .../media/dvb/fe-read-signal-strength.rst     |  9 +--
 .../userspace-api/media/dvb/fe-read-snr.rst   |  9 +--
 .../media/dvb/fe-read-status.rst              | 11 +--
 .../media/dvb/fe-read-uncorrected-blocks.rst  |  9 +--
 .../media/dvb/fe-set-frontend-tune-mode.rst   | 10 +--
 .../media/dvb/fe-set-frontend.rst             | 11 +--
 .../userspace-api/media/dvb/fe-set-tone.rst   | 10 +--
 .../media/dvb/fe-set-voltage.rst              | 10 +--
 .../media/dvb/frontend_f_close.rst            |  8 +-
 .../media/dvb/frontend_f_open.rst             | 10 +--
 .../userspace-api/media/dvb/net-add-if.rst    |  9 +--
 .../userspace-api/media/dvb/net-get-if.rst    | 10 +--
 .../userspace-api/media/dvb/net-remove-if.rst | 10 +--
 .../media/dvb/video-clear-buffer.rst          |  8 +-
 .../userspace-api/media/dvb/video-command.rst | 10 +--
 .../media/dvb/video-continue.rst              |  8 +-
 .../media/dvb/video-fast-forward.rst          | 10 +--
 .../userspace-api/media/dvb/video-fclose.rst  |  6 +-
 .../userspace-api/media/dvb/video-fopen.rst   |  6 +-
 .../userspace-api/media/dvb/video-freeze.rst  |  8 +-
 .../userspace-api/media/dvb/video-fwrite.rst  |  6 +-
 .../media/dvb/video-get-capabilities.rst      |  8 +-
 .../media/dvb/video-get-event.rst             |  8 +-
 .../media/dvb/video-get-frame-count.rst       |  8 +-
 .../userspace-api/media/dvb/video-get-pts.rst |  8 +-
 .../media/dvb/video-get-size.rst              |  8 +-
 .../media/dvb/video-get-status.rst            |  7 +-
 .../userspace-api/media/dvb/video-play.rst    |  8 +-
 .../media/dvb/video-select-source.rst         |  7 +-
 .../media/dvb/video-set-blank.rst             |  8 +-
 .../media/dvb/video-set-display-format.rst    |  8 +-
 .../media/dvb/video-set-format.rst            |  9 +--
 .../media/dvb/video-set-streamtype.rst        |  8 +-
 .../media/dvb/video-slowmotion.rst            | 10 +--
 .../media/dvb/video-stillpicture.rst          |  8 +-
 .../userspace-api/media/dvb/video-stop.rst    |  8 +-
 .../media/dvb/video-try-command.rst           |  8 +-
 .../media/mediactl/media-func-close.rst       | 10 +--
 .../media/mediactl/media-func-ioctl.rst       | 10 +--
 .../media/mediactl/media-func-open.rst        | 10 +--
 .../media/mediactl/media-ioc-device-info.rst  | 13 +---
 .../mediactl/media-ioc-enum-entities.rst      | 11 +--
 .../media/mediactl/media-ioc-enum-links.rst   | 13 +---
 .../media/mediactl/media-ioc-g-topology.rst   | 14 +---
 .../mediactl/media-ioc-request-alloc.rst      | 11 ++-
 .../media/mediactl/media-ioc-setup-link.rst   | 10 +--
 .../mediactl/media-request-ioc-queue.rst      |  7 +-
 .../mediactl/media-request-ioc-reinit.rst     |  8 +-
 .../media/mediactl/request-api.rst            |  5 +-
 .../media/mediactl/request-func-close.rst     |  8 +-
 .../media/mediactl/request-func-ioctl.rst     |  8 +-
 .../media/mediactl/request-func-poll.rst      | 12 +--
 .../media/rc/lirc-get-features.rst            |  9 +--
 .../media/rc/lirc-get-rec-mode.rst            | 12 +--
 .../media/rc/lirc-get-rec-resolution.rst      |  8 +-
 .../media/rc/lirc-get-send-mode.rst           | 14 ++--
 .../media/rc/lirc-get-timeout.rst             | 13 ++--
 .../userspace-api/media/rc/lirc-read.rst      | 10 +--
 .../rc/lirc-set-measure-carrier-mode.rst      |  8 +-
 .../media/rc/lirc-set-rec-carrier-range.rst   |  6 +-
 .../media/rc/lirc-set-rec-carrier.rst         |  8 +-
 .../media/rc/lirc-set-rec-timeout-reports.rst |  8 +-
 .../media/rc/lirc-set-rec-timeout.rst         | 13 ++--
 .../media/rc/lirc-set-send-carrier.rst        |  8 +-
 .../media/rc/lirc-set-send-duty-cycle.rst     |  8 +-
 .../media/rc/lirc-set-transmitter-mask.rst    |  8 +-
 .../media/rc/lirc-set-wideband-receiver.rst   |  8 +-
 .../userspace-api/media/rc/lirc-write.rst     |  7 +-
 .../userspace-api/media/v4l/buffer.rst        | 14 +---
 .../userspace-api/media/v4l/dev-capture.rst   |  7 +-
 .../userspace-api/media/v4l/dev-output.rst    |  7 +-
 .../userspace-api/media/v4l/dev-raw-vbi.rst   | 19 ++---
 .../userspace-api/media/v4l/dev-rds.rst       | 12 +--
 .../media/v4l/dev-sliced-vbi.rst              | 31 ++------
 .../userspace-api/media/v4l/diff-v4l.rst      | 39 ++--------
 .../userspace-api/media/v4l/dmabuf.rst        |  8 +-
 .../userspace-api/media/v4l/format.rst        |  7 +-
 .../userspace-api/media/v4l/func-close.rst    |  8 +-
 .../userspace-api/media/v4l/func-ioctl.rst    | 10 +--
 .../userspace-api/media/v4l/func-mmap.rst     | 18 ++---
 .../userspace-api/media/v4l/func-munmap.rst   | 14 ++--
 .../userspace-api/media/v4l/func-open.rst     | 14 ++--
 .../userspace-api/media/v4l/func-poll.rst     | 40 +++++-----
 .../userspace-api/media/v4l/func-read.rst     | 39 +++++-----
 .../userspace-api/media/v4l/func-select.rst   | 42 +++++-----
 .../userspace-api/media/v4l/func-write.rst    | 13 ++--
 .../userspace-api/media/v4l/hist-v4l2.rst     | 76 +------------------
 Documentation/userspace-api/media/v4l/io.rst  |  6 +-
 .../media/v4l/libv4l-introduction.rst         | 30 ++++----
 .../userspace-api/media/v4l/mmap.rst          | 26 +++----
 .../userspace-api/media/v4l/open.rst          | 15 ++--
 Documentation/userspace-api/media/v4l/rw.rst  | 18 ++---
 .../userspace-api/media/v4l/streaming-par.rst |  5 +-
 .../userspace-api/media/v4l/userp.rst         | 11 +--
 .../media/v4l/vidioc-create-bufs.rst          | 11 +--
 .../media/v4l/vidioc-cropcap.rst              | 11 +--
 .../media/v4l/vidioc-dbg-g-chip-info.rst      | 13 +---
 .../media/v4l/vidioc-dbg-g-register.rst       | 18 ++---
 .../media/v4l/vidioc-decoder-cmd.rst          | 19 ++---
 .../media/v4l/vidioc-dqevent.rst              | 19 +----
 .../media/v4l/vidioc-dv-timings-cap.rst       | 17 ++---
 .../media/v4l/vidioc-encoder-cmd.rst          | 25 +++---
 .../media/v4l/vidioc-enum-dv-timings.rst      | 16 ++--
 .../media/v4l/vidioc-enum-fmt.rst             | 12 +--
 .../media/v4l/vidioc-enum-frameintervals.rst  | 15 +---
 .../media/v4l/vidioc-enum-framesizes.rst      | 16 +---
 .../media/v4l/vidioc-enum-freq-bands.rst      | 12 +--
 .../media/v4l/vidioc-enumaudio.rst            | 10 +--
 .../media/v4l/vidioc-enumaudioout.rst         | 10 +--
 .../media/v4l/vidioc-enuminput.rst            | 14 +---
 .../media/v4l/vidioc-enumoutput.rst           | 13 +---
 .../media/v4l/vidioc-enumstd.rst              | 23 ++----
 .../userspace-api/media/v4l/vidioc-expbuf.rst | 14 +---
 .../media/v4l/vidioc-g-audio.rst              | 18 ++---
 .../media/v4l/vidioc-g-audioout.rst           | 16 ++--
 .../userspace-api/media/v4l/vidioc-g-crop.rst | 16 ++--
 .../userspace-api/media/v4l/vidioc-g-ctrl.rst | 16 ++--
 .../media/v4l/vidioc-g-dv-timings.rst         | 26 +++----
 .../userspace-api/media/v4l/vidioc-g-edid.rst | 25 +++---
 .../media/v4l/vidioc-g-enc-index.rst          | 13 +---
 .../media/v4l/vidioc-g-ext-ctrls.rst          | 21 ++---
 .../userspace-api/media/v4l/vidioc-g-fbuf.rst | 18 ++---
 .../userspace-api/media/v4l/vidioc-g-fmt.rst  | 22 +++---
 .../media/v4l/vidioc-g-frequency.rst          | 16 ++--
 .../media/v4l/vidioc-g-input.rst              | 15 ++--
 .../media/v4l/vidioc-g-jpegcomp.rst           | 17 ++---
 .../media/v4l/vidioc-g-modulator.rst          | 17 ++---
 .../media/v4l/vidioc-g-output.rst             | 15 ++--
 .../userspace-api/media/v4l/vidioc-g-parm.rst | 30 +++-----
 .../media/v4l/vidioc-g-priority.rst           | 16 ++--
 .../media/v4l/vidioc-g-selection.rst          | 15 ++--
 .../media/v4l/vidioc-g-sliced-vbi-cap.rst     | 12 +--
 .../userspace-api/media/v4l/vidioc-g-std.rst  | 24 +++---
 .../media/v4l/vidioc-g-tuner.rst              | 19 ++---
 .../media/v4l/vidioc-log-status.rst           | 10 +--
 .../media/v4l/vidioc-overlay.rst              | 10 +--
 .../media/v4l/vidioc-prepare-buf.rst          | 10 +--
 .../userspace-api/media/v4l/vidioc-qbuf.rst   | 17 ++---
 .../media/v4l/vidioc-query-dv-timings.rst     | 15 ++--
 .../media/v4l/vidioc-querybuf.rst             | 10 +--
 .../media/v4l/vidioc-querycap.rst             | 16 ++--
 .../media/v4l/vidioc-queryctrl.rst            | 22 ++----
 .../media/v4l/vidioc-querystd.rst             | 15 ++--
 .../media/v4l/vidioc-reqbufs.rst              | 10 +--
 .../media/v4l/vidioc-s-hw-freq-seek.rst       | 11 +--
 .../media/v4l/vidioc-streamon.rst             | 14 ++--
 .../v4l/vidioc-subdev-enum-frame-interval.rst | 10 +--
 .../v4l/vidioc-subdev-enum-frame-size.rst     | 11 +--
 .../v4l/vidioc-subdev-enum-mbus-code.rst      | 11 +--
 .../media/v4l/vidioc-subdev-g-crop.rst        | 16 ++--
 .../media/v4l/vidioc-subdev-g-fmt.rst         | 17 ++---
 .../v4l/vidioc-subdev-g-frame-interval.rst    | 16 ++--
 .../media/v4l/vidioc-subdev-g-selection.rst   | 17 ++---
 .../media/v4l/vidioc-subdev-querycap.rst      |  9 +--
 .../media/v4l/vidioc-subscribe-event.rst      | 17 ++---
 scripts/kernel-doc                            | 69 +++++++++++++++--
 227 files changed, 1194 insertions(+), 1733 deletions(-)

-- 
2.26.2


