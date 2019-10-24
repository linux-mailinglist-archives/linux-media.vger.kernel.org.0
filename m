Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA9DE2F64
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 12:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406308AbfJXKuA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 06:50:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49976 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404139AbfJXKuA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 06:50:00 -0400
Received: from [IPv6:2a02:8429:8174:401:9a7f:8789:6b2c:98e] (2a02-8429-8174-0401-9a7f-8789-6b2c-098e.rev.sfr.net [IPv6:2a02:8429:8174:401:9a7f:8789:6b2c:98e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1D2A428FE3A;
        Thu, 24 Oct 2019 11:49:58 +0100 (BST)
Subject: Re: [PATCH v4 1/2] media: vimc: move the dev field of each entity to
 vimc_ent_dev
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     helen.koike@collabora.com, skhan@linuxfoundation.org,
        kernel@collabora.com, dafna3@gmail.com
References: <20191024093525.10059-1-dafna.hirschfeld@collabora.com>
 <20191024093525.10059-2-dafna.hirschfeld@collabora.com>
 <c5177e5b-6004-5f0e-fba2-49463fb4fa84@xs4all.nl>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <2ae81626-f07f-50e6-29a4-311332773f16@collabora.com>
Date:   Thu, 24 Oct 2019 12:49:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c5177e5b-6004-5f0e-fba2-49463fb4fa84@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/24/19 11:42 AM, Hans Verkuil wrote:
> On 10/24/19 11:35 AM, Dafna Hirschfeld wrote:
>> Since the 'struct device *dev' field exists in each of the
>> entity structs, it can be moved to the common struct vimc_ent_devevice.
>> It is then used to replace 'pr_err' with 'dev_err' in the streamer
>> code.
> 
> This patch is unchanged from v3, right? Since I added the v3 1/2 patch to my
> vimc PR earlier this week.
> 
right, only 2/2 patch was changed since v3,
Dafna

> Regards,
> 
> 	Hans
> 
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/media/platform/vimc/vimc-capture.c  |  7 +++----
>>   drivers/media/platform/vimc/vimc-common.h   |  2 ++
>>   drivers/media/platform/vimc/vimc-debayer.c  | 15 +++++++--------
>>   drivers/media/platform/vimc/vimc-scaler.c   | 11 +++++------
>>   drivers/media/platform/vimc/vimc-sensor.c   |  5 ++---
>>   drivers/media/platform/vimc/vimc-streamer.c |  2 +-
>>   6 files changed, 20 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
>> index 602f80323031..d9cd6525ba22 100644
>> --- a/drivers/media/platform/vimc/vimc-capture.c
>> +++ b/drivers/media/platform/vimc/vimc-capture.c
>> @@ -15,7 +15,6 @@
>>   struct vimc_cap_device {
>>   	struct vimc_ent_device ved;
>>   	struct video_device vdev;
>> -	struct device *dev;
>>   	struct v4l2_pix_format format;
>>   	struct vb2_queue queue;
>>   	struct list_head buf_list;
>> @@ -124,7 +123,7 @@ static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
>>   	if (ret)
>>   		return ret;
>>   
>> -	dev_dbg(vcap->dev, "%s: format update: "
>> +	dev_dbg(vcap->ved.dev, "%s: format update: "
>>   		"old:%dx%d (0x%x, %d, %d, %d, %d) "
>>   		"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vcap->vdev.name,
>>   		/* old */
>> @@ -300,7 +299,7 @@ static int vimc_cap_buffer_prepare(struct vb2_buffer *vb)
>>   	unsigned long size = vcap->format.sizeimage;
>>   
>>   	if (vb2_plane_size(vb, 0) < size) {
>> -		dev_err(vcap->dev, "%s: buffer too small (%lu < %lu)\n",
>> +		dev_err(vcap->ved.dev, "%s: buffer too small (%lu < %lu)\n",
>>   			vcap->vdev.name, vb2_plane_size(vb, 0), size);
>>   		return -EINVAL;
>>   	}
>> @@ -451,7 +450,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>>   	vcap->ved.ent = &vcap->vdev.entity;
>>   	vcap->ved.process_frame = vimc_cap_process_frame;
>>   	vcap->ved.vdev_get_format = vimc_cap_get_format;
>> -	vcap->dev = &vimc->pdev.dev;
>> +	vcap->ved.dev = &vimc->pdev.dev;
>>   
>>   	/* Initialize the video_device struct */
>>   	vdev = &vcap->vdev;
>> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
>> index 698db7c07645..8349e3c68a49 100644
>> --- a/drivers/media/platform/vimc/vimc-common.h
>> +++ b/drivers/media/platform/vimc/vimc-common.h
>> @@ -92,6 +92,7 @@ struct vimc_pix_map {
>>   /**
>>    * struct vimc_ent_device - core struct that represents a node in the topology
>>    *
>> + * @dev:		a pointer of the device struct of the driver
>>    * @ent:		the pointer to struct media_entity for the node
>>    * @pads:		the list of pads of the node
>>    * @process_frame:	callback send a frame to that node
>> @@ -108,6 +109,7 @@ struct vimc_pix_map {
>>    * media_entity
>>    */
>>   struct vimc_ent_device {
>> +	struct device *dev;
>>   	struct media_entity *ent;
>>   	struct media_pad *pads;
>>   	void * (*process_frame)(struct vimc_ent_device *ved,
>> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
>> index feac47d79449..ff7f8b763860 100644
>> --- a/drivers/media/platform/vimc/vimc-debayer.c
>> +++ b/drivers/media/platform/vimc/vimc-debayer.c
>> @@ -34,7 +34,6 @@ struct vimc_deb_pix_map {
>>   struct vimc_deb_device {
>>   	struct vimc_ent_device ved;
>>   	struct v4l2_subdev sd;
>> -	struct device *dev;
>>   	/* The active format */
>>   	struct v4l2_mbus_framefmt sink_fmt;
>>   	u32 src_code;
>> @@ -263,7 +262,7 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>>   		/* Set the new format in the sink pad */
>>   		vimc_deb_adjust_sink_fmt(&fmt->format);
>>   
>> -		dev_dbg(vdeb->dev, "%s: sink format update: "
>> +		dev_dbg(vdeb->ved.dev, "%s: sink format update: "
>>   			"old:%dx%d (0x%x, %d, %d, %d, %d) "
>>   			"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vdeb->sd.name,
>>   			/* old */
>> @@ -386,7 +385,7 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_device *vdeb,
>>   
>>   	/* Sum the values of the colors in the mean window */
>>   
>> -	dev_dbg(vdeb->dev,
>> +	dev_dbg(vdeb->ved.dev,
>>   		"deb: %s: --- Calc pixel %dx%d, window mean %d, seek %d ---\n",
>>   		vdeb->sd.name, lin, col, vdeb->sink_fmt.height, seek);
>>   
>> @@ -419,7 +418,7 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_device *vdeb,
>>   						 vdeb->sink_fmt.width,
>>   						 vdeb->sink_bpp);
>>   
>> -			dev_dbg(vdeb->dev,
>> +			dev_dbg(vdeb->ved.dev,
>>   				"deb: %s: RGB CALC: frame index %d, win pos %dx%d, color %d\n",
>>   				vdeb->sd.name, index, wlin, wcol, color);
>>   
>> @@ -430,21 +429,21 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_device *vdeb,
>>   			/* Save how many values we already added */
>>   			n_rgb[color]++;
>>   
>> -			dev_dbg(vdeb->dev, "deb: %s: RGB CALC: val %d, n %d\n",
>> +			dev_dbg(vdeb->ved.dev, "deb: %s: RGB CALC: val %d, n %d\n",
>>   				vdeb->sd.name, rgb[color], n_rgb[color]);
>>   		}
>>   	}
>>   
>>   	/* Calculate the mean */
>>   	for (i = 0; i < 3; i++) {
>> -		dev_dbg(vdeb->dev,
>> +		dev_dbg(vdeb->ved.dev,
>>   			"deb: %s: PRE CALC: %dx%d Color %d, val %d, n %d\n",
>>   			vdeb->sd.name, lin, col, i, rgb[i], n_rgb[i]);
>>   
>>   		if (n_rgb[i])
>>   			rgb[i] = rgb[i] / n_rgb[i];
>>   
>> -		dev_dbg(vdeb->dev,
>> +		dev_dbg(vdeb->ved.dev,
>>   			"deb: %s: FINAL CALC: %dx%d Color %d, val %d\n",
>>   			vdeb->sd.name, lin, col, i, rgb[i]);
>>   	}
>> @@ -518,7 +517,7 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>>   	}
>>   
>>   	vdeb->ved.process_frame = vimc_deb_process_frame;
>> -	vdeb->dev = &vimc->pdev.dev;
>> +	vdeb->ved.dev = &vimc->pdev.dev;
>>   
>>   	/* Initialize the frame format */
>>   	vdeb->sink_fmt = sink_fmt_default;
>> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
>> index a6a3cc5be872..9b1023525920 100644
>> --- a/drivers/media/platform/vimc/vimc-scaler.c
>> +++ b/drivers/media/platform/vimc/vimc-scaler.c
>> @@ -21,7 +21,6 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
>>   struct vimc_sca_device {
>>   	struct vimc_ent_device ved;
>>   	struct v4l2_subdev sd;
>> -	struct device *dev;
>>   	/* NOTE: the source fmt is the same as the sink
>>   	 * with the width and hight multiplied by mult
>>   	 */
>> @@ -171,7 +170,7 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>>   		/* Set the new format in the sink pad */
>>   		vimc_sca_adjust_sink_fmt(&fmt->format);
>>   
>> -		dev_dbg(vsca->dev, "%s: sink format update: "
>> +		dev_dbg(vsca->ved.dev, "%s: sink format update: "
>>   			"old:%dx%d (0x%x, %d, %d, %d, %d) "
>>   			"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vsca->sd.name,
>>   			/* old */
>> @@ -271,7 +270,7 @@ static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
>>   				 vsca->bpp);
>>   	pixel = &sink_frame[index];
>>   
>> -	dev_dbg(vsca->dev,
>> +	dev_dbg(vsca->ved.dev,
>>   		"sca: %s: --- scale_pix sink pos %dx%d, index %d ---\n",
>>   		vsca->sd.name, lin, col, index);
>>   
>> @@ -281,7 +280,7 @@ static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
>>   	index = VIMC_FRAME_INDEX(lin * sca_mult, col * sca_mult,
>>   				 vsca->sink_fmt.width * sca_mult, vsca->bpp);
>>   
>> -	dev_dbg(vsca->dev, "sca: %s: scale_pix src pos %dx%d, index %d\n",
>> +	dev_dbg(vsca->ved.dev, "sca: %s: scale_pix src pos %dx%d, index %d\n",
>>   		vsca->sd.name, lin * sca_mult, col * sca_mult, index);
>>   
>>   	/* Repeat this pixel mult times */
>> @@ -290,7 +289,7 @@ static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
>>   		 * pixel repetition in a line
>>   		 */
>>   		for (j = 0; j < sca_mult * vsca->bpp; j += vsca->bpp) {
>> -			dev_dbg(vsca->dev,
>> +			dev_dbg(vsca->ved.dev,
>>   				"sca: %s: sca: scale_pix src pos %d\n",
>>   				vsca->sd.name, index + j);
>>   
>> @@ -377,7 +376,7 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>>   	}
>>   
>>   	vsca->ved.process_frame = vimc_sca_process_frame;
>> -	vsca->dev = &vimc->pdev.dev;
>> +	vsca->ved.dev = &vimc->pdev.dev;
>>   
>>   	/* Initialize the frame format */
>>   	vsca->sink_fmt = sink_fmt_default;
>> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
>> index 46dc6a535abe..9921993a2b73 100644
>> --- a/drivers/media/platform/vimc/vimc-sensor.c
>> +++ b/drivers/media/platform/vimc/vimc-sensor.c
>> @@ -17,7 +17,6 @@
>>   struct vimc_sen_device {
>>   	struct vimc_ent_device ved;
>>   	struct v4l2_subdev sd;
>> -	struct device *dev;
>>   	struct tpg_data tpg;
>>   	struct task_struct *kthread_sen;
>>   	u8 *frame;
>> @@ -158,7 +157,7 @@ static int vimc_sen_set_fmt(struct v4l2_subdev *sd,
>>   	/* Set the new format */
>>   	vimc_sen_adjust_fmt(&fmt->format);
>>   
>> -	dev_dbg(vsen->dev, "%s: format update: "
>> +	dev_dbg(vsen->ved.dev, "%s: format update: "
>>   		"old:%dx%d (0x%x, %d, %d, %d, %d) "
>>   		"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vsen->sd.name,
>>   		/* old */
>> @@ -368,7 +367,7 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>>   		goto err_free_hdl;
>>   
>>   	vsen->ved.process_frame = vimc_sen_process_frame;
>> -	vsen->dev = &vimc->pdev.dev;
>> +	vsen->ved.dev = &vimc->pdev.dev;
>>   
>>   	/* Initialize the frame format */
>>   	vsen->mbus_format = fmt_default;
>> diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
>> index faa2879c25df..37150c919fcb 100644
>> --- a/drivers/media/platform/vimc/vimc-streamer.c
>> +++ b/drivers/media/platform/vimc/vimc-streamer.c
>> @@ -96,7 +96,7 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>>   			sd = media_entity_to_v4l2_subdev(ved->ent);
>>   			ret = v4l2_subdev_call(sd, video, s_stream, 1);
>>   			if (ret && ret != -ENOIOCTLCMD) {
>> -				pr_err("subdev_call error %s\n",
>> +				dev_err(ved->dev, "subdev_call error %s\n",
>>   				       ved->ent->name);
>>   				vimc_streamer_pipeline_terminate(stream);
>>   				return ret;
>>
> 
