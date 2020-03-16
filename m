Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E98C187412
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 21:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732581AbgCPUcF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 16:32:05 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37036 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732573AbgCPUcF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 16:32:05 -0400
Received: by mail-lf1-f67.google.com with SMTP id j11so15257561lfg.4
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 13:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ygSNuyHNmXI6vGQGoOpxoC8J35cZ8WEboTy6nMxTf4o=;
        b=VBCvus7zgCBXOSj7sa1xeL/OjaGQUXtDpgwPdF4FkhxqzUJNlzbNg6TOWvEOVtAZVv
         ZGdMyw2UV3vGxlCEwz0aCeaIrtM041DpKQlARewBV3ANFrPCyUqkqzl1DBtDG3bnqfR+
         rJaTsahD8FT5ySbd6QZl24FNqo5bfowOCWli33mZbWSSif+Qo/wpnNmI00BZ6pza3Mr5
         EhAHjnATP2wg5D8ia0ysRdDeorbprNXmM2zRwJwXzK0I1xzoHnpm0kVPtmGdsfkmII9T
         ZtZMsjlvnm8PCsFj/JCCgkYyWRDksALUxrEYQIly0T1yt+KwjgAl8VliQyXwyCNd2pkU
         VpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ygSNuyHNmXI6vGQGoOpxoC8J35cZ8WEboTy6nMxTf4o=;
        b=S7AsT6PotNsf8Yzdf5l8aPGNtCB9WkdxOx5HKgKBjsy7S9QMYuR/FicK/2V/1i9PEb
         oH7dSSITcwNqSjVnXImx1HlX24Zc8YOSZcxO9nnu8DxltNHK9c6LUxFjxf62eMxfQMvU
         J5OUJcIslwObzsJOUc3FKoV8cpxKfKT1rg2SbSVZ9jqPR9NASXQqnB9Z+y7daVZkhFPu
         llmaytTzAU6sD+Co+ZaekgQJQD/mrCBiz1Z7FtFDrr26iKLTyJh+XJcL9eFY/UbyjXeY
         eirSRpFwyNbjwyVoxuFuyp/rUPR4ezCCVOG+vHapG9O1tfpfyPt09y+FivV5Lb7wfL/s
         j7rw==
X-Gm-Message-State: ANhLgQ3r31OIPQ2uARTG828/UFKRF9K831mTUOg/Pt5XO0hHW8+Nq+XE
        yi6EnffNJSYfCSIJxXK25C1i4be1a1Y=
X-Google-Smtp-Source: ADFU+vtJm6uYMHbe5x7kvaIzpTn/cXcFrWy8E4JWLlDZ93bKMNKK40wYJOatVH9ONZdjmoM1uFbvKQ==
X-Received: by 2002:a05:6512:49e:: with SMTP id v30mr717891lfq.158.1584390721947;
        Mon, 16 Mar 2020 13:32:01 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id n27sm673497lfh.44.2020.03.16.13.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 13:32:01 -0700 (PDT)
Date:   Mon, 16 Mar 2020 21:32:00 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH 1/3] vimc: Add usage count to subdevices
Message-ID: <20200316203200.GA2324872@oden.dyn.berto.se>
References: <20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se>
 <20190518010744.15195-2-niklas.soderlund+renesas@ragnatech.se>
 <69c63e0a-d46a-d553-5308-9feb16e49353@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69c63e0a-d46a-d553-5308-9feb16e49353@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for your notification.

On 2020-03-16 16:40:54 -0300, Helen Koike wrote:
> Hi Niklas,
> 
> On 5/17/19 10:07 PM, Niklas Söderlund wrote:
> > Prepare for multiple video streams from the same sensor by adding a use
> > counter to each subdevice. The counter is increase for every s_stream(1)
> > and decremented for every s_stream(0) call.
> > 
> > The subdevice stream is not started or stopped unless the usage count go
> > from 0 to 1 (started) or from 1 to 0 (stopped). This allow for multiple
> > s_stream() calls to try to either start or stop the device while only
> > the first/last call will actually effect the state of the device.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> 
> This patch won't be required if the following series gets accepted
> https://patchwork.linuxtv.org/cover/62233/
> 
> Since helpers takes care that s_stream(true) won't be called twice without
> s_stream(false) (and the opposite is also true).

Sweet, it will be nice to get multiple stream support upstream for VIMC!

> 
> Regards,
> Helen
> 
> > ---
> >  drivers/media/platform/vimc/vimc-debayer.c | 8 ++++++++
> >  drivers/media/platform/vimc/vimc-scaler.c  | 8 ++++++++
> >  drivers/media/platform/vimc/vimc-sensor.c  | 7 +++++++
> >  3 files changed, 23 insertions(+)
> > 
> > diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> > index 281f9c1a7249ad1d..624fc23ce3077d40 100644
> > --- a/drivers/media/platform/vimc/vimc-debayer.c
> > +++ b/drivers/media/platform/vimc/vimc-debayer.c
> > @@ -56,6 +56,7 @@ struct vimc_deb_device {
> >  	struct vimc_ent_device ved;
> >  	struct v4l2_subdev sd;
> >  	struct device *dev;
> > +	atomic_t use_count;
> >  	/* The active format */
> >  	struct v4l2_mbus_framefmt sink_fmt;
> >  	u32 src_code;
> > @@ -337,6 +338,9 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
> >  		const struct v4l2_format_info *pix_info;
> >  		unsigned int frame_size;
> >  
> > +		if (atomic_inc_return(&vdeb->use_count) != 1)
> > +			return 0;
> > +
> >  		if (vdeb->src_frame)
> >  			return 0;
> >  
> > @@ -374,6 +378,9 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
> >  			return -ENOMEM;
> >  
> >  	} else {
> > +		if (atomic_dec_return(&vdeb->use_count) != 0)
> > +			return 0;
> > +
> >  		if (!vdeb->src_frame)
> >  			return 0;
> >  
> > @@ -562,6 +569,7 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
> >  	vdeb->ved.process_frame = vimc_deb_process_frame;
> >  	dev_set_drvdata(comp, &vdeb->ved);
> >  	vdeb->dev = comp;
> > +	atomic_set(&vdeb->use_count, 0);
> >  
> >  	/* Initialize the frame format */
> >  	vdeb->sink_fmt = sink_fmt_default;
> > diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> > index 8aecf8e920310608..37d2020d987a7d80 100644
> > --- a/drivers/media/platform/vimc/vimc-scaler.c
> > +++ b/drivers/media/platform/vimc/vimc-scaler.c
> > @@ -45,6 +45,7 @@ struct vimc_sca_device {
> >  	struct vimc_ent_device ved;
> >  	struct v4l2_subdev sd;
> >  	struct device *dev;
> > +	atomic_t use_count;
> >  	/* NOTE: the source fmt is the same as the sink
> >  	 * with the width and hight multiplied by mult
> >  	 */
> > @@ -213,6 +214,9 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
> >  		const struct v4l2_format_info *pix_info;
> >  		unsigned int frame_size;
> >  
> > +		if (atomic_inc_return(&vsca->use_count) != 1)
> > +			return 0;
> > +
> >  		if (vsca->src_frame)
> >  			return 0;
> >  
> > @@ -242,6 +246,9 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
> >  			return -ENOMEM;
> >  
> >  	} else {
> > +		if (atomic_dec_return(&vsca->use_count) != 0)
> > +			return 0;
> > +
> >  		if (!vsca->src_frame)
> >  			return 0;
> >  
> > @@ -396,6 +403,7 @@ static int vimc_sca_comp_bind(struct device *comp, struct device *master,
> >  	vsca->ved.process_frame = vimc_sca_process_frame;
> >  	dev_set_drvdata(comp, &vsca->ved);
> >  	vsca->dev = comp;
> > +	atomic_set(&vsca->use_count, 0);
> >  
> >  	/* Initialize the frame format */
> >  	vsca->sink_fmt = sink_fmt_default;
> > diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> > index baca9ca67ce0af0b..36c3cea85a185f4b 100644
> > --- a/drivers/media/platform/vimc/vimc-sensor.c
> > +++ b/drivers/media/platform/vimc/vimc-sensor.c
> > @@ -34,6 +34,7 @@ struct vimc_sen_device {
> >  	struct vimc_ent_device ved;
> >  	struct v4l2_subdev sd;
> >  	struct device *dev;
> > +	atomic_t use_count;
> >  	struct tpg_data tpg;
> >  	struct task_struct *kthread_sen;
> >  	u8 *frame;
> > @@ -197,6 +198,9 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
> >  		const struct v4l2_format_info *pix_info;
> >  		unsigned int frame_size;
> >  
> > +		if (atomic_inc_return(&vsen->use_count) != 1)
> > +			return 0;
> > +
> >  		if (vsen->kthread_sen)
> >  			/* tpg is already executing */
> >  			return 0;
> > @@ -218,6 +222,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
> >  		vimc_sen_tpg_s_format(vsen);
> >  
> >  	} else {
> > +		if (atomic_dec_return(&vsen->use_count) != 0)
> > +			return 0;
> >  
> >  		vfree(vsen->frame);
> >  		vsen->frame = NULL;
> > @@ -367,6 +373,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
> >  	vsen->ved.process_frame = vimc_sen_process_frame;
> >  	dev_set_drvdata(comp, &vsen->ved);
> >  	vsen->dev = comp;
> > +	atomic_set(&vsen->use_count, 0);
> >  
> >  	/* Initialize the frame format */
> >  	vsen->mbus_format = fmt_default;
> > 

-- 
Regards,
Niklas Söderlund
