Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7E367AEC1
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 10:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbjAYJu6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 04:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbjAYJu5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 04:50:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C4B13F
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 01:50:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5A5FF61456
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 09:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD11C4339B;
        Wed, 25 Jan 2023 09:50:53 +0000 (UTC)
Message-ID: <ecfa6a63-b115-f41e-aef0-26f09979e805@xs4all.nl>
Date:   Wed, 25 Jan 2023 10:50:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4] media: Add AV1 uAPI
Content-Language: en-US
To:     Daniel Almeida <daniel.almeida@collabora.com>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20230103154832.6982-1-daniel.almeida@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230103154832.6982-1-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/3/23 16:48, Daniel Almeida wrote:
> This patch adds the  AOMedia Video 1 (AV1) kernel uAPI.
> 
> This design is based on currently available AV1 API implementations and
> aims to support the development of AV1 stateless video codecs
> on Linux.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Co-Developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>


> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 29169170880a..1752e56ed594 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -350,6 +350,19 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
>  		pr_cont("HEVC_DECODE_PARAMS");
>  		break;
> +	case V4L2_CTRL_TYPE_AV1_SEQUENCE:
> +		pr_cont("AV1_SEQUENCE");
> +		break;
> +	case V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY:
> +		pr_cont("AV1_TILE_GROUP_ENTRY");
> +		break;
> +	case V4L2_CTRL_TYPE_AV1_FRAME:
> +		pr_cont("AV1_FRAME");
> +		break;
> +	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
> +		pr_cont("AV1_FILM_GRAIN");
> +		break;
> +
>  	default:
>  		pr_cont("unknown type %d", ctrl->type);
>  		break;
> @@ -547,6 +560,233 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
>  	return 0;
>  }
>  
> +static int validate_av1_quantization(struct v4l2_av1_quantization *q)
> +{
> +	if (q->flags > GENMASK(2, 0))
> +		return -EINVAL;
> +
> +	if (q->delta_q_y_dc < -64 || q->delta_q_y_dc > 63 ||
> +	    q->delta_q_u_dc < -64 || q->delta_q_u_dc > 63 ||
> +	    q->delta_q_v_dc < -64 || q->delta_q_v_dc > 63 ||
> +	    q->delta_q_u_ac < -64 || q->delta_q_u_ac > 63 ||
> +	    q->delta_q_v_ac < -64 || q->delta_q_v_ac > 63 ||
> +	    q->delta_q_res > GENMASK(1, 0))
> +		return -EINVAL;
> +
> +	if (q->qm_y > GENMASK(3, 0) ||
> +	    q->qm_u > GENMASK(3, 0) ||
> +	    q->qm_v > GENMASK(3, 0))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int validate_av1_segmentation(struct v4l2_av1_segmentation *s)
> +{
> +	u32 i;
> +	u32 j;
> +	s32 limit;
> +
> +	if (s->flags > GENMASK(4, 0))
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(s->feature_data); i++) {
> +		const int segmentation_feature_signed[] = { 1, 1, 1, 1, 1, 0, 0, 0 };
> +		const int segmentation_feature_max[] = { 255, 63, 63, 63, 63, 7, 0, 0};
> +
> +		for (j = 0; j < ARRAY_SIZE(s->feature_data[j]); j++) {
> +			if (segmentation_feature_signed[j]) {
> +				limit = segmentation_feature_max[j];
> +
> +				if (s->feature_data[i][j] < -limit ||
> +				    s->feature_data[i][j] > limit)
> +					return -EINVAL;
> +			} else {
> +				if (s->feature_data[i][j] > limit)
> +					return -EINVAL;

I'm getting this compiler warning:

In function 'validate_av1_segmentation',
    inlined from 'validate_av1_frame' at drivers/media/v4l2-core/v4l2-ctrls-core.c:711:8,
    inlined from 'std_validate_compound' at drivers/media/v4l2-core/v4l2-ctrls-core.c:1155:10,
    inlined from 'std_validate_elem' at drivers/media/v4l2-core/v4l2-ctrls-core.c:1243:10,
    inlined from 'v4l2_ctrl_type_op_validate' at drivers/media/v4l2-core/v4l2-ctrls-core.c:1274:9:
drivers/media/v4l2-core/v4l2-ctrls-core.c:605:36: warning: 'limit' may be used uninitialized [-Wmaybe-uninitialized]
  605 |                                 if (s->feature_data[i][j] > limit)
      |                                    ^
drivers/media/v4l2-core/v4l2-ctrls-core.c: In function 'v4l2_ctrl_type_op_validate':
drivers/media/v4l2-core/v4l2-ctrls-core.c:588:13: note: 'limit' was declared here
  588 |         s32 limit;
      |             ^~~~~

> +			}
> +		}
> +	}
> +
> +	return 0;
> +}

Regards,

	Hans

