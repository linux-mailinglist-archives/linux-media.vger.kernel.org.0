Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1384B271B
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 14:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350551AbiBKN3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 08:29:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350546AbiBKN3j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 08:29:39 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D734C1DF
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 05:29:36 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id w8so8253252qkw.8
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 05:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=C8RcQS3Onc34aY4WsNPDQx96xSdhXMEMcF2iWP8p8/s=;
        b=4GhGoUc/c11sseBRYQgnSGHSukX7xuuq//IPBzW+/F3ULsPiwfAXs/iPbJ2EpckRc6
         mzAS19V+zo/+vlD/Ole7qsvK6uHUe5Vlddpkz20LDNIbKPchqKPErG445oXCSeUEJ3nR
         Y93rF0TEX3mMjgsypXRO4FCc/MMX+bOfzy09qeAXdVv1ZGOMobYHWLpcQg3HYvO6/TMq
         Xx9DPu5l8RnrOKl5oFNxmeie0IHYsXiQ6ePF8GCOi5Zubof5UemFP4bWtt2lRpngB7NN
         3iqHa+dEEBnh9Pg/DFZ8iNRZC4bTy7fQ1A6ojRaT7PlRvaioiTe2YQdvZa2OFzCZswit
         fv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=C8RcQS3Onc34aY4WsNPDQx96xSdhXMEMcF2iWP8p8/s=;
        b=LIXkyQdzhep0ZM/w6cjBJCcswvNpxgPmR0OeFs0uVu+bKTcCVLRtQ6f/Tr1M/qdDgF
         6xk5jHc/dWWlEjh2up+3+j3ApBRdTDsVdOV0uPj8+717Im2QqpD8QqNDQmx+WD1jn+eM
         tRwY/93QE+JXU32TTAgL2NxObmN2jvJYPaU5/2y5BDdtBGilWJ6253Yzp2qPg4LUZPTC
         WJb+psVnkGT/8jTRKHObo3hwLjE9GnaWggU+Qo9zXgkngh/vvFG0aA/CSNWI10F4LKdX
         ILw4qSM7Ji6kc6Wq4awxXEt2qqp9iYwgc1/jaoAZ7mqd3uE7djH2yQJ/8Qq/6jf3EbYW
         5HYw==
X-Gm-Message-State: AOAM5325b8Uu3fadtk8VAoWEbIZ5MZRaQXmX3KUtrib8Js19esHFkFzl
        eBdlKmWK4gKgS/1GpNW9h7D+hQ==
X-Google-Smtp-Source: ABdhPJx3tflCKvRAYZjABa3eTJaLgwV9YMRtRuFiWIDpJpG/kVVAP086Nrm+UHeTe0IgS1KD4BQHlw==
X-Received: by 2002:a05:620a:ced:: with SMTP id c13mr693431qkj.636.1644586175987;
        Fri, 11 Feb 2022 05:29:35 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id h6sm11294073qkk.14.2022.02.11.05.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 05:29:35 -0800 (PST)
Message-ID: <d986ab76a7c52a9a2ce62c1edb07f520c9df51c4.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/4] media: v4l2-ctrls: Add new
 V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 11 Feb 2022 08:29:33 -0500
In-Reply-To: <20220207141937.13089-2-digetx@gmail.com>
References: <20220207141937.13089-1-digetx@gmail.com>
         <20220207141937.13089-2-digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 07 février 2022 à 17:19 +0300, Dmitry Osipenko a écrit :
> Add new V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags that are needed by
> NVIDIA Tegra video decoder. Userspace will have to set these flags in
> accordance to the type of a decoded frame.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Can you share here (out of commit) a userland implementation that was used to
demonstrate the new API ? It does not matter which project (GStreamer, FFMPEG,
Chromium, your_test_progtram). Should be fairly straightforward. This is just to
be transparent.

>  .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst   | 6 ++++++
>  include/uapi/linux/v4l2-controls.h                          | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> index cc080c4257d0..f87584ad90ba 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -616,6 +616,12 @@ Stateless Codec Control ID
>      * - ``V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD``
>        - 0x00000004
>        -
> +    * - ``V4L2_H264_DECODE_PARAM_FLAG_PFRAME``
> +      - 0x00000008
> +      -
> +    * - ``V4L2_H264_DECODE_PARAM_FLAG_BFRAME``
> +      - 0x00000010
> +      -
>  
>  .. raw:: latex
>  
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index c8e0f84d204d..e3d48d571062 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1563,6 +1563,8 @@ struct v4l2_h264_dpb_entry {
>  #define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC		0x01
>  #define V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC		0x02
>  #define V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD	0x04
> +#define V4L2_H264_DECODE_PARAM_FLAG_PFRAME		0x08
> +#define V4L2_H264_DECODE_PARAM_FLAG_BFRAME		0x10
>  
>  #define V4L2_CID_STATELESS_H264_DECODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 7)
>  /**

Please update the doc too, see:
  Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst:

