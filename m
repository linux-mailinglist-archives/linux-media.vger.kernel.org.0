Return-Path: <linux-media+bounces-10276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D888B4855
	for <lists+linux-media@lfdr.de>; Sat, 27 Apr 2024 23:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 273901C20A08
	for <lists+linux-media@lfdr.de>; Sat, 27 Apr 2024 21:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C56145FE2;
	Sat, 27 Apr 2024 21:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a1TvuWsd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856284E1BE
	for <linux-media@vger.kernel.org>; Sat, 27 Apr 2024 21:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714253133; cv=none; b=uxYKdLsfTgnkhkG9nLwC3tMALqenkfe/plriz+JTIUQdV0vmQnVsYfnScER/cYOAVuqrosp9aEytW8hMZW63EQoCoXf7rYo9CbLvD0t79CD6PeDiDPeLIdCQ0FFloUWAFCZsfGDiT40kKE9bmxjHIOgsnsrZDy9OvMQiMF/mIl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714253133; c=relaxed/simple;
	bh=0votM+ffxZeGB42zgZOKZHcqrfnCb2jtYSGZ1SUH7kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dd/rOF1fgJJfxQQIaEq74CnwgoOUVFq+R69DasueugA4YDf8JCHafxIbXIgqzUZNHqk1xGJ+/I3o8BacgcSyOPSv/OzX17CySld74plfF7GN8H69qKViQ72nA2X2xnbxfkIOEisK+8AFV9XNtZvABvznvKD7AODz8BBCxR3WHUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a1TvuWsd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58E19842;
	Sat, 27 Apr 2024 23:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714253075;
	bh=0votM+ffxZeGB42zgZOKZHcqrfnCb2jtYSGZ1SUH7kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a1TvuWsduK0QB4pE+i2DoMp8SxyY9GQfKMnz6MER3GNyuQYDbcEzVUcsgCuzPdZFO
	 sshGtrycfAJ5Dt0JXPwSwJ7AIHkPKX09IxPSfvqqME0wkWQUxb9RXJm8yZaND+cSu2
	 x453MT6FJJqyGJfKoxgqrWxkGqWMTSDcHtPvmlYw=
Date: Sun, 28 Apr 2024 00:25:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
	mchehab@kernel.org
Subject: Re: [GIT PULL v3 FOR 6.10] Unicam and IPU6 ISYS drivers
Message-ID: <20240427212522.GA9130@pendragon.ideasonboard.com>
References: <ZivusZfL8cC6HPum@valkosipuli.retiisi.eu>
 <34c04786-6310-4ee2-ad05-ffee82867b0a@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34c04786-6310-4ee2-ad05-ffee82867b0a@xs4all.nl>

Hi Hans,

On Sat, Apr 27, 2024 at 05:26:18PM +0200, Hans Verkuil wrote:
> On 26/04/2024 20:13, Sakari Ailus wrote:
> > Hi Hans, Mauro,
> > 
> > Here are drivers for Unicam and IPU6 ISYS, prepended by the first part of
> > the metadata series. Both drivers can be used without the ROUTING IOCTL
> > with partial functionality. The ROUTING IOCTL enablement patch will enable
> > the rest of the functionality when it is merged later on.
> 
> Running this PR through my build scripts produces these smatch warnings (one
> for bcm2835-unicam, 6 for IPU6):
> 
> drivers/media/platform/broadcom/bcm2835-unicam.c:2547 unicam_async_nf_init() warn: missing error code 'ret'

Darn, I've missed that one. The fix is on the list.

> drivers/media/pci/intel/ipu6/ipu6-dma.c:67 __dma_alloc_buffer() warn: use 'gfp' here instead of GFP_KERNEL?
> drivers/media/pci/intel/ipu6/ipu6-dma.c:164 ipu6_dma_alloc() warn: use 'gfp' here instead of GFP_KERNEL?
> drivers/media/pci/intel/ipu6/ipu6.c:402 ipu6_isys_init() warn: passing a valid pointer to 'PTR_ERR'
> drivers/media/pci/intel/ipu6/ipu6.c:448 ipu6_psys_init() warn: passing a valid pointer to 'PTR_ERR'
> drivers/media/pci/intel/ipu6/ipu6-isys-video.c:833 ipu6_isys_put_stream() warn: variable dereferenced before check 'stream' (see line 829)
> drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c:641 ipu6_isys_mcd_phy_config() warn: unsigned 'phy_port' is never less than zero.
> 
> I also get a lot of kerneldoc warnings for ipu6-fw-isys.h:
> 
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:169: warning: Enum value 'IPU6_FW_ISYS_MIPI_VC_0' not described in enum 'ipu6_fw_isys_mipi_vc'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:169: warning: Enum value 'IPU6_FW_ISYS_MIPI_VC_1' not described in enum 'ipu6_fw_isys_mipi_vc'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:169: warning: Enum value 'IPU6_FW_ISYS_MIPI_VC_2' not described in enum 'ipu6_fw_isys_mipi_vc'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:169: warning: Enum value 'IPU6_FW_ISYS_MIPI_VC_3' not described in enum 'ipu6_fw_isys_mipi_vc'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:169: warning: Enum value 'N_IPU6_FW_ISYS_MIPI_VC' not described in enum 'ipu6_fw_isys_mipi_vc'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:228: warning: wrong kernel-doc identifier on line:
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:283: warning: Function parameter or struct member 'width' not described in 'ipu6_fw_isys_resolution_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:283: warning: Function parameter or struct member 'height' not described in 'ipu6_fw_isys_resolution_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 'ts_offsets' not described in 'ipu6_fw_isys_output_pin_info_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 's2m_pixel_soc_pixel_remapping' not described in 'ipu6_fw_isys_output_pin_info_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 'csi_be_soc_pixel_remapping' not described in 'ipu6_fw_isys_output_pin_info_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 'reserved' not described in 'ipu6_fw_isys_output_pin_info_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 'snoopable' not described in 'ipu6_fw_isys_output_pin_info_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 'error_handling_enable' not described in 'ipu6_fw_isys_output_pin_info_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 'sensor_type' not described in 'ipu6_fw_isys_output_pin_info_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:356: warning: Function parameter or struct member 'crop_first_and_last_lines' not described in 'ipu6_fw_isys_input_pin_info_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:356: warning: Function parameter or struct member 'reserved' not described in 'ipu6_fw_isys_input_pin_info_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:366: warning: Function parameter or struct member 'top_offset' not described in 'ipu6_fw_isys_cropping_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:366: warning: Function parameter or struct member 'left_offset' not described in 'ipu6_fw_isys_cropping_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:366: warning: Function parameter or struct member 'bottom_offset' not described in 'ipu6_fw_isys_cropping_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:366: warning: Function parameter or struct member 'right_offset' not described in 'ipu6_fw_isys_cropping_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:413: warning: Function parameter or struct member 'reserved' not described in 'ipu6_fw_isys_stream_cfg_data_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:413: warning: Function parameter or struct member 'reserved2' not described in 'ipu6_fw_isys_stream_cfg_data_abi'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:446: warning: expecting prototype for struct ipu6_fw_isys_frame_buff_set. Prototype was for struct ipu6_fw_isys_frame_buff_set_abi instead
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:478: warning: expecting prototype for struct ipu6_fw_isys_resp_info_comm. Prototype was for struct ipu6_fw_isys_resp_info_abi instead
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:489: warning: expecting prototype for struct ipu6_fw_isys_proxy_error_info_comm. Prototype was for struct ipu6_fw_isys_proxy_error_info_abi instead
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:516: warning: Function parameter or struct member 'resp_info' not described in 'ipu6_fw_resp_queue_token'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:526: warning: Function parameter or struct member 'buf_handle' not described in 'ipu6_fw_send_queue_token'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:526: warning: Function parameter or struct member 'payload' not described in 'ipu6_fw_send_queue_token'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:526: warning: Function parameter or struct member 'send_type' not described in 'ipu6_fw_send_queue_token'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:526: warning: Function parameter or struct member 'stream_id' not described in 'ipu6_fw_send_queue_token'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:533: warning: Function parameter or struct member 'proxy_resp_info' not described in 'ipu6_fw_proxy_resp_queue_token'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:543: warning: Function parameter or struct member 'request_id' not described in 'ipu6_fw_proxy_send_queue_token'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:543: warning: Function parameter or struct member 'region_index' not described in 'ipu6_fw_proxy_send_queue_token'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:543: warning: Function parameter or struct member 'offset' not described in 'ipu6_fw_proxy_send_queue_token'
> drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:543: warning: Function parameter or struct member 'value' not described in 'ipu6_fw_proxy_send_queue_token'
> 
> > since v2:
> > 
> > - Toss Laurent's patch to disable the metadata format definitions in
> >   UAPI, on the top.
> > 
> > - Squash Laurent's patch to fix ret assignment in the Unicam driver.
> > 
> > since v1:
> > 
> > - Fix a compile issue in an intermediate patch. The result is unaffected by
> >   this (no diff).
> > 
> > The diff to v2 is:
> > 
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > index e91d02a64770..6ac4ea8efb1a 100644
> > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -2519,6 +2519,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
> >  		    num_data_lanes != 4) {
> >  			dev_err(unicam->dev, "%u data lanes not supported\n",
> >  				num_data_lanes);
> > +			ret = -EINVAL;
> >  			goto error;
> >  		}
> >  
> > @@ -2526,6 +2527,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
> >  			dev_err(unicam->dev,
> >  				"Endpoint uses %u data lanes when %u are supported\n",
> >  				num_data_lanes, unicam->max_data_lanes);
> > +			ret = -EINVAL;
> >  			goto error;
> >  		}
> >  
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 2f9762842313..fe6b67e83751 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -841,6 +841,7 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
> >  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
> >  
> > +#ifdef __KERNEL__
> >  /*
> >   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> >   * adding new ones!
> > @@ -852,6 +853,7 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> >  #define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> >  #define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> > +#endif
> >  
> >  /* priv field value to indicates that subsequent fields are valid. */
> >  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> > 
> > Please pull.
> > 
> > 
> > The following changes since commit faa4364bef2ec0060de381ff028d1d836600a381:
> > 
> >   media: stk1160: fix bounds checking in stk1160_copy_video() (2024-04-24 13:49:56 +0200)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/sailus/media_tree.git tags/for-6.10-metadata-5-no-fmts-signed
> > 
> > for you to fetch changes up to 58e783fc4885b2f04e7ae201a6f854dd4dfde06d:
> > 
> >   media: uapi: v4l: Don't expose generic metadata formats to userspace (2024-04-26 21:09:31 +0300)
> > 
> > ----------------------------------------------------------------
> > Unicam and IPU6 ISYS drivers, with metadata formats but in-kernel only
> > 
> > ----------------------------------------------------------------
> > Bingbu Cao (16):
> >       media: intel/ipu6: add Intel IPU6 PCI device driver
> >       media: intel/ipu6: add IPU auxiliary devices
> >       media: intel/ipu6: add IPU6 buttress interface driver
> >       media: intel/ipu6: CPD parsing for get firmware components
> >       media: intel/ipu6: add IPU6 DMA mapping API and MMU table
> >       media: intel/ipu6: add syscom interfaces between firmware and driver
> >       media: intel/ipu6: input system ABI between firmware and driver
> >       media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device
> >       media: intel/ipu6: add the CSI2 DPHY implementation
> >       media: intel/ipu6: input system video nodes and buffer queues
> >       media: intel/ipu6: add the main input system driver
> >       media: intel/ipu6: add Kconfig and Makefile
> >       media: MAINTAINERS: add maintainers for Intel IPU6 input system driver
> >       media: intel/ipu6: support line-based metadata capture support
> >       media: Documentation: add Intel IPU6 ISYS driver admin-guide doc
> >       media: Documentation: add documentation of Intel IPU6 driver and hardware overview
> > 
> > Dave Stevenson (2):
> >       dt-bindings: media: Add bindings for bcm2835-unicam
> >       media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface
> > 
> > Jean-Michel Hautbois (2):
> >       media: v4l: Add V4L2-PIX-FMT-Y12P format
> >       media: v4l: Add V4L2-PIX-FMT-Y14P format
> > 
> > Laurent Pinchart (2):
> >       media: v4l2-subdev: Clearly document that the crop API won't be extended
> >       media: uapi: v4l: Don't expose generic metadata formats to userspace
> > 
> > Sakari Ailus (15):
> >       media: Documentation: Add "stream" into glossary
> >       media: uapi: Add generic serial metadata mbus formats
> >       media: uapi: Document which mbus format fields are valid for metadata
> >       media: uapi: v4l: Add generic 8-bit metadata format definitions
> >       media: v4l: Support line-based metadata capture
> >       media: v4l: Set line based metadata flag in V4L2 core
> >       media: Documentation: Additional streams generally don't harm capture
> >       media: Documentation: Document S_ROUTING behaviour
> >       media: v4l: subdev: Add a function to lock two sub-device states, use it
> >       media: v4l: subdev: Copy argument back to user also for S_ROUTING
> >       media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
> >       media: v4l: subdev: Return routes set using S_ROUTING
> >       media: v4l: subdev: Add trivial set_routing support
> >       media: ipu6: Add PCI device table header
> >       media: ivsc: csi: Use IPU bridge
> > 
> >  Documentation/admin-guide/media/ipu6-isys.rst      |  161 ++
> >  .../admin-guide/media/ipu6_isys_graph.svg          |  548 ++++
> >  Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
> >  .../bindings/media/brcm,bcm2835-unicam.yaml        |  127 +
> >  Documentation/driver-api/media/drivers/index.rst   |    1 +
> >  Documentation/driver-api/media/drivers/ipu6.rst    |  205 ++
> >  Documentation/userspace-api/media/glossary.rst     |   12 +
> >  Documentation/userspace-api/media/v4l/dev-meta.rst |   21 +
> >  .../userspace-api/media/v4l/dev-subdev.rst         |   31 +-
> >  .../userspace-api/media/v4l/meta-formats.rst       |    3 +-
> >  .../userspace-api/media/v4l/metafmt-generic.rst    |  340 +++
> >  .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |   48 +
> >  .../userspace-api/media/v4l/subdev-formats.rst     |  269 +-
> >  .../userspace-api/media/v4l/vidioc-enum-fmt.rst    |    7 +
> >  .../media/v4l/vidioc-subdev-g-crop.rst             |    6 +-
> >  .../media/v4l/vidioc-subdev-g-routing.rst          |   51 +-
> >  .../userspace-api/media/videodev2.h.rst.exceptions |    1 +
> >  MAINTAINERS                                        |   17 +
> >  drivers/media/pci/intel/Kconfig                    |    1 +
> >  drivers/media/pci/intel/Makefile                   |    1 +
> >  drivers/media/pci/intel/ipu6/Kconfig               |   18 +
> >  drivers/media/pci/intel/ipu6/Makefile              |   23 +
> >  drivers/media/pci/intel/ipu6/ipu6-bus.c            |  165 ++
> >  drivers/media/pci/intel/ipu6/ipu6-bus.h            |   58 +
> >  drivers/media/pci/intel/ipu6/ipu6-buttress.c       |  912 +++++++
> >  drivers/media/pci/intel/ipu6/ipu6-buttress.h       |   92 +
> >  drivers/media/pci/intel/ipu6/ipu6-cpd.c            |  362 +++
> >  drivers/media/pci/intel/ipu6/ipu6-cpd.h            |  105 +
> >  drivers/media/pci/intel/ipu6/ipu6-dma.c            |  502 ++++
> >  drivers/media/pci/intel/ipu6/ipu6-dma.h            |   19 +
> >  drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |  413 +++
> >  drivers/media/pci/intel/ipu6/ipu6-fw-com.h         |   47 +
> >  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c        |  487 ++++
> >  drivers/media/pci/intel/ipu6/ipu6-fw-isys.h        |  568 ++++
> >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  663 +++++
> >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |   82 +
> >  drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c   |  536 ++++
> >  drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c   |  242 ++
> >  drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c   |  720 +++++
> >  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  811 ++++++
> >  drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |   78 +
> >  drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c    |  403 +++
> >  drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h    |   59 +
> >  drivers/media/pci/intel/ipu6/ipu6-isys-video.c     | 1399 ++++++++++
> >  drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |  141 +
> >  drivers/media/pci/intel/ipu6/ipu6-isys.c           | 1367 ++++++++++
> >  drivers/media/pci/intel/ipu6/ipu6-isys.h           |  206 ++
> >  drivers/media/pci/intel/ipu6/ipu6-mmu.c            |  845 ++++++
> >  drivers/media/pci/intel/ipu6/ipu6-mmu.h            |   73 +
> >  .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |  226 ++
> >  .../pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h   |  172 ++
> >  drivers/media/pci/intel/ipu6/ipu6-platform-regs.h  |  179 ++
> >  drivers/media/pci/intel/ipu6/ipu6.c                |  895 +++++++
> >  drivers/media/pci/intel/ipu6/ipu6.h                |  342 +++
> >  drivers/media/pci/intel/ivsc/mei_csi.c             |   20 +-
> >  drivers/media/platform/Kconfig                     |    1 +
> >  drivers/media/platform/Makefile                    |    1 +
> >  drivers/media/platform/broadcom/Kconfig            |   23 +
> >  drivers/media/platform/broadcom/Makefile           |    3 +
> >  .../media/platform/broadcom/bcm2835-unicam-regs.h  |  246 ++
> >  drivers/media/platform/broadcom/bcm2835-unicam.c   | 2743 ++++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c               |   43 +-
> >  drivers/media/v4l2-core/v4l2-subdev.c              |   50 +-
> >  include/media/ipu6-pci-table.h                     |   28 +
> >  include/media/v4l2-subdev.h                        |   42 +
> >  include/uapi/linux/media-bus-format.h              |    9 +
> >  include/uapi/linux/v4l2-mediabus.h                 |   18 +-
> >  include/uapi/linux/v4l2-subdev.h                   |   14 +-
> >  include/uapi/linux/videodev2.h                     |   26 +
> >  69 files changed, 18263 insertions(+), 65 deletions(-)
> >  create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
> >  create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
> >  create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> >  create mode 100644 Documentation/driver-api/media/drivers/ipu6.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst
> >  create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
> >  create mode 100644 drivers/media/pci/intel/ipu6/Makefile
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h
> >  create mode 100644 drivers/media/platform/broadcom/Kconfig
> >  create mode 100644 drivers/media/platform/broadcom/Makefile
> >  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
> >  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
> >  create mode 100644 include/media/ipu6-pci-table.h

-- 
Regards,

Laurent Pinchart

