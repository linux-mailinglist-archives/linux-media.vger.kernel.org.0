Return-Path: <linux-media+bounces-383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8047EC77B
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 16:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7BA0B20C16
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 15:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48C939FF9;
	Wed, 15 Nov 2023 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VyAAUjhu"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7973B33070
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 15:37:54 +0000 (UTC)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0509DD4B
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 07:37:52 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-66d00415a92so4177166d6.1
        for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 07:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700062671; x=1700667471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kh48FY3/WjTfOrxUDVoiLLm+qwCRoUXdSkUvQ+UBfKM=;
        b=VyAAUjhuyx+s13tmeR3akwbbc4xW607BJEIURRmx142qbbHevjwomrm0ua47kpNUPp
         9QihqHaaKqUfaiRzEr9H4NvgQSdND4WIMVaLSPAElKKnsEaClBMXWPFhBLAfgY7dpS9x
         xna5QXr6iWpUZ4eRoxl2wYAuWh5yzByf1VLPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700062671; x=1700667471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kh48FY3/WjTfOrxUDVoiLLm+qwCRoUXdSkUvQ+UBfKM=;
        b=n/tvRePSsRmRZCewXdjQhKLimPXpvsHJRUWpBRy68pm0jgRe3PXHY0X6I5Z84KbKWp
         Kts7UideuH8CRl3aqzlCiLsQ4s1RdVl1AytZgNuSzKCPBY+sjdej4GvBf+FSOwDUZARa
         U/kzxsCFCyx3DgOlaNRbnCjYZR8BNTz9mTeRRzrK6u2pZFEiknRdUFhxPDZNN/a56J1r
         i4IJJLMAFuuIqFO3/HFidk/o5kwQtbs7jW+rb19AFqCwzPvzYcL9HySZExaWdWgCoQGA
         pltygbq4aoyzXZZPZ9AgfcpTNInmyGy6nLw8wa7srvUevk60TALxEmjh3fLbe5p2unn2
         ceJg==
X-Gm-Message-State: AOJu0Yx7VqsC5fBYaMKyTSZGBM/HFA7sthjIzERQpPvgj09mlpJlcVTG
	pyR6cuhcjOUl1fzkPm+LpvmYzw==
X-Google-Smtp-Source: AGHT+IGLsbzpvhlzD3x+pwf+0KDCrZJl+faC8VovocCpNmjgD3n2fu3BLZB0tkSjGLfScoRKLXBS2g==
X-Received: by 2002:a05:6214:4943:b0:66d:169a:a661 with SMTP id pe3-20020a056214494300b0066d169aa661mr6004483qvb.4.1700062671117;
        Wed, 15 Nov 2023 07:37:51 -0800 (PST)
Received: from [172.25.82.8] ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id dz4-20020ad45884000000b0066d1d2242desm613041qvb.120.2023.11.15.07.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 07:37:50 -0800 (PST)
Message-ID: <ca9fc3b8-a93e-4451-9814-df13adfbe8ae@linuxfoundation.org>
Date: Wed, 15 Nov 2023 08:37:48 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: v4l2-subdev: Make .init_cfg() an internal
 operation
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Lars-Peter Clausen
 <lars@metafoo.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Ricardo Ribalda <ribalda@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jacopo Mondi <jacopo@jmondi.org>, Bingbu Cao <bingbu.cao@intel.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Nicholas Roth <nicholas@rothemail.net>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Tim Harvey <tharvey@gateworks.com>, Maxime Ripard <mripard@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>, Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Benoit Parrot <bparrot@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231114131512.24615-1-laurent.pinchart+renesas@ideasonboard.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231114131512.24615-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/23 06:15, Laurent Pinchart wrote:
> Hello,
> 
> This patch series addresses a historical issue in the V4L2 subdev
> in-kernel API.
> 
> The subdev .init_cfg() pad operation used to initialize a
> v4l2_subdev_pad_config structure. This was changed to initializing a
> v4l2_subdev_state a while ago, but the operation wasn't renamed, and
> stayed a pad operation. Not only is the name confusing for new
> developers, it is also the only pad operation that doesn't operate on a
> pad, leading to more confusion.
> 
> This series addresses those two issues by renaming the operation to
> .init_cfg() and moving it to the subdev internal operations, in patch
> 2/2. Most of the preparatory patches from v1 have been applied by Sakari
> already, leaving only 1/2 for a respin due to issues with the
> first version.
> 
> The series is based on a merge oof Sakari's latest pull request for v6.8
> ([1]) and a v6.7 fix for the VSP1 driver ([2]).
> 
> [1] https://lore.kernel.org/linux-media/ZVEyCfzm4ninES6K@valkosipuli.retiisi.eu
> [2] https://lore.kernel.org/linux-media/20231113020054.GA18039@pendragon.ideasonboard.com
> 
> The VSP1 driver has been tested on a Renesas R-Car M3-N Salvator-XS. The
> rest of the series is compile-tested only.
> 
> Laurent Pinchart (2):
>    media: renesas: vsp1: Fix references to pad config
>    media: v4l2-subdev: Rename .init_cfg() operation to .init_state()
> 
>
>   .../media/test-drivers/vimc/vimc-debayer.c    |  11 +-
>   drivers/media/test-drivers/vimc/vimc-scaler.c |  11 +-
>   drivers/media/test-drivers/vimc/vimc-sensor.c |  11 +-

For vimc:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

