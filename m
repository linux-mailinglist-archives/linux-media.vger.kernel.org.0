Return-Path: <linux-media+bounces-10270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E00038B46D5
	for <lists+linux-media@lfdr.de>; Sat, 27 Apr 2024 17:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05EC01C209BC
	for <lists+linux-media@lfdr.de>; Sat, 27 Apr 2024 15:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A281A932;
	Sat, 27 Apr 2024 15:26:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DF8364
	for <linux-media@vger.kernel.org>; Sat, 27 Apr 2024 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714231582; cv=none; b=sOmkBRm0z4SOsozOxKKE2J8e4Sz8S72hhMotprYIJPwzX7I6DdGw+nAkvOoxKNVKd9FzRCd5ZmnWzpJsHhfWWCiMiGmf9To4ac3FcIVyIzEwnGl4UZ/tJ3KJnGwhgT34dRtkFCdh5h4ad1QRZr7+vAc4nCMN1zAvuj5mfHzhTbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714231582; c=relaxed/simple;
	bh=4LKWgRzzrqys5OPsBoc6hvIk8V2jbS8smKgiEQtMYNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmDrqgL9xB3/4MbEq0mcyk3jCX3Z/fy+CZnqcat8CHe99epsSeNbr3fPGcGx8+9vfOZg7huuwVW7wXkc4m0GwsTXKdTsY8fIv5mNYecM3XVI9U0WtpRQSw1RemwQh+8c7XLv/1Rlmgm00AZTIYs/xI2f8D2o3nxRbx9qSC7kR4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEB1C113CE;
	Sat, 27 Apr 2024 15:26:20 +0000 (UTC)
Message-ID: <34c04786-6310-4ee2-ad05-ffee82867b0a@xs4all.nl>
Date: Sat, 27 Apr 2024 17:26:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL v3 FOR 6.10] Unicam and IPU6 ISYS drivers
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org
References: <ZivusZfL8cC6HPum@valkosipuli.retiisi.eu>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <ZivusZfL8cC6HPum@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari, Laurent,

On 26/04/2024 20:13, Sakari Ailus wrote:
> Hi Hans, Mauro,
> 
> Here are drivers for Unicam and IPU6 ISYS, prepended by the first part of
> the metadata series. Both drivers can be used without the ROUTING IOCTL
> with partial functionality. The ROUTING IOCTL enablement patch will enable
> the rest of the functionality when it is merged later on.

Running this PR through my build scripts produces these smatch warnings (one
for bcm2835-unicam, 6 for IPU6):

drivers/media/platform/broadcom/bcm2835-unicam.c:2547 unicam_async_nf_init() warn: missing error code 'ret'
drivers/media/pci/intel/ipu6/ipu6-dma.c:67 __dma_alloc_buffer() warn: use 'gfp' here instead of GFP_KERNEL?
drivers/media/pci/intel/ipu6/ipu6-dma.c:164 ipu6_dma_alloc() warn: use 'gfp' here instead of GFP_KERNEL?
drivers/media/pci/intel/ipu6/ipu6.c:402 ipu6_isys_init() warn: passing a valid pointer to 'PTR_ERR'
drivers/media/pci/intel/ipu6/ipu6.c:448 ipu6_psys_init() warn: passing a valid pointer to 'PTR_ERR'
drivers/media/pci/intel/ipu6/ipu6-isys-video.c:833 ipu6_isys_put_stream() warn: variable dereferenced before check 'stream' (see line 829)
drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c:641 ipu6_isys_mcd_phy_config() warn: unsigned 'phy_port' is never less than zero.

I also get a lot of kerneldoc warnings for ipu6-fw-isys.h:

drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:169: warning: Enum value 'IPU6_FW_ISYS_MIPI_VC_0' not described in enum 'ipu6_fw_isys_mipi_vc'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:169: warning: Enum value 'IPU6_FW_ISYS_MIPI_VC_1' not described in enum 'ipu6_fw_isys_mipi_vc'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:169: warning: Enum value 'IPU6_FW_ISYS_MIPI_VC_2' not described in enum 'ipu6_fw_isys_mipi_vc'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:169: warning: Enum value 'IPU6_FW_ISYS_MIPI_VC_3' not described in enum 'ipu6_fw_isys_mipi_vc'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:169: warning: Enum value 'N_IPU6_FW_ISYS_MIPI_VC' not described in enum 'ipu6_fw_isys_mipi_vc'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:228: warning: wrong kernel-doc identifier on line:
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:283: warning: Function parameter or struct member 'width' not described in 'ipu6_fw_isys_resolution_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:283: warning: Function parameter or struct member 'height' not described in 'ipu6_fw_isys_resolution_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 'ts_offsets' not described in 'ipu6_fw_isys_output_pin_info_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 's2m_pixel_soc_pixel_remapping' not described in 'ipu6_fw_isys_output_pin_info_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 'csi_be_soc_pixel_remapping' not described in 'ipu6_fw_isys_output_pin_info_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 'reserved' not described in 'ipu6_fw_isys_output_pin_info_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 'snoopable' not described in 'ipu6_fw_isys_output_pin_info_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 'error_handling_enable' not described in 'ipu6_fw_isys_output_pin_info_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:327: warning: Function parameter or struct member 'sensor_type' not described in 'ipu6_fw_isys_output_pin_info_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:356: warning: Function parameter or struct member 'crop_first_and_last_lines' not described in 'ipu6_fw_isys_input_pin_info_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:356: warning: Function parameter or struct member 'reserved' not described in 'ipu6_fw_isys_input_pin_info_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:366: warning: Function parameter or struct member 'top_offset' not described in 'ipu6_fw_isys_cropping_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:366: warning: Function parameter or struct member 'left_offset' not described in 'ipu6_fw_isys_cropping_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:366: warning: Function parameter or struct member 'bottom_offset' not described in 'ipu6_fw_isys_cropping_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:366: warning: Function parameter or struct member 'right_offset' not described in 'ipu6_fw_isys_cropping_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:413: warning: Function parameter or struct member 'reserved' not described in 'ipu6_fw_isys_stream_cfg_data_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:413: warning: Function parameter or struct member 'reserved2' not described in 'ipu6_fw_isys_stream_cfg_data_abi'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:446: warning: expecting prototype for struct ipu6_fw_isys_frame_buff_set. Prototype was for struct ipu6_fw_isys_frame_buff_set_abi instead
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:478: warning: expecting prototype for struct ipu6_fw_isys_resp_info_comm. Prototype was for struct ipu6_fw_isys_resp_info_abi instead
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:489: warning: expecting prototype for struct ipu6_fw_isys_proxy_error_info_comm. Prototype was for struct ipu6_fw_isys_proxy_error_info_abi instead
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:516: warning: Function parameter or struct member 'resp_info' not described in 'ipu6_fw_resp_queue_token'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:526: warning: Function parameter or struct member 'buf_handle' not described in 'ipu6_fw_send_queue_token'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:526: warning: Function parameter or struct member 'payload' not described in 'ipu6_fw_send_queue_token'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:526: warning: Function parameter or struct member 'send_type' not described in 'ipu6_fw_send_queue_token'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:526: warning: Function parameter or struct member 'stream_id' not described in 'ipu6_fw_send_queue_token'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:533: warning: Function parameter or struct member 'proxy_resp_info' not described in 'ipu6_fw_proxy_resp_queue_token'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:543: warning: Function parameter or struct member 'request_id' not described in 'ipu6_fw_proxy_send_queue_token'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:543: warning: Function parameter or struct member 'region_index' not described in 'ipu6_fw_proxy_send_queue_token'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:543: warning: Function parameter or struct member 'offset' not described in 'ipu6_fw_proxy_send_queue_token'
drivers/media/pci/intel/ipu6/ipu6-fw-isys.h:543: warning: Function parameter or struct member 'value' not described in 'ipu6_fw_proxy_send_queue_token'

Regards,

	Hans

> 
> since v2:
> 
> - Toss Laurent's patch to disable the metadata format definitions in
>   UAPI, on the top.
> 
> - Squash Laurent's patch to fix ret assignment in the Unicam driver.
> 
> since v1:
> 
> - Fix a compile issue in an intermediate patch. The result is unaffected by
>   this (no diff).
> 
> The diff to v2 is:
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index e91d02a64770..6ac4ea8efb1a 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2519,6 +2519,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
>  		    num_data_lanes != 4) {
>  			dev_err(unicam->dev, "%u data lanes not supported\n",
>  				num_data_lanes);
> +			ret = -EINVAL;
>  			goto error;
>  		}
>  
> @@ -2526,6 +2527,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
>  			dev_err(unicam->dev,
>  				"Endpoint uses %u data lanes when %u are supported\n",
>  				num_data_lanes, unicam->max_data_lanes);
> +			ret = -EINVAL;
>  			goto error;
>  		}
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 2f9762842313..fe6b67e83751 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -841,6 +841,7 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>  
> +#ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
>   * adding new ones!
> @@ -852,6 +853,7 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
>  #define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
>  #define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> +#endif
>  
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> 
> Please pull.
> 
> 
> The following changes since commit faa4364bef2ec0060de381ff028d1d836600a381:
> 
>   media: stk1160: fix bounds checking in stk1160_copy_video() (2024-04-24 13:49:56 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/for-6.10-metadata-5-no-fmts-signed
> 
> for you to fetch changes up to 58e783fc4885b2f04e7ae201a6f854dd4dfde06d:
> 
>   media: uapi: v4l: Don't expose generic metadata formats to userspace (2024-04-26 21:09:31 +0300)
> 
> ----------------------------------------------------------------
> Unicam and IPU6 ISYS drivers, with metadata formats but in-kernel only
> 
> ----------------------------------------------------------------
> Bingbu Cao (16):
>       media: intel/ipu6: add Intel IPU6 PCI device driver
>       media: intel/ipu6: add IPU auxiliary devices
>       media: intel/ipu6: add IPU6 buttress interface driver
>       media: intel/ipu6: CPD parsing for get firmware components
>       media: intel/ipu6: add IPU6 DMA mapping API and MMU table
>       media: intel/ipu6: add syscom interfaces between firmware and driver
>       media: intel/ipu6: input system ABI between firmware and driver
>       media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device
>       media: intel/ipu6: add the CSI2 DPHY implementation
>       media: intel/ipu6: input system video nodes and buffer queues
>       media: intel/ipu6: add the main input system driver
>       media: intel/ipu6: add Kconfig and Makefile
>       media: MAINTAINERS: add maintainers for Intel IPU6 input system driver
>       media: intel/ipu6: support line-based metadata capture support
>       media: Documentation: add Intel IPU6 ISYS driver admin-guide doc
>       media: Documentation: add documentation of Intel IPU6 driver and hardware overview
> 
> Dave Stevenson (2):
>       dt-bindings: media: Add bindings for bcm2835-unicam
>       media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface
> 
> Jean-Michel Hautbois (2):
>       media: v4l: Add V4L2-PIX-FMT-Y12P format
>       media: v4l: Add V4L2-PIX-FMT-Y14P format
> 
> Laurent Pinchart (2):
>       media: v4l2-subdev: Clearly document that the crop API won't be extended
>       media: uapi: v4l: Don't expose generic metadata formats to userspace
> 
> Sakari Ailus (15):
>       media: Documentation: Add "stream" into glossary
>       media: uapi: Add generic serial metadata mbus formats
>       media: uapi: Document which mbus format fields are valid for metadata
>       media: uapi: v4l: Add generic 8-bit metadata format definitions
>       media: v4l: Support line-based metadata capture
>       media: v4l: Set line based metadata flag in V4L2 core
>       media: Documentation: Additional streams generally don't harm capture
>       media: Documentation: Document S_ROUTING behaviour
>       media: v4l: subdev: Add a function to lock two sub-device states, use it
>       media: v4l: subdev: Copy argument back to user also for S_ROUTING
>       media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
>       media: v4l: subdev: Return routes set using S_ROUTING
>       media: v4l: subdev: Add trivial set_routing support
>       media: ipu6: Add PCI device table header
>       media: ivsc: csi: Use IPU bridge
> 
>  Documentation/admin-guide/media/ipu6-isys.rst      |  161 ++
>  .../admin-guide/media/ipu6_isys_graph.svg          |  548 ++++
>  Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
>  .../bindings/media/brcm,bcm2835-unicam.yaml        |  127 +
>  Documentation/driver-api/media/drivers/index.rst   |    1 +
>  Documentation/driver-api/media/drivers/ipu6.rst    |  205 ++
>  Documentation/userspace-api/media/glossary.rst     |   12 +
>  Documentation/userspace-api/media/v4l/dev-meta.rst |   21 +
>  .../userspace-api/media/v4l/dev-subdev.rst         |   31 +-
>  .../userspace-api/media/v4l/meta-formats.rst       |    3 +-
>  .../userspace-api/media/v4l/metafmt-generic.rst    |  340 +++
>  .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |   48 +
>  .../userspace-api/media/v4l/subdev-formats.rst     |  269 +-
>  .../userspace-api/media/v4l/vidioc-enum-fmt.rst    |    7 +
>  .../media/v4l/vidioc-subdev-g-crop.rst             |    6 +-
>  .../media/v4l/vidioc-subdev-g-routing.rst          |   51 +-
>  .../userspace-api/media/videodev2.h.rst.exceptions |    1 +
>  MAINTAINERS                                        |   17 +
>  drivers/media/pci/intel/Kconfig                    |    1 +
>  drivers/media/pci/intel/Makefile                   |    1 +
>  drivers/media/pci/intel/ipu6/Kconfig               |   18 +
>  drivers/media/pci/intel/ipu6/Makefile              |   23 +
>  drivers/media/pci/intel/ipu6/ipu6-bus.c            |  165 ++
>  drivers/media/pci/intel/ipu6/ipu6-bus.h            |   58 +
>  drivers/media/pci/intel/ipu6/ipu6-buttress.c       |  912 +++++++
>  drivers/media/pci/intel/ipu6/ipu6-buttress.h       |   92 +
>  drivers/media/pci/intel/ipu6/ipu6-cpd.c            |  362 +++
>  drivers/media/pci/intel/ipu6/ipu6-cpd.h            |  105 +
>  drivers/media/pci/intel/ipu6/ipu6-dma.c            |  502 ++++
>  drivers/media/pci/intel/ipu6/ipu6-dma.h            |   19 +
>  drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |  413 +++
>  drivers/media/pci/intel/ipu6/ipu6-fw-com.h         |   47 +
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c        |  487 ++++
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.h        |  568 ++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  663 +++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |   82 +
>  drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c   |  536 ++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c   |  242 ++
>  drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c   |  720 +++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  811 ++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |   78 +
>  drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c    |  403 +++
>  drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h    |   59 +
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c     | 1399 ++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |  141 +
>  drivers/media/pci/intel/ipu6/ipu6-isys.c           | 1367 ++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys.h           |  206 ++
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c            |  845 ++++++
>  drivers/media/pci/intel/ipu6/ipu6-mmu.h            |   73 +
>  .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |  226 ++
>  .../pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h   |  172 ++
>  drivers/media/pci/intel/ipu6/ipu6-platform-regs.h  |  179 ++
>  drivers/media/pci/intel/ipu6/ipu6.c                |  895 +++++++
>  drivers/media/pci/intel/ipu6/ipu6.h                |  342 +++
>  drivers/media/pci/intel/ivsc/mei_csi.c             |   20 +-
>  drivers/media/platform/Kconfig                     |    1 +
>  drivers/media/platform/Makefile                    |    1 +
>  drivers/media/platform/broadcom/Kconfig            |   23 +
>  drivers/media/platform/broadcom/Makefile           |    3 +
>  .../media/platform/broadcom/bcm2835-unicam-regs.h  |  246 ++
>  drivers/media/platform/broadcom/bcm2835-unicam.c   | 2743 ++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c               |   43 +-
>  drivers/media/v4l2-core/v4l2-subdev.c              |   50 +-
>  include/media/ipu6-pci-table.h                     |   28 +
>  include/media/v4l2-subdev.h                        |   42 +
>  include/uapi/linux/media-bus-format.h              |    9 +
>  include/uapi/linux/v4l2-mediabus.h                 |   18 +-
>  include/uapi/linux/v4l2-subdev.h                   |   14 +-
>  include/uapi/linux/videodev2.h                     |   26 +
>  69 files changed, 18263 insertions(+), 65 deletions(-)
>  create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
>  create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
>  create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
>  create mode 100644 Documentation/driver-api/media/drivers/ipu6.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst
>  create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
>  create mode 100644 drivers/media/pci/intel/ipu6/Makefile
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h
>  create mode 100644 drivers/media/platform/broadcom/Kconfig
>  create mode 100644 drivers/media/platform/broadcom/Makefile
>  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
>  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
>  create mode 100644 include/media/ipu6-pci-table.h
> 


