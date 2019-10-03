Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD7CC9EED
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730307AbfJCMyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:54:54 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:56059 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730208AbfJCMyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 08:54:53 -0400
Received: from [IPv6:2001:420:44c1:2577:6d0e:6b32:a8b6:66d9] ([IPv6:2001:420:44c1:2577:6d0e:6b32:a8b6:66d9])
        by smtp-cloud8.xs4all.net with ESMTPA
        id G0d5i2jwWop0AG0d8i8831; Thu, 03 Oct 2019 14:54:51 +0200
Subject: Re: [PATCH v7 2/2] vivid: fixes for v4l2-compliance issues.
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <bbef8158-e603-7f80-308a-129d76c68a1b@xs4all.nl>
 <20190925082730.15550-1-bnvandana@gmail.com>
 <20190925082730.15550-3-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a75b3099-eff7-b397-3e81-6061ad16a1fb@xs4all.nl>
Date:   Thu, 3 Oct 2019 14:54:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925082730.15550-3-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM1rOZdYnYxyEq8kC8RmhO5PVNJMZo0bI2z4fQqvwWMJyh6oH7a42FUONlYC8ruDjB1rvzkGfnWBeLDvori7Wi2fsxby68+0NgjoajuBJYZOasfzUcIl
 uUsjYsjhBrW0sO9J+b1AOqJw8jDCE2YGrUPhnJrr3aav43CpVnzouq3fbtKMDEzPyQm6XG40atyS2Wt1S2cl6PPbzXKiZ+eeDKQ3/DrkKhHSJxJdJuq+fqTe
 /FiBamZAnsWKeeYRc8ak+JB62wJ/JGGRS2glSjNBCYH7Ji0SQneFh4L+BJqIhf9aDtKDczqP7iJz5lWY0/zgo7g40AWKQvqudTnAGd4pq/TthVMMqWGOy/iM
 p9IfBTkTEhtMstQJA52Pk0mJDtAcnGgHdlOHAq251Ugq8pS4J5Z/Z0jcT2hWWABhNVxo0zuw
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/25/19 10:27 AM, Vandana BN wrote:
> From: Hans Verkuil <hverkuil@xs4all.nl>
> 
> This patch fixes v4l2-compliance issues seen on metadata device.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Can you squash this patch into the previous one? It's really all fixes for the
previous patch, and it is better to apply one good patch.

No need to keep my Signed-off-by: it will be added again anyway when I merge
the v8 vivid metadata capture patch.

Regards,

	Hans

> ---
>  drivers/media/platform/vivid/vivid-core.c     | 16 +++++++++++++++-
>  drivers/media/platform/vivid/vivid-meta-cap.c |  2 +-
>  drivers/media/platform/vivid/vivid-vid-cap.c  |  5 ++++-
>  3 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
> index c7d317f45fc0..97ab197bdec0 100644
> --- a/drivers/media/platform/vivid/vivid-core.c
> +++ b/drivers/media/platform/vivid/vivid-core.c
> @@ -897,9 +897,14 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  				     V4L2_CAP_READWRITE;
>  
>  	/* set up the capabilities of meta capture device */
> -	if (dev->has_meta_cap)
> +	if (dev->has_meta_cap) {
>  		dev->meta_cap_caps = V4L2_CAP_META_CAPTURE |
>  				     V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
> +		if (dev->has_audio_inputs)
> +			dev->meta_cap_caps |= V4L2_CAP_AUDIO;
> +		if (in_type_counter[TV])
> +			dev->meta_cap_caps |= V4L2_CAP_TUNER;
> +	}
>  
>  	ret = -ENOMEM;
>  	/* initialize the test pattern generator */
> @@ -960,6 +965,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_AUDIO);
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_AUDIO);
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_ENUMAUDIO);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_AUDIO);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_AUDIO);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_ENUMAUDIO);
>  	}
>  	if (!dev->has_audio_outputs) {
>  		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_AUDOUT);
> @@ -985,12 +993,16 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_FREQUENCY);
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_FREQUENCY);
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_FREQUENCY);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_FREQUENCY);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_FREQUENCY);
>  	}
>  	if (!has_tuner) {
>  		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_TUNER);
>  		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_TUNER);
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_TUNER);
>  		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_TUNER);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_TUNER);
> +		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_TUNER);
>  	}
>  	if (in_type_counter[HDMI] == 0) {
>  		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_EDID);
> @@ -1016,6 +1028,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
>  	v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
>  	v4l2_disable_ioctl(&dev->sdr_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
> +	v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
>  	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_FREQUENCY);
>  	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_FREQUENCY);
>  	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUM_FRAMESIZES);
> @@ -1552,6 +1565,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  		vfd->v4l2_dev = &dev->v4l2_dev;
>  		vfd->queue = &dev->vb_meta_cap_q;
>  		vfd->lock = &dev->mutex;
> +		vfd->tvnorms = tvnorms_cap;
>  		video_set_drvdata(vfd, dev);
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  		dev->meta_cap_pad.flags = MEDIA_PAD_FL_SINK;
> diff --git a/drivers/media/platform/vivid/vivid-meta-cap.c b/drivers/media/platform/vivid/vivid-meta-cap.c
> index e3241d602b7a..b2f42c09abe1 100644
> --- a/drivers/media/platform/vivid/vivid-meta-cap.c
> +++ b/drivers/media/platform/vivid/vivid-meta-cap.c
> @@ -135,7 +135,7 @@ int vidioc_enum_fmt_meta_cap(struct file *file, void  *priv,
>  	struct vivid_dev *dev = video_drvdata(file);
>  
>  	if (!vivid_is_webcam(dev))
> -		return -ENODATA;
> +		return -EINVAL;
>  
>  	if (f->index > 0)
>  		return -EINVAL;
> diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
> index 2d030732feac..e94beef008c8 100644
> --- a/drivers/media/platform/vivid/vivid-vid-cap.c
> +++ b/drivers/media/platform/vivid/vivid-vid-cap.c
> @@ -1356,7 +1356,9 @@ int vidioc_s_input(struct file *file, void *priv, unsigned i)
>  	if (i == dev->input)
>  		return 0;
>  
> -	if (vb2_is_busy(&dev->vb_vid_cap_q) || vb2_is_busy(&dev->vb_vbi_cap_q))
> +	if (vb2_is_busy(&dev->vb_vid_cap_q) ||
> +	    vb2_is_busy(&dev->vb_vbi_cap_q) ||
> +	    vb2_is_busy(&dev->vb_meta_cap_q))
>  		return -EBUSY;
>  
>  	dev->input = i;
> @@ -1366,6 +1368,7 @@ int vidioc_s_input(struct file *file, void *priv, unsigned i)
>  		dev->vid_cap_dev.tvnorms = V4L2_STD_ALL;
>  	}
>  	dev->vbi_cap_dev.tvnorms = dev->vid_cap_dev.tvnorms;
> +	dev->meta_cap_dev.tvnorms = dev->vid_cap_dev.tvnorms;
>  	vivid_update_format_cap(dev, false);
>  
>  	if (dev->colorspace) {
> 

