Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3445088B2
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 15:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378748AbiDTNET (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 09:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378747AbiDTNEL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 09:04:11 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B0B13EB8
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 06:01:22 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23KAITJh017328;
        Wed, 20 Apr 2022 15:01:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6qWHDUyjcPtco30+iyGTnnCm7LqZbrmttP6sDQ4N6O8=;
 b=sBbPD7lhT9YvaprjFLZG+/pqOgbejhwHfYG6ynwdnWwY+4+u4vEiEH5xHB7NNvxlGG7t
 X64/xeEeN9uT1DwYo1QXa4Trf/Ubkwcql+vpH6FyMJPDPS4Adzi+imAPeoBsUZkGuGGR
 QVlL1NSLWxExYn9FDv1XQ6l9t4hLuFyuDD+aAbV3yU23QlX1hTzFc7HN6FvGgh47wJRW
 kvZ1ndvZf6K8p8PrORdpvXGBXM8yBCMIwrVWfsu3vr2QzhsLqgDSYysQL/WwfcvsDasM
 /Q6UCMVyJcWvadbFClyboKU4TzWAjYFNVXba3AYjwD+f+iVa/b8GZuGc0JYGr7HU0gds lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqdw9f8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Apr 2022 15:01:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BCE55100034;
        Wed, 20 Apr 2022 15:01:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6F6420FC96;
        Wed, 20 Apr 2022 15:01:16 +0200 (CEST)
Received: from [10.0.2.15] (10.75.127.48) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 20 Apr 2022 15:01:16
 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, <alain.volmat@foss.st.com>,
        <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <dave.stevenson@raspberrypi.com>, <sakari.ailus@linux.intel.com>,
        <kieran.bingham@ideasonboard.com>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
 <YlmDIHNQub7eqskK@pendragon.ideasonboard.com>
Message-ID: <e9089441-6fea-d589-e930-28816405e485@foss.st.com>
Date:   Wed, 20 Apr 2022 15:01:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YlmDIHNQub7eqskK@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_03,2022-04-20_01,2022-02-23_01
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for your review.

On 15/04/2022 16:37, Laurent Pinchart wrote:
> Hi Benjamin,
> 
> Thank you for the patch.
> 
> On Fri, Apr 15, 2022 at 01:18:42PM +0200, Benjamin Mugnier wrote:
>> Add V4L2_CID_TEMPERATURE control to get temperature from sensor in
>> celsius as a volatile and read-only control, and its documentation.
>> Useful to monitor thermals from v4l controls for sensors that support
>> this.
>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst | 3 +++
>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                  | 4 ++++
>>  include/uapi/linux/v4l2-controls.h                         | 2 ++
>>  3 files changed, 9 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>> index 4c5061aa9cd4..26fa21f5c45a 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>> @@ -661,3 +661,6 @@ enum v4l2_scene_mode -
>>  .. [#f1]
>>     This control may be changed to a menu control in the future, if more
>>     options are required.
>> +
>> +``V4L2_CID_TEMPERATURE (integer)``
>> +    The temperature of the sensor in celsius. This is a read-only control.
> 
> I've seen sensors where the temperature sensor has a 1/10th degree
> precision. Should we standardize on that ? Anything more precise is
> likely overkill.
> 

This sensor also has a 1/10th degree precision, here I only display the integer part. Ok to standardize on that.

> There are also sensors with multiple temperature sensors. If there are
> too many of them I suppose the temperature would be reported in embedded
> data, but perhaps not always. How can we prepare for this ?
> 
> There are also a few details that I think should be documented. Is the
> temperature always read on-demand when reading the control, or updated
> periodically ? I would assume most drivers would implement the former,
> which means no control notification events will be generated. This
> should be documented. Furthermore, do drivers need to support reading
> the temperature when the sensor isn't streaming ? If not, when should a
> control read ioctl return, the last value, or an error ?
> 

From what I see read on demand seems sufficient.
This sensor supports reading the temperature read even if not streaming. I don't know for other sensors.
See my comments on driver implementation on 5/5 for more.

>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index 54ca4e6b820b..45ad3edd59e0 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
>>  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>> +	case V4L2_CID_TEMPERATURE:		return "Temperature in °C";
>>  
>>  	/* FM Radio Modulator controls */
>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>> @@ -1597,6 +1598,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>  	case V4L2_CID_RF_TUNER_PLL_LOCK:
>>  		*flags |= V4L2_CTRL_FLAG_VOLATILE;
>>  		break;
>> +	case V4L2_CID_TEMPERATURE:
>> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY |
>> +			  V4L2_CTRL_FLAG_VOLATILE;
>>  	}
>>  }
>>  EXPORT_SYMBOL(v4l2_ctrl_fill);
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index bb40129446d4..705b4043c2de 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -1008,6 +1008,8 @@ enum v4l2_auto_focus_range {
>>  
>>  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
>>  
>> +#define V4L2_CID_TEMPERATURE			(V4L2_CID_CAMERA_CLASS_BASE+36)
>> +
>>  /* FM Modulator class control IDs */
>>  
>>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> 
