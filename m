Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0772ADD8B
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 10:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbfD2ISG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 04:18:06 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:49059 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727477AbfD2ISF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 04:18:05 -0400
Received: from [192.168.2.10] ([212.251.195.8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id L1U7hsEKoZVjxL1UAhsBbY; Mon, 29 Apr 2019 10:18:03 +0200
Subject: Re: [PATCH v11 0/7] [media] Add analog mode support for Medion
 MD95700
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Walls <awalls@md.metrocast.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org
References: <cover.1556365459.git.mail@maciej.szmigiero.name>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9a0d5e31-120b-c0fa-7782-c330a06c23b3@xs4all.nl>
Date:   Mon, 29 Apr 2019 10:17:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1556365459.git.mail@maciej.szmigiero.name>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIkWV7YY8MYm042nRkT6C05ZPbvJ1JcARnTFtKNFcl2ZG9ompl8rK+JMhpWairbxlIad78xEivd3efziEOAFrlTCqnfCg34ZOJVyKrITlCc3BUtlBrcs
 pXGYCDqfrpIyHPQtaTM3Sx9+YSE4YJt2LJ70QnbPLX1txrHhJZEnp4SFNmmAMvgMFSD5OAuGhU1+1T9QlN4amJBK5vbQCdkfGzJjLe/PzUmMvTBAuYvsQhw+
 WUvh+JK9J6vsWRlrnXT+D1DqoaMmKM8fQ11WwDnGAQDVffzgeJchYdIMX3oViF4waISYOtCN779jbD5a53lbPkVGXUJDN/IowWADSMtuLAIPBCxkbSOACh49
 I+wzxhZ5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maciej,

I reviewed v11 and I had only two comments in two sources. Can you fix that
and post a v12?

Mike, once v12 is posted, can you try and test it on your hardware?

The goal is to get this merged for 5.3.

Maciej, just FYI: I won't merge the last patch. It's OK to post it, that
way it is archived if anyone is ever interested in this in the future, but
it's not something that we want to merge. It adds a new public API to enable
this, and that's not something we'd like to do unless there is a really
good reason. And adding a debug feature for old hardware isn't enough of a
reason. Sorry.

Regards,

	Hans

On 4/27/19 4:50 PM, Maciej S. Szmigiero wrote:
> This series adds support for analog part of Medion 95700 in the cxusb
> driver.
> 
> What works:
> * Video capture at various sizes with sequential fields,
> * Input switching (TV Tuner, Composite, S-Video),
> * TV and radio tuning,
> * Video standard switching and auto detection,
> * Radio mode switching (stereo / mono),
> * Unplugging while capturing,
> * DVB / analog coexistence,
> * Raw BT.656 stream support.
> 
> What does not work yet:
> * Audio,
> * VBI,
> * Picture controls.
> 
> This series (as a one patch) was submitted for inclusion few years ago,
> then waited few months in a patch queue.
> Unfortunately, by the time it was supposed to be merged there
> were enough changes in media that it was no longer mergeable.
> 
> I thought at that time that I will be able to rebase and retest it soon
> but unfortunately up till now I was never able to find enough time to do
> so.
> Also, with the passing of time the implementation diverged more and
> more from the current kernel code, necessitating even more reworking.
> 
> That last iteration can be found here:
> https://patchwork.linuxtv.org/patch/8048/
> 
> Since that version there had been the following changes:
> * Adaptation to changes in V4L2 / DVB core,
> 
> * Radio device was added, with a possibility to tune to a FM radio
> station and switch between stereo and mono modes (tested by taping
> audio signal directly at tuner output pin),
> 
> * DVB / analog coexistence was improved - resolved a few cases where
> DVB core would switch off power or reset the tuner when the device
> was still being used but in the analog mode,
> 
> * Fixed issues reported by v4l2-compliance,
> 
> * Switching to raw BT.656 mode is now done by a custom streaming
> parameter set via VIDIOC_S_PARM ioctl instead of using a
> V4L2_BUF_TYPE_PRIVATE buffer (which was removed from V4L2),
> 
> * General small code cleanups (like using BIT() or ARRAY_SIZE() macros
> instead of open coding them, code formatting improvements, etc.).
> 
> Changes from v1:
> * Only support configuration of cx25840 pins that the cxusb driver is
> actually using so there is no need for an ugly CX25840_PIN() macro,
> 
> * Split cxusb changes into two patches: first one implementing
> digital / analog coexistence in this driver, second one adding the
> actual implementation of the analog mode,
> 
> * Fix a warning reported by kbuild test robot.
> 
> Changes from v2:
> * Split out ivtv cx25840 platform data zero-initialization to a separate
> commit,
> 
> * Add kernel-doc description of struct cx25840_state,
> 
> * Make sure that all variables used in CX25840_VCONFIG_OPTION() and
> CX25840_VCONFIG_SET_BIT() macros are their explicit parameters,
> 
> * Split out some code from cxusb_medion_copy_field() and
> cxusb_medion_v_complete_work() functions to separate ones to increase
> their readability,
> 
> * Generate masks using GENMASK() and BIT() macros in cx25840.h and
> cxusb.h.
> 
> Changes from v3:
> Add SPDX tag to a newly added "cxusb-analog.c" file.
> 
> Changes from v4:
> * Make analog support conditional on a new DVB_USB_CXUSB_ANALOG Kconfig
> option,
> 
> * Use '//' comments in the header of a newly added "cxusb-analog.c"
> file,
> 
> * Don't print errors on memory allocation failures,
> 
> * Get rid of the driver MODULE_VERSION(),
> 
> * Small formating fix of a one line.
> 
> Changes from v5:
> Rebase onto current media_tree/master.
> 
> Changes from v6:
> Adapt to commit 4eb2f55728abbe changing V4L2_SUBDEV_IO_PIN_* from bit
> masks to bit numbers.
> Thanks to Dan Carpenter's kbuild bot for catching this.
> 
> Changes from v7:
> * Simplify cx25840_function_to_pad() assuming that the values of
> individual members of I/O pad enum will always match the actual
> chip register values,
> 
> * Add a comment that the above is now a requirement to the I/O pad enum,
> 
> * Don't #undef macros in the cx25840 patch,
> 
> * Change "generic_mode" variable type in struct cx25840_state to bool,
> 
> * Prefix todo-style comments added by the cx25840 patch with "TODO:",
> 
> * Add a core init op to the cx25840 driver and use it to turn the
> generic_mode on instead of doing it via the platform data,
> 
> * Use the above core init op to also provide a vconfig configuration
> to the cx25840 driver so the cxusb driver does not have to pass this
> (constant) configuration there on every video input change,
> 
> * Remove cxusb_auxbuf_advance(), cxusb_auxbuf_begin() and
> cxusb_auxbuf_isend(),
> 
> * Add a missing frame sequence counter support,
> 
> * Test the driver with v4l2-compliance with streaming tests enabled,
> 
> * Set device_caps in struct video_device during probe instead of returning
> it manually in vidioc_querycap handler,
> 
> * Don't set the format name in vidioc_enum_fmt_vid_cap handler,
> 
> * Drop various memset() zeroing in ioctl handlers, as suggested during
> last review,
> 
> * Enforce minimum buffer count via in_buffers_needed field of
> struct vb2_queue instead of doing it in queue_setup callback,
> 
> * Rewrite stream starting / stopping / configuration mechanism using a
> 'stop_streaming' flag, remove cxusb_medion_stream_busy(),
> 
> * Set the lock field in struct vb2_queue so vb2_ops_wait_prepare() /
> vb2_ops_wait_finish() helpers can be utilized,
> 
> * Split out raw (unprocessed) BT.656 stream capturing support to a
> separate patch, adapt it to a recent change introduced by
> commit 8a7c5594c020 ("v4l2-ioctl: clear fields in s_parm") that forced
> extendedmode set by VIDIOC_S_PARM to zero,
> 
> * Add a comment that if we ever need to support analog mode in similar
> hardware then this code should be made generic,
> 
> * Remove a requirement that URB length has to be less than full frame
> size,
> 
> * Limit URB length to avoid very high order memory allocations,
> 
> * Remove out-of-order incoming URB support: this can't really happen,
> 
> * Small cleanups here and there.
> 
> Changes from v8:
> Rebase onto current media_tree/master.
> 
> Changes from v9:
> * Elaborate generic mode comments in cx25840 and cxusb drivers,
> add datasheet references to cx25840 chip video output settings,
> 
> * Describe the new DVB_USB_ADAP_STREAMING_CTRL_NO_URB flag,
> 
> * Drop likely and unlikely annotations in cxusb driver from the patches,
> 
> * Exclusively use strscpy (and not strncpy, strcpy, etc.) in the patches,
> 
> * Drop zeroing of various v4l fields which should be zeroed by the
> core v4l code,
> 
> * Adapt VIDIOC_S_FMT handler so the video format can't be changed if
> buffers are allocated,
> 
> * Add VB2_DMABUF to the list of supported I/O modes.
> 
> Changes from v10:
> * Add a commit cleaning up cx25840_load_fw() and its comments
> (no functional change intended),
> 
> * Add a commit renaming cx25840 g_std operation to querystd operation
> since this is what this handler does,
> 
> * Add a commit that clamps out-of-range picture sizes in cx25840
> set_fmt subdev operation so it conforms better to the V4L2 API,
> 
> * cx25840 driver generic mode (enabled by calling its init op) is currently
> only implemented for cx2584x-family chips.
> Add a relevant comment and a warning to catch unintentional uses,
> 
> * Program cx25840 driver video timings in the generic mode to the same
> values that the chip autoconfig would set.
> 
> While improving the set_fmt subdev operation it became obvious that
> the video timings that cx25840 driver was setting resulted in a strange
> BT.656 PAL stream that had two active video areas per field (one with
> just a single line) and 580 active lines total.
> An output format with 580 active lines total meant that the most common
> PAL capture line count of 576 needed a non-identity scaling factor.
> 
> This is the reason why in the generic mode the driver now uses the same
> values that the chip autoconfig would set (read from the chip).
> These give a nice, BT.656-compliant PAL stream with 576 lines and one
> active video area per field.
> 
> cxusb raw mode, as provided by the last commit, is very useful for
> diagnosing these issues as it gives access to a raw BT.656 stream
> from the cx25840 chip where one can see line count for each field, see
> where VBI lines lie, which lines actually contain samples (as it is
> possible to have some active video lines without any samples at all and
> some VBI lines with normal line samples - cx25840 can move a VBI marker
> independently of a "start capturing samples" marker and, in fact, can have
> a slightly different VBI / active video divider between the two fields in
> a frame),
> 
> * Remove the dvb-usb framework DVB_USB_ADAP_STREAMING_CTRL_NO_URB flag
> and always assume its behaviour (always make sure that data URBs are
> not active before calling a driver streaming_ctrl callback),
> 
> * Initialize cxusb driver to PAL mode instead of trying to autodetect
> the standard,
> 
> * Change videodev->tvnorms and the currently set standard when switching
> inputs so VIDIOC_ENUMSTD and VIDIOC_G_STD correctly return a limited
> standard set for TV tuner input,
> 
> * Implement VIDIOC_QUERYSTD operation,
> 
> * Make sure to return bottom-top field order for 525-line signal
> captures.
> 
>  drivers/media/i2c/cx25840/cx25840-core.c |  544 +++++-
>  drivers/media/i2c/cx25840/cx25840-core.h |   15 +
>  drivers/media/i2c/cx25840/cx25840-vbi.c  |    4 +
>  drivers/media/usb/dvb-usb/Kconfig        |   16 +-
>  drivers/media/usb/dvb-usb/Makefile       |    3 +
>  drivers/media/usb/dvb-usb/cxusb-analog.c | 1974 ++++++++++++++++++++++
>  drivers/media/usb/dvb-usb/cxusb.c        |  451 ++++-
>  drivers/media/usb/dvb-usb/cxusb.h        |  158 ++
>  drivers/media/usb/dvb-usb/dvb-usb-dvb.c  |    5 +-
>  drivers/media/usb/dvb-usb/dvb-usb-init.c |   13 +
>  drivers/media/usb/dvb-usb/dvb-usb.h      |   10 +
>  drivers/media/v4l2-core/v4l2-ioctl.c     |    3 +-
>  include/media/drv-intf/cx25840.h         |  105 +-
>  13 files changed, 3166 insertions(+), 135 deletions(-)
>  create mode 100644 drivers/media/usb/dvb-usb/cxusb-analog.c
> 

