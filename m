Return-Path: <linux-media+bounces-601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349D7F1075
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 11:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44211C214FD
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 10:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2643134CB;
	Mon, 20 Nov 2023 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rr4vj8DY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE545AA
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 02:34:04 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507975d34e8so5829582e87.1
        for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700476443; x=1701081243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+/A67yCsKCYjT4OzekwJL7Zg9Z+4KiWMU478yrnJ6A=;
        b=Rr4vj8DYG1C9mB75c8LFHJqqARMge/NuWS+2AtgEoULQOpK3EgbcwE+nwV4UOFuqyr
         jhYSD/zdXWpOuxwlmHvBCxn5TfO+0c3J5IQWUNns6lP8BBKaPdOI3FuRcGqIPbeMlQGp
         U8FfwUEquCGoAMCn8ArSHDbL7kBnizbHE9j3WNsBPpe6rPz1bYVTpEoG/7asIauO0XEV
         n3ctmu1yxTpnI/RILbf3bFcIl6bOjuRtPahxEmoiubSmFF7aofvTepGGKuYi2ipRF6i0
         thYEuRgl3yiRxOYnC2+BjD3YytpvFAt3pcAp7JJkVZC7pH0BCJ361uEHYzDgC5pECxkM
         ZLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700476443; x=1701081243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+/A67yCsKCYjT4OzekwJL7Zg9Z+4KiWMU478yrnJ6A=;
        b=H/3TmsF/pT9XiKxjwMXhRRLI8QPVGRsFEyF2ZXeNWD62Y6YnlZ9GMrjzth4ofrRluZ
         fJEUh0AaUSjNi7T3kxhBal3KGJLWFhb3SxpKn+HeXi9f6YTQomZlNVeTM3fclsTCKw1F
         Xdh+rOrYr3b3hd6/plnWlTvplkQT4wE8tigMgrRJjzb57QNr93m1qPmr1TdGUXAdyf5t
         mmjLtNx3/dQ5wLQWWwqoQ/GCChMAwr3u7WnNTKuZY9h1UXR5BWaPYye6VS8WnUxOarl8
         46vwCO0YAPFiURcrLayhKuZWrI1M5+a8OcQh699n/1Hy/oSSdAorbylWRovYjXosfBuO
         Ixuw==
X-Gm-Message-State: AOJu0Yz3g7GkP36jky88dZ1pGo8rSjcYfiyTo1BJjNWMz1A1dYq0H0tT
	VDpOhIOT9jCYUpRpJOjHHnPUdg==
X-Google-Smtp-Source: AGHT+IGC+q6OhZa2pu5cx3aVWD4t46z49DbuzV37RCxExtAfJLBJFt42IgxDX1xcBMYvlOiJRA17RQ==
X-Received: by 2002:a19:5517:0:b0:503:95b:db0a with SMTP id n23-20020a195517000000b00503095bdb0amr6382815lfe.12.1700476443129;
        Mon, 20 Nov 2023 02:34:03 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t8-20020a5d49c8000000b0031984b370f2sm10768685wrs.47.2023.11.20.02.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 02:34:02 -0800 (PST)
Date: Mon, 20 Nov 2023 05:33:59 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org, kernel-list@raspberrypi.com,
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Dan Carpenter <error27@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH v2 10/15] staging: vc04_services: bcm2835-isp: Add a more
 complex ISP processing component
Message-ID: <fe7b0a08-941f-4dbc-b89f-d3da0a96ac32@suswa.mountain>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <20231109210309.638594-11-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109210309.638594-11-umang.jain@ideasonboard.com>

On Thu, Nov 09, 2023 at 04:03:02PM -0500, Umang Jain wrote:
> +static int media_controller_register(struct bcm2835_isp_dev *dev)
> +{
> +	char *name;
> +	unsigned int i;
> +	int ret;
> +
> +	v4l2_dbg(2, debug, &dev->v4l2_dev, "Registering with media controller\n");
> +	dev->mdev.dev = dev->dev;
> +	strscpy(dev->mdev.model, "bcm2835-isp",
> +		sizeof(dev->mdev.model));
> +	strscpy(dev->mdev.bus_info, "platform:bcm2835-isp",
> +		sizeof(dev->mdev.bus_info));
> +	media_device_init(&dev->mdev);
> +	dev->v4l2_dev.mdev = &dev->mdev;
> +
> +	v4l2_dbg(2, debug, &dev->v4l2_dev, "Register entity for nodes\n");
> +
> +	name = kmalloc(BCM2835_ISP_ENTITY_NAME_LEN, GFP_KERNEL);
> +	if (!name) {
> +		ret = -ENOMEM;
> +		goto done;

Oh crap.  This function doesn't clean up after itself, but instead
returns to a One Magical Cleanup Function...  This style of error
handling is *ALWAYS* buggy.  But in this case I only see a very minor
leak.

These two cleanups are under one ->registered flag but they are
allocated separately.  So if we only complete one action and not the
second then the flag is not set and we don't call media_device_cleanup().
(This is one of many typical problems with One Magical Cleanup Function
Style).

> +	if (dev->media_device_registered) {
> +		media_device_unregister(&dev->mdev);
> +		media_device_cleanup(&dev->mdev);
> +		dev->media_device_registered = false;
> +	}

It's just such a headache to review...  (That's why it's so bug prone).

If you wrote it in Free the Last Thing Style then you could get rid
of a bunch of flags like ->media_device_registered and
->media_entity_registered because at that point you would always know
what you had done and hadn't done.

regards,
dan carpenter


> +	}
> +	snprintf(name, BCM2835_ISP_ENTITY_NAME_LEN, "bcm2835_isp0");
> +	dev->entity.name = name;
> +	dev->entity.obj_type = MEDIA_ENTITY_TYPE_BASE;
> +	dev->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
> +
> +	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
> +		dev->pad[i].flags = node_is_output(&dev->node[i]) ?
> +					MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
> +	}
> +
> +	ret = media_entity_pads_init(&dev->entity, BCM2835_ISP_NUM_NODES,
> +				     dev->pad);
> +	if (ret)
> +		goto done;
> +
> +	ret = media_device_register_entity(&dev->mdev, &dev->entity);
> +	if (ret)
> +		goto done;
> +
> +	dev->media_entity_registered = true;
> +	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
> 		ret = media_controller_register_node(dev, i);
> +		if (ret)
> +			goto done;
> +	}
> +
> +	ret = media_device_register(&dev->mdev);
> +	if (!ret)
> +		dev->media_device_registered = true;
> +done:
> +	return ret;
> +}


