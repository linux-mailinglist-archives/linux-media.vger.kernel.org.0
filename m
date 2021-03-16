Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBBF633D116
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 10:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbhCPJpX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 05:45:23 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:32973 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230467AbhCPJpQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 05:45:16 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M6GFl0zxk4ywlM6GJlARtK; Tue, 16 Mar 2021 10:45:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615887915; bh=wM19qqX0itd9TKdCy7l5NNmoCL2A0+6x0UmY3RscrlE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ooCq0o8NfWwui4JCXyceu+rOlTZ5SOX1CxsIsi2mYWiRrmcnFfTnQqsQUSjiXeVNS
         1kZi01/kS+1Dqoo9FU8A31SYbNyykJNUrkstJ+pLvBX3RJ5Vx7cqfonoHIYpdCDSxg
         vidEj9mhWmQX2boImr6daRcDerpQYXdLEQXUaco9h+rt9y74M8bqdluyW/B81bXZnC
         fVzjNn0tKtzVtVmGpUsEZXqlhAnbOMSRLw8k8vwCfwRXDcwJ0LJ+8LjjvHGLZWXOD1
         oC+xcbstz13aYSCE6hcoygH414PaoqWB3LWagFkP8EimY3CIGuqM+9+KETUHtxn0sP
         BWLXZjm7522iQ==
Subject: Re: [PATCH v4 09/11] media: uvcvideo: Increase the size of
 UVC_METADATA_BUF_SIZE
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210315173609.1547857-1-ribalda@chromium.org>
 <20210315173609.1547857-10-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <df9feb80-6a31-478c-005c-13c12c4bf05e@xs4all.nl>
Date:   Tue, 16 Mar 2021 10:45:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210315173609.1547857-10-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCWzTPYFpHTCP2aYEqrvekqWLu4U19mEyZ0bBGBxqsoPJm805CmzNOtbPJO49d3taBbUzOwZsU1DhrKEN1ZBHkbKk6zfYQ1n49I2fLdR8ZTTtxwwE0Bn
 3oaJzAJsXDS1OdGemex7MDslvDNs1TaKLXQZjioSlSF5Ix8HGGLXvrxtEOnXtapBB1iVqyr37OtIpDKMJcBnJPcvfZFNucubVbn4G6ak/pp0xbfpmyflEWBh
 WqgXTtfV4cp1Jg1ZeAsdvUkDKuPWyWLlVCsqsBCEYE+a0/CP6bdgK4e14ig6ecnu8yUY93ZZo2xctR3FSps14xQrDQI+Xs+8dVYSRoAouHW7RvuFoamJOUaP
 2owoxuHmrv9RsaMEkk2aYiPVGz+6vdF5ZvhpK/yffAlT2bWMfeU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo, Laurent,

On 15/03/2021 18:36, Ricardo Ribalda wrote:
> Hans has discovered that in his test device, for the H264 format
> bytesused goes up to about 570, for YUYV it will actually go up
> to a bit over 5000 bytes, and for MJPG up to about 2706 bytes.
> 
> Credit-to: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvcvideo.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 1f17e4253673..91fc00ff311b 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -528,7 +528,7 @@ struct uvc_stats_stream {
>  	unsigned int max_sof;		/* Maximum STC.SOF value */
>  };
>  
> -#define UVC_METADATA_BUF_SIZE 1024
> +#define UVC_METADATA_BUF_SIZE 10240
>  
>  /**
>   * struct uvc_copy_op: Context structure to schedule asynchronous memcpy
> 

I've been doing some tests here, and this is tricky.

I think the core bug is in uvc_video_decode_meta():

        if (meta_buf->length - meta_buf->bytesused <
            length + sizeof(meta->ns) + sizeof(meta->sof)) {
                meta_buf->error = 1;
                return;
        }

This checks for a buffer overflow and by setting meta_buf->error to 1 it causes
the whole buffer to be discarded. But according to the V4L2_META_FMT_UVC docs here

https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/pixfmt-meta-uvc.html

it should "drop headers when the buffer is full", which suggests to me that
the 'meta_buf->error = 1;' is wrong and should be removed.

Looking at the number of headers I receive for various frame sizes and frame rates
when choosing YUYV as the pixelformat I see that the frame rate is the main input
to that: I get (very roughly) one header for every 150 microseconds. So that's
roughly 667 headers of 22 bytes for a 10 fps capture. The frame size has some
effect, but it is fairly small. This means that for slow captures (i.e. 2 fps)
you need about 75000 bytes, let's round it up to 102400.

I did tests with 1920x1080 at 5 fps for YUYV, H264 and MJPEG and saw the following:

Format		Video Size	Metadata Size

YUYV		4147200		29964
MJPG		130000		3608
H264 (P-frame)	70000		2600
H264 (I-frame)	150000		5500

The difference here is most likely due to YUYV being transmitted over time as
video lines arrive, so it is spread out over time, while H264 and MJPG are
bursty, i.e. the whole compressed frame is transferred in one go.

I think that 10240 is a good value for the metadata buffers since it is enough
for the worst-case for the compressed formats, and that if this is combined
with removing the 'meta_buf->error = 1;' it will also do its job for YUYV
even though data will be dropped, but that's better than not getting anything
at all.

Regards,

	Hans
