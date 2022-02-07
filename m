Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEC7D4ABED8
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 14:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383478AbiBGMsR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 07:48:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390527AbiBGLy5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 06:54:57 -0500
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 03:51:47 PST
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB7EC0401C5
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 03:51:46 -0800 (PST)
X-KPN-MessageId: 1b58e454-880c-11ec-a7c6-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 1b58e454-880c-11ec-a7c6-005056992ed3;
        Mon, 07 Feb 2022 12:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=GZ2AjlFVt2+YvJZOUYRyUEcVpvavTqFHijMlI0g7s7Y=;
        b=JYYoVDqDIM5cw7EdrD3JwsbWcDrr+GcNfIGho/Usqp4MdJlpvCja7KlXCmKPBIC4ljmGxKsIWN7ot
         RXhboFU/n9W/7Md8Dd26q2eH+QOi1bSk4srqP5WjgR5qTBMUZxDaUynOXgJxM2gKFDUV1AyS1cNK9h
         7ZrGkNajpGpcXbPQHCTrYvlCArwASZB+mMJCG6KwTNYfukdlp9fxo/u6myiDbuLO8aOmzEf/yhN0nH
         nT/PjRusDCjYA3Czv30+bQkL9DKncLfwQB3ZNp1k9v6LoCTZmK3GsEyM27L9dSMW+SGW6ZvOg/nRVw
         Q4jmF43FP18mymzclr2T9PcFxriMEoQ==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|rr1zOIjzRiJDJLhfq4o1Ve5Uggoms8xfVF2BoVa7dOEzgSrucYQy88h2q1z+b5X
 pQWfHmUBRjD0xHv7NNhFU9A==
X-Originating-IP: 173.38.220.45
Received: from [10.47.77.219] (unknown [173.38.220.45])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 2d05914b-880c-11ec-ab3c-00505699d6e5;
        Mon, 07 Feb 2022 12:50:42 +0100 (CET)
Message-ID: <57dde179-ae21-70f0-a3fd-56ca0c880a50@xs4all.nl>
Date:   Mon, 7 Feb 2022 12:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [bug report] media: v4l2-ctrls: split up into four source files
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org
References: <20220207113424.GA28058@kili>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220207113424.GA28058@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 2/7/22 12:34, Dan Carpenter wrote:
> [ This code is older, but it showed up as a new warning because of
>   moving the files around - dan ]
> 
> Hello Hans Verkuil,
> 
> The patch 71c689dc2e73: "media: v4l2-ctrls: split up into four source
> files" from Apr 27, 2021, leads to the following Smatch static
> checker warning:
> 
> drivers/media/v4l2-core/v4l2-ctrls-api.c:374 v4l2_g_ext_ctrls_common() warn: uncapped user size for kvmalloc() will WARN
> drivers/media/v4l2-core/v4l2-ctrls-api.c:545 try_set_ext_ctrls_common() warn: uncapped user size for kvmalloc() will WARN
> 
> drivers/media/v4l2-core/v4l2-ctrls-api.c
>     351 int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>     352                             struct v4l2_ext_controls *cs,
>     353                             struct video_device *vdev)
>     354 {
>     355         struct v4l2_ctrl_helper helper[4];
>     356         struct v4l2_ctrl_helper *helpers = helper;
>     357         int ret;
>     358         int i, j;
>     359         bool is_default, is_request;
>     360 
>     361         is_default = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
>     362         is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
>     363 
>     364         cs->error_idx = cs->count;
>     365         cs->which = V4L2_CTRL_ID2WHICH(cs->which);
>     366 
>     367         if (!hdl)
>     368                 return -EINVAL;
>     369 
>     370         if (cs->count == 0)
>     371                 return class_check(hdl, cs->which);
>     372 
>     373         if (cs->count > ARRAY_SIZE(helper)) {
> --> 374                 helpers = kvmalloc_array(cs->count, sizeof(helper[0]),
> 
> These days if "cs->count" is larger than INT_MAX it will trigger a
> WARN() because basically "people shouldn't be so trusting of user
> space".  kvmalloc() used to be able to allocate more than INT_MAX but
> that led to integer overflow problmes and security bugs.
> 
> This "cs->count" value comes from the user via the ioctl.  I don't know
> what a sensible upper bound is though.

cs->count is capped to 1024 in drivers/media/v4l2-core/v4l2-ioctl.c.
Search for V4L2_CID_MAX_CTRLS.

There is no way for smatch to know this of course.

Regards,

	Hans

> 
>     375                                          GFP_KERNEL);
>     376                 if (!helpers)
>     377                         return -ENOMEM;
>     378         }
>     379 
> 
> regards,
> dan carpenter

