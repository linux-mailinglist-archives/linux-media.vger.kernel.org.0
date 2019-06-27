Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37A7157D6F
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 09:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfF0HqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 03:46:18 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42561 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726059AbfF0HqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 03:46:18 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id gP6ihdi1JF85OgP6lhnC3c; Thu, 27 Jun 2019 09:46:16 +0200
Subject: Re: [Linux-kernel-mentees] [PATCH v4 RESEND] Media: Radio: Change
 devm_k*alloc to k*alloc
To:     Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190622010438.GA10125@luke-XPS-13>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a573b294-a6e6-be8c-d5ec-1080166773d7@xs4all.nl>
Date:   Thu, 27 Jun 2019 09:46:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190622010438.GA10125@luke-XPS-13>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH/BHMZiytsX8ZZmsaoJpkZqGXJfr/oG9F/51zmWhayYKT/X2vNqPqJBQwEJATluHP8UqtaeQ6fTKP7E40GwU1OGXpvAZrdWcOL7zYLLNzQaKWA70dRl
 cAIl+6jSBRsWbrDBA0fwp8zhXPW4FAX/NT1eI1Ur6/5alUbbIAvrQ8Drun2422gy66EsVmLmorZgjmNEZsnhFy2qTOEL8qyZ3GB3OUEnvvsyFZ2kgBjsgRan
 7WH/KPkyevLORYHB0CBJXrtxzSLgz92wEl20tPJLJzkLcWIYeijqzob2cCStuhhc5JBGqsHay6xzL1QTE4ZWcMcPQ/NbyUYgxdnjghWBssKpilawMA/ej1Ic
 MUkM8V/n
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luke,

On 6/22/19 3:04 AM, Luke Nowakowski-Krijger wrote:
> Change devm_k*alloc to k*alloc to manually allocate memory 
> 
> The manual allocation and freeing of memory is necessary because when
> the USB radio is disconnected, the memory associated with devm_k*alloc
> is freed. Meaning if we still have unresolved references to the radio
> device, then we get use-after-free errors. 
> 
> This patch fixes this by manually allocating memory, and freeing it in 
> the v4l2.release callback that gets called when the last radio device
> exits. 
> 
> Reported-and-tested-by: syzbot+a4387f5b6b799f6becbf@syzkaller.appspotmail.com
> Signed-off-by: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>

I've tested this patch with my raremono (I must be the last person on earth
to 1) have one, and 2) run it under linux!) and it works!

I'm accepting this patch, but I made some small changes, so for future reference:

1) The subject should have the driver name as prefix, so:

   media: radio-raremono: change devm_k*alloc to k*alloc

   That way reviewers can see based on the prefix who should review the patch.
   Radio driver are my responsibility, so that would be me.

2) Always run 'checkpatch.pl --strict'. It reported some minor issues:

CHECK: Please don't use multiple blank lines
#17: FILE: drivers/media/radio/radio-raremono.c:280:
+
+

CHECK: Prefer kzalloc(sizeof(*radio)...) over kzalloc(sizeof(struct raremono_device)...)
#30: FILE: drivers/media/radio/radio-raremono.c:305:
+       radio = kzalloc(sizeof(struct raremono_device), GFP_KERNEL);


I've fixed these issues, but next time remember to run checkpatch before submitting
the patch.

Regards,

	Hans

> ---
> Changes in RESEND: 
> + Added reported-and-tested-by tag
> + Further updated description
> - Removed whitespace in patch description
> Changes in v4:
> - Removed whitespace to fix checkpatch.pl errors
> Changes in v3:
> + Update release method in v2 for v4l2.release callback 
> + Assign v4l2.release callback to release method
> - Remove vdev.release callback used in v2
> Changes in v2:
> + Create raremono_device_release method
> + Assign vdev.release to release method
> + Added gotos for better memory cleanup
> - Removed incorrect kfrees in usb_release in v1
> Changes in v1: 
> + Added k*allocs to raremono_device struct, and buffs
> + Added kfrees on error conditions in usb_probe
> + Added kfrees in usb_release
> - Removed devm_k*allocs
> 
>  drivers/media/radio/radio-raremono.c | 31 +++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/radio/radio-raremono.c b/drivers/media/radio/radio-raremono.c
> index 5e782b3c2fa9..a5b12372eccb 100644
> --- a/drivers/media/radio/radio-raremono.c
> +++ b/drivers/media/radio/radio-raremono.c
> @@ -271,6 +271,15 @@ static int vidioc_g_frequency(struct file *file, void *priv,
>  	return 0;
>  }
>  
> +static void raremono_device_release(struct v4l2_device *v4l2_dev)
> +{
> +	struct raremono_device *radio = to_raremono_dev(v4l2_dev);
> +
> +	kfree(radio->buffer);
> +	kfree(radio);
> +}
> +
> +
>  /* File system interface */
>  static const struct v4l2_file_operations usb_raremono_fops = {
>  	.owner		= THIS_MODULE,
> @@ -295,12 +304,14 @@ static int usb_raremono_probe(struct usb_interface *intf,
>  	struct raremono_device *radio;
>  	int retval = 0;
>  
> -	radio = devm_kzalloc(&intf->dev, sizeof(struct raremono_device), GFP_KERNEL);
> -	if (radio)
> -		radio->buffer = devm_kmalloc(&intf->dev, BUFFER_LENGTH, GFP_KERNEL);
> -
> -	if (!radio || !radio->buffer)
> +	radio = kzalloc(sizeof(struct raremono_device), GFP_KERNEL);
> +	if (!radio)
> +		return -ENOMEM;
> +	radio->buffer = kmalloc(BUFFER_LENGTH, GFP_KERNEL);
> +	if (!radio->buffer) {
> +		kfree(radio);
>  		return -ENOMEM;
> +	}
>  
>  	radio->usbdev = interface_to_usbdev(intf);
>  	radio->intf = intf;
> @@ -324,7 +335,8 @@ static int usb_raremono_probe(struct usb_interface *intf,
>  	if (retval != 3 ||
>  	    (get_unaligned_be16(&radio->buffer[1]) & 0xfff) == 0x0242) {
>  		dev_info(&intf->dev, "this is not Thanko's Raremono.\n");
> -		return -ENODEV;
> +		retval = -ENODEV;
> +		goto free_mem;
>  	}
>  
>  	dev_info(&intf->dev, "Thanko's Raremono connected: (%04X:%04X)\n",
> @@ -333,7 +345,7 @@ static int usb_raremono_probe(struct usb_interface *intf,
>  	retval = v4l2_device_register(&intf->dev, &radio->v4l2_dev);
>  	if (retval < 0) {
>  		dev_err(&intf->dev, "couldn't register v4l2_device\n");
> -		return retval;
> +		goto free_mem;
>  	}
>  
>  	mutex_init(&radio->lock);
> @@ -345,6 +357,7 @@ static int usb_raremono_probe(struct usb_interface *intf,
>  	radio->vdev.ioctl_ops = &usb_raremono_ioctl_ops;
>  	radio->vdev.lock = &radio->lock;
>  	radio->vdev.release = video_device_release_empty;
> +	radio->v4l2_dev.release = raremono_device_release;
>  
>  	usb_set_intfdata(intf, &radio->v4l2_dev);
>  
> @@ -360,6 +373,10 @@ static int usb_raremono_probe(struct usb_interface *intf,
>  	}
>  	dev_err(&intf->dev, "could not register video device\n");
>  	v4l2_device_unregister(&radio->v4l2_dev);
> +
> +free_mem:
> +	kfree(radio->buffer);
> +	kfree(radio);
>  	return retval;
>  }
>  
> 

