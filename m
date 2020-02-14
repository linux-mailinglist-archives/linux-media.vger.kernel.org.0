Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC0315D8C1
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 14:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729328AbgBNNuM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 14 Feb 2020 08:50:12 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59723 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728405AbgBNNuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 08:50:12 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1j2bM6-00034I-2q; Fri, 14 Feb 2020 14:50:06 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1j2bM5-0003uw-23; Fri, 14 Feb 2020 14:50:05 +0100
Message-ID: <b30ab10a43c80e9096e45a6d52d125c1e297f021.camel@pengutronix.de>
Subject: Re: video decoding on imx8mq vpu via v4l2
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        ezequiel@collabora.com, mchehab@kernel.org,
        Shawn Guo <shawnguo@kernel.org>, s.hauer@pengutronix.de,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     linux-media@vger.kernel.org
Date:   Fri, 14 Feb 2020 14:50:04 +0100
In-Reply-To: <ce102c01-74b1-628d-2192-9d5cb7baa616@puri.sm>
References: <ce102c01-74b1-628d-2192-9d5cb7baa616@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Fri, 2020-02-14 at 12:46 +0100, Martin Kepplinger wrote:
> Hi,
> 
> I'd like to test decoding an mpeg2 or h264 video file on imx8mq, using
> its vpu:
> 
> I use Philipp's changes for imx8m from
> https://git.pengutronix.de/cgit/pza/linux/log/?h=hantro/imx8m-wip in my
> tree:
> 
> https://source.puri.sm/martin.kepplinger/linux-next/commits/5.6-rc1/librem5__integration
> 
> and play around with gstreamer, taking notes at
> https://source.puri.sm/Librem5/linux-next/issues/74
> 
> The driver probes fine and v4l2 appearently sees the MEM2MEM decoder:
> 
> $ v4l2-ctl --list-devices
> nxp,imx8mq-vpu-dec (platform: hantro-vpu):
> 	/dev/video0
> 
> 
> AFAIK gstreamer should provide a "v4l2videodec" element which it doesn't:

The GStreamer V4L2 decoder elements are only implemented for the
stateful codec API [1] so far.

[1] https://linuxtv.org/downloads/v4l-dvb-apis-new/uapi/v4l/dev-decoder.html

There are plans to add direct support for stateless codecs [2] to
GStreamer, but that will still be a bit of work as far as I understand.

[added Nicolas to Cc:]

[2] https://linuxtv.org/downloads/v4l-dvb-apis-new/uapi/v4l/dev-stateless-decoder.html

In the interim, I have plugged together a GStreamer VA-API stack based
on Bootlin's libva-v4l2-request backend. See below.

> $ gst-inspect-1.0|grep -i v4l
> video4linux2:  v4l2deviceprovider (GstDeviceProviderFactory)
> video4linux2:  v4l2radio: Radio (video4linux2) Tuner
> video4linux2:  v4l2sink: Video (video4linux2) Sink
> video4linux2:  v4l2src: Video (video4linux2) Source
> 
> First: Philipp, do you plan to continue working on supporting hantro for
> imx8m upstream?

Yes. We need to sort out the i.MX8MM power domain bindings / drivers,
and I have to test that the Hantro G1 kernel patches work on i.MX8MM as
well, to make sure we got the DT bindings right. I'll then resend the
series for both i.MX8MQ and i.MX8MM.

> Then: What codec would be appropriate to test decoding now? It seems
> like h264 is supposed to be implemented. How do you test?

There is a patched FFmpeg floating around that can drive the Hantro
driver. I'm using a patched libva-v4l2-request [3] / libva [4] /
GStreamer VA-API [5,6] stack to test.

[3] https://github.com/bootlin/libva-v4l2-request/pull/29
[4] https://github.com/intel/libva/pull/332
[5] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/merge_requests/729
[6] https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi/merge_requests/171

> And finally: What could be missing here? I use debian's gstreamer
> package, but in this case it can't really be a config/build issue in
> gstreamer, right?

None of this was merged in 1.16.2. The GStreamer VA-API changes depend
on API changes in libva, which currently add Hantro-specifics to a
generic API, and all this is based on a still unstable kernel API.

regards
Philipp
