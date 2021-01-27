Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8F7305B69
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343502AbhA0M3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 07:29:39 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:46339 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237728AbhA0M0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 07:26:51 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4jtUlXs0TI2394jtYlhI1h; Wed, 27 Jan 2021 13:26:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611750360; bh=qSlszqB0O1piuaM6c1hXzd8CpL/mh8jhsF6rOIoDLcU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GStSguRQStfiDZCSk15DvRNqhtywlqJykOK6gWvB87ms/FzgYTj8VdtsZKWo3PPuc
         y40bIfALvYeAEyNxoPtDQoFblpS4LDLhv5ptO+i6SgpA2gWFNWVIz+Bm2bAAX4ppn0
         7Up5qv4ykmcoJ7q152T6d1msxjUwwSdOe3tYDfNOMwmADk3SQa1zG94M9OMoejrOam
         ThigzFMRUwC6qaV5ueK0keQnk9qo0tHQpOVc5aB4/nIh1RIYnXT8S+DJzUwLCjSmGn
         hmYjRDYL4GMAk1PMJuvv4mj7/UWBvXm+e2SBRowlEuyLGSZ4dCjVpJh/1p+MkkheGr
         sDhzv/Q1HJPiQ==
Subject: Re: [PATCH v2 4/4] docs: Deprecate mfc display delay controls
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
 <20210115092607.29849-5-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <acd7cd1f-607c-5901-07b7-c661a12d0c60@xs4all.nl>
Date:   Wed, 27 Jan 2021 13:25:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115092607.29849-5-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKMCZr7OSd0aI+BYzO+vdtUjnnb/oFQndYbsiLiLwf00BwQMB0SjO5o1Z9pTnVfKKNNBeV+2gvGPz0/TS+bLG98V33owhH7Vc+uFgDNyQhI4Or1FtCfX
 KxhfkuKafXrvOmOlVs7DCUAJilfDOXfxM5qzTZYdfZt4BLVSVmxPOQgkKivmIdCPpUSNfVDJ7kytReDKtgBYVtULHQrSlKhG1LKpvLcD9A2PR3t+kSo9noTN
 OrgK+5/BWHdq8gg7FCQi2whKX8f+K9Dnc1I4hLCRFIV2IqcqPYxosGu/ih/ach/tFKMNevFGk6YYUXrEz37ZxfUQZ3asPcmPP+axPckP9T3bVwR5JBsTe2Zy
 o1DxlyfxCez9+kIEVRRgsf8r8jQjkg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/01/2021 10:26, Stanimir Varbanov wrote:
> Deprecate mfc private display delay and display enable controls for
> new clients and use the standard controls instead.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 5d7c47837035..815c6eb4a0d0 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -2111,6 +2111,11 @@ MFC 5.1 Control IDs
>      feature can be used for example for generating thumbnails of videos.
>      Applicable to the H264 decoder.
>  
> +    .. note::
> +
> +       This control is deprecated. Use the standard
> +       ``V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE`` control instead.
> +
>  ``V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY (integer)``
>      Display delay value for H264 decoder. The decoder is forced to
>      return a decoded frame after the set 'display delay' number of
> @@ -2118,6 +2123,11 @@ MFC 5.1 Control IDs
>      of display order, in addition the hardware may still be using the
>      returned buffer as a reference picture for subsequent frames.
>  
> +    .. note::
> +
> +       This control is deprecated. Use the standard
> +       ``V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY`` control instead.
> +
>  ``V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P (integer)``
>      The number of reference pictures used for encoding a P picture.
>      Applicable to the H264 encoder.
> 

