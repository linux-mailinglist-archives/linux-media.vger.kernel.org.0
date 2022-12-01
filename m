Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC3763E8B3
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 04:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiLAD7o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 22:59:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiLAD7n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 22:59:43 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B9A97919
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 19:59:42 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id q71so583967pgq.8
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 19:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CA5E7CXviZO8NcCEE+c6W6iaXLpT6dDvIgjsRxbLsfo=;
        b=JaZACzlClOwh6KnGwEyZ1mp5I9XLxxQaXvSO4cmBesw9RusB0mWRwuTAxsHGS3o1/m
         PjYASsYkNbkh6bPegxc9KUnGc/L1+RnQbq8aTPaxht3Tw40ykr4VrFQ5LGps7FGvgnRB
         EaCxOBpifa/sUSqi2fsqT0f6QW9M05nYCyvOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CA5E7CXviZO8NcCEE+c6W6iaXLpT6dDvIgjsRxbLsfo=;
        b=lhzteK6d2R3Osm3qLYF0L8FvihwwoBV+HNUxUbuX81Pbs984D/JsHj7pU8bToR1bq9
         3TCf4RiVi296OnGu4iNqsTNtqWICSd0LwdgX+niZ8QYrx15/JiZ7Ip8w/lk2MzmSm9Yc
         Zs0gKt3sD2+kdIk/nV0y3E6GPBJLqi2IiLBVlFJ+BC2wCzjg6bB3iGU4WVgPqtrDRY0v
         /UdrNk1EwIY8hQNIi4YfU4t4fHn1ONQTW4BZ1ldraLfWDDFDIFCkAB+h/IdE9uBMexJ8
         rZipRXS5UdqWZw51RQyTZRSuDcnS2V5iK2KgmL1JAhr8iGjZZoP7bBvDvcnJ3+4ZI2n9
         /heA==
X-Gm-Message-State: ANoB5pngLiEvE/zfXeLeZ1hIkdgkjgzbW2tM4u+3WWG4xRdJ/rPHyfPX
        0LUKnRP/B7JvnPTLxNhAba9H5A==
X-Google-Smtp-Source: AA0mqf6k2ZmJpadyYUxanDSdUlfqxOz4P/7HdzdQUqx8qloEUtv0dHivwbLzaxWOdAIV+XGlDxLXNA==
X-Received: by 2002:a63:1142:0:b0:477:e0f7:aba3 with SMTP id 2-20020a631142000000b00477e0f7aba3mr25249779pgr.388.1669867182015;
        Wed, 30 Nov 2022 19:59:42 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id w127-20020a628285000000b00574b86040a4sm2145426pfd.3.2022.11.30.19.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 19:59:41 -0800 (PST)
Date:   Thu, 1 Dec 2022 12:59:37 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 09/11 RESEND] media: v4l2: document the usage of
 min/max for V4L2_CTRL_TYPE_RECT
Message-ID: <Y4gmqThuXxDiAHTC@google.com>
References: <20221201023204.2177458-1-yunkec@google.com>
 <20221201023204.2177458-10-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201023204.2177458-10-yunkec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/12/01 11:32), Yunke Cao wrote:
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -447,7 +447,11 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_rect`, containing a rectangle described by
>  	the position of its top-left corner, the width and the height. Units
> -	depend on the use case.
> +	depend on the use case. Use ``V4L2_CTRL_WHICH_MIN_VAL`` and
> +	``V4L2_CTRL_WHICH_MAX_VAL`` to query the range of rectangle sizes. The
> +	top-left corner of the minimum and maximum rectangles should be the
> +	same. For example, a control can have a minimum rectangle of 1x1@0x0 and
> +	a maximum of 640x480@0x0.

I assume that examples use width-height@top-left convention. Is this common
or should it be 0x0@1x1 and 0x0@640x480?
