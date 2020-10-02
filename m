Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3046028110D
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 13:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387712AbgJBLNp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 07:13:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48406 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbgJBLNp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 07:13:45 -0400
Received: from [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa] (p200300c7cf13ec00987cfa6c93a91dfa.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D020329DB76;
        Fri,  2 Oct 2020 12:13:42 +0100 (BST)
Subject: Re: [PATCH v3 3/9] media: vimc: Add usage count to subdevices
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
 <20200819180442.11630-4-kgupta@es.iitr.ac.in>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <1eaac956-4836-38a4-496f-c26b9f4224de@collabora.com>
Date:   Fri, 2 Oct 2020 13:13:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819180442.11630-4-kgupta@es.iitr.ac.in>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 19.08.20 um 20:04 schrieb Kaaira Gupta:
> From: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> 
> Prepare for multiple video streams from the same sensor by adding a use
> counter to vimc_ent_device. The counter is increased for every s_stream(1)
> and decremented for every s_stream(0) call.
> 
> The subdevice stream is not started or stopped unless the usage count go
> from 0 to 1 (started) or from 1 to 0 (stopped). This allows for multiple
> s_stream() calls to try to either start or stop the device while only
> the first/last call will actually effect the state of the device.
> 
> Initialise and increment use_count for capture as well, as use_count
> will be used in subsequent patches for starting process_frame as well.
> 
> [Kaaira: moved use_count to vimc entity device instead of declaring it
> for each subdevice, used use_count for capture as well and rebased
> the patch on current HEAD of master to help with the current series]
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>

Hi,
maybe incrementing/decrementing the usage count can be
done from the streamer code instead of
the s_stream of each entity?

Thanks,
Dafna

> ---
>   drivers/media/test-drivers/vimc/vimc-capture.c | 3 +++
>   drivers/media/test-drivers/vimc/vimc-common.h  | 2 ++
>   drivers/media/test-drivers/vimc/vimc-debayer.c | 7 +++++++
>   drivers/media/test-drivers/vimc/vimc-scaler.c  | 7 +++++++
>   drivers/media/test-drivers/vimc/vimc-sensor.c  | 6 ++++++
>   5 files changed, 25 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
> index a8cbb8e4d5ba..93418cb5a139 100644
> --- a/drivers/media/test-drivers/vimc/vimc-capture.c
> +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
> @@ -243,6 +243,7 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
>   	struct media_entity *entity = &vcap->vdev.entity;
>   	int ret;
>   
> +	atomic_inc(&vcap->ved.use_count);
>   	vcap->sequence = 0;
>   
>   	/* Start the media pipeline */
> @@ -270,6 +271,7 @@ static void vimc_cap_stop_streaming(struct vb2_queue *vq)
>   {
>   	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
>   
> +	atomic_dec(&vcap->ved.use_count);
>   	vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 0);
>   
>   	/* Stop the media pipeline */
> @@ -424,6 +426,7 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   	vcap->vdev.entity.name = vcfg_name;
>   	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
>   	vcap->pad.flags = MEDIA_PAD_FL_SINK;
> +	atomic_set(&vcap->ved.use_count, 0);
>   	ret = media_entity_pads_init(&vcap->vdev.entity,
>   				     1, &vcap->pad);
>   	if (ret)
> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
> index 287d66edff49..c214f5ec7818 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.h
> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> @@ -85,6 +85,7 @@ struct vimc_pix_map {
>    *
>    * @dev:		a pointer of the device struct of the driver
>    * @ent:		the pointer to struct media_entity for the node
> + * @use_count:		a count to show the number of streams entity is part of
>    * @get_frame:		callback that sends a frame processed by the entity
>    * @process_frame:	callback that processes a frame
>    * @vdev_get_format:	callback that returns the current format a pad, used
> @@ -102,6 +103,7 @@ struct vimc_pix_map {
>   struct vimc_ent_device {
>   	struct device *dev;
>   	struct media_entity *ent;
> +	atomic_t use_count;
>   	void * (*get_frame)(struct vimc_ent_device *ved);
>   	int (*process_frame)(struct vimc_ent_device *ved);
>   	void (*vdev_get_format)(struct vimc_ent_device *ved,
> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
> index f61e6e8899ac..60c4c0ec2030 100644
> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> @@ -343,6 +343,9 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>   		const struct vimc_pix_map *vpix;
>   		unsigned int frame_size;
>   
> +		if (atomic_inc_return(&vdeb->ved.use_count) != 1)
> +			return 0;
> +
>   		if (vdeb->src_frame)
>   			return 0;
>   
> @@ -368,6 +371,9 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>   			return -ENOMEM;
>   
>   	} else {
> +		if (atomic_dec_return(&vdeb->ved.use_count) != 0)
> +			return 0;
> +
>   		if (!vdeb->src_frame)
>   			return 0;
>   
> @@ -608,6 +614,7 @@ static struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>   	vdeb->ved.get_frame = vimc_deb_get_frame;
>   	vdeb->ved.dev = vimc->mdev.dev;
>   	vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
> +	atomic_set(&vdeb->ved.use_count, 0);
>   
>   	/* Initialize the frame format */
>   	vdeb->sink_fmt = sink_fmt_default;
> diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
> index 347f9cd4a168..d511e1f2152d 100644
> --- a/drivers/media/test-drivers/vimc/vimc-scaler.c
> +++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
> @@ -340,6 +340,9 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>   		const struct vimc_pix_map *vpix;
>   		unsigned int frame_size;
>   
> +		if (atomic_inc_return(&vsca->ved.use_count) != 1)
> +			return 0;
> +
>   		if (vsca->src_frame)
>   			return 0;
>   
> @@ -363,6 +366,9 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>   			return -ENOMEM;
>   
>   	} else {
> +		if (atomic_dec_return(&vsca->ved.use_count) != 0)
> +			return 0;
> +
>   		if (!vsca->src_frame)
>   			return 0;
>   
> @@ -518,6 +524,7 @@ static struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>   	vsca->ved.process_frame = vimc_sca_process_frame;
>   	vsca->ved.get_frame = vimc_sca_get_frame;
>   	vsca->ved.dev = vimc->mdev.dev;
> +	atomic_set(&vsca->ved.use_count, 0);
>   
>   	/* Initialize the frame format */
>   	vsca->sink_fmt = sink_fmt_default;
> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> index 32a2c39de2cd..ced8ef06b01e 100644
> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> @@ -256,6 +256,9 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>   		const struct vimc_pix_map *vpix;
>   		unsigned int frame_size;
>   
> +		if (atomic_inc_return(&vsen->ved.use_count) != 1)
> +			return 0;
> +
>   		vsen->start_stream_ts = ktime_get_ns();
>   
>   		/* Calculate the frame size */
> @@ -275,6 +278,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>   		vimc_sen_tpg_s_format(vsen);
>   
>   	} else {
> +		if (atomic_dec_return(&vsen->ved.use_count) != 0)
> +			return 0;
>   
>   		vfree(vsen->frame);
>   		vsen->frame = NULL;
> @@ -437,6 +442,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>   	vsen->ved.process_frame = vimc_sen_process_frame;
>   	vsen->ved.get_frame = vimc_sen_get_frame;
>   	vsen->ved.dev = vimc->mdev.dev;
> +	atomic_set(&vsen->ved.use_count, 0);
>   
>   	/* Initialize the frame format */
>   	vsen->mbus_format = fmt_default;
> 
