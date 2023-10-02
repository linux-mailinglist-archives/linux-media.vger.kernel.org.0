Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B807B5964
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 19:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235501AbjJBRmy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 13:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbjJBRmx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 13:42:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8399E
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 10:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696268523;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e73cb9GAxrHKKm8uol5mHP14w75EOoHSyexqxYqy2n8=;
        b=OQCGRqxQMr8FLOIdXpZKOe8cTAl4jflxByljKDE4dpdXASv+Yjj7iWyZcjZou5Zy9bOUry
        nR4Mqz4I5/0xdnJBMWGuvVTOzb8hYbVi7ELZBzaB+RM+DRpjgrs5ACwjq8w+VdBBHmcZda
        vYwP/7cpRYq+ITK+lJPqIc9ZeEidZ08=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-3nWV5e1sPtSYKSExYkTBXA-1; Mon, 02 Oct 2023 13:41:56 -0400
X-MC-Unique: 3nWV5e1sPtSYKSExYkTBXA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9ae70250ef5so381509866b.0
        for <linux-media@vger.kernel.org>; Mon, 02 Oct 2023 10:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696268515; x=1696873315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e73cb9GAxrHKKm8uol5mHP14w75EOoHSyexqxYqy2n8=;
        b=Uh/nCgKcz18F1MQbS3KGs5WYd+jMc1YrrRsmCUcLrcbDm5NzaF3ymsh8g7uDcNjPKD
         VZuckSSY8GNyAR3DM4rQvaVOfUm6xtJ5TkhCocc/G1JtiJYSL55OD/OMA0se2RHheuGd
         LVY3DlJmqmkrKYYj+FwBqaxAfSp4icxlNKZtnBw8mKILYNtZQ6HV4KJu6TiSl7zFXsGx
         tSvZDD1uzbTpH2o+rADtLV9mi6tT583LoAkUIrN480O0PJQOCejXw1TGJ/I731TGhivR
         IeMEVKzk8ECyqw1OQBHIVifz3AZMHjHDoWwYBHa03gwRo4HV9DTiO5k10624i4uhUO8/
         A7xA==
X-Gm-Message-State: AOJu0Yz+nWnyr48P7sgILOd7U5K810jjvMGk29DPJBLiERL+PePjTOEs
        frnqnA+YJza6h+dH+3jUq5t2Fwxp0kEA55RWIqlB4YAE6sh3SgDKmDrgytHqsibACUF+EApgvB+
        pmya7YPrqSOFjzI3DqQvXGuI=
X-Received: by 2002:a17:907:75d4:b0:9ae:614e:4560 with SMTP id jl20-20020a17090775d400b009ae614e4560mr296411ejc.29.1696268515695;
        Mon, 02 Oct 2023 10:41:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHalaDvE12EI3Zn+7MkJf0Xh7EB4gjqcjUravzQXRLCoCJ6CTKXPK9U8CWUMRvDlGy/RVy0Ug==
X-Received: by 2002:a17:907:75d4:b0:9ae:614e:4560 with SMTP id jl20-20020a17090775d400b009ae614e4560mr296397ejc.29.1696268515288;
        Mon, 02 Oct 2023 10:41:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k3-20020a17090646c300b009ae57888718sm17305820ejs.207.2023.10.02.10.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 10:41:54 -0700 (PDT)
Message-ID: <2cd7e607-88f0-d173-3423-5ef3f760bd19@redhat.com>
Date:   Mon, 2 Oct 2023 19:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        Claus Stovgaard <claus.stovgaard@gmail.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
References: <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
 <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
 <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
 <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
 <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
 <1d03c5f9-1813-40f0-f280-520e2da38e09@hansg.org>
 <1d46186b-24a6-3ae9-ccc1-0ada0f068313@redhat.com>
 <253b5ba6-d44d-4ee1-8c18-44159632d023@redhat.com>
 <DM8PR11MB565393F11EDB68BB5784661C99E9A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <bc4a6204-6487-9403-243d-6f0a1b20e8ab@redhat.com>
 <20231002173841.GD10113@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231002173841.GD10113@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/2/23 19:38, Laurent Pinchart wrote:
> On Mon, Oct 02, 2023 at 07:19:13PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 9/4/23 05:13, Cao, Bingbu wrote:
>>> Hans,
>>>
>>> Thanks for your test and report.
>>>
>>> I have made some changes locally which will support the latest
>>> v4l2-async APIs, I will also add the fix for this issue and merge
>>> them in v3.
>>
>> I have been trying to make rawbayer capture with the mainline isys code
>> work in libcamera and I have hit several short comings in the ipu6-isys
>> code. I have attached 3 patches to fix various issues please integrate
>> these into the next version of this series.
> 
> They look good to me.

Actually I just realized I forgot to commit + squash in a bug fix:

>> Talking about the next version of this series, I think it would be
>> good to post a new version soon ?
>>
> 
>> From 14f42fd3071a7aba8b83b98802ca3b413794296d Mon Sep 17 00:00:00 2001
>> From: Hans de Goede <hdegoede@redhat.com>
>> Date: Mon, 2 Oct 2023 16:37:11 +0200
>> Subject: [PATCH 1/3] media: intel/ipu6: Add mbus code filtering to isys
>>  /dev/video enum_fmt
>>
>> Add mbus code filtering to ipu6_isys_vidioc_enum_fmt().
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 29 +++++++++++++++----
>>  1 file changed, 23 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> index dc1605491352..20fd03f6f204 100644
>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> @@ -130,14 +130,31 @@ int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
>>  int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
>>  			      struct v4l2_fmtdesc *f)
>>  {
>> -	if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
>> -		return -EINVAL;
>> +	unsigned int i, found = 0;
>>  
>> -	f->flags = 0;
>> -	f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
>> -	f->mbus_code = ipu6_isys_pfmts[f->index].code;
>> +	if (!f->mbus_code) {
>> +		if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
>> +			return -EINVAL;
>>  
>> -	return 0;
>> +		f->flags = 0;
>> +		f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
>> +		f->mbus_code = ipu6_isys_pfmts[f->index].code;

There is a:
		return 0;

missing here.		

>> +	}
>> +

Regards,

Hans



>> +	for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
>> +		if (f->mbus_code != ipu6_isys_pfmts[i].code)
>> +			continue;
>> +
>> +		if (f->index == found) {
>> +			f->flags = 0;
>> +			f->pixelformat = ipu6_isys_pfmts[i].pixelformat;
>> +			return 0;
>> +		}
>> +
>> +		found++;
>> +	}
>> +
>> +	return -EINVAL;
>>  }
>>  
>>  static int vidioc_g_fmt_vid_cap_mplane(struct file *file, void *fh,
>> -- 
>> 2.41.0
>>
> 
>> From 8250d2c3fd1c2ab83debcca80b4947d3b9d410f7 Mon Sep 17 00:00:00 2001
>> From: Hans de Goede <hdegoede@redhat.com>
>> Date: Mon, 2 Oct 2023 17:02:06 +0200
>> Subject: [PATCH 2/3] media: intel/ipu6: Implement g_enum_framesizes for isys
>>  /dev/video# nodes
>>
>> Implement g_enum_framesizes for isys /dev/video# nodes.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> index 20fd03f6f204..ad74a19527b7 100644
>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> @@ -157,6 +157,23 @@ int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
>>  	return -EINVAL;
>>  }
>>  
>> +static int ipu6_isys_vidioc_g_enum_framesizes(struct file *file, void *fh,
>> +					      struct v4l2_frmsizeenum *fsize)
>> +{
>> +	if (fsize->index > 0)
>> +		return -EINVAL;
>> +
>> +	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
>> +	fsize->stepwise.min_width = IPU6_ISYS_MIN_WIDTH;
>> +	fsize->stepwise.max_width = IPU6_ISYS_MAX_WIDTH;
>> +	fsize->stepwise.min_height = IPU6_ISYS_MIN_HEIGHT;
>> +	fsize->stepwise.max_height = IPU6_ISYS_MAX_HEIGHT;
>> +	fsize->stepwise.step_width = 1;
>> +	fsize->stepwise.step_height = 1;
>> +
>> +	return 0;
>> +}
>> +
>>  static int vidioc_g_fmt_vid_cap_mplane(struct file *file, void *fh,
>>  				       struct v4l2_format *fmt)
>>  {
>> @@ -987,6 +1004,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
>>  static const struct v4l2_ioctl_ops ioctl_ops_mplane = {
>>  	.vidioc_querycap = ipu6_isys_vidioc_querycap,
>>  	.vidioc_enum_fmt_vid_cap = ipu6_isys_vidioc_enum_fmt,
>> +	.vidioc_enum_framesizes = ipu6_isys_vidioc_g_enum_framesizes,
>>  	.vidioc_g_fmt_vid_cap_mplane = vidioc_g_fmt_vid_cap_mplane,
>>  	.vidioc_s_fmt_vid_cap_mplane = vidioc_s_fmt_vid_cap_mplane,
>>  	.vidioc_try_fmt_vid_cap_mplane = vidioc_try_fmt_vid_cap_mplane,
>> -- 
>> 2.41.0
>>
> 
>> From b5db94bbd147711885986c1f6e46f59fdca10d3c Mon Sep 17 00:00:00 2001
>> From: Hans de Goede <hdegoede@redhat.com>
>> Date: Mon, 2 Oct 2023 16:05:35 +0200
>> Subject: [PATCH 3/3] media: intel/ipu6: Set V4L2_CAP_IO_MC flag for isys
>>  /dev/video# nodes
>>
>> The IPU6 isys is a media-controller centric device which needs
>> the pipeline to be configured using the media controller API before use.
>>
>> Set the V4L2_CAP_IO_MC flag to reflect this.
>>
>> This also allows dropping of the enum_input() g_input() and s_input()
>> implementations, with V4L2_CAP_IO_MC set the v4l2-core will take care
>> of those.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 29 ++-----------------
>>  1 file changed, 2 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> index ad74a19527b7..e6fc32603c3f 100644
>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> @@ -262,29 +262,6 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *fh,
>>  	return 0;
>>  }
>>  
>> -static int vidioc_enum_input(struct file *file, void *fh,
>> -			     struct v4l2_input *input)
>> -{
>> -	if (input->index > 0)
>> -		return -EINVAL;
>> -	strscpy(input->name, "camera", sizeof(input->name));
>> -	input->type = V4L2_INPUT_TYPE_CAMERA;
>> -
>> -	return 0;
>> -}
>> -
>> -static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
>> -{
>> -	*input = 0;
>> -
>> -	return 0;
>> -}
>> -
>> -static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
>> -{
>> -	return input == 0 ? 0 : -EINVAL;
>> -}
>> -
>>  static int link_validate(struct media_link *link)
>>  {
>>  	struct ipu6_isys_video *av =
>> @@ -1017,9 +994,6 @@ static const struct v4l2_ioctl_ops ioctl_ops_mplane = {
>>  	.vidioc_streamon = vb2_ioctl_streamon,
>>  	.vidioc_streamoff = vb2_ioctl_streamoff,
>>  	.vidioc_expbuf = vb2_ioctl_expbuf,
>> -	.vidioc_enum_input = vidioc_enum_input,
>> -	.vidioc_g_input = vidioc_g_input,
>> -	.vidioc_s_input = vidioc_s_input,
>>  };
>>  
>>  static const struct media_entity_operations entity_ops = {
>> @@ -1217,7 +1191,8 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
>>  
>>  	mutex_init(&av->mutex);
>>  	av->vdev.device_caps = V4L2_CAP_STREAMING |
>> -			       V4L2_CAP_VIDEO_CAPTURE_MPLANE;
>> +			       V4L2_CAP_VIDEO_CAPTURE_MPLANE |
>> +			       V4L2_CAP_IO_MC;
>>  	av->vdev.vfl_dir = VFL_DIR_RX;
>>  
>>  	ret = ipu6_isys_queue_init(&av->aq);
>> -- 
>> 2.41.0
>>
> 
> 

