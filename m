Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F17197B92
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 14:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730121AbgC3MKL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 08:10:11 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:45561 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729627AbgC3MKK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 08:10:10 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ItEzjGq08Br2bItF2jcWPK; Mon, 30 Mar 2020 14:10:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585570208; bh=68KrAMzueJtAJkbmh5R9KFuQUJylUxuLocgrLyLMn1M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TV0T4XySREn4NLhi2Sh9PEPL5/VxsEJgXW8ME9LJ/6b+DUBlg3tcqO95roGleof2I
         PlDXH2MAKgvtBwXvcL3uovyDehOIs6S1QJjuQ72mx5++TOvCkpIAhdp90P9QeIcou4
         1T8ZOpMK/kQjEYDomnMBLuKOLeOZHmxad6VwDlBx0dgglZViJCQkHDp+gRDxcZ0HIJ
         3TGyZV9gB3c22bwSiq6dRG7esWkkM94E3+dSAsbvueTY06H9SfwbATx9h9aT4agSko
         nI7/XoIflSh6DiDY5dZsnJLXhizFuTIgXC/I/s2EaHhxRFeuxi3hsoIS6hWboow79s
         6Gt1dpgQNb/7g==
Subject: Re: [PATCH 5/5] media: vimc: add vimc_ent_type struct for the
 callbacks of entities
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200328075254.4616-1-dafna.hirschfeld@collabora.com>
 <20200328075254.4616-6-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7992a63b-14bb-d4e6-5c9c-30f1fb779b7b@xs4all.nl>
Date:   Mon, 30 Mar 2020 14:10:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200328075254.4616-6-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKkHy2dxB5TXyatKhpmEdIDUJ5dG4E1JivCD9FYlFLN/+bwcqHn6FGrUDo4RS7P8YesoN/yjv+PIQjdWemWc1ieucUr/4rvOfc3qzBT15HeWZ0e5yOzz
 N9izk1gw/A9K/CCGS//uIfDNrd55zV8nN2zd1yGoY12O1ZSMGTXa0PZLNNoz5UNNBiIwEwhtTv8yqWfcbbclSbAH3hargJm+ZAskAaphaLxl0NQi9nVKikgX
 Jdxls4H5jD02Tlb12TSIqop0UH2ZZl8+ZnZlaHAjPKjPEfuw2/gBIjrS2YgDHFvnBqLJF+ErszI8sxrRwdwATgLSdFA4oUOhWJMtn7Cihs/7wGKyM9pJftP+
 gOfn5oc+2QpPcd1smp0W1tOBROF0lZWGjFjmbcjMQPAOV6mfUk1XUaocw6NnIdumPD7fNqQWnIkEjWptsKVMKV7d/P5SwQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/28/20 8:52 AM, Dafna Hirschfeld wrote:
> Since each vimc entity type is defined by the
> callbacks implementation, it is a good idea to
> add a struct to hold these callbacks.
> 
> Each vimc entity then declare its type in the file for
> the entity.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

I get these warnings:

drivers/media/platform/vimc/vimc-capture.c:328:6: warning: no previous prototype for ‘vimc_cap_release’ [-Wmissing-prototypes]

  328 | void vimc_cap_release(struct vimc_ent_device *ved)
      |      ^~~~~~~~~~~~~~~~
drivers/media/platform/vimc/vimc-capture.c:337:6: warning: no previous prototype for ‘vimc_cap_unregister’ [-Wmissing-prototypes]

  337 | void vimc_cap_unregister(struct vimc_ent_device *ved)
      |      ^~~~~~~~~~~~~~~~~~~
drivers/media/platform/vimc/vimc-capture.c:385:25: warning: no previous prototype for ‘vimc_cap_add’ [-Wmissing-prototypes]

  385 | struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
      |                         ^~~~~~~~~~~~
  CC      drivers/media/platform/vimc/vimc-scaler.o
drivers/media/platform/vimc/vimc-debayer.c:497:6: warning: no previous prototype for ‘vimc_deb_release’ [-Wmissing-prototypes]

  497 | void vimc_deb_release(struct vimc_ent_device *ved)
      |      ^~~~~~~~~~~~~~~~
drivers/media/platform/vimc/vimc-debayer.c:525:25: warning: no previous prototype for ‘vimc_deb_add’ [-Wmissing-prototypes]

  525 | struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
      |                         ^~~~~~~~~~~~
  CC      drivers/media/platform/vimc/vimc-sensor.o
drivers/media/platform/vimc/vimc-scaler.c:467:6: warning: no previous prototype for ‘vimc_sca_release’ [-Wmissing-prototypes]

  467 | void vimc_sca_release(struct vimc_ent_device *ved)
      |      ^~~~~~~~~~~~~~~~
drivers/media/platform/vimc/vimc-scaler.c:476:25: warning: no previous prototype for ‘vimc_sca_add’ [-Wmissing-prototypes]

  476 | struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
      |                         ^~~~~~~~~~~~
drivers/media/platform/vimc/vimc-sensor.c:282:6: warning: no previous prototype for ‘vimc_sen_release’ [-Wmissing-prototypes]

  282 | void vimc_sen_release(struct vimc_ent_device *ved)
      |      ^~~~~~~~~~~~~~~~
drivers/media/platform/vimc/vimc-sensor.c:310:25: warning: no previous prototype for ‘vimc_sen_add’ [-Wmissing-prototypes]

  310 | struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
      |                         ^~~~~~~~~~~~


I think that all these functions should become static.

Regards,

	Hans

> ---
>  drivers/media/platform/vimc/vimc-capture.c |  6 ++++
>  drivers/media/platform/vimc/vimc-common.h  | 42 +++++++++++-----------
>  drivers/media/platform/vimc/vimc-core.c    | 38 +++++++-------------
>  drivers/media/platform/vimc/vimc-debayer.c |  5 +++
>  drivers/media/platform/vimc/vimc-scaler.c  |  5 +++
>  drivers/media/platform/vimc/vimc-sensor.c  |  5 +++
>  6 files changed, 54 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 8bafbf90cbf5..230f024ff896 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -478,3 +478,9 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  
>  	return ERR_PTR(ret);
>  }
> +
> +struct vimc_ent_type vimc_cap_type = {
> +	.add = vimc_cap_add,
> +	.unregister = vimc_cap_unregister,
> +	.release = vimc_cap_release
> +};
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 40a58f1cb18f..b2fa3b793916 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -120,24 +120,35 @@ struct vimc_device {
>  };
>  
>  /**
> - * struct vimc_ent_config	Structure which describes individual
> - *				configuration for each entity
> + * struct vimc_ent_type		Structure for the callbacks of the entity types
> + *
>   *
> - * @name			entity name
>   * @add				initializes and registers
>   *					vimc entity - called from vimc-core
>   * @unregister			unregisters vimc entity - called from vimc-core
>   * @release			releases vimc entity - called from the v4l2_dev
>   *					release callback
>   */
> -struct vimc_ent_config {
> -	const char *name;
> +struct vimc_ent_type {
>  	struct vimc_ent_device *(*add)(struct vimc_device *vimc,
>  				       const char *vcfg_name);
>  	void (*unregister)(struct vimc_ent_device *ved);
>  	void (*release)(struct vimc_ent_device *ved);
>  };
>  
> +/**
> + * struct vimc_ent_config	Structure which describes individual
> + *				configuration for each entity
> + *
> + * @name			entity name
> + * @type			contain the callbacks of this entity type
> + *
> + */
> +struct vimc_ent_config {
> +	const char *name;
> +	struct vimc_ent_type *type;
> +};
> +
>  /**
>   * vimc_is_source - returns true if the entity has only source pads
>   *
> @@ -146,23 +157,10 @@ struct vimc_ent_config {
>   */
>  bool vimc_is_source(struct media_entity *ent);
>  
> -/* prototypes for vimc_ent_config hooks */
> -struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
> -				     const char *vcfg_name);
> -void vimc_cap_unregister(struct vimc_ent_device *ved);
> -void vimc_cap_release(struct vimc_ent_device *ved);
> -
> -struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
> -				     const char *vcfg_name);
> -void vimc_deb_release(struct vimc_ent_device *ved);
> -
> -struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
> -				     const char *vcfg_name);
> -void vimc_sca_release(struct vimc_ent_device *ved);
> -
> -struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
> -				     const char *vcfg_name);
> -void vimc_sen_release(struct vimc_ent_device *ved);
> +extern struct vimc_ent_type vimc_sen_type;
> +extern struct vimc_ent_type vimc_deb_type;
> +extern struct vimc_ent_type vimc_sca_type;
> +extern struct vimc_ent_type vimc_cap_type;
>  
>  /**
>   * vimc_pix_map_by_index - get vimc_pix_map struct by its index
> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
> index edac998f58d5..11210aaa2551 100644
> --- a/drivers/media/platform/vimc/vimc-core.c
> +++ b/drivers/media/platform/vimc/vimc-core.c
> @@ -47,52 +47,40 @@ struct vimc_pipeline_config {
>  static struct vimc_ent_config ent_config[] = {
>  	{
>  		.name = "Sensor A",
> -		.add = vimc_sen_add,
> -		.release = vimc_sen_release,
> +		.type = &vimc_sen_type
>  	},
>  	{
>  		.name = "Sensor B",
> -		.add = vimc_sen_add,
> -		.release = vimc_sen_release,
> +		.type = &vimc_sen_type
>  	},
>  	{
>  		.name = "Debayer A",
> -		.add = vimc_deb_add,
> -		.release = vimc_deb_release,
> +		.type = &vimc_deb_type
>  	},
>  	{
>  		.name = "Debayer B",
> -		.add = vimc_deb_add,
> -		.release = vimc_deb_release,
> +		.type = &vimc_deb_type
>  	},
>  	{
>  		.name = "Raw Capture 0",
> -		.add = vimc_cap_add,
> -		.unregister = vimc_cap_unregister,
> -		.release = vimc_cap_release,
> +		.type = &vimc_cap_type
>  	},
>  	{
>  		.name = "Raw Capture 1",
> -		.add = vimc_cap_add,
> -		.unregister = vimc_cap_unregister,
> -		.release = vimc_cap_release,
> +		.type = &vimc_cap_type
>  	},
>  	{
>  		/* TODO: change this to vimc-input when it is implemented */
>  		.name = "RGB/YUV Input",
> -		.add = vimc_sen_add,
> -		.release = vimc_sen_release,
> +		.type = &vimc_sen_type
>  	},
>  	{
>  		.name = "Scaler",
> -		.add = vimc_sca_add,
> -		.release = vimc_sca_release,
> +		.type = &vimc_sca_type
>  	},
>  	{
>  		.name = "RGB/YUV Capture",
> -		.add = vimc_cap_add,
> -		.unregister = vimc_cap_unregister,
> -		.release = vimc_cap_release,
> +		.type = &vimc_cap_type
>  	},
>  };
>  
> @@ -166,7 +154,7 @@ static void vimc_release_subdevs(struct vimc_device *vimc)
>  
>  	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
>  		if (vimc->ent_devs[i])
> -			vimc->pipe_cfg->ents[i].release(vimc->ent_devs[i]);
> +			vimc->pipe_cfg->ents[i].type->release(vimc->ent_devs[i]);
>  }
>  
>  static void vimc_unregister_subdevs(struct vimc_device *vimc)
> @@ -174,8 +162,8 @@ static void vimc_unregister_subdevs(struct vimc_device *vimc)
>  	unsigned int i;
>  
>  	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
> -		if (vimc->ent_devs[i] && vimc->pipe_cfg->ents[i].unregister)
> -			vimc->pipe_cfg->ents[i].unregister(vimc->ent_devs[i]);
> +		if (vimc->ent_devs[i] && vimc->pipe_cfg->ents[i].type->unregister)
> +			vimc->pipe_cfg->ents[i].type->unregister(vimc->ent_devs[i]);
>  }
>  
>  static int vimc_add_subdevs(struct vimc_device *vimc)
> @@ -185,7 +173,7 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
>  	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
>  		dev_dbg(vimc->mdev.dev, "new entity for %s\n",
>  			vimc->pipe_cfg->ents[i].name);
> -		vimc->ent_devs[i] = vimc->pipe_cfg->ents[i].add(vimc,
> +		vimc->ent_devs[i] = vimc->pipe_cfg->ents[i].type->add(vimc,
>  					vimc->pipe_cfg->ents[i].name);
>  		if (IS_ERR(vimc->ent_devs[i])) {
>  			int err = PTR_ERR(vimc->ent_devs[i]);
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index d591b6a6bcf0..ddaf223ddde5 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -579,3 +579,8 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>  
>  	return ERR_PTR(ret);
>  }
> +
> +struct vimc_ent_type vimc_deb_type = {
> +	.add = vimc_deb_add,
> +	.release = vimc_deb_release
> +};
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index 6ea05dcebc31..c6c31e8ce2e6 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -509,3 +509,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>  
>  	return &vsca->ved;
>  }
> +
> +struct vimc_ent_type vimc_sca_type = {
> +	.add = vimc_sca_add,
> +	.release = vimc_sca_release
> +};
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index 24ce5b70b97e..3adf601e38e2 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -374,3 +374,8 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>  
>  	return ERR_PTR(ret);
>  }
> +
> +struct vimc_ent_type vimc_sen_type = {
> +	.add = vimc_sen_add,
> +	.release = vimc_sen_release
> +};
> 

