Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD9646F9180
	for <lists+linux-media@lfdr.de>; Sat,  6 May 2023 13:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbjEFLZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 07:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjEFLZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 07:25:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190168A5C
        for <linux-media@vger.kernel.org>; Sat,  6 May 2023 04:25:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEB37800;
        Sat,  6 May 2023 13:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683372305;
        bh=rGotTKkBHQvzW0Bc5i1c4GVsKkcWVlgfkPhGQ2bJMjc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kGwYuY2gK7rb67lw9gcKUE7NE9GzKbm2GVvrw8PCm+npZDF4ji85Ec0n8RGkNGKgq
         ArqISNSKTMt3xILL+fjeIPApIe3nij+DLSn9IQ6YA7+jBXn5Q+6KwaNgTguRL32Hqt
         OuPodzUuHeJ9n6kZ78iw+sZR7uzUTlmDD9KzQCRE=
Date:   Sat, 6 May 2023 14:25:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com
Subject: Re: [PATCH 1/3] media: mc: Make media_get_pad_index() use pad type
 flag
Message-ID: <20230506112521.GA17474@pendragon.ideasonboard.com>
References: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
 <20230505205101.54569-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505205101.54569-2-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, May 05, 2023 at 11:50:59PM +0300, Sakari Ailus wrote:
> Use the pad flag specifying the pad type instead of a boolean in
> preparation for internal source pads.
> 
> Also make the loop variable unsigned.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/dvb-core/dvbdev.c        |  4 +--
>  drivers/media/mc/mc-entity.c           | 16 ++++-------
>  drivers/media/usb/au0828/au0828-core.c |  2 +-
>  drivers/media/v4l2-core/v4l2-mc.c      | 38 +++++++++++++++++---------
>  include/media/media-entity.h           |  4 +--
>  5 files changed, 35 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
> index 0ed087caf7f3..0091b5375e45 100644
> --- a/drivers/media/dvb-core/dvbdev.c
> +++ b/drivers/media/dvb-core/dvbdev.c
> @@ -707,7 +707,7 @@ int dvb_create_media_graph(struct dvb_adapter *adap,
>  						     MEDIA_LNK_FL_ENABLED,
>  						     false);
>  		} else {
> -			pad_sink = media_get_pad_index(tuner, true,
> +			pad_sink = media_get_pad_index(tuner, MEDIA_PAD_FL_SINK,
>  						       PAD_SIGNAL_ANALOG);
>  			if (pad_sink < 0)
>  				return -EINVAL;
> @@ -725,7 +725,7 @@ int dvb_create_media_graph(struct dvb_adapter *adap,
>  
>  	if (ntuner && ndemod) {
>  		/* NOTE: first found tuner source pad presumed correct */
> -		pad_source = media_get_pad_index(tuner, false,
> +		pad_source = media_get_pad_index(tuner, MEDIA_PAD_FL_SOURCE,
>  						 PAD_SIGNAL_ANALOG);
>  		if (pad_source < 0)
>  			return -EINVAL;
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index e7216a985ba6..ef34ddd715c9 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1052,25 +1052,19 @@ static void __media_entity_remove_link(struct media_entity *entity,
>  	kfree(link);
>  }
>  
> -int media_get_pad_index(struct media_entity *entity, bool is_sink,
> +int media_get_pad_index(struct media_entity *entity, u32 pad_type,
>  			enum media_pad_signal_type sig_type)
>  {
> -	int i;
> -	bool pad_is_sink;
> +	unsigned int i;
>  
>  	if (!entity)
>  		return -EINVAL;
>  
>  	for (i = 0; i < entity->num_pads; i++) {
> -		if (entity->pads[i].flags & MEDIA_PAD_FL_SINK)
> -			pad_is_sink = true;
> -		else if (entity->pads[i].flags & MEDIA_PAD_FL_SOURCE)
> -			pad_is_sink = false;
> -		else
> -			continue;	/* This is an error! */
> -
> -		if (pad_is_sink != is_sink)
> +		if ((entity->pads[i].flags &
> +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
>  			continue;
> +
>  		if (entity->pads[i].sig_type == sig_type)
>  			return i;
>  	}
> diff --git a/drivers/media/usb/au0828/au0828-core.c b/drivers/media/usb/au0828/au0828-core.c
> index b3a09d3ac7d2..1e246b47766d 100644
> --- a/drivers/media/usb/au0828/au0828-core.c
> +++ b/drivers/media/usb/au0828/au0828-core.c
> @@ -250,7 +250,7 @@ static void au0828_media_graph_notify(struct media_entity *new,
>  
>  create_link:
>  	if (decoder && mixer) {
> -		ret = media_get_pad_index(decoder, false,
> +		ret = media_get_pad_index(decoder, MEDIA_PAD_FL_SOURCE,
>  					  PAD_SIGNAL_AUDIO);
>  		if (ret >= 0)
>  			ret = media_create_pad_link(decoder, ret,
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> index bf0c18100664..209a7efd08fe 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -105,9 +105,11 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
>  	/* Link the tuner and IF video output pads */
>  	if (tuner) {
>  		if (if_vid) {
> -			pad_source = media_get_pad_index(tuner, false,
> +			pad_source = media_get_pad_index(tuner,
> +							 MEDIA_PAD_FL_SOURCE,
>  							 PAD_SIGNAL_ANALOG);
> -			pad_sink = media_get_pad_index(if_vid, true,
> +			pad_sink = media_get_pad_index(if_vid,
> +						       MEDIA_PAD_FL_SINK,
>  						       PAD_SIGNAL_ANALOG);
>  			if (pad_source < 0 || pad_sink < 0) {
>  				dev_warn(mdev->dev, "Couldn't get tuner and/or PLL pad(s): (%d, %d)\n",
> @@ -122,9 +124,11 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
>  				return ret;
>  			}
>  
> -			pad_source = media_get_pad_index(if_vid, false,
> +			pad_source = media_get_pad_index(if_vid,
> +							 MEDIA_PAD_FL_SOURCE,
>  							 PAD_SIGNAL_ANALOG);
> -			pad_sink = media_get_pad_index(decoder, true,
> +			pad_sink = media_get_pad_index(decoder,
> +						       MEDIA_PAD_FL_SINK,
>  						       PAD_SIGNAL_ANALOG);
>  			if (pad_source < 0 || pad_sink < 0) {
>  				dev_warn(mdev->dev, "get decoder and/or PLL pad(s): (%d, %d)\n",
> @@ -139,9 +143,11 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
>  				return ret;
>  			}
>  		} else {
> -			pad_source = media_get_pad_index(tuner, false,
> +			pad_source = media_get_pad_index(tuner,
> +							 MEDIA_PAD_FL_SOURCE,
>  							 PAD_SIGNAL_ANALOG);
> -			pad_sink = media_get_pad_index(decoder, true,
> +			pad_sink = media_get_pad_index(decoder,
> +						       MEDIA_PAD_FL_SINK,
>  						       PAD_SIGNAL_ANALOG);
>  			if (pad_source < 0 || pad_sink < 0) {
>  				dev_warn(mdev->dev, "couldn't get tuner and/or decoder pad(s): (%d, %d)\n",
> @@ -156,9 +162,11 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
>  		}
>  
>  		if (if_aud) {
> -			pad_source = media_get_pad_index(tuner, false,
> +			pad_source = media_get_pad_index(tuner,
> +							 MEDIA_PAD_FL_SOURCE,
>  							 PAD_SIGNAL_AUDIO);
> -			pad_sink = media_get_pad_index(if_aud, true,
> +			pad_sink = media_get_pad_index(if_aud,
> +						       MEDIA_PAD_FL_SINK,
>  						       PAD_SIGNAL_AUDIO);
>  			if (pad_source < 0 || pad_sink < 0) {
>  				dev_warn(mdev->dev, "couldn't get tuner and/or decoder pad(s) for audio: (%d, %d)\n",
> @@ -180,7 +188,8 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
>  
>  	/* Create demod to V4L, VBI and SDR radio links */
>  	if (io_v4l) {
> -		pad_source = media_get_pad_index(decoder, false, PAD_SIGNAL_DV);
> +		pad_source = media_get_pad_index(decoder, MEDIA_PAD_FL_SOURCE,
> +						 PAD_SIGNAL_DV);
>  		if (pad_source < 0) {
>  			dev_warn(mdev->dev, "couldn't get decoder output pad for V4L I/O\n");
>  			return -EINVAL;
> @@ -195,7 +204,8 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
>  	}
>  
>  	if (io_swradio) {
> -		pad_source = media_get_pad_index(decoder, false, PAD_SIGNAL_DV);
> +		pad_source = media_get_pad_index(decoder, MEDIA_PAD_FL_SOURCE,
> +						 PAD_SIGNAL_DV);
>  		if (pad_source < 0) {
>  			dev_warn(mdev->dev, "couldn't get decoder output pad for SDR\n");
>  			return -EINVAL;
> @@ -210,7 +220,8 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
>  	}
>  
>  	if (io_vbi) {
> -		pad_source = media_get_pad_index(decoder, false, PAD_SIGNAL_DV);
> +		pad_source = media_get_pad_index(decoder, MEDIA_PAD_FL_SOURCE,
> +						 PAD_SIGNAL_DV);
>  		if (pad_source < 0) {
>  			dev_warn(mdev->dev, "couldn't get decoder output pad for VBI\n");
>  			return -EINVAL;
> @@ -231,7 +242,7 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
>  		case MEDIA_ENT_F_CONN_RF:
>  			if (!tuner)
>  				continue;
> -			pad_sink = media_get_pad_index(tuner, true,
> +			pad_sink = media_get_pad_index(tuner, MEDIA_PAD_FL_SINK,
>  						       PAD_SIGNAL_ANALOG);
>  			if (pad_sink < 0) {
>  				dev_warn(mdev->dev, "couldn't get tuner analog pad sink\n");
> @@ -243,7 +254,8 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
>  			break;
>  		case MEDIA_ENT_F_CONN_SVIDEO:
>  		case MEDIA_ENT_F_CONN_COMPOSITE:
> -			pad_sink = media_get_pad_index(decoder, true,
> +			pad_sink = media_get_pad_index(decoder,
> +						       MEDIA_PAD_FL_SINK,
>  						       PAD_SIGNAL_ANALOG);
>  			if (pad_sink < 0) {
>  				dev_warn(mdev->dev, "couldn't get decoder analog pad sink\n");
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 741f9c629c6f..e4f556911c3f 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -741,7 +741,7 @@ static inline void media_entity_cleanup(struct media_entity *entity) {}
>   * media_get_pad_index() - retrieves a pad index from an entity
>   *
>   * @entity:	entity where the pads belong
> - * @is_sink:	true if the pad is a sink, false if it is a source
> + * @pad_type:	the type of the pad, one of MEDIA_PAD_FL_* pad types
>   * @sig_type:	type of signal of the pad to be search
>   *
>   * This helper function finds the first pad index inside an entity that
> @@ -752,7 +752,7 @@ static inline void media_entity_cleanup(struct media_entity *entity) {}
>   * On success, return the pad number. If the pad was not found or the media
>   * entity is a NULL pointer, return -EINVAL.
>   */
> -int media_get_pad_index(struct media_entity *entity, bool is_sink,
> +int media_get_pad_index(struct media_entity *entity, u32 pad_type,
>  			enum media_pad_signal_type sig_type);
>  
>  /**

-- 
Regards,

Laurent Pinchart
