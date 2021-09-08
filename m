Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107CF403A66
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242632AbhIHNPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235591AbhIHNPv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:15:51 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1208C061757
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:14:43 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id m11so3148555ioo.6
        for <linux-media@vger.kernel.org>; Wed, 08 Sep 2021 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9AWLsCDYF19VBZt29/1wFXKnU5Wu0IewL+gdugok5k4=;
        b=sr1iRSJRv2RMjzZkx+NVWb9UiITjqaz7jLHcCeY8vqsxOOk8rlka234eX7+4IvSQvV
         tZeBObuYx6RP4D2apnPfSl5VtUu0qGTv9m3/0BU4/a2lAhA/ch4rSPA2+hZXVr8Klmb3
         4EY+yENKx0qUZKfCit0UC75SGfWDlCjSTJJVOhkCfo3WdWQEHZ6eNG7KYKxfba48fCKm
         RR8m4xi/ZOczFKBxSnT1TkK0XcRWzJCnNDfbkAJce/r9SrYRGuJShoJIYgKYWYjr1DAu
         xmuUA4VDZFgRD0kyiqWAfPNcAOhLn3fgfu7TkUlKJ8mmxJz313LwYQG2nZL5ARr9zich
         VuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9AWLsCDYF19VBZt29/1wFXKnU5Wu0IewL+gdugok5k4=;
        b=jW4TuamnDSMO1rDvyKJRhPb9iwNnz4FzAcxZvEqnT5s/YczPAmlDxx31CiDEFtVOth
         7YjPH2aT4kfjIwYY/Mpk4LROYDxzWQ3Ho5lrirbBDPtzXmUwuxexf/ZHVea9WT+WSWZb
         fn7QvL211iOg9ayhC9Go3ucrT5KBW/tPoT3hb7CUVHnyJP2YmYRHsBpmrAEtDTPReM3H
         UPxDloWSgtLlPCOBXdn5DUMKwjhNmVV1ETkQ+d3cfMrnBpvDMaNRG5rayxbnF+7Icqur
         7YquHEjqj/cRSvJ9jgvu0udeKYUbpdg5f4PdN414xinqwQUZa7QtN1u1+BZZ4SxhIWSi
         wzjw==
X-Gm-Message-State: AOAM532YBBLKb5sS/4Oj3NNppgf4y/mJX3ktdrSGHKO6vls/aSLN6q0u
        an5foVXAo5SXlGhgchrHFaC56g==
X-Google-Smtp-Source: ABdhPJyWFl6KMFrtk5M9MJcMSw4+SUThhgT1lPNNKFYX405JAiBqjMMEMUn2p1h9anfKUlY/gPEatQ==
X-Received: by 2002:a5d:9681:: with SMTP id m1mr3244017ion.113.1631106883049;
        Wed, 08 Sep 2021 06:14:43 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id t10sm1130127iol.34.2021.09.08.06.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 06:14:42 -0700 (PDT)
Message-ID: <79cdfe0af999f574642314289e1734df5e2032eb.camel@ndufresne.ca>
Subject: Re: [PATCH v8 03/15] media:Add v4l2 buf flag codec data.
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Wed, 08 Sep 2021 09:14:40 -0400
In-Reply-To: <7ef1840137417c33f5ef7ca611c90fc274926851.1631002447.git.ming.qian@nxp.com>
References: <cover.1631002447.git.ming.qian@nxp.com>
         <7ef1840137417c33f5ef7ca611c90fc274926851.1631002447.git.ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming,

thanks for the patch. I'm doing a first pass review of the new APIs you are
introducing.

Le mardi 07 septembre 2021 à 17:49 +0800, Ming Qian a écrit :
> In some decoing scenarios, application may queue a buffer
> that only contains codec config data, and the driver needs to
> know whether is it a frame or not.
> So we add a buf flag to tell this case.
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> ---
>  Documentation/userspace-api/media/v4l/buffer.rst | 7 +++++++
>  include/uapi/linux/videodev2.h                   | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index e991ba73d873..11013bcf8a41 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -607,6 +607,13 @@ Buffer Flags
>  	the format. Any subsequent call to the
>  	:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl will not block anymore,
>  	but return an ``EPIPE`` error code.
> +    * .. _`V4L2-BUF-FLAG-CODECCONFIG`:
> +
> +      - ``V4L2_BUF_FLAG_CODECCONFIG``
> +      - 0x00200000
> +      - The buffer only contains codec config data, eg. sps and pps.
> +    Applications can set this bit when ``type`` refers to an output
> +    stream, this flag is usually used by v4l2 decoder.

Currently, the bottom line is that all decoders needs a frame or field
accompanied with the headers (only Annex B. being defined and supported for
now). Decoders can be more flexible (and some are). The documentation here is
not clear enough, remember that we must not break compatibility.

I think you have to clarify the intention. This flag exist in OMX and have been
source of confusion and inter-operability since the start.

- If this flag is entirely optional, and is just an optimization, then adding it
this way is fine, but the documentation should be updated.

- If this flag is required only when the header is split, then this flag need to
be accompanied with a V4L2_BUF_CAP_SUPPORTS_SPLIT_CODECCONFIG (or similar name,
shorter could be nice). This is so that userspace can detect if that feature is
supported or not.

- If having split codecconfig is strictly needed for your driver, then this flag
is not the proper solution. The only solution I'd see for that, would be to use
something else then V4L2_PIX_FMT_H264 so that existing userspace are not tricked
into trying to use your driver the wrong way. I think such header could make
sense with H264_NO_SC (though not super clear what this is exactly, it's not
really used), or a clearer new format H264_AVCC/AVCC3

>      * .. _`V4L2-BUF-FLAG-REQUEST-FD`:
>  
>        - ``V4L2_BUF_FLAG_REQUEST_FD``
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 167c0e40ec06..5bb0682b4a23 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1119,6 +1119,7 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
>  #define V4L2_BUF_FLAG_TSTAMP_SRC_SOE		0x00010000
>  /* mem2mem encoder/decoder */
>  #define V4L2_BUF_FLAG_LAST			0x00100000
> +#define V4L2_BUF_FLAG_CODECCONFIG		0x00200000
>  /* request_fd is valid */
>  #define V4L2_BUF_FLAG_REQUEST_FD		0x00800000
>  


