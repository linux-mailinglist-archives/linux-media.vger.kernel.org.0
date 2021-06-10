Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CB63A25FF
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 10:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhFJICl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 04:02:41 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:40225 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229914AbhFJICP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 04:02:15 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rFbjl69wThqltrFbmlWr7w; Thu, 10 Jun 2021 10:00:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623312012; bh=ZIDoJvNZoeXGb3aGygO6b6vM2yepdkU1TeYZQ4gNM0A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BbPsJLDOjHjIoWWrc4wEWUpTwk7hoB0j2YPU/uIWH/orgNWuVwxfmrb/gLiP/mm98
         pJiSyOip22EGXYG1XtlbdujTbcdHfO87xr75hCjn9SS0Oxxj+daXG56eGqw2ZdeOGi
         3q/pFD4J4BOFjByNlg5nObK173WoKXb473d+0Z5/eDJU+YbN+d/VC7j8hK7+E3O1QW
         G3A2EM2nfyrsWQdSJG1mcbjtAPzJKbSGDxAA+pww9Tio7nQ4kkFAGXJbtg1H8C643V
         6zKOZFcSX2pUE6xYJ7neyPwZp/kA7UYC9LC9ZFsU2kC7HoGsCRlT2WECFhNfiAKLIf
         iDOh7f95faOvg==
Subject: Re: [PATCH v3 1/1] media: v4l2-subdev: add subdev-wide state struct
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210609100228.278798-1-tomi.valkeinen@ideasonboard.com>
 <20210609100228.278798-2-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7f49880d-6ffc-5e2b-e3f2-adbd695364f3@xs4all.nl>
Date:   Thu, 10 Jun 2021 10:00:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210609100228.278798-2-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKbZwGHWhUpMUhxLu+E7/9MBS6GpOi1SLCdyJDVbWylLJNeGuj0W8vrVvpzeITheZ25/hkJiVb0yJ7kZyIfTmk1ZgQhtATp+fU8fdvj3Uao15e4Vr2GU
 w7G7bmPFCz9mW4UpCM7zB3obsZARgVz1l8jOfCPesbTCDrdpdz6ifcZiogdK7VSUnISkTjGj9b/II26AmcWqGeeXXArWGIdro5mu9IVasmnCjMabJuQnctfr
 ElO3qzwCJMv0YKONYsTWu3GO4iyPoV13uFVRrZ80JSQvjyt7LPXYKm90S0KWt8swGjX3dzQ699TIC8CI1zhyA1QHGDggYu+wqCji8kFN9VMoRbs8vGzxLEQe
 XGDcnpYS+GJPaLWzImN4mjEhSY63QA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

A few small comments:

On 09/06/2021 12:02, Tomi Valkeinen wrote:
> We have 'struct v4l2_subdev_pad_config' which contains configuration for
> a single pad used for the TRY functionality, and an array of those
> structs is passed to various v4l2_subdev_pad_ops.
> 
> I was working on subdev internal routing between pads, and realized that
> there's no way to add TRY functionality for routes, which is not pad
> specific configuration. Adding a separate struct for try-route config
> wouldn't work either, as e.g. set-fmt needs to know the try-route
> configuration to propagate the settings.
> 
> This patch adds a new struct, 'struct v4l2_subdev_state' (which at the
> moment only contains the v4l2_subdev_pad_config array) and the new
> struct is used in most of the places where v4l2_subdev_pad_config was
> used. All v4l2_subdev_pad_ops functions taking v4l2_subdev_pad_config
> are changed to instead take v4l2_subdev_state.
> 
> The changes to drivers/media/v4l2-core/v4l2-subdev.c and
> include/media/v4l2-subdev.h were written by hand, and all the driver
> changes were done with the semantic patch below. The spatch needs to be
> applied to a select list of directories. I used the following shell
> commands to apply the spatch:

<snip>

> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 956dafab43d4..dacae53b68d5 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -26,19 +26,21 @@
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>  {
> -	if (sd->entity.num_pads) {
> -		fh->pad = v4l2_subdev_alloc_pad_config(sd);
> -		if (fh->pad == NULL)
> -			return -ENOMEM;
> -	}
> +	struct v4l2_subdev_state *state;
> +
> +	state = v4l2_subdev_alloc_state(sd);
> +	if (IS_ERR(state))
> +		return PTR_ERR(state);
> +
> +	fh->state = state;
>  
>  	return 0;
>  }
>  
>  static void subdev_fh_free(struct v4l2_subdev_fh *fh)
>  {
> -	v4l2_subdev_free_pad_config(fh->pad);
> -	fh->pad = NULL;
> +	v4l2_subdev_free_state(fh->state);
> +	fh->state = NULL;
>  }
>  
>  static int subdev_open(struct file *file)
> @@ -146,63 +148,63 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
>  	return 0;
>  }
>  
> -static int check_cfg(u32 which, struct v4l2_subdev_pad_config *cfg)
> +static int check_cfg(u32 which, struct v4l2_subdev_state *state)

This should be renamed to check_state or check_state_pads (see next comment).

>  {
> -	if (which == V4L2_SUBDEV_FORMAT_TRY && !cfg)
> +	if (which == V4L2_SUBDEV_FORMAT_TRY && !state)

Should this also check for !state->pads? At least in the current code
it really checks for the pad configuration, so I think it should.

If so, then this function should probably be renamed to check_state_pads.

>  		return -EINVAL;
>  
>  	return 0;
>  }
>  
>  static inline int check_format(struct v4l2_subdev *sd,
> -			       struct v4l2_subdev_pad_config *cfg,
> +			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_format *format)
>  {
>  	if (!format)
>  		return -EINVAL;
>  
>  	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
> -	       check_cfg(format->which, cfg);
> +	       check_cfg(format->which, state);
>  }
>  
>  static int call_get_fmt(struct v4l2_subdev *sd,
> -			struct v4l2_subdev_pad_config *cfg,
> +			struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
> -	return check_format(sd, cfg, format) ? :
> -	       sd->ops->pad->get_fmt(sd, cfg, format);
> +	return check_format(sd, state, format) ? :
> +	       sd->ops->pad->get_fmt(sd, state, format);
>  }
>  
>  static int call_set_fmt(struct v4l2_subdev *sd,
> -			struct v4l2_subdev_pad_config *cfg,
> +			struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
> -	return check_format(sd, cfg, format) ? :
> -	       sd->ops->pad->set_fmt(sd, cfg, format);
> +	return check_format(sd, state, format) ? :
> +	       sd->ops->pad->set_fmt(sd, state, format);
>  }
>  
>  static int call_enum_mbus_code(struct v4l2_subdev *sd,
> -			       struct v4l2_subdev_pad_config *cfg,
> +			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	if (!code)
>  		return -EINVAL;
>  
>  	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
> -	       check_cfg(code->which, cfg) ? :
> -	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
> +	       check_cfg(code->which, state) ? :
> +	       sd->ops->pad->enum_mbus_code(sd, state, code);
>  }
>  
>  static int call_enum_frame_size(struct v4l2_subdev *sd,
> -				struct v4l2_subdev_pad_config *cfg,
> +				struct v4l2_subdev_state *state,
>  				struct v4l2_subdev_frame_size_enum *fse)
>  {
>  	if (!fse)
>  		return -EINVAL;
>  
>  	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
> -	       check_cfg(fse->which, cfg) ? :
> -	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
> +	       check_cfg(fse->which, state) ? :
> +	       sd->ops->pad->enum_frame_size(sd, state, fse);
>  }
>  
>  static inline int check_frame_interval(struct v4l2_subdev *sd,
> @@ -229,42 +231,42 @@ static int call_s_frame_interval(struct v4l2_subdev *sd,
>  }
>  
>  static int call_enum_frame_interval(struct v4l2_subdev *sd,
> -				    struct v4l2_subdev_pad_config *cfg,
> +				    struct v4l2_subdev_state *state,
>  				    struct v4l2_subdev_frame_interval_enum *fie)
>  {
>  	if (!fie)
>  		return -EINVAL;
>  
>  	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
> -	       check_cfg(fie->which, cfg) ? :
> -	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
> +	       check_cfg(fie->which, state) ? :
> +	       sd->ops->pad->enum_frame_interval(sd, state, fie);
>  }
>  
>  static inline int check_selection(struct v4l2_subdev *sd,
> -				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_state *state,
>  				  struct v4l2_subdev_selection *sel)
>  {
>  	if (!sel)
>  		return -EINVAL;
>  
>  	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
> -	       check_cfg(sel->which, cfg);
> +	       check_cfg(sel->which, state);
>  }
>  
>  static int call_get_selection(struct v4l2_subdev *sd,
> -			      struct v4l2_subdev_pad_config *cfg,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_selection *sel)
>  {
> -	return check_selection(sd, cfg, sel) ? :
> -	       sd->ops->pad->get_selection(sd, cfg, sel);
> +	return check_selection(sd, state, sel) ? :
> +	       sd->ops->pad->get_selection(sd, state, sel);
>  }
>  
>  static int call_set_selection(struct v4l2_subdev *sd,
> -			      struct v4l2_subdev_pad_config *cfg,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_selection *sel)
>  {
> -	return check_selection(sd, cfg, sel) ? :
> -	       sd->ops->pad->set_selection(sd, cfg, sel);
> +	return check_selection(sd, state, sel) ? :
> +	       sd->ops->pad->set_selection(sd, state, sel);
>  }
>  
>  static inline int check_edid(struct v4l2_subdev *sd,
> @@ -506,7 +508,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> -		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
> +		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->state, format);
>  	}
>  
>  	case VIDIOC_SUBDEV_S_FMT: {
> @@ -517,7 +519,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> -		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
> +		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->state, format);
>  	}
>  
>  	case VIDIOC_SUBDEV_G_CROP: {
> @@ -531,7 +533,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		sel.target = V4L2_SEL_TGT_CROP;
>  
>  		rval = v4l2_subdev_call(
> -			sd, pad, get_selection, subdev_fh->pad, &sel);
> +			sd, pad, get_selection, subdev_fh->state, &sel);
>  
>  		crop->rect = sel.r;
>  
> @@ -553,7 +555,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		sel.r = crop->rect;
>  
>  		rval = v4l2_subdev_call(
> -			sd, pad, set_selection, subdev_fh->pad, &sel);
> +			sd, pad, set_selection, subdev_fh->state, &sel);
>  
>  		crop->rect = sel.r;
>  
> @@ -564,7 +566,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_mbus_code_enum *code = arg;
>  
>  		memset(code->reserved, 0, sizeof(code->reserved));
> -		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->pad,
> +		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->state,
>  					code);
>  	}
>  
> @@ -572,7 +574,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_frame_size_enum *fse = arg;
>  
>  		memset(fse->reserved, 0, sizeof(fse->reserved));
> -		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->pad,
> +		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->state,
>  					fse);
>  	}
>  
> @@ -597,7 +599,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_frame_interval_enum *fie = arg;
>  
>  		memset(fie->reserved, 0, sizeof(fie->reserved));
> -		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->pad,
> +		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->state,
>  					fie);
>  	}
>  
> @@ -606,7 +608,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		memset(sel->reserved, 0, sizeof(sel->reserved));
>  		return v4l2_subdev_call(
> -			sd, pad, get_selection, subdev_fh->pad, sel);
> +			sd, pad, get_selection, subdev_fh->state, sel);
>  	}
>  
>  	case VIDIOC_SUBDEV_S_SELECTION: {
> @@ -617,7 +619,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		memset(sel->reserved, 0, sizeof(sel->reserved));
>  		return v4l2_subdev_call(
> -			sd, pad, set_selection, subdev_fh->pad, sel);
> +			sd, pad, set_selection, subdev_fh->state, sel);
>  	}
>  
>  	case VIDIOC_G_EDID: {
> @@ -892,35 +894,48 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>  
> -struct v4l2_subdev_pad_config *
> -v4l2_subdev_alloc_pad_config(struct v4l2_subdev *sd)
> +struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
>  {
> -	struct v4l2_subdev_pad_config *cfg;
> +	struct v4l2_subdev_state *state;
>  	int ret;
>  
> -	if (!sd->entity.num_pads)
> -		return NULL;
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return ERR_PTR(-ENOMEM);
>  
> -	cfg = kvmalloc_array(sd->entity.num_pads, sizeof(*cfg),
> -			     GFP_KERNEL | __GFP_ZERO);
> -	if (!cfg)
> -		return NULL;
> -
> -	ret = v4l2_subdev_call(sd, pad, init_cfg, cfg);
> -	if (ret < 0 && ret != -ENOIOCTLCMD) {
> -		kvfree(cfg);
> -		return NULL;
> +	if (sd->entity.num_pads) {
> +		state->pads = kvmalloc_array(sd->entity.num_pads,
> +					     sizeof(*state->pads),
> +					     GFP_KERNEL | __GFP_ZERO);
> +		if (!state->pads) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
>  	}
>  
> -	return cfg;
> +	ret = v4l2_subdev_call(sd, pad, init_cfg, state);

The init_cfg callback should also be renamed to init_state, but this can
be done in a second patch.

> +	if (ret < 0 && ret != -ENOIOCTLCMD)
> +		goto err;
> +
> +	return state;
> +
> +err:
> +	if (state && state->pads)
> +		kvfree(state->pads);
> +
> +	kfree(state);
> +
> +	return ERR_PTR(ret);
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_pad_config);
> +EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
>  
> -void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg)
> +void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
>  {
> -	kvfree(cfg);
> +	kvfree(state->pads);

I'd change this to:

	if (state)
		kvfree(state->pads);

That way you can call v4l2_subdev_free_state() with a NULL pointer. It's more robust.

> +	kfree(state);
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_free_pad_config);
> +EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
>  void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)

<snip>

> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d0e9a5bdb08b..89115ba4c0f2 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -623,6 +623,19 @@ struct v4l2_subdev_pad_config {

I wonder if v4l2_subdev_pad_config shouldn't be renamed to v4l2_subdev_pad_state
or would v4l2_subdev_state_pad. It's more consistent with the 'state' terminology.

This too can be done in a separate patch.

I like the 'state' term much better than 'config'.

Regards,

	Hans

>  	struct v4l2_rect try_compose;
>  };
>  
> +/**
> + * struct v4l2_subdev_state - Used for storing subdev state information.
> + *
> + * @pads: &struct v4l2_subdev_pad_config array
> + *
> + * This structure only needs to be passed to the pad op if the 'which' field
> + * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
> + * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
> + */
> +struct v4l2_subdev_state {
> +	struct v4l2_subdev_pad_config *pads;
> +};
> +
>  /**
>   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
>   *
> @@ -687,27 +700,27 @@ struct v4l2_subdev_pad_config {
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,
> -			struct v4l2_subdev_pad_config *cfg);
> +			struct v4l2_subdev_state *state);
>  	int (*enum_mbus_code)(struct v4l2_subdev *sd,
> -			      struct v4l2_subdev_pad_config *cfg,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_mbus_code_enum *code);
>  	int (*enum_frame_size)(struct v4l2_subdev *sd,
> -			       struct v4l2_subdev_pad_config *cfg,
> +			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_frame_size_enum *fse);
>  	int (*enum_frame_interval)(struct v4l2_subdev *sd,
> -				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_state *state,
>  				   struct v4l2_subdev_frame_interval_enum *fie);
>  	int (*get_fmt)(struct v4l2_subdev *sd,
> -		       struct v4l2_subdev_pad_config *cfg,
> +		       struct v4l2_subdev_state *state,
>  		       struct v4l2_subdev_format *format);
>  	int (*set_fmt)(struct v4l2_subdev *sd,
> -		       struct v4l2_subdev_pad_config *cfg,
> +		       struct v4l2_subdev_state *state,
>  		       struct v4l2_subdev_format *format);
>  	int (*get_selection)(struct v4l2_subdev *sd,
> -			     struct v4l2_subdev_pad_config *cfg,
> +			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_selection *sel);
>  	int (*set_selection)(struct v4l2_subdev *sd,
> -			     struct v4l2_subdev_pad_config *cfg,
> +			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_selection *sel);
>  	int (*get_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
>  	int (*set_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
> @@ -918,14 +931,14 @@ struct v4l2_subdev {
>   * struct v4l2_subdev_fh - Used for storing subdev information per file handle
>   *
>   * @vfh: pointer to &struct v4l2_fh
> - * @pad: pointer to &struct v4l2_subdev_pad_config
> + * @state: pointer to &struct v4l2_subdev_state
>   * @owner: module pointer to the owner of this file handle
>   */
>  struct v4l2_subdev_fh {
>  	struct v4l2_fh vfh;
>  	struct module *owner;
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> -	struct v4l2_subdev_pad_config *pad;
> +	struct v4l2_subdev_state *state;
>  #endif
>  };
>  
> @@ -945,17 +958,17 @@ struct v4l2_subdev_fh {
>   *	&struct v4l2_subdev_pad_config->try_fmt
>   *
>   * @sd: pointer to &struct v4l2_subdev
> - * @cfg: pointer to &struct v4l2_subdev_pad_config array.
> - * @pad: index of the pad in the @cfg array.
> + * @state: pointer to &struct v4l2_subdev_state
> + * @pad: index of the pad in the &struct v4l2_subdev_state->pads array
>   */
>  static inline struct v4l2_mbus_framefmt *
>  v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
> -			   struct v4l2_subdev_pad_config *cfg,
> +			   struct v4l2_subdev_state *state,
>  			   unsigned int pad)
>  {
>  	if (WARN_ON(pad >= sd->entity.num_pads))
>  		pad = 0;
> -	return &cfg[pad].try_fmt;
> +	return &state->pads[pad].try_fmt;
>  }
>  
>  /**
> @@ -963,17 +976,17 @@ v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
>   *	&struct v4l2_subdev_pad_config->try_crop
>   *
>   * @sd: pointer to &struct v4l2_subdev
> - * @cfg: pointer to &struct v4l2_subdev_pad_config array.
> - * @pad: index of the pad in the @cfg array.
> + * @state: pointer to &struct v4l2_subdev_state.
> + * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
>   */
>  static inline struct v4l2_rect *
>  v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
> -			 struct v4l2_subdev_pad_config *cfg,
> +			 struct v4l2_subdev_state *state,
>  			 unsigned int pad)
>  {
>  	if (WARN_ON(pad >= sd->entity.num_pads))
>  		pad = 0;
> -	return &cfg[pad].try_crop;
> +	return &state->pads[pad].try_crop;
>  }
>  
>  /**
> @@ -981,17 +994,17 @@ v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
>   *	&struct v4l2_subdev_pad_config->try_compose
>   *
>   * @sd: pointer to &struct v4l2_subdev
> - * @cfg: pointer to &struct v4l2_subdev_pad_config array.
> - * @pad: index of the pad in the @cfg array.
> + * @state: pointer to &struct v4l2_subdev_state.
> + * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
>   */
>  static inline struct v4l2_rect *
>  v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
> -			    struct v4l2_subdev_pad_config *cfg,
> +			    struct v4l2_subdev_state *state,
>  			    unsigned int pad)
>  {
>  	if (WARN_ON(pad >= sd->entity.num_pads))
>  		pad = 0;
> -	return &cfg[pad].try_compose;
> +	return &state->pads[pad].try_compose;
>  }
>  
>  #endif
> @@ -1093,20 +1106,21 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>  int v4l2_subdev_link_validate(struct media_link *link);
>  
>  /**
> - * v4l2_subdev_alloc_pad_config - Allocates memory for pad config
> + * v4l2_subdev_alloc_state - allocate v4l2_subdev_state
>   *
> - * @sd: pointer to struct v4l2_subdev
> + * @sd: pointer to &struct v4l2_subdev for which the state is being allocated.
> + *
> + * Must call v4l2_subdev_free_state() when state is no longer needed.
>   */
> -struct
> -v4l2_subdev_pad_config *v4l2_subdev_alloc_pad_config(struct v4l2_subdev *sd);
> +struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
>  
>  /**
> - * v4l2_subdev_free_pad_config - Frees memory allocated by
> - *	v4l2_subdev_alloc_pad_config().
> + * v4l2_subdev_free_state - free a v4l2_subdev_state
>   *
> - * @cfg: pointer to &struct v4l2_subdev_pad_config
> + * @state: v4l2_subdev_state to be freed.
>   */
> -void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg);
> +void v4l2_subdev_free_state(struct v4l2_subdev_state *state);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
>  /**
> 

