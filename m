Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D895408854
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 11:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238653AbhIMJgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 05:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238367AbhIMJgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 05:36:47 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6E4C061574;
        Mon, 13 Sep 2021 02:35:31 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PiN3mXbAupQdWPiN4m2GyV; Mon, 13 Sep 2021 11:35:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631525729; bh=iS44fWegCcqajhniRMZOhI2rCLhnlrrJLZg1C5vJ31A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BPvTqlWh1SD+P6Lf7Jqxwv2/exK0AUvq8pWajoly+l4dj81Xo582ik0/DPTcxv/le
         8wjyV7BcwRVaKsY+GGt/GEZzTFrK2SvgR3JfLSG/lWvfoh6wuH55mRn/PRR6PFnsqw
         9KTbwgJ260IeyRbhtWeAZt83Ib3paUdTREf2EYkA6EL8sHBzNnVYzLVsrDRX3bxwce
         QTGAVwVjfvRDyThhxtr7stOhHWjvQNqiKiVdEzxdgubfSlafj0NTpA7alX24Gd9KTi
         jhL4PmQcnRjGcyoEowuYOHW0VjreQCEQztjucAu0riWJ1o83vqXKu27y1y8erkfIgw
         a7xpAgwEnKwgA==
Subject: Re: [PATCH v6] media: em28xx: Fix race condition between open and
 init function
To:     Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        mchehab@kernel.org, skhan@linuxfoundation.org, hdanton@sina.com
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com
References: <20210614195230.28691-1-igormtorrente@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0763c5bc-b7f7-b0da-e48c-d61c61fc5499@xs4all.nl>
Date:   Mon, 13 Sep 2021 11:35:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210614195230.28691-1-igormtorrente@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBfETrkQKgpiubodEMFFgi6eddGxPXJVXoMubrNGXFJk0T9dXrcAsTAksCaC3c9m4dNtAoEa/7wxUNdV8y7Oruuy2O741r2jkfkSWbtUWiQ8/AsD2UI7
 d/rFc9jyzp7mV6LWIWqxAIDv19zfJTvbiTrlVP27+izBZanEPMVeozxPhbZwClEYmxf5WmIBFj13kUXv9w1kqXxrh95x1We3lPnQp2SbHBRq2jT0XBwliMVO
 jQ4Neqj9VuF+ghNiNZEV/3yLWW0/EbuqtxbkMzdmQPRUeBA98iJptFfS/4PvOhHmEgYVl2yD2U4+2wjsjbsQS+pIwUuw9NnCifLKv5GQCzvsCchNHdu0q2KJ
 RlqIHR10NQuAfBT33K1yy3EKL0sAniOOMV6NAERgAQ2d2E+QR8vu8CEqO7izYZuSXlKnyCGMKyknOr+VXykESWLbIoKrkDQiyn6bWm5atIJ2XwTM0ueR3LCE
 VAN0HqEU4HoPg5E+RYucI36Vajs72hCE5fcK/4hnTfG/9i123vxNB1uzdC6qlrgGUnrmrdwRJKnTNRiW0Ka+KF3fJPfvR5WBiaLiwg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/06/2021 21:52, Igor Matheus Andrade Torrente wrote:
> Fixes a race condition - for lack of a more precise term - between
> em28xx_v4l2_open and em28xx_v4l2_init, by managing the em28xx_v4l2
> and v4l2_dev life-time with the v4l2_dev->release() callback.
> 
> The race happens when a thread[1] - containing the em28xx_v4l2_init()
> code - calls the v4l2_mc_create_media_graph(), and it return a error,
> if a thread[2] - running v4l2_open() - pass the verification point
> and reaches the em28xx_v4l2_open() before the thread[1] finishes
> the deregistration of v4l2 subsystem, the thread[1] will free all
> resources before the em28xx_v4l2_open() can process their things,
> because the em28xx_v4l2_init() has the dev->lock. And all this lead
> the thread[2] to cause a user-after-free.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-and-tested-by: syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com
> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
> ---
> 
> V2: Add v4l2_i2c_new_subdev null check
>     Deal with v4l2 subdevs dependencies
> 
> V3: Fix link error when compiled as a module
> 
> V4: Remove duplicated v4l2_device_disconnect
>     in the em28xx_v4l2_fini
> 
> V5: Move all the v4l2 resources management
>     to the v4l2_dev->release() callback.
> 
> V6: Address some Hans comments regarding
>     video_unregister_device and struct v4l2_device
>     inside the struct v4l2_device.
> 
>     I'm sending this v6 that way but I'm totally open
>     to the Hilt approach, if it is a more desirable
>     way to fix this issue.
> ---
>  drivers/media/usb/em28xx/em28xx-cards.c |   3 +-
>  drivers/media/usb/em28xx/em28xx-video.c | 232 +++++++++++++++---------
>  drivers/media/usb/em28xx/em28xx.h       |   1 -
>  3 files changed, 151 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> index ba9292e2a587..6e67cf0a1e04 100644
> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> @@ -4120,7 +4120,6 @@ static void em28xx_usb_disconnect(struct usb_interface *intf)
>  	struct em28xx *dev;
>  
>  	dev = usb_get_intfdata(intf);
> -	usb_set_intfdata(intf, NULL);
>  
>  	if (!dev)
>  		return;
> @@ -4148,6 +4147,8 @@ static void em28xx_usb_disconnect(struct usb_interface *intf)
>  		dev->dev_next = NULL;
>  	}
>  	kref_put(&dev->ref, em28xx_free_device);
> +
> +	usb_set_intfdata(intf, NULL);
>  }
>  
>  static int em28xx_usb_suspend(struct usb_interface *intf,
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
> index 6b84c3413e83..abf9b325eae4 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -1897,7 +1897,7 @@ static int vidioc_g_chip_info(struct file *file, void *priv,
>  		strscpy(chip->name, "ac97", sizeof(chip->name));
>  	else
>  		strscpy(chip->name,
> -			dev->v4l2->v4l2_dev.name, sizeof(chip->name));
> +			dev->v4l2->v4l2_dev->name, sizeof(chip->name));
>  	return 0;
>  }
>  
> @@ -2113,21 +2113,6 @@ static int radio_s_tuner(struct file *file, void *priv,
>  	return 0;
>  }
>  
> -/*
> - * em28xx_free_v4l2() - Free struct em28xx_v4l2
> - *
> - * @ref: struct kref for struct em28xx_v4l2
> - *
> - * Called when all users of struct em28xx_v4l2 are gone
> - */
> -static void em28xx_free_v4l2(struct kref *ref)
> -{
> -	struct em28xx_v4l2 *v4l2 = container_of(ref, struct em28xx_v4l2, ref);
> -
> -	v4l2->dev->v4l2 = NULL;
> -	kfree(v4l2);
> -}
> -
>  /*
>   * em28xx_v4l2_open()
>   * inits the device and starts isoc transfer
> @@ -2153,12 +2138,21 @@ static int em28xx_v4l2_open(struct file *filp)
>  		return -EINVAL;
>  	}
>  
> +	/* To prevent the case when the v4l2_device_put() has already being called,
> +	 * the ref is now 0, we call a v4l2_device_get, and end up accessing freed
> +	 * resources. Or straigth accessing a freed v4l2.
> +	 */
> +	if (!v4l2 || !kref_get_unless_zero(&v4l2->v4l2_dev.ref))
> +		return -ENODEV;
> +

This should not be needed: once the video devices are unregistered, it is no longer
possible to open the video device. So this can't happen.

>  	em28xx_videodbg("open dev=%s type=%s users=%d\n",
>  			video_device_node_name(vdev), v4l2_type_names[fh_type],
>  			v4l2->users);
>  
> -	if (mutex_lock_interruptible(&dev->lock))
> +	if (mutex_lock_interruptible(&dev->lock)) {
> +		v4l2_device_put(&v4l2->v4l2_dev);

So this is also not needed...

>  		return -ERESTARTSYS;
> +	}
>  
>  	ret = v4l2_fh_open(filp);
>  	if (ret) {
> @@ -2166,6 +2160,7 @@ static int em28xx_v4l2_open(struct file *filp)
>  			"%s: v4l2_fh_open() returned error %d\n",
>  		       __func__, ret);
>  		mutex_unlock(&dev->lock);
> +		v4l2_device_put(&v4l2->v4l2_dev);

...and neither is this.

>  		return ret;
>  	}
>  
> @@ -2187,8 +2182,6 @@ static int em28xx_v4l2_open(struct file *filp)
>  		v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, s_radio);
>  	}
>  
> -	kref_get(&dev->ref);
> -	kref_get(&v4l2->ref);
>  	v4l2->users++;
>  
>  	mutex_unlock(&dev->lock);
> @@ -2222,36 +2215,30 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
>  
>  	mutex_lock(&dev->lock);
>  
> -	v4l2_device_disconnect(&v4l2->v4l2_dev);
> -
>  	em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
>  
> -	em28xx_v4l2_media_release(dev);
> -
>  	if (video_is_registered(&v4l2->radio_dev)) {
> -		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
> +		dev_info(&dev->intf->dev,
> +			 "V4L2 device %s deregistered\n",
>  			 video_device_node_name(&v4l2->radio_dev));
> -		video_unregister_device(&v4l2->radio_dev);
> +		vb2_video_unregister_device(&v4l2->radio_dev);
>  	}
>  	if (video_is_registered(&v4l2->vbi_dev)) {
> -		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
> +		dev_info(&dev->intf->dev,
> +			 "V4L2 device %s deregistered\n",
>  			 video_device_node_name(&v4l2->vbi_dev));
> -		video_unregister_device(&v4l2->vbi_dev);
> +		vb2_video_unregister_device(&v4l2->vbi_dev);
>  	}
>  	if (video_is_registered(&v4l2->vdev)) {
> -		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
> +		dev_info(&dev->intf->dev,
> +			 "V4L2 device %s deregistered\n",
>  			 video_device_node_name(&v4l2->vdev));
> -		video_unregister_device(&v4l2->vdev);
> +		vb2_video_unregister_device(&v4l2->vdev);
>  	}
>  
> -	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
> -	v4l2_device_unregister(&v4l2->v4l2_dev);
> -
> -	kref_put(&v4l2->ref, em28xx_free_v4l2);
> -
>  	mutex_unlock(&dev->lock);
>  
> -	kref_put(&dev->ref, em28xx_free_device);
> +	v4l2_device_put(&v4l2->v4l2_dev);
>  
>  	return 0;
>  }
> @@ -2323,9 +2310,8 @@ static int em28xx_v4l2_close(struct file *filp)
>  
>  exit:
>  	v4l2->users--;
> -	kref_put(&v4l2->ref, em28xx_free_v4l2);
>  	mutex_unlock(&dev->lock);
> -	kref_put(&dev->ref, em28xx_free_device);
> +	v4l2_device_put(&v4l2->v4l2_dev);

...and neither is this v4l2_device_put.

>  
>  	return 0;
>  }
> @@ -2517,6 +2503,28 @@ static void em28xx_tuner_setup(struct em28xx *dev, unsigned short tuner_addr)
>  	v4l2_device_call_all(v4l2_dev, 0, tuner, s_frequency, &f);
>  }
>  
> +static void em28xx_v4l2_dev_unregister(struct em28xx *dev)
> +{
> +	struct em28xx_v4l2 *v4l2 = dev->v4l2;
> +
> +	v4l2_device_unregister(&v4l2->v4l2_dev);
> +	em28xx_v4l2_media_release(dev);
> +	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
> +}
> +
> +static void em28xx_v4l2_dev_release(struct v4l2_device *v4l2_dev)
> +{
> +	struct em28xx *dev = v4l2_dev->dev->driver_data;
> +
> +	mutex_lock(&dev->lock);
> +	em28xx_v4l2_dev_unregister(dev);
> +	kfree(dev->v4l2);
> +	dev->v4l2 = NULL;
> +	mutex_unlock(&dev->lock);
> +
> +	kref_put(&dev->ref, em28xx_free_device);
> +}
> +
>  static int em28xx_v4l2_init(struct em28xx *dev)
>  {
>  	u8 val;
> @@ -2524,6 +2532,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  	unsigned int maxw;
>  	struct v4l2_ctrl_handler *hdl;
>  	struct em28xx_v4l2 *v4l2;
> +	struct v4l2_subdev *sd;
>  
>  	if (dev->is_audio_only) {
>  		/* Shouldn't initialize IR for this interface */
> @@ -2541,12 +2550,13 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  
>  	v4l2 = kzalloc(sizeof(*v4l2), GFP_KERNEL);
>  	if (!v4l2) {
> -		mutex_unlock(&dev->lock);
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto err;
>  	}
> -	kref_init(&v4l2->ref);
> +
>  	v4l2->dev = dev;
>  	dev->v4l2 = v4l2;
> +	v4l2->v4l2_dev.release = em28xx_v4l2_dev_release;
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	v4l2->v4l2_dev.mdev = dev->media_dev;
> @@ -2555,7 +2565,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  	if (ret < 0) {
>  		dev_err(&dev->intf->dev,
>  			"Call to v4l2_device_register() failed!\n");
> -		goto err;
> +		goto free_v4l2;
>  	}
>  
>  	hdl = &v4l2->ctrl_handler;
> @@ -2574,25 +2584,53 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  
>  	/* request some modules */
>  
> -	if (dev->has_msp34xx)
> -		v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> -				    &dev->i2c_adap[dev->def_i2c_bus],
> -				    "msp3400", 0, msp3400_addrs);
> +	if (dev->has_msp34xx) {
> +		sd = v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> +					 &dev->i2c_adap[dev->def_i2c_bus],
> +					 "msp3400", 0, msp3400_addrs);
> +		if (!sd) {
> +			dev_err(&dev->intf->dev,
> +				"Error while registering 'msp34xx' v4l2 subdevice!\n");
> +			ret = -EINVAL;
> +			goto unregister_dev;
> +		}
> +	}
>  
> -	if (dev->board.decoder == EM28XX_SAA711X)
> -		v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> -				    &dev->i2c_adap[dev->def_i2c_bus],
> -				    "saa7115_auto", 0, saa711x_addrs);
> +	if (dev->board.decoder == EM28XX_SAA711X) {
> +		sd = v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> +					 &dev->i2c_adap[dev->def_i2c_bus],
> +					 "saa7115_auto", 0, saa711x_addrs);
> +		if (!sd) {
> +			dev_err(&dev->intf->dev,
> +				"Error while registering 'EM28XX_SAA711X' v4l2 subdevice!\n");
> +			ret = -EINVAL;
> +			goto unregister_dev;
> +		}
> +	}
>  
> -	if (dev->board.decoder == EM28XX_TVP5150)
> -		v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> -				    &dev->i2c_adap[dev->def_i2c_bus],
> -				    "tvp5150", 0, tvp5150_addrs);
> +	if (dev->board.decoder == EM28XX_TVP5150) {
> +		sd = v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> +					 &dev->i2c_adap[dev->def_i2c_bus],
> +					 "tvp5150", 0, tvp5150_addrs);
> +		if (!sd) {
> +			dev_err(&dev->intf->dev,
> +				"Error while registering 'EM28XX_TVP5150' v4l2 subdevice!\n");
> +			ret = -EINVAL;
> +			goto unregister_dev;
> +		}
> +	}
>  
> -	if (dev->board.adecoder == EM28XX_TVAUDIO)
> -		v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> -				    &dev->i2c_adap[dev->def_i2c_bus],
> -				    "tvaudio", dev->board.tvaudio_addr, NULL);
> +	if (dev->board.adecoder == EM28XX_TVAUDIO) {
> +		sd = v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> +					 &dev->i2c_adap[dev->def_i2c_bus],
> +					 "tvaudio", dev->board.tvaudio_addr, NULL);
> +		if (!sd) {
> +			dev_err(&dev->intf->dev,
> +				"Error while registering 'EM28XX_TVAUDIO' v4l2 subdevice!\n");
> +			ret = -EINVAL;
> +			goto unregister_dev;
> +		}
> +	}
>  
>  	/* Initialize tuner and camera */
>  
> @@ -2600,33 +2638,63 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  		unsigned short tuner_addr = dev->board.tuner_addr;
>  		int has_demod = (dev->board.tda9887_conf & TDA9887_PRESENT);
>  
> -		if (dev->board.radio.type)
> -			v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> -					    &dev->i2c_adap[dev->def_i2c_bus],
> -					    "tuner", dev->board.radio_addr,
> -					    NULL);
> -
> -		if (has_demod)
> -			v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> -					    &dev->i2c_adap[dev->def_i2c_bus],
> -					    "tuner", 0,
> -					    v4l2_i2c_tuner_addrs(ADDRS_DEMOD));
> +		if (dev->board.radio.type) {
> +			sd = v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> +						 &dev->i2c_adap[dev->def_i2c_bus],
> +						 "tuner", dev->board.radio_addr,
> +						 NULL);
> +			if (!sd) {
> +				dev_err(&dev->intf->dev,
> +					"Error while registering '%s' v4l2 subdevice!\n",
> +					 dev->board.name);
> +				ret = -EINVAL;
> +				goto unregister_dev;
> +			}
> +		}
> +
> +		if (has_demod) {
> +			sd = v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> +						 &dev->i2c_adap[dev->def_i2c_bus],
> +						 "tuner", 0,
> +						 v4l2_i2c_tuner_addrs(ADDRS_DEMOD));
> +			if (!sd) {
> +				dev_err(&dev->intf->dev,
> +					"Error while registering '%s' v4l2 subdevice!\n",
> +					 dev->i2c_adap[dev->def_i2c_bus].name);
> +				ret = -EINVAL;
> +				goto unregister_dev;
> +			}
> +		}
> +
>  		if (tuner_addr == 0) {
>  			enum v4l2_i2c_tuner_type type =
>  				has_demod ? ADDRS_TV_WITH_DEMOD : ADDRS_TV;
> -			struct v4l2_subdev *sd;
>  
>  			sd = v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
>  						 &dev->i2c_adap[dev->def_i2c_bus],
>  						 "tuner", 0,
>  						 v4l2_i2c_tuner_addrs(type));
> -
> -			if (sd)
> +			if (sd) {
>  				tuner_addr = v4l2_i2c_subdev_addr(sd);
> +			} else {
> +				dev_err(&dev->intf->dev,
> +					"Error while registering '%s' v4l2 subdevice!\n",
> +					 dev->i2c_adap[dev->def_i2c_bus].name);
> +				ret = -EINVAL;
> +				goto unregister_dev;
> +			}
> +
>  		} else {
> -			v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> -					    &dev->i2c_adap[dev->def_i2c_bus],
> -					    "tuner", tuner_addr, NULL);
> +			sd = v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
> +						 &dev->i2c_adap[dev->def_i2c_bus],
> +						 "tuner", tuner_addr, NULL);
> +			if (!sd) {
> +				dev_err(&dev->intf->dev,
> +					"Error while registering '%s' v4l2 subdevice!\n",
> +					 dev->i2c_adap[dev->def_i2c_bus].name);
> +				ret = -EINVAL;
> +				goto unregister_dev;
> +			}
>  		}
>  
>  		em28xx_tuner_setup(dev, tuner_addr);
> @@ -2755,7 +2823,6 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  	if (ret)
>  		goto unregister_dev;
>  
> -	/* allocate and fill video video_device struct */
>  	em28xx_vdev_init(dev, &v4l2->vdev, &em28xx_video_template, "video");
>  	mutex_init(&v4l2->vb_queue_lock);
>  	mutex_init(&v4l2->vb_vbi_queue_lock);
> @@ -2768,7 +2835,6 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  	if (dev->tuner_type != TUNER_ABSENT)
>  		v4l2->vdev.device_caps |= V4L2_CAP_TUNER;
>  
> -
>  	/* disable inapplicable ioctls */
>  	if (dev->is_webcam) {
>  		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_QUERYSTD);
> @@ -2889,26 +2955,26 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  		dev_info(&dev->intf->dev,
>  			 "V4L2 device %s deregistered\n",
>  			 video_device_node_name(&v4l2->radio_dev));
> -		video_unregister_device(&v4l2->radio_dev);
> +		vb2_video_unregister_device(&v4l2->radio_dev);
>  	}
>  	if (video_is_registered(&v4l2->vbi_dev)) {
>  		dev_info(&dev->intf->dev,
>  			 "V4L2 device %s deregistered\n",
>  			 video_device_node_name(&v4l2->vbi_dev));
> -		video_unregister_device(&v4l2->vbi_dev);
> +		vb2_video_unregister_device(&v4l2->vbi_dev);
>  	}
>  	if (video_is_registered(&v4l2->vdev)) {
>  		dev_info(&dev->intf->dev,
>  			 "V4L2 device %s deregistered\n",
>  			 video_device_node_name(&v4l2->vdev));
> -		video_unregister_device(&v4l2->vdev);
> +		vb2_video_unregister_device(&v4l2->vdev);
>  	}
>  
> -	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
> -	v4l2_device_unregister(&v4l2->v4l2_dev);
> -err:
> +	em28xx_v4l2_dev_unregister(dev);
> +free_v4l2:
> +	kfree(v4l2);
>  	dev->v4l2 = NULL;
> -	kref_put(&v4l2->ref, em28xx_free_v4l2);
> +err:
>  	mutex_unlock(&dev->lock);
>  	return ret;
>  }
> diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
> index ab167cd1f400..666b7eff55f4 100644
> --- a/drivers/media/usb/em28xx/em28xx.h
> +++ b/drivers/media/usb/em28xx/em28xx.h
> @@ -549,7 +549,6 @@ struct em28xx_eeprom {
>  #define EM28XX_RESOURCE_VBI   0x02
>  
>  struct em28xx_v4l2 {
> -	struct kref ref;
>  	struct em28xx *dev;
>  
>  	struct v4l2_device v4l2_dev;
> 

With the suggested changes it should be ready (pending testing on my side).

Regards,

	Hans
