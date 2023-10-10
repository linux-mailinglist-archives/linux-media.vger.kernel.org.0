Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9670B7BF6D7
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 11:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjJJJIk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 05:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjJJJIj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 05:08:39 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF839E
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 02:08:37 -0700 (PDT)
X-KPN-MessageId: 9774cb8b-674c-11ee-b94e-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 9774cb8b-674c-11ee-b94e-005056992ed3;
        Tue, 10 Oct 2023 11:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=n1slqu+baa24hrS6Lsd3UWyqERC5xz/0PURgq7sisE4=;
        b=SdY3DufIboYY5/dO6kGDOigec1noOBaXAVvsSXzJ5unlJ0kzQWDsHTH6p2i2pZYlwnW12/9mkGoww
         mffdY2xeu4Ixw47pSLhtK1xKmNXJnE7kYVJuIt69t0faVSNrVE6oHb8yuUju5KXix+AE0iqnROqedV
         wiA7txe6DVQFFGJBKBymfkHHL3PIUsa/GmIv3iDE8JMm3LvfwfJ/khCTM7+nX4SlDd7E3nuUELt/oS
         x4fSGe3liOuV+fRTquZxBVXVq0OcE986GAYUkIDolj/LZ1QbxB62rAbgaT5RsutTFQ1OcajJeiJ2fL
         kZA7eeOkTFr6ZrehJUWiwRy/xrP2ggw==
X-KPN-MID: 33|Ay7bZpQoZhPECcnP29neRqH41yaytEjYpE29O8eForRJrUdmbjBbrBpVddW4gvp
 loe96yVO4bfNbBLJfqD0vvw==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|kadEyR60RjoduH3q9OZDks3qZgtcdEsU3j78MBvF91sWTGVLWfMd0YJmIhdD9fB
 D2jzM3QQS4isqxowBq9h+ug==
X-Originating-IP: 173.38.220.40
Received: from [10.47.78.242] (unknown [173.38.220.40])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 97a27ba5-674c-11ee-acaa-00505699d6e5;
        Tue, 10 Oct 2023 11:08:35 +0200 (CEST)
Message-ID: <cff0d02f-0267-4421-85f7-fc31bf56c49f@xs4all.nl>
Date:   Tue, 10 Oct 2023 11:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] v4l2-utils: Support V4L2_CTRL_WHICH_MIN/MAX_VAL
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>, linux-media@vger.Kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>
References: <20230817072537.2837504-1-yunkec@google.com>
 <20230817072537.2837504-3-yunkec@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230817072537.2837504-3-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/17/23 09:25, Yunke Cao wrote:
> Add string name for V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX.
> 
> Test that V4L2_CTRL_WHICH_MIN/MAX_VAL behaves as expected.
> 1. Calling G_EXT_CTRLS successes when V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX is set
>    and returns -ENVALID if the flag is not set.
> 2. S_EXT_CTRLS and TRY_EXT_CTRLS always return fail.
> 
> Tested with VIVID:
> 
> ./v4l2-ctl -l -d 0
> ...
> 		     area 0x0098f90b (area)   : value=1000x2000 flags=has-payload
> read_only_integer_32_bits 0x0098f90c (int)    : min=0 max=255 step=1 default=0 value=0 flags=read-only, has-min-max
>         u32_dynamic_array 0x0098f90d (u32)    : min=10 max=90 step=1 default=50 elems=1 dims=[100] flags=has-payload, dynamic-array
> 	   u8_pixel_array 0x0098f90e (u8)     : min=0 max=255 step=1 default=128 dims=[640][368] flags=has-payload
>       s32_2_element_array 0x0098f90f (int)    : min=-10 max=10 step=1 default=2 dims=[2] flags=has-payload, has-min-max
>       s64_5_element_array 0x0098f910 (int64)  : min=-10 max=10 step=1 default=4 dims=[5] flags=has-payload, has-min-max
> 		     rect 0x0098f911 (rect)   : value=300x400@200x100 flags=has-payload, has-min-max
> ...
> ./v4l2-compliance -d 0
> ...
> Total for vivid device /dev/video0: 113, Succeeded: 113, Failed: 0, Warnings: 0
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  include/linux/videodev2.h                    |  3 ++
>  utils/common/v4l2-info.cpp                   |  1 +
>  utils/v4l2-compliance/v4l2-test-controls.cpp | 29 ++++++++++++++++++++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
> index a27ea755..28a54e18 100644
> --- a/include/linux/videodev2.h
> +++ b/include/linux/videodev2.h
> @@ -1801,6 +1801,8 @@ struct v4l2_ext_controls {
>  #define V4L2_CTRL_WHICH_CUR_VAL   0
>  #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
>  #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
> +#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
> +#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
>  
>  enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_INTEGER	     = 1,
> @@ -1903,6 +1905,7 @@ struct v4l2_querymenu {
>  #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
>  #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
>  #define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
> +#define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX 0x1000
>  
>  /*  Query flags, to be ORed with the control ID */
>  #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000

Same as with the previous patch: just keep all the videodev2.h changes
in a single patch at the start of the series.

> diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
> index 4f8c2aa7..b8785245 100644
> --- a/utils/common/v4l2-info.cpp
> +++ b/utils/common/v4l2-info.cpp
> @@ -530,6 +530,7 @@ std::string ctrlflags2s(__u32 flags)
>  		{ V4L2_CTRL_FLAG_EXECUTE_ON_WRITE, "execute-on-write" },
>  		{ V4L2_CTRL_FLAG_MODIFY_LAYOUT, "modify-layout" },
>  		{ V4L2_CTRL_FLAG_DYNAMIC_ARRAY, "dynamic-array" },
> +		{ V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX, "has-min-max" },
>  		{ 0, nullptr }
>  	};
>  	return flags2s(flags, def);
> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> index d7f6be43..e07269e6 100644
> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> @@ -973,6 +973,26 @@ int testExtendedControls(struct node *node)
>  		if (is_vivid && ctrl.id == VIVID_CID_U32_DYN_ARRAY &&
>  		    checkVividDynArray(node, ctrl, qctrl))
>  			return fail("dynamic array tests failed\n");
> +
> +		ctrls.which = V4L2_CTRL_WHICH_MIN_VAL;
> +		ret = doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls);
> +		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
> +			if (ret)
> +				return fail("g_ext_ctrls return an error when using WHICH_MIN (%d)\n", ret);

Just use fail_on_test_val();

> +		} else {
> +			if (ret != EINVAL && ret != EACCES)
> +				return fail("did not check against HAS_WHICH_MIN_MAX\n");

Ditto.

But can EACCES be returned here? I don't think that can ever happen.

> +		}
> +		ctrls.which = V4L2_CTRL_WHICH_MAX_VAL;
> +		ret = doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls);
> +		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
> +			if (ret)
> +				return fail("g_ext_ctrls return an error when using WHICH_MAX (%d)\n", ret);
> +		} else {
> +			if (ret != EINVAL && ret != EACCES)
> +				return fail("did not check against HAS_WHICH_MIN_MAX\n");
> +		}

Same comments as above.

> +
>  		if (qctrl.flags & V4L2_CTRL_FLAG_HAS_PAYLOAD)
>  			delete [] ctrl.string;
>  		ctrl.string = nullptr;
> @@ -1084,6 +1104,15 @@ int testExtendedControls(struct node *node)
>  	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
>  	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
>  	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
> +
> +	ctrls.which = V4L2_CTRL_WHICH_MIN_VAL;
> +	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
> +	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
> +
> +	ctrls.which = V4L2_CTRL_WHICH_MAX_VAL;
> +	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
> +	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
> +
>  	return 0;
>  }
>  

Regards,

	Hans
