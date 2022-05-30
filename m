Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 675E6537352
	for <lists+linux-media@lfdr.de>; Mon, 30 May 2022 03:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbiE3Bfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 May 2022 21:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbiE3Bfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 May 2022 21:35:50 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0198737AB
        for <linux-media@vger.kernel.org>; Sun, 29 May 2022 18:35:48 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id cx11so1222796pjb.1
        for <linux-media@vger.kernel.org>; Sun, 29 May 2022 18:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2P1Phm9FcVM9/yodwuSvHqte6Kc/hMubGsDnMyeVqiE=;
        b=EldY+2wgobupwqIs76MvPJjpcMzJGVAryGVtEJp6aDmKzz6vuLj88MqYacZaf1wRsN
         53+lYYT0J8dHnULvUNTHFULu5LnbCbt+sGcYXSxm8ir+eVl3u/IVSOsxxeKLSYBRdm92
         RP0xR7bud39zy1TtBGDfLOJl7VSUYzqCILwzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2P1Phm9FcVM9/yodwuSvHqte6Kc/hMubGsDnMyeVqiE=;
        b=0WbU2P9vKZwfTLMhtcuiGM2bqcCHCRc7GX+GcMGOGJP+UItd30ZucCgx9k+EHWfs6d
         n8phXL/nU7Q0TMfBEJWbk4u4i5mEgS7m8/gHH4ywkPP5Iry4Zm16LX9x1pXAEoWwlHI4
         gGdYJKXXemaV4nO8Snb2u6qina4jLAsrCd3heGMP1Uj77DOJXf5GTSIocUEYE/GdcGq/
         gYMFNjP3A4uKsKHqavlWZmLDPomYm3/+NjbRcyJMy2NlUGvVqvoGqo58WNERhKXlpZ8Q
         TBu75OGd+iA6REFbp9HrzWBk3CkyMyf8aUMFsGT1lBdP1UJgkDTqsNQaQzSEUSGLbse1
         axvA==
X-Gm-Message-State: AOAM530o6bSIhQWqSHcYrygOVZS1trhd0IRwKEhhyMhhkMZ0NhH1xFDw
        W1FdPkBJ8GjaObO41Ecap+v+KBDweUArBg==
X-Google-Smtp-Source: ABdhPJxzLzE9q/OSHRH6fy2hMSEdylOyVNRg8v1+O9+tVsyudsWzG8O9s5fj+8IcjfoJPLhUhXFH8Q==
X-Received: by 2002:a17:90b:3884:b0:1df:d9d5:314b with SMTP id mu4-20020a17090b388400b001dfd9d5314bmr20912237pjb.221.1653874548533;
        Sun, 29 May 2022 18:35:48 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:12df:c9ac:bbf6:d8a5])
        by smtp.gmail.com with ESMTPSA id v1-20020aa78081000000b0050dc7628178sm7491894pff.82.2022.05.29.18.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 18:35:47 -0700 (PDT)
Date:   Mon, 30 May 2022 10:35:42 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
Message-ID: <YpQfbsEqOZn/BUWs@google.com>
References: <20220526050744.2431518-1-yunkec@google.com>
 <20220526050744.2431518-2-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526050744.2431518-2-yunkec@google.com>
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/05/26 14:07), Yunke Cao wrote:
> @@ -888,6 +899,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  			return -EINVAL;
>  		break;
>  
> +	case V4L2_CTRL_TYPE_RECT:
> +		rect = p;
> +		if (!rect->width || !rect->height)
> +			return -EINVAL;
> +		break;

Should we allow (0,0,0,0) rectangles or not? From UVC point of view,
I assume that anything that is within GET_MIN/GET_MAX is OK. Is GET_MIN
always guaranteed to be at least (0,0,1,1) or do some firmwares permit
and use (0,0,0,0)? As a "disable ROI" type of thing, for instance.
