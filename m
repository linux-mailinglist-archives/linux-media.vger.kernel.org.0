Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57AA6107BF6
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 01:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfKWATm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Nov 2019 19:19:42 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38208 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbfKWATm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Nov 2019 19:19:42 -0500
Received: by mail-pf1-f194.google.com with SMTP id c13so4311564pfp.5;
        Fri, 22 Nov 2019 16:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BmTPMLW7xZlRAF+tg6lS69H830vblmYj1GtO0vAyQ3Y=;
        b=GoUWvi/4//MTls5+pgqdV7IhxiGqIWLbG2fohDGe/ro2fxm0KT0UIEmc2X77wVZwxR
         v5EDKMhhbszqZzZm+QDc2Wswqf+ef3ViyU1r60e7/pN7h6aROobAX8qee9AOI9whViV4
         XDhboLMB4EccQlHtacxxnaihLSwgec+TDzYS3SVWgGBUBCr76x9jnP2mepImNdM9Qtft
         S6GxceJv8ciOQChuFPMZyGtDtIZjRvvrfhvxA3+zqX5k/p2JYeaIEyW6eCEkPgCQ/ix4
         +mOZi79xw+lnh9kvFVCzfcW5//8J3IQ6FAMFwiYkdKT+cM/RSX+43TNQiG6D5xneK6Js
         1d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BmTPMLW7xZlRAF+tg6lS69H830vblmYj1GtO0vAyQ3Y=;
        b=H+xYUy4nhc7HVaL5jJ2Lst1a6j97GGdRNjjhk2WNiceSPe5iZzvTHiOiqRpntzwodN
         UUsMDu3tLYlbC41j+nJ5hkv9CKvSS1q8ZY0nmUQUTFxkh5t4pMMk+7HgTSTSphxlUgpd
         zdfBE5E9xQkfAHanRYvWRYZpBZayrO/RygTH5p+qcRYHxqPyI/jpqEVZa6GpIi3kIovZ
         WaqSDKcGAVjxsS+dSpaYGurtTTHdClUtmWbI9vczja2t74L3CE8kci2CqZTM4sN525Up
         cnluwvgdb86l8KlKlhAvBE8Xj908Adx10gkdm7yuOgqqclGUFT+KHvkYM0RjTqlTBaNX
         U1WQ==
X-Gm-Message-State: APjAAAXQWMFLm7sSspSzmtrZDd8+3OmvZHB3I9l2eP7ftGBcQhVeGi28
        aroKAMO1oPCGnguip7MJ0Dw=
X-Google-Smtp-Source: APXvYqzMyqcJDHDewOKg2LcXwV6ktifDbOdDUf4VvhTlKNxhhV9bQmah+/U7YBCI4WYxtYQTTE0t/g==
X-Received: by 2002:a63:b144:: with SMTP id g4mr18072041pgp.87.1574468380096;
        Fri, 22 Nov 2019 16:19:40 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id z6sm54389pjd.9.2019.11.22.16.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 16:19:39 -0800 (PST)
Date:   Fri, 22 Nov 2019 16:19:37 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-input@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>
Subject: Re: [PATCH 2/5] input/rmi4/rmi_f54: fix various V4L2 compliance
 problems
Message-ID: <20191123001937.GH248138@dtor-ws>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
 <20191119105118.54285-3-hverkuil-cisco@xs4all.nl>
 <54e84fe8a6d1fdd6faf11e3a5c4a7314b0151474.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54e84fe8a6d1fdd6faf11e3a5c4a7314b0151474.camel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 19, 2019 at 12:42:46PM +0100, Lucas Stach wrote:
> On Di, 2019-11-19 at 11:51 +0100, Hans Verkuil wrote:
> > The v4l2-compliance utility reported several V4L2 API compliance
> > issues:
> > 
> > - the sequence counter wasn't filled in
> > - the sequence counter wasn't reset to 0 at the start of streaming
> > - the returned field value wasn't set to V4L2_FIELD_NONE
> > - the timestamp wasn't set
> > - the payload size was undefined if an error was returned
> > - min_buffers_needed doesn't need to be initialized
> > 
> > Fix these issues.
> > 
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de

Applied, thank you.

> 
> > ---
> >  drivers/input/rmi4/rmi_f54.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/rmi4/rmi_f54.c
> > b/drivers/input/rmi4/rmi_f54.c
> > index 710b02595486..ebccab7a4834 100644
> > --- a/drivers/input/rmi4/rmi_f54.c
> > +++ b/drivers/input/rmi4/rmi_f54.c
> > @@ -116,6 +116,7 @@ struct f54_data {
> >  	struct video_device vdev;
> >  	struct vb2_queue queue;
> >  	struct mutex lock;
> > +	u32 sequence;
> >  	int input;
> >  	enum rmi_f54_report_type inputs[F54_MAX_REPORT_TYPE];
> >  };
> > @@ -290,6 +291,7 @@ static int rmi_f54_queue_setup(struct vb2_queue
> > *q, unsigned int *nbuffers,
> >  
> >  static void rmi_f54_buffer_queue(struct vb2_buffer *vb)
> >  {
> > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> >  	struct f54_data *f54 = vb2_get_drv_priv(vb->vb2_queue);
> >  	u16 *ptr;
> >  	enum vb2_buffer_state state;
> > @@ -298,6 +300,7 @@ static void rmi_f54_buffer_queue(struct
> > vb2_buffer *vb)
> >  
> >  	mutex_lock(&f54->status_mutex);
> >  
> > +	vb2_set_plane_payload(vb, 0, 0);
> >  	reptype = rmi_f54_get_reptype(f54, f54->input);
> >  	if (reptype == F54_REPORT_NONE) {
> >  		state = VB2_BUF_STATE_ERROR;
> > @@ -344,14 +347,25 @@ static void rmi_f54_buffer_queue(struct
> > vb2_buffer *vb)
> >  data_done:
> >  	mutex_unlock(&f54->data_mutex);
> >  done:
> > +	vb->timestamp = ktime_get_ns();
> > +	vbuf->field = V4L2_FIELD_NONE;
> > +	vbuf->sequence = f54->sequence++;
> >  	vb2_buffer_done(vb, state);
> >  	mutex_unlock(&f54->status_mutex);
> >  }
> >  
> > +static void rmi_f54_stop_streaming(struct vb2_queue *q)
> > +{
> > +	struct f54_data *f54 = vb2_get_drv_priv(q);
> > +
> > +	f54->sequence = 0;
> > +}
> > +
> >  /* V4L2 structures */
> >  static const struct vb2_ops rmi_f54_queue_ops = {
> >  	.queue_setup            = rmi_f54_queue_setup,
> >  	.buf_queue              = rmi_f54_buffer_queue,
> > +	.stop_streaming		= rmi_f54_stop_streaming,
> >  	.wait_prepare           = vb2_ops_wait_prepare,
> >  	.wait_finish            = vb2_ops_wait_finish,
> >  };
> > @@ -363,7 +377,6 @@ static const struct vb2_queue rmi_f54_queue = {
> >  	.ops = &rmi_f54_queue_ops,
> >  	.mem_ops = &vb2_vmalloc_memops,
> >  	.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC,
> > -	.min_buffers_needed = 1,
> >  };
> >  
> >  static int rmi_f54_vidioc_querycap(struct file *file, void *priv,
> 

-- 
Dmitry
