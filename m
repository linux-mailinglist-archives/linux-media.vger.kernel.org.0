Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3B6178EDE
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 11:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387803AbgCDKvM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 05:51:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:45730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726860AbgCDKvL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Mar 2020 05:51:11 -0500
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31562214D8;
        Wed,  4 Mar 2020 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583319068;
        bh=2tQFi+X2qoWxRP966udgl+KnllV5yteCxsoqG6G6LwA=;
        h=From:To:Cc:Subject:Date:From;
        b=RgNc+qC3/LQq1YUB7hbGvF7D5Bbm91g7XwH6/yGp5vGREGqMbpsuYTiv3KZSAO4gs
         7zogp/nIjzVaGmJr/fKlNPAFDsfRZnItCfN2XynjerL24R0umlYWJcPf0HsfVjO6Sj
         Kpy0PIaj3cdF+B7Z3qsM7KKtdhZwN12sSPoU+894=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j9RcI-0000xl-1V; Wed, 04 Mar 2020 11:51:06 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH RFC 0/2] Move media uAPI and kAPI docs to a better place
Date:   Wed,  4 Mar 2020 11:51:01 +0100
Message-Id: <cover.1583316037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jon,

This is something that you always wanted: move uAPI and kAPI to
separate books.

This RFC series start doing it for the media docs.

For now, this is just a RFC, being only an initial step for it. I'm sending
it on this early stage just to rise some discussions.

This changeset basically moves:

  - the media kAPI files to be under driver-api/media;
  - the media uAPI files to be under userspace-api/media.

This version keeps including both inside Documentation/media/index.rst.

It also keeps the driver-specific stuff inside Documentation/media.

In other words, after this series,  we'll have:

Documentation/media/index.rst 
	- An index that points to all media docs;
Documentation/userspace-api/media/index.rst
	- Media uAPI;
Documentation/driver-api/media/index.rst
	- Media kAPI;
Documentation/media/{cec-drivers,dvb-drivers,v4l-drivers}/index.rst
	- Driver-specific information

The driver-specific information is messy, as each file there may contain
either one or more of the following items:

	- driver-development information;
	- on a few drivers, drivers-specific uAPI.
	- modprobe parameters;
	- List of devices supported by each driver;

The last two are probably contents for the admin-guide, but not sure
where to place driver-specific development information. Does it
belong to "driver-api" book too?

I guess that driver-specific uAPI could fit at the userspace-api, but I
don't want them to be at the same place as the core media API stuff.

Suggestions?

With regards to the main index, IMHO, for the ones that will be working
with media development, the best would be to have just one book with
everything related to media altogether, e. g. keep everything included
at
	Documentation/media/index.rst

On the other hand, I guess I understand the rationale behind having
the uAPI docs included at Documentation/userspace-api/index.rst.

So, there's actually a dilemma here...

I see a few ways to solve it:

1) keep them included at Documentation/media/index.rst;
2) move them to Documentation/{userspace,driver}-api/index.rst
3) place them on both;
4) place them on one of the places, and add a :doc: reference to the
    other location.

I suspect that (4) would fit better, but then we need to decide where
the file will be included - either (1) or (2).

Comments?

Regards,
Mauro

-

Mauro Carvalho Chehab (2):
  docs: media: move uAPI book to userspace-api/media
  docs: media kAPI docs: move them to driver-api

 Documentation/ABI/testing/debugfs-cec-error-inj    |  2 +-
 Documentation/Makefile                             | 10 +++++-----
 .../{media/kapi => driver-api/media}/cec-core.rst  |  0
 .../{media/kapi => driver-api/media}/csi2.rst      |  0
 .../{media/kapi => driver-api/media}/dtv-ca.rst    |  0
 .../kapi => driver-api/media}/dtv-common.rst       |  0
 .../{media/kapi => driver-api/media}/dtv-core.rst  |  0
 .../{media/kapi => driver-api/media}/dtv-demux.rst |  0
 .../kapi => driver-api/media}/dtv-frontend.rst     |  0
 .../{media/kapi => driver-api/media}/dtv-net.rst   |  0
 .../media_kapi.rst => driver-api/media/index.rst}  | 12 ++++++------
 .../{media/kapi => driver-api/media}/mc-core.rst   |  0
 .../{media/kapi => driver-api/media}/rc-core.rst   |  0
 .../kapi => driver-api/media}/v4l2-async.rst       |  0
 .../kapi => driver-api/media}/v4l2-clocks.rst      |  0
 .../kapi => driver-api/media}/v4l2-common.rst      |  0
 .../kapi => driver-api/media}/v4l2-controls.rst    |  0
 .../{media/kapi => driver-api/media}/v4l2-core.rst |  0
 .../{media/kapi => driver-api/media}/v4l2-dev.rst  |  0
 .../kapi => driver-api/media}/v4l2-device.rst      |  0
 .../kapi => driver-api/media}/v4l2-dv-timings.rst  |  0
 .../kapi => driver-api/media}/v4l2-event.rst       |  0
 .../{media/kapi => driver-api/media}/v4l2-fh.rst   |  0
 .../media}/v4l2-flash-led-class.rst                |  0
 .../kapi => driver-api/media}/v4l2-fwnode.rst      |  0
 .../kapi => driver-api/media}/v4l2-intro.rst       |  0
 .../{media/kapi => driver-api/media}/v4l2-mc.rst   |  0
 .../kapi => driver-api/media}/v4l2-mediabus.rst    |  0
 .../kapi => driver-api/media}/v4l2-mem2mem.rst     |  0
 .../{media/kapi => driver-api/media}/v4l2-rect.rst |  0
 .../kapi => driver-api/media}/v4l2-subdev.rst      |  0
 .../kapi => driver-api/media}/v4l2-tuner.rst       |  0
 .../kapi => driver-api/media}/v4l2-tveeprom.rst    |  0
 .../kapi => driver-api/media}/v4l2-videobuf.rst    |  0
 .../kapi => driver-api/media}/v4l2-videobuf2.rst   |  0
 Documentation/fb/api.rst                           |  4 ++--
 Documentation/media/index.rst                      |  4 ++--
 Documentation/media/v4l-drivers/max2175.rst        |  2 +-
 .../zh_CN/video4linux/v4l2-framework.txt           |  2 +-
 Documentation/{ => userspace-api}/media/Makefile   |  2 +-
 .../media/audio.h.rst.exceptions                   |  0
 .../{ => userspace-api}/media/ca.h.rst.exceptions  |  0
 .../{ => userspace-api}/media/cec.h.rst.exceptions |  0
 .../uapi => userspace-api/media}/cec/cec-api.rst   |  2 +-
 .../media}/cec/cec-func-close.rst                  |  2 +-
 .../media}/cec/cec-func-ioctl.rst                  |  2 +-
 .../media}/cec/cec-func-open.rst                   |  2 +-
 .../media}/cec/cec-func-poll.rst                   |  2 +-
 .../uapi => userspace-api/media}/cec/cec-funcs.rst |  2 +-
 .../media}/cec/cec-header.rst                      |  2 +-
 .../uapi => userspace-api/media}/cec/cec-intro.rst |  2 +-
 .../media}/cec/cec-ioc-adap-g-caps.rst             |  2 +-
 .../media}/cec/cec-ioc-adap-g-conn-info.rst        |  0
 .../media}/cec/cec-ioc-adap-g-log-addrs.rst        |  2 +-
 .../media}/cec/cec-ioc-adap-g-phys-addr.rst        |  2 +-
 .../media}/cec/cec-ioc-dqevent.rst                 |  2 +-
 .../media}/cec/cec-ioc-g-mode.rst                  |  2 +-
 .../media}/cec/cec-ioc-receive.rst                 |  2 +-
 .../media}/cec/cec-pin-error-inj.rst               |  2 +-
 .../{ => userspace-api}/media/conf_nitpick.py      |  0
 .../{ => userspace-api}/media/dmx.h.rst.exceptions |  0
 .../media}/dvb/audio-bilingual-channel-select.rst  |  2 +-
 .../media}/dvb/audio-channel-select.rst            |  2 +-
 .../media}/dvb/audio-clear-buffer.rst              |  2 +-
 .../media}/dvb/audio-continue.rst                  |  2 +-
 .../media}/dvb/audio-fclose.rst                    |  2 +-
 .../media}/dvb/audio-fopen.rst                     |  2 +-
 .../media}/dvb/audio-fwrite.rst                    |  2 +-
 .../media}/dvb/audio-get-capabilities.rst          |  2 +-
 .../media}/dvb/audio-get-status.rst                |  2 +-
 .../media}/dvb/audio-pause.rst                     |  2 +-
 .../media}/dvb/audio-play.rst                      |  2 +-
 .../media}/dvb/audio-select-source.rst             |  2 +-
 .../media}/dvb/audio-set-av-sync.rst               |  2 +-
 .../media}/dvb/audio-set-bypass-mode.rst           |  2 +-
 .../media}/dvb/audio-set-id.rst                    |  2 +-
 .../media}/dvb/audio-set-mixer.rst                 |  2 +-
 .../media}/dvb/audio-set-mute.rst                  |  2 +-
 .../media}/dvb/audio-set-streamtype.rst            |  2 +-
 .../media}/dvb/audio-stop.rst                      |  2 +-
 .../uapi => userspace-api/media}/dvb/audio.rst     |  2 +-
 .../media}/dvb/audio_data_types.rst                |  2 +-
 .../media}/dvb/audio_function_calls.rst            |  2 +-
 .../uapi => userspace-api/media}/dvb/ca-fclose.rst |  2 +-
 .../uapi => userspace-api/media}/dvb/ca-fopen.rst  |  2 +-
 .../media}/dvb/ca-get-cap.rst                      |  2 +-
 .../media}/dvb/ca-get-descr-info.rst               |  2 +-
 .../media}/dvb/ca-get-msg.rst                      |  2 +-
 .../media}/dvb/ca-get-slot-info.rst                |  2 +-
 .../uapi => userspace-api/media}/dvb/ca-reset.rst  |  2 +-
 .../media}/dvb/ca-send-msg.rst                     |  2 +-
 .../media}/dvb/ca-set-descr.rst                    |  2 +-
 .../{media/uapi => userspace-api/media}/dvb/ca.rst |  2 +-
 .../media}/dvb/ca_data_types.rst                   |  2 +-
 .../media}/dvb/ca_function_calls.rst               |  2 +-
 .../uapi => userspace-api/media}/dvb/demux.rst     |  2 +-
 .../media}/dvb/dmx-add-pid.rst                     |  2 +-
 .../media}/dvb/dmx-expbuf.rst                      |  2 +-
 .../media}/dvb/dmx-fclose.rst                      |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx-fopen.rst |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx-fread.rst |  2 +-
 .../media}/dvb/dmx-fwrite.rst                      |  2 +-
 .../media}/dvb/dmx-get-pes-pids.rst                |  2 +-
 .../media}/dvb/dmx-get-stc.rst                     |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx-mmap.rst  |  2 +-
 .../media}/dvb/dmx-munmap.rst                      |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx-qbuf.rst  |  2 +-
 .../media}/dvb/dmx-querybuf.rst                    |  2 +-
 .../media}/dvb/dmx-remove-pid.rst                  |  2 +-
 .../media}/dvb/dmx-reqbufs.rst                     |  2 +-
 .../media}/dvb/dmx-set-buffer-size.rst             |  2 +-
 .../media}/dvb/dmx-set-filter.rst                  |  2 +-
 .../media}/dvb/dmx-set-pes-filter.rst              |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx-start.rst |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx-stop.rst  |  2 +-
 .../media}/dvb/dmx_fcalls.rst                      |  2 +-
 .../uapi => userspace-api/media}/dvb/dmx_types.rst |  2 +-
 .../media}/dvb/dvb-fe-read-status.rst              |  2 +-
 .../media}/dvb/dvb-frontend-event.rst              |  2 +-
 .../media}/dvb/dvb-frontend-parameters.rst         |  2 +-
 .../uapi => userspace-api/media}/dvb/dvbapi.rst    |  2 +-
 .../media}/dvb/dvbproperty.rst                     |  2 +-
 .../uapi => userspace-api/media}/dvb/dvbstb.svg    |  2 +-
 .../uapi => userspace-api/media}/dvb/examples.rst  |  2 +-
 .../media}/dvb/fe-bandwidth-t.rst                  |  2 +-
 .../media}/dvb/fe-diseqc-recv-slave-reply.rst      |  2 +-
 .../media}/dvb/fe-diseqc-reset-overload.rst        |  2 +-
 .../media}/dvb/fe-diseqc-send-burst.rst            |  2 +-
 .../media}/dvb/fe-diseqc-send-master-cmd.rst       |  2 +-
 .../media}/dvb/fe-dishnetwork-send-legacy-cmd.rst  |  2 +-
 .../media}/dvb/fe-enable-high-lnb-voltage.rst      |  2 +-
 .../media}/dvb/fe-get-event.rst                    |  2 +-
 .../media}/dvb/fe-get-frontend.rst                 |  2 +-
 .../media}/dvb/fe-get-info.rst                     |  2 +-
 .../media}/dvb/fe-get-property.rst                 |  2 +-
 .../media}/dvb/fe-read-ber.rst                     |  2 +-
 .../media}/dvb/fe-read-signal-strength.rst         |  2 +-
 .../media}/dvb/fe-read-snr.rst                     |  2 +-
 .../media}/dvb/fe-read-status.rst                  |  2 +-
 .../media}/dvb/fe-read-uncorrected-blocks.rst      |  2 +-
 .../media}/dvb/fe-set-frontend-tune-mode.rst       |  2 +-
 .../media}/dvb/fe-set-frontend.rst                 |  2 +-
 .../media}/dvb/fe-set-tone.rst                     |  2 +-
 .../media}/dvb/fe-set-voltage.rst                  |  2 +-
 .../uapi => userspace-api/media}/dvb/fe-type-t.rst |  2 +-
 .../media}/dvb/fe_property_parameters.rst          |  2 +-
 .../media}/dvb/frontend-header.rst                 |  2 +-
 .../media}/dvb/frontend-property-cable-systems.rst |  2 +-
 .../dvb/frontend-property-satellite-systems.rst    |  2 +-
 .../dvb/frontend-property-terrestrial-systems.rst  |  2 +-
 .../media}/dvb/frontend-stat-properties.rst        |  2 +-
 .../uapi => userspace-api/media}/dvb/frontend.rst  |  2 +-
 .../media}/dvb/frontend_f_close.rst                |  2 +-
 .../media}/dvb/frontend_f_open.rst                 |  2 +-
 .../media}/dvb/frontend_fcalls.rst                 |  2 +-
 .../media}/dvb/frontend_legacy_api.rst             |  2 +-
 .../media}/dvb/frontend_legacy_dvbv3_api.rst       |  2 +-
 .../uapi => userspace-api/media}/dvb/headers.rst   |  2 +-
 .../uapi => userspace-api/media}/dvb/intro.rst     |  2 +-
 .../media}/dvb/legacy_dvb_apis.rst                 |  2 +-
 .../media}/dvb/net-add-if.rst                      |  2 +-
 .../media}/dvb/net-get-if.rst                      |  2 +-
 .../media}/dvb/net-remove-if.rst                   |  2 +-
 .../uapi => userspace-api/media}/dvb/net-types.rst |  2 +-
 .../uapi => userspace-api/media}/dvb/net.rst       |  2 +-
 .../media}/dvb/query-dvb-frontend-info.rst         |  2 +-
 .../media}/dvb/video-clear-buffer.rst              |  2 +-
 .../media}/dvb/video-command.rst                   |  2 +-
 .../media}/dvb/video-continue.rst                  |  2 +-
 .../media}/dvb/video-fast-forward.rst              |  2 +-
 .../media}/dvb/video-fclose.rst                    |  2 +-
 .../media}/dvb/video-fopen.rst                     |  2 +-
 .../media}/dvb/video-freeze.rst                    |  2 +-
 .../media}/dvb/video-fwrite.rst                    |  2 +-
 .../media}/dvb/video-get-capabilities.rst          |  2 +-
 .../media}/dvb/video-get-event.rst                 |  2 +-
 .../media}/dvb/video-get-frame-count.rst           |  2 +-
 .../media}/dvb/video-get-pts.rst                   |  2 +-
 .../media}/dvb/video-get-size.rst                  |  2 +-
 .../media}/dvb/video-get-status.rst                |  2 +-
 .../media}/dvb/video-play.rst                      |  2 +-
 .../media}/dvb/video-select-source.rst             |  2 +-
 .../media}/dvb/video-set-blank.rst                 |  2 +-
 .../media}/dvb/video-set-display-format.rst        |  2 +-
 .../media}/dvb/video-set-format.rst                |  2 +-
 .../media}/dvb/video-set-streamtype.rst            |  2 +-
 .../media}/dvb/video-slowmotion.rst                |  2 +-
 .../media}/dvb/video-stillpicture.rst              |  2 +-
 .../media}/dvb/video-stop.rst                      |  2 +-
 .../media}/dvb/video-try-command.rst               |  2 +-
 .../uapi => userspace-api/media}/dvb/video.rst     |  2 +-
 .../media}/dvb/video_function_calls.rst            |  2 +-
 .../media}/dvb/video_types.rst                     |  2 +-
 .../uapi => userspace-api/media}/fdl-appendix.rst  |  2 +-
 .../media/frontend.h.rst.exceptions                |  0
 .../uapi => userspace-api/media}/gen-errors.rst    |  2 +-
 .../media/index.rst}                               | 14 +++++++-------
 Documentation/{ => userspace-api}/media/intro.rst  |  0
 .../media/lirc.h.rst.exceptions                    |  0
 .../media/media.h.rst.exceptions                   |  0
 .../media}/mediactl/media-controller-intro.rst     |  2 +-
 .../media}/mediactl/media-controller-model.rst     |  2 +-
 .../media}/mediactl/media-controller.rst           |  2 +-
 .../media}/mediactl/media-func-close.rst           |  2 +-
 .../media}/mediactl/media-func-ioctl.rst           |  2 +-
 .../media}/mediactl/media-func-open.rst            |  2 +-
 .../media}/mediactl/media-funcs.rst                |  2 +-
 .../media}/mediactl/media-header.rst               |  2 +-
 .../media}/mediactl/media-ioc-device-info.rst      |  2 +-
 .../media}/mediactl/media-ioc-enum-entities.rst    |  2 +-
 .../media}/mediactl/media-ioc-enum-links.rst       |  2 +-
 .../media}/mediactl/media-ioc-g-topology.rst       |  2 +-
 .../media}/mediactl/media-ioc-request-alloc.rst    |  2 +-
 .../media}/mediactl/media-ioc-setup-link.rst       |  2 +-
 .../media}/mediactl/media-request-ioc-queue.rst    |  2 +-
 .../media}/mediactl/media-request-ioc-reinit.rst   |  2 +-
 .../media}/mediactl/media-types.rst                |  2 +-
 .../media}/mediactl/request-api.rst                |  2 +-
 .../media}/mediactl/request-func-close.rst         |  2 +-
 .../media}/mediactl/request-func-ioctl.rst         |  2 +-
 .../media}/mediactl/request-func-poll.rst          |  2 +-
 .../{ => userspace-api}/media/net.h.rst.exceptions |  0
 .../uapi => userspace-api/media}/rc/keytable.c.rst |  2 +-
 .../media}/rc/lirc-dev-intro.rst                   |  2 +-
 .../uapi => userspace-api/media}/rc/lirc-dev.rst   |  2 +-
 .../uapi => userspace-api/media}/rc/lirc-func.rst  |  2 +-
 .../media}/rc/lirc-get-features.rst                |  2 +-
 .../media}/rc/lirc-get-rec-mode.rst                |  2 +-
 .../media}/rc/lirc-get-rec-resolution.rst          |  2 +-
 .../media}/rc/lirc-get-send-mode.rst               |  2 +-
 .../media}/rc/lirc-get-timeout.rst                 |  2 +-
 .../media}/rc/lirc-header.rst                      |  2 +-
 .../uapi => userspace-api/media}/rc/lirc-read.rst  |  2 +-
 .../media}/rc/lirc-set-measure-carrier-mode.rst    |  2 +-
 .../media}/rc/lirc-set-rec-carrier-range.rst       |  2 +-
 .../media}/rc/lirc-set-rec-carrier.rst             |  2 +-
 .../media}/rc/lirc-set-rec-timeout-reports.rst     |  2 +-
 .../media}/rc/lirc-set-rec-timeout.rst             |  2 +-
 .../media}/rc/lirc-set-send-carrier.rst            |  2 +-
 .../media}/rc/lirc-set-send-duty-cycle.rst         |  2 +-
 .../media}/rc/lirc-set-transmitter-mask.rst        |  2 +-
 .../media}/rc/lirc-set-wideband-receiver.rst       |  2 +-
 .../uapi => userspace-api/media}/rc/lirc-write.rst |  2 +-
 .../uapi => userspace-api/media}/rc/rc-intro.rst   |  2 +-
 .../uapi => userspace-api/media}/rc/rc-protos.rst  |  0
 .../media}/rc/rc-sysfs-nodes.rst                   |  2 +-
 .../media}/rc/rc-table-change.rst                  |  2 +-
 .../uapi => userspace-api/media}/rc/rc-tables.rst  |  2 +-
 .../media}/rc/remote_controllers.rst               |  2 +-
 .../media/typical_media_device.svg                 |  2 +-
 .../uapi => userspace-api/media}/v4l/app-pri.rst   |  2 +-
 .../uapi => userspace-api/media}/v4l/async.rst     |  2 +-
 .../uapi => userspace-api/media}/v4l/audio.rst     |  2 +-
 .../uapi => userspace-api/media}/v4l/bayer.svg     |  2 +-
 .../uapi => userspace-api/media}/v4l/biblio.rst    |  2 +-
 .../uapi => userspace-api/media}/v4l/buffer.rst    |  2 +-
 .../media}/v4l/capture-example.rst                 |  2 +-
 .../uapi => userspace-api/media}/v4l/capture.c.rst |  2 +-
 .../media}/v4l/colorspaces-defs.rst                |  2 +-
 .../media}/v4l/colorspaces-details.rst             |  2 +-
 .../media}/v4l/colorspaces.rst                     |  2 +-
 .../media}/v4l/common-defs.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/common.rst    |  2 +-
 .../uapi => userspace-api/media}/v4l/compat.rst    |  2 +-
 .../media}/v4l/constraints.svg                     |  2 +-
 .../uapi => userspace-api/media}/v4l/control.rst   |  2 +-
 .../uapi => userspace-api/media}/v4l/crop.rst      |  2 +-
 .../uapi => userspace-api/media}/v4l/crop.svg      |  2 +-
 .../media}/v4l/depth-formats.rst                   |  2 +-
 .../media}/v4l/dev-capture.rst                     |  2 +-
 .../media}/v4l/dev-decoder.rst                     |  0
 .../uapi => userspace-api/media}/v4l/dev-event.rst |  2 +-
 .../media}/v4l/dev-mem2mem.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/dev-meta.rst  |  2 +-
 .../uapi => userspace-api/media}/v4l/dev-osd.rst   |  2 +-
 .../media}/v4l/dev-output.rst                      |  2 +-
 .../media}/v4l/dev-overlay.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/dev-radio.rst |  2 +-
 .../media}/v4l/dev-raw-vbi.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/dev-rds.rst   |  2 +-
 .../uapi => userspace-api/media}/v4l/dev-sdr.rst   |  2 +-
 .../media}/v4l/dev-sliced-vbi.rst                  |  2 +-
 .../media}/v4l/dev-stateless-decoder.rst           |  0
 .../media}/v4l/dev-subdev.rst                      |  2 +-
 .../uapi => userspace-api/media}/v4l/dev-touch.rst |  2 +-
 .../uapi => userspace-api/media}/v4l/devices.rst   |  2 +-
 .../uapi => userspace-api/media}/v4l/diff-v4l.rst  |  2 +-
 .../uapi => userspace-api/media}/v4l/dmabuf.rst    |  2 +-
 .../media}/v4l/dv-timings.rst                      |  2 +-
 .../media}/v4l/ext-ctrls-camera.rst                |  2 +-
 .../media}/v4l/ext-ctrls-codec.rst                 |  2 +-
 .../media}/v4l/ext-ctrls-detect.rst                |  2 +-
 .../media}/v4l/ext-ctrls-dv.rst                    |  2 +-
 .../media}/v4l/ext-ctrls-flash.rst                 |  2 +-
 .../media}/v4l/ext-ctrls-fm-rx.rst                 |  2 +-
 .../media}/v4l/ext-ctrls-fm-tx.rst                 |  2 +-
 .../media}/v4l/ext-ctrls-image-process.rst         |  2 +-
 .../media}/v4l/ext-ctrls-image-source.rst          |  2 +-
 .../media}/v4l/ext-ctrls-jpeg.rst                  |  2 +-
 .../media}/v4l/ext-ctrls-rf-tuner.rst              |  2 +-
 .../media}/v4l/extended-controls.rst               |  2 +-
 .../media}/v4l/field-order.rst                     |  2 +-
 .../media}/v4l/fieldseq_bt.svg                     |  2 +-
 .../media}/v4l/fieldseq_tb.svg                     |  2 +-
 .../uapi => userspace-api/media}/v4l/format.rst    |  2 +-
 .../media}/v4l/func-close.rst                      |  2 +-
 .../media}/v4l/func-ioctl.rst                      |  2 +-
 .../uapi => userspace-api/media}/v4l/func-mmap.rst |  2 +-
 .../media}/v4l/func-munmap.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/func-open.rst |  2 +-
 .../uapi => userspace-api/media}/v4l/func-poll.rst |  2 +-
 .../uapi => userspace-api/media}/v4l/func-read.rst |  2 +-
 .../media}/v4l/func-select.rst                     |  2 +-
 .../media}/v4l/func-write.rst                      |  2 +-
 .../uapi => userspace-api/media}/v4l/hist-v4l2.rst |  2 +-
 .../media}/v4l/hsv-formats.rst                     |  2 +-
 .../{media/uapi => userspace-api/media}/v4l/io.rst |  2 +-
 .../media}/v4l/libv4l-introduction.rst             |  2 +-
 .../uapi => userspace-api/media}/v4l/libv4l.rst    |  2 +-
 .../media}/v4l/meta-formats.rst                    |  2 +-
 .../uapi => userspace-api/media}/v4l/mmap.rst      |  2 +-
 .../uapi => userspace-api/media}/v4l/nv12mt.svg    |  2 +-
 .../media}/v4l/nv12mt_example.svg                  |  2 +-
 .../uapi => userspace-api/media}/v4l/open.rst      |  2 +-
 .../uapi => userspace-api/media}/v4l/pipeline.dot  |  0
 .../media}/v4l/pixfmt-bayer.rst                    |  2 +-
 .../media}/v4l/pixfmt-cnf4.rst                     |  0
 .../media}/v4l/pixfmt-compressed.rst               |  2 +-
 .../media}/v4l/pixfmt-grey.rst                     |  2 +-
 .../media}/v4l/pixfmt-indexed.rst                  |  2 +-
 .../media}/v4l/pixfmt-intro.rst                    |  2 +-
 .../media}/v4l/pixfmt-inzi.rst                     |  2 +-
 .../media}/v4l/pixfmt-m420.rst                     |  2 +-
 .../media}/v4l/pixfmt-meta-d4xx.rst                |  2 +-
 .../media}/v4l/pixfmt-meta-intel-ipu3.rst          |  2 +-
 .../media}/v4l/pixfmt-meta-uvc.rst                 |  2 +-
 .../media}/v4l/pixfmt-meta-vivid.rst               |  2 +-
 .../media}/v4l/pixfmt-meta-vsp1-hgo.rst            |  2 +-
 .../media}/v4l/pixfmt-meta-vsp1-hgt.rst            |  2 +-
 .../media}/v4l/pixfmt-nv12.rst                     |  2 +-
 .../media}/v4l/pixfmt-nv12m.rst                    |  2 +-
 .../media}/v4l/pixfmt-nv12mt.rst                   |  2 +-
 .../media}/v4l/pixfmt-nv16.rst                     |  2 +-
 .../media}/v4l/pixfmt-nv16m.rst                    |  2 +-
 .../media}/v4l/pixfmt-nv24.rst                     |  2 +-
 .../media}/v4l/pixfmt-packed-hsv.rst               |  2 +-
 .../media}/v4l/pixfmt-packed-yuv.rst               |  2 +-
 .../media}/v4l/pixfmt-reserved.rst                 |  2 +-
 .../media}/v4l/pixfmt-rgb.rst                      |  2 +-
 .../media}/v4l/pixfmt-sdr-cs08.rst                 |  2 +-
 .../media}/v4l/pixfmt-sdr-cs14le.rst               |  2 +-
 .../media}/v4l/pixfmt-sdr-cu08.rst                 |  2 +-
 .../media}/v4l/pixfmt-sdr-cu16le.rst               |  2 +-
 .../media}/v4l/pixfmt-sdr-pcu16be.rst              |  2 +-
 .../media}/v4l/pixfmt-sdr-pcu18be.rst              |  2 +-
 .../media}/v4l/pixfmt-sdr-pcu20be.rst              |  2 +-
 .../media}/v4l/pixfmt-sdr-ru12le.rst               |  2 +-
 .../media}/v4l/pixfmt-srggb10-ipu3.rst             |  2 +-
 .../media}/v4l/pixfmt-srggb10.rst                  |  2 +-
 .../media}/v4l/pixfmt-srggb10alaw8.rst             |  2 +-
 .../media}/v4l/pixfmt-srggb10dpcm8.rst             |  2 +-
 .../media}/v4l/pixfmt-srggb10p.rst                 |  2 +-
 .../media}/v4l/pixfmt-srggb12.rst                  |  2 +-
 .../media}/v4l/pixfmt-srggb12p.rst                 |  2 +-
 .../media}/v4l/pixfmt-srggb14p.rst                 |  2 +-
 .../media}/v4l/pixfmt-srggb16.rst                  |  2 +-
 .../media}/v4l/pixfmt-srggb8.rst                   |  2 +-
 .../media}/v4l/pixfmt-tch-td08.rst                 |  2 +-
 .../media}/v4l/pixfmt-tch-td16.rst                 |  2 +-
 .../media}/v4l/pixfmt-tch-tu08.rst                 |  2 +-
 .../media}/v4l/pixfmt-tch-tu16.rst                 |  2 +-
 .../media}/v4l/pixfmt-uv8.rst                      |  2 +-
 .../media}/v4l/pixfmt-uyvy.rst                     |  2 +-
 .../media}/v4l/pixfmt-v4l2-mplane.rst              |  2 +-
 .../media}/v4l/pixfmt-v4l2.rst                     |  2 +-
 .../media}/v4l/pixfmt-vyuy.rst                     |  2 +-
 .../media}/v4l/pixfmt-y10.rst                      |  2 +-
 .../media}/v4l/pixfmt-y10b.rst                     |  2 +-
 .../media}/v4l/pixfmt-y10p.rst                     |  2 +-
 .../media}/v4l/pixfmt-y12.rst                      |  2 +-
 .../media}/v4l/pixfmt-y12i.rst                     |  2 +-
 .../media}/v4l/pixfmt-y16-be.rst                   |  2 +-
 .../media}/v4l/pixfmt-y16.rst                      |  2 +-
 .../media}/v4l/pixfmt-y41p.rst                     |  2 +-
 .../media}/v4l/pixfmt-y8i.rst                      |  2 +-
 .../media}/v4l/pixfmt-yuv410.rst                   |  2 +-
 .../media}/v4l/pixfmt-yuv411p.rst                  |  2 +-
 .../media}/v4l/pixfmt-yuv420.rst                   |  2 +-
 .../media}/v4l/pixfmt-yuv420m.rst                  |  2 +-
 .../media}/v4l/pixfmt-yuv422m.rst                  |  2 +-
 .../media}/v4l/pixfmt-yuv422p.rst                  |  2 +-
 .../media}/v4l/pixfmt-yuv444m.rst                  |  2 +-
 .../media}/v4l/pixfmt-yuyv.rst                     |  2 +-
 .../media}/v4l/pixfmt-yvyu.rst                     |  2 +-
 .../media}/v4l/pixfmt-z16.rst                      |  2 +-
 .../uapi => userspace-api/media}/v4l/pixfmt.rst    |  2 +-
 .../media}/v4l/planar-apis.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/querycap.rst  |  2 +-
 .../{media/uapi => userspace-api/media}/v4l/rw.rst |  2 +-
 .../media}/v4l/sdr-formats.rst                     |  2 +-
 .../media}/v4l/selection-api-configuration.rst     |  2 +-
 .../media}/v4l/selection-api-examples.rst          |  2 +-
 .../media}/v4l/selection-api-intro.rst             |  2 +-
 .../media}/v4l/selection-api-targets.rst           |  2 +-
 .../media}/v4l/selection-api-vs-crop-api.rst       |  2 +-
 .../media}/v4l/selection-api.rst                   |  2 +-
 .../uapi => userspace-api/media}/v4l/selection.svg |  2 +-
 .../media}/v4l/selections-common.rst               |  2 +-
 .../uapi => userspace-api/media}/v4l/standard.rst  |  2 +-
 .../media}/v4l/streaming-par.rst                   |  2 +-
 .../media}/v4l/subdev-formats.rst                  |  2 +-
 .../media}/v4l/subdev-image-processing-crop.svg    |  2 +-
 .../media}/v4l/subdev-image-processing-full.svg    |  2 +-
 ...ubdev-image-processing-scaling-multi-source.svg |  2 +-
 .../media}/v4l/tch-formats.rst                     |  2 +-
 .../uapi => userspace-api/media}/v4l/tuner.rst     |  2 +-
 .../uapi => userspace-api/media}/v4l/user-func.rst |  2 +-
 .../uapi => userspace-api/media}/v4l/userp.rst     |  2 +-
 .../media}/v4l/v4l2-selection-flags.rst            |  2 +-
 .../media}/v4l/v4l2-selection-targets.rst          |  2 +-
 .../uapi => userspace-api/media}/v4l/v4l2.rst      |  2 +-
 .../media}/v4l/v4l2grab-example.rst                |  2 +-
 .../media}/v4l/v4l2grab.c.rst                      |  2 +-
 .../uapi => userspace-api/media}/v4l/vbi_525.svg   |  2 +-
 .../uapi => userspace-api/media}/v4l/vbi_625.svg   |  2 +-
 .../uapi => userspace-api/media}/v4l/vbi_hsync.svg |  2 +-
 .../uapi => userspace-api/media}/v4l/video.rst     |  2 +-
 .../uapi => userspace-api/media}/v4l/videodev.rst  |  2 +-
 .../media}/v4l/vidioc-create-bufs.rst              |  2 +-
 .../media}/v4l/vidioc-cropcap.rst                  |  2 +-
 .../media}/v4l/vidioc-dbg-g-chip-info.rst          |  2 +-
 .../media}/v4l/vidioc-dbg-g-register.rst           |  2 +-
 .../media}/v4l/vidioc-decoder-cmd.rst              |  2 +-
 .../media}/v4l/vidioc-dqevent.rst                  |  2 +-
 .../media}/v4l/vidioc-dv-timings-cap.rst           |  2 +-
 .../media}/v4l/vidioc-encoder-cmd.rst              |  2 +-
 .../media}/v4l/vidioc-enum-dv-timings.rst          |  2 +-
 .../media}/v4l/vidioc-enum-fmt.rst                 |  2 +-
 .../media}/v4l/vidioc-enum-frameintervals.rst      |  2 +-
 .../media}/v4l/vidioc-enum-framesizes.rst          |  2 +-
 .../media}/v4l/vidioc-enum-freq-bands.rst          |  2 +-
 .../media}/v4l/vidioc-enumaudio.rst                |  2 +-
 .../media}/v4l/vidioc-enumaudioout.rst             |  2 +-
 .../media}/v4l/vidioc-enuminput.rst                |  2 +-
 .../media}/v4l/vidioc-enumoutput.rst               |  2 +-
 .../media}/v4l/vidioc-enumstd.rst                  |  2 +-
 .../media}/v4l/vidioc-expbuf.rst                   |  2 +-
 .../media}/v4l/vidioc-g-audio.rst                  |  2 +-
 .../media}/v4l/vidioc-g-audioout.rst               |  2 +-
 .../media}/v4l/vidioc-g-crop.rst                   |  2 +-
 .../media}/v4l/vidioc-g-ctrl.rst                   |  2 +-
 .../media}/v4l/vidioc-g-dv-timings.rst             |  2 +-
 .../media}/v4l/vidioc-g-edid.rst                   |  2 +-
 .../media}/v4l/vidioc-g-enc-index.rst              |  2 +-
 .../media}/v4l/vidioc-g-ext-ctrls.rst              |  2 +-
 .../media}/v4l/vidioc-g-fbuf.rst                   |  2 +-
 .../media}/v4l/vidioc-g-fmt.rst                    |  2 +-
 .../media}/v4l/vidioc-g-frequency.rst              |  2 +-
 .../media}/v4l/vidioc-g-input.rst                  |  2 +-
 .../media}/v4l/vidioc-g-jpegcomp.rst               |  2 +-
 .../media}/v4l/vidioc-g-modulator.rst              |  2 +-
 .../media}/v4l/vidioc-g-output.rst                 |  2 +-
 .../media}/v4l/vidioc-g-parm.rst                   |  2 +-
 .../media}/v4l/vidioc-g-priority.rst               |  2 +-
 .../media}/v4l/vidioc-g-selection.rst              |  2 +-
 .../media}/v4l/vidioc-g-sliced-vbi-cap.rst         |  2 +-
 .../media}/v4l/vidioc-g-std.rst                    |  2 +-
 .../media}/v4l/vidioc-g-tuner.rst                  |  2 +-
 .../media}/v4l/vidioc-log-status.rst               |  2 +-
 .../media}/v4l/vidioc-overlay.rst                  |  2 +-
 .../media}/v4l/vidioc-prepare-buf.rst              |  2 +-
 .../media}/v4l/vidioc-qbuf.rst                     |  2 +-
 .../media}/v4l/vidioc-query-dv-timings.rst         |  2 +-
 .../media}/v4l/vidioc-querybuf.rst                 |  2 +-
 .../media}/v4l/vidioc-querycap.rst                 |  2 +-
 .../media}/v4l/vidioc-queryctrl.rst                |  2 +-
 .../media}/v4l/vidioc-querystd.rst                 |  2 +-
 .../media}/v4l/vidioc-reqbufs.rst                  |  2 +-
 .../media}/v4l/vidioc-s-hw-freq-seek.rst           |  2 +-
 .../media}/v4l/vidioc-streamon.rst                 |  2 +-
 .../v4l/vidioc-subdev-enum-frame-interval.rst      |  2 +-
 .../media}/v4l/vidioc-subdev-enum-frame-size.rst   |  2 +-
 .../media}/v4l/vidioc-subdev-enum-mbus-code.rst    |  2 +-
 .../media}/v4l/vidioc-subdev-g-crop.rst            |  2 +-
 .../media}/v4l/vidioc-subdev-g-fmt.rst             |  2 +-
 .../media}/v4l/vidioc-subdev-g-frame-interval.rst  |  2 +-
 .../media}/v4l/vidioc-subdev-g-selection.rst       |  2 +-
 .../media}/v4l/vidioc-subscribe-event.rst          |  2 +-
 .../media}/v4l/yuv-formats.rst                     |  2 +-
 .../media/video.h.rst.exceptions                   |  0
 .../media/videodev2.h.rst.exceptions               |  0
 MAINTAINERS                                        | 12 ++++++++----
 492 files changed, 466 insertions(+), 462 deletions(-)
 rename Documentation/{media/kapi => driver-api/media}/cec-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/csi2.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-ca.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-common.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-demux.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-frontend.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/dtv-net.rst (100%)
 rename Documentation/{media/media_kapi.rst => driver-api/media/index.rst} (89%)
 rename Documentation/{media/kapi => driver-api/media}/mc-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/rc-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-async.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-clocks.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-common.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-controls.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-core.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-dev.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-device.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-dv-timings.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-event.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-fh.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-flash-led-class.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-fwnode.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-intro.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-mc.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-mediabus.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-mem2mem.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-rect.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-subdev.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-tuner.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-tveeprom.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-videobuf.rst (100%)
 rename Documentation/{media/kapi => driver-api/media}/v4l2-videobuf2.rst (100%)
 rename Documentation/{ => userspace-api}/media/Makefile (97%)
 rename Documentation/{ => userspace-api}/media/audio.h.rst.exceptions (100%)
 rename Documentation/{ => userspace-api}/media/ca.h.rst.exceptions (100%)
 rename Documentation/{ => userspace-api}/media/cec.h.rst.exceptions (100%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-api.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-func-close.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-func-ioctl.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-func-open.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-func-poll.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-funcs.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-header.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-intro.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-adap-g-caps.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-adap-g-conn-info.rst (100%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-adap-g-log-addrs.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-adap-g-phys-addr.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-dqevent.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-g-mode.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-ioc-receive.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/cec/cec-pin-error-inj.rst (99%)
 rename Documentation/{ => userspace-api}/media/conf_nitpick.py (100%)
 rename Documentation/{ => userspace-api}/media/dmx.h.rst.exceptions (100%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-bilingual-channel-select.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-channel-select.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-clear-buffer.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-continue.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-fclose.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-fopen.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-fwrite.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-get-capabilities.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-get-status.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-pause.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-play.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-select-source.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-set-av-sync.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-set-bypass-mode.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-set-id.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-set-mixer.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-set-mute.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-set-streamtype.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio-stop.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio_data_types.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/audio_function_calls.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-fclose.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-fopen.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-get-cap.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-get-descr-info.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-get-msg.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-get-slot-info.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-reset.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-send-msg.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca-set-descr.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca_data_types.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/ca_function_calls.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/demux.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-add-pid.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-expbuf.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-fclose.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-fopen.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-fread.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-fwrite.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-get-pes-pids.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-get-stc.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-mmap.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-munmap.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-qbuf.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-querybuf.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-remove-pid.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-reqbufs.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-set-buffer-size.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-set-filter.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-set-pes-filter.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-start.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx-stop.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx_fcalls.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dmx_types.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dvb-fe-read-status.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dvb-frontend-event.rst (91%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dvb-frontend-parameters.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dvbapi.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dvbproperty.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/dvbstb.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/examples.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-bandwidth-t.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-diseqc-recv-slave-reply.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-diseqc-reset-overload.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-diseqc-send-burst.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-diseqc-send-master-cmd.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-dishnetwork-send-legacy-cmd.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-enable-high-lnb-voltage.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-get-event.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-get-frontend.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-get-info.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-get-property.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-read-ber.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-read-signal-strength.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-read-snr.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-read-status.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-read-uncorrected-blocks.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-set-frontend-tune-mode.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-set-frontend.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-set-tone.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-set-voltage.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe-type-t.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/fe_property_parameters.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend-header.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend-property-cable-systems.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend-property-satellite-systems.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend-property-terrestrial-systems.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend-stat-properties.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend_f_close.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend_f_open.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend_fcalls.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend_legacy_api.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/frontend_legacy_dvbv3_api.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/headers.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/intro.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/legacy_dvb_apis.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/net-add-if.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/net-get-if.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/net-remove-if.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/net-types.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/net.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/query-dvb-frontend-info.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-clear-buffer.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-command.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-continue.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-fast-forward.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-fclose.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-fopen.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-freeze.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-fwrite.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-get-capabilities.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-get-event.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-get-frame-count.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-get-pts.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-get-size.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-get-status.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-play.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-select-source.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-set-blank.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-set-display-format.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-set-format.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-set-streamtype.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-slowmotion.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-stillpicture.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-stop.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video-try-command.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video_function_calls.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/dvb/video_types.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/fdl-appendix.rst (99%)
 rename Documentation/{ => userspace-api}/media/frontend.h.rst.exceptions (100%)
 rename Documentation/{media/uapi => userspace-api/media}/gen-errors.rst (98%)
 rename Documentation/{media/media_uapi.rst => userspace-api/media/index.rst} (80%)
 rename Documentation/{ => userspace-api}/media/intro.rst (100%)
 rename Documentation/{ => userspace-api}/media/lirc.h.rst.exceptions (100%)
 rename Documentation/{ => userspace-api}/media/media.h.rst.exceptions (100%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-controller-intro.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-controller-model.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-controller.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-func-close.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-func-ioctl.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-func-open.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-funcs.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-header.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-ioc-device-info.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-ioc-enum-entities.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-ioc-enum-links.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-ioc-g-topology.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-ioc-request-alloc.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-ioc-setup-link.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-request-ioc-queue.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-request-ioc-reinit.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/media-types.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/request-api.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/request-func-close.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/request-func-ioctl.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/mediactl/request-func-poll.rst (98%)
 rename Documentation/{ => userspace-api}/media/net.h.rst.exceptions (100%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/keytable.c.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-dev-intro.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-dev.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-func.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-get-features.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-get-rec-mode.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-get-rec-resolution.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-get-send-mode.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-get-timeout.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-header.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-read.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-measure-carrier-mode.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-rec-carrier-range.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-rec-carrier.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-rec-timeout-reports.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-rec-timeout.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-send-carrier.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-send-duty-cycle.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-transmitter-mask.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-set-wideband-receiver.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/lirc-write.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/rc-intro.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/rc-protos.rst (100%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/rc-sysfs-nodes.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/rc-table-change.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/rc-tables.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/rc/remote_controllers.rst (95%)
 rename Documentation/{ => userspace-api}/media/typical_media_device.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/app-pri.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/async.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/audio.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/bayer.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/biblio.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/buffer.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/capture-example.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/capture.c.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/colorspaces-defs.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/colorspaces-details.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/colorspaces.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/common-defs.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/common.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/compat.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/constraints.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/control.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/crop.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/crop.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/depth-formats.rst (91%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-capture.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-decoder.rst (100%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-event.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-mem2mem.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-meta.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-osd.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-output.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-overlay.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-radio.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-raw-vbi.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-rds.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-sdr.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-sliced-vbi.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-stateless-decoder.rst (100%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-subdev.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dev-touch.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/devices.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/diff-v4l.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dmabuf.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/dv-timings.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-camera.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-codec.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-detect.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-dv.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-flash.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-fm-rx.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-fm-tx.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-image-process.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-image-source.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-jpeg.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/ext-ctrls-rf-tuner.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/extended-controls.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/field-order.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/fieldseq_bt.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/fieldseq_tb.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/format.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-close.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-ioctl.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-mmap.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-munmap.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-open.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-poll.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-read.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-select.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/func-write.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/hist-v4l2.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/hsv-formats.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/io.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/libv4l-introduction.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/libv4l.rst (90%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/meta-formats.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/mmap.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/nv12mt.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/nv12mt_example.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/open.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pipeline.dot (100%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-bayer.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-cnf4.rst (100%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-compressed.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-grey.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-indexed.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-intro.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-inzi.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-m420.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-meta-d4xx.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-meta-intel-ipu3.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-meta-uvc.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-meta-vivid.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-meta-vsp1-hgo.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-meta-vsp1-hgt.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-nv12.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-nv12m.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-nv12mt.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-nv16.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-nv16m.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-nv24.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-packed-hsv.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-packed-yuv.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-reserved.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-rgb.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-cs08.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-cs14le.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-cu08.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-cu16le.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-pcu16be.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-pcu18be.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-pcu20be.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-sdr-ru12le.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb10-ipu3.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb10.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb10alaw8.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb10dpcm8.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb10p.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb12.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb12p.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb14p.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb16.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-srggb8.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-tch-td08.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-tch-td16.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-tch-tu08.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-tch-tu16.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-uv8.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-uyvy.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-v4l2-mplane.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-v4l2.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-vyuy.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y10.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y10b.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y10p.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y12.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y12i.rst (95%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y16-be.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y16.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y41p.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-y8i.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv410.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv411p.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv420.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv420m.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv422m.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv422p.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuv444m.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yuyv.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-yvyu.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt-z16.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/pixfmt.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/planar-apis.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/querycap.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/rw.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/sdr-formats.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection-api-configuration.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection-api-examples.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection-api-intro.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection-api-targets.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection-api-vs-crop-api.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection-api.rst (92%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selection.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/selections-common.rst (94%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/standard.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/streaming-par.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/subdev-formats.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/subdev-image-processing-crop.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/subdev-image-processing-full.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/subdev-image-processing-scaling-multi-source.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/tch-formats.rst (91%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/tuner.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/user-func.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/userp.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/v4l2-selection-flags.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/v4l2-selection-targets.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/v4l2.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/v4l2grab-example.rst (93%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/v4l2grab.c.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vbi_525.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vbi_625.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vbi_hsync.svg (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/video.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/videodev.rst (91%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-create-bufs.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-cropcap.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-dbg-g-chip-info.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-dbg-g-register.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-decoder-cmd.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-dqevent.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-dv-timings-cap.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-encoder-cmd.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enum-dv-timings.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enum-fmt.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enum-frameintervals.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enum-framesizes.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enum-freq-bands.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enumaudio.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enumaudioout.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enuminput.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enumoutput.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-enumstd.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-expbuf.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-audio.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-audioout.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-crop.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-ctrl.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-dv-timings.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-edid.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-enc-index.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-ext-ctrls.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-fbuf.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-fmt.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-frequency.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-input.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-jpegcomp.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-modulator.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-output.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-parm.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-priority.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-selection.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-sliced-vbi-cap.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-std.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-g-tuner.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-log-status.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-overlay.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-prepare-buf.rst (96%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-qbuf.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-query-dv-timings.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-querybuf.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-querycap.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-queryctrl.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-querystd.rst (97%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-reqbufs.rst (99%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-s-hw-freq-seek.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-streamon.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-enum-frame-interval.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-enum-frame-size.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-enum-mbus-code.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-g-crop.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-g-fmt.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-g-frame-interval.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subdev-g-selection.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/vidioc-subscribe-event.rst (98%)
 rename Documentation/{media/uapi => userspace-api/media}/v4l/yuv-formats.rst (97%)
 rename Documentation/{ => userspace-api}/media/video.h.rst.exceptions (100%)
 rename Documentation/{ => userspace-api}/media/videodev2.h.rst.exceptions (100%)

-- 
2.21.1


