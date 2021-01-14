Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3679C2F5FBD
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 12:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbhANLUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 06:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbhANLUY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 06:20:24 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AD4C061574
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 03:19:38 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id l9so1875555ejx.3
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 03:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HdfVogXQtkge6tGHjk8KDPwnNWSvTgrgH0MqI5UgY6M=;
        b=bn8RYQ3msZXoSdPwEi6X8N+qe2DiOComPcUIeqXPcYHG+/oHqYBrI1clEc6dGmnkDP
         yGLeSyeINhvWf/rIOZV0BCYFwcJyvWd4AdVlY85Fta9a0LtLQIcdePdiIhQhKPwpbizV
         02oNEbhXqJp0z6iqhD1lseMO8fdJXI1lGnwgeBR1G36FHOaH2Tp524U2XNHW1aVPIFT/
         AGUTP2piKVENYulbAhv/RaFED86ZYlAmcYt0YZTXx9o8TYOr+ox4SgyMgX34uCV3SOqq
         zfwe9wNsQDLYtF42QBYIgox6lakgRHMvOko57Brtq7lGoc9dF1mpXgZBesPiZ7HiaDux
         1WEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HdfVogXQtkge6tGHjk8KDPwnNWSvTgrgH0MqI5UgY6M=;
        b=teTgN0M/I50twEZsnmZ9bYoUQ3S6kv/qU9B7dmUfkQ/IuWWl8Gbter6ueyerBHf4Nv
         CbVAteLv43VzbCswho38/AtjGJZDgoIPsOsQxT5n5GrCogYyF0ia5QIQOHAOCAsopdWq
         KKgZTfjSuGJEkzwaWhYY5cyHdQlyyIL+9cWX6L3fhNgEP1vN1NwP8tlkKjDjj3p92BuL
         LtmSggTPdZ4sIfW8wmyMjFRc+0BCP6wb5VE8gkP8F7Yo3TmViB186x1L7sOswY/yRa4X
         xMJ67A/N7kguEKEE1wCBO8pgCA/xEMZ2P0SLmiZluLjFWQdNHGznDWNm9Pe5OYgjh+zy
         sDBw==
X-Gm-Message-State: AOAM532tqxwV9HsihDJLalwhyYQxPlrT/1JCT0ipjrGDQGLOhwGrd3gm
        vgFAYuFw/xHClavhxhRawsY=
X-Google-Smtp-Source: ABdhPJyVwPj18qiTQJY4ZY0o/vKU9ktZ3M2EdM3CiYdeXALRCY4OsxT/QPEinNSRELJ0OPTkdujRoQ==
X-Received: by 2002:a17:906:af15:: with SMTP id lx21mr4176957ejb.6.1610623177256;
        Thu, 14 Jan 2021 03:19:37 -0800 (PST)
Received: from kontron.lan (2001-1ae9-1e8-b200-9c26-b1f7-3f54-fb94.ip6.tmcz.cz. [2001:1ae9:1e8:b200:9c26:b1f7:3f54:fb94])
        by smtp.gmail.com with ESMTPSA id hr3sm614752ejc.41.2021.01.14.03.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 03:19:36 -0800 (PST)
Subject: Re: [PATCH v2 6/6] media: Remove the legacy v4l2-clk API
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
References: <20210112194919.50176-1-ezequiel@collabora.com>
 <20210112194919.50176-7-ezequiel@collabora.com>
From:   Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <b4faf191-2ac6-3786-a512-1ef5f2cba950@gmail.com>
Date:   Thu, 14 Jan 2021 12:23:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210112194919.50176-7-ezequiel@collabora.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: cs
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Acked-by: Petr Cvek <petrcvekcz@gmail.com>

Dne 12. 01. 21 v 20:49 Ezequiel Garcia napsal(a):
> The V4L2 temporary clock helper API, was introduced
> in late 2012 and, as mentioned in the documentation,
> meant to be replaced by the generic clock API,
> once the generic clock framework became available
> on all relevant architectures.
> 
> The generic clock API is a well-established API (since a few
> years now). The last few media capture drivers and sensors
> using v4l2-clk have been converted to the generic clock framework.
> 
> We can now remove the v4l2-clk API.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../driver-api/media/v4l2-clocks.rst          |  31 --
>  Documentation/driver-api/media/v4l2-core.rst  |   1 -
>  drivers/media/v4l2-core/Makefile              |   2 +-
>  drivers/media/v4l2-core/v4l2-clk.c            | 321 ------------------
>  include/media/v4l2-clk.h                      |  73 ----
>  5 files changed, 1 insertion(+), 427 deletions(-)
>  delete mode 100644 Documentation/driver-api/media/v4l2-clocks.rst
>  delete mode 100644 drivers/media/v4l2-core/v4l2-clk.c
>  delete mode 100644 include/media/v4l2-clk.h
> 
> diff --git a/Documentation/driver-api/media/v4l2-clocks.rst b/Documentation/driver-api/media/v4l2-clocks.rst
> deleted file mode 100644
> index 5c22eecab7ba..000000000000
> --- a/Documentation/driver-api/media/v4l2-clocks.rst
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -.. SPDX-License-Identifier: GPL-2.0
> -
> -V4L2 clocks
> ------------
> -
> -.. attention::
> -
> -	This is a temporary API and it shall be replaced by the generic
> -	clock API, when the latter becomes widely available.
> -
> -Many subdevices, like camera sensors, TV decoders and encoders, need a clock
> -signal to be supplied by the system. Often this clock is supplied by the
> -respective bridge device. The Linux kernel provides a Common Clock Framework for
> -this purpose. However, it is not (yet) available on all architectures. Besides,
> -the nature of the multi-functional (clock, data + synchronisation, I2C control)
> -connection of subdevices to the system might impose special requirements on the
> -clock API usage. E.g. V4L2 has to support clock provider driver unregistration
> -while a subdevice driver is holding a reference to the clock. For these reasons
> -a V4L2 clock helper API has been developed and is provided to bridge and
> -subdevice drivers.
> -
> -The API consists of two parts: two functions to register and unregister a V4L2
> -clock source: v4l2_clk_register() and v4l2_clk_unregister() and calls to control
> -a clock object, similar to the respective generic clock API calls:
> -v4l2_clk_get(), v4l2_clk_put(), v4l2_clk_enable(), v4l2_clk_disable(),
> -v4l2_clk_get_rate(), and v4l2_clk_set_rate(). Clock suppliers have to provide
> -clock operations that will be called when clock users invoke respective API
> -methods.
> -
> -It is expected that once the CCF becomes available on all relevant
> -architectures this API will be removed.
> diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
> index 0dcad7a23141..1a8c4a5f256b 100644
> --- a/Documentation/driver-api/media/v4l2-core.rst
> +++ b/Documentation/driver-api/media/v4l2-core.rst
> @@ -15,7 +15,6 @@ Video4Linux devices
>      v4l2-controls
>      v4l2-videobuf
>      v4l2-videobuf2
> -    v4l2-clocks
>      v4l2-dv-timings
>      v4l2-flash-led-class
>      v4l2-mc
> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> index 2ef0c7c958a2..e4cd589b99a5 100644
> --- a/drivers/media/v4l2-core/Makefile
> +++ b/drivers/media/v4l2-core/Makefile
> @@ -6,7 +6,7 @@
>  tuner-objs	:=	tuner-core.o
>  
>  videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
> -			v4l2-event.o v4l2-ctrls.o v4l2-subdev.o v4l2-clk.o \
> +			v4l2-event.o v4l2-ctrls.o v4l2-subdev.o \
>  			v4l2-async.o v4l2-common.o
>  videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
>  videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
> diff --git a/drivers/media/v4l2-core/v4l2-clk.c b/drivers/media/v4l2-core/v4l2-clk.c
> deleted file mode 100644
> index 91274eee6977..000000000000
> --- a/drivers/media/v4l2-core/v4l2-clk.c
> +++ /dev/null
> @@ -1,321 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * V4L2 clock service
> - *
> - * Copyright (C) 2012-2013, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> - */
> -
> -#include <linux/atomic.h>
> -#include <linux/clk.h>
> -#include <linux/device.h>
> -#include <linux/errno.h>
> -#include <linux/list.h>
> -#include <linux/module.h>
> -#include <linux/mutex.h>
> -#include <linux/of.h>
> -#include <linux/slab.h>
> -#include <linux/string.h>
> -
> -#include <media/v4l2-clk.h>
> -#include <media/v4l2-subdev.h>
> -
> -static DEFINE_MUTEX(clk_lock);
> -static LIST_HEAD(clk_list);
> -
> -static struct v4l2_clk *v4l2_clk_find(const char *dev_id)
> -{
> -	struct v4l2_clk *clk;
> -
> -	list_for_each_entry(clk, &clk_list, list)
> -		if (!strcmp(dev_id, clk->dev_id))
> -			return clk;
> -
> -	return ERR_PTR(-ENODEV);
> -}
> -
> -struct v4l2_clk *v4l2_clk_get(struct device *dev, const char *id)
> -{
> -	struct v4l2_clk *clk;
> -	struct clk *ccf_clk = clk_get(dev, id);
> -	char clk_name[V4L2_CLK_NAME_SIZE];
> -
> -	if (PTR_ERR(ccf_clk) == -EPROBE_DEFER)
> -		return ERR_PTR(-EPROBE_DEFER);
> -
> -	if (!IS_ERR_OR_NULL(ccf_clk)) {
> -		clk = kzalloc(sizeof(*clk), GFP_KERNEL);
> -		if (!clk) {
> -			clk_put(ccf_clk);
> -			return ERR_PTR(-ENOMEM);
> -		}
> -		clk->clk = ccf_clk;
> -
> -		return clk;
> -	}
> -
> -	mutex_lock(&clk_lock);
> -	clk = v4l2_clk_find(dev_name(dev));
> -
> -	/* if dev_name is not found, try use the OF name to find again  */
> -	if (PTR_ERR(clk) == -ENODEV && dev->of_node) {
> -		v4l2_clk_name_of(clk_name, sizeof(clk_name), dev->of_node);
> -		clk = v4l2_clk_find(clk_name);
> -	}
> -
> -	if (!IS_ERR(clk))
> -		atomic_inc(&clk->use_count);
> -	mutex_unlock(&clk_lock);
> -
> -	return clk;
> -}
> -EXPORT_SYMBOL(v4l2_clk_get);
> -
> -void v4l2_clk_put(struct v4l2_clk *clk)
> -{
> -	struct v4l2_clk *tmp;
> -
> -	if (IS_ERR(clk))
> -		return;
> -
> -	if (clk->clk) {
> -		clk_put(clk->clk);
> -		kfree(clk);
> -		return;
> -	}
> -
> -	mutex_lock(&clk_lock);
> -
> -	list_for_each_entry(tmp, &clk_list, list)
> -		if (tmp == clk)
> -			atomic_dec(&clk->use_count);
> -
> -	mutex_unlock(&clk_lock);
> -}
> -EXPORT_SYMBOL(v4l2_clk_put);
> -
> -static int v4l2_clk_lock_driver(struct v4l2_clk *clk)
> -{
> -	struct v4l2_clk *tmp;
> -	int ret = -ENODEV;
> -
> -	mutex_lock(&clk_lock);
> -
> -	list_for_each_entry(tmp, &clk_list, list)
> -		if (tmp == clk) {
> -			ret = !try_module_get(clk->ops->owner);
> -			if (ret)
> -				ret = -EFAULT;
> -			break;
> -		}
> -
> -	mutex_unlock(&clk_lock);
> -
> -	return ret;
> -}
> -
> -static void v4l2_clk_unlock_driver(struct v4l2_clk *clk)
> -{
> -	module_put(clk->ops->owner);
> -}
> -
> -int v4l2_clk_enable(struct v4l2_clk *clk)
> -{
> -	int ret;
> -
> -	if (clk->clk)
> -		return clk_prepare_enable(clk->clk);
> -
> -	ret = v4l2_clk_lock_driver(clk);
> -	if (ret < 0)
> -		return ret;
> -
> -	mutex_lock(&clk->lock);
> -
> -	if (++clk->enable == 1 && clk->ops->enable) {
> -		ret = clk->ops->enable(clk);
> -		if (ret < 0)
> -			clk->enable--;
> -	}
> -
> -	mutex_unlock(&clk->lock);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(v4l2_clk_enable);
> -
> -/*
> - * You might Oops if you try to disabled a disabled clock, because then the
> - * driver isn't locked and could have been unloaded by now, so, don't do that
> - */
> -void v4l2_clk_disable(struct v4l2_clk *clk)
> -{
> -	int enable;
> -
> -	if (clk->clk)
> -		return clk_disable_unprepare(clk->clk);
> -
> -	mutex_lock(&clk->lock);
> -
> -	enable = --clk->enable;
> -	if (WARN(enable < 0, "Unbalanced %s() on %s!\n", __func__,
> -		 clk->dev_id))
> -		clk->enable++;
> -	else if (!enable && clk->ops->disable)
> -		clk->ops->disable(clk);
> -
> -	mutex_unlock(&clk->lock);
> -
> -	v4l2_clk_unlock_driver(clk);
> -}
> -EXPORT_SYMBOL(v4l2_clk_disable);
> -
> -unsigned long v4l2_clk_get_rate(struct v4l2_clk *clk)
> -{
> -	int ret;
> -
> -	if (clk->clk)
> -		return clk_get_rate(clk->clk);
> -
> -	ret = v4l2_clk_lock_driver(clk);
> -	if (ret < 0)
> -		return ret;
> -
> -	mutex_lock(&clk->lock);
> -	if (!clk->ops->get_rate)
> -		ret = -ENOSYS;
> -	else
> -		ret = clk->ops->get_rate(clk);
> -	mutex_unlock(&clk->lock);
> -
> -	v4l2_clk_unlock_driver(clk);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(v4l2_clk_get_rate);
> -
> -int v4l2_clk_set_rate(struct v4l2_clk *clk, unsigned long rate)
> -{
> -	int ret;
> -
> -	if (clk->clk) {
> -		long r = clk_round_rate(clk->clk, rate);
> -		if (r < 0)
> -			return r;
> -		return clk_set_rate(clk->clk, r);
> -	}
> -
> -	ret = v4l2_clk_lock_driver(clk);
> -
> -	if (ret < 0)
> -		return ret;
> -
> -	mutex_lock(&clk->lock);
> -	if (!clk->ops->set_rate)
> -		ret = -ENOSYS;
> -	else
> -		ret = clk->ops->set_rate(clk, rate);
> -	mutex_unlock(&clk->lock);
> -
> -	v4l2_clk_unlock_driver(clk);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(v4l2_clk_set_rate);
> -
> -struct v4l2_clk *v4l2_clk_register(const struct v4l2_clk_ops *ops,
> -				   const char *dev_id,
> -				   void *priv)
> -{
> -	struct v4l2_clk *clk;
> -	int ret;
> -
> -	if (!ops || !dev_id)
> -		return ERR_PTR(-EINVAL);
> -
> -	clk = kzalloc(sizeof(struct v4l2_clk), GFP_KERNEL);
> -	if (!clk)
> -		return ERR_PTR(-ENOMEM);
> -
> -	clk->dev_id = kstrdup(dev_id, GFP_KERNEL);
> -	if (!clk->dev_id) {
> -		ret = -ENOMEM;
> -		goto ealloc;
> -	}
> -	clk->ops = ops;
> -	clk->priv = priv;
> -	atomic_set(&clk->use_count, 0);
> -	mutex_init(&clk->lock);
> -
> -	mutex_lock(&clk_lock);
> -	if (!IS_ERR(v4l2_clk_find(dev_id))) {
> -		mutex_unlock(&clk_lock);
> -		ret = -EEXIST;
> -		goto eexist;
> -	}
> -	list_add_tail(&clk->list, &clk_list);
> -	mutex_unlock(&clk_lock);
> -
> -	return clk;
> -
> -eexist:
> -ealloc:
> -	kfree(clk->dev_id);
> -	kfree(clk);
> -	return ERR_PTR(ret);
> -}
> -EXPORT_SYMBOL(v4l2_clk_register);
> -
> -void v4l2_clk_unregister(struct v4l2_clk *clk)
> -{
> -	if (WARN(atomic_read(&clk->use_count),
> -		 "%s(): Refusing to unregister ref-counted %s clock!\n",
> -		 __func__, clk->dev_id))
> -		return;
> -
> -	mutex_lock(&clk_lock);
> -	list_del(&clk->list);
> -	mutex_unlock(&clk_lock);
> -
> -	kfree(clk->dev_id);
> -	kfree(clk);
> -}
> -EXPORT_SYMBOL(v4l2_clk_unregister);
> -
> -struct v4l2_clk_fixed {
> -	unsigned long rate;
> -	struct v4l2_clk_ops ops;
> -};
> -
> -static unsigned long fixed_get_rate(struct v4l2_clk *clk)
> -{
> -	struct v4l2_clk_fixed *priv = clk->priv;
> -	return priv->rate;
> -}
> -
> -struct v4l2_clk *__v4l2_clk_register_fixed(const char *dev_id,
> -				unsigned long rate, struct module *owner)
> -{
> -	struct v4l2_clk *clk;
> -	struct v4l2_clk_fixed *priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> -
> -	if (!priv)
> -		return ERR_PTR(-ENOMEM);
> -
> -	priv->rate = rate;
> -	priv->ops.get_rate = fixed_get_rate;
> -	priv->ops.owner = owner;
> -
> -	clk = v4l2_clk_register(&priv->ops, dev_id, priv);
> -	if (IS_ERR(clk))
> -		kfree(priv);
> -
> -	return clk;
> -}
> -EXPORT_SYMBOL(__v4l2_clk_register_fixed);
> -
> -void v4l2_clk_unregister_fixed(struct v4l2_clk *clk)
> -{
> -	kfree(clk->priv);
> -	v4l2_clk_unregister(clk);
> -}
> -EXPORT_SYMBOL(v4l2_clk_unregister_fixed);
> diff --git a/include/media/v4l2-clk.h b/include/media/v4l2-clk.h
> deleted file mode 100644
> index d9d21a43a834..000000000000
> --- a/include/media/v4l2-clk.h
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * V4L2 clock service
> - *
> - * Copyright (C) 2012-2013, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> - *
> - * ATTENTION: This is a temporary API and it shall be replaced by the generic
> - * clock API, when the latter becomes widely available.
> - */
> -
> -#ifndef MEDIA_V4L2_CLK_H
> -#define MEDIA_V4L2_CLK_H
> -
> -#include <linux/atomic.h>
> -#include <linux/export.h>
> -#include <linux/list.h>
> -#include <linux/mutex.h>
> -
> -struct module;
> -struct device;
> -
> -struct clk;
> -struct v4l2_clk {
> -	struct list_head list;
> -	const struct v4l2_clk_ops *ops;
> -	const char *dev_id;
> -	int enable;
> -	struct mutex lock; /* Protect the enable count */
> -	atomic_t use_count;
> -	struct clk *clk;
> -	void *priv;
> -};
> -
> -struct v4l2_clk_ops {
> -	struct module	*owner;
> -	int		(*enable)(struct v4l2_clk *clk);
> -	void		(*disable)(struct v4l2_clk *clk);
> -	unsigned long	(*get_rate)(struct v4l2_clk *clk);
> -	int		(*set_rate)(struct v4l2_clk *clk, unsigned long);
> -};
> -
> -struct v4l2_clk *v4l2_clk_register(const struct v4l2_clk_ops *ops,
> -				   const char *dev_name,
> -				   void *priv);
> -void v4l2_clk_unregister(struct v4l2_clk *clk);
> -struct v4l2_clk *v4l2_clk_get(struct device *dev, const char *id);
> -void v4l2_clk_put(struct v4l2_clk *clk);
> -int v4l2_clk_enable(struct v4l2_clk *clk);
> -void v4l2_clk_disable(struct v4l2_clk *clk);
> -unsigned long v4l2_clk_get_rate(struct v4l2_clk *clk);
> -int v4l2_clk_set_rate(struct v4l2_clk *clk, unsigned long rate);
> -
> -struct module;
> -
> -struct v4l2_clk *__v4l2_clk_register_fixed(const char *dev_id,
> -			unsigned long rate, struct module *owner);
> -void v4l2_clk_unregister_fixed(struct v4l2_clk *clk);
> -
> -static inline struct v4l2_clk *v4l2_clk_register_fixed(const char *dev_id,
> -							unsigned long rate)
> -{
> -	return __v4l2_clk_register_fixed(dev_id, rate, THIS_MODULE);
> -}
> -
> -#define V4L2_CLK_NAME_SIZE 64
> -
> -#define v4l2_clk_name_i2c(name, size, adap, client) snprintf(name, size, \
> -			  "%d-%04x", adap, client)
> -
> -#define v4l2_clk_name_of(name, size, node) snprintf(name, size, \
> -			  "of-%pOF", node)
> -
> -#endif
> 
