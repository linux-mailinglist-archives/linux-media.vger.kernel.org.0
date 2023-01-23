Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3F846783F8
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 19:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbjAWSDB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 13:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233426AbjAWSC7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 13:02:59 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C709D1B578
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 10:02:51 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="390607423"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="390607423"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="694023074"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="694023074"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 23 Jan 2023 10:02:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pK19U-00DraS-2N;
        Mon, 23 Jan 2023 20:02:40 +0200
Date:   Mon, 23 Jan 2023 20:02:40 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 27/57] media: atomisp: Remove isp_subdev_link_setup()
Message-ID: <Y87LwAVr15QUl6U4@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-28-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-28-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:35PM +0100, Hans de Goede wrote:
> Looking at isp_subdev_link_setup(), this function can never work,
> it does a switch-case like this:
> 
>  switch (local->index | is_media_entity_v4l2_subdev(remote->entity))
> 
> with cases like this:
> 
>  case ATOMISP_SUBDEV_PAD_SINK | MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN
> 
> where ATOMISP_SUBDEV_PAD_SINK matches an index (0-4) and
> MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN is 0x00020000, but
> is_media_entity_v4l2_subdev(remote->entity) does not return
> MEDIA_ENT_F_* values, it return a bool, so 0 or 1 which means
> that non of the cases can ever match the input value.
> 
> Looking at the rest of the function all it ever does (if it
> would actually hit one of the cases) is set the atomisp_sub_device
> struct's input member.
> 
> And checking the rest of the atomisp code that member is never
> read. Also userspace does not actually setup media-controller
> links when using the atomisp /dev/video$ nodes since all the links
> are fixed. So isp_subdev_link_setup() never runs.
> 
> Remove the unnecessary and broken isp_subdev_link_setup() function
> and also remove the unused atomisp_sub_device struct's input member.

(One of the) best patch(es) in the series!
Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/pci/atomisp_subdev.c        | 79 -------------------
>  .../media/atomisp/pci/atomisp_subdev.h        | 13 ---
>  2 files changed, 92 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> index eb8f319fca5c..52d1936b8c87 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> @@ -714,85 +714,8 @@ static void isp_subdev_init_params(struct atomisp_sub_device *asd)
>  	}
>  }
>  
> -/*
> -* isp_subdev_link_setup - Setup isp subdev connections
> -* @entity: ispsubdev media entity
> -* @local: Pad at the local end of the link
> -* @remote: Pad at the remote end of the link
> -* @flags: Link flags
> -*
> -* return -EINVAL or zero on success
> -*/
> -static int isp_subdev_link_setup(struct media_entity *entity,
> -				 const struct media_pad *local,
> -				 const struct media_pad *remote, u32 flags)
> -{
> -	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> -	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
> -	struct atomisp_device *isp = isp_sd->isp;
> -	unsigned int i;
> -
> -	switch (local->index | is_media_entity_v4l2_subdev(remote->entity)) {
> -	case ATOMISP_SUBDEV_PAD_SINK | MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN:
> -		/* Read from the sensor CSI2-ports. */
> -		if (!(flags & MEDIA_LNK_FL_ENABLED)) {
> -			isp_sd->input = ATOMISP_SUBDEV_INPUT_NONE;
> -			break;
> -		}
> -
> -		if (isp_sd->input != ATOMISP_SUBDEV_INPUT_NONE)
> -			return -EBUSY;
> -
> -		for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
> -			if (remote->entity != &isp->csi2_port[i].subdev.entity)
> -				continue;
> -
> -			isp_sd->input = ATOMISP_SUBDEV_INPUT_CSI2_PORT1 + i;
> -			return 0;
> -		}
> -
> -		return -EINVAL;
> -
> -	case ATOMISP_SUBDEV_PAD_SINK | MEDIA_ENT_F_OLD_BASE:
> -		/* read from memory */
> -		if (flags & MEDIA_LNK_FL_ENABLED) {
> -			if (isp_sd->input >= ATOMISP_SUBDEV_INPUT_CSI2_PORT1 &&
> -			    isp_sd->input < (ATOMISP_SUBDEV_INPUT_CSI2_PORT1
> -					     + ATOMISP_CAMERA_NR_PORTS))
> -				return -EBUSY;
> -			isp_sd->input = ATOMISP_SUBDEV_INPUT_MEMORY;
> -		} else {
> -			if (isp_sd->input == ATOMISP_SUBDEV_INPUT_MEMORY)
> -				isp_sd->input = ATOMISP_SUBDEV_INPUT_NONE;
> -		}
> -		break;
> -
> -	case ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW | MEDIA_ENT_F_OLD_BASE:
> -		/* always write to memory */
> -		break;
> -
> -	case ATOMISP_SUBDEV_PAD_SOURCE_VF | MEDIA_ENT_F_OLD_BASE:
> -		/* always write to memory */
> -		break;
> -
> -	case ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE | MEDIA_ENT_F_OLD_BASE:
> -		/* always write to memory */
> -		break;
> -
> -	case ATOMISP_SUBDEV_PAD_SOURCE_VIDEO | MEDIA_ENT_F_OLD_BASE:
> -		/* always write to memory */
> -		break;
> -
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>  /* media operations */
>  static const struct media_entity_operations isp_subdev_media_ops = {
> -	.link_setup = isp_subdev_link_setup,
>  	.link_validate = v4l2_subdev_link_validate,
>  	/*	 .set_power = v4l2_subdev_set_power,	*/
>  };
> @@ -1071,8 +994,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
>  	struct media_entity *me = &sd->entity;
>  	int ret;
>  
> -	asd->input = ATOMISP_SUBDEV_INPUT_NONE;
> -
>  	v4l2_subdev_init(sd, &isp_subdev_v4l2_ops);
>  	sprintf(sd->name, "ATOMISP_SUBDEV_%d", asd->index);
>  	v4l2_set_subdevdata(sd, asd);
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
> index bd2872cbb50c..daa6077a83bd 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
> @@ -30,18 +30,6 @@
>  
>  /* EXP_ID's ranger is 1 ~ 250 */
>  #define ATOMISP_MAX_EXP_ID     (250)
> -enum atomisp_subdev_input_entity {
> -	ATOMISP_SUBDEV_INPUT_NONE,
> -	ATOMISP_SUBDEV_INPUT_MEMORY,
> -	ATOMISP_SUBDEV_INPUT_CSI2,
> -	/*
> -	 * The following enum for CSI2 port must go together in one row.
> -	 * Otherwise it breaks the code logic.
> -	 */
> -	ATOMISP_SUBDEV_INPUT_CSI2_PORT1,
> -	ATOMISP_SUBDEV_INPUT_CSI2_PORT2,
> -	ATOMISP_SUBDEV_INPUT_CSI2_PORT3,
> -};
>  
>  #define ATOMISP_SUBDEV_PAD_SINK			0
>  /* capture output for still frames */
> @@ -267,7 +255,6 @@ struct atomisp_sub_device {
>  	struct atomisp_pad_format fmt[ATOMISP_SUBDEV_PADS_NUM];
>  	u16 capture_pad; /* main capture pad; defines much of isp config */
>  
> -	enum atomisp_subdev_input_entity input;
>  	unsigned int output;
>  	struct atomisp_video_pipe video_out_capture; /* capture output */
>  	struct atomisp_video_pipe video_out_vf;      /* viewfinder output */
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


