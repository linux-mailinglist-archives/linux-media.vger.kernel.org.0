Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B02C277689
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 18:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbgIXQVz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 12:21:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:45042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726820AbgIXQVx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 12:21:53 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 543FA2388A;
        Thu, 24 Sep 2020 16:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600964512;
        bh=Dvw5LR3MifupI5h1qiwngS30RsLM801eZYLlmWV7fiA=;
        h=From:To:Cc:Subject:Date:From;
        b=xOlFKdnpn2iE8ufAr8OWdW6HcvAx9ln0T3DTC6dJzpicGrcb+MdP84ZVDDWY/Kyr5
         HFMBF64jiSEIUONj0sNGNtzhzdoEHe/9azGpzmPomD7SRwMOeSAtZnOUbEN2nXFmDZ
         iMwKVJ3vPzfzlKUpxa8n3X7KI3KQAsunc/y3nwn0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kLU0E-000KGa-3s; Thu, 24 Sep 2020 18:21:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org,
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
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Subject: [PATCH v2 0/5] docs: cdomain.py: add support for two new Sphinx  3.1+ tags
Date:   Thu, 24 Sep 2020 18:21:44 +0200
Message-Id: <cover.1600963096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jon,

That's she second version of the patch series fixing stuff
at media docs with Sphinx 3.1

Patch 1 is identical to the first version. As described before,
it  adds support at cdomain.py for two notations found on
Sphinx 3.1:

	:c:expr:
	.. c:namespace::

The remaining patches remove the cdomain.py dependency from
the userspace-api/media, making them to produce a decent
result with both Sphinx 1.x/2.x and 3.1+.

While at the first version, I did the CEC conversion manually, for
this new version, I wrote a perl script that does the conversion
automatically:

<script>
#!/bin/perl
use strict;

my $namespace = shift or die "need a namespace";
my $file = shift or die "need a file name";

my $header = 1;
my $check_next;
my $changes;

my $out;

open IN, $file;
while (<IN>) {
	if ($header) {
		if (!m/^\.\.\s+_\S+:/) {
			if (m/^\.\./) {
				$out .= $_;
				next;
			}
		}
		$out .= "\.\. c:namespace:: $namespace\n\n";
		$out .=  $_;
		$header = 0;
		next;
	}

	# Replace :c:func
	if (s/:c:func:`(\S+) \<\S+\>`/:c:func:`$1`/g) {
		$out .=  $_;
		$changes = 1;
		next;
	}
	if (s/:ref:`(poll|open|close|select|mmap|munmap|read|write)\s*\(\)\s+\<\S+\>`/:c:func:`$1()`/g) {
		$out .=  $_;
		$changes = 1;
		next;
	}

	next if ($check_next && m/^\s+:name:\s+\S+$/);

	if (m/\.\. c:function::\s*int\s+(ioctl)\s*\(\s*([^\)]+),\s*([^\,]+),\s*([^\,]+) \)/
	    || m/\.\. c:function::\s*int\s+(ioctl)\s*\(\s*([^\,]+),\s*([^\,]+),\s*([^\,]+)\)/) {
		$check_next = 1;
		my $arg0 = $1;
		my $arg1 = $2;
		my $arg2 = $3;
		my $arg3 = $4;

		$out .=  ".. c:macro:: $arg2\n\n" if ($arg2 =~ m/^[A-Z_]+$/);
		$out .=  "``int`` :c:expr:`$arg0($arg1, $arg2, $arg3)`\n";
		$changes = 1;
		next;
	}

	if (m/\.\. c:function:: int\s+(ioctl)\s*\(\s*([^\)]+),\s*([^\,]+) \)/
	    || m/\.\. c:function:: int\s+(ioctl)\s*\(\s*([^\,]+),\s*([^\,]+)\)/) {
		$check_next = 1;
		my $arg0 = $1;
		my $arg1 = $2;
		my $arg2 = $3;

		$out .=  ".. c:macro:: $arg2\n\n" if ($arg2 =~ m/^[A-Z_]+$/);
		$out .=  "``int`` :c:expr:`$arg0($arg1, $arg2)`\n";
		$changes = 1;
		next;
	}

	if (m/\.\. c:function:: /) {
		$out .=  $_;
		$changes = 1;
		$check_next = 1;
		next;
	}

	$out .=  $_;
}
close IN;

$out =~ s/\n\n\n/\n\n/g;

if ($changes) {
	open OUT, ">$file";
	print OUT $out;
	close OUT;
}
</script>

And manually adjusted some issues:
  - there were a \*argp on some CEC functions;
  - there were some audio C prototypes with bugs. Sphinx 3.2
    reported the issue and I manually fixed them.

It should be noticed that the DVB namespace has actually several
sub-namespaces (audio, video, dmx, ca, net and fe), as it contains
different APIs for each type of device. 

I'll try to address tomorrow the remaing warnings with Sphinx 3.2.

Mauro Carvalho Chehab (5):
  docs: cdomain.py: add support for two new Sphinx 3.1+ tags
  media: docs: make CEC documents compatible with Sphinx 3.1+
  media: docs: make V4L documents more compatible with Sphinx 3.1+
  media: docs: make DVB documents more compatible with Sphinx 3.1+
  media: docs: make MC documents more compatible with Sphinx 3.1+

 Documentation/sphinx/cdomain.py               | 56 +++++++++++++-
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
 209 files changed, 1058 insertions(+), 1649 deletions(-)

-- 
2.26.2


