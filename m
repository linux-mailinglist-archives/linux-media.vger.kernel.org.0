Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE91E1BA22
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 17:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730252AbfEMPck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 11:32:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34112 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728625AbfEMPcj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 11:32:39 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71086305;
        Mon, 13 May 2019 17:32:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557761555;
        bh=s8WSiv75WUJDqJBHEzvblxGG0bAT0XSSWYefeSMUWCY=;
        h=From:Subject:Reply-To:To:Cc:References:Date:In-Reply-To:From;
        b=vDTeKb60USsu4FqWsyM7Et3yoD1LgvVUuwnuTM1kX7OG47KuD9iOXbP9K3VUQXvNM
         ddLComAkZPoNb4/XLzMSDzM28yLAD785WG4cP73K1muwmz4b4oIrjNq0oPu2CQ+De3
         Bt6EmxxP/AvS3vjq4GzXVg+DQVaNsZTZOpBr40zw=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 5/5] media: vsp1: Provide partition overlap algorithm
Reply-To: kieran.bingham+renesas@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20190411161256.19607-1-kieran.bingham+renesas@ideasonboard.com>
 <20190411161256.19607-6-kieran.bingham+renesas@ideasonboard.com>
 <20190418124251.GL4806@pendragon.ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c373be94-ba6b-bb0d-ab09-087cc8ab9a4e@ideasonboard.com>
Date:   Mon, 13 May 2019 16:32:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418124251.GL4806@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 18/04/2019 13:42, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Thu, Apr 11, 2019 at 05:12:56PM +0100, Kieran Bingham wrote:
>> To improve image quality, entities involved within the image partition
>> algorithm may extend their partition window to account for their input
>> requirements and to take consideration of the number of taps in their
>> filters.
>>
>> Extend the partition algorithm to sweep first backwards, then forwards
>> through the entity list. Each entity is given the opportunity to expand
>> it's window on the reverse sweep, and clip or increase the offset on the
> 
> s/it's/its/

Eeep. The muscle memory is strong on this one ... (as noted by the
repeat below)


>> forwards sweep.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> ---
>> v2:
>>  - Configure HSTP and HEDP in uds_configure_partition for single partitions
>>  - refactored to use individual functions for various phase and position calculations
>>  - squashed forwards and backwards propagation work to a single patch
>>  - Fixed a few 'off-by-ones'
>>  - considerable other changes :)
>>
>> v3a:
>>  - SRU comments updated
>>  - phase function parameter documentation updated
>>  - s/uds_left_src_pixel/uds_left_sink_pixel/
>>  - s/uds_right_src_pixel/uds_right_sink_pixel/
>>
>> v3b:
>>  - A full rework to the UDS overlap and phase calculations
>>  - Collapse split calculations into the single uds_partition() function
>>  - Document UDS calculations following procedure steps as per datasheet
>> ---
>>  drivers/media/platform/vsp1/vsp1_entity.h |   2 +-
>>  drivers/media/platform/vsp1/vsp1_pipe.c   |  40 +++++++-
>>  drivers/media/platform/vsp1/vsp1_pipe.h   |   6 ++
>>  drivers/media/platform/vsp1/vsp1_rpf.c    |   8 +-
>>  drivers/media/platform/vsp1/vsp1_sru.c    |  38 ++++++-
>>  drivers/media/platform/vsp1/vsp1_uds.c    | 115 ++++++++++++++++++++--
>>  drivers/media/platform/vsp1/vsp1_video.c  |   1 +
>>  drivers/media/platform/vsp1/vsp1_wpf.c    |  16 ++-
>>  8 files changed, 207 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/media/platform/vsp1/vsp1_entity.h b/drivers/media/platform/vsp1/vsp1_entity.h
>> index 97acb7795cf1..772492877764 100644
>> --- a/drivers/media/platform/vsp1/vsp1_entity.h
>> +++ b/drivers/media/platform/vsp1/vsp1_entity.h
>> @@ -88,7 +88,7 @@ struct vsp1_entity_operations {
>>  	unsigned int (*max_width)(struct vsp1_entity *, struct vsp1_pipeline *);
>>  	void (*partition)(struct vsp1_entity *, struct vsp1_pipeline *,
>>  			  struct vsp1_partition *, unsigned int,
>> -			  struct vsp1_partition_window *);
>> +			  struct vsp1_partition_window *, bool);
>>  };
>>  
>>  struct vsp1_entity {
>> diff --git a/drivers/media/platform/vsp1/vsp1_pipe.c b/drivers/media/platform/vsp1/vsp1_pipe.c
>> index f1bd21a01bcd..137ebe0ecad2 100644
>> --- a/drivers/media/platform/vsp1/vsp1_pipe.c
>> +++ b/drivers/media/platform/vsp1/vsp1_pipe.c
>> @@ -375,10 +375,32 @@ bool vsp1_pipeline_partitioned(struct vsp1_pipeline *pipe)
>>  /*
>>   * Propagate the partition calculations through the pipeline
>>   *
>> - * Work backwards through the pipe, allowing each entity to update the partition
>> - * parameters based on its configuration, and the entity connected to its
>> - * source. Each entity must produce the partition required for the previous
>> - * entity in the pipeline.
>> + * Work backwards through the pipe, allowing each entity to update the
>> + * partition parameters based on its configuration. Each entity must produce
>> + * the partition window required for the previous entity in the pipeline
>> + * to generate. This window can be passed through if no changes are necessary.
> 
> I find this a bit unclear. I know how the hardware works and can thus
> understand what you meant, but for someone with less knowledge of the
> device (such as you or me in 6 months :-)) a clearer description would
> be good. In particular explaining what happens at the edge of partitions
> and why the window needs to be extended would be useful. This should
> also document the .partition() operation and the arguments it takes, in
> particular what the window refers to 




>(if I remember it stores the
> requested window for the output of the entity and returns the required
> window for the input, but that should be written explicitly).

No - not exactly, and in forming my reply below as to why not - I can
extract a better set of documentation... So I'm reworking this section
of documentation absed on the text below:


The .partition function allows an entity to transform a partition-window
based on it's current configuration in the direction specified by the
bool 'forwards'.

In the first pass, the entities shall process in the backwards
direction, and can expand the window to request a larger number of input
pixels for processing from the previous entity.

On the second pass, the entities shall process in the forwards direction
and shall consider any cropping requirements as a result of previous
entities producing an enlarged window. An entity can either consume the
'offset' as a crop to the left edge, or propagate it forwards.

Any information an entity stores in the vsp1_partition is private to
that entity, and shall not be accessed outside of that entity.

(I.e. the WPF shall not go fishing inside the vsp1_partition->rpf to
look at it's window parameters)

> The second to last sentence is also quite confusing. "Each entity must
> produce" reads like you're talking about the pixels produced by the
> entity, while I think you mean the window computed by the .partition()
> operation. Maybe something along the line of "Each entity reports the
> window it requires at its input to generate the requested output, and
> that window is propagated backward along the pipeline from entity to
> entity." ?
> 
> Explaining the vsp1_partition_window offset field in more details would
> be useful too. I initially commented about it below, but I think the
> detailed description belongs here, where the comment should state that
> the entities in the pipeline will generate incorrect pixels at the edges
> due to the use of pixel duplication on the sink, and that those invalid
> pixels must be clipped out. We thus start with a clipping offset equal
> to zero, and propagate it forward through the pipeline asking each
> entity how many invalid pixels it generates on the left side. You should
> also explain that we only clip pixels out on the left side as partitions
> are processed in the left to right order, so invalid pixels on the right
> side will be overwritten by good pixels from the next partition. By the
> way, does this hold true when rotating ?

Actually, that's not accurate. We /do/ clip the pixels on the right. We
don't write them to the image buffer. But it's done 'implicitly' because
the 'width' in the WPF partition window is never increased, so the WPF
never writes more pixels than it needs to.

I believe this is fine for rotating. The WPF is fed the required pixels
it needs to it's sink. It handles rotation after that point.


> 
> I trust your English skills more than mine to create a coherent text
> from all this :-)
> 
>> + *
>> + * Entities are processed in reverse order:
>> + *	DDDD = Destination pixels
>> + *	SSSS = Source pixels
>> + *	==== = Intermediate pixels
>> + *	____ = Disposable pixels
>> + *
>> + * WPF			    |DDDD|	WPF determines it's required partition
> 
> s/it's/its/
> 
> "required partition" is also a bit unclear.
> 
>> + * SRU			    |====|	Interconnected entities pass through
> 
> SRU is a bad example as it takes part in the partition size calculation.

Ah yes, but it didn't when I drew this  :-D

> 
>> + * UDS(source)		   |<====>|	UDS Source requests overlap
> 
> Same here, "overlap" isn't defined anywhere. It may get clearer once the
> documentation above is expanded though.
> 
>> + * UDS(sink)		|<-|======|->|	UDS Sink calculates input size
>> + * RPF			|__SSSSSSSS__|	RPF provides extra pixels
> 
> "Disposable pixels" is also unclear. Those pixels are not disposable,
> they are required to compute the destination pixels correctly, but they
> don't generate corresponding pixels in the destination for this
> partition.

I've dropped this section of text. Hopefully the new text is more clear.

> 
>> + *
>> + * Then work forwards through the pipe allowing entities to communicate any
>> + * clipping required based on any overlap and expansions they may have
>> + * generated.
>> + *
>> + * RPF			|__SSSSSSSS__|	Partition window is propagated forwards
>> + * UDS(sink)		|============|
>> + * UDS(source)		   |<====>|	UDS Source reports overlap
>> + * SRU			   |======|	Interconnected entities are updated
>> + * WPF			   |_DDDD_|	WPF handles clipping
> 
> It's not clear how this differs from the backward pass :-)
> 

The 'width' is expanded from the UDS(source), and is now 6 chars wide.
This propagates through the SRU (in x1 mode, as it was originally but
this might now have to change) to the WPF where it shows the clipping
region on the left and right as '_' characters.



> Let's try to come up with a clear and detailed description, it will be
> useful for the future. I know documentation is hard, but it's worth it.


I've chopped out my 'ascii art' and replaced some hopefully better
written paragraphs.


> 
>>   */
>>  void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
>>  				       struct vsp1_partition *partition,
>> @@ -387,10 +409,18 @@ void vsp1_pipeline_propagate_partition(struct vsp1_pipeline *pipe,
>>  {
>>  	struct vsp1_entity *entity;
>>  
>> +	/* Move backwards through the pipeline to propagate any expansion. */
>>  	list_for_each_entry_reverse(entity, &pipe->entities, list_pipe) {
>>  		if (entity->ops->partition)
>>  			entity->ops->partition(entity, pipe, partition, index,
>> -					       window);
>> +					       window, false);
>> +	}
>> +
>> +	/* Move forwards through the pipeline and propagate any updates. */
>> +	list_for_each_entry(entity, &pipe->entities, list_pipe) {
>> +		if (entity->ops->partition)
>> +			entity->ops->partition(entity, pipe, partition, index,
>> +					       window, true);
>>  	}
>>  }
>>  
>> diff --git a/drivers/media/platform/vsp1/vsp1_pipe.h b/drivers/media/platform/vsp1/vsp1_pipe.h
>> index dd8b2cdc6452..3e263a60f79b 100644
>> --- a/drivers/media/platform/vsp1/vsp1_pipe.h
>> +++ b/drivers/media/platform/vsp1/vsp1_pipe.h
>> @@ -58,10 +58,12 @@ enum vsp1_pipeline_state {
>>   * @left: horizontal coordinate of the partition start in pixels relative to the
>>   *	  left edge of the image
>>   * @width: partition width in pixels
>> + * @offset: The number of pixels from the left edge of the window to clip
>>   */
>>  struct vsp1_partition_window {
>>  	unsigned int left;
>>  	unsigned int width;
>> +	unsigned int offset;
>>  };
>>  
>>  /*
>> @@ -71,6 +73,8 @@ struct vsp1_partition_window {
>>   * @uds_source: The UDS output partition window configuration
>>   * @sru: The SRU partition window configuration
>>   * @wpf: The WPF partition window configuration
>> + * @start_phase: The UDS start phase for this partition
>> + * @end_phase: The UDS end phase for this partition
>>   */
>>  struct vsp1_partition {
>>  	struct vsp1_partition_window rpf;
>> @@ -78,6 +82,8 @@ struct vsp1_partition {
>>  	struct vsp1_partition_window uds_source;
>>  	struct vsp1_partition_window sru;
>>  	struct vsp1_partition_window wpf;
>> +	unsigned int start_phase;
>> +	unsigned int end_phase;
>>  };
>>  
>>  /*
>> diff --git a/drivers/media/platform/vsp1/vsp1_rpf.c b/drivers/media/platform/vsp1/vsp1_rpf.c
>> index ef9bf5dd55a0..46d270644fe2 100644
>> --- a/drivers/media/platform/vsp1/vsp1_rpf.c
>> +++ b/drivers/media/platform/vsp1/vsp1_rpf.c
>> @@ -324,9 +324,13 @@ static void rpf_partition(struct vsp1_entity *entity,
>>  			  struct vsp1_pipeline *pipe,
>>  			  struct vsp1_partition *partition,
>>  			  unsigned int partition_idx,
>> -			  struct vsp1_partition_window *window)
>> +			  struct vsp1_partition_window *window,
>> +			  bool forwards)
>>  {
>> -	partition->rpf = *window;
>> +	if (forwards)
>> +		*window = partition->rpf;
>> +	else
>> +		partition->rpf = *window;
>>  }
>>  
>>  static const struct vsp1_entity_operations rpf_entity_ops = {
>> diff --git a/drivers/media/platform/vsp1/vsp1_sru.c b/drivers/media/platform/vsp1/vsp1_sru.c
>> index b1617cb1f2b9..5e6be0bbcf36 100644
>> --- a/drivers/media/platform/vsp1/vsp1_sru.c
>> +++ b/drivers/media/platform/vsp1/vsp1_sru.c
>> @@ -327,24 +327,58 @@ static void sru_partition(struct vsp1_entity *entity,
>>  			  struct vsp1_pipeline *pipe,
>>  			  struct vsp1_partition *partition,
>>  			  unsigned int partition_idx,
>> -			  struct vsp1_partition_window *window)
>> +			  struct vsp1_partition_window *window,
>> +			  bool forwards)
>>  {
>>  	struct vsp1_sru *sru = to_sru(&entity->subdev);
>>  	struct v4l2_mbus_framefmt *input;
>>  	struct v4l2_mbus_framefmt *output;
>> +	int scale_up;
> 
> I would either declare this as a bool, or an unsigned int scale_factor
> equal to 1 or 2, in which case you could replace *= 2 and /= 2 with *=
> scale_factor and /= scale_factor. 

Hrm ... interesting thought ... I'll see what the scale_factor looks
like, otherwise I'll use a bool.


I'll stick with the bool, as I need to know when to add an extra pixel
to the right edge... which needs an if (scale_up) anyway.


>>  
>>  	input = vsp1_entity_get_pad_format(&sru->entity, sru->entity.config,
>>  					   SRU_PAD_SINK);
>>  	output = vsp1_entity_get_pad_format(&sru->entity, sru->entity.config,
>>  					    SRU_PAD_SOURCE);
>>  
>> +	scale_up = (input->width != output->width);
>> +
>> +	if (forwards) {
>> +		/* Propagate the clipping offsets forwards. */
>> +		window->offset += partition->sru.offset;
> 
> You could write this
> 
> 		if (window->left != 0)
> 			window->offset++;
> 
> and drop vsp1_partition::sru that is used solely to store the offset.

Yes, I like that, thanks.

> 
>> +
>> +		if (scale_up)
>> +			window->offset *= 2;
>> +
>> +		return;
>> +	}
>> +
> 
> Let's add an overall explanation.
> 
> 	/*
> 	 * The SRU has a 3-tap pre-filter that generates the same number of
> 	 * pixels as it consumes. Edge output pixels are computed using edge
> 	 * pixel duplication at the input. This results in one incorrect output
> 	 * pixel on each side of the partition window after the pre-filter. To
> 	 * compensate for this, require one additional input pixel on each side
> 	 * before the pre-filter (thus before scaling).
> 	 *
> 	 * Additionally, the 2x up-scaler uses a bilinear post-filter and
> 	 * generates odd pixels from their two neighbours. The rightmost output
> 	 * pixel is thus computed using edge pixel duplication on the right side
> 	 * of the input (the leftmost output pixel is an even pixel, aligned
> 	 * with the leftmost input pixel and thus depends only on the
> 	 * corresponding pixel after the pre-filter). To compensate for this,
> 	 * require one additional input pixel on the right side when up-scaling.
> 	 */

That's good. Text added verbatim.

>>  	/* Adapt if SRUx2 is enabled. */
>> -	if (input->width != output->width) {
>> +	if (scale_up) {
>> +		/* Clipping offsets are not back-propagated. */
>>  		window->width /= 2;
>>  		window->left /= 2;
>> +
>> +		/* SRUx2 requires an extra pixel at the right edge. */
>> +		window->width++;
>>  	}
>>  
>> +	/*
>> +	 * The partition->sru represents the SRU sink pad configuration.
> 
> This should be documented in the vsp1_partition structure, not here (or
> not only here). Are all windows in the vsp1_partition structure related
> to the sink pad of the corresponding entity ? If so, let's document is
> globally (and I hope so, otherwise it would be quite confusing). 


No, The RPF stores only the source.
The UDS stores both the source and sink separately.
The WPF stores only the sink.

Partition->sru is now removed though.

I've added "RPF 'output'" and "WPF 'input'" to clarify this in the
documentation of struct vsp1_partition, to align with the text used
describing the UDS.

> 
>> +	 * However, the SRU is a passive component in the partition algorithm.
> 
> What does this mean ?

I believe I was referring to the point that we don't have to write
register values for the SRU. It's passive in the pipeline rather than
the algorithm. We have to account for the actions it takes, but we don't
have to update the SRU depending on the partitions.

However - it's irrelevant - comment dropped as we no longer store the
partition window for the SRU.

> 
>> +	 */
>>  	partition->sru = *window;
>> +
>> +	/* Expand to the left edge. */
>> +	if (window->left != 0) {
>> +		window->left--;
>> +		window->width++;
>> +		partition->sru.offset = 1;
>> +	} else {
>> +		partition->sru.offset = 0;
>> +	}
>> +
>> +	/* Expand to the right edge. */
>> +	window->width++;
> 
> Does this also need to be conditioned to avoid an overlofw on the right
> side ? Same question for the width++ inside the if (scale_up) above. I
> wonder if it wouldn't be easier to remove all these conditions, turn the
> window->left field into a signed int, and after the backward pass clamp
> it to 0 (adjusting the offset field accordingly) and clamp the width to
> the right side of the image. The logic in the entities would be simpler.

I had thought that this would just pixel repeat and be fine... but now
I'm not so convinced. These values would propagate back to the RPF and
could potentially cause a read beyond the end of the buffer for the last
line in the image.

Clamping after each partition calculation sounds extraneous to me, and
actually is quite awkward to do in a common location, as the entity
would then need to update it's window after the common code performs the
clamping.

	window->left = max(window->left, 0)
	window->width = min(window->left + window->width


The UDS clamps it's values after the margin is added:

	dst_left = max_t(int, 0, window->left - margin);
	dst_right = min_t(int, output->width - 1,
			  window->left + window->width - 1 + margin);

But it's not easy to map that directly to the SRU.

Instead I have added a function to the pipe to make it clear when we are
dealing with the last/right partition (the left/first partition is easy,
idx==0):

		if (!vsp1_pipeline_partition_last(pipe, partition_idx))
			window->width++;

>>  }
>>  
>>  static const struct vsp1_entity_operations sru_entity_ops = {
>> diff --git a/drivers/media/platform/vsp1/vsp1_uds.c b/drivers/media/platform/vsp1/vsp1_uds.c
>> index c71c24363d54..33c582aca5a5 100644
>> --- a/drivers/media/platform/vsp1/vsp1_uds.c
>> +++ b/drivers/media/platform/vsp1/vsp1_uds.c
>> @@ -270,6 +270,7 @@ static void uds_configure_stream(struct vsp1_entity *entity,
>>  	const struct v4l2_mbus_framefmt *input;
>>  	unsigned int hscale;
>>  	unsigned int vscale;
>> +	bool manual_phase = vsp1_pipeline_partitioned(pipe);
>>  	bool multitap;
>>  
>>  	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
>> @@ -294,7 +295,8 @@ static void uds_configure_stream(struct vsp1_entity *entity,
>>  
>>  	vsp1_uds_write(uds, dlb, VI6_UDS_CTRL,
>>  		       (uds->scale_alpha ? VI6_UDS_CTRL_AON : 0) |
>> -		       (multitap ? VI6_UDS_CTRL_BC : 0));
>> +		       (multitap ? VI6_UDS_CTRL_BC : 0) |
>> +		       (manual_phase ? VI6_UDS_CTRL_AMDSLH : 0));
>>  
>>  	vsp1_uds_write(uds, dlb, VI6_UDS_PASS_BWIDTH,
>>  		       (uds_passband_width(hscale)
>> @@ -332,6 +334,12 @@ static void uds_configure_partition(struct vsp1_entity *entity,
>>  				<< VI6_UDS_CLIP_SIZE_HSIZE_SHIFT) |
>>  		       (output->height
>>  				<< VI6_UDS_CLIP_SIZE_VSIZE_SHIFT));
>> +
>> +	vsp1_uds_write(uds, dlb, VI6_UDS_HPHASE,
>> +		       (partition->start_phase
>> +				<< VI6_UDS_HPHASE_HSTP_SHIFT) |
>> +		       (partition->end_phase
>> +				<< VI6_UDS_HPHASE_HEDP_SHIFT));
>>  }
>>  
>>  static unsigned int uds_max_width(struct vsp1_entity *entity,
>> @@ -374,11 +382,27 @@ static void uds_partition(struct vsp1_entity *entity,
>>  			  struct vsp1_pipeline *pipe,
>>  			  struct vsp1_partition *partition,
>>  			  unsigned int partition_idx,
>> -			  struct vsp1_partition_window *window)
>> +			  struct vsp1_partition_window *window,
>> +			  bool forwards)
>>  {
>>  	struct vsp1_uds *uds = to_uds(&entity->subdev);
>>  	const struct v4l2_mbus_framefmt *output;
>>  	const struct v4l2_mbus_framefmt *input;
>> +	unsigned int hscale;
>> +	unsigned int margin;
>> +
> 
> No need for a blank line.

Removed

> 
>> +	unsigned int mp;
>> +	unsigned int src_left;
>> +	unsigned int src_right;
>> +	unsigned int dst_left;
>> +	unsigned int dst_right;
>> +	unsigned int remainder;
>> +
>> +	/* For forwards propagation - simply pass on our output. */
> 
> I'd say "simply pass on the output we computed in the backward pass.".
> 
> This means we can't support UDS after SRU. I recall you wanted to
> experiment with this, should we already prepare by adding the offset
> here ? Or would it require more intrusive changes that makes preparation
> not worth it ? In the latter case I'd expand the comment to explain that
> the offset is copied as-is because the driver ensures the SRU never
> comes before the UDS.

Good spot ... but not 100% correct.

It's certainly a bug - but actually - the offset does not need to be
propagated forwards, as it seems it can be clipped at the UDS sink,
which is fortunate, because otherwise we'd have to calculate the offset
after it's gone through scaling...

Of course, that is not currently happening :-)

> 
>> +	if (forwards) {
>> +		*window = partition->uds_source;
>> +		return;
>> +	}


So this becomes:

 if (forwards) {
 	/* Accept any incoming offset (clipping) request. */
 	partition->uds_sink.offset = window->offset;
 	window->offset = 0;

 	/* pass on the output we computed in the backwards pass. */
 	*window = partition->uds_source;

 	return;
 }

And the input size clipping in uds_configure_partition() shall be
updated to use partition->uds_sink.offset.



>>  
>>  	/* Initialise the partition state. */
>>  	partition->uds_sink = *window;
>> 	partition->uds_source = *window;
> 
> This isn't needed anymore.

Removed.


> 
>>
>> 	input = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
>> 					   UDS_PAD_SINK);
>>  	output = vsp1_entity_get_pad_format(&uds->entity, uds->entity.config,
>>  					    UDS_PAD_SOURCE);
>>  
>> -	partition->uds_sink.width = window->width * input->width
>> -				  / output->width;
>> -	partition->uds_sink.left = window->left * input->width
>> -				 / output->width;
>> +	/*
>> +	 * Quantify the margin required for discontinuous overlap, and expand
>> +	 * the window no further than the limits of the image.
>> +	 */
>> +	hscale = uds_compute_ratio(input->width, output->width);
>> +	margin = hscale < 0x200 ? 32 : /* 8 <  scale */
>> +		 hscale < 0x400 ? 16 : /* 4 <  scale <= 8 */
>> +		 hscale < 0x800 ?  8 : /* 2 <  scale <= 4 */
>> +				   4;  /*      scale <= 2 */
> 
> Where does this come from ?

This comes from some example code I received from Renesas.

This isn't very well documented by the datasheet, but I believe at least
a 2 pixel overlap is required to be added. The margin above determines a
2 pixel overlap at the output for upscaling.

For downscaling, this could potentially be optimised by adding an extra:


   hscale < 4096 ? 4 :	/* 1 < scale <= 2 */
                   2 :  /*  scale <= 1 (downscaling) */

But this wasn't in the sample code and would require some extra testing
and verification. I might leave that until later.


> I thought that the steps 1 to 7 below would
> take care of computing the margin ?


No, steps 1 to 7 below account only for determining the position at the
input which represents a given output position at the configured ratio.


>> +
>> +	dst_left = max_t(int, 0, window->left - margin);
>> +	dst_right = min_t(int, output->width - 1,
>> +			  window->left + window->width - 1 + margin);
>> +
>> +	/*
>> +	 * Identify the sink positions which represent the required output
> 
> s/output/source/ or s/sink/input/
> s/which/that/ ?
> 
>> +	 * positions. This is done in two parts, first converting destination
>> +	 * to input positions, but then converting back to destination to
> 
> s/destination/output/ or s/input/source/. Source would be ambiguous here
> as it means output in sink/source, and input in source/destination.

Indeed, who came up with these naming schemes.

We should change the industry to use "tap/tub" instead of "source/sink"
(things come out of the bath-tap, and into the bath-tub... right...)

Plus taps and tubs always have the same number of letters to make the
code align nicely.... :-D

> 
>> +	 * account for any rounding requirements. Once adjusted, the final
>> +	 * source positions are determined.
> 
> Which source is this one, the input or the output ? :-)

The one with the hot sauce ...
This one is the input still.

I'll rework the comments to try to be more clear.



> 
>> +	 */
>> +
>> +	mp = uds_multiplier(hscale);
>> +
>> +	/* Step 1: Calculate temporary src_left (src_pos0) position. */
>> +	/* Step 2: Calculate temporary dst_left (dst_pos0_pb) position. */
>> +	if (partition_idx == 0) {
>> +		src_left = 0;
>> +		dst_left = 0;
> 
> Would this get simplified if we handled the left and right clamp in
> vsp1_pipeline_propagate_partition() as proposed above ? The first
> partition would end up being slightly smaller though, maybe it's not the
> best idea. For the last partition I think it would be less of an issue.

Why would the first partition end up being slightly smaller ?


Handling the clamping in vsp1_pipeline_propagate_partition() doesn't
work well, as then you don't easily know which partition_window in the
vsp1_partition to update.


>> +	} else {
>> +		unsigned int sub_src = mp == 1 ? 1 : 2;
>> +
>> +		src_left = ((dst_left * hscale) / (4096 * mp) - sub_src) * mp;
>> +		dst_left = src_left * 4096 / hscale;
>> +	}
>> +
>> +	/*
>> +	 * Step 3: Determine dst_left (dst_pos0_pb) from temporary dst_left.
>> +	 *
>> +	 * The output must be aligned to a multiple of the pre-filter
>> +	 * multiplier.
> 
> "Step 3: Pull back dst_left (dst_pos0_pb) to the left to satisfy
> alignment restrictions (the input of the bi-cubic filter must be aligned
> to a multiple of the pre-filter multiplier)."
> 
> It would also be useful to add an explanation of the UDS operation,
> similar to the one I wrote above for the SRU, that explains the
> pre-filter and the bicubic filter (see figure 32.38).

I've added the following to before the margin calculations:

/*
 * Quantify the margin required for discontinuous overlap, and expand
 * the window no further than the limits of the image.
 *
 * When downscaling, the UDS has a pre-scaling binning filter which
 * reduces the input by either 2 or 4 depending on the downscale ratio,
 * which we must align with. The output is then fed into a 5 tap
 * bi-cubic filter requiring us to expand our output window by 2 pixels
 * on each side.
 *
 * When upscaling the extra margin is required from the input side and
 * we round up the expansion to a power of 2.
 */

> 
>> +	 */
>> +	remainder = (dst_left * hscale) % mp;
>> +	if (remainder)
>> +		/* Remainder can only be two when mp == 4. */
>> +		dst_left = round_down(dst_left, hscale % mp == 2 ? 2 : mp);
>> +
>> +	/* Step 4: Recalculate src_left from newly adjusted dst_left. */
>> +	src_left = DIV_ROUND_UP(dst_left * hscale, 4096 * mp) * mp;
>> +
>> +	/* Step 5: Calculate src_right (src_pos1). */
>> +	if (partition_idx == pipe->partitions - 1)
>> +		src_right = input->width - 1;
>> +	else
>> +		src_right = (((dst_right * hscale) / (mp * 4096)) + 2)
>> +			  * mp + (mp / 2);
>> +
>> +	/* Step 6: Calculate start phase (hstp). */
>> +	remainder = (src_left * hscale) % (mp * 4096);
>> +	partition->start_phase = remainder ? (4096 - remainder / mp) : 0;
> 
> This could also be written
> 
> 	partition->start_phase = (4096 - remainder / mp) & 4095;
> 
> or
> 
> 	partition->start_phase = (4096 - remainder / mp) % 4096;

The %modulus reads the intent better to me, but the &bitop might be
quicker. Though I bet the compiler will optimise the same anyway.

> 
> Up to you.
> 
>> +
>> +	/*
>> +	 * Step 7: Calculate end phase (hedp).
>> +	 *
>> +	 * We do not currently use VI6_UDS_CTRL_AMD from VI6_UDS_CTRL.
>> +	 * In the event that we enable VI6_UDS_CTRL_AMD, we must set the end
>> +	 * phase for the final partition to the phase_edge.
>> +	 */
>> +	partition->end_phase = 0;
>> +
>> +	/*
>> +	 * Fill in our partition windows with the updated positions, and
>> +	 * configure our output offset to allow extraneous pixels to be
>> +	 * clipped by later entities.
>> +	 */
>> +	partition->uds_sink.left = src_left;
>> +	partition->uds_sink.width = src_right - src_left + 1;
>> +
>> +	partition->uds_source.left = dst_left;
>> +	partition->uds_source.width = dst_right - dst_left + 1;
>> +
>> +	partition->uds_source.offset = window->left - dst_left;
>>  
>> +	/* Pass a copy of our sink down to the previous entity. */
>>  	*window = partition->uds_sink;
>>  }
>>  
>> diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
>> index d1ecc3d91290..3638a4e9bb19 100644
>> --- a/drivers/media/platform/vsp1/vsp1_video.c
>> +++ b/drivers/media/platform/vsp1/vsp1_video.c
>> @@ -221,6 +221,7 @@ static void vsp1_video_calculate_partition(struct vsp1_pipeline *pipe,
>>  	/* Initialise the partition with sane starting conditions. */
>>  	window.left = index * div_size;
>>  	window.width = div_size;
>> +	window.offset = 0;
>>  
>>  	modulus = format->width % div_size;
>>  
>> diff --git a/drivers/media/platform/vsp1/vsp1_wpf.c b/drivers/media/platform/vsp1/vsp1_wpf.c
>> index 9e8dbf99878b..2e8cc4195c31 100644
>> --- a/drivers/media/platform/vsp1/vsp1_wpf.c
>> +++ b/drivers/media/platform/vsp1/vsp1_wpf.c
>> @@ -371,16 +371,19 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
>>  						 RWPF_PAD_SINK);
>>  	width = sink_format->width;
>>  	height = sink_format->height;
>> +	offset = 0;
>>  
>>  	/*
>>  	 * Cropping. The partition algorithm can split the image into
>>  	 * multiple slices.
>>  	 */
>> -	if (vsp1_pipeline_partitioned(pipe))
>> +	if (vsp1_pipeline_partitioned(pipe)) {
>>  		width = pipe->partition->wpf.width;
>> +		offset = pipe->partition->wpf.offset;
>> +	}
>>  
>>  	vsp1_wpf_write(wpf, dlb, VI6_WPF_HSZCLIP, VI6_WPF_SZCLIP_EN |
>> -		       (0 << VI6_WPF_SZCLIP_OFST_SHIFT) |
>> +		       (offset << VI6_WPF_SZCLIP_OFST_SHIFT) |
>>  		       (width << VI6_WPF_SZCLIP_SIZE_SHIFT));
>>  	vsp1_wpf_write(wpf, dlb, VI6_WPF_VSZCLIP, VI6_WPF_SZCLIP_EN |
>>  		       (0 << VI6_WPF_SZCLIP_OFST_SHIFT) |
>> @@ -491,8 +494,15 @@ static void wpf_partition(struct vsp1_entity *entity,
>>  			  struct vsp1_pipeline *pipe,
>>  			  struct vsp1_partition *partition,
>>  			  unsigned int partition_idx,
>> -			  struct vsp1_partition_window *window)
>> +			  struct vsp1_partition_window *window,
>> +			  bool forwards)
>>  {
>> +	if (forwards) {
>> +		/* Only handle incoming cropping requirements. */
>> +		partition->wpf.offset = window->offset;
>> +		return;
>> +	}
>> +
>>  	partition->wpf = *window;
>>  }
>>  
> 

