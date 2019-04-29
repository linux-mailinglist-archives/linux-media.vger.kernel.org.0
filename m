Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB6EDDD63
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 10:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbfD2IHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 04:07:53 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:55223 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727362AbfD2IHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 04:07:53 -0400
Received: from [192.168.2.10] ([212.251.195.8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id L1KDhs9s1ZVjxL1KGhs8Tm; Mon, 29 Apr 2019 10:07:49 +0200
Subject: Re: [PATCH v11 6/7] [media] cxusb: add analog mode support for Medion
 MD95700
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Walls <awalls@md.metrocast.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org
References: <cover.1556365459.git.mail@maciej.szmigiero.name>
 <c69c6e033a09e32cc292830152d4370624218fae.1556365459.git.mail@maciej.szmigiero.name>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8b8a3cd0-1adb-6c8a-796b-7e2093eb1da5@xs4all.nl>
Date:   Mon, 29 Apr 2019 10:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <c69c6e033a09e32cc292830152d4370624218fae.1556365459.git.mail@maciej.szmigiero.name>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIiOAI0fHsJh/PQsEuz3k80u4CxwITeJN89ania/UQPKhg+9Yj5+rU0n+NXGsox+lagyxdtxOgwzDDuRbq09+1PPkVBVQpRwBYGT5ioOqkgjC0b8jlfV
 L3wBO9NmWBEHH+f9cO8U/FToD6D0MZNhTaLiswYWCPUzWf1fHv5ico3KoBjR939K1BeCB3YFBdPyWIxjBQgvp/TcgQyCTIaGrWaH4l7Sc6pBI/AMiuN/rlS5
 E/aWS4bk8ZFMoKz7+AFaUDhLaQMtiY4NNFnNdWDm6CGoYH+1hXzNIZDV81gngbMadofhHkLm/OMFJ2MoA1xuT+E20m4zYkP3tnWJlOeNzgVKWoHhk4xUQQMO
 MGolOjyK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/27/19 4:50 PM, Maciej S. Szmigiero wrote:
> This patch adds support for analog part of Medion 95700 in the cxusb
> driver.
> 
> What works:
> * Video capture at various sizes with sequential fields,
> * Input switching (TV Tuner, Composite, S-Video),
> * TV and radio tuning,
> * Video standard switching and auto detection,
> * Radio mode switching (stereo / mono),
> * Unplugging while capturing,
> * DVB / analog coexistence.
> 
> What does not work yet:
> * Audio,
> * VBI,
> * Picture controls.
> 
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> ---
>  drivers/media/usb/dvb-usb/Kconfig        |   16 +-
>  drivers/media/usb/dvb-usb/Makefile       |    3 +
>  drivers/media/usb/dvb-usb/cxusb-analog.c | 1848 ++++++++++++++++++++++
>  drivers/media/usb/dvb-usb/cxusb.c        |    2 -
>  drivers/media/usb/dvb-usb/cxusb.h        |  106 ++
>  5 files changed, 1971 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/media/usb/dvb-usb/cxusb-analog.c
> 
> diff --git a/drivers/media/usb/dvb-usb/Kconfig b/drivers/media/usb/dvb-usb/Kconfig
> index 513df955eaa3..8af8b920d7e4 100644
> --- a/drivers/media/usb/dvb-usb/Kconfig
> +++ b/drivers/media/usb/dvb-usb/Kconfig
> @@ -138,12 +138,24 @@ config DVB_USB_CXUSB
>  	select MEDIA_TUNER_SI2157 if MEDIA_SUBDRV_AUTOSELECT
>  	help
>  	  Say Y here to support the Conexant USB2.0 hybrid reference design.
> -	  Currently, only DVB and ATSC modes are supported, analog mode
> -	  shall be added in the future. Devices that require this module:
> +	  DVB and ATSC modes are supported, for a basic analog mode support
> +	  see the next option ("Analog support for the Conexant USB2.0 hybrid
> +	  reference design").
> +	  Devices that require this module:
>  
>  	  Medion MD95700 hybrid USB2.0 device.
>  	  DViCO FusionHDTV (Bluebird) USB2.0 devices
>  
> +config DVB_USB_CXUSB_ANALOG
> +	bool "Analog support for the Conexant USB2.0 hybrid reference design"
> +	depends on DVB_USB_CXUSB && VIDEO_V4L2
> +	select VIDEO_CX25840
> +	select VIDEOBUF2_VMALLOC
> +	help
> +	  Say Y here to enable basic analog mode support for the Conexant
> +	  USB2.0 hybrid reference design.
> +	  Currently this mode is supported only on a Medion MD95700 device.
> +
>  config DVB_USB_M920X
>  	tristate "Uli m920x DVB-T USB2.0 support"
>  	depends on DVB_USB
> diff --git a/drivers/media/usb/dvb-usb/Makefile b/drivers/media/usb/dvb-usb/Makefile
> index 407d90ca8be0..28e4806a87cd 100644
> --- a/drivers/media/usb/dvb-usb/Makefile
> +++ b/drivers/media/usb/dvb-usb/Makefile
> @@ -42,6 +42,9 @@ dvb-usb-digitv-objs := digitv.o
>  obj-$(CONFIG_DVB_USB_DIGITV) += dvb-usb-digitv.o
>  
>  dvb-usb-cxusb-objs := cxusb.o
> +ifeq ($(CONFIG_DVB_USB_CXUSB_ANALOG),y)
> +dvb-usb-cxusb-objs += cxusb-analog.o
> +endif
>  obj-$(CONFIG_DVB_USB_CXUSB) += dvb-usb-cxusb.o
>  
>  dvb-usb-ttusb2-objs := ttusb2.o
> diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
> new file mode 100644
> index 000000000000..90237869cea8
> --- /dev/null
> +++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
> @@ -0,0 +1,1848 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// DVB USB compliant linux driver for Conexant USB reference design -
> +// (analog part).
> +//
> +// Copyright (C) 2011, 2017, 2018
> +//	Maciej S. Szmigiero (mail@maciej.szmigiero.name)
> +//
> +// In case there are new analog / DVB-T hybrid devices released in the market
> +// using the same general design as Medion MD95700: a CX25840 video decoder
> +// outputting a BT.656 stream to a USB bridge chip which then forwards it to
> +// the host in isochronous USB packets this code should be made generic, with
> +// board specific bits implemented via separate card structures.
> +//
> +// This is, however, unlikely as the Medion model was released
> +// years ago (in 2005).
> +//
> +// TODO:
> +//  * audio support,
> +//  * finish radio support (requires audio of course),
> +//  * VBI support,
> +//  * controls support
> +
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/timekeeping.h>
> +#include <linux/vmalloc.h>
> +#include <media/drv-intf/cx25840.h>
> +#include <media/tuner.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#include "cxusb.h"
> +
> +static int cxusb_medion_v_queue_setup(struct vb2_queue *q,
> +				      unsigned int *num_buffers,
> +				      unsigned int *num_planes,
> +				      unsigned int sizes[],
> +				      struct device *alloc_devs[])
> +{
> +	struct dvb_usb_device *dvbdev = vb2_get_drv_priv(q);
> +	struct cxusb_medion_dev *cxdev = dvbdev->priv;
> +	unsigned int size = cxdev->width * cxdev->height * 2;
> +
> +	if (*num_planes > 0) {
> +		if (*num_planes != 1)
> +			return -EINVAL;
> +
> +		if (sizes[0] < size)
> +			return -EINVAL;
> +	} else {
> +		*num_planes = 1;
> +		sizes[0] = size;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cxusb_medion_v_buf_init(struct vb2_buffer *vb)
> +{
> +	struct dvb_usb_device *dvbdev = vb2_get_drv_priv(vb->vb2_queue);
> +	struct cxusb_medion_dev *cxdev = dvbdev->priv;
> +
> +	cxusb_vprintk(dvbdev, OPS, "buffer init\n");
> +
> +	if (vb2_plane_size(vb, 0) < cxdev->width * cxdev->height * 2)
> +		return -ENOMEM;
> +
> +	cxusb_vprintk(dvbdev, OPS, "buffer OK\n");
> +
> +	return 0;
> +}
> +
> +static void cxusb_auxbuf_init(struct dvb_usb_device *dvbdev,
> +			      struct cxusb_medion_auxbuf *auxbuf,
> +			      u8 *buf, unsigned int len)
> +{
> +	cxusb_vprintk(dvbdev, AUXB, "initializing auxbuf of len %u\n", len);
> +
> +	auxbuf->buf = buf;
> +	auxbuf->len = len;
> +	auxbuf->paylen = 0;
> +}
> +
> +static void cxusb_auxbuf_head_trim(struct dvb_usb_device *dvbdev,
> +				   struct cxusb_medion_auxbuf *auxbuf,
> +				   unsigned int pos)
> +{
> +	if (pos == 0)
> +		return;
> +
> +	if (WARN_ON(pos > auxbuf->paylen))
> +		return;
> +
> +	cxusb_vprintk(dvbdev, AUXB,
> +		      "trimming auxbuf len by %u to %u\n",
> +		      pos, auxbuf->paylen - pos);
> +
> +	memmove(auxbuf->buf, auxbuf->buf + pos, auxbuf->paylen - pos);
> +	auxbuf->paylen -= pos;
> +}
> +
> +static unsigned int cxusb_auxbuf_paylen(struct cxusb_medion_auxbuf *auxbuf)
> +{
> +	return auxbuf->paylen;
> +}
> +
> +static bool cxusb_auxbuf_make_space(struct dvb_usb_device *dvbdev,
> +				    struct cxusb_medion_auxbuf *auxbuf,
> +				    unsigned int howmuch)
> +{
> +	unsigned int freespace;
> +
> +	if (WARN_ON(howmuch >= auxbuf->len))
> +		howmuch = auxbuf->len - 1;
> +
> +	freespace = auxbuf->len - cxusb_auxbuf_paylen(auxbuf);
> +
> +	cxusb_vprintk(dvbdev, AUXB, "freespace is %u\n", freespace);
> +
> +	if (freespace >= howmuch)
> +		return true;
> +
> +	howmuch -= freespace;
> +
> +	cxusb_vprintk(dvbdev, AUXB, "will overwrite %u bytes of buffer\n",
> +		      howmuch);
> +
> +	cxusb_auxbuf_head_trim(dvbdev, auxbuf, howmuch);
> +
> +	return false;
> +}
> +
> +/* returns false if some data was overwritten */
> +static bool cxusb_auxbuf_append_urb(struct dvb_usb_device *dvbdev,
> +				    struct cxusb_medion_auxbuf *auxbuf,
> +				    struct urb *urb)
> +{
> +	unsigned long len;
> +	int i;
> +	bool ret;
> +
> +	for (i = 0, len = 0; i < urb->number_of_packets; i++)
> +		len += urb->iso_frame_desc[i].actual_length;
> +
> +	ret = cxusb_auxbuf_make_space(dvbdev, auxbuf, len);
> +
> +	for (i = 0; i < urb->number_of_packets; i++) {
> +		unsigned int to_copy;
> +
> +		to_copy = urb->iso_frame_desc[i].actual_length;
> +
> +		memcpy(auxbuf->buf + auxbuf->paylen, urb->transfer_buffer +
> +		       urb->iso_frame_desc[i].offset, to_copy);
> +
> +		auxbuf->paylen += to_copy;
> +	}
> +
> +	return ret;
> +}
> +
> +static bool cxusb_auxbuf_copy(struct cxusb_medion_auxbuf *auxbuf,
> +			      unsigned int pos, unsigned char *dest,
> +			      unsigned int len)
> +{
> +	if (pos + len > auxbuf->paylen)
> +		return false;
> +
> +	memcpy(dest, auxbuf->buf + pos, len);
> +
> +	return true;
> +}
> +
> +static bool cxusb_medion_cf_refc_fld_chg(struct dvb_usb_device *dvbdev,
> +					 struct cxusb_bt656_params *bt656,
> +					 bool firstfield,
> +					 unsigned int maxlines,
> +					 unsigned int maxlinesamples,
> +					 unsigned char buf[4])
> +{
> +	bool firstfield_code = (buf[3] & CXUSB_BT656_FIELD_MASK) ==
> +		CXUSB_BT656_FIELD_1;
> +	unsigned int remlines;
> +
> +	if (bt656->line == 0 || firstfield == firstfield_code)
> +		return false;
> +
> +	if (bt656->fmode == LINE_SAMPLES) {
> +		unsigned int remsamples = maxlinesamples -
> +			bt656->linesamples;
> +
> +		cxusb_vprintk(dvbdev, BT656,
> +			      "field %c after line %u field change\n",
> +			      firstfield ? '1' : '2', bt656->line);
> +
> +		if (bt656->buf != NULL && remsamples > 0) {
> +			memset(bt656->buf, 0, remsamples);
> +			bt656->buf += remsamples;
> +
> +			cxusb_vprintk(dvbdev, BT656,
> +				      "field %c line %u %u samples still remaining (of %u)\n",
> +				      firstfield ? '1' : '2',
> +				      bt656->line, remsamples,
> +				      maxlinesamples);
> +		}
> +
> +		bt656->line++;
> +	}
> +
> +	remlines = maxlines - bt656->line;
> +	if (bt656->buf != NULL && remlines > 0) {
> +		memset(bt656->buf, 0, remlines * maxlinesamples);
> +		bt656->buf += remlines * maxlinesamples;
> +
> +		cxusb_vprintk(dvbdev, BT656,
> +			      "field %c %u lines still remaining (of %u)\n",
> +			      firstfield ? '1' : '2', remlines,
> +			      maxlines);
> +	}
> +
> +	return true;
> +}
> +
> +static void cxusb_medion_cf_refc_start_sch(struct dvb_usb_device *dvbdev,
> +					   struct cxusb_bt656_params *bt656,
> +					   bool firstfield,
> +					   unsigned char buf[4])
> +{
> +	bool firstfield_code = (buf[3] & CXUSB_BT656_FIELD_MASK) ==
> +		CXUSB_BT656_FIELD_1;
> +	bool sav_code = (buf[3] & CXUSB_BT656_SEAV_MASK) ==
> +		CXUSB_BT656_SEAV_SAV;
> +	bool vbi_code = (buf[3] & CXUSB_BT656_VBI_MASK) ==
> +		CXUSB_BT656_VBI_ON;
> +
> +	if (!sav_code || firstfield != firstfield_code)
> +		return;
> +
> +	if (!vbi_code) {
> +		cxusb_vprintk(dvbdev, BT656, "line start @ pos %u\n",
> +			      bt656->pos);
> +
> +		bt656->linesamples = 0;
> +		bt656->fmode = LINE_SAMPLES;
> +	} else {
> +		cxusb_vprintk(dvbdev, BT656, "VBI start @ pos %u\n",
> +			      bt656->pos);
> +
> +		bt656->fmode = VBI_SAMPLES;
> +	}
> +}
> +
> +static void cxusb_medion_cf_refc_line_smpl(struct dvb_usb_device *dvbdev,
> +					   struct cxusb_bt656_params *bt656,
> +					   bool firstfield,
> +					   unsigned int maxlinesamples,
> +					   unsigned char buf[4])
> +{
> +	bool sav_code = (buf[3] & CXUSB_BT656_SEAV_MASK) ==
> +		CXUSB_BT656_SEAV_SAV;
> +	unsigned int remsamples;
> +
> +	if (sav_code)
> +		cxusb_vprintk(dvbdev, BT656,
> +			      "SAV in line samples @ line %u, pos %u\n",
> +			      bt656->line, bt656->pos);
> +
> +	remsamples = maxlinesamples - bt656->linesamples;
> +	if (bt656->buf != NULL && remsamples > 0) {
> +		memset(bt656->buf, 0, remsamples);
> +		bt656->buf += remsamples;
> +
> +		cxusb_vprintk(dvbdev, BT656,
> +			      "field %c line %u %u samples still remaining (of %u)\n",
> +			      firstfield ? '1' : '2', bt656->line, remsamples,
> +			      maxlinesamples);
> +	}
> +
> +	bt656->fmode = START_SEARCH;
> +	bt656->line++;
> +}
> +
> +static void cxusb_medion_cf_refc_vbi_smpl(struct dvb_usb_device *dvbdev,
> +					  struct cxusb_bt656_params *bt656,
> +					  unsigned char buf[4])
> +{
> +	bool sav_code = (buf[3] & CXUSB_BT656_SEAV_MASK) ==
> +		CXUSB_BT656_SEAV_SAV;
> +
> +	if (sav_code)
> +		cxusb_vprintk(dvbdev, BT656, "SAV in VBI samples @ pos %u\n",
> +			      bt656->pos);
> +
> +	bt656->fmode = START_SEARCH;
> +}
> +
> +/* returns whether the whole 4-byte code should be skipped in the buffer */
> +static bool cxusb_medion_cf_ref_code(struct dvb_usb_device *dvbdev,
> +				     struct cxusb_bt656_params *bt656,
> +				     bool firstfield,
> +				     unsigned int maxlines,
> +				     unsigned int maxlinesamples,
> +				     unsigned char buf[4])
> +{
> +	if (bt656->fmode == START_SEARCH)
> +		cxusb_medion_cf_refc_start_sch(dvbdev, bt656, firstfield, buf);
> +	else if (bt656->fmode == LINE_SAMPLES) {
> +		cxusb_medion_cf_refc_line_smpl(dvbdev, bt656, firstfield,
> +					       maxlinesamples, buf);
> +		return false;
> +	} else if (bt656->fmode == VBI_SAMPLES) {
> +		cxusb_medion_cf_refc_vbi_smpl(dvbdev, bt656, buf);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static bool cxusb_medion_cs_start_sch(struct dvb_usb_device *dvbdev,
> +				      struct cxusb_medion_auxbuf *auxbuf,
> +				      struct cxusb_bt656_params *bt656,
> +				      unsigned int maxlinesamples)
> +{
> +	unsigned char buf[64];
> +	unsigned int idx;
> +	unsigned int tocheck = clamp_t(size_t, maxlinesamples / 4, 3,
> +				       sizeof(buf));
> +
> +	if (!cxusb_auxbuf_copy(auxbuf, bt656->pos + 1, buf, tocheck))
> +		return false;
> +
> +	for (idx = 0; idx <= tocheck - 3; idx++)
> +		if (memcmp(buf + idx, CXUSB_BT656_PREAMBLE, 3) == 0) {
> +			bt656->pos += (1 + idx);
> +			return true;
> +		}
> +
> +	cxusb_vprintk(dvbdev, BT656, "line %u early start, pos %u\n",
> +		      bt656->line, bt656->pos);
> +
> +	bt656->linesamples = 0;
> +	bt656->fmode = LINE_SAMPLES;
> +
> +	return true;
> +}
> +
> +static void cxusb_medion_cs_line_smpl(struct cxusb_bt656_params *bt656,
> +				      unsigned int maxlinesamples,
> +				      unsigned char val)
> +{
> +	if (bt656->buf != NULL)
> +		*(bt656->buf++) = val;
> +
> +	bt656->linesamples++;
> +	bt656->pos++;
> +
> +	if (bt656->linesamples >= maxlinesamples) {
> +		bt656->fmode = START_SEARCH;
> +		bt656->line++;
> +	}
> +}
> +
> +static bool cxusb_medion_copy_samples(struct dvb_usb_device *dvbdev,
> +				      struct cxusb_medion_auxbuf *auxbuf,
> +				      struct cxusb_bt656_params *bt656,
> +				      unsigned int maxlinesamples,
> +				      unsigned char val)
> +{
> +	if (bt656->fmode == START_SEARCH && bt656->line > 0)
> +		return cxusb_medion_cs_start_sch(dvbdev, auxbuf, bt656,
> +						 maxlinesamples);
> +	else if (bt656->fmode == LINE_SAMPLES)
> +		cxusb_medion_cs_line_smpl(bt656, maxlinesamples, val);
> +	else /* TODO: copy VBI samples */
> +		bt656->pos++;
> +
> +	return true;
> +}
> +
> +static bool cxusb_medion_copy_field(struct dvb_usb_device *dvbdev,
> +				    struct cxusb_medion_auxbuf *auxbuf,
> +				    struct cxusb_bt656_params *bt656,
> +				    bool firstfield,
> +				    unsigned int maxlines,
> +				    unsigned int maxlinesmpls)
> +{
> +	while (bt656->line < maxlines) {
> +		unsigned char val;
> +
> +		if (!cxusb_auxbuf_copy(auxbuf, bt656->pos, &val, 1))
> +			break;
> +
> +		if (val == CXUSB_BT656_PREAMBLE[0]) {
> +			unsigned char buf[4];
> +
> +			buf[0] = val;
> +			if (!cxusb_auxbuf_copy(auxbuf, bt656->pos + 1,
> +					       buf + 1, 3))
> +				break;
> +
> +			if (buf[1] == CXUSB_BT656_PREAMBLE[1] &&
> +			    buf[2] == CXUSB_BT656_PREAMBLE[2]) {
> +				/*
> +				 * is this a field change?
> +				 * if so, terminate copying the current field
> +				 */
> +				if (cxusb_medion_cf_refc_fld_chg(dvbdev,
> +								 bt656,
> +								 firstfield,
> +								 maxlines,
> +								 maxlinesmpls,
> +								 buf))
> +					return true;
> +
> +				if (cxusb_medion_cf_ref_code(dvbdev, bt656,
> +							     firstfield,
> +							     maxlines,
> +							     maxlinesmpls,
> +							     buf))
> +					bt656->pos += 4;
> +
> +				continue;
> +			}
> +		}
> +
> +		if (!cxusb_medion_copy_samples(dvbdev, auxbuf, bt656,
> +					       maxlinesmpls, val))
> +			break;
> +	}
> +
> +	if (bt656->line < maxlines) {
> +		cxusb_vprintk(dvbdev, BT656,
> +			      "end of buffer pos = %u, line = %u\n",
> +			      bt656->pos, bt656->line);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static bool cxusb_medion_v_process_auxbuf(struct cxusb_medion_dev *cxdev,
> +					  bool reset)
> +{
> +	struct dvb_usb_device *dvbdev = cxdev->dvbdev;
> +	struct cxusb_bt656_params *bt656 = &cxdev->bt656;
> +
> +	/*
> +	 * if this is a new frame
> +	 * fetch a buffer from list
> +	 */
> +	if (bt656->mode == NEW_FRAME) {
> +		if (!list_empty(&cxdev->buflist)) {
> +			cxdev->vbuf =
> +				list_first_entry(&cxdev->buflist,
> +						 struct cxusb_medion_vbuffer,
> +						 list);
> +			list_del(&cxdev->vbuf->list);
> +		} else
> +			dev_warn(&dvbdev->udev->dev, "no free buffers\n");
> +	}
> +
> +	if (bt656->mode == NEW_FRAME || reset) {
> +		cxusb_vprintk(dvbdev, URB, "will copy field 1\n");
> +		bt656->pos = 0;
> +		bt656->mode = FIRST_FIELD;
> +		bt656->fmode = START_SEARCH;
> +		bt656->line = 0;
> +
> +		if (cxdev->vbuf != NULL) {
> +			cxdev->vbuf->vb2.vb2_buf.timestamp = ktime_get_ns();
> +			bt656->buf = vb2_plane_vaddr(&cxdev->vbuf->vb2.vb2_buf,
> +						     0);
> +		}
> +	}
> +
> +	/* cxusb_vprintk(dvbdev, URB, "auxbuf payload len %u",
> +		      cxusb_auxbuf_paylen(&cxdev->auxbuf)); */
> +
> +	if (bt656->mode == FIRST_FIELD) {
> +		if (!cxusb_medion_copy_field(dvbdev, &cxdev->auxbuf, bt656,
> +					     true, cxdev->height / 2,
> +					     cxdev->width * 2))
> +			return false;
> +
> +		/*
> +		 * do not trim buffer there in case
> +		 * we need to reset the search later
> +		 */
> +
> +		cxusb_vprintk(dvbdev, URB, "will copy field 2\n");
> +		bt656->mode = SECOND_FIELD;
> +		bt656->fmode = START_SEARCH;
> +		bt656->line = 0;
> +	}
> +
> +	if (bt656->mode == SECOND_FIELD) {
> +		if (!cxusb_medion_copy_field(dvbdev, &cxdev->auxbuf, bt656,
> +					     false, cxdev->height / 2,
> +					     cxdev->width * 2))
> +			return false;
> +
> +		cxusb_auxbuf_head_trim(dvbdev, &cxdev->auxbuf, bt656->pos);
> +
> +		bt656->mode = NEW_FRAME;
> +
> +		if (cxdev->vbuf != NULL) {
> +			vb2_set_plane_payload(&cxdev->vbuf->vb2.vb2_buf, 0,
> +					      cxdev->width * cxdev->height * 2);
> +
> +			cxdev->vbuf->vb2.field = cxdev->field_order;
> +			cxdev->vbuf->vb2.sequence = cxdev->vbuf_sequence++;
> +
> +			vb2_buffer_done(&cxdev->vbuf->vb2.vb2_buf,
> +					VB2_BUF_STATE_DONE);
> +
> +			cxdev->vbuf = NULL;
> +			cxdev->bt656.buf = NULL;
> +
> +			cxusb_vprintk(dvbdev, URB, "frame done\n");
> +		} else {
> +			cxusb_vprintk(dvbdev, URB, "frame skipped\n");
> +			cxdev->vbuf_sequence++;
> +		}
> +	}
> +
> +	return true;
> +}
> +
> +static bool cxusb_medion_v_complete_handle_urb(struct cxusb_medion_dev *cxdev,
> +					       bool *auxbuf_reset)
> +{
> +	struct dvb_usb_device *dvbdev = cxdev->dvbdev;
> +	unsigned int urbn;
> +	struct urb *urb;
> +	int ret;
> +
> +	*auxbuf_reset = false;
> +
> +	urbn = cxdev->nexturb;
> +	if (!test_bit(urbn, &cxdev->urbcomplete))
> +		return false;
> +
> +	clear_bit(urbn, &cxdev->urbcomplete);
> +
> +	do {
> +		cxdev->nexturb++;
> +		cxdev->nexturb %= CXUSB_VIDEO_URBS;
> +		urb = cxdev->streamurbs[cxdev->nexturb];
> +	} while (urb == NULL);
> +
> +	urb = cxdev->streamurbs[urbn];
> +	cxusb_vprintk(dvbdev, URB, "URB %u status = %d\n", urbn, urb->status);
> +
> +	if (urb->status == 0 || urb->status == -EXDEV) {
> +		int i;
> +		unsigned long len;
> +
> +		for (i = 0, len = 0; i < urb->number_of_packets; i++)
> +			len += urb->iso_frame_desc[i].actual_length;
> +
> +		cxusb_vprintk(dvbdev, URB, "URB %u data len = %lu\n", urbn,
> +			      len);
> +
> +		if (len > 0) {
> +			cxusb_vprintk(dvbdev, URB, "appending URB\n");
> +
> +			/*
> +			 * append new data to auxbuf while
> +			 * overwriting old data if necessary
> +			 *
> +			 * if any overwrite happens then we can no
> +			 * longer rely on consistency of the whole
> +			 * data so let's start again the current
> +			 * auxbuf frame assembling process from
> +			 * the beginning
> +			 */
> +			*auxbuf_reset =
> +				!cxusb_auxbuf_append_urb(dvbdev,
> +							 &cxdev->auxbuf,
> +							 urb);
> +		}
> +	}
> +
> +	cxusb_vprintk(dvbdev, URB, "URB %u resubmit\n", urbn);
> +
> +	ret = usb_submit_urb(urb, GFP_KERNEL);
> +	if (ret != 0)
> +		dev_err(&dvbdev->udev->dev,
> +			"unable to resubmit URB %u (%d), you'll have to restart streaming\n",
> +			urbn, ret);
> +
> +	/* next URB is complete already? reschedule us then to handle it */
> +	return test_bit(cxdev->nexturb, &cxdev->urbcomplete);
> +}
> +
> +static void cxusb_medion_v_complete_work(struct work_struct *work)
> +{
> +	struct cxusb_medion_dev *cxdev = container_of(work,
> +						      struct cxusb_medion_dev,
> +						      urbwork);
> +	struct dvb_usb_device *dvbdev = cxdev->dvbdev;
> +	bool auxbuf_reset;
> +	bool reschedule;
> +
> +	mutex_lock(cxdev->videodev->lock);
> +
> +	cxusb_vprintk(dvbdev, URB, "worker called, stop_streaming = %d\n",
> +		      (int)cxdev->stop_streaming);
> +
> +	if (cxdev->stop_streaming)
> +		goto unlock;
> +
> +	reschedule = cxusb_medion_v_complete_handle_urb(cxdev, &auxbuf_reset);
> +
> +	if (cxusb_medion_v_process_auxbuf(cxdev, auxbuf_reset))
> +		/* reschedule us until auxbuf no longer can produce any frame */
> +		reschedule = true;
> +
> +	if (reschedule) {
> +		cxusb_vprintk(dvbdev, URB, "rescheduling worker\n");
> +		schedule_work(&cxdev->urbwork);
> +	}
> +
> +unlock:
> +	mutex_unlock(cxdev->videodev->lock);
> +}
> +
> +static void cxusb_medion_v_complete(struct urb *u)
> +{
> +	struct dvb_usb_device *dvbdev = u->context;
> +	struct cxusb_medion_dev *cxdev = dvbdev->priv;
> +	unsigned int i;
> +
> +	for (i = 0; i < CXUSB_VIDEO_URBS; i++)
> +		if (cxdev->streamurbs[i] == u)
> +			break;
> +
> +	if (i >= CXUSB_VIDEO_URBS) {
> +		dev_err(&dvbdev->udev->dev,
> +			"complete on unknown URB\n");
> +		return;
> +	}
> +
> +	cxusb_vprintk(dvbdev, URB, "URB %u complete\n", i);
> +
> +	set_bit(i, &cxdev->urbcomplete);
> +	schedule_work(&cxdev->urbwork);
> +}
> +
> +static void cxusb_medion_urbs_free(struct cxusb_medion_dev *cxdev)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < CXUSB_VIDEO_URBS; i++)
> +		if (cxdev->streamurbs[i] != NULL) {
> +			kfree(cxdev->streamurbs[i]->transfer_buffer);
> +			usb_free_urb(cxdev->streamurbs[i]);
> +			cxdev->streamurbs[i] = NULL;
> +		}
> +}
> +
> +static void cxusb_medion_return_buffers(struct cxusb_medion_dev *cxdev,
> +					bool requeue)
> +{
> +	struct cxusb_medion_vbuffer *vbuf, *vbuf_tmp;
> +
> +	list_for_each_entry_safe(vbuf, vbuf_tmp, &cxdev->buflist,
> +				 list) {
> +		list_del(&vbuf->list);
> +		vb2_buffer_done(&vbuf->vb2.vb2_buf,
> +				requeue ? VB2_BUF_STATE_QUEUED :
> +				VB2_BUF_STATE_ERROR);
> +	}
> +
> +	if (cxdev->vbuf != NULL) {
> +		vb2_buffer_done(&cxdev->vbuf->vb2.vb2_buf,
> +				requeue ? VB2_BUF_STATE_QUEUED :
> +				VB2_BUF_STATE_ERROR);
> +
> +		cxdev->vbuf = NULL;
> +		cxdev->bt656.buf = NULL;
> +	}
> +}
> +
> +static int cxusb_medion_v_ss_auxbuf_alloc(struct cxusb_medion_dev *cxdev,
> +					  int *npackets)
> +{
> +	struct dvb_usb_device *dvbdev = cxdev->dvbdev;
> +	u8 *buf;
> +	unsigned int framelen, urblen, auxbuflen;
> +
> +	framelen = (cxdev->width * 2 + 4 + 4) *
> +		(cxdev->height + 50 /* VBI lines */);
> +
> +	/*
> +	 * try to fit a whole frame into each URB, as long as doing so
> +	 * does not require very high order memory allocations
> +	 */
> +	BUILD_BUG_ON(CXUSB_VIDEO_URB_MAX_SIZE / CXUSB_VIDEO_PKT_SIZE >
> +		     CXUSB_VIDEO_MAX_FRAME_PKTS);
> +	*npackets = min_t(int, (framelen + CXUSB_VIDEO_PKT_SIZE - 1) /
> +			  CXUSB_VIDEO_PKT_SIZE,
> +			  CXUSB_VIDEO_URB_MAX_SIZE / CXUSB_VIDEO_PKT_SIZE);
> +	urblen = *npackets * CXUSB_VIDEO_PKT_SIZE;
> +
> +	cxusb_vprintk(dvbdev, URB,
> +		      "each URB will have %d packets for total of %u bytes (%u x %u @ %u)\n",
> +		      *npackets, urblen, (unsigned int)cxdev->width,
> +		      (unsigned int)cxdev->height, framelen);
> +
> +	auxbuflen = framelen + urblen;
> +
> +	buf = vmalloc(auxbuflen);
> +	if (buf == NULL)
> +		return -ENOMEM;
> +
> +	cxusb_auxbuf_init(dvbdev, &cxdev->auxbuf, buf, auxbuflen);
> +
> +	return 0;
> +}
> +
> +static u32 cxusb_medion_norm2field_order(v4l2_std_id norm)
> +{
> +	bool is625 = norm & V4L2_STD_625_50;
> +	bool is525 = norm & V4L2_STD_525_60;
> +
> +	if (!is625 && !is525)
> +		return V4L2_FIELD_NONE;
> +
> +	if (is625 && is525)
> +		return V4L2_FIELD_NONE;
> +
> +	if (is625)
> +		return V4L2_FIELD_SEQ_TB;
> +	else /* is525 */
> +		return V4L2_FIELD_SEQ_BT;
> +}
> +
> +static u32 cxusb_medion_field_order(struct cxusb_medion_dev *cxdev)
> +{
> +	struct dvb_usb_device *dvbdev = cxdev->dvbdev;
> +	u32 field;
> +	int ret;
> +	v4l2_std_id norm;
> +
> +	/* TV tuner is PAL-only so it is always TB */
> +	if (cxdev->input == 0)
> +		return V4L2_FIELD_SEQ_TB;
> +
> +	field = cxusb_medion_norm2field_order(cxdev->norm);
> +	if (field != V4L2_FIELD_NONE)
> +		return field;
> +
> +	ret = v4l2_subdev_call(cxdev->cx25840, video, querystd, &norm);

Use g_std instead of querystd (see also my comment in patch 2/7). The field
order depends on the currently set standard, not on the detected standard.

Regards,

	Hans
