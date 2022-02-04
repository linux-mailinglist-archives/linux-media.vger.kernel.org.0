Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76C784A9D47
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 18:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376712AbiBDRBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 12:01:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233140AbiBDRBL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 12:01:11 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5102AC061714
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 09:01:11 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id 13so5191156qkd.13
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 09:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=YUS18KFfT9VUZs8Qo16nHD49iHYObzaK1qYKfTRi7C4=;
        b=pKJ3m0nKe8d0bOpQS73vIvI/Uq96WU2Q7uXS+zrsG+lSXb+U9zHwyeGlq2gJVRsfTL
         /cvaV9JAESutnTBXzoxD4549TK1Ji0POEWyVy7z7NCpDnpIizry+BluVtVXBgQ574qLn
         oXFp31Z/nDy1EslhlJv6rQ0IqDy5+j6jrP8ClPf2dj3WZrJZHU9XUj2ApuTT3mfiXXd8
         coij/J4gZsMMOAfz7rffmjjdeFfVZL0rdJNnMeEr3qjS6IcmhXN45kuN1fj2Y8uSZMkJ
         H4J0NlnNscNDlU8nw3OUdPJUQFq84j9VuVU7xoo4YBYUJSItfV6Dyh9aVR2OxyhfyCzU
         kk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YUS18KFfT9VUZs8Qo16nHD49iHYObzaK1qYKfTRi7C4=;
        b=YcZC+i8jikZ5Mnzj8wXpeY6f0iH0ZuwB9pvQS1luMGIDeFg+c68xx09M6uApSDvBBv
         2OrdMGiQxnYkoBGjZ73cygSSXAe6B2QZLqPDEm74l5GKzmjE/5+RNGduhVQ5w9mmWIsF
         jtsQHHhk3Sa4wKCBxBQbpKXQGpHptW/OXunRSjlksZFGLqxN9H5DM2MN2NW0nHi55iii
         EEYyUto5VL9Yz5WqQQoLkkcjRGY6OMudajWTAngEnjWhFtxvAQ179n8jBh4g7TgWwk3e
         0NSVh4cmdpOFOw49ArNVisoB2M8OTG88sEk03czblR1o82B2fKqZG0k0/yFLPSOYY0+9
         ioxA==
X-Gm-Message-State: AOAM533LtV2xGR39H+vSNGZyhtifi1m6p/mAhf8PvfB8ZaySpuUrpVsj
        JrRf15mEb2fB/fTzFhARVdeGuw==
X-Google-Smtp-Source: ABdhPJwa0M5plybqXxGaTXFHfu/CVyn+4lk7JG4ii/ztRVXt+Bj032E243bEBl6YybeT3fUB9hl59w==
X-Received: by 2002:a05:620a:25d2:: with SMTP id y18mr14714qko.522.1643994070209;
        Fri, 04 Feb 2022 09:01:10 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id y18sm1419719qtj.33.2022.02.04.09.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 09:01:09 -0800 (PST)
Message-ID: <0ad45e7fea33c3c5f7c3f4e58de06716e2b84db8.camel@ndufresne.ca>
Subject: Re: [RFC PATCHv2 01/11] videodev2.h: add
 V4L2_CTRL_FLAG_DYNAMIC_ARRAY
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>
Date:   Fri, 04 Feb 2022 12:01:08 -0500
In-Reply-To: <20210610113615.785359-2-hverkuil-cisco@xs4all.nl>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
         <20210610113615.785359-2-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Le jeudi 10 juin 2021 à 13:36 +0200, Hans Verkuil a écrit :
> Add a new flag that indicates that this control is a dynamically sized
> array. Also document this flag.
> 
> Currently dynamically sized arrays are limited to one dimensional arrays,
> but that might change in the future if there is a need for it.
> 
> The initial use-case of dynamic arrays are stateless codecs. A frame
> can be divided in many slices, so you want to provide an array containing
> slice information for each slice. Typically the number of slices is small,
> but the standard allow for hundreds or thousands of slices. Dynamic arrays
> are a good solution since sizing the array for the worst case would waste
> substantial amounts of memory.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../userspace-api/media/v4l/vidioc-queryctrl.rst          | 8 ++++++++
>  include/uapi/linux/videodev2.h                            | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 07e54029e1e9..a1a0dbff4a6f 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -601,6 +601,14 @@ See also the examples in :ref:`control`.
>  	``V4L2_CTRL_FLAG_GRABBED`` flag when buffers are allocated or
>  	streaming is in progress since most drivers do not support changing
>  	the format in that case.
> +    * - ``V4L2_CTRL_FLAG_DYNAMIC_ARRAY``
> +      - 0x0800
> +      - This control is a dynamically sized 1-dimensional array. It
> +        behaves the same as a regular array, except that the number
> +	of elements as reported by the ``elems`` field is between 1 and
> +	``dims[0]``. So setting the control with a differently sized

The minimum of 1 item is indeed logical for slices (or tiles in AV1), but I
think we should remove this limitation so it won't get in the way in other
applications. There is otherwise no way (other then creating a "invalid entry"
value) to signal that the array is now empty. The driver could erroneously endup
using ancient values.

Perhaps this can be waved later when we need it ? Would that be backward
compatible ?

> +	array will change the ``elems`` field when the control is
> +	queried afterwards.
>  
>  Return Value
>  ============
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9260791b8438..7222fc855d6b 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1869,6 +1869,7 @@ struct v4l2_querymenu {
>  #define V4L2_CTRL_FLAG_HAS_PAYLOAD	0x0100
>  #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
>  #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
> +#define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
>  
>  /*  Query flags, to be ORed with the control ID */
>  #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000

