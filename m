Return-Path: <linux-media+bounces-1176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF54B7FAD9D
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 23:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A554281CD4
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 22:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76F045C05;
	Mon, 27 Nov 2023 22:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E55BD45;
	Mon, 27 Nov 2023 14:39:29 -0800 (PST)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-58d4968c362so1736405eaf.0;
        Mon, 27 Nov 2023 14:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701124769; x=1701729569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TJ3+lbok3faA7MD4OEdvyhyyfS9GKmADw7vyj9TziA=;
        b=XOqYgCqCQQJ7G5lBw03TDoc3zdq3vwON0VeyZhRGg8nYkViODk11FYdSdF+NiLLLxd
         sk8hiMnYga2uRyXPFrQypyOOYqf+F4q67k3zBibjL9jyy42pG6GIfYYYIBZBJZF5w0XC
         HLOvI7L1DB284V9caO/LGH8iGzRx8Xwdv9Es7ovkAYFhAikW/oZXhbHLT6aKsiW0/OBY
         duSMecl4lXyVcExG6a0krbEooC51eMKL7blaK2aFb0q2bO8cw0iqLpaeEdd24c6najAX
         jxm59YU9anTlC2t61+zJRHI6adqUIkWkBZRjd+ETalb/gq1913XgCdUdgPRG++RrngHT
         H8VA==
X-Gm-Message-State: AOJu0YwRcva8QqQ2P9S69Q6v7eU/TIC6U5/AQnUFCfw4yVFu7aAXERtR
	TjLu8z6YJtm4DGiiZ2auQw==
X-Google-Smtp-Source: AGHT+IGn4a4FXnS4Oeyx4vdAbyOrGRxZIIU/lIS1cDsV5hZPkdWdD5bdcOX8q3JyE+VkpIa5gtYoxg==
X-Received: by 2002:a05:6820:2202:b0:58a:212e:c6d3 with SMTP id cj2-20020a056820220200b0058a212ec6d3mr16480012oob.5.1701124768783;
        Mon, 27 Nov 2023 14:39:28 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y9-20020a4aaa49000000b0058a0809ea25sm1639825oom.21.2023.11.27.14.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 14:39:28 -0800 (PST)
Received: (nullmailer pid 189504 invoked by uid 1000);
	Mon, 27 Nov 2023 22:39:27 -0000
Date: Mon, 27 Nov 2023 16:39:27 -0600
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: conor+dt@kernel.org, mchehab@kernel.org, Fabio Estevam <festevam@denx.de>, devicetree@vger.kernel.org, linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, robh+dt@kernel.org, rfoss@kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: media: Introduce
 MEDIA_BUS_TYPE_DPI
Message-ID: <170112476652.189324.11968655310861121915.robh@kernel.org>
References: <20231126125320.4024456-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126125320.4024456-1-festevam@gmail.com>


On Sun, 26 Nov 2023 09:53:19 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Commit 18860529a599 ("media: dt-bindings: media: video-interfaces: Add
> new bus-type") introduced a new bus-type for DPI video bus.
> 
> Introduce MEDIA_BUS_TYPE_DPI into video-interfaces.h to complete
> the list of video interfaces.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  include/dt-bindings/media/video-interfaces.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


