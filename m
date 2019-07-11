Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 593C665128
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 06:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfGKEfj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 00:35:39 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33192 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfGKEfj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 00:35:39 -0400
Received: by mail-pl1-f194.google.com with SMTP id c14so2335500plo.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jul 2019 21:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=pU7P7yE7e/99llRNxLivYPAsh+m/9reF8aJNc3CWtd4=;
        b=WjtNpPHfUxJUuCzMspdN8H//cd7mysnA+JccZSzVIV3CBDH824qRn+/I48A1TgRgAq
         /R5ETQj8YWV2ouBM10GlSYf8SoqCy4yLnkUfOwZBwI5d3Z1qRIXwd6FxspkTGS0ZnwFY
         PjqDjKt5zS4YTBLZduCIztWJPKgXf1rTXMfBwSaow/6BclgcVv6kZgsR67ph/jyHSilZ
         SxCqt3AF119mY4taO4kFExrGCmnfYMXsubQx0ZgNmFsAnXp75WFHXezrd3mwXyc6PfDF
         CrFgdFpumWbdGpgjrRAscVzM7pl8z5BF8thc7G1YvB6K42JrFH0zu3WUDMJPL9QF8Cd/
         0/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=pU7P7yE7e/99llRNxLivYPAsh+m/9reF8aJNc3CWtd4=;
        b=oWqyNB+ftCzVyW5z+Qb2P/ruBkOCUEV63vyJkt/OZ5DsMY/fAwe5EL05yy8KW/l2m/
         cirQOZLy9MxvYy3omkjLMISZ0lIFcI4ASlrycXHuIhINCvirzRLNPD6fvCq7zZbb/VYy
         We/1JeDYLRR+X2Rm5tUyII4sJhm9+ZH7h4Xo7I5jJIohX9ZV9KuLhjXZpNkXmn9jXxCf
         U1um88U3hN9CUg4O3GykEu33hSYTZ/Ky/5ZK2X3glIk14dsmw5RhmHN+gDmJBrSGnYur
         IgtSzhfmmeZxMBRQvnmFqzaoF6Av7gwWz26rnBXkcdf5NKgaf8ffL8JAhIvDRRKNPNil
         eTtw==
X-Gm-Message-State: APjAAAU2S/wdG49SF2qUV2xhP2wgMBJxJIEXDKea1IpsKgmSFrTe8Eyr
        R3C+J10bwin1Y0mPLyI7ym1j0BFkaeU=
X-Google-Smtp-Source: APXvYqyFDRbyPbN0nxmmrI8280KYNVA6NMw45C0+T/3n68qFswZJ1098oS/hjii8WMZ1nwfCPDjl4Q==
X-Received: by 2002:a17:902:a607:: with SMTP id u7mr2287559plq.43.1562819739026;
        Wed, 10 Jul 2019 21:35:39 -0700 (PDT)
Received: from localhost (softbank126163157105.bbtec.net. [126.163.157.105])
        by smtp.gmail.com with ESMTPSA id j20sm3774491pfr.113.2019.07.10.21.35.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 21:35:37 -0700 (PDT)
Date:   Thu, 11 Jul 2019 13:35:35 +0900
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen@koikeco.de>
Cc:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 3/3] vimc: Join pipeline if one already exists
Message-ID: <20190711043535.GF1557@wyvern>
References: <20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se>
 <20190518010744.15195-4-niklas.soderlund+renesas@ragnatech.se>
 <3369c4f6-d08b-efca-baed-e48cca2d4d87@koikeco.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3369c4f6-d08b-efca-baed-e48cca2d4d87@koikeco.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for your feedback.

On 2019-07-09 15:24:10 -0300, Helen Koike wrote:
> Hi Niklas,
> 
> Thanks for the patch (and sorry for my late reply).
> 
> On 5/17/19 10:07 PM, Niklas Söderlund wrote:
> > A sensor which is running is already part of a pipeline and trying to
> > start a new pipeline is not possible. This prevents two capture devices
> > connected to the same sensor from running at the same time.
> > 
> > Instead of failing to start the second capture device allow it to join
> > the already running pipeline by looking it up at the sensor. This allows
> > two (or more) capture devices to independently be started and stopped
> > while still being connected to the same sensor.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > ---
> >  drivers/media/platform/vimc/vimc-capture.c | 35 +++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> > index e7d0fc2228a6f0c1..f9eb1e327e311b4a 100644
> > --- a/drivers/media/platform/vimc/vimc-capture.c
> > +++ b/drivers/media/platform/vimc/vimc-capture.c
> > @@ -264,16 +264,49 @@ static void vimc_cap_return_all_buffers(struct vimc_cap_device *vcap,
> >  	spin_unlock(&vcap->qlock);
> >  }
> >  
> > +static struct media_entity *vimc_cap_get_sensor(struct vimc_cap_device *vcap)
> > +{
> > +	struct media_entity *entity = &vcap->vdev.entity;
> > +	struct media_device *mdev = entity->graph_obj.mdev;
> > +	struct media_graph graph;
> > +
> > +	mutex_lock(&mdev->graph_mutex);
> > +	if (media_graph_walk_init(&graph, mdev)) {
> > +		mutex_unlock(&mdev->graph_mutex);
> > +		return NULL;
> > +	}
> > +
> > +	media_graph_walk_start(&graph, entity);
> > +
> > +	while ((entity = media_graph_walk_next(&graph)))
> > +		if (entity->function == MEDIA_ENT_F_CAM_SENSOR)
> > +			break;
> 
> I was wondering if it should search up to the sensor, or if it could just search the first entity with a pipe object, what do you think?
> Like this it should work with an output device instead of a sensor.

I think that might be a good idea, I will see what I can do for v2.

> 
> Regards,
> Helen
> 
> > +
> > +	mutex_unlock(&mdev->graph_mutex);
> > +
> > +	media_graph_walk_cleanup(&graph);
> > +
> > +	return entity;
> > +}
> > +
> >  static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
> >  {
> >  	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
> >  	struct media_entity *entity = &vcap->vdev.entity;
> > +	struct media_pipeline *pipe = NULL;
> > +	struct media_entity *sensorent;
> >  	int ret;
> >  
> >  	vcap->sequence = 0;
> >  
> >  	/* Start the media pipeline */
> > -	ret = media_pipeline_start(entity, &vcap->stream.pipe);
> > +	sensorent = vimc_cap_get_sensor(vcap);
> > +	if (sensorent && sensorent->pipe)
> > +		pipe = sensorent->pipe;
> > +	else
> > +		pipe = &vcap->stream.pipe;
> > +
> > +	ret = media_pipeline_start(entity, pipe);
> >  	if (ret) {
> >  		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
> >  		return ret;
> > 

-- 
Regards,
Niklas Söderlund
