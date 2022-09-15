Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CECE95B9571
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 09:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiIOHbB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 03:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbiIOHal (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 03:30:41 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C3B76442
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 00:30:08 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28F7JFP3002109;
        Thu, 15 Sep 2022 09:29:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9nD6N4iVjnyOlfX1YbMhAkRXWnuTH7pVDIwiY3+MpaI=;
 b=XHqP0t9EBtBpxpKJpPTNLkMQB5RzspbO0w1tljZNpxgPpfTq9CNWqgvnPuvSHLgMY3TC
 ZNE6pNBgzBzUCnQXG6cteN0aDPZFDB3JoHCfaQRPneZiCEYF330/L5gmilmXHXZ4Zqsc
 MB8SwhZx6JcNNVzLgNOI9osJ/0UiyC9wWJW5V9ODThuerCZUMRQrxJ+FjDp1WgUNpUNX
 dXPFppcMZ8zdowiiBAG7+9DyTcB/1YfqnkCLZq2heAZYCpAutB6mThvVdy8w+an4nShO
 CvywgfjYPYIE95R99QvAKOSlzXaNLs9lLM9PYmT9gOkiZrO9Zqp/oOLK0EAI4lW8j8Ya Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jjxxxtb52-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Sep 2022 09:29:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37CD710002A;
        Thu, 15 Sep 2022 09:29:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 23019216829;
        Thu, 15 Sep 2022 09:29:32 +0200 (CEST)
Received: from [10.252.219.170] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 15 Sep
 2022 09:29:28 +0200
Message-ID: <02b87a0d-651a-1995-cc14-d8ff36a76058@foss.st.com>
Date:   Thu, 15 Sep 2022 09:29:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 2/4] media: v4l: ctrls: Add a control for HDR mode
Content-Language: en-US
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>
References: <20220831090118.104057-1-benjamin.mugnier@foss.st.com>
 <20220831090118.104057-3-benjamin.mugnier@foss.st.com>
 <9f7e07991c509b3179ea3c4c8def5e6e19f508e2.camel@ndufresne.ca>
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <9f7e07991c509b3179ea3c4c8def5e6e19f508e2.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_04,2022-09-14_04,2022-06-22_01
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

Thank you for your review.

On 9/12/22 17:51, Nicolas Dufresne wrote:
> Hi Benjamin,
> 
> Le mercredi 31 août 2022 à 11:01 +0200, Benjamin Mugnier a écrit :
>> Add V4L2_CID_HDR_MODE as a menu item control to set the HDR mode of the
>> sensor, and its documentation.
>> Menu items are not standardized as they differ for each sensors.
>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  .../userspace-api/media/v4l/ext-ctrls-camera.rst          | 8 ++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                 | 2 ++
>>  include/uapi/linux/v4l2-controls.h                        | 2 ++
>>  3 files changed, 12 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>> index 4c5061aa9cd4..0ee09ff250e7 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>> @@ -661,3 +661,11 @@ enum v4l2_scene_mode -
>>  .. [#f1]
>>     This control may be changed to a menu control in the future, if more
>>     options are required.
>> +
>> +``V4L2_CID_HDR_MODE (menu)``
> 
> Perhaps try to make this more sensor specific in it name ?
> V4L2_CID_HDR_SENSOR_MODE ?
> 

No problem, queued for v6. Thank you.

>> +    Change the sensor HDR mode. A HDR picture is obtained by merging two
>> +    captures of the same scene using two different exposure periods. HDR mode
>> +    describes the way these two captures are merged in the sensor.
>> +
>> +    As modes differ for each sensor, menu items are not standardized by this
>> +    control and are left to the programmer.
> 
> I do have concern about this approach. Can you clarify ?
> 

Sure! This is the implementation of Sakari's excellent idea from v3 which you can read here:
https://lore.kernel.org/linux-media/YwNcUpsw1psudCOC@paasikivi.fi.intel.com/

The control name is standardized as a menu type, but values of the menu or not. The driver developer has to provide them by himself in its driver when adding the control. This is pretty versatile as hdr modes differ from one sensor to another (at least for my cases).
For the vgxy61 I defined these hdr modes in the driver file:

+static const char * const vgxy61_hdr_mode_menu[] = {
+	"HDR linearize",
+	"HDR substraction",
+	"No HDR",
+};

and added these elements to the V4L2_CID_HDR_MODE control with a std_menu_items in the vgxy61_init_controls function:

+	v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_HDR_MODE,
+				     ARRAY_SIZE(vgxy61_hdr_mode_menu) - 1, 0,
+				     VGXY61_NO_HDR, vgxy61_hdr_mode_menu);

I hope this is clearer.
This implementation can of course be discussed. Tell me what you think.


Regards,

Benjamin

> regards,
> Nicolas
> 
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index e22921e7ea61..0854de1ef1a5 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -1043,6 +1043,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
>>  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>> +	case V4L2_CID_HDR_MODE:			return "HDR mode";
>>  
>>  	/* FM Radio Modulator controls */
>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>> @@ -1370,6 +1371,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>  	case V4L2_CID_STATELESS_H264_START_CODE:
>>  	case V4L2_CID_CAMERA_ORIENTATION:
>>  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
>> +	case V4L2_CID_HDR_MODE:
>>  		*type = V4L2_CTRL_TYPE_MENU;
>>  		break;
>>  	case V4L2_CID_LINK_FREQ:
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index 5f46bf4a570c..5dfd38b09768 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -1013,6 +1013,8 @@ enum v4l2_auto_focus_range {
>>  
>>  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
>>  
>> +#define V4L2_CID_HDR_MODE			(V4L2_CID_CAMERA_CLASS_BASE+36)
>> +
>>  /* FM Modulator class control IDs */
>>  
>>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> 
