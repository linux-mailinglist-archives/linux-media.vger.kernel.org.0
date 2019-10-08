Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5490CFB63
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 15:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730970AbfJHNeU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 09:34:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46548 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730301AbfJHNeT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 09:34:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 80F9228FC04
Message-ID: <de9004d5fc9d18684537914dffaf4c95fbf15de5.camel@collabora.com>
Subject: Re: [PATCH 1/5] media: vimc: upon streaming, check that the
 pipeline starts with a source entity
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     Shuah Khan <skhan@linuxfoundation.org>, linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Date:   Tue, 08 Oct 2019 15:34:14 +0200
In-Reply-To: <45a7e861-97ad-6149-610d-49bf8343215f@linuxfoundation.org>
References: <20190919203208.12515-1-dafna.hirschfeld@collabora.com>
         <20190919203208.12515-2-dafna.hirschfeld@collabora.com>
         <45a7e861-97ad-6149-610d-49bf8343215f@linuxfoundation.org>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
Thanks for the review,

On Thu, 2019-09-26 at 08:32 -0600, Shuah Khan wrote:
> On 9/19/19 2:32 PM, Dafna Hirschfeld wrote:
> > Userspace can disable links and create pipelines that
> > do not start with a source entity. Trying to stream
> > from such a pipeline should fail with -EPIPE
> > currently this is not handled and cause kernel crash.
> > 
> 
> Minor: Can you make these 75 long. Makes it easier to read.
> 
> > Reproducing the crash:
> > media-ctl -d0 -l "5:1->21:0[0]" -v
> > v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
> > v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2
> 
> I really would like to see the panic message so it can checked during
> testing.
> 
> If you are fixing a panic, please include the panic info. in the future.
> 
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > ---
> >   drivers/media/platform/vimc/vimc-streamer.c | 39 +++++++++++++++------
> >   1 file changed, 28 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
> > index faa2879c25df..d0a9f8a0f26a 100644
> > --- a/drivers/media/platform/vimc/vimc-streamer.c
> > +++ b/drivers/media/platform/vimc/vimc-streamer.c
> > @@ -12,6 +12,19 @@
> >   
> >   #include "vimc-streamer.h"
> >   
> > +/**
> > + * Check if the entity has only source pads
> > + */
> > +static bool vimc_is_source(struct media_entity *ent)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ent->num_pads; i++)
> > +		if (ent->pads[i].flags & MEDIA_PAD_FL_SINK)
> > +			return false;
> > +	return true;
> > +}
> > +
> 
> Why not make this a common routine and add it to vimc-common.c?
> 
> >   /**
> >    * vimc_get_source_entity - get the entity connected with the first sink pad
> >    *
> > @@ -82,14 +95,12 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
> >   	struct media_entity *entity;
> >   	struct video_device *vdev;
> >   	struct v4l2_subdev *sd;
> > -	int ret = 0;
> > +	int ret = -EINVAL;
> >   
> >   	stream->pipe_size = 0;
> >   	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
> > -		if (!ved) {
> > -			vimc_streamer_pipeline_terminate(stream);
> > -			return -EINVAL;
> > -		}
> > +		if (!ved)
> > +			break;
> >   		stream->ved_pipeline[stream->pipe_size++] = ved;
> >   
> >   		if (is_media_entity_v4l2_subdev(ved->ent)) {
> > @@ -98,15 +109,22 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
> >   			if (ret && ret != -ENOIOCTLCMD) {
> >   				pr_err("subdev_call error %s\n",
> >   				       ved->ent->name);
> 
> While you are at it, can you make this a dev_err() instead? I think we
> have access to dev here.

Actually, there is no access to dev here. It can be sent to the function as
an argument from the vimc-capture.c code, but maybe a better solution is to move the dev
pointer of every vimc entity to the common `vimc_ent_dev ved` field, since all entities have a pointer to it.

Thanks,
Dafna
> 
> > -				vimc_streamer_pipeline_terminate(stream);
> > -				return ret;
> > +				break;
> >   			}
> >   		}
> >   
> >   		entity = vimc_get_source_entity(ved->ent);
> > -		/* Check if the end of the pipeline was reached*/
> > -		if (!entity)
> > +		/* Check if the end of the pipeline was reached */
> > +		if (!entity) {
> > +			/* the first entity of the pipe should be source only */
> > +			if (!vimc_is_source(ved->ent)) {
> > +				pr_err("first entity in the pipe '%s' is not a source\n",
> > +				       ved->ent->name);
> 
> Same commnet about dev_err() here.
> 
> > +				ret = -EPIPE;
> > +				break;
> > +			}
> >   			return 0;
> > +		}
> >   
> >   		/* Get the next device in the pipeline */
> >   		if (is_media_entity_v4l2_subdev(entity)) {
> > @@ -119,9 +137,8 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
> >   			ved = video_get_drvdata(vdev);
> >   		}
> >   	}
> > -
> >   	vimc_streamer_pipeline_terminate(stream);
> > -	return -EINVAL;
> > +	return ret;
> >   }
> >   
> >   /**
> > 
> 
> thanks,
> -- Shuah

