Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 625F8776387
	for <lists+linux-media@lfdr.de>; Wed,  9 Aug 2023 17:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233526AbjHIPQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 11:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbjHIPQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 11:16:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4A8FE
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 08:16:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 18825628BA
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 15:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CD5C433C7;
        Wed,  9 Aug 2023 15:16:21 +0000 (UTC)
Message-ID: <924cc21a-a75f-9b5f-b89f-0469660be779@xs4all.nl>
Date:   Wed, 9 Aug 2023 17:16:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v11 06/11] v4l2-ctrls: add support for
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Content-Language: en-US, nl
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Yunke Cao <yunkec@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20230426082923.132909-1-yunkec@google.com>
 <20230426082923.132909-7-yunkec@google.com>
 <da90bdb2-45f4-2ffe-2d62-1190b43fccd5@xs4all.nl>
In-Reply-To: <da90bdb2-45f4-2ffe-2d62-1190b43fccd5@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/08/2023 09:05, Hans Verkuil wrote:
> On 26/04/2023 10:29, Yunke Cao wrote:
>> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>> Add the capability of retrieving the min and max values of a
>> compound control.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Signed-off-by: Yunke Cao <yunkec@google.com>
>> ---
>> Changelog since v10:
>> - No change.
>> Changelog since v9:
>> - No change.
>> Changelog since v8:
>> - Return ENODATA when min/max is not implemented. Document this behavior.
>> - Created a shared helper function __v4l2_ctrl_type_op_init that takes "which"
>>   as a parameter. Call it in def, min and max operations.
>> Changelog since v7:
>> - Document that the definition of the min/max are provided by compound controls
>>   are defined in control documentation.
>> - Return error, instead of zeroed memory for v4l2_ctrl_ptr_create(NULL).
>>
>> git am from https://lore.kernel.org/all/20191119113457.57833-3-hverkuil-cisco@xs4all.nl/
>> - Fixed some merge conflits.
>> - Fixed the build error in drivers/media/platform/qcom/venus.
>>
>>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  11 +-
>>  .../media/videodev2.h.rst.exceptions          |   2 +
>>  drivers/media/i2c/imx214.c                    |   5 +-
>>  .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
>>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  57 +++++--
>>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 156 +++++++++++++++---
>>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
>>  include/media/v4l2-ctrls.h                    |  34 +++-
>>  include/uapi/linux/videodev2.h                |   2 +
>>  9 files changed, 236 insertions(+), 44 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> index 927ef397f1ce..1cc21ee229aa 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> @@ -304,14 +304,21 @@ still cause this situation.
>>        - Which value of the control to get/set/try.
>>      * - :cspan:`2` ``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of
>>  	the control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the default
>> +	value of the control, ``V4L2_CTRL_WHICH_MIN_VAL`` will return the minimum
>> +	value of the control, ``V4L2_CTRL_WHICH_MAX_VAL`` will return the maximum
>>  	value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
>>  	these controls have to be retrieved from a request or tried/set for
>>  	a request. In the latter case the ``request_fd`` field contains the
>>  	file descriptor of the request that should be used. If the device
>>  	does not support requests, then ``EACCES`` will be returned.
>>  
>> -	When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can only
>> -	get the default value of the control, you cannot set or try it.
>> +	When using ``V4L2_CTRL_WHICH_DEF_VAL``, ``V4L2_CTRL_WHICH_MIN_VAL``
>> +	or ``V4L2_CTRL_WHICH_MAX_VAL`` be aware that you can only get the
>> +	default/minimum/maximum value of the control, you cannot set or try it.
>> +	The definition of minimum/maximum values for compound types are provided by
>> +	the control documentation. If the control documentation does not
>> +	document the meaning of minimum/maximum value, then it is not supported.
>> +	Querying its minmimum/maximum value will result in -ENODATA.
> 
> typo: minmimum -> minimum
> 
> That last line is a bit ambiguous, I suggest this:
> 
> If  ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` are not supported,
> then querying the minimum or maximum value will result in -ENODATA.
> 
> Regards,
> 
> 	Hans
> 
>>  
>>  	For backwards compatibility you can also use a control class here
>>  	(see :ref:`ctrl-class`). In that case all controls have to
>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> index 828cca8e2daa..6295b0fa5716 100644
>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> @@ -563,6 +563,8 @@ ignore define V4L2_CTRL_DRIVER_PRIV
>>  ignore define V4L2_CTRL_MAX_DIMS
>>  ignore define V4L2_CTRL_WHICH_CUR_VAL
>>  ignore define V4L2_CTRL_WHICH_DEF_VAL
>> +ignore define V4L2_CTRL_WHICH_MIN_VAL
>> +ignore define V4L2_CTRL_WHICH_MAX_VAL
>>  ignore define V4L2_CTRL_WHICH_REQUEST_VAL
>>  ignore define V4L2_OUT_CAP_CUSTOM_TIMINGS
>>  ignore define V4L2_CID_MAX_CTRLS
>> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
>> index 710c9fb515fd..bd11bd8105aa 100644
>> --- a/drivers/media/i2c/imx214.c
>> +++ b/drivers/media/i2c/imx214.c
>> @@ -1037,7 +1037,10 @@ static int imx214_probe(struct i2c_client *client)
>>  	imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
>>  				NULL,
>>  				V4L2_CID_UNIT_CELL_SIZE,
>> -				v4l2_ctrl_ptr_create((void *)&unit_size));
>> +				v4l2_ctrl_ptr_create((void *)&unit_size),
>> +				v4l2_ctrl_ptr_create(NULL),
>> +				v4l2_ctrl_ptr_create(NULL));
>> +
>>  	ret = imx214->ctrls.error;
>>  	if (ret) {
>>  		dev_err(&client->dev, "%s control init failed (%d)\n",
>> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
>> index 7468e43800a9..28eca8f9d148 100644
>> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
>> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
>> @@ -607,11 +607,16 @@ int venc_ctrl_init(struct venus_inst *inst)
>>  
>>  	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
>>  				   V4L2_CID_COLORIMETRY_HDR10_CLL_INFO,
>> -				   v4l2_ctrl_ptr_create(&p_hdr10_cll));
>> +				   v4l2_ctrl_ptr_create(&p_hdr10_cll),
>> +				   v4l2_ctrl_ptr_create(NULL),
>> +				   v4l2_ctrl_ptr_create(NULL));
>>  
>>  	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
>>  				   V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
>> -				   v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering));
>> +				   v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering),
>> +				   v4l2_ctrl_ptr_create(NULL),
>> +				   v4l2_ctrl_ptr_create(NULL));
>> +
>>  
>>  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
>>  			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE,
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> index 002ea6588edf..f8888568c5df 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> @@ -94,6 +94,34 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
>>  	return ptr_to_user(c, ctrl, ctrl->p_new);
>>  }
>>  
>> +/* Helper function: copy the minimum control value back to the caller */
>> +static int min_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
>> +{
>> +	int idx, ret;
>> +
>> +	for (idx = 0; idx < ctrl->elems; idx++) {
>> +		ret = ctrl->type_ops->minimum(ctrl, idx, ctrl->p_new);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return ptr_to_user(c, ctrl, ctrl->p_new);
>> +}
>> +
>> +/* Helper function: copy the maximum control value back to the caller */
>> +static int max_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
>> +{
>> +	int idx, ret;
>> +
>> +	for (idx = 0; idx < ctrl->elems; idx++) {
>> +		ret = ctrl->type_ops->maximum(ctrl, idx, ctrl->p_new);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return ptr_to_user(c, ctrl, ctrl->p_new);
>> +}
>> +
>>  /* Helper function: copy the caller-provider value as the new control value */
>>  static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
>>  {
>> @@ -229,8 +257,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
>>  		cs->error_idx = i;
>>  
>>  		if (cs->which &&
>> -		    cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
>> -		    cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
>> +		    (cs->which < V4L2_CTRL_WHICH_DEF_VAL ||
>> +		     cs->which > V4L2_CTRL_WHICH_MAX_VAL) &&
>>  		    V4L2_CTRL_ID2WHICH(id) != cs->which) {
>>  			dprintk(vdev,
>>  				"invalid which 0x%x or control id 0x%x\n",
>> @@ -368,8 +396,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
>>   */
>>  static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
>>  {
>> -	if (which == 0 || which == V4L2_CTRL_WHICH_DEF_VAL ||
>> -	    which == V4L2_CTRL_WHICH_REQUEST_VAL)
>> +	if (which == 0 || (which >= V4L2_CTRL_WHICH_DEF_VAL &&
>> +			   which <= V4L2_CTRL_WHICH_MAX_VAL))
>>  		return 0;
>>  	return find_ref_lock(hdl, which | 1) ? 0 : -EINVAL;
>>  }
>> @@ -389,10 +417,12 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>>  	struct v4l2_ctrl_helper *helpers = helper;
>>  	int ret;
>>  	int i, j;
>> -	bool is_default, is_request;
>> +	bool is_default, is_request, is_min, is_max;
>>  
>>  	is_default = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
>>  	is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
>> +	is_min = (cs->which == V4L2_CTRL_WHICH_MIN_VAL);
>> +	is_max = (cs->which == V4L2_CTRL_WHICH_MAX_VAL);
>>  
>>  	cs->error_idx = cs->count;
>>  	cs->which = V4L2_CTRL_ID2WHICH(cs->which);
>> @@ -432,13 +462,14 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>>  
>>  		/*
>>  		 * g_volatile_ctrl will update the new control values.
>> -		 * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL and
>> +		 * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL,
>> +		 * V4L2_CTRL_WHICH_MIN_VAL, V4L2_CTRL_WHICH_MAX_VAL and
>>  		 * V4L2_CTRL_WHICH_REQUEST_VAL. In the case of requests
>>  		 * it is v4l2_ctrl_request_complete() that copies the
>>  		 * volatile controls at the time of request completion
>>  		 * to the request, so you don't want to do that again.
>>  		 */
>> -		if (!is_default && !is_request &&
>> +		if (!is_default && !is_request && !is_min && !is_max &&
>>  		    ((master->flags & V4L2_CTRL_FLAG_VOLATILE) ||
>>  		    (master->has_volatiles && !is_cur_manual(master)))) {
>>  			for (j = 0; j < master->ncontrols; j++)
>> @@ -467,6 +498,10 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>>  				ret = -ENOMEM;
>>  			else if (is_request && ref->p_req_valid)
>>  				ret = req_to_user(cs->controls + idx, ref);
>> +			else if (is_min)
>> +				ret = min_to_user(cs->controls + idx, ref->ctrl);
>> +			else if (is_max)
>> +				ret = max_to_user(cs->controls + idx, ref->ctrl);
>>  			else if (is_volatile)
>>  				ret = new_to_user(cs->controls + idx, ref->ctrl);
>>  			else
>> @@ -564,9 +599,11 @@ int try_set_ext_ctrls_common(struct v4l2_fh *fh,
>>  
>>  	cs->error_idx = cs->count;
>>  
>> -	/* Default value cannot be changed */
>> -	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL) {
>> -		dprintk(vdev, "%s: cannot change default value\n",
>> +	/* Default/minimum/maximum values cannot be changed */
>> +	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL ||
>> +	    cs->which == V4L2_CTRL_WHICH_MIN_VAL ||
>> +	    cs->which == V4L2_CTRL_WHICH_MAX_VAL) {
>> +		dprintk(vdev, "%s: cannot change default/min/max value\n",
>>  			video_device_node_name(vdev));
>>  		return -EINVAL;
>>  	}
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index e7f232842376..4f11cd6855e5 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -177,29 +177,72 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>  	}
>>  }
>>  
>> -void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>> +static int std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>  			    union v4l2_ctrl_ptr ptr)
>> +{
>> +	void *p = ptr.p + idx * ctrl->elem_size;
>> +
>> +	if (!ctrl->p_min.p_const)
>> +		return -ENODATA;

I don't really like having an error return in such a low-level function.

Why not make these functions return void, and do the same as in std_init_compound:

        if (ctrl->p_min.p_const)
                memcpy(p, ctrl->p_min.p_const, ctrl->elem_size);
        else
                memset(p, 0, ctrl->elem_size);

This has the added advantage that if the minimum is all zero, then you don't
need to supply a p_min value.

The actual check if WHICH_MIN_VAL is allowed should take place at a much
higher level, and it can just check for the presence of the new control flag.

Regards,

	Hans

>> +
>> +	memcpy(p, ctrl->p_min.p_const, ctrl->elem_size);
>> +	return 0;
>> +}
>> +
>> +static int std_max_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>> +			    union v4l2_ctrl_ptr ptr)
>> +{
>> +	void *p = ptr.p + idx * ctrl->elem_size;
>> +
>> +	if (!ctrl->p_max.p_const)
>> +		return -ENODATA;
>> +
>> +	memcpy(p, ctrl->p_max.p_const, ctrl->elem_size);
>> +	return 0;
>> +}
>> +
>> +static int __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>> +				    u32 which, union v4l2_ctrl_ptr ptr)
>>  {
>>  	unsigned int i;
>>  	u32 tot_elems = ctrl->elems;
>>  	u32 elems = tot_elems - from_idx;
>> +	s64 value;
>> +	int ret;
>>  
>>  	if (from_idx >= tot_elems)
>> -		return;
>> +		return -EINVAL;
>> +
>> +	switch (which) {
>> +	case V4L2_CTRL_WHICH_DEF_VAL:
>> +		value = ctrl->default_value;
>> +		break;
>> +	case V4L2_CTRL_WHICH_MAX_VAL:
>> +		value = ctrl->maximum;
>> +		break;
>> +	case V4L2_CTRL_WHICH_MIN_VAL:
>> +		value = ctrl->minimum;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>>  
>>  	switch (ctrl->type) {
>>  	case V4L2_CTRL_TYPE_STRING:
>> +		if (which == V4L2_CTRL_WHICH_DEF_VAL)
>> +			value = ctrl->minimum;
>> +
>>  		for (i = from_idx; i < tot_elems; i++) {
>>  			unsigned int offset = i * ctrl->elem_size;
>>  
>> -			memset(ptr.p_char + offset, ' ', ctrl->minimum);
>> -			ptr.p_char[offset + ctrl->minimum] = '\0';
>> +			memset(ptr.p_char + offset, ' ', value);
>> +			ptr.p_char[offset + value] = '\0';
>>  		}
>>  		break;
>>  	case V4L2_CTRL_TYPE_INTEGER64:
>> -		if (ctrl->default_value) {
>> +		if (value) {
>>  			for (i = from_idx; i < tot_elems; i++)
>> -				ptr.p_s64[i] = ctrl->default_value;
>> +				ptr.p_s64[i] = value;
>>  		} else {
>>  			memset(ptr.p_s64 + from_idx, 0, elems * sizeof(s64));
>>  		}
>> @@ -209,9 +252,9 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>>  	case V4L2_CTRL_TYPE_MENU:
>>  	case V4L2_CTRL_TYPE_BITMASK:
>>  	case V4L2_CTRL_TYPE_BOOLEAN:
>> -		if (ctrl->default_value) {
>> +		if (value) {
>>  			for (i = from_idx; i < tot_elems; i++)
>> -				ptr.p_s32[i] = ctrl->default_value;
>> +				ptr.p_s32[i] = value;
>>  		} else {
>>  			memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
>>  		}
>> @@ -221,32 +264,69 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>>  		memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
>>  		break;
>>  	case V4L2_CTRL_TYPE_U8:
>> -		memset(ptr.p_u8 + from_idx, ctrl->default_value, elems);
>> +		memset(ptr.p_u8 + from_idx, value, elems);
>>  		break;
>>  	case V4L2_CTRL_TYPE_U16:
>> -		if (ctrl->default_value) {
>> +		if (value) {
>>  			for (i = from_idx; i < tot_elems; i++)
>> -				ptr.p_u16[i] = ctrl->default_value;
>> +				ptr.p_u16[i] = value;
>>  		} else {
>>  			memset(ptr.p_u16 + from_idx, 0, elems * sizeof(u16));
>>  		}
>>  		break;
>>  	case V4L2_CTRL_TYPE_U32:
>> -		if (ctrl->default_value) {
>> +		if (value) {
>>  			for (i = from_idx; i < tot_elems; i++)
>> -				ptr.p_u32[i] = ctrl->default_value;
>> +				ptr.p_u32[i] = value;
>>  		} else {
>>  			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
>>  		}
>>  		break;
>>  	default:
>> -		for (i = from_idx; i < tot_elems; i++)
>> -			std_init_compound(ctrl, i, ptr);
>> +		for (i = from_idx; i < tot_elems; i++) {
>> +			switch (which) {
>> +			case V4L2_CTRL_WHICH_DEF_VAL:
>> +				std_init_compound(ctrl, i, ptr);
>> +				break;
>> +			case V4L2_CTRL_WHICH_MAX_VAL:
>> +				ret = std_max_compound(ctrl, i, ptr);
>> +				if (ret)
>> +					return ret;
>> +				break;
>> +			case V4L2_CTRL_WHICH_MIN_VAL:
>> +				ret = std_min_compound(ctrl, i, ptr);
>> +				if (ret)
>> +					return ret;
>> +				break;
>> +			}
>> +		}
>>  		break;
>>  	}
>> +
>> +	return 0;
>> +}
>> +
>> +void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>> +			    union v4l2_ctrl_ptr ptr)
>> +{
>> +	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_DEF_VAL, ptr);
>>  }
>>  EXPORT_SYMBOL(v4l2_ctrl_type_op_init);
>>  
>> +static int v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
>> +				     union v4l2_ctrl_ptr ptr)
>> +{
>> +	return __v4l2_ctrl_type_op_init(ctrl, from_idx,
>> +					V4L2_CTRL_WHICH_MIN_VAL, ptr);
>> +}
>> +
>> +static int v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
>> +				     union v4l2_ctrl_ptr ptr)
>> +{
>> +	return __v4l2_ctrl_type_op_init(ctrl, from_idx,
>> +					V4L2_CTRL_WHICH_MAX_VAL, ptr);
>> +}
>> +
>>  void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>>  {
>>  	union v4l2_ctrl_ptr ptr = ctrl->p_cur;
>> @@ -1043,6 +1123,8 @@ EXPORT_SYMBOL(v4l2_ctrl_type_op_validate);
>>  static const struct v4l2_ctrl_type_ops std_type_ops = {
>>  	.equal = v4l2_ctrl_type_op_equal,
>>  	.init = v4l2_ctrl_type_op_init,
>> +	.minimum = v4l2_ctrl_type_op_minimum,
>> +	.maximum = v4l2_ctrl_type_op_maximum,
>>  	.log = v4l2_ctrl_type_op_log,
>>  	.validate = v4l2_ctrl_type_op_validate,
>>  };
>> @@ -1514,7 +1596,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>  			s64 min, s64 max, u64 step, s64 def,
>>  			const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
>>  			u32 flags, const char * const *qmenu,
>> -			const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
>> +			const s64 *qmenu_int,
>> +			const union v4l2_ctrl_ptr p_def,
>> +			const union v4l2_ctrl_ptr p_min,
>> +			const union v4l2_ctrl_ptr p_max,
>>  			void *priv)
>>  {
>>  	struct v4l2_ctrl *ctrl;
>> @@ -1634,6 +1719,14 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>  		handler_set_err(hdl, -ERANGE);
>>  		return NULL;
>>  	}
>> +
>> +	if ((!p_def.p_const && p_min.p_const) ||
>> +	    (p_min.p_const && !p_max.p_const) ||
>> +	    (!p_min.p_const && p_max.p_const)) {
>> +		handler_set_err(hdl, -EINVAL);
>> +		return NULL;
>> +	}
>> +
>>  	err = check_range(type, min, max, step, def);
>>  	if (err) {
>>  		handler_set_err(hdl, err);
>> @@ -1675,6 +1768,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>  
>>  	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
>>  		sz_extra += elem_size;
>> +	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_min.p_const)
>> +		sz_extra += elem_size * 2;
>>  
>>  	ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
>>  	if (ctrl == NULL) {
>> @@ -1740,6 +1835,14 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>  		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
>>  	}
>>  
>> +	if (type >= V4L2_CTRL_COMPOUND_TYPES &&
>> +	    p_min.p_const && p_max.p_const) {
>> +		ctrl->p_min.p = ctrl->p_def.p + elem_size;
>> +		memcpy(ctrl->p_min.p, p_min.p_const, elem_size);
>> +		ctrl->p_max.p = ctrl->p_min.p + elem_size;
>> +		memcpy(ctrl->p_max.p, p_max.p_const, elem_size);
>> +	}
>> +
>>  	ctrl->type_ops->init(ctrl, 0, ctrl->p_cur);
>>  	cur_to_new(ctrl);
>>  
>> @@ -1790,7 +1893,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
>>  			type, min, max,
>>  			is_menu ? cfg->menu_skip_mask : step, def,
>>  			cfg->dims, cfg->elem_size,
>> -			flags, qmenu, qmenu_int, cfg->p_def, priv);
>> +			flags, qmenu, qmenu_int, cfg->p_def, cfg->p_min,
>> +			cfg->p_max, priv);
>>  	if (ctrl)
>>  		ctrl->is_private = cfg->is_private;
>>  	return ctrl;
>> @@ -1815,7 +1919,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
>>  	}
>>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>>  			     min, max, step, def, NULL, 0,
>> -			     flags, NULL, NULL, ptr_null, NULL);
>> +			     flags, NULL, NULL, ptr_null, ptr_null,
>> +			     ptr_null, NULL);
>>  }
>>  EXPORT_SYMBOL(v4l2_ctrl_new_std);
>>  
>> @@ -1848,7 +1953,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
>>  	}
>>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>>  			     0, max, mask, def, NULL, 0,
>> -			     flags, qmenu, qmenu_int, ptr_null, NULL);
>> +			     flags, qmenu, qmenu_int, ptr_null, ptr_null,
>> +			     ptr_null, NULL);
>>  }
>>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
>>  
>> @@ -1880,7 +1986,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
>>  	}
>>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>>  			     0, max, mask, def, NULL, 0,
>> -			     flags, qmenu, NULL, ptr_null, NULL);
>> +			     flags, qmenu, NULL, ptr_null, ptr_null,
>> +			     ptr_null, NULL);
>>  
>>  }
>>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
>> @@ -1888,7 +1995,9 @@ EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
>>  /* Helper function for standard compound controls */
>>  struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
>>  				const struct v4l2_ctrl_ops *ops, u32 id,
>> -				const union v4l2_ctrl_ptr p_def)
>> +				const union v4l2_ctrl_ptr p_def,
>> +				const union v4l2_ctrl_ptr p_min,
>> +				const union v4l2_ctrl_ptr p_max)
>>  {
>>  	const char *name;
>>  	enum v4l2_ctrl_type type;
>> @@ -1902,7 +2011,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
>>  	}
>>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>>  			     min, max, step, def, NULL, 0,
>> -			     flags, NULL, NULL, p_def, NULL);
>> +			     flags, NULL, NULL, p_def, p_min, p_max, NULL);
>>  }
>>  EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
>>  
>> @@ -1926,7 +2035,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
>>  	}
>>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>>  			     0, max, 0, def, NULL, 0,
>> -			     flags, NULL, qmenu_int, ptr_null, NULL);
>> +			     flags, NULL, qmenu_int, ptr_null, ptr_null,
>> +			     ptr_null, NULL);
>>  }
>>  EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
>>  
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 87f163a89c80..1463d55fee0a 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -888,7 +888,9 @@ static bool check_ext_ctrls(struct v4l2_ext_controls *c, unsigned long ioctl)
>>  			return false;
>>  		break;
>>  	case V4L2_CTRL_WHICH_DEF_VAL:
>> -		/* Default value cannot be changed */
>> +	case V4L2_CTRL_WHICH_MIN_VAL:
>> +	case V4L2_CTRL_WHICH_MAX_VAL:
>> +		/* Default, minimum or maximum value cannot be changed */
>>  		if (ioctl == VIDIOC_S_EXT_CTRLS ||
>>  		    ioctl == VIDIOC_TRY_EXT_CTRLS) {
>>  			c->error_idx = c->count;
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index 1846caf9dd53..6feeb18411e4 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -125,6 +125,8 @@ struct v4l2_ctrl_ops {
>>   *
>>   * @equal: return true if all ctrl->elems array elements are equal.
>>   * @init: initialize the value for array elements from from_idx to ctrl->elems.
>> + * @minimum: set the value to the minimum value of the control.
>> + * @maximum: set the value to the maximum value of the control.
>>   * @log: log the value.
>>   * @validate: validate the value for ctrl->new_elems array elements.
>>   *	Return 0 on success and a negative value otherwise.
>> @@ -134,6 +136,10 @@ struct v4l2_ctrl_type_ops {
>>  		      union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2);
>>  	void (*init)(const struct v4l2_ctrl *ctrl, u32 from_idx,
>>  		     union v4l2_ctrl_ptr ptr);
>> +	int (*minimum)(const struct v4l2_ctrl *ctrl, u32 idx,
>> +		       union v4l2_ctrl_ptr ptr);
>> +	int (*maximum)(const struct v4l2_ctrl *ctrl, u32 idx,
>> +		       union v4l2_ctrl_ptr ptr);
>>  	void (*log)(const struct v4l2_ctrl *ctrl);
>>  	int (*validate)(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
>>  };
>> @@ -239,6 +245,12 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
>>   * @p_def:	The control's default value represented via a union which
>>   *		provides a standard way of accessing control types
>>   *		through a pointer (for compound controls only).
>> + * @p_min:	The control's minimum value represented via a union which
>> + *		provides a standard way of accessing control types
>> + *		through a pointer (for compound controls only).
>> + * @p_max:	The control's maximum value represented via a union which
>> + *		provides a standard way of accessing control types
>> + *		through a pointer (for compound controls only).
>>   * @p_cur:	The control's current value represented via a union which
>>   *		provides a standard way of accessing control types
>>   *		through a pointer.
>> @@ -298,6 +310,8 @@ struct v4l2_ctrl {
>>  	} cur;
>>  
>>  	union v4l2_ctrl_ptr p_def;
>> +	union v4l2_ctrl_ptr p_min;
>> +	union v4l2_ctrl_ptr p_max;
>>  	union v4l2_ctrl_ptr p_new;
>>  	union v4l2_ctrl_ptr p_cur;
>>  };
>> @@ -417,6 +431,8 @@ struct v4l2_ctrl_handler {
>>   * @step:	The control's step value for non-menu controls.
>>   * @def:	The control's default value.
>>   * @p_def:	The control's default value for compound controls.
>> + * @p_min:	The control's minimum value for compound controls.
>> + * @p_max:	The control's maximum value for compound controls.
>>   * @dims:	The size of each dimension.
>>   * @elem_size:	The size in bytes of the control.
>>   * @flags:	The control's flags.
>> @@ -446,6 +462,8 @@ struct v4l2_ctrl_config {
>>  	u64 step;
>>  	s64 def;
>>  	union v4l2_ctrl_ptr p_def;
>> +	union v4l2_ctrl_ptr p_min;
>> +	union v4l2_ctrl_ptr p_max;
>>  	u32 dims[V4L2_CTRL_MAX_DIMS];
>>  	u32 elem_size;
>>  	u32 flags;
>> @@ -715,17 +733,23 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
>>   * @ops:       The control ops.
>>   * @id:        The control ID.
>>   * @p_def:     The control's default value.
>> + * @p_min:     The control's minimum value.
>> + * @p_max:     The control's maximum value.
>>   *
>> - * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
>> - * to the @p_def field. Use v4l2_ctrl_ptr_create() to create @p_def from a
>> - * pointer. Use v4l2_ctrl_ptr_create(NULL) if the default value of the
>> - * compound control should be all zeroes.
>> + * Same as v4l2_ctrl_new_std(), but with support to compound controls, thanks
>> + * to the @p_def/min/max fields. Use v4l2_ctrl_ptr_create() to create
>> + * @p_def/min/max from a pointer. Use v4l2_ctrl_ptr_create(NULL) if the
>> + * default value of the compound control should be all zeroes. Use
>> + * v4l2_ctrl_ptr_create(NULL) if the min/max value of the compound control
>> + * is not defined, -ENODATA will be returned in this case.
>>   *
>>   */
>>  struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
>>  					     const struct v4l2_ctrl_ops *ops,
>>  					     u32 id,
>> -					     const union v4l2_ctrl_ptr p_def);
>> +					     const union v4l2_ctrl_ptr p_def,
>> +					     const union v4l2_ctrl_ptr p_min,
>> +					     const union v4l2_ctrl_ptr p_max);
>>  
>>  /**
>>   * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index ce2bd9ac4c47..8870303df713 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1844,6 +1844,8 @@ struct v4l2_ext_controls {
>>  #define V4L2_CTRL_WHICH_CUR_VAL   0
>>  #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
>>  #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
>> +#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
>> +#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
>>  
>>  enum v4l2_ctrl_type {
>>  	V4L2_CTRL_TYPE_INTEGER	     = 1,
> 

