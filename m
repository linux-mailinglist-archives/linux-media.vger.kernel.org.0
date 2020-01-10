Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE56136DEF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 14:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727757AbgAJNZ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 08:25:26 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:41139 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727358AbgAJNZZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 08:25:25 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id puHrin9xDpLtbpuHuiQmSe; Fri, 10 Jan 2020 14:25:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578662723; bh=I0b7s/xDqtbd60FacQFIRFFagV1Bh2XVzbaw6GJ8UFk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TTtT0/u+HRhWOQa06QDndrU0bUEOOnpgZ7+dEC97BkRPFIGB6+mexFpX5KgD0Ycg7
         yhQzvpBQhpk2DygTF4OkK7SbCzkIEdbt1VBG6UrD+kwFD6l10FwZudPsgW7v4eMGeL
         aYwHyNPBtNy6/lyBAFseDupjlwYKHL69gvkN/Cq4uYQTv02WDFPYe6/H3/nZ+1y+tA
         BALkMj/5GvNS1nAx0I4g/1Vkw1rgqgcm08uw2jwao9fUsMlB844kKhFq4HAFqE21zy
         nTRdmkh4N365san1LzaN8h2TVUGaY8Hytm1MaugFO+7c4Ri1RfYmfqNAU0fotrD5oM
         l7dFQzn+02NNg==
Subject: Re: [PATCH] staging/vc04_services/bcm2835-camera: distinct numeration
 and names for devices
To:     Michael Kupfer <michael.kupfer@fau.de>, eric@anholt.net,
        wahrenst@gmx.net, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, mchehab+samsung@kernel.org,
        linux-media@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        dave.stevenson@raspberrypi.org, daniela.mormocea@gmail.com,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-kernel@i4.cs.fau.de, Kay Friedrich <kay.friedrich@fau.de>
References: <20191206085432.19962-1-michael.kupfer@fau.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3db2350b-0a6d-0693-258c-9d47f71c0627@xs4all.nl>
Date:   Fri, 10 Jan 2020 14:25:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191206085432.19962-1-michael.kupfer@fau.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBd3XXTXHJXsWfyVxCd2xYnZO0N8s/BDiJigBt9fBzOuvI1qg7Ov9vJHlQwwroeHfDptOn2x6LGe/NF17tiYIHe6IKGtbMu6lyUonjXvZHlMv8StSdIC
 KjYmD4yv2S6PG8353r9KVWVoWKnWpExFpS00SMNPq5IJsX0GyIHHf370xIlWiBo1uFBPJrF+j9ZsO01XP4FQMp1f6UC1jRrs61fg77hJ1wy4Zgliil7O9MiI
 pvMz1R6SFwWlhjOzw9WPqyNWo8SWxUYcyyfl2v53V+CvWgwJ5DZG7hUbdZP/qv+bKOk5xyhfl26PIEeuFIG6UMCgRYfGFOYgyV991fAuAVn2Dl9s1kexO+eh
 tpS7DuSgD76w957xPtmjizhbEK3EmsdZ+k/6hrHyjkRb3KLCufZaCXa92/oMKYXPD3EmQEqcCJAZFxvg1thOoX7sSWbv5i9/KTtAn+VIMvFR58Zn88QVT/xo
 D8/JfnqE8C4zdH9i2TrB90rHJKxmGPFc91KhbCbQaPjrg38xmbFqJcOEL/n/XHiROQtHdEhKeUmzL+4YZJ3WDWuvUhprcNE6aPBSeDmnpTKkpbqgiCwjsfFx
 d4HTR0D5GW2x8wmWayKH432z9lI6vqffHTdck7Vrvb7hTmdesfRvgriuI8o4dt6SQuT9nJC9rt7gedvyKw7nsxUw4ODfbr24oLSb/ZkIO0o5i9yK2ZpiaWaF
 8xfVbVb8KZVaxBQ4srQRGIc3bE4uizhm3PTr00SnN0xw9EXC01pJoNmd2cDfozvoMO3xwPWME7KAsoFn8WDu/XKTRBI2lN7SShrCVzRTZ7f9CEOO/08TtnON
 N1dWwwey5LGcCnce6F7Dp2Lmnl+Y2/FYR1WiEk3Ad5N+IsvZOD2DORmv4Xwh12IK0kVRpntnSOLvX7ZLyWK1VfnbCoGLBHMQA04SKM8L6IDC+76awJcUkbxl
 L/eY2w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael, Kay,

On 12/6/19 9:54 AM, Michael Kupfer wrote:
> Create a static atomic counter for numerating cameras.
> Use the Media Subsystem Kernel Internal API to create distinct
> device-names, so that the camera-number (given by the counter)
> matches the camera-name.
> 
> Co-developed-by: Kay Friedrich <kay.friedrich@fau.de>
> Signed-off-by: Kay Friedrich <kay.friedrich@fau.de>
> Signed-off-by: Michael Kupfer <michael.kupfer@fau.de>
> ---
>  .../vc04_services/bcm2835-camera/bcm2835-camera.c        | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index beb6a0063bb8..be5f90a8b49d 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -60,6 +60,9 @@ MODULE_PARM_DESC(max_video_width, "Threshold for video mode");
>  module_param(max_video_height, int, 0644);
>  MODULE_PARM_DESC(max_video_height, "Threshold for video mode");
>  
> +/* camera instance counter */
> +static atomic_t camera_instance = ATOMIC_INIT(0);
> +
>  /* global device data array */
>  static struct bm2835_mmal_dev *gdev[MAX_BCM2835_CAMERAS];
>  
> @@ -1870,7 +1873,6 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
>  
>  		/* v4l2 core mutex used to protect all fops and v4l2 ioctls. */
>  		mutex_init(&dev->mutex);
> -		dev->camera_num = camera;
>  		dev->max_width = resolutions[camera][0];
>  		dev->max_height = resolutions[camera][1];
>  
> @@ -1886,8 +1888,9 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
>  		dev->capture.fmt = &formats[3]; /* JPEG */
>  
>  		/* v4l device registration */
> -		snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
> -			 "%s", BM2835_MMAL_MODULE_NAME);
> +		dev->camera_num = v4l2_device_set_name(&dev->v4l2_dev,
> +						       BM2835_MMAL_MODULE_NAME,
> +						       &camera_instance);
>  		ret = v4l2_device_register(NULL, &dev->v4l2_dev);
>  		if (ret) {
>  			dev_err(&pdev->dev, "%s: could not register V4L2 device: %d\n",
> 

Actually, in this specific case I would not use v4l2_device_set_name().

Instead just use:

		snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
			 "%s-%u", BM2835_MMAL_MODULE_NAME, camera);

It would be even better if there would be just one top-level v4l2_device used
for all the camera instances. After all, there really is just one platform
device for all of the cameras, and I would expect to see just a single
v4l2_device as well.

It doesn't hurt to have multiple v4l2_device structs, but it introduces a
slight memory overhead since one would have been sufficient.

v4l2_device_set_name() is meant for pci-like devices. And it really
is a bit overkill to have it as a helper function.

Regards,

	Hans
