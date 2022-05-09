Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C438051F500
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 09:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbiEIHCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 03:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234679AbiEIGum (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 02:50:42 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A26AE79
        for <linux-media@vger.kernel.org>; Sun,  8 May 2022 23:46:44 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2495H6bH018362;
        Mon, 9 May 2022 08:45:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=B/anJ6bxZKtTir2Whktqk0aX1e6VPqiRj+EiN/H6NO4=;
 b=Bw+FbPcK0GiWj/6RcLXdE/FGeNGNY7NWqwmt9UZbxHQHlQXUZd0NY4zLu++C6/vOVK5m
 JIQPDqbeFH+lgWww6M6rVJ4+QFShxK8Hxhj64kr3bx8HLj25eXsWWqX6JO3XkMyXouPW
 zJN3NO7+Z2sOwY8uwzv2yq0/AWhIQ21JmESEqAU2557gAGSKFeEveLRTH7rFwn8EgKW2
 gBczfXOGsi2pb2sCHetdWalkeE98gPqh+wSVS/YJWbLeEl0w+lDMrCIXGVoYA2+Un0uz
 K3QhA86U+CKf8G2NjsatOjHOvj7nFKfPQU73HCXqDBEJkEBlB1J7Cz+2flKOTQaEEEyt Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwdw8sj2t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 May 2022 08:45:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 089F410002A;
        Mon,  9 May 2022 08:45:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4D4920FA20;
        Mon,  9 May 2022 08:45:05 +0200 (CEST)
Received: from [10.201.23.19] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 9 May
 2022 08:45:04 +0200
Subject: Re: [PATCH v6 00/28] media: ov5640: Rework the clock tree programming
 for MIPI
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
CC:     <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <hverkuil-cisco@xs4all.nl>, <mirela.rabulea@nxp.com>,
        <xavier.roumegue@oss.nxp.com>, <tomi.valkeinen@ideasonboard.com>,
        <hugues.fruchet@st.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <aford173@gmail.com>, <festevam@gmail.com>,
        <Eugen.Hristev@microchip.com>, <jbrunet@baylibre.com>,
        <paul.elder@ideasonboard.com>, <eddy.khan@vergesense.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
References: <20220504155157.184047-1-jacopo@jmondi.org>
From:   Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <eaca49f6-f54f-3e4a-454e-be06a0ec1eee@foss.st.com>
Date:   Mon, 9 May 2022 08:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220504155157.184047-1-jacopo@jmondi.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_02,2022-05-06_01,2022-02-23_01
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Many thanks for the patches.

Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>

Best regards,
Hugues.

On 5/4/22 5:51 PM, Jacopo Mondi wrote:
> v1:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
> v2:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7311
> v3:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7385
> v4:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7389
> v5:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7400
> 
> Thanks to Hugues I have reworked the way link_freq is calculated and how
> register 0x4837 (pclk_period) is computed. The best I could come up with
> is the following (with a suggestion taken from the ov5645 datasheet):
> 
> 	/*
> 	 * Set the sample period expressed in ns with 1-bit decimal
> 	 * (0x01=0.5ns).
> 	 *
> 	 * The register is very briefly documented. In the OV5645 datasheet it
> 	 * is described as (2 * pclk period), and from testing it seems the
> 	 * actual definition is 2 * 8-bit sample period.
> 	 *
> 	 * 2 * sample_period = (mipi_clk * 2 * num_lanes / bpp) * (bpp / 8) / 2
> 	 */
> 	num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
> 	sample_rate = (link_freq * mipi_div * num_lanes * 2) / 16;
> 	pclk_period = 2000000000UL / sample_rate;
> 
> Hugues, I tested with your framerate check scripts and the results match the ones
> you have.
> 
> Again tested in all modes/formats with 2 lanes. Only briefly tested with 1 lane
> in VGA mode where I can get images although they're not good and probably the
> pixel clock and blankings should be recalculated for 1 lanes setup.
> 
> Thanks everyone for helping test this. I really hope we can soon land this
> series soon.
> 
> Thanks
>     j
> 
> v6 (Hugues)
> - Re-introduce s_frame_interval for CSI-2 platforms
> - Rework pclk_sample and link_freq control handling as suggested by Hugues
> - Enlarge VBLANK_MAX as suggested by Hugues to allow slower modes
> - Remove frame_rate restriction from set_fmt
> - Add Hugues' patch to calculate vblank when using s_frame_interval
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
> Hugues Fruchet (1):
>    media: ov5640: Adjust vblank with s_frame_interval
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
>    media: ov5640: Remove frame rate check from find_mode()
>    media: ov5640: Change CSI-2 timings to comply with FPS
>    media: ov5640: Implement init_cfg
>    media: ov5640: Implement get_selection
>    media: ov5640: Register device properties
>    media: ov5640: Add RGB565_1X16 format
>    media: ov5640: Add BGR888 format
>    media: ov5640: Restrict sizes to mbus code
>    media: ov5640: Adjust format to bpp in s_fmt
>    media: ov5640: Split DVP and CSI-2 formats
>    media: ov5640: Move format mux config in format
> 
>   drivers/media/i2c/ov5640.c | 1650 ++++++++++++++++++++++++++----------
>   1 file changed, 1188 insertions(+), 462 deletions(-)
> 
> --
> 2.35.1
> 
> 
> 
