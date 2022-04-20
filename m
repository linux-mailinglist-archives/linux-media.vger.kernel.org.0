Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B62F25088B3
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 15:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378738AbiDTNEO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 09:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378746AbiDTNEL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 09:04:11 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C4919C23
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 06:01:22 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23KC8K6K016636;
        Wed, 20 Apr 2022 15:01:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nmyxHUd9MeqyrZQXuzK3a36d5J8Phf41/gQKrvDbZDk=;
 b=Sld5HaAfamN5e7EjHyCUhw0Y5YOs7/sLCWk8atFlAWhEav8XxZKdsQPBu6IgIJSJ5+g+
 nPiDkzViHM9kjrFgX29xk+TJNSjSV2UECeu49eS87tNSoNbv2npE7n/+fX1KbzJem61h
 Z9eE+TJZvnkZNUA2hf+6+xToRDsPkXEJsXlpe2gD358A8DSxJPPzMdQEl+IJifXlbA8h
 o5hydHRd9yqk8mF4PWyor77dtcrxZdGADvM5cl0lunjgTWc3cD8ZQVTQ1UnWQcHECkvy
 Xviz1BhTE39F1ozfROMbtTrjQPTPADsI09ENZTMBYdvY+vYCYR91iKJG90Jgu7sJ6ZW3 zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqdw9f2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Apr 2022 15:01:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C0FA110002A;
        Wed, 20 Apr 2022 15:01:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F39920FC96;
        Wed, 20 Apr 2022 15:01:13 +0200 (CEST)
Received: from [10.0.2.15] (10.75.127.48) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 20 Apr 2022 15:01:13
 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
To:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
 <f236221b-a1b7-8c13-c361-d7592603599c@xs4all.nl>
Message-ID: <14e1ddee-fa04-5090-f2f6-c0ce26365450@foss.st.com>
Date:   Wed, 20 Apr 2022 15:01:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f236221b-a1b7-8c13-c361-d7592603599c@xs4all.nl>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE1.st.com
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

Hi Hans,

Thank you for your review.

On 19/04/2022 09:03, Hans Verkuil wrote:
> On 15/04/2022 13:18, Benjamin Mugnier wrote:
>> Add V4L2_CID_TEMPERATURE control to get temperature from sensor in
>> celsius as a volatile and read-only control, and its documentation.
> 
> celsius -> degrees Celsius
> 
> (see https://en.wikipedia.org/wiki/Celsius)
> 

Yes, thank you.

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
> Ditto
> 
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index 54ca4e6b820b..45ad3edd59e0 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -1042,6 +1042,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>  	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
>>  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>> +	case V4L2_CID_TEMPERATURE:		return "Temperature in °C";
> 
> I am not sure how well this ° symbol will work. The V4L2 spec says that this is an
> ASCII string, so that doesn't allow for this symbol.
> 
> I would just call it "Temperature".
> 

From what I see in v4l2-ctl it translate it to "temperature_in_c".
If we agree this is implicitly in in degrees celsius then let's remove it.

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
> 
> Add a break!
> 

Whoops!

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
> 
> Does it make sense to add this to CAMERA_CLASS? Can't this be a generic temperature
> control? (i.e. in USER_BASE) Any device can have a temperature sensor.
> 

I see no issue in moving it. Your call.

> I also think that making this an array control would make sense as well in case there
> are multiple temperature sensors.
> 
> Brainstorming some more: does this even belong here? Isn't this more a hwmon thing?
> E.g. compare this to drivers/nvme/host/hwmon.c.
> 
> A hwmon implementation seems to be a more natural mechanism.
> 
> Regards,
> 
> 	Hans
> 
>> +
>>  /* FM Modulator class control IDs */
>>  
>>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> 
