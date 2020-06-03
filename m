Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D991ED224
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 16:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgFCOeE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 10:34:04 -0400
Received: from mout.web.de ([212.227.15.4]:37379 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbgFCOeC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 10:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1591194824;
        bh=nQlXu0zb/OtRRzPGeyJ5f1A4xN+Jr4U1kWgrljAv8Ig=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=pF8sepgmJILcsXVCx++MRMnpdbzVUY1LR+nZuDXVvF7SkXZN3fol5hm+cISnksDV0
         VM8DCxGdQIyAwQryhOROvnPI9kkq+/02P7D3y46xygjIdwTjSiHlBAcm13MiImSIUq
         yTAjv4Ypb3Nd/bC3IvU/wAejO+HaiFSK/S3cPyLk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([89.247.255.168]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mx0Ix-1imatQ4BWF-00yPqa; Wed, 03
 Jun 2020 16:33:44 +0200
Date:   Wed, 3 Jun 2020 16:33:26 +0200
From:   Lukas Straub <lukasstraub2@web.de>
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc:     Michael Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Walls <awalls@md.metrocast.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v12 0/8] [media] Add analog mode support for Medion
 MD95700
Message-ID: <20200603163326.2550376b@luklap>
In-Reply-To: <cover.1556554056.git.mail@maciej.szmigiero.name>
References: <cover.1556554056.git.mail@maciej.szmigiero.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mMmdFCnEEV8PkSbojDXnOT.";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:Y1z2chjzraLrjvYQN45k0pjnng1RUBfNsOhkbHJ41Xx5qO46nBh
 O0t1MODqF35ut1dSORRW7nC0eCOOlY1cQ244sp3/SzA/vUok7CI9tcQR9wFNCVudVX9HUZJ
 0Te10XwmqRJPCTtxwx3eMOtfR9RVjrANfEBBfWZ/N5b1tIzD3+ZCMjJoS9D2XS4AeO+LkLT
 8iN5zyTXzCkNlchA12Caw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mK5PuFyfB0k=:9vmNjQhLWPGbsIUXfUgJJ1
 eRrl5oKsMKmw6oLwtqRrhyGOPfyQa97HaZOW5ZflfWfuwZKC2+rGhgSxEQjCMZjZOUMjsdl+V
 5ePC56GE6W1OKheFnNtZ4QlsXRO8QozFO9Xf74ZqT1N749p74/5ur396tcD7HnZCwWS+KLJrP
 ot3VZIyxfqpuBjrfZ2WjXD6bOg3w8x9SfnJmykIPlKgsPElPgLgVY1CSsy069j2Pt7tnJa/90
 nvfiIOXogS8L/4j2bxXuC3VjInvhzjL+aHVU7YeL9XZ3xv4FsaTg9l9QRFZ2Q0d1RpEe+Ggt0
 ClJGiWWT9yPdxUVg//qj+Ak45GqLEPTT+Av9i4noWGAvoXVxDuic6kfZ2rfXiT7zx7b0xVXO6
 nntisycMyV7vylSgHHgPPwcSgjxKWSOM9KbGRji6Spv2LDg2Qeq4Ok2BLHqWWTDL1EK0HqZ6H
 JjrunXsGv7zwX7PZ5oMnFv/6qNAK/23e5fGgSYod9o6yygEXsNbKswcWRyxa0kYz2aCtVX8qV
 +HT4BCP1ZY+McylnlP32iPQpRxrRxlEAmoTfTKErmaDfv6NFIE2S+P4NK+uN/k4JO4KHUbRb5
 fgptUWnLrwDKKvHDdqISYclfe3t4gZy9wJaSHPg4bH438sl30qCKTkU26r4tNhHALKKRRMuK9
 oS0UflEypUyTbhPeoOpv49L9sBKGD352DzpI7o7R9e+sDZ2dfqKEcF84Iuarzd3+hfdpVSdqG
 CMdgOnbU/4KiQ2BRmlRcVC9xlJ6mkb0ZjrtO7Ke8EtmbDGAsKKTc2MbuRopr7o9yYYj+jAxja
 LvgewDFtYSs83gUqZ9Ygz1E9Prox05phlBhy/ZTV4rsig5TVtYUbC0NnePKQgKDOv0TGPdGDo
 CGS2dOYOuhsy32iw43Mec17EJPyrm2IFfRkQovXkn0EXkh8QsJyU1ZD6egxISgDkrrq9paAsW
 QCNYNiHR421SE2YNyAJGZ+E/EDL/vQdfw39dskajLMSYyDrjZCrR9nGnt/opqcdLIJbxVMDI5
 c03AfVJJb+t26XGE5D08JvwH2ubJwbgUWzSfXYfwHYsz3ThkJs7+LuznUHDU7Fbk/eanFmD3U
 rgilTuqBR31jZRQdoe5BcibD9UW4eCNkF/o6AxLbPU5Pf17WqS7a9urPnHdpzV2HGSEYFXh1h
 KKcZIs+5+nWLumr0awQlWbWXzSolWr/Lb5vfuTmS7Xk4XQJ191RSUkvI7vLVxh0eOJlaug0Ba
 DmTsBycY8qo8PTczI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/mMmdFCnEEV8PkSbojDXnOT.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Apr 2019 18:16:51 +0200
"Maciej S. Szmigiero" <mail@maciej.szmigiero.name> wrote:

> This series adds support for analog part of Medion 95700 in the cxusb
> driver.
>=20
> What works:
> * Video capture at various sizes with sequential fields,
> * Input switching (TV Tuner, Composite, S-Video),
> * TV and radio tuning,
> * Video standard switching and auto detection,
> * Radio mode switching (stereo / mono),
> * Unplugging while capturing,
> * DVB / analog coexistence,
> * Raw BT.656 stream support.
>=20
> What does not work yet:
> * Audio,
> * VBI,
> * Picture controls.
>=20
> This series (as a one patch) was submitted for inclusion few years ago,
> then waited few months in a patch queue.
> Unfortunately, by the time it was supposed to be merged there
> were enough changes in media that it was no longer mergeable.
>=20
> I thought at that time that I will be able to rebase and retest it soon
> but unfortunately up till now I was never able to find enough time to do
> so.
> Also, with the passing of time the implementation diverged more and
> more from the current kernel code, necessitating even more reworking.
>=20
> That last iteration can be found here:
> https://patchwork.linuxtv.org/patch/8048/
>=20
> Since that version there had been the following changes:
> * Adaptation to changes in V4L2 / DVB core,
>=20
> * Radio device was added, with a possibility to tune to a FM radio
> station and switch between stereo and mono modes (tested by taping
> audio signal directly at tuner output pin),
>=20
> * DVB / analog coexistence was improved - resolved a few cases where
> DVB core would switch off power or reset the tuner when the device
> was still being used but in the analog mode,
>=20
> * Fixed issues reported by v4l2-compliance,
>=20
> * Switching to raw BT.656 mode is now done by a custom streaming
> parameter set via VIDIOC_S_PARM ioctl instead of using a
> V4L2_BUF_TYPE_PRIVATE buffer (which was removed from V4L2),
>=20
> * General small code cleanups (like using BIT() or ARRAY_SIZE() macros
> instead of open coding them, code formatting improvements, etc.).
>=20
> Changes from v1:
> * Only support configuration of cx25840 pins that the cxusb driver is
> actually using so there is no need for an ugly CX25840_PIN() macro,
>=20
> * Split cxusb changes into two patches: first one implementing
> digital / analog coexistence in this driver, second one adding the
> actual implementation of the analog mode,
>=20
> * Fix a warning reported by kbuild test robot.
>=20
> Changes from v2:
> * Split out ivtv cx25840 platform data zero-initialization to a separate
> commit,
>=20
> * Add kernel-doc description of struct cx25840_state,
>=20
> * Make sure that all variables used in CX25840_VCONFIG_OPTION() and
> CX25840_VCONFIG_SET_BIT() macros are their explicit parameters,
>=20
> * Split out some code from cxusb_medion_copy_field() and
> cxusb_medion_v_complete_work() functions to separate ones to increase
> their readability,
>=20
> * Generate masks using GENMASK() and BIT() macros in cx25840.h and
> cxusb.h.
>=20
> Changes from v3:
> Add SPDX tag to a newly added "cxusb-analog.c" file.
>=20
> Changes from v4:
> * Make analog support conditional on a new DVB_USB_CXUSB_ANALOG Kconfig
> option,
>=20
> * Use '//' comments in the header of a newly added "cxusb-analog.c"
> file,
>=20
> * Don't print errors on memory allocation failures,
>=20
> * Get rid of the driver MODULE_VERSION(),
>=20
> * Small formating fix of a one line.
>=20
> Changes from v5:
> Rebase onto current media_tree/master.
>=20
> Changes from v6:
> Adapt to commit 4eb2f55728abbe changing V4L2_SUBDEV_IO_PIN_* from bit
> masks to bit numbers.
> Thanks to Dan Carpenter's kbuild bot for catching this.
>=20
> Changes from v7:
> * Simplify cx25840_function_to_pad() assuming that the values of
> individual members of I/O pad enum will always match the actual
> chip register values,
>=20
> * Add a comment that the above is now a requirement to the I/O pad enum,
>=20
> * Don't #undef macros in the cx25840 patch,
>=20
> * Change "generic_mode" variable type in struct cx25840_state to bool,
>=20
> * Prefix todo-style comments added by the cx25840 patch with "TODO:",
>=20
> * Add a core init op to the cx25840 driver and use it to turn the
> generic_mode on instead of doing it via the platform data,
>=20
> * Use the above core init op to also provide a vconfig configuration
> to the cx25840 driver so the cxusb driver does not have to pass this
> (constant) configuration there on every video input change,
>=20
> * Remove cxusb_auxbuf_advance(), cxusb_auxbuf_begin() and
> cxusb_auxbuf_isend(),
>=20
> * Add a missing frame sequence counter support,
>=20
> * Test the driver with v4l2-compliance with streaming tests enabled,
>=20
> * Set device_caps in struct video_device during probe instead of returning
> it manually in vidioc_querycap handler,
>=20
> * Don't set the format name in vidioc_enum_fmt_vid_cap handler,
>=20
> * Drop various memset() zeroing in ioctl handlers, as suggested during
> last review,
>=20
> * Enforce minimum buffer count via in_buffers_needed field of
> struct vb2_queue instead of doing it in queue_setup callback,
>=20
> * Rewrite stream starting / stopping / configuration mechanism using a
> 'stop_streaming' flag, remove cxusb_medion_stream_busy(),
>=20
> * Set the lock field in struct vb2_queue so vb2_ops_wait_prepare() /
> vb2_ops_wait_finish() helpers can be utilized,
>=20
> * Split out raw (unprocessed) BT.656 stream capturing support to a
> separate patch, adapt it to a recent change introduced by
> commit 8a7c5594c020 ("v4l2-ioctl: clear fields in s_parm") that forced
> extendedmode set by VIDIOC_S_PARM to zero,
>=20
> * Add a comment that if we ever need to support analog mode in similar
> hardware then this code should be made generic,
>=20
> * Remove a requirement that URB length has to be less than full frame
> size,
>=20
> * Limit URB length to avoid very high order memory allocations,
>=20
> * Remove out-of-order incoming URB support: this can't really happen,
>=20
> * Small cleanups here and there.
>=20
> Changes from v8:
> Rebase onto current media_tree/master.
>=20
> Changes from v9:
> * Elaborate generic mode comments in cx25840 and cxusb drivers,
> add datasheet references to cx25840 chip video output settings,
>=20
> * Describe the new DVB_USB_ADAP_STREAMING_CTRL_NO_URB flag,
>=20
> * Drop likely and unlikely annotations in cxusb driver from the patches,
>=20
> * Exclusively use strscpy (and not strncpy, strcpy, etc.) in the patches,
>=20
> * Drop zeroing of various v4l fields which should be zeroed by the
> core v4l code,
>=20
> * Adapt VIDIOC_S_FMT handler so the video format can't be changed if
> buffers are allocated,
>=20
> * Add VB2_DMABUF to the list of supported I/O modes.
>=20
> Changes from v10:
> * Add a commit cleaning up cx25840_load_fw() and its comments
> (no functional change intended),
>=20
> * Add a commit renaming cx25840 g_std operation to querystd operation
> since this is what this handler does,
>=20
> * Add a commit that clamps out-of-range picture sizes in cx25840
> set_fmt subdev operation so it conforms better to the V4L2 API,
>=20
> * cx25840 driver generic mode (enabled by calling its init op) is current=
ly
> only implemented for cx2584x-family chips.
> Add a relevant comment and a warning to catch unintentional uses,
>=20
> * Program cx25840 driver video timings in the generic mode to the same
> values that the chip autoconfig would set.
>=20
> While improving the set_fmt subdev operation it became obvious that
> the video timings that cx25840 driver was setting resulted in a strange
> BT.656 PAL stream that had two active video areas per field (one with
> just a single line) and 580 active lines total.
> An output format with 580 active lines total meant that the most common
> PAL capture line count of 576 needed a non-identity scaling factor.
>=20
> This is the reason why in the generic mode the driver now uses the same
> values that the chip autoconfig would set (read from the chip).
> These give a nice, BT.656-compliant PAL stream with 576 lines and one
> active video area per field.
>=20
> cxusb raw mode, as provided by the last commit, is very useful for
> diagnosing these issues as it gives access to a raw BT.656 stream
> from the cx25840 chip where one can see line count for each field, see
> where VBI lines lie, which lines actually contain samples (as it is
> possible to have some active video lines without any samples at all and
> some VBI lines with normal line samples - cx25840 can move a VBI marker
> independently of a "start capturing samples" marker and, in fact, can have
> a slightly different VBI / active video divider between the two fields in
> a frame),
>=20
> * Remove the dvb-usb framework DVB_USB_ADAP_STREAMING_CTRL_NO_URB flag
> and always assume its behaviour (always make sure that data URBs are
> not active before calling a driver streaming_ctrl callback),
>=20
> * Initialize cxusb driver to PAL mode instead of trying to autodetect
> the standard,
>=20
> * Change videodev->tvnorms and the currently set standard when switching
> inputs so VIDIOC_ENUMSTD and VIDIOC_G_STD correctly return a limited
> standard set for TV tuner input,
>=20
> * Implement VIDIOC_QUERYSTD operation,
>=20
> * Make sure to return bottom-top field order for 525-line signal
> captures.
>=20
> Changes from v11:
> Add g_std operation to cx25840 driver and use it instead of querystd
> operation when determining field order in cxusb driver.
>=20
>  drivers/media/i2c/cx25840/cx25840-core.c |  554 +++++-
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
>  13 files changed, 3176 insertions(+), 135 deletions(-)
>  create mode 100644 drivers/media/usb/dvb-usb/cxusb-analog.c

Hi,
Any status on this?

Regards,
Lukas Straub

--Sig_/mMmdFCnEEV8PkSbojDXnOT.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl7XtLYACgkQNasLKJxd
sljjtw//VfqNd/TpHmkXuF5jx1SYqEL4yQeBN/ndgA7qobryiQ4Wpzfo/F0cw3Pz
9kgtFRbjT4/PFKPrbqNKFTOgHADsYP5S+fUVl4KOg284ZYROJh9GrJY9n9e5OuS6
QklEWWgW83NW+ZyAMO+FDDsBPU5bHu3UO/o2N71kWoibXQxtBw+tSRHwt+tH3Oof
sQsbnDDyHtyrYEzRGMqq4tN9QG31xBfX5yiDqjMZO4YNr4/GK1Jz387odc47SBFp
QfmZmVpi3hfJ01qx3BoGy4rmsVIkCEzLT0vdSY9J7bL0Sl579bz9GfB4MxzmgEnd
vb8y6WGnGqqWEtJkhR822sxSa84upTk2/+2JTMgeUUCF7kauSdKiug0WwY363OCf
d+YkaXLj1u5zRy7Q3q57Z1ktOoSYNeZTiD44dpr92CzNDu6KzeNB06g6aLA4/Dun
KfXic0q8JhLcc2WAvTuFReJPz3pf7CUdjZW8xkW72elma3uO6M7WJS6pgtgZKZuM
FUV9lbWslwZO/gaX4RsrbsvvOsRb7yBPNB7Ux2uRadKYGlDQYEfoA9axKehKlCke
SvKW0mMpetASJSNDoxCfhSEA+HQCAk/OJ7TyTJw9T3EKtoMHWESAbDitmiy9vOff
/gnm0ahGGGuqtjfuk7qtQkfAACCjg+XdKDSRpxydzqZMmXaCBGw=
=pnsC
-----END PGP SIGNATURE-----

--Sig_/mMmdFCnEEV8PkSbojDXnOT.--
