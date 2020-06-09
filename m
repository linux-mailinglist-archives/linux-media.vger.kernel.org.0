Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53591F3ECB
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 17:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730678AbgFIPB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 11:01:56 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39033 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730654AbgFIPBx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jun 2020 11:01:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ifkujUBrRNp2zifkyjlyoh; Tue, 09 Jun 2020 17:01:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591714906; bh=2UBNyGiGQ39Gr5fhoeQ/g57it7qDzgt8h68l+Yh7uSo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Mx2FYbRZ9Yk0KQkpbkJXXOr/ejLeJgWwYxEZVMLNU2ZVBbowF1vsVBJhBrxQv4h7c
         9zxWCkXN0jm8oZyBP4rpUK2hsQLou8QEyC7hIU/j96EtewPOGsop5pcL5WVTwDIVsi
         asdd0YDwWrygf8syA8IFp92IRa70/6QrUZTGdfuKXijUKGlsSEVaFXR1qOZjgyZbsZ
         vB8Yh/RkUm7bJ3cG/0zPEicb8A0W3xBnHZK/H4e3qfZC/VnzFoFavz12UDW0ZKB48o
         n8ftC6RKwv6mENii0BFISk1cylWH178VJ8PLDTxBaVodt5Mph97X82HcL6411qWz7s
         lkFMxvy/UBnnA==
Subject: Re: [PATCH v2 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx
 Subsystem driver
To:     Vishal Sagar <vsagar@xilinx.com>, Hyun Kwon <hyunk@xilinx.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Joe Perches <joe@perches.com>
References: <20200429141705.18755-1-vishal.sagar@xilinx.com>
 <20200429141705.18755-3-vishal.sagar@xilinx.com>
 <368b7efb-3faf-bb71-2bd0-826f2ab031e6@xs4all.nl>
 <DM6PR02MB6876F989682935D38AA9BF19A78A0@DM6PR02MB6876.namprd02.prod.outlook.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7cecf608-a001-5986-8792-35c312dcc961@xs4all.nl>
Date:   Tue, 9 Jun 2020 17:01:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <DM6PR02MB6876F989682935D38AA9BF19A78A0@DM6PR02MB6876.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHwnUPLBZOiuFRgK7hI0kI2yqt/Chzc6XqbOErlzI+r7NrM+eNruttGZxWbmLQqP6U8jINREpscVwCksOA5A/z06kT/x2FZKm6r0HWqD5LxpJ5iQjnHW
 CNMz2qh0nEhuR56A+Y9MuGSdVt9Ch9fu9HlmNwX84/QQ5Ro0Di9ZrAq3g04WpHbznJpIl05aPwGve/OLmhlP41f35a+ftxkf93cF6ggH7j2DV9Us0gs1Gnop
 xqkRL6tCNaCq3F1XAdb3+UMjyGZiRzUSKfWNGIi1mrtzPVlSx94C+hBxCYXHqfu0bn3V+G3XurXEL2ElqGpadQy9UTtiJdJSrhoTSdcyMDDYvECd1J8csdZo
 2KmmZE8Uzwhji0IGqzENkUsMNPIhBFXEetVUV2PJGaWT9Vw5K06qTZvRKM+jqNbgk0KDZAajIpo+tracnFfgglqmGA3yew4ip2bmXxmlOWLsq5UDzYUqYnbD
 XhNsdS97MFGX2hSKK9IrtePr7bR7I2nx4txKpwYUXBF/vJ4VZzuoTd2cveIEjqXHEl2X9T/bn1virLd7Wd6Lt7r/YUt5X0xEUfinirCMjEwOyT/D0J2fEZjX
 jFcdeBNXc7wjDD1Oz9E200Q04IZ0zn8FKqWxZDKl57H8I1VSKJhcMIlw2ZoNVa0/kko=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/06/2020 16:59, Vishal Sagar wrote:
> Hi Hans,
> 
> Thanks for reviewing!
> 
>> -----Original Message-----
>> From: Hans Verkuil <hverkuil@xs4all.nl>
>> Sent: Wednesday, May 6, 2020 3:25 PM
>> To: Vishal Sagar <vsagar@xilinx.com>; Hyun Kwon <hyunk@xilinx.com>;
>> laurent.pinchart@ideasonboard.com; mchehab@kernel.org;
>> robh+dt@kernel.org; mark.rutland@arm.com; Michal Simek
>> <michals@xilinx.com>; linux-media@vger.kernel.org;
>> devicetree@vger.kernel.org; hans.verkuil@cisco.com; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Dinesh Kumar
>> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>; Joe Perches
>> <joe@perches.com>
>> Subject: Re: [PATCH v2 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem
>> driver
>>
>> Hi Vishal,
>>
>> Thank you for this patch.
>>
>> I have some comments below:
>>
>> On 29/04/2020 16:17, Vishal Sagar wrote:
>>> The Xilinx UHD-SDI Rx subsystem soft IP is used to capture native SDI
>>> streams from SDI sources like SDI broadcast equipment like cameras and
>>> mixers. This block outputs either native SDI, native video or
>>> AXI4-Stream compliant data stream for further processing. Please refer
>>> to PG290 for details.
>>>
>>> The driver is used to configure the IP to add framer, search for
>>> specific modes, get the detected mode, stream parameters, errors, etc.
>>> It also generates events for video lock/unlock, bridge over/under flow.
>>>
>>> The driver supports 10/12 bpc YUV 422 media bus format currently. It also
>>> decodes the stream parameters based on the ST352 packet embedded in the
>>> stream. In case the ST352 packet isn't present in the stream, the core's
>>> detected properties are used to set stream properties.
>>>
>>> The driver currently supports only the AXI4-Stream IP configuration.
>>>
>>> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
>>> ---

<snip>

>>> +/**
>>> + * xsdirxss_set_format - This is used to set the pad format
>>> + * @sd: Pointer to V4L2 Sub device structure
>>> + * @cfg: Pointer to sub device pad information structure
>>> + * @fmt: Pointer to pad level media bus format
>>> + *
>>> + * This function is used to set the pad format.
>>> + * Since the pad format is fixed in hardware, it can't be
>>> + * modified on run time.
>>> + *
>>> + * Return: 0 on success
>>> + */
>>> +static int xsdirxss_set_format(struct v4l2_subdev *sd,
>>> +			       struct v4l2_subdev_pad_config *cfg,
>>> +			       struct v4l2_subdev_format *fmt)
>>> +{
>>> +	struct v4l2_mbus_framefmt *__format;
>>> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
>>> +
>>> +	dev_dbg(xsdirxss->core.dev,
>>> +		"set width %d height %d code %d field %d colorspace %d\n",
>>> +		fmt->format.width, fmt->format.height,
>>> +		fmt->format.code, fmt->format.field,
>>> +		fmt->format.colorspace);
>>> +
>>> +	__format = __xsdirxss_get_pad_format(xsdirxss, cfg,
>>> +					     fmt->pad, fmt->which);
>>> +
>>> +	/* Currently reset the code to one fixed in hardware */
>>> +	/* TODO : Add checks for width height */
>>> +	fmt->format.code = __format->code;
>>
>> It should fill in the width and height based on the current DV timings.
>> Ditto for the field (I assume that's fixed as well based on whether this
>> is interlaced or not). I'm not sure how colorspace information is handled
>> for SDI.
>>
> 
> Yes. I will update this logic to update the width, height and field based on current DV timings.
> Please have a look at this in the next version.
> The current IP supports BT709 colorimetry.
> The colorimetry information of incoming stream is present in the ST 352 payload Byte 3 (bit 5 and bit 4) as per SMPTE ST 2081-10:2018.
> B5:4 = 0 -> BT 709 as per SMPTE ST 274 

OK, so this can be filled in by the driver as well.

> 
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * xsdirxss_enum_mbus_code - Handle pixel format enumeration
>>> + * @sd: pointer to v4l2 subdev structure
>>> + * @cfg: V4L2 subdev pad configuration
>>> + * @code: pointer to v4l2_subdev_mbus_code_enum structure
>>> + *
>>> + * Return: -EINVAL or zero on success
>>> + */
>>> +static int xsdirxss_enum_mbus_code(struct v4l2_subdev *sd,
>>> +				   struct v4l2_subdev_pad_config *cfg,
>>> +				   struct v4l2_subdev_mbus_code_enum
>> *code)
>>> +{
>>> +	struct xsdirxss_state *xsdirxss = to_xsdirxssstate(sd);
>>> +	u32 index = code->index;
>>> +	u32 maxindex;
>>> +
>>> +	if (xsdirxss->core.bpc == 10)
>>> +		maxindex = ARRAY_SIZE(xsdirxss_10bpc_mbus_fmts);
>>> +	else
>>> +		maxindex = ARRAY_SIZE(xsdirxss_12bpc_mbus_fmts);
>>> +
>>> +	if (code->pad || index >= maxindex)
>>> +		return -EINVAL;
>>> +
>>> +	if (xsdirxss->core.bpc == 10)
>>> +		code->code = xsdirxss_10bpc_mbus_fmts[index];
>>> +	else
>>> +		code->code = xsdirxss_12bpc_mbus_fmts[index];
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * xsdirxss_enum_dv_timings: Enumerate all the supported DV timings
>>> + * @sd: pointer to v4l2 subdev structure
>>> + * @timings: DV timings structure to be returned.
>>> + *
>>> + * Return: -EINVAL incase of invalid index and pad or zero on success
>>> + */
>>> +static int xsdirxss_enum_dv_timings(struct v4l2_subdev *sd,
>>> +				    struct v4l2_enum_dv_timings *timings)
>>> +{
>>> +	if (timings->index >= ARRAY_SIZE(fmt_cap))
>>> +		return -EINVAL;
>>> +
>>> +	if (timings->pad != 0)
>>> +		return -EINVAL;
>>> +
>>> +	timings->timings = fmt_cap[timings->index];
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * xsdirxss_query_dv_timings: Query for the current DV timings
>>> + * @sd: pointer to v4l2 subdev structure
>>> + * @timings: DV timings structure to be returned.
>>> + *
>>> + * Return: -ENOLCK when video is not locked, -ERANGE when corresponding
>> timing
>>> + * entry is not found or zero on success.
>>> + */
>>> +static int xsdirxss_query_dv_timings(struct v4l2_subdev *sd,
>>> +				     struct v4l2_dv_timings *timings)
>>> +{
>>> +	struct xsdirxss_state *state = to_xsdirxssstate(sd);
>>> +	unsigned int i;
>>> +
>>> +	if (!state->vidlocked)
>>> +		return -ENOLCK;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(xsdirxss_dv_timings); i++) {
>>> +		if (state->format.width == xsdirxss_dv_timings[i].width &&
>>> +		    state->format.height == xsdirxss_dv_timings[i].height &&
>>> +		    state->frame_interval.denominator ==
>>> +		    (xsdirxss_dv_timings[i].fps * 1000)) {
>>> +			*timings = xsdirxss_dv_timings[i].format;
>>> +			return 0;
>>> +		}
>>> +	}
>>> +
>>> +	return -ERANGE;
>>> +}
>>> +
>>> +/* -----------------------------------------------------------------------------
>>> + * Media Operations
>>> + */
>>> +
>>> +static const struct media_entity_operations xsdirxss_media_ops = {
>>> +	.link_validate = v4l2_subdev_link_validate
>>> +};
>>> +
>>> +static const struct v4l2_ctrl_ops xsdirxss_ctrl_ops = {
>>> +	.g_volatile_ctrl = xsdirxss_g_volatile_ctrl,
>>> +	.s_ctrl	= xsdirxss_s_ctrl
>>> +};
>>> +
>>> +static const struct v4l2_ctrl_config xsdirxss_edh_ctrls[] = {
>>> +	{
>>> +		.ops	= &xsdirxss_ctrl_ops,
>>> +		.id	= V4L2_CID_XILINX_SDIRX_EDH_ERRCNT_ENABLE,
>>> +		.name	= "SDI Rx : EDH Error Count Enable",
>>> +		.type	= V4L2_CTRL_TYPE_BITMASK,
>>> +		.min	= 0,
>>> +		.max	= XSDIRX_EDH_ALLERR_MASK,
>>> +		.def	= 0,
>>> +	}, {
>>> +		.ops	= &xsdirxss_ctrl_ops,
>>> +		.id	= V4L2_CID_XILINX_SDIRX_EDH_ERRCNT,
>>> +		.name	= "SDI Rx : EDH Error Count",
>>> +		.type	= V4L2_CTRL_TYPE_INTEGER,
>>> +		.min	= 0,
>>> +		.max	= 0xFFFF,
>>> +		.step	= 1,
>>> +		.def	= 0,
>>> +		.flags  = V4L2_CTRL_FLAG_VOLATILE |
>> V4L2_CTRL_FLAG_READ_ONLY,
>>> +	}, {
>>> +		.ops	= &xsdirxss_ctrl_ops,
>>> +		.id	= V4L2_CID_XILINX_SDIRX_EDH_STATUS,
>>> +		.name	= "SDI Rx : EDH Status",
>>> +		.type	= V4L2_CTRL_TYPE_INTEGER,
>>> +		.min	= 0,
>>> +		.max	= 0xFFFFFFFF,
>>> +		.step	= 1,
>>> +		.def	= 0,
>>> +		.flags  = V4L2_CTRL_FLAG_VOLATILE |
>> V4L2_CTRL_FLAG_READ_ONLY,
>>> +	}
>>> +};
>>> +
>>> +static const struct v4l2_ctrl_config xsdirxss_ctrls[] = {
>>> +	{
>>> +		.ops	= &xsdirxss_ctrl_ops,
>>> +		.id	= V4L2_CID_XILINX_SDIRX_FRAMER,
>>> +		.name	= "SDI Rx : Enable Framer",
>>> +		.type	= V4L2_CTRL_TYPE_BOOLEAN,
>>> +		.min	= false,
>>> +		.max	= true,
>>> +		.step	= 1,
>>> +		.def	= true,
>>> +	}, {
>>> +		.ops	= &xsdirxss_ctrl_ops,
>>> +		.id	= V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW,
>>> +		.name	= "SDI Rx : Video Lock Window",
>>> +		.type	= V4L2_CTRL_TYPE_INTEGER,
>>> +		.min	= 0,
>>> +		.max	= 0xFFFFFFFF,
>>> +		.step	= 1,
>>> +		.def	= XSDIRX_DEFAULT_VIDEO_LOCK_WINDOW,
>>> +	}, {
>>> +		.ops	= &xsdirxss_ctrl_ops,
>>> +		.id	= V4L2_CID_XILINX_SDIRX_SEARCH_MODES,
>>> +		.name	= "SDI Rx : Modes search Mask",
>>> +		.type	= V4L2_CTRL_TYPE_BITMASK,
>>> +		.min	= 0,
>>> +		.max	= XSDIRX_DETECT_ALL_MODES,
>>> +		.def	= XSDIRX_DETECT_ALL_MODES,
>>> +	}, {
>>> +		.ops	= &xsdirxss_ctrl_ops,
>>> +		.id	= V4L2_CID_XILINX_SDIRX_MODE_DETECT,
>>> +		.name	= "SDI Rx : Mode Detect Status",
>>> +		.type	= V4L2_CTRL_TYPE_INTEGER,
>>> +		.min	= XSDIRX_MODE_SD_OFFSET,
>>> +		.max	= XSDIRX_MODE_12GF_OFFSET,
>>> +		.step	= 1,
>>> +		.flags  = V4L2_CTRL_FLAG_VOLATILE |
>> V4L2_CTRL_FLAG_READ_ONLY,
>>> +	}, {
>>> +		.ops	= &xsdirxss_ctrl_ops,
>>> +		.id	= V4L2_CID_XILINX_SDIRX_CRC,
>>> +		.name	= "SDI Rx : CRC Error status",
>>> +		.type	= V4L2_CTRL_TYPE_INTEGER,
>>> +		.min	= 0,
>>> +		.max	= 0xFFFFFFFF,
>>> +		.step	= 1,
>>> +		.def	= 0,
>>> +		.flags  = V4L2_CTRL_FLAG_VOLATILE |
>> V4L2_CTRL_FLAG_READ_ONLY,
>>> +	}, {
>>> +		.ops	= &xsdirxss_ctrl_ops,
>>> +		.id	= V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED,
>>> +		.name	= "SDI Rx : TS is Interlaced",
>>> +		.type	= V4L2_CTRL_TYPE_BOOLEAN,
>>> +		.min	= false,
>>> +		.max	= true,
>>> +		.def	= false,
>>> +		.step	= 1,
>>> +		.flags  = V4L2_CTRL_FLAG_VOLATILE |
>> V4L2_CTRL_FLAG_READ_ONLY,
>>> +	}, {
>>> +		.ops	= &xsdirxss_ctrl_ops,
>>> +		.id	= V4L2_CID_XILINX_SDIRX_ACTIVE_STREAMS,
>>> +		.name	= "SDI Rx : Active Streams",
>>> +		.type	= V4L2_CTRL_TYPE_INTEGER,
>>> +		.min	= 1,
>>> +		.max	= 16,
>>> +		.def	= 1,
>>> +		.step	= 1,
>>> +		.flags  = V4L2_CTRL_FLAG_VOLATILE |
>> V4L2_CTRL_FLAG_READ_ONLY,
>>> +	}, {
>>> +		.ops	= &xsdirxss_ctrl_ops,
>>> +		.id	= V4L2_CID_XILINX_SDIRX_IS_3GB,
>>> +		.name	= "SDI Rx : Is 3GB",
>>> +		.type	= V4L2_CTRL_TYPE_BOOLEAN,
>>> +		.min	= false,
>>> +		.max	= true,
>>> +		.def	= false,
>>> +		.step	= 1,
>>> +		.flags  = V4L2_CTRL_FLAG_VOLATILE |
>> V4L2_CTRL_FLAG_READ_ONLY,
>>> +	}
>>
>> All these controls need to be documented in the header. Some of these controls
>> may turn out to be controls that can be standardized for SDI receivers, others
>> might be more vendor or driver specific.
>>
> 
> I have documented these in the header. But it seems insufficient. Let me add more info in it.
> Most of this is IP specific. Probably Mode detected and Active streams can be standardized.

I'll review this some more when v3 is posted. It's likely I'll discuss this some more
with you.

> 
>>> +};
>>> +
>>> +static const struct v4l2_subdev_core_ops xsdirxss_core_ops = {
>>> +	.log_status = xsdirxss_log_status,
>>> +	.subscribe_event = xsdirxss_subscribe_event,
>>> +	.unsubscribe_event = xsdirxss_unsubscribe_event
>>> +};
>>> +
>>> +static const struct v4l2_subdev_video_ops xsdirxss_video_ops = {
>>> +	.g_frame_interval = xsdirxss_g_frame_interval,
>>> +	.s_stream = xsdirxss_s_stream,
>>> +	.g_input_status = xsdirxss_g_input_status,
>>> +	.query_dv_timings = xsdirxss_query_dv_timings,
>>
>> This is missing g/s_dv_timings. You need to keep track of the current
>> timings in the driver state: typically userspace will query timings and
>> if that returns valid timings it will set them (s_dv_timings). With
>> g_dv_timings the last set timings are returned.
>>
> 
> Thanks for sharing this information. I didn't get the sequence from the current documentation.
> Let me know if there is a standard application that I may refer to for this.

v4l2-ctl does this, actually. streaming_set_cap() in v4l2-ctl-streaming.cpp is what
is used when you run 'v4l2-ctl --stream-mmap'.

> 
>> If the timings change then the driver stops streaming and reports the
>> SOURCE_CHANGE event, at which point userspace will query the new timings.
>>
> 
> The SOURCE_CHANGE event will be generated only after stopping the streaming to the downstream by
> disabling the bridges. The core will always be enabled to detect any other incoming stream. 
> Once a new incoming stream is detected for video_lock_window amount of time,  a video lock interrupt occurs.

I don't quite understand this.

The SOURCE_CHANGE event should be issued when the driver detects that it
lost signal, or a new signal appears, or the stream changes resolution.
I.e. all cases where userspace needs to take action.

>  
>> The reported mediabus format resolution only changes when s_dv_timings
>> is called: it's updated with the new width/height info.
>>
> 
> I will create another v4l2_mbus_framefmt member in the state structure which will be updated with the detected formats in the s_dv_timings.
> Then application may call get/set_fmt(). 
> 
>> In other words: the timings reported by g_dv_timings are controlled by
>> userspace, the timings reported by query_dv_timings reflect the actual
>> timings received on the SDI bus.
>>
> 
> Thanks for this detailed explanation. 😊 
> 
>>> +};
>>> +
>>> +static const struct v4l2_subdev_pad_ops xsdirxss_pad_ops = {
>>> +	.init_cfg = xsdirxss_init_cfg,
>>> +	.get_fmt = xsdirxss_get_format,
>>> +	.set_fmt = xsdirxss_set_format,
>>> +	.enum_mbus_code = xsdirxss_enum_mbus_code,
>>> +	.enum_dv_timings = xsdirxss_enum_dv_timings,
>>
>> This is missing dv_timings_cap.
>>
> 
> I will add this in the next version.
> 
>>> +};
>>> +
>>> +static const struct v4l2_subdev_ops xsdirxss_ops = {
>>> +	.core = &xsdirxss_core_ops,
>>> +	.video = &xsdirxss_video_ops,
>>> +	.pad = &xsdirxss_pad_ops
>>> +};
>>> +
>>> +/* -----------------------------------------------------------------------------
>>> + * Platform Device Driver
>>> + */
>>> +
>>> +static int xsdirxss_parse_of(struct xsdirxss_state *xsdirxss)
>>> +{
>>> +	struct device_node *node = xsdirxss->core.dev->of_node;
>>> +	struct xsdirxss_core *core = &xsdirxss->core;
>>> +	struct device *dev = core->dev;
>>> +	struct fwnode_handle *ep, *rep;
>>> +	int ret;
>>> +	const char *sdi_std;
>>> +
>>> +	core->include_edh = of_property_read_bool(node, "xlnx,include-edh");
>>> +	dev_dbg(dev, "EDH property = %s\n",
>>> +		core->include_edh ? "Present" : "Absent");
>>> +
>>> +	ret = of_property_read_string(node, "xlnx,line-rate", &sdi_std);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "xlnx,line-rate property not found\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	if (!strncmp(sdi_std, "12G_SDI_8DS", XSDIRX_MAX_STR_LENGTH)) {
>>> +		core->mode = XSDIRXSS_SDI_STD_12G_8DS;
>>> +	} else if (!strncmp(sdi_std, "6G_SDI", XSDIRX_MAX_STR_LENGTH)) {
>>> +		core->mode = XSDIRXSS_SDI_STD_6G;
>>> +	} else if (!strncmp(sdi_std, "3G_SDI", XSDIRX_MAX_STR_LENGTH)) {
>>> +		core->mode = XSDIRXSS_SDI_STD_3G;
>>> +	} else {
>>> +		dev_err(dev, "Invalid Line Rate\n");
>>> +		return -EINVAL;
>>> +	}
>>> +	dev_dbg(dev, "SDI Rx Line Rate = %s, mode = %d\n", sdi_std,
>>> +		core->mode);
>>> +
>>> +	ret = of_property_read_u32(node, "xlnx,bpp", &core->bpc);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "failed to get xlnx,bpp\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	if (core->bpc != 10 && core->bpc != 12) {
>>> +		dev_err(dev, "bits per component=%u. Can be 10 or 12 only\n",
>>> +			core->bpc);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
>>> +
>> FWNODE_GRAPH_ENDPOINT_NEXT);
>>> +	if (!ep) {
>>> +		dev_err(dev, "no source port found");
>>> +		ret = -EINVAL;
>>> +		goto dt_parse_done;
>>> +	}
>>> +
>>> +	rep = fwnode_graph_get_remote_endpoint(ep);
>>> +	if (!rep) {
>>> +		dev_err(dev, "no remote sink endpoint found");
>>> +		ret = -EINVAL;
>>> +	}
>>> +
>>> +	fwnode_handle_put(rep);
>>> +dt_parse_done:
>>> +	fwnode_handle_put(ep);
>>> +	return ret;
>>> +}
>>> +
>>> +static int xsdirxss_probe(struct platform_device *pdev)
>>> +{
>>> +	struct v4l2_subdev *subdev;
>>> +	struct xsdirxss_state *xsdirxss;
>>> +	struct xsdirxss_core *core;
>>> +	struct device *dev;
>>> +	int ret;
>>> +	unsigned int num_ctrls, num_edh_ctrls = 0, i;
>>> +
>>> +	xsdirxss = devm_kzalloc(&pdev->dev, sizeof(*xsdirxss), GFP_KERNEL);
>>> +	if (!xsdirxss)
>>> +		return -ENOMEM;
>>> +
>>> +	xsdirxss->core.dev = &pdev->dev;
>>> +	core = &xsdirxss->core;
>>> +	dev = core->dev;
>>> +
>>> +	/* Register interrupt handler */
>>> +	core->irq = platform_get_irq(pdev, 0);
>>> +	ret = devm_request_threaded_irq(dev, core->irq, NULL,
>>> +					xsdirxss_irq_handler, IRQF_ONESHOT,
>>> +					dev_name(dev), xsdirxss);
>>> +	if (ret) {
>>> +		dev_err(dev, "Err = %d Interrupt handler reg failed!\n",
>>> +			ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	core->num_clks = ARRAY_SIZE(xsdirxss_clks);
>>> +	core->clks = devm_kcalloc(dev, core->num_clks,
>>> +				  sizeof(*core->clks), GFP_KERNEL);
>>> +	if (!core->clks)
>>> +		return -ENOMEM;
>>> +
>>> +	for (i = 0; i < core->num_clks; i++)
>>> +		core->clks[i].id = xsdirxss_clks[i];
>>> +
>>> +	ret = devm_clk_bulk_get(dev, core->num_clks, core->clks);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = clk_bulk_prepare_enable(core->num_clks, core->clks);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = xsdirxss_parse_of(xsdirxss);
>>> +	if (ret < 0)
>>> +		goto clk_err;
>>> +
>>> +	core->iomem = devm_platform_ioremap_resource(pdev, 0);
>>> +	if (IS_ERR(core->iomem)) {
>>> +		ret = PTR_ERR(core->iomem);
>>> +		goto clk_err;
>>> +	}
>>> +
>>> +	/* Reset the core */
>>> +	xsdirx_streamflow_control(core, false);
>>> +	xsdirx_core_disable(core);
>>> +	xsdirx_clearintr(core, XSDIRX_INTR_ALL_MASK);
>>> +	xsdirx_disableintr(core, XSDIRX_INTR_ALL_MASK);
>>> +	xsdirx_enableintr(core, XSDIRX_INTR_ALL_MASK);
>>> +	xsdirx_globalintr(core, true);
>>> +	xsdirxss_write(core, XSDIRX_CRC_ERRCNT_REG, 0xFFFF);
>>> +
>>> +	/* Initialize V4L2 subdevice and media entity */
>>> +	xsdirxss->pad.flags = MEDIA_PAD_FL_SOURCE;
>>> +
>>> +	/* Initialize the default format */
>>> +	if (core->bpc == 10)
>>> +		xsdirxss->default_format.code =
>> MEDIA_BUS_FMT_UYVY10_1X20;
>>> +	else
>>> +		xsdirxss->default_format.code =
>> MEDIA_BUS_FMT_UYVY12_1X24;
>>> +	xsdirxss->default_format.field = V4L2_FIELD_NONE;
>>> +	xsdirxss->default_format.colorspace = V4L2_COLORSPACE_DEFAULT;
>>
>> This shouldn't be DEFAULT. Can you explain a bit how colorspace (or
>> colorimetry
>> in general) is determined for SDI?
>>
> 
> That is correct. As mentioned earlier the colorspace in SDI is determined by bit 5 and 4 of byte 3 
> in the 4 byte ST 352 payload as per SMPTE 2081-10:2018
> 
> b5:b4 = 0h identifies Rec 709 colorimetry in accordance with Recommendation ITU-R BT.709 as referenced by SMPTE ST 274
> b5:b4 = 1h identifies that the colorimetry is defined in the Color VANC packet as defined in SMPTE ST 2048-1
> b5:b4 = 2h identifies UHDTV colorimetry in accordance with the reference primaries and reference white as defined in SMPTE ST 2036-1. See Note 2 to Table 3.
> b5:b4 = 3h identifies unknown colorimetry

OK. Based on that I'd pick REC709 as the default colorspace. This will be updated to
the actual colorspace when you receive a new video stream and can extract this information.

> 
>>> +	xsdirxss->default_format.width = XSDIRX_DEFAULT_WIDTH;
>>> +	xsdirxss->default_format.height = XSDIRX_DEFAULT_HEIGHT;
>>> +
>>> +	xsdirxss->format = xsdirxss->default_format;
>>> +
>>> +	/* Initialize V4L2 subdevice and media entity */
>>> +	subdev = &xsdirxss->subdev;
>>> +	v4l2_subdev_init(subdev, &xsdirxss_ops);
>>> +
>>> +	subdev->dev = &pdev->dev;
>>> +	strscpy(subdev->name, dev_name(dev), sizeof(subdev->name));
>>> +
>>> +	subdev->flags |= V4L2_SUBDEV_FL_HAS_EVENTS |
>> V4L2_SUBDEV_FL_HAS_DEVNODE;
>>> +
>>> +	subdev->entity.ops = &xsdirxss_media_ops;
>>> +
>>> +	v4l2_set_subdevdata(subdev, xsdirxss);
>>> +
>>> +	ret = media_entity_pads_init(&subdev->entity, 1, &xsdirxss->pad);
>>> +	if (ret < 0)
>>> +		goto error;
>>> +
>>> +	/* Initialise and register the controls */
>>> +	num_ctrls = ARRAY_SIZE(xsdirxss_ctrls);
>>> +
>>> +	if (core->include_edh)
>>> +		num_edh_ctrls = ARRAY_SIZE(xsdirxss_edh_ctrls);
>>> +
>>> +	v4l2_ctrl_handler_init(&xsdirxss->ctrl_handler,
>>> +			       (num_ctrls + num_edh_ctrls));
>>> +
>>> +	for (i = 0; i < num_ctrls; i++) {
>>> +		struct v4l2_ctrl *ctrl;
>>> +
>>> +		dev_dbg(dev, "%d %s ctrl = 0x%x\n", i, xsdirxss_ctrls[i].name,
>>> +			xsdirxss_ctrls[i].id);
>>> +
>>> +		ctrl = v4l2_ctrl_new_custom(&xsdirxss->ctrl_handler,
>>> +					    &xsdirxss_ctrls[i], NULL);
>>> +		if (!ctrl) {
>>> +			dev_dbg(dev, "Failed to add %s ctrl\n",
>>> +				xsdirxss_ctrls[i].name);
>>> +			goto error;
>>> +		}
>>> +	}
>>> +
>>> +	if (core->include_edh) {
>>> +		for (i = 0; i < num_edh_ctrls; i++) {
>>> +			struct v4l2_ctrl *ctrl;
>>> +
>>> +			dev_dbg(dev, "%d %s ctrl = 0x%x\n", i,
>>> +				xsdirxss_edh_ctrls[i].name,
>>> +				xsdirxss_edh_ctrls[i].id);
>>> +
>>> +			ctrl = v4l2_ctrl_new_custom(&xsdirxss->ctrl_handler,
>>> +						    &xsdirxss_edh_ctrls[i],
>>> +						    NULL);
>>> +			if (!ctrl) {
>>> +				dev_dbg(dev, "Failed to add %s ctrl\n",
>>> +					xsdirxss_edh_ctrls[i].name);
>>> +				goto error;
>>> +			}
>>> +		}
>>> +	}
>>> +
>>> +	if (xsdirxss->ctrl_handler.error) {
>>> +		dev_err(dev, "failed to add controls\n");
>>> +		ret = xsdirxss->ctrl_handler.error;
>>> +		goto error;
>>> +	}
>>> +
>>> +	subdev->ctrl_handler = &xsdirxss->ctrl_handler;
>>> +
>>> +	ret = v4l2_ctrl_handler_setup(&xsdirxss->ctrl_handler);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "failed to set controls\n");
>>> +		goto error;
>>> +	}
>>> +
>>> +	platform_set_drvdata(pdev, xsdirxss);
>>> +
>>> +	ret = v4l2_async_register_subdev(subdev);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "failed to register subdev\n");
>>> +		goto error;
>>> +	}
>>> +
>>> +	xsdirxss->streaming = false;
>>> +
>>> +	xsdirx_core_enable(core);
>>> +
>>> +	dev_info(dev, "probe success\n");
>>> +
>>> +	return 0;
>>> +error:
>>> +	v4l2_ctrl_handler_free(&xsdirxss->ctrl_handler);
>>> +	media_entity_cleanup(&subdev->entity);
>>> +	xsdirx_globalintr(core, false);
>>> +	xsdirx_disableintr(core, XSDIRX_INTR_ALL_MASK);
>>> +clk_err:
>>> +	clk_bulk_disable_unprepare(core->num_clks, core->clks);
>>> +	return ret;
>>> +}
>>> +
>>> +static int xsdirxss_remove(struct platform_device *pdev)
>>> +{
>>> +	struct xsdirxss_state *xsdirxss = platform_get_drvdata(pdev);
>>> +	struct xsdirxss_core *core = &xsdirxss->core;
>>> +	struct v4l2_subdev *subdev = &xsdirxss->subdev;
>>> +
>>> +	v4l2_async_unregister_subdev(subdev);
>>> +	v4l2_ctrl_handler_free(&xsdirxss->ctrl_handler);
>>> +	media_entity_cleanup(&subdev->entity);
>>> +
>>> +	xsdirx_globalintr(core, false);
>>> +	xsdirx_disableintr(core, XSDIRX_INTR_ALL_MASK);
>>> +	xsdirx_core_disable(core);
>>> +	xsdirx_streamflow_control(core, false);
>>> +
>>> +	clk_bulk_disable_unprepare(core->num_clks, core->clks);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct of_device_id xsdirxss_of_id_table[] = {
>>> +	{ .compatible = "xlnx,v-smpte-uhdsdi-rx-ss-2.0" },
>>> +	{ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, xsdirxss_of_id_table);
>>> +
>>> +static struct platform_driver xsdirxss_driver = {
>>> +	.driver = {
>>> +		.name		= "xilinx-sdirxss",
>>> +		.of_match_table	= xsdirxss_of_id_table,
>>> +	},
>>> +	.probe			= xsdirxss_probe,
>>> +	.remove			= xsdirxss_remove,
>>> +};
>>> +
>>> +module_platform_driver(xsdirxss_driver);
>>> +
>>> +MODULE_AUTHOR("Vishal Sagar <vsagar@xilinx.com>");
>>> +MODULE_DESCRIPTION("Xilinx SDI Rx Subsystem Driver");
>>> +MODULE_LICENSE("GPL v2");
>>> diff --git a/include/uapi/linux/xilinx-sdirxss.h b/include/uapi/linux/xilinx-
>> sdirxss.h
>>> new file mode 100644
>>> index 000000000000..6f2a093968d9
>>> --- /dev/null
>>> +++ b/include/uapi/linux/xilinx-sdirxss.h
>>> @@ -0,0 +1,179 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>>> +/*
>>> + * Xilinx SDI Rx Subsystem mode, event, custom timings
>>> + * and flag definitions.
>>> + *
>>> + * Copyright (C) 2019 - 2020 Xilinx, Inc.
>>> + *
>>> + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
>>> + */
>>> +
>>> +#ifndef __UAPI_XILINX_SDIRXSS_H__
>>> +#define __UAPI_XILINX_SDIRXSS_H__
>>> +
>>> +#include <linux/types.h>
>>> +#include <linux/v4l2-dv-timings.h>
>>> +#include <linux/videodev2.h>
>>> +
>>> +/*
>>> + * Events
>>> + *
>>> + * V4L2_EVENT_XILINX_SDIRX_UNDERFLOW: Video in to AXI4 Stream core
>> underflowed
>>> + * V4L2_EVENT_XILINX_SDIRX_OVERFLOW: Video in to AXI4 Stream core
>> overflowed
>>> + */
>>> +#define V4L2_EVENT_XILINX_SDIRX_CLASS
>> (V4L2_EVENT_PRIVATE_START | 0x200)
>>> +#define V4L2_EVENT_XILINX_SDIRX_UNDERFLOW
>> (V4L2_EVENT_XILINX_SDIRX_CLASS | 0x1)
>>> +#define V4L2_EVENT_XILINX_SDIRX_OVERFLOW
>> (V4L2_EVENT_XILINX_SDIRX_CLASS | 0x2)
>>> +
>>> +/*
>>> + * This enum is used to prepare the bitmask of modes to be detected
>>> + */
>>> +enum {
>>> +	XSDIRX_MODE_SD_OFFSET = 0,
>>> +	XSDIRX_MODE_HD_OFFSET,
>>> +	XSDIRX_MODE_3G_OFFSET,
>>> +	XSDIRX_MODE_6G_OFFSET,
>>> +	XSDIRX_MODE_12GI_OFFSET,
>>> +	XSDIRX_MODE_12GF_OFFSET,
>>> +	XSDIRX_MODE_NUM_SUPPORTED,
>>> +};
>>> +
>>> +#define XSDIRX_DETECT_ALL_MODES
>> 	(BIT(XSDIRX_MODE_SD_OFFSET) | \
>>> +					BIT(XSDIRX_MODE_HD_OFFSET) | \
>>> +					BIT(XSDIRX_MODE_3G_OFFSET) | \
>>> +					BIT(XSDIRX_MODE_6G_OFFSET) | \
>>> +					BIT(XSDIRX_MODE_12GI_OFFSET) | \
>>> +					BIT(XSDIRX_MODE_12GF_OFFSET))
>>> +
>>> +/*
>>> + * EDH Error Types
>>> + * ANC - Ancillary Data Packet Errors
>>> + * FF - Full Field Errors
>>> + * AP - Active Portion Errors
>>> + */
>>> +
>>> +#define XSDIRX_EDH_ERRCNT_ANC_EDH_ERR		BIT(0)
>>> +#define XSDIRX_EDH_ERRCNT_ANC_EDA_ERR		BIT(1)
>>> +#define XSDIRX_EDH_ERRCNT_ANC_IDH_ERR		BIT(2)
>>> +#define XSDIRX_EDH_ERRCNT_ANC_IDA_ERR		BIT(3)
>>> +#define XSDIRX_EDH_ERRCNT_ANC_UES_ERR		BIT(4)
>>> +#define XSDIRX_EDH_ERRCNT_FF_EDH_ERR		BIT(5)
>>> +#define XSDIRX_EDH_ERRCNT_FF_EDA_ERR		BIT(6)
>>> +#define XSDIRX_EDH_ERRCNT_FF_IDH_ERR		BIT(7)
>>> +#define XSDIRX_EDH_ERRCNT_FF_IDA_ERR		BIT(8)
>>> +#define XSDIRX_EDH_ERRCNT_FF_UES_ERR		BIT(9)
>>> +#define XSDIRX_EDH_ERRCNT_AP_EDH_ERR		BIT(10)
>>> +#define XSDIRX_EDH_ERRCNT_AP_EDA_ERR		BIT(11)
>>> +#define XSDIRX_EDH_ERRCNT_AP_IDH_ERR		BIT(12)
>>> +#define XSDIRX_EDH_ERRCNT_AP_IDA_ERR		BIT(13)
>>> +#define XSDIRX_EDH_ERRCNT_AP_UES_ERR		BIT(14)
>>> +#define XSDIRX_EDH_ERRCNT_PKT_CHKSUM_ERR	BIT(15)
>>> +
>>> +#define XSDIRX_EDH_ALLERR_MASK		0xFFFF
>>> +
>>> +/* Xilinx DV timings not in mainline yet */
>>> +#define XLNX_V4L2_DV_BT_2048X1080P24 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		74250000, 510, 44, 148, 4, 5, 36, 0, 0, 0, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>> +
>>> +#define XLNX_V4L2_DV_BT_2048X1080P25 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		74250000, 400, 44, 148, 4, 5, 36, 0, 0, 0, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>> +
>>> +#define XLNX_V4L2_DV_BT_2048X1080P30 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		74250000, 66, 20, 66, 4, 5, 36, 0, 0, 0, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>> +
>>> +#define XLNX_V4L2_DV_BT_2048X1080I48 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 1, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		74250000, 329, 44, 329, 2, 5, 15, 3, 5, 15, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>> +
>>> +#define XLNX_V4L2_DV_BT_2048X1080I50 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 1, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		74250000, 274, 44, 274, 2, 5, 15, 3, 5, 15, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>> +
>>> +#define XLNX_V4L2_DV_BT_2048X1080I60 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 1, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		74250000, 66, 20, 66, 2, 5, 15, 3, 5, 15, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>> +
>>> +#define XLNX_V4L2_DV_BT_1920X1080P48 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		148500000, 638, 44, 148, 4, 5, 36, 0, 0, 0, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>> +
>>> +#define XLNX_V4L2_DV_BT_2048X1080P48 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		148500000, 510, 44, 148, 4, 5, 36, 0, 0, 0, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>> +
>>> +#define XLNX_V4L2_DV_BT_2048X1080P50 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		148500000, 400, 44, 148, 4, 5, 36, 0, 0, 0, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>> +
>>> +#define XLNX_V4L2_DV_BT_2048X1080P60 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		148500000, 88, 44, 20, 4, 5, 36, 0, 0, 0, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>> +
>>> +#define XLNX_V4L2_DV_BT_3840X2160P48 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		594000000, 1276, 88, 296, 8, 10, 72, 0, 0, 0, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>> +
>>> +#define XLNX_V4L2_DV_BT_4096X2160P48 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(4096, 2160, 0, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		594000000, 1020, 88, 296, 8, 10, 72, 0, 0, 0, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>> +
>>> +#define XLNX_V4L2_DV_BT_1920X1080I48 { \
>>> +	.type = V4L2_DV_BT_656_1120, \
>>> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 1, \
>>> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
>>> +		148500000, 371, 88, 371, 2, 5, 15, 3, 5, 15, \
>>> +		V4L2_DV_BT_STD_SDI) \
>>> +}
>>
>> Why not add these to v4l2-dv-timings.h? I do need to know on which standard
>> they are based.
>>
> 
> Currently these are based off a timing table used in the corresponding bare metal driver.
> I will try to get the standards from which these are based on.
> Meanwhile I hope it is ok to add them as custom timings.

For now, but this really needs to be sorted. The 2048x1080 timings appear to be
DCI Digital Cinema related. 3840x2160p48 is a CTA-861 timing (VIC 114) and
4096x2160p48 is VIC 115. I'm not sure where the 1920x1080i48 timings come from.

The two CTA-derived timings can definitely be added to v4l2-dv-timings.h.

> 
>>> +
>>> +#endif /* __UAPI_XILINX_SDIRXSS_H__ */
>>> diff --git a/include/uapi/linux/xilinx-v4l2-controls.h
>> b/include/uapi/linux/xilinx-v4l2-controls.h
>>> index b6441fe705c5..e9de65e82642 100644
>>> --- a/include/uapi/linux/xilinx-v4l2-controls.h
>>> +++ b/include/uapi/linux/xilinx-v4l2-controls.h
>>
>> Why is this in a separate header? It seems to me that it makes more sense to
>> have
>> a single public header for this driver.
>>
> 
> I think the xilinx-v4l2-controls.h is created to house all custom controls of Xilinx V4L2 drivers.
> Since the Xilinx Video Test Pattern generator has its controls in the xilinx-v4l2-controls.h,
> I decided to keep the controls in this file and the events in the SDI Rx specific header.

So the TPG controls are shared between different xilinx IP blocks?

Assuming that the controls you add here for your driver are specific to just this
IP block, I would add them to xilinx-sdirxss.h instead.

Looking at xilinx-v4l2-controls.h: it shouldn't set V4L2_CID_XILINX_OFFSET/BASE here,
instead it should reserve the range in v4l2-controls.h. This to ensure CIDs reserved
here do not clash with other CIDs reserved by other drivers.

For the controls specific to this driver I would also reserve your own range in
v4l2-controls.h, rather than taking it from the range reserved by xilinx-v4l2-controls.h.

Regards,

	Hans

> 
>>> @@ -71,4 +71,71 @@
>>>  /* Noise level */
>>>  #define V4L2_CID_XILINX_TPG_NOISE_GAIN
>> 	(V4L2_CID_XILINX_TPG + 17)
>>>
>>> +/*
>>> + * Xilinx SDI Rx Subsystem
>>> + */
>>> +
>>> +/* The base for the sdi rx driver controls.
>>> + * We reserve 32 controls for this driver.
>>> + *
>>> + * The V4L2_CID_XILINX_SDIRX_EDH_* controls are present only if
>>> + * EDH is enabled.
>>> + * The controls which can be set should only be set before enabling
>>> + * streaming. The controls which can be got should be called while
>>> + * streaming to get correct values.
>>> + * The V4L2_CID_XILINX_SDIRX_MODE_DETECT can be called when query
>> dv timing
>>> + * returns a valid timing.
>>> + */
>>> +
>>> +#define V4L2_CID_XILINX_SDIRX
>> 	(V4L2_CID_XILINX_BASE + 0x20)
>>> +
>>> +/* Framer Control to enable or disable the framer */
>>> +#define V4L2_CID_XILINX_SDIRX_FRAMER
>> 	(V4L2_CID_XILINX_SDIRX + 1)
>>> +/*
>>> + * Video Lock Window Control to set the video lock window value
>>> + * This is the amount of time the mode and transport stream need
>>> + * to be locked before a video lock interrupt occurs.
>>> + */
>>> +#define V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW
>> 	(V4L2_CID_XILINX_SDIRX + 2)
>>> +/* EDH Error Mask Control to enable EDH error count */
>>> +#define V4L2_CID_XILINX_SDIRX_EDH_ERRCNT_ENABLE
>> 	(V4L2_CID_XILINX_SDIRX + 3)
>>> +/*
>>> + * Mode search Control to pass the bit mask of modes to detect.
>>> + *
>>> + * bit 0 set to detect SD mode,
>>> + * bit 1 set to detect HD mode,
>>> + * bit 2 set to detect 3G (3GA & 3GB) mode,
>>> + * bit 3 set to detect 6G mode,
>>> + * bit 4 set to detect 12G integer frame rate mode,
>>> + * bit 5 set to detect 12G fractional frame rate mode,
>>> + */
>>> +#define V4L2_CID_XILINX_SDIRX_SEARCH_MODES
>> 	(V4L2_CID_XILINX_SDIRX + 4)
>>> +/*
>>> + * Get Detected Mode control
>>> + *
>>> + * Control Value - Mode detected
>>> + *        0      -     SD
>>> + *        1      -     HD
>>> + *        2      -     3G (3GA & 3GB)
>>> + *        3      -     6G
>>> + *        4      -     12G integer frame rate
>>> + *        5      -     12G fractional frame rate
>>> + */
>>> +#define V4L2_CID_XILINX_SDIRX_MODE_DETECT
>> 	(V4L2_CID_XILINX_SDIRX + 5)
>>> +/* Get number of CRC errors status control */
>>> +#define V4L2_CID_XILINX_SDIRX_CRC
>> 	(V4L2_CID_XILINX_SDIRX + 6)
>>> +/* Get EDH error count control */
>>> +#define V4L2_CID_XILINX_SDIRX_EDH_ERRCNT
>> 	(V4L2_CID_XILINX_SDIRX + 7)
>>> +/* Get EDH status control */
>>> +#define V4L2_CID_XILINX_SDIRX_EDH_STATUS
>> 	(V4L2_CID_XILINX_SDIRX + 8)
>>> +/* Get Transport Interlaced status whether it is interlaced or not */
>>> +#define V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED
>> 	(V4L2_CID_XILINX_SDIRX + 9)
>>> +/* Get number of Active Streams */
>>> +#define V4L2_CID_XILINX_SDIRX_ACTIVE_STREAMS
>> 	(V4L2_CID_XILINX_SDIRX + 10)
>>> +/*
>>> + * Get if the detected mode is 3GB.
>>> + * Can be used to distinguished between 3GA and 3GB
>>> + */
>>> +#define V4L2_CID_XILINX_SDIRX_IS_3GB
>> 	(V4L2_CID_XILINX_SDIRX + 11)
>>> +
>>>  #endif /* __UAPI_XILINX_V4L2_CONTROLS_H__ */
>>>
>>
>> Regards,
>>
>> 	Hans
> 
> Regards
> Vishal Sagar
> 

