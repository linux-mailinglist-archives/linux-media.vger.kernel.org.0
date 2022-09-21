Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7D65BFA17
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 11:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbiIUJFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 05:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbiIUJFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 05:05:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82BFF4B0D1
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 02:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663751112;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aerX/9Flbjhu2EowpKtjpclr8FsZhH3XSaA9EvcPmr4=;
        b=FlH7E40jmsteY6JuHh4z+Pg3WGFi2J5AwbFcoguzkM+qV2nWpw4nmY3nfo+5pjtB/T/LSw
        wp9FWuA4k5XoP8xRV/zeItLJTs6Mhjgvsxjm1ndGzI6J8YGUPizNMlt+6upw9XomYBqbN3
        6NPWxrdJ0W1535ZhQg5ljMqCaCDYD30=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-zwm8VG5pPVWZ6h_mUYIQdA-1; Wed, 21 Sep 2022 05:05:10 -0400
X-MC-Unique: zwm8VG5pPVWZ6h_mUYIQdA-1
Received: by mail-ed1-f71.google.com with SMTP id b16-20020a056402279000b0044f1102e6e2so3959829ede.20
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 02:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aerX/9Flbjhu2EowpKtjpclr8FsZhH3XSaA9EvcPmr4=;
        b=Zl4IGy5EtI/lsAS9agORWGJBmsqamjA/R04ayBSFeaGMFvivhnQGrAXZ2+VogbV5n2
         OVyXojZ+KYdNjJ/q+WX12/LA90pgusmi2ddr5vhYggWrr6jx5pfjJbSF/6rTLqAE/F0B
         uv8g7+st2T86p48r+RDQopk5id3bar5HGpEmYUZF5OjivfH+zuOW2Nbe4zrqqarx4JFy
         L0Izkj9YPfdNvEfXvWsl62JaXBnl2iTcp6DnfiDes6Bhx7ArwXgL6xEqKIV9FD/LLAdp
         JW1Vk7np711wIEKab/WSMZwKE/e2oQi/8GbLsUzcLNXZmWG0lFSEAp7AZUacolNigLlu
         yETQ==
X-Gm-Message-State: ACrzQf2I3yoHvjMLOjqslPBrMMb7wJ08bm9rTCoGp5U6PbCAtUfgBj9Z
        CUg5Sr0pGis0k3tqthXQ1MQVJiPp0RJCuMQe5ZA23Rd/7c32wtCF9R0oluIQ3uIxon0EAkk/jxI
        q7zFZktfDxKQWIpk7+MNK4LE=
X-Received: by 2002:a17:907:da9:b0:780:5fe8:f8d7 with SMTP id go41-20020a1709070da900b007805fe8f8d7mr20010660ejc.357.1663751108993;
        Wed, 21 Sep 2022 02:05:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM521JdnNXBeVTDN0jlkq0kPCC4cvLrKemM8rLtswJsa/3fDTzWSyhR7CsV75pUoFGkgkS1PTg==
X-Received: by 2002:a17:907:da9:b0:780:5fe8:f8d7 with SMTP id go41-20020a1709070da900b007805fe8f8d7mr20010630ejc.357.1663751108680;
        Wed, 21 Sep 2022 02:05:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f14-20020a17090631ce00b0074ae59d85a4sm1063533ejf.20.2022.09.21.02.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 02:05:08 -0700 (PDT)
Message-ID: <bc6c2ccc-98ee-c26c-a130-ba868e307eb4@redhat.com>
Date:   Wed, 21 Sep 2022 11:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 05/17] media: atomisp: Add atomisp_pipe_check() helper
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220911171653.568932-1-hdegoede@redhat.com>
 <20220911171653.568932-6-hdegoede@redhat.com>
 <Yx8YOj7L9V32qC7D@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yx8YOj7L9V32qC7D@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 9/12/22 13:30, Andy Shevchenko wrote:
> On Sun, Sep 11, 2022 at 07:16:41PM +0200, Hans de Goede wrote:
>> Several of the ioctl handlers all do the same checks
>> (isp->fatal_error and asd->streaming errors) add
>> an atomisp_pipe_check() helper for this.
>>
>> Note this changes the vidioc_s_fmt_vid_cap and vidioc_s_input handlers
>> to now reject calls made while asd->streaming==STOPPING. This fixes
>> a possible race where one thread can make this ioctls while
>> vidioc_streamoff is running from another thread and it has
>> temporarily released isp->mutex to kill the watchdog timers / work.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> (One minor question below)
> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  9 +-
>>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 89 +++++++++----------
>>  .../staging/media/atomisp/pci/atomisp_ioctl.h |  2 +
>>  3 files changed, 48 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>> index 087078900415..7945852ecd13 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
>> @@ -5549,16 +5549,13 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
>>  	struct v4l2_subdev_fh fh;
>>  	int ret;
>>  
>> -	lockdep_assert_held(&isp->mutex);
>> +	ret = atomisp_pipe_check(pipe, true);
>> +	if (ret)
>> +		return ret;
>>  
>>  	if (source_pad >= ATOMISP_SUBDEV_PADS_NUM)
>>  		return -EINVAL;
>>  
>> -	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
>> -		dev_warn(isp->dev, "ISP does not support set format while at streaming!\n");
>> -		return -EBUSY;
>> -	}
>> -
>>  	dev_dbg(isp->dev,
>>  		"setting resolution %ux%u on pad %u for asd%d, bytesperline %u\n",
>>  		f->fmt.pix.width, f->fmt.pix.height, source_pad,
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
>> index 9c7022be3a06..9b50f637c46a 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
>> @@ -535,6 +535,32 @@ atomisp_get_format_bridge_from_mbus(u32 mbus_code)
>>  	return NULL;
>>  }
>>  
>> +int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool settings_change)
>> +{
>> +	lockdep_assert_held(&pipe->isp->mutex);
>> +
>> +	if (pipe->isp->isp_fatal_error)
>> +		return -EIO;
>> +
>> +	switch (pipe->asd->streaming) {
>> +	case ATOMISP_DEVICE_STREAMING_DISABLED:
>> +		break;
>> +	case ATOMISP_DEVICE_STREAMING_ENABLED:
>> +		if (settings_change) {
>> +			dev_err(pipe->isp->dev, "Set fmt/input IOCTL while streaming\n");
>> +			return -EBUSY;
>> +		}
>> +		break;
> 
>> +	case ATOMISP_DEVICE_STREAMING_STOPPING:
>> +		dev_err(pipe->isp->dev, "IOCTL issued while stopping\n");
>> +		return -EBUSY;
> 
> Wouldn't -EAGAIN match better in this case?

The original checks this replaces used -EIO (which seems like a poor
choice) resp. -EBUSY (in the streamon callback) so I decided to
keep the -EBUSY here.

Also AFAIK -EAGAIN will make the C-library retry the syscal itself
in some cases ? (not sure if this applies to ioctls though).

This is not what we want, this scenario can only be hit when an app:
1. Uses both the preview and the actual capture /dev/video# nodes
   at the same time (this is allows)
2. Then stops the stream at 1 of them, this transitions the state
   to STOPPING
3. Then does some ioctl other then streamoff on the other /dev/video#

Basically when using more then 1 /dev/video# node then the app must
stop all of them when stopping things. The driver enforces this
by rejecting all calls other the streamoff until all /dev/video#
node streans are off.

This means that simply trying again will result in the same error,
so -EBUSY seems like the best error for this.

Regards,

Hans

   
> 
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  /*
>>   * v4l2 ioctls
>>   * return ISP capabilities
>> @@ -646,12 +672,18 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
>>  {
>>  	struct video_device *vdev = video_devdata(file);
>>  	struct atomisp_device *isp = video_get_drvdata(vdev);
>> -	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
>> +	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
>> +	struct atomisp_sub_device *asd = pipe->asd;
>>  	struct v4l2_subdev *camera = NULL;
>>  	struct v4l2_subdev *motor;
>>  	int ret;
>>  
>>  	mutex_lock(&isp->mutex);
>> +
>> +	ret = atomisp_pipe_check(pipe, true);
>> +	if (ret)
>> +		goto error;
>> +
>>  	if (input >= ATOM_ISP_MAX_INPUTS || input >= isp->input_cnt) {
>>  		dev_dbg(isp->dev, "input_cnt: %d\n", isp->input_cnt);
>>  		ret = -EINVAL;
>> @@ -678,13 +710,6 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
>>  		goto error;
>>  	}
>>  
>> -	if (atomisp_subdev_streaming_count(asd)) {
>> -		dev_err(isp->dev,
>> -			"ISP is still streaming, stop first\n");
>> -		ret = -EINVAL;
>> -		goto error;
>> -	}
>> -
>>  	/* power off the current owned sensor, as it is not used this time */
>>  	if (isp->inputs[asd->input_curr].asd == asd &&
>>  	    asd->input_curr != input) {
>> @@ -976,11 +1001,6 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
>>  	int ret;
>>  
>>  	mutex_lock(&isp->mutex);
>> -	if (isp->isp_fatal_error) {
>> -		ret = -EIO;
>> -		mutex_unlock(&isp->mutex);
>> -		return ret;
>> -	}
>>  	ret = atomisp_set_fmt(vdev, f);
>>  	mutex_unlock(&isp->mutex);
>>  	return ret;
>> @@ -1236,20 +1256,13 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>>  	struct ia_css_frame *handle = NULL;
>>  	u32 length;
>>  	u32 pgnr;
>> -	int ret = 0;
>> +	int ret;
>>  
>>  	mutex_lock(&isp->mutex);
>> -	if (isp->isp_fatal_error) {
>> -		ret = -EIO;
>> -		goto error;
>> -	}
>>  
>> -	if (asd->streaming == ATOMISP_DEVICE_STREAMING_STOPPING) {
>> -		dev_err(isp->dev, "%s: reject, as ISP at stopping.\n",
>> -			__func__);
>> -		ret = -EIO;
>> +	ret = atomisp_pipe_check(pipe, false);
>> +	if (ret)
>>  		goto error;
>> -	}
>>  
>>  	if (!buf || buf->index >= VIDEO_MAX_FRAME ||
>>  	    !pipe->capq.bufs[buf->index]) {
>> @@ -1418,23 +1431,13 @@ static int atomisp_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>>  	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
>>  	struct atomisp_sub_device *asd = pipe->asd;
>>  	struct atomisp_device *isp = video_get_drvdata(vdev);
>> -	int ret = 0;
>> +	int ret;
>>  
>>  	mutex_lock(&isp->mutex);
>> -
>> -	if (isp->isp_fatal_error) {
>> -		mutex_unlock(&isp->mutex);
>> -		return -EIO;
>> -	}
>> -
>> -	if (asd->streaming == ATOMISP_DEVICE_STREAMING_STOPPING) {
>> -		mutex_unlock(&isp->mutex);
>> -		dev_err(isp->dev, "%s: reject, as ISP at stopping.\n",
>> -			__func__);
>> -		return -EIO;
>> -	}
>> -
>> +	ret = atomisp_pipe_check(pipe, false);
>>  	mutex_unlock(&isp->mutex);
>> +	if (ret)
>> +		return ret;
>>  
>>  	ret = videobuf_dqbuf(&pipe->capq, buf, file->f_flags & O_NONBLOCK);
>>  	if (ret) {
>> @@ -1668,8 +1671,8 @@ static int atomisp_streamon(struct file *file, void *fh,
>>  	enum ia_css_pipe_id css_pipe_id;
>>  	unsigned int sensor_start_stream;
>>  	unsigned int wdt_duration = ATOMISP_ISP_TIMEOUT_DURATION;
>> -	int ret = 0;
>>  	unsigned long irqflags;
>> +	int ret;
>>  
>>  	dev_dbg(isp->dev, "Start stream on pad %d for asd%d\n",
>>  		atomisp_subdev_source_pad(vdev), asd->index);
>> @@ -1680,15 +1683,9 @@ static int atomisp_streamon(struct file *file, void *fh,
>>  	}
>>  
>>  	mutex_lock(&isp->mutex);
>> -	if (isp->isp_fatal_error) {
>> -		ret = -EIO;
>> -		goto out;
>> -	}
>> -
>> -	if (asd->streaming == ATOMISP_DEVICE_STREAMING_STOPPING) {
>> -		ret = -EBUSY;
>> +	ret = atomisp_pipe_check(pipe, false);
>> +	if (ret)
>>  		goto out;
>> -	}
>>  
>>  	if (pipe->capq.streaming)
>>  		goto out;
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
>> index 382b78275240..61a6148a6ad5 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
>> @@ -34,6 +34,8 @@ atomisp_format_bridge *atomisp_get_format_bridge(unsigned int pixelformat);
>>  const struct
>>  atomisp_format_bridge *atomisp_get_format_bridge_from_mbus(u32 mbus_code);
>>  
>> +int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool streaming_ok);
>> +
>>  int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
>>  				uint16_t stream_id);
>>  
>> -- 
>> 2.37.3
>>
> 

