Return-Path: <linux-media+bounces-836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5996E7F4A08
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 16:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA9E31F21D58
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779DE4EB38;
	Wed, 22 Nov 2023 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmUg6Nhm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDBA92;
	Wed, 22 Nov 2023 07:15:26 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5441305cbd1so9519348a12.2;
        Wed, 22 Nov 2023 07:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700666124; x=1701270924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SyHVCCe1TwoPClBnsSLHf4EvNUXQ/W3rjCvpOp2oD5E=;
        b=cmUg6NhmhOWJq3HMPHiaTn2vY09g8/hBsE1BUgPRw3uQoH5BlZhSE1msRvLKGvMrVM
         haTY3aRfud2T5dEKLpfj+jE3x5p6GVs+JJ1F6+jFF9rqGitezjrSwwaKgCjeSNtoCfSD
         DlwW2m6Gj1px3cj7J3gy48wqQ62wGMV5zq1wf/eTeZaEkOm3mryQyTmLtvvdDs93+aS5
         se33DK5SPPx/Pu5JsnptsL0qtblHJ45oDHS1nNIZurbeD8WA75BvIZrNsbZY97I83FEO
         SvoG8BwCmOKsnVW81Bxqvx9ecUk2ssj7zpZMcoZku2XW1wPIYYuQwoLqkwTQSygCgKKK
         K59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700666124; x=1701270924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyHVCCe1TwoPClBnsSLHf4EvNUXQ/W3rjCvpOp2oD5E=;
        b=tb/t0vcEFSuUgODsB/Rf0LEMHnZPgmk/2uLiI04WygH/KYlyuqO42zp7KZu/sJcI1I
         hgaBlG+jyy1yBhvnVZFiCzyEFTLZoXBZRoGLAVzfB5pvtrx/87HN9Lt/AOjBP/04jIMw
         qSOe/4KnWfa/9FzoIpN4sty43MBoJAOpYoSFKfK3MLIHc6GaouyiHjVtnw6EZKO6r7xF
         aNoOQ9jpGxfsVJ+xAFe3/wau2/2U6fhwJhUby8tl0zGAFqvxNnQIkKGMvihje2ySbnzp
         dzE8+BlnolB9N7ELxskp9Nf7THAtdZeLQZvzQvm/bCNZKYbrMVQWwntfZLvQQDt2trr2
         AoZg==
X-Gm-Message-State: AOJu0Yx2xcglGx5nZ0kO5VRbQlGcECRhdHMAsCs2tyQPOusUzi3oG7S0
	PsYUwdOC4G3ETdCtpZ2XT1M=
X-Google-Smtp-Source: AGHT+IHrw/Tts09VHKQ1692wNMYNCsWYYSRyyPml9Dx39zEbtepEmn480zIyu1XaqdkFM2CIrp5zqg==
X-Received: by 2002:a05:6402:100e:b0:54a:97c4:b03c with SMTP id c14-20020a056402100e00b0054a97c4b03cmr83170edu.2.1700666124240;
        Wed, 22 Nov 2023 07:15:24 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-2-39-142-131.cust.vodafonedsl.it. [2.39.142.131])
        by smtp.gmail.com with ESMTPSA id r5-20020a056402018500b0053dec545c8fsm6191706edv.3.2023.11.22.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 07:15:23 -0800 (PST)
Date: Wed, 22 Nov 2023 16:15:21 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jacob Chen <jacob2.chen@rock-chips.com>,
	Yichong Zhong <zyc@rock-chips.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Eddie Cai <eddie.cai.linux@gmail.com>,
	Allon Huang <allon.huang@rock-chips.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rkisp1: Fix memory leaks in
 rkisp1_isp_unregister()
Message-ID: <ZV4bCdo6vUvaeUE4@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20231122-rkisp-fixes-v1-0-1958af371e39@ideasonboard.com>
 <20231122-rkisp-fixes-v1-2-1958af371e39@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122-rkisp-fixes-v1-2-1958af371e39@ideasonboard.com>

Hi Tomi,

On Wed, Nov 22, 2023 at 04:42:23PM +0200, Tomi Valkeinen wrote:
> Add missing call to v4l2_subdev_cleanup() to fix memory leak.
> 
> Fixes: 2cce0a369dbd ("media: rkisp1: isp: Use V4L2 subdev active state")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 88ca8b2283b7..45d1ab96fc6e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -933,6 +933,7 @@ void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
>  		return;
>  
>  	v4l2_device_unregister_subdev(&isp->sd);
> +	v4l2_subdev_cleanup(&isp->sd);
>  	media_entity_cleanup(&isp->sd.entity);
>  }
>  
> 
> -- 
> 2.34.1
> 
> 

Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks & Regards,
Tommaso

