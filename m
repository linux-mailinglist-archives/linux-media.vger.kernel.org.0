Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05C342810FD
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 13:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387773AbgJBLJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 07:09:21 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48336 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387491AbgJBLI6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 07:08:58 -0400
Received: from [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa] (p200300c7cf13ec00987cfa6c93a91dfa.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CAFB129DB67;
        Fri,  2 Oct 2020 12:08:55 +0100 (BST)
Subject: Re: [PATCH v3 2/9] media: vimc: Add get_frame callback
To:     kieran.bingham@ideasonboard.com,
        Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
 <20200819180442.11630-3-kgupta@es.iitr.ac.in>
 <80345b28-88e6-b119-5152-9f016dea2c76@ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <9c5a70c7-1eff-2047-62fb-403c2d2b3582@collabora.com>
Date:   Fri, 2 Oct 2020 13:08:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <80345b28-88e6-b119-5152-9f016dea2c76@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am 20.08.20 um 17:36 schrieb Kieran Bingham:
> Hi Kaaira,
> 
> On 19/08/2020 19:04, Kaaira Gupta wrote:
>> In the process of making vimc compatible for multiple streams, we need
>> to create a frame passing process such that two different entities can
>> get the frame from a common entity. This isn't possible currently without
>> calling process_frame twice for the common entity, as process_frames
>> returns the frame which gets passed on.
>>
>> So, to take care of this, add a get_frame callback to vimc device and
>> use it to get the frames for an entity from previous entity instead of
>> returning and passing the frames as an argument in process_frame.
>>
>> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
>> ---
>>   .../media/test-drivers/vimc/vimc-capture.c    | 18 +++++++++++++++---
>>   drivers/media/test-drivers/vimc/vimc-common.h |  7 ++++---
>>   .../media/test-drivers/vimc/vimc-debayer.c    | 19 ++++++++++++++++---
>>   drivers/media/test-drivers/vimc/vimc-scaler.c | 18 +++++++++++++++---
>>   drivers/media/test-drivers/vimc/vimc-sensor.c | 11 +++++++++--
>>   .../media/test-drivers/vimc/vimc-streamer.c   | 10 ++++++----
>>   6 files changed, 65 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
>> index c63496b17b9a..a8cbb8e4d5ba 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-capture.c
>> +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
>> @@ -355,12 +355,13 @@ static void vimc_cap_unregister(struct vimc_ent_device *ved)
>>   	video_unregister_device(&vcap->vdev);
>>   }
>>   
>> -static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
>> -				    const void *frame)
>> +static int vimc_cap_process_frame(struct vimc_ent_device *ved)
>>   {
>>   	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
>>   						    ved);
>>   	struct vimc_cap_buffer *vimc_buf;
>> +	struct v4l2_subdev *sd;
>> +	const void *frame;
>>   	void *vbuf;
>>   
>>   	spin_lock(&vcap->qlock);
>> @@ -370,7 +371,7 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
>>   					    typeof(*vimc_buf), list);
>>   	if (!vimc_buf) {
>>   		spin_unlock(&vcap->qlock);
>> -		return ERR_PTR(-EAGAIN);
>> +		return -EAGAIN;
>>   	}
>>   
>>   	/* Remove this entry from the list */
>> @@ -385,12 +386,22 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
>>   
>>   	vbuf = vb2_plane_vaddr(&vimc_buf->vb2.vb2_buf, 0);
>>   
>> +	sd = media_entity_to_v4l2_subdev(vimc_get_source_entity(ved->ent));
>> +	ved = v4l2_get_subdevdata(sd);
>> +	frame = ved->get_frame(ved);
> 
> Hrm, this code block is used in several places throughout this patch,
> and it aliases the function parameter ved to a new device which isn't
> nice. Not a problem as long as it's not used for the original VED after
> of course.
> 
> But I wonder if we should instead add a helper into vimc-common.c:
> 
> struct vimc_ent_device *vimc_get_source_ved(struct vimc_ent_device *ved)
> {
> 	struct media_entity *ent;
> 	struct v4l2_subdev *sd;
> 
> 	ent = vimc_get_source_entity(ved->ent);
> 	if (!ent)
> 		return NULL;
> 
> 	sd = media_entity_to_v4l2_subdev(ent);
> 
> 	return v4l2_get_subdevdata(sd);
> }
> 
> It might not be necessary though, just an idea. If you like it, it can
> be a patch on it's own after the vimc_get_source_entity() moving patch.
> 
> 
> But it does show that vimc_get_source_entity() can return NULL which
> might have to be checked... though perhaps we 'know' it will always be
> valid ...
> 
> Also, following the links for each entity, for each frame sounds like
> quite a lot of work. I wonder if the active source entity should be
> cached in each VED ...

I think that we can add a pad number as an argument for the function and
only ask for source entity for that pad.

> 
> That could be done on top anyway...
> 
> Overall, this looks like it will work, so with comments addressed how
> you wish,
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> 
>> +
>>   	memcpy(vbuf, frame, vcap->format.sizeimage);
>>   
>>   	/* Set it as ready */
>>   	vb2_set_plane_payload(&vimc_buf->vb2.vb2_buf, 0,
>>   			      vcap->format.sizeimage);
>>   	vb2_buffer_done(&vimc_buf->vb2.vb2_buf, VB2_BUF_STATE_DONE);
>> +
>> +	return 0;
>> +}
>> +
>> +static void *vimc_cap_get_frame(struct vimc_ent_device *ved)
>> +{
>>   	return NULL;
>>   }
>>   
>> @@ -455,6 +466,7 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>>   	vcap->ved.ent = &vcap->vdev.entity;
>>   	vcap->ved.process_frame = vimc_cap_process_frame;
>>   	vcap->ved.vdev_get_format = vimc_cap_get_format;
>> +	vcap->ved.get_frame = vimc_cap_get_frame;
>>   	vcap->ved.dev = vimc->mdev.dev;
>>   
>>   	/* Initialize the video_device struct */
>> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
>> index 4c580d854007..287d66edff49 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-common.h
>> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
>> @@ -85,7 +85,8 @@ struct vimc_pix_map {
>>    *
>>    * @dev:		a pointer of the device struct of the driver
>>    * @ent:		the pointer to struct media_entity for the node
>> - * @process_frame:	callback send a frame to that node
>> + * @get_frame:		callback that sends a frame processed by the entity

I see that all entities implemnt the 'get_frame' callback by returning the frame
maybe we can instead make the frame a filed of vimc_ent_device instead of that
callback.

Thanks,
Dafna

> 
> s/sends a/obtains the/
> 
> 
> 
>> + * @process_frame:	callback that processes a frame
>>    * @vdev_get_format:	callback that returns the current format a pad, used
>>    *			only when is_media_entity_v4l2_video_device(ent) returns
>>    *			true
>> @@ -101,8 +102,8 @@ struct vimc_pix_map {
>>   struct vimc_ent_device {
>>   	struct device *dev;
>>   	struct media_entity *ent;
>> -	void * (*process_frame)(struct vimc_ent_device *ved,
>> -				const void *frame);
>> +	void * (*get_frame)(struct vimc_ent_device *ved);
>> +	int (*process_frame)(struct vimc_ent_device *ved);
>>   	void (*vdev_get_format)(struct vimc_ent_device *ved,
>>   			      struct v4l2_pix_format *fmt);
>>   };
>> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
>> index c3f6fef34f68..f61e6e8899ac 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
>> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
>> @@ -491,17 +491,22 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_device *vdeb,
>>   	}
>>   }
>>   
>> -static void *vimc_deb_process_frame(struct vimc_ent_device *ved,
>> -				    const void *sink_frame)
>> +static int vimc_deb_process_frame(struct vimc_ent_device *ved)
>>   {
>>   	struct vimc_deb_device *vdeb = container_of(ved, struct vimc_deb_device,
>>   						    ved);
>>   	unsigned int rgb[3];
>>   	unsigned int i, j;
>> +	struct v4l2_subdev *sd;
>> +	const void *sink_frame;
>>   
>>   	/* If the stream in this node is not active, just return */
>>   	if (!vdeb->src_frame)
>> -		return ERR_PTR(-EINVAL);
>> +		return -EINVAL;
>> +
>> +	sd = media_entity_to_v4l2_subdev(vimc_get_source_entity(ved->ent));
>> +	ved = v4l2_get_subdevdata(sd);
>> +	sink_frame = ved->get_frame(ved);
>>   
>>   	for (i = 0; i < vdeb->sink_fmt.height; i++)
>>   		for (j = 0; j < vdeb->sink_fmt.width; j++) {
>> @@ -509,6 +514,13 @@ static void *vimc_deb_process_frame(struct vimc_ent_device *ved,
>>   			vdeb->set_rgb_src(vdeb, i, j, rgb);
>>   		}
>>   
>> +	return 0;
>> +}
>> +
>> +static void *vimc_deb_get_frame(struct vimc_ent_device *ved)
>> +{
>> +	struct vimc_deb_device *vdeb = container_of(ved, struct vimc_deb_device,
>> +						    ved);
>>   	return vdeb->src_frame;
>>   }
>>   
>> @@ -593,6 +605,7 @@ static struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>>   		goto err_free_hdl;
>>   
>>   	vdeb->ved.process_frame = vimc_deb_process_frame;
>> +	vdeb->ved.get_frame = vimc_deb_get_frame;
>>   	vdeb->ved.dev = vimc->mdev.dev;
>>   	vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
>>   
>> diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
>> index 121fa7d62a2e..347f9cd4a168 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-scaler.c
>> +++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
>> @@ -455,18 +455,29 @@ static void vimc_sca_fill_src_frame(const struct vimc_sca_device *const vsca,
>>   			vimc_sca_scale_pix(vsca, i, j, sink_frame);
>>   }
>>   
>> -static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
>> -				    const void *sink_frame)
>> +static int vimc_sca_process_frame(struct vimc_ent_device *ved)
>>   {
>>   	struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
>>   						    ved);
>> +	const void *sink_frame;
>> +	struct v4l2_subdev *sd;
>>   
>>   	/* If the stream in this node is not active, just return */
>>   	if (!vsca->src_frame)
>> -		return ERR_PTR(-EINVAL);
>> +		return -EINVAL;
>>   
>> +	sd = media_entity_to_v4l2_subdev(vimc_get_source_entity(ved->ent));
>> +	ved = v4l2_get_subdevdata(sd);
>> +	sink_frame = ved->get_frame(ved);
>>   	vimc_sca_fill_src_frame(vsca, sink_frame);
>>   
>> +	return 0;
>> +};
>> +
>> +static void *vimc_sca_get_frame(struct vimc_ent_device *ved)
>> +{
>> +	struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
>> +						    ved);
>>   	return vsca->src_frame;
>>   };
>>   
>> @@ -505,6 +516,7 @@ static struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>>   	}
>>   
>>   	vsca->ved.process_frame = vimc_sca_process_frame;
>> +	vsca->ved.get_frame = vimc_sca_get_frame;
>>   	vsca->ved.dev = vimc->mdev.dev;
>>   
>>   	/* Initialize the frame format */
>> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
>> index ba5db5a150b4..32a2c39de2cd 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
>> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
>> @@ -190,8 +190,7 @@ static const struct v4l2_subdev_pad_ops vimc_sen_pad_ops = {
>>   	.set_fmt		= vimc_sen_set_fmt,
>>   };
>>   
>> -static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
>> -				    const void *sink_frame)
>> +static int vimc_sen_process_frame(struct vimc_ent_device *ved)
>>   {
>>   	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
>>   						    ved);
>> @@ -238,6 +237,13 @@ static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
>>   		break;
>>   	}
>>   
>> +	return 0;
>> +}
>> +
>> +static void *vimc_sen_get_frame(struct vimc_ent_device *ved)
>> +{
>> +	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
>> +						    ved);
>>   	return vsen->frame;
>>   }
>>   
>> @@ -429,6 +435,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>>   		goto err_free_tpg;
>>   
>>   	vsen->ved.process_frame = vimc_sen_process_frame;
>> +	vsen->ved.get_frame = vimc_sen_get_frame;
>>   	vsen->ved.dev = vimc->mdev.dev;
>>   
>>   	/* Initialize the frame format */
>> diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
>> index 4f8384246042..c1644d69686d 100644
>> --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
>> +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
>> @@ -125,7 +125,8 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>>   static int vimc_streamer_thread(void *data)
>>   {
>>   	struct vimc_stream *stream = data;
>> -	u8 *frame = NULL;
>> +	struct vimc_ent_device *ved;
>> +	int ret;
>>   	int i;
>>   
>>   	set_freezable();
>> @@ -136,9 +137,10 @@ static int vimc_streamer_thread(void *data)
>>   			break;
>>   
>>   		for (i = stream->pipe_size - 1; i >= 0; i--) {
>> -			frame = stream->ved_pipeline[i]->process_frame(
>> -					stream->ved_pipeline[i], frame);
>> -			if (!frame || IS_ERR(frame))
>> +			ved = stream->ved_pipeline[i];
>> +			ret = ved->process_frame(ved);
>> +
>> +			if (ret)
>>   				break;
>>   		}
>>   		//wait for 60hz
>>
> 
