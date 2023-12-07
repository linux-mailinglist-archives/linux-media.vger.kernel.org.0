Return-Path: <linux-media+bounces-1850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D05DE808B04
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 15:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F26431C20AA6
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 14:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3761A4437C;
	Thu,  7 Dec 2023 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gzn/ktV8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C334A3;
	Thu,  7 Dec 2023 06:50:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1A2E669;
	Thu,  7 Dec 2023 15:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701960573;
	bh=QfL+DyjnH2mbd8VhT7qHNaAo5w/cbC+KvSpbO0ms4X0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzn/ktV8n8uDqghsnJFY8NR5nRWuw1ONK6jr5GHs9hfwnpNUx0fUOGMroyxLkJG/Q
	 l7JkhJhNGL3wxPgj7x7NQgJWLyBroOCVasgl/93zEKVXWV6xaB16QbRk5szWgm4JSo
	 I66kml3giqg7k3UnXRnfOVbTJCfxwRxMMZ+yV3JU=
Date: Thu, 7 Dec 2023 16:50:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, kieran.bingham@ideasonboard.com,
	umang.jain@ideasonboard.com, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] media: rkisp1: debug: Consolidate counter debugfs
 files
Message-ID: <20231207145020.GA17373@pendragon.ideasonboard.com>
References: <20231201140433.2126011-1-paul.elder@ideasonboard.com>
 <20231201140433.2126011-5-paul.elder@ideasonboard.com>
 <212f4a89-7135-41ca-9638-b36a474b1bfa@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <212f4a89-7135-41ca-9638-b36a474b1bfa@ideasonboard.com>

On Tue, Dec 05, 2023 at 10:22:47AM +0200, Tomi Valkeinen wrote:
> On 01/12/2023 16:04, Paul Elder wrote:
> > Consolidate all the debugfs files that were each a single counter into a
> > single "counters" file.
> > 
> > While at it, reset the counters at stream on time to make it easier for
> > to interpret the values in userspace.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > 
> > ---
> > New in v2
> > 
> >   .../platform/rockchip/rkisp1/rkisp1-capture.c |  2 +
> >   .../platform/rockchip/rkisp1/rkisp1-common.h  |  4 ++
> >   .../platform/rockchip/rkisp1/rkisp1-debug.c   | 69 ++++++++++++-------
> >   3 files changed, 50 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > index c6d7e01c8949..67b2e94dfd67 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > @@ -1030,6 +1030,8 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
> >   	struct media_entity *entity = &cap->vnode.vdev.entity;
> >   	int ret;
> >   
> > +	rkisp1_debug_reset_counters(cap->rkisp1);
> > +
> >   	mutex_lock(&cap->rkisp1->stream_lock);
> >   
> >   	ret = video_device_pipeline_start(&cap->vnode.vdev, &cap->rkisp1->pipe);
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index be69173958a4..789259fb304a 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -599,9 +599,13 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1);
> >   void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
> >   
> >   #if IS_ENABLED(CONFIG_DEBUG_FS)
> > +void rkisp1_debug_reset_counters(struct rkisp1_device *rkisp1);
> >   void rkisp1_debug_init(struct rkisp1_device *rkisp1);
> >   void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1);
> >   #else
> > +static inline void rkisp1_debug_reset_counters(struct rkisp1_device *rkisp1)
> > +{
> > +}
> >   static inline void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> >   {
> >   }
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > index 79cda589d935..4358ed1367ed 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > @@ -25,6 +25,11 @@ struct rkisp1_debug_register {
> >   	const char * const name;
> >   };
> >   
> > +struct rkisp1_debug_counter {
> > +	const char * const name;
> > +	unsigned long *value;
> > +};
> > +
> >   #define RKISP1_DEBUG_REG(name)		{ RKISP1_CIF_##name, 0, #name }
> >   #define RKISP1_DEBUG_SHD_REG(name) { \
> >   	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name \
> > @@ -191,6 +196,43 @@ static int rkisp1_debug_input_status_show(struct seq_file *m, void *p)
> >   }
> >   DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_input_status);
> >   
> > +static int rkisp1_debug_counters_show(struct seq_file *m, void *p)
> > +{
> > +	struct rkisp1_device *rkisp1 = m->private;
> > +	struct rkisp1_debug *debug = &rkisp1->debug;
> > +
> > +	const struct rkisp1_debug_counter counters[] = {
> > +		{ "data_loss", &debug->data_loss },
> > +		{ "outform_size_err", &debug->outform_size_error },
> > +		{ "img_stabilization_size_error", &debug->img_stabilization_size_error },
> > +		{ "inform_size_error", &debug->inform_size_error },
> > +		{ "irq_delay", &debug->irq_delay },
> > +		{ "mipi_error", &debug->mipi_error },
> > +		{ "stats_error", &debug->stats_error },
> > +		{ "mp_stop_timeout", &debug->stop_timeout[RKISP1_MAINPATH] },
> > +		{ "sp_stop_timeout", &debug->stop_timeout[RKISP1_SELFPATH] },
> > +		{ "mp_frame_drop", &debug->frame_drop[RKISP1_MAINPATH] },
> > +		{ "sp_frame_drop", &debug->frame_drop[RKISP1_SELFPATH] },
> > +		{ "complete_frames", &debug->complete_frames },
> > +		{ /* Sentinel */ },
> > +	};
> > +
> > +	const struct rkisp1_debug_counter *counter = counters;
> > +
> > +	for (; counter->name; ++counter)
> > +		seq_printf(m, "%s: %lu\n", counter->name, *counter->value);
> > +
> 
> You could also do:
> 
> 	const struct {
> 		const char *name;
> 		unsigned long value;
> 	} counters[] = {
> 		{ "data_loss", debug->data_loss },
> 		{ "outform_size_err", debug->outform_size_error },
> 		{ "img_stabilization_size_error", debug->img_stabilization_size_error },
> 		{ "inform_size_error", debug->inform_size_error },
> 		{ "irq_delay", debug->irq_delay },
> 		{ "mipi_error", debug->mipi_error },
> 		{ "stats_error", debug->stats_error },
> 		{ "mp_stop_timeout", debug->stop_timeout[RKISP1_MAINPATH] },
> 		{ "sp_stop_timeout", debug->stop_timeout[RKISP1_SELFPATH] },
> 		{ "mp_frame_drop", debug->frame_drop[RKISP1_MAINPATH] },
> 		{ "sp_frame_drop", debug->frame_drop[RKISP1_SELFPATH] },
> 		{ "complete_frames", debug->complete_frames },
> 	};
> 
> 	for (unsigned int i = 0; i < ARRAY_SIZE(counters); ++i)
> 		seq_printf(m, "%s: %lu\n", counters[i].name, counters[i].value);
> 
> Not a big difference, but this doesn't "leak" the struct used only inside the
> function, doesn't need the sentinel, and I don't see a reason to store pointers
> to values, instead of just storing the values.

Wouldn't it be nicer to avoid constructing this on the stack for every
call ? We could store the counters in an array:

enum rkisp1_debug_counter {
	RKISP1_DBG_COUNT_DATA_LOSS,
	...
	RKISP1_DBG_COUNT_FRAME_DROP_MP,
	RKISP1_DBG_COUNT_FRAME_DROP_SP,
	RKISP1_DBG_COUNT_MAX,
};

struct rksisp1_debug {
	struct dentry *debugfs_dir;
	unsigned long counters[RKISP1_DBG_COUNT_MAX];
};

The counters[] array above would become a

static const char * const counter_names[] = {
	[RKISP1_DBG_COUNT_DATA_LOSS] = "data_loss",
	...
};

> > +	return 0;
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_counters);
> > +
> > +void rkisp1_debug_reset_counters(struct rkisp1_device *rkisp1)
> > +{
> > +	struct dentry *debugfs_dir = rkisp1->debug.debugfs_dir;
> > +	memset(&rkisp1->debug, 0, sizeof(rkisp1->debug));
> > +	rkisp1->debug.debugfs_dir = debugfs_dir;
> > +}
> > +
> >   void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> >   {
> >   	struct rkisp1_debug *debug = &rkisp1->debug;
> > @@ -198,31 +240,8 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> >   
> >   	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
> >   
> > -	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
> > -			     &debug->data_loss);
> > -	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
> > -			     &debug->outform_size_error);
> > -	debugfs_create_ulong("img_stabilization_size_error", 0444,
> > -			     debug->debugfs_dir,
> > -			     &debug->img_stabilization_size_error);
> > -	debugfs_create_ulong("inform_size_error", 0444,  debug->debugfs_dir,
> > -			     &debug->inform_size_error);
> > -	debugfs_create_ulong("irq_delay", 0444,  debug->debugfs_dir,
> > -			     &debug->irq_delay);
> > -	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
> > -			     &debug->mipi_error);
> > -	debugfs_create_ulong("stats_error", 0444, debug->debugfs_dir,
> > -			     &debug->stats_error);
> > -	debugfs_create_ulong("mp_stop_timeout", 0444, debug->debugfs_dir,
> > -			     &debug->stop_timeout[RKISP1_MAINPATH]);
> > -	debugfs_create_ulong("sp_stop_timeout", 0444, debug->debugfs_dir,
> > -			     &debug->stop_timeout[RKISP1_SELFPATH]);
> > -	debugfs_create_ulong("mp_frame_drop", 0444, debug->debugfs_dir,
> > -			     &debug->frame_drop[RKISP1_MAINPATH]);
> > -	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
> > -			     &debug->frame_drop[RKISP1_SELFPATH]);
> > -	debugfs_create_ulong("complete_frames", 0444, debug->debugfs_dir,
> > -			     &debug->complete_frames);
> > +	debugfs_create_file("counters", 0444, debug->debugfs_dir, rkisp1,
> > +			    &rkisp1_debug_counters_fops);
> >   	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
> >   			    &rkisp1_debug_input_status_fops);
> >   

-- 
Regards,

Laurent Pinchart

