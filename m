Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BFC333CC4
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 13:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232638AbhCJMm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 07:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbhCJMmQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 07:42:16 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D288FC061760
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 04:42:15 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id f145so1274358ybg.11
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 04:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=asY9c5Wnz43bb2ZuvgOGMdfGdiZjWepJHidgGvjG8cg=;
        b=Rfm5oO6suxhl9fc5bzMicPINgog7BDGcJMsFWchoQ6kz79SZFnNjyyTzT44/h7rLDE
         ymy4Z9cyvDoamVcq1uMKvvrpAJpSPHEcmVGK8HVqg2LrKfrvdVzef2quyJLHx4pGgcPj
         YQBwK29I1fqaoDhSURQ6hU7X/+kdfWDulQlUn6NDPHoutKSdHzgPtLggJCtaE+1xLO1E
         WeiyavTsUALygwkR1aPinqVCPUTspGV5x0DPHmayzRVRHrZcbgX+v0qglbZkm8TV3Vel
         BV0BGq78YXBwB6rDUd1soo1w8+4ujcrGrtTOvFzhXs5Vls6gMAC4hqBk8Emees3k4fsW
         qaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=asY9c5Wnz43bb2ZuvgOGMdfGdiZjWepJHidgGvjG8cg=;
        b=H2HI4+SC+PO1CTcMnTtE8e+9eTOPY8/7+5Y8Q7c2d74KtxeUbjttVW+zYDEpMz2VqY
         J9lNDWy8OccbXLWBqeDJu5gVomN4eYKnEY7aqFSQF1zpUqc8OfHVYaBtu77+uPN6BCVQ
         zJD8oCtXNp9CGijo168NBrIj4ZXwQAYLc9vspkpF1RsIMfg8qhdmyPLk9iFDcDmaVZDL
         ey9nC41DCdlDI0dpiauhSSPfwNeB+RKc7E0M+7Irflv/e+o0nBSbMhwQ9BwmaTO1WgDO
         5mzmS7aBF1FxhRqKlnqcNtHs1BXYHMcZcJ294O/9I6ujgtmRm2lxlTZtLUd2VTJO07n3
         3s9g==
X-Gm-Message-State: AOAM532+qMYyaOPD9zVo3r1L2WAucIdm14l/4wErGsc1VSzIY3Dke+4u
        os6/jnEQyqF0GbAQ0aNP6DcKKN2Q7D44ANqqUSFT4MvaEVkZQw==
X-Google-Smtp-Source: ABdhPJxKJWsc+CmmeW85CvnIKX5J0933bHSc51wWQIwEE31el3ae5o+q4/bqgt78/laO4Wze2Auw0iWV1GrMibq/IYo=
X-Received: by 2002:a05:6902:1003:: with SMTP id w3mr3791377ybt.445.1615380135136;
 Wed, 10 Mar 2021 04:42:15 -0800 (PST)
MIME-Version: 1.0
References: <e184e57d-3739-98c6-6d64-adfc8f7c5777@xs4all.nl>
In-Reply-To: <e184e57d-3739-98c6-6d64-adfc8f7c5777@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 10 Mar 2021 12:41:49 +0000
Message-ID: <CA+V-a8umjuyTn0DTC2+ejxDLyXN-cQRe1G2wujKVBVFoDYXWZQ@mail.gmail.com>
Subject: Re: [PATCH] vpbe_osd.h/uvcvideo.h includes: fix trivial kernel-doc warnings
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Mar 9, 2021 at 12:22 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Fix these kernel-doc warnings:
>
> include/media/davinci/vpbe_osd.h:77: warning: Enum value 'PIXFMT_YCBCRI' not described in enum 'osd_pix_format'
> include/media/davinci/vpbe_osd.h:77: warning: Enum value 'PIXFMT_YCRCBI' not described in enum 'osd_pix_format'
> include/media/davinci/vpbe_osd.h:77: warning: Excess enum value 'PIXFMT_YCrCbI' description in 'osd_pix_format'
> include/media/davinci/vpbe_osd.h:77: warning: Excess enum value 'PIXFMT_YCbCrI' description in 'osd_pix_format'
> include/media/davinci/vpbe_osd.h:232: warning: expecting prototype for enum davinci_cursor_v_width. Prototype was for enum
> osd_cursor_v_width instead
> include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'ns' not described in 'uvc_meta_buf'
> include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'sof' not described in 'uvc_meta_buf'
> include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'length' not described in 'uvc_meta_buf'
> include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'flags' not described in 'uvc_meta_buf'
> include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'buf' not described in 'uvc_meta_buf'
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/include/media/davinci/vpbe_osd.h b/include/media/davinci/vpbe_osd.h
> index e1b1c76aa50f..a4fc4f2a56fb 100644
> --- a/include/media/davinci/vpbe_osd.h
> +++ b/include/media/davinci/vpbe_osd.h
> @@ -54,9 +54,9 @@ enum osd_win_layer {
>   * @PIXFMT_4BPP: 4-bits-per-pixel bitmap
>   * @PIXFMT_8BPP: 8-bits-per-pixel bitmap
>   * @PIXFMT_RGB565: 16-bits-per-pixel RGB565
> - * @PIXFMT_YCbCrI: YUV 4:2:2
> + * @PIXFMT_YCBCRI: YUV 4:2:2
>   * @PIXFMT_RGB888: 24-bits-per-pixel RGB888
> - * @PIXFMT_YCrCbI: YUV 4:2:2 with chroma swap
> + * @PIXFMT_YCRCBI: YUV 4:2:2 with chroma swap
>   * @PIXFMT_NV12: YUV 4:2:0 planar
>   * @PIXFMT_OSD_ATTR: OSD Attribute Window pixel format (4bpp)
>   *
> @@ -210,7 +210,7 @@ enum osd_cursor_h_width {
>  };
>
>  /**
> - * enum davinci_cursor_v_width
> + * enum osd_cursor_v_width
>   * @V_WIDTH_1: vertical line width is 1 line
>   * @V_WIDTH_2: vertical line width is 2 lines
>   * @V_WIDTH_4: vertical line width is 4 lines

For the above:

Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
> index f80f05b3c423..8288137387c0 100644
> --- a/include/uapi/linux/uvcvideo.h
> +++ b/include/uapi/linux/uvcvideo.h
> @@ -76,11 +76,11 @@ struct uvc_xu_control_query {
>
>  /**
>   * struct uvc_meta_buf - metadata buffer building block
> - * @ns         - system timestamp of the payload in nanoseconds
> - * @sof                - USB Frame Number
> - * @length     - length of the payload header
> - * @flags      - payload header flags
> - * @buf                - optional device-specific header data
> + * @ns: system timestamp of the payload in nanoseconds
> + * @sof: USB Frame Number
> + * @length: length of the payload header
> + * @flags: payload header flags
> + * @buf: optional device-specific header data
>   *
>   * UVC metadata nodes fill buffers with possibly multiple instances of this
>   * struct. The first two fields are added by the driver, they can be used for
