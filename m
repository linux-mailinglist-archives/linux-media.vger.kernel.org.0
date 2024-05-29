Return-Path: <linux-media+bounces-12122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643D38D2932
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 02:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95C931C24537
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 00:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033C18BEA;
	Wed, 29 May 2024 00:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TygEclyH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96DA168B7
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 00:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716940910; cv=none; b=YIGWfIL/3gGMOyuQ3Y3IQiJf4b+mwz+Ubr9HRcuhE119rgjoXsDn+l9l2UQd9JS3twHeS+b+gO4MAUdFbcyndAUTfN30SXqG4f8kgne7gdW/MzPbJ+gCiNmFVTndop8zUc3iCvzYZxKvOaom02fuK7wBOkOTg3Nseeywn5u//rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716940910; c=relaxed/simple;
	bh=RBwkYvZvQ7HcRtcbWXlW1lKInMy240xUm9Azw4zpgn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EuVJPvldH/DzON/0RFTtgvs2hIdMELNkkkHff+9jyOfnGgCdacEvPF0/DMe/Orr2h+zy/+Ohne0GyjSNN20cohCNeA9Obnq7J1SYbaXghXhV1zdHD+mBzfcBQgPtzgqKu+kx46nt4418TOjdEANOeFHO7RPOktdFdkm7e8uacww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TygEclyH; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e968e77515so17722371fa.0
        for <linux-media@vger.kernel.org>; Tue, 28 May 2024 17:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716940906; x=1717545706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JbSUJZ3lWVi558UySXJCbOkQXUwg/BY6swouuGo3h3M=;
        b=TygEclyHoAGDPHl/RQojVEJU5saV7tYC/bemAcsJSTf3oytcZYW0LTlJ5tFgqDKPFS
         jrlboJQiumh9t0s7EscXglycE5n1HB5ofKoT+53Zb2AVE25hJxAIRRPFPyzTdq0uYYtz
         K7i4zz1fgUsfO6HgndT4A+s40OZ6zavXTtvqcNvOBLC/Ml31bxE8nDASdIEEJbrfjLiD
         umZF5NE5/ihnBOl+gUcvLbm5EQY9gtUY9KkURa73wNCMmirkH6Gpv4EOquWkiSZ4EqmC
         LsDSHMXJzHRYnuLr9XDhLzSHS6l1yZRqUAHj9RLJ0DowDPP8mVmj4DNC58zHURqsfQtz
         M1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716940906; x=1717545706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbSUJZ3lWVi558UySXJCbOkQXUwg/BY6swouuGo3h3M=;
        b=KRApixz097dLatd9MdFSJz7y+AMnGNaqgzN0v92paqr76g7EPChig8EUvaVRK91Au4
         kD89TR3JasTLTeXrHMTjquxTJq+qiTirOZTFqRK9dLauBwxupUSrvbHfdKBMQ86Xy4qI
         BvKWMaF7rjvoL4PRktlFxCZIMa2M8MlL6e0q9A6W4FEdC9dtP1TJx1b5bWSJxhaRglTg
         2YbDRTJa10kRiIkg22a5BFLHXYEFM6NT9WJiKxLIoLK6+DD7s84uzUhaOs0JpsKfXcr8
         Plm46YIQx0X2TASFyq6vmhbTwib04NfnJ+2AjW12GQBaZuPnSL67hCm1kXf4trjnOKoE
         56CA==
X-Forwarded-Encrypted: i=1; AJvYcCUkmFz1F7WJ75+kQmR670FV0p54p7loCslB44ocLgk2nGRdeQVnsS690Ys5rU9BW5WMhOTOYN5Uo4nf1YvyWAJBAD8IYOkSYMdUbII=
X-Gm-Message-State: AOJu0Yz9qk+uLwqI/D/M+s7E3iMBdWs/ASsQ/RmS4st+13HyUJhoHXc9
	Y7c5X4fYj+MgL8rXhpc3RqzS9eRFtc83hR4TCjfJOaZhKKDfEwTNAVEhmw+wY8k=
X-Google-Smtp-Source: AGHT+IGMFvu7tNMpu3hd4ZI4DzSWJEhLR+W1+ptB5RwKxDpz/xmWeD3EGSsLralZrE8N3ltg8VCBsw==
X-Received: by 2002:a2e:9e57:0:b0:2e9:795a:c25c with SMTP id 38308e7fff4ca-2e9795ac301mr46868491fa.39.1716940905814;
        Tue, 28 May 2024 17:01:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd159fsm23674921fa.94.2024.05.28.17.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 17:01:45 -0700 (PDT)
Date: Wed, 29 May 2024 03:01:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: prabhakar.csengg@gmail.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Helge Deller <deller@gmx.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 1/8] gpu: drm: use for_each_endpoint_of_node()
Message-ID: <3wxib4xs4shnhn6ekokmi2uwo5daqhomefqosmocvyuashxqsq@wwp6a6yrl7ag>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87h6eh4hld.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6eh4hld.wl-kuninori.morimoto.gx@renesas.com>

On Tue, May 28, 2024 at 11:55:26PM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/base.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

