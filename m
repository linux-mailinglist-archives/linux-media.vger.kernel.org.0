Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104644F84F0
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 18:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbiDGQ2D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 12:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345690AbiDGQ1g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 12:27:36 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB4825C43
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 09:25:30 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237ApuXp022024;
        Thu, 7 Apr 2022 18:25:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=K8Y17IUvzEJVcLeldAbU+m0jLC3r5EAHX8c2wTKm3Y4=;
 b=7EnAqadEiL80hcNwURlGzJPa4oypK7mTxPmS+xc5Sw8K65hOCooEB0TPkSOMms9VMFrm
 Sq1OxIs6SjAwnn6YBATrLV3E8LxAnFkhiUjwselMMFeS48oFO1XbPYjkxWkc/3dae285
 Ff+Ru3+4heBd6wfsDMkE8CdOA/Kab5QbXpz50k87ZGriWH+fihCBJzOqdzm+7O+sR12Y
 gkERrGoK8vzoKVM8PMBrflBwgmwgtZwELEnaVMf5Vb0Rqddyasm4EqNNDmc+558n7KPj
 qH1H26hJnwHcv0YZUBYJyLhmW2UEj96r2WK7+vaxL+0TCxG4wjzEA4gyu70pZzQ7uLB6 MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f8x9gndjw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Apr 2022 18:25:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 10D8E10002A;
        Thu,  7 Apr 2022 18:24:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 067AF222227;
        Thu,  7 Apr 2022 18:24:59 +0200 (CEST)
Received: from [10.201.23.19] (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 7 Apr
 2022 18:24:58 +0200
Subject: Re: [PATCH v5 00/27] media: ov5640: Rework the clock tree programming
 for MIPI
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
CC:     <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <hverkuil-cisco@xs4all.nl>, <mirela.rabulea@nxp.com>,
        <xavier.roumegue@oss.nxp.com>, <tomi.valkeinen@ideasonboard.com>,
        <hugues.fruchet@st.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <aford173@gmail.com>, <festevam@gmail.com>,
        <Eugen.Hristev@microchip.com>, <jbrunet@baylibre.com>,
        <paul.elder@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
References: <20220224094313.233347-1-jacopo@jmondi.org>
From:   Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <96ef8296-ac52-74be-3d98-8a4f795e76c0@foss.st.com>
Date:   Thu, 7 Apr 2022 18:24:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220224094313.233347-1-jacopo@jmondi.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_03,2022-04-07_01,2022-02-23_01
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Many thanks for this huge work !

I have tested the serie on ST platform setup using OV5640 CSI-2.
I have not yet tested the OV5640 parallel mode but will do also.

Find below the main feedback, I have replied with more details on each 
related patches:
1) "2X8" mediabus code support broken, I have reverted the patch to 
continue testing
2) frame interval support dropped in flavour to vblank control: I have 
proposed a patch to support both
3) some resolutions/framerate not supported (MAX_VTS to increase)
4) JPEG framerate is divided by 2 with 1280x720@15, 1280x720@30, 
1920x1080@15
=> I have not found a relevant patch to overcome this, seems linked to 
the OV5640_LINK_RATE_MAX limit (mipi_div).

RAW8 not tested but I can also (on my side, this is functional only for 
resolutions >= 720p).

Here is the summary of resolutions/format tested with this serie and my 
patches on top:


*  QCIF 176x144 RGB565 15fps => OK, got 15
*  QCIF 176x144 YUYV 15fps => OK, got 15
*  QCIF 176x144 JPEG 15fps => OK, got 15
*  QCIF 176x144 RGB565 30fps => OK, got 30
*  QCIF 176x144 YUYV 30fps => OK, got 30
*  QCIF 176x144 JPEG 30fps => OK, got 30
*  QVGA 320x240 RGB565 15fps => OK, got 15
*  QVGA 320x240 YUYV 15fps => OK, got 15
*  QVGA 320x240 JPEG 15fps => OK, got 15
*  QVGA 320x240 RGB565 30fps => OK, got 30
*  QVGA 320x240 YUYV 30fps => OK, got 30
*  QVGA 320x240 JPEG 30fps => OK, got 30
*  VGA 640x480 RGB565 15fps => OK, got 15
*  VGA 640x480 YUYV 15fps => OK, got 15
*  VGA 640x480 JPEG 15fps => OK, got 15
*  VGA 640x480 RGB565 30fps => OK, got 30
*  VGA 640x480 YUYV 30fps => OK, got 30
*  VGA 640x480 JPEG 30fps => OK, got 30
*  480p 720x480 RGB565 15fps => OK, got 15
*  480p 720x480 YUYV 15fps => OK, got 15
*  480p 720x480 JPEG 15fps => OK, got 15
*  480p 720x480 RGB565 30fps => OK, got 30
*  480p 720x480 YUYV 30fps => OK, got 30
*  480p 720x480 JPEG 30fps => OK, got 30
*  XGA 1024x768 RGB565 15fps => OK, got 15
*  XGA 1024x768 YUYV 15fps => OK, got 15
*  XGA 1024x768 JPEG 15fps => OK, got 15
*  XGA 1024x768 RGB565 30fps => OK, got 30
*  XGA 1024x768 YUYV 30fps => OK, got 30
*  XGA 1024x768 JPEG 30fps => OK, got 30
*  720p 1280x720 RGB565 15fps => OK, got 15
*  720p 1280x720 YUYV 15fps => OK, got 15
*  720p 1280x720 JPEG 15fps => KO: got 7
===============================^^
[10917.171528] ov5640 1-003c: rate=62000000, freq=248000000, htot=1600, 
height=720, vblank=1863

*  720p 1280x720 RGB565 30fps => OK, got 30
*  720p 1280x720 YUYV 30fps => OK, got 30
*  720p 1280x720 JPEG 30fps => KO: got 15
===============================^^
[10921.317180] ov5640 1-003c: rate=62000000, freq=248000000, htot=1600, 
height=720, vblank=560

*  HD 1920x1080 RGB565 15fps => OK, got 15
*  HD 1920x1080 YUYV 15fps => OK, got 15
*  HD 1920x1080 JPEG 15fps => KO: got 7
===============================^^
[10925.810657] ov5640 1-003c: rate=74000000, freq=296000000, htot=2234, 
height=1080, vblank=1128

*  5Mp 2592x1944 RGB565 15fps => OK, got 15
*  5Mp 2592x1944 YUYV 15fps => OK, got 15
*  5Mp 2592x1944 JPEG 15fps => OK, got 15


Best regards,
Hugues.


On 2/24/22 10:42 AM, Jacopo Mondi wrote:
> v1:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
> v2:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7311
> v3:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7385
> v4:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7389
> 
> A branch for testing based on the most recent media-master is available at
> https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v5
> 
> v5 (Sakari):
> - Stay strictly in 80 cols
> - use clamp_t to avoid explicit cast
> - use ov5640_timings() where possible
> 
> v4:
> - Very minor update. Added tags and reworked enum_mbus_format as suggested
>    by Laurent.
> 
> v3:
> The series has now grown by 4 patches and the driver is now even larger
> being the formats and the timings for DVP and CSI-2 defined separately.
> 
> Tested in CSI-2 mode with UYVY, RGB565, SBGGR and RGB24 in all supported modes.
> 
> Tested format and sizes enumeration with the new formats definition.
> 
> Tested frame rate handling:
> 
> 	vblank = ( duration msec * pixe_rate MHz / htot - height)
> 
>    640x480 YUYV 15FPS (default 30 FPS)
> 
> 	duration = 666666 msec
> 	pixel_rate = 48 Mhz
> 	htot = 1600
> 	vtot = 1999
> 	vblank = vtot - height = 1519
> 
> 	$ v4l2-ctl -d /dev/v4l-subdev4 -c 0x009e0901=1519
> 	$ yavta -f YUYV -s 640x480 -c100 --skip 7 /dev/video0
> 	...
> 	10 (2) [-] any 11 614400 B 2189.317617 2189.317629 15.244 fps ts mono/EoF
> 	11 (3) [-] any 12 614400 B 2189.383212 2189.383224 15.245 fps ts mono/EoF
> 	12 (4) [-] any 13 614400 B 2189.448810 2189.448821 15.244 fps ts mono/EoF
> 	13 (5) [-] any 14 614400 B 2189.514405 2189.514417 15.245 fps ts mono/EoF
> 	14 (6) [-] any 15 614400 B 2189.580002 2189.580015 15.245 fps ts mono/EoF
> 	..
> 
>    2592x1944 YUVV 15 FPS (default)
> 	$ yavta -f YUYV -s 2592x1944 -c100 --skip 7 /dev/video0
> 	...
> 	6 (6) [-] any 7 10077696 B 2438.377592 2438.377605 15.009 fps ts mono/EoF
> 	7 (7) [-] any 8 10077696 B 2438.444219 2438.444233 15.009 fps ts mono/EoF
> 	8 (0) [-] any 9 10077696 B 2438.510846 2438.510860 15.009 fps ts mono/EoF
> 	9 (1) [-] any 10 10077696 B 2438.577474 2438.577488 15.009 fps ts mono/EoF
> 	10 (2) [-] any 11 10077696 B 2438.644101 2438.644116 15.009 fps ts mono/EoF
> 	11 (3) [-] any 12 10077696 B 2438.710727 2438.710740 15.009 fps ts mono/EoF
> 	12 (4) [-] any 13 10077696 B 2438.777358 2438.777370 15.008 fps ts mono/EoF
> 	13 (5) [-] any 14 10077696 B 2438.843984 2438.843998 15.009 fps ts mono/EoF
> 	14 (6) [-] any 15 10077696 B 2438.910611 2438.910623 15.009 fps ts mono/EoF
> 	15 (7) [-] any 16 10077696 B 2438.977238 2438.977252 15.009 fps ts mono/EoF
> 	16 (0) [-] any 17 10077696 B 2439.043865 2439.043877 15.009 fps ts mono
> 	...
> 
> 
> To enable higher FPS the LINK_FREQ control should be made writable to increase
> the pixel rate
> 
>    640x480 YUYV 60 FPS (pixel_rate = 96 Mhz)
> 
> 	$ yavta -f YUYV -s 640x480 -c100 --skip 7 /dev/video0
>   	...
> 	9 (1) [-] any 10 614400 B 57.098649 57.098667 59.995 fps ts mono/EoF
> 	10 (2) [-] any 11 614400 B 57.115314 57.115332 60.006 fps ts mono/EoF
> 	11 (3) [-] any 12 614400 B 57.131978 57.131994 60.010 fps ts mono/EoF
> 	12 (4) [-] any 13 614400 B 57.148645 57.148664 59.999 fps ts mono/EoF
> 	13 (5) [-] any 14 614400 B 57.165310 57.165328 60.006 fps ts mono/EoF
> 	14 (6) [-] any 15 614400 B 57.181977 57.181996 59.999 fps ts mono/EoF
> 	15 (7) [-] any 16 614400 B 57.198642 57.198660 60.006 fps ts mono/EoF
> 
> Changelog:
> 
> v2->v3:
> 
> - Eugen (thanks) reported regression in DVP mode :(
>    To maintain the DVP timings un-changed in this version the mode definition now
>    looks like
> 
> 		/* 640x480 */
> 		.id		= OV5640_MODE_VGA_640_480,
> 		.dn_mode	= SUBSAMPLING,
> 		.pixel_rate	= OV5640_PIXEL_RATE_48M,
> 		.width		= 640,
> 		.height		= 480,
> 		.dvp_timings = {
> 			.analog_crop = {
> 				.left	= 0,
> 				.top	= 4,
> 				.width	= 2624,
> 				.height	= 1944,
> 			},
> 			.crop = {
> 				.left	= 16,
> 				.top	= 6,
> 				.width	= 640,
> 				.height	= 480,
> 			},
> 			.htot		= 1896,
> 			.vblank_def	= 600,
> 			.max_fps	= OV5640_60_FPS
> 		},
> 		.csi2_timings = {
> 			.analog_crop = {
> 				/* Feed the full valid pixel array to the ISP. */
> 				.left	= OV5640_PIXEL_ARRAY_LEFT,
> 				.top	= OV5640_PIXEL_ARRAY_TOP,
> 				.width	= OV5640_PIXEL_ARRAY_WIDTH,
> 				.height	= OV5640_PIXEL_ARRAY_HEIGHT,
> 			},
> 			.crop = {
> 				/* Maintain a minimum digital crop processing margins. */
> 				.left	= 2,
> 				.top	= 4,
> 				.width	= 640,
> 				.height	= 480,
> 			},
> 			.htot		= 1600,
> 			.vblank_def	= 520,
> 		},
> 		.reg_data	= ov5640_setting_low_res,
> 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
> 
>    with a .dvp_timings and a .csi2_timings members to separate the two.
>    Is it nice ? No it's not, but it should help maintaining DVP users happy.
> 
>    Eugen: if you are willing to run another test round to confirm if this version
>    does not regress DVP it would be great :)
> 
> - Split image formats between CSI-2 and DVP
> - Remove RGB888 as per the CSIS discussion with Laurent
> - Removed register tables for modes < 720 as they're all equal
> - Minor fixes on Laurent's comments
> - Add Adam's tag
> 
> v1 -> v2:
> - rework the modes definition to process the full pixel array
> - rework get_selection to report the correct BOUND and DEFAULT targets
> - implement init_cfg
> - minor style changes as suggested by Laurent
> - test with 1 data lane
> 
> Jacopo Mondi (27):
>    media: ov5640: Add pixel rate to modes
>    media: ov5604: Re-arrange modes definition
>    media: ov5640: Add ov5640_is_csi2() function
>    media: ov5640: Associate bpp with formats
>    media: ov5640: Add LINK_FREQ control
>    media: ov5640: Update pixel_rate and link_freq
>    media: ov5640: Rework CSI-2 clock tree
>    media: ov5640: Rework timings programming
>    media: ov5640: Fix 720x480 in RGB888 mode
>    media: ov5640: Split DVP and CSI-2 timings
>    media: ov5640: Provide timings accessor
>    media: ov5640: Re-sort per-mode register tables
>    media: ov5640: Remove duplicated mode settings
>    media: ov5640: Remove ov5640_mode_init_data
>    media: ov5640: Add HBLANK control
>    media: ov5640: Add VBLANK control
>    media: ov5640: Change CSI-2 timings to comply with FPS
>    media: ov5640: Implement init_cfg
>    media: ov5640: Implement get_selection
>    media: ov5640: Limit frame_interval to DVP mode only
>    media: ov5640: Register device properties
>    media: ov5640: Add RGB565_1X16 format
>    media: ov5640: Add BGR888 format
>    media: ov5640: Restrict sizes to mbus code
>    media: ov5640: Adjust format to bpp in s_fmt
>    media: ov5640: Split DVP and CSI-2 formats
>    media: ov5640: Move format mux config in format
> 
>   drivers/media/i2c/ov5640.c | 1615 ++++++++++++++++++++++++++----------
>   1 file changed, 1160 insertions(+), 455 deletions(-)
> 
> --
> 2.35.0
> 
> 
> 
