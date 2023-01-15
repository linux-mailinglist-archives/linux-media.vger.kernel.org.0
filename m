Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6653966B421
	for <lists+linux-media@lfdr.de>; Sun, 15 Jan 2023 22:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbjAOVUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 16:20:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbjAOVUv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 16:20:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321AA12854
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 13:20:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7399D308;
        Sun, 15 Jan 2023 22:20:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673817648;
        bh=3oAsMzQhJny96P93YVmjBp2eXVfKUQUiPEntYFZ5/Xw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f3MSBL43tTtIwUpL13StbeaVnlxg41hPDTCFPz4u4IFqEtJOpcY9HXLtFktjgqFaO
         ClB3SrGkecWDNXF3/18m9+EEYjkG9rFt5hHJrWexAUmpqQrdiS/tv7jCiOgZZCOCZe
         s3UUT3JsUM7UNz5iQY0672XSnQqXkK1JVSk9Wepo=
Date:   Sun, 15 Jan 2023 23:20:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Ricardo Ribalda <ribalda@chromium.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-media@vger.kernel.org
Subject: Re: [pinchartl:next/media/uvc 1/27]
 drivers/media/usb/uvc/uvc_driver.c:324:31: warning: suggest parentheses
 around comparison in operand of '&'
Message-ID: <Y8RuMHsTAV1FhxtJ@pendragon.ideasonboard.com>
References: <202301160029.7eCIuqB7-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202301160029.7eCIuqB7-lkp@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 16, 2023 at 12:50:57AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git next/media/uvc
> head:   fd957081cff04668f390c6f290bdcc7fc009a0f1
> commit: b5fd00fb8e898f36370bb019f602f49a71c58c1e [1/27] media: uvcvideo: Remove format descriptions
> config: m68k-allmodconfig
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/commit/?id=b5fd00fb8e898f36370bb019f602f49a71c58c1e
>         git remote add pinchartl https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git
>         git fetch --no-tags pinchartl next/media/uvc
>         git checkout b5fd00fb8e898f36370bb019f602f49a71c58c1e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/media/usb/uvc/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/media/usb/uvc/uvc_driver.c: In function 'uvc_parse_format':
> >> drivers/media/usb/uvc/uvc_driver.c:324:31: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
>      324 |                 if (buffer[8] & 0x7f > 2) {
>          |                               ^

I'll fix this and resubmit the pull request.

> vim +324 drivers/media/usb/uvc/uvc_driver.c
> 
>    216	
>    217	/* ------------------------------------------------------------------------
>    218	 * Descriptors parsing
>    219	 */
>    220	
>    221	static int uvc_parse_format(struct uvc_device *dev,
>    222		struct uvc_streaming *streaming, struct uvc_format *format,
>    223		u32 **intervals, unsigned char *buffer, int buflen)
>    224	{
>    225		struct usb_interface *intf = streaming->intf;
>    226		struct usb_host_interface *alts = intf->cur_altsetting;
>    227		struct uvc_format_desc *fmtdesc;
>    228		struct uvc_frame *frame;
>    229		const unsigned char *start = buffer;
>    230		unsigned int width_multiplier = 1;
>    231		unsigned int interval;
>    232		unsigned int i, n;
>    233		u8 ftype;
>    234	
>    235		format->type = buffer[2];
>    236		format->index = buffer[3];
>    237	
>    238		switch (buffer[2]) {
>    239		case UVC_VS_FORMAT_UNCOMPRESSED:
>    240		case UVC_VS_FORMAT_FRAME_BASED:
>    241			n = buffer[2] == UVC_VS_FORMAT_UNCOMPRESSED ? 27 : 28;
>    242			if (buflen < n) {
>    243				uvc_dbg(dev, DESCR,
>    244					"device %d videostreaming interface %d FORMAT error\n",
>    245					dev->udev->devnum,
>    246					alts->desc.bInterfaceNumber);
>    247				return -EINVAL;
>    248			}
>    249	
>    250			/* Find the format descriptor from its GUID. */
>    251			fmtdesc = uvc_format_by_guid(&buffer[5]);
>    252	
>    253			if (fmtdesc != NULL) {
>    254				format->fcc = fmtdesc->fcc;
>    255			} else {
>    256				dev_info(&streaming->intf->dev,
>    257					 "Unknown video format %pUl\n", &buffer[5]);
>    258				format->fcc = 0;
>    259			}
>    260	
>    261			format->bpp = buffer[21];
>    262	
>    263			/*
>    264			 * Some devices report a format that doesn't match what they
>    265			 * really send.
>    266			 */
>    267			if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
>    268				if (format->fcc == V4L2_PIX_FMT_YUYV) {
>    269					format->fcc = V4L2_PIX_FMT_GREY;
>    270					format->bpp = 8;
>    271					width_multiplier = 2;
>    272				}
>    273			}
>    274	
>    275			/* Some devices report bpp that doesn't match the format. */
>    276			if (dev->quirks & UVC_QUIRK_FORCE_BPP) {
>    277				const struct v4l2_format_info *info =
>    278					v4l2_format_info(format->fcc);
>    279	
>    280				if (info) {
>    281					unsigned int div = info->hdiv * info->vdiv;
>    282	
>    283					n = info->bpp[0] * div;
>    284					for (i = 1; i < info->comp_planes; i++)
>    285						n += info->bpp[i];
>    286	
>    287					format->bpp = DIV_ROUND_UP(8 * n, div);
>    288				}
>    289			}
>    290	
>    291			if (buffer[2] == UVC_VS_FORMAT_UNCOMPRESSED) {
>    292				ftype = UVC_VS_FRAME_UNCOMPRESSED;
>    293			} else {
>    294				ftype = UVC_VS_FRAME_FRAME_BASED;
>    295				if (buffer[27])
>    296					format->flags = UVC_FMT_FLAG_COMPRESSED;
>    297			}
>    298			break;
>    299	
>    300		case UVC_VS_FORMAT_MJPEG:
>    301			if (buflen < 11) {
>    302				uvc_dbg(dev, DESCR,
>    303					"device %d videostreaming interface %d FORMAT error\n",
>    304					dev->udev->devnum,
>    305					alts->desc.bInterfaceNumber);
>    306				return -EINVAL;
>    307			}
>    308	
>    309			format->fcc = V4L2_PIX_FMT_MJPEG;
>    310			format->flags = UVC_FMT_FLAG_COMPRESSED;
>    311			format->bpp = 0;
>    312			ftype = UVC_VS_FRAME_MJPEG;
>    313			break;
>    314	
>    315		case UVC_VS_FORMAT_DV:
>    316			if (buflen < 9) {
>    317				uvc_dbg(dev, DESCR,
>    318					"device %d videostreaming interface %d FORMAT error\n",
>    319					dev->udev->devnum,
>    320					alts->desc.bInterfaceNumber);
>    321				return -EINVAL;
>    322			}
>    323	
>  > 324			if (buffer[8] & 0x7f > 2) {
>    325				uvc_dbg(dev, DESCR,
>    326					"device %d videostreaming interface %d: unknown DV format %u\n",
>    327					dev->udev->devnum,
>    328					alts->desc.bInterfaceNumber, buffer[8]);
>    329				return -EINVAL;
>    330			}
>    331	
>    332			format->fcc = V4L2_PIX_FMT_DV;
>    333			format->flags = UVC_FMT_FLAG_COMPRESSED | UVC_FMT_FLAG_STREAM;
>    334			format->bpp = 0;
>    335			ftype = 0;
>    336	
>    337			/* Create a dummy frame descriptor. */
>    338			frame = &format->frame[0];
>    339			memset(&format->frame[0], 0, sizeof(format->frame[0]));
>    340			frame->bFrameIntervalType = 1;
>    341			frame->dwDefaultFrameInterval = 1;
>    342			frame->dwFrameInterval = *intervals;
>    343			*(*intervals)++ = 1;
>    344			format->nframes = 1;
>    345			break;
>    346	
>    347		case UVC_VS_FORMAT_MPEG2TS:
>    348		case UVC_VS_FORMAT_STREAM_BASED:
>    349			/* Not supported yet. */
>    350		default:
>    351			uvc_dbg(dev, DESCR,
>    352				"device %d videostreaming interface %d unsupported format %u\n",
>    353				dev->udev->devnum, alts->desc.bInterfaceNumber,
>    354				buffer[2]);
>    355			return -EINVAL;
>    356		}
>    357	
>    358		uvc_dbg(dev, DESCR, "Found format %p4cc", &format->fcc);
>    359	
>    360		buflen -= buffer[0];
>    361		buffer += buffer[0];
>    362	
>    363		/*
>    364		 * Parse the frame descriptors. Only uncompressed, MJPEG and frame
>    365		 * based formats have frame descriptors.
>    366		 */
>    367		while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
>    368		       buffer[2] == ftype) {
>    369			frame = &format->frame[format->nframes];
>    370			if (ftype != UVC_VS_FRAME_FRAME_BASED)
>    371				n = buflen > 25 ? buffer[25] : 0;
>    372			else
>    373				n = buflen > 21 ? buffer[21] : 0;
>    374	
>    375			n = n ? n : 3;
>    376	
>    377			if (buflen < 26 + 4*n) {
>    378				uvc_dbg(dev, DESCR,
>    379					"device %d videostreaming interface %d FRAME error\n",
>    380					dev->udev->devnum,
>    381					alts->desc.bInterfaceNumber);
>    382				return -EINVAL;
>    383			}
>    384	
>    385			frame->bFrameIndex = buffer[3];
>    386			frame->bmCapabilities = buffer[4];
>    387			frame->wWidth = get_unaligned_le16(&buffer[5])
>    388				      * width_multiplier;
>    389			frame->wHeight = get_unaligned_le16(&buffer[7]);
>    390			frame->dwMinBitRate = get_unaligned_le32(&buffer[9]);
>    391			frame->dwMaxBitRate = get_unaligned_le32(&buffer[13]);
>    392			if (ftype != UVC_VS_FRAME_FRAME_BASED) {
>    393				frame->dwMaxVideoFrameBufferSize =
>    394					get_unaligned_le32(&buffer[17]);
>    395				frame->dwDefaultFrameInterval =
>    396					get_unaligned_le32(&buffer[21]);
>    397				frame->bFrameIntervalType = buffer[25];
>    398			} else {
>    399				frame->dwMaxVideoFrameBufferSize = 0;
>    400				frame->dwDefaultFrameInterval =
>    401					get_unaligned_le32(&buffer[17]);
>    402				frame->bFrameIntervalType = buffer[21];
>    403			}
>    404			frame->dwFrameInterval = *intervals;
>    405	
>    406			/*
>    407			 * Several UVC chipsets screw up dwMaxVideoFrameBufferSize
>    408			 * completely. Observed behaviours range from setting the
>    409			 * value to 1.1x the actual frame size to hardwiring the
>    410			 * 16 low bits to 0. This results in a higher than necessary
>    411			 * memory usage as well as a wrong image size information. For
>    412			 * uncompressed formats this can be fixed by computing the
>    413			 * value from the frame size.
>    414			 */
>    415			if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
>    416				frame->dwMaxVideoFrameBufferSize = format->bpp
>    417					* frame->wWidth * frame->wHeight / 8;
>    418	
>    419			/*
>    420			 * Some bogus devices report dwMinFrameInterval equal to
>    421			 * dwMaxFrameInterval and have dwFrameIntervalStep set to
>    422			 * zero. Setting all null intervals to 1 fixes the problem and
>    423			 * some other divisions by zero that could happen.
>    424			 */
>    425			for (i = 0; i < n; ++i) {
>    426				interval = get_unaligned_le32(&buffer[26+4*i]);
>    427				*(*intervals)++ = interval ? interval : 1;
>    428			}
>    429	
>    430			/*
>    431			 * Make sure that the default frame interval stays between
>    432			 * the boundaries.
>    433			 */
>    434			n -= frame->bFrameIntervalType ? 1 : 2;
>    435			frame->dwDefaultFrameInterval =
>    436				min(frame->dwFrameInterval[n],
>    437				    max(frame->dwFrameInterval[0],
>    438					frame->dwDefaultFrameInterval));
>    439	
>    440			if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
>    441				frame->bFrameIntervalType = 1;
>    442				frame->dwFrameInterval[0] =
>    443					frame->dwDefaultFrameInterval;
>    444			}
>    445	
>    446			uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
>    447				frame->wWidth, frame->wHeight,
>    448				10000000 / frame->dwDefaultFrameInterval,
>    449				(100000000 / frame->dwDefaultFrameInterval) % 10);
>    450	
>    451			format->nframes++;
>    452			buflen -= buffer[0];
>    453			buffer += buffer[0];
>    454		}
>    455	
>    456		if (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
>    457		    buffer[2] == UVC_VS_STILL_IMAGE_FRAME) {
>    458			buflen -= buffer[0];
>    459			buffer += buffer[0];
>    460		}
>    461	
>    462		if (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
>    463		    buffer[2] == UVC_VS_COLORFORMAT) {
>    464			if (buflen < 6) {
>    465				uvc_dbg(dev, DESCR,
>    466					"device %d videostreaming interface %d COLORFORMAT error\n",
>    467					dev->udev->devnum,
>    468					alts->desc.bInterfaceNumber);
>    469				return -EINVAL;
>    470			}
>    471	
>    472			format->colorspace = uvc_colorspace(buffer[3]);
>    473			format->xfer_func = uvc_xfer_func(buffer[4]);
>    474			format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
>    475	
>    476			buflen -= buffer[0];
>    477			buffer += buffer[0];
>    478		} else {
>    479			format->colorspace = V4L2_COLORSPACE_SRGB;
>    480		}
>    481	
>    482		return buffer - start;
>    483	}
>    484	

-- 
Regards,

Laurent Pinchart
