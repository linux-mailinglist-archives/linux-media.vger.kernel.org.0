Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F18363AE3
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 20:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfGISYQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 14:24:16 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46688 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfGISYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 14:24:15 -0400
Received: by mail-qk1-f195.google.com with SMTP id r4so16703227qkm.13
        for <linux-media@vger.kernel.org>; Tue, 09 Jul 2019 11:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OBDoRFt9MadS0wV0lNAAjJUv2UbiO8D1ZBpcB+mhTE0=;
        b=kcwXqAaHBBRD2NAGJjovEk08V5G6MJLhpc4wvYpNJadT5C5t+tdjoeQ348sPqTD4ae
         ZEcigI3AtgqbnMMjPmkQiI3Qj9KvMLdh0x7KYwHfwnII+b3Hh9Z1HGX00UYso/5PAQg5
         Bk1r2qAhabUarikK6UbHSqBy/wSomG7bGMrN9JDMAo38+xZOFcNtnB+y9Wmmm6QwXbL0
         /8WoQMuJfl60dsef2uPdBoJGdQLkX5CVmGkCq5lD5o360NBp/XISL7mQarhWxSp1ceLy
         0JOqJTg5Vab5VwZWcBRcsuqLSysiyLuyn2lBmA5dIRaqk9uPNtQdGtfGoLrpA8lS0oHI
         bcDw==
X-Gm-Message-State: APjAAAV4XbMGD/0WQfv1u9b+VTo9vWElMZC1PGEgvqWTkj/a8Q8b+pXg
        NytumHRDXPTgKVjEoKwKFHs=
X-Google-Smtp-Source: APXvYqzgYhw8LR6kHrCWEJl4lgQ6nh0SZcatEatiM0PfmPMI+yvtZrZ8w2873u8SAP3kCqV3208xNQ==
X-Received: by 2002:ae9:eb16:: with SMTP id b22mr17334967qkg.160.1562696654267;
        Tue, 09 Jul 2019 11:24:14 -0700 (PDT)
Received: from [172.16.0.122] ([201.53.214.131])
        by smtp.gmail.com with ESMTPSA id f132sm9312122qke.88.2019.07.09.11.24.11
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 11:24:13 -0700 (PDT)
Subject: Re: [PATCH 3/3] vimc: Join pipeline if one already exists
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     libcamera-devel@lists.libcamera.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se>
 <20190518010744.15195-4-niklas.soderlund+renesas@ragnatech.se>
From:   Helen Koike <helen@koikeco.de>
Openpgp: preference=signencrypt
Autocrypt: addr=helen@koikeco.de; keydata=
 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
Message-ID: <3369c4f6-d08b-efca-baed-e48cca2d4d87@koikeco.de>
Date:   Tue, 9 Jul 2019 15:24:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190518010744.15195-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thanks for the patch (and sorry for my late reply).

On 5/17/19 10:07 PM, Niklas Söderlund wrote:
> A sensor which is running is already part of a pipeline and trying to
> start a new pipeline is not possible. This prevents two capture devices
> connected to the same sensor from running at the same time.
> 
> Instead of failing to start the second capture device allow it to join
> the already running pipeline by looking it up at the sensor. This allows
> two (or more) capture devices to independently be started and stopped
> while still being connected to the same sensor.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> ---
>  drivers/media/platform/vimc/vimc-capture.c | 35 +++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index e7d0fc2228a6f0c1..f9eb1e327e311b4a 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -264,16 +264,49 @@ static void vimc_cap_return_all_buffers(struct vimc_cap_device *vcap,
>  	spin_unlock(&vcap->qlock);
>  }
>  
> +static struct media_entity *vimc_cap_get_sensor(struct vimc_cap_device *vcap)
> +{
> +	struct media_entity *entity = &vcap->vdev.entity;
> +	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_graph graph;
> +
> +	mutex_lock(&mdev->graph_mutex);
> +	if (media_graph_walk_init(&graph, mdev)) {
> +		mutex_unlock(&mdev->graph_mutex);
> +		return NULL;
> +	}
> +
> +	media_graph_walk_start(&graph, entity);
> +
> +	while ((entity = media_graph_walk_next(&graph)))
> +		if (entity->function == MEDIA_ENT_F_CAM_SENSOR)
> +			break;

I was wondering if it should search up to the sensor, or if it could just search the first entity with a pipe object, what do you think?
Like this it should work with an output device instead of a sensor.

Regards,
Helen

> +
> +	mutex_unlock(&mdev->graph_mutex);
> +
> +	media_graph_walk_cleanup(&graph);
> +
> +	return entity;
> +}
> +
>  static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
>  	struct media_entity *entity = &vcap->vdev.entity;
> +	struct media_pipeline *pipe = NULL;
> +	struct media_entity *sensorent;
>  	int ret;
>  
>  	vcap->sequence = 0;
>  
>  	/* Start the media pipeline */
> -	ret = media_pipeline_start(entity, &vcap->stream.pipe);
> +	sensorent = vimc_cap_get_sensor(vcap);
> +	if (sensorent && sensorent->pipe)
> +		pipe = sensorent->pipe;
> +	else
> +		pipe = &vcap->stream.pipe;
> +
> +	ret = media_pipeline_start(entity, pipe);
>  	if (ret) {
>  		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
>  		return ret;
> 
