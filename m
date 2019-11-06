Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A11A8F1949
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 16:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731926AbfKFPBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 10:01:20 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35504 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727557AbfKFPBU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 10:01:20 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id D17AF283CCC
Subject: Re: [PATCH v2 3/3] media: vimc: Add device index to the bus_info
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     andre.almeida@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com
References: <20191105152059.9994-1-dafna.hirschfeld@collabora.com>
 <20191105152059.9994-4-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <7c51b309-7fed-c13e-66ba-87ccf0e816e8@collabora.com>
Date:   Wed, 6 Nov 2019 12:01:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191105152059.9994-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for working on this.

On 11/5/19 1:20 PM, Dafna Hirschfeld wrote:
> Use a bitmask to get the next available device index
> to be used for the bus_info field in the v4l2_capability
> struct in the VIDIOC_QUERYCAP ioctl
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/platform/vimc/vimc-capture.c |  8 +++++--
>  drivers/media/platform/vimc/vimc-common.h  |  2 ++
>  drivers/media/platform/vimc/vimc-core.c    | 25 +++++++++++++++++++++-
>  3 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 72577b85619d..592ce72e820d 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -31,6 +31,7 @@ struct vimc_cap_device {
>  	u32 sequence;
>  	struct vimc_stream stream;
>  	struct media_pad pad;
> +	char bus_info[32];
>  };
>  
>  static const struct v4l2_pix_format fmt_default = {
> @@ -55,10 +56,12 @@ struct vimc_cap_buffer {
>  static int vimc_cap_querycap(struct file *file, void *priv,
>  			     struct v4l2_capability *cap)
>  {
> +	struct vimc_cap_device *vcap = video_drvdata(file);
> +
>  	strscpy(cap->driver, VIMC_PDEV_NAME, sizeof(cap->driver));
>  	strscpy(cap->card, KBUILD_MODNAME, sizeof(cap->card));
> -	snprintf(cap->bus_info, sizeof(cap->bus_info),
> -		 "platform:%s", VIMC_PDEV_NAME);
> +	strscpy(cap->bus_info, vcap->bus_info, sizeof(cap->bus_info));
> +
>  
>  	return 0;
>  }
> @@ -459,6 +462,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  	vcap->ved.process_frame = vimc_cap_process_frame;
>  	vcap->ved.vdev_get_format = vimc_cap_get_format;
>  	vcap->ved.dev = vimc->mdev.dev;
> +	strscpy(vcap->bus_info, vimc->mdev.bus_info, sizeof(vcap->bus_info));
>  
>  	/* Initialize the video_device struct */
>  	vdev = &vcap->vdev;
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 17576d60a99c..6347135c504a 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -166,12 +166,14 @@ struct vimc_ent_device {
>   * struct vimc_device - main device for vimc driver
>   *
>   * @mdev	the associated media_device parent
> + * @idx		the index of the device, used for info_bus
>   * @v4l2_dev	Internal v4l2 parent device
>   * @ents	list of vimc_ent_device objects
>   */
>  struct vimc_device {
>  	struct media_device mdev;
>  	struct v4l2_device v4l2_dev;
> +	unsigned int idx;
>  
>  	struct list_head ents;
>  };
> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
> index c8612bfd8a2c..c1b360970a49 100644
> --- a/drivers/media/platform/vimc/vimc-core.c
> +++ b/drivers/media/platform/vimc/vimc-core.c
> @@ -14,9 +14,15 @@
>  #include "vimc-common.h"
>  
>  #define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
> +#define VIMC_MAX_DEVS 64
>  
>  #include "vimc-configfs.h"
>  
> +
> +
> +static DECLARE_BITMAP(used, VIMC_MAX_DEVS);
> +static DEFINE_MUTEX(vimc_dev_idx_lock);
> +
>  static const struct vimc_ent_type ent_types[] = {
>  	{
>  		.name = VIMC_SEN_NAME,
> @@ -237,9 +243,20 @@ static int vimc_probe(struct platform_device *pdev)
>  						pdev->dev.platform_data;
>  	struct vimc_device *vimc;
>  	int ret;
> +	unsigned int idx;
>  
>  	dev_dbg(&pdev->dev, "probe\n");
>  
> +	mutex_lock(&vimc_dev_idx_lock);
> +	idx = find_first_zero_bit(used, VIMC_MAX_DEVS);
> +	if (idx == VIMC_MAX_DEVS) {
> +		mutex_unlock(&vimc_dev_idx_lock);
> +		dev_err(&pdev->dev, "there are already %u devs which is the max allowed\n",
> +			VIMC_MAX_DEVS);
> +		return -EBUSY;
> +	}
> +	set_bit(idx, used);
> +	mutex_unlock(&vimc_dev_idx_lock);
>  	vimc = devm_kzalloc(&pdev->dev, sizeof(*vimc),
>  			GFP_KERNEL);
>  	if (!vimc)
> @@ -247,6 +264,7 @@ static int vimc_probe(struct platform_device *pdev)
>  
>  	memset(&vimc->mdev, 0, sizeof(vimc->mdev));
>  	INIT_LIST_HEAD(&vimc->ents);
> +	vimc->idx = idx;
>  
>  	/* Link the media device within the v4l2_device */
>  	vimc->v4l2_dev.mdev = &vimc->mdev;
> @@ -255,7 +273,8 @@ static int vimc_probe(struct platform_device *pdev)
>  	strscpy(vimc->mdev.model, VIMC_MDEV_MODEL_NAME,
>  		sizeof(vimc->mdev.model));
>  	snprintf(vimc->mdev.bus_info, sizeof(vimc->mdev.bus_info),
> -		 "platform:%s", VIMC_PDEV_NAME);
> +		 "platform:%s-%03u", VIMC_PDEV_NAME, idx);
> +

I was wondering that instead of using an index number here, you could just use
the name of the device the user created.
For instance:
$ mkdir /configfs/vimc/mdev

then bus_info would be "platform:vimc-mdev"

I also think that the model name vimc->mdev.model should be the name the user
created, and we can get rid of the VIMC_MDEV_MODEL_NAME macro.

You can pass the name to vimc_probe using the platform_data.
In this way you don't need to keep an index and it should simplify your code.

Regards,
Helen

>  	vimc->mdev.dev = &pdev->dev;
>  	media_device_init(&vimc->mdev);
>  
> @@ -269,6 +288,7 @@ static int vimc_probe(struct platform_device *pdev)
>  static int vimc_remove(struct platform_device *pdev)
>  {
>  	struct vimc_device *vimc = platform_get_drvdata(pdev);
> +	unsigned long idx = vimc->idx;
>  
>  	dev_dbg(&pdev->dev, "remove\n");
>  
> @@ -277,6 +297,9 @@ static int vimc_remove(struct platform_device *pdev)
>  	media_device_cleanup(&vimc->mdev);
>  	v4l2_device_unregister(&vimc->v4l2_dev);
>  
> +	mutex_lock(&vimc_dev_idx_lock);
> +	clear_bit(idx, used);
> +	mutex_unlock(&vimc_dev_idx_lock);
>  	return 0;
>  }
>  
> 
