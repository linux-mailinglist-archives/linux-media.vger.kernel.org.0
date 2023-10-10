Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7797BF3F7
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 09:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442433AbjJJHUd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 03:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442406AbjJJHUb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 03:20:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E4F9F
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 00:20:30 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31196C433C7;
        Tue, 10 Oct 2023 07:20:27 +0000 (UTC)
Message-ID: <49e32b1d-fd2e-4fd0-bcfe-78ff57adb588@xs4all.nl>
Date:   Tue, 10 Oct 2023 09:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 06/11] v4l2-ctrls: add support for
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Content-Language: en-US, nl
To:     Yunke Cao <yunkec@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20231010022136.1504015-1-yunkec@google.com>
 <20231010022136.1504015-7-yunkec@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231010022136.1504015-7-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

Just one remaining issue:

On 10/10/2023 04:21, Yunke Cao wrote:

<snip>

> @@ -723,17 +741,23 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
>   * @ops:       The control ops.
>   * @id:        The control ID.
>   * @p_def:     The control's default value.
> + * @p_min:     The control's minimum value.
> + * @p_max:     The control's maximum value.
>   *
> - * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
> - * to the @p_def field. Use v4l2_ctrl_ptr_create() to create @p_def from a
> - * pointer. Use v4l2_ctrl_ptr_create(NULL) if the default value of the
> - * compound control should be all zeroes.
> + * Same as v4l2_ctrl_new_std(), but with support to compound controls, thanks
> + * to the @p_def/min/max fields. Use v4l2_ctrl_ptr_create() to create
> + * @p_def/min/max from a pointer. Use v4l2_ctrl_ptr_create(NULL) if the
> + * default, minimum and maximum value of the compound control should be all
> + * zeroes. Use v4l2_ctrl_ptr_create(NULL) if the min/max value of the compound
> + * control is not defined, -ENODATA will be returned in this case.

This still refers to ENODATA, but the text should be improved anyway, even
the original wasn't very good. How about:

 * Same as v4l2_ctrl_new_std(), but with support for compound controls.
 * To fill in the @p_def, @p_min and @p_max fields, use v4l2_ctrl_ptr_create()
 * to convert a pointer to a const union v4l2_ctrl_ptr.
 * Use v4l2_ctrl_ptr_create(NULL) if you want the default, minimum or maximum
 * value of the compound control to be all zeroes.
 * If the compound control does not set the ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX``
 * flag, then it does not has minimum and maximum values. In that case just use
 * v4l2_ctrl_ptr_create(NULL) for the @p_min and @p_max arguments.

>   *
>   */
>  struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
>  					     const struct v4l2_ctrl_ops *ops,
>  					     u32 id,
> -					     const union v4l2_ctrl_ptr p_def);
> +					     const union v4l2_ctrl_ptr p_def,
> +					     const union v4l2_ctrl_ptr p_min,
> +					     const union v4l2_ctrl_ptr p_max);
>  
>  /**
>   * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.

Other than this the controls part of this series looks good to me.

Regards,

	Hans

