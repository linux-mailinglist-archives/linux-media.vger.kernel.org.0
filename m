Return-Path: <linux-media+bounces-20400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E109D9B2B3B
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 10:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DCAE1C21A28
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 09:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A751990CF;
	Mon, 28 Oct 2024 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CSsv9zo+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A53190696
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107253; cv=none; b=RuQ8zcM5xwNlaLTqwmh5oEWV5Ao5ZD2Gta2/b5a1mRJI1K+eeaNjUlKbKwYVoW6ZDY7NxyEF/SkvBvGBYnaVMPL8R+xvK+P1NttXU1EDArqJgpnmCJa1vlW1RgcTyGKrcIfQg3/T+MYUDcpdYX5tDSHfUGUnZ3EDAfq+qv1B3O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107253; c=relaxed/simple;
	bh=j9Yh3zrZUalX47mvMkgSXxAy2RuDtztZjtjGaLcmm+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bL+QJTS7aRn/4xmHAesC5S/pLVmXLiamg7+xg6Cn/sOC1tLWUOJOlgjYgOoY5ncsLYNv08GNc5qo+l/+mNXVcCC5MNw0KM9sgiAP5Hvms3Eb8qTPfd36bsQFKo/eo4fu8QAu3aRcTtIxxsQrxr2msoAQhTEO96VK1ELEPKOaApY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CSsv9zo+; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso35460611fa.1
        for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730107249; x=1730712049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VPBuezFB3CXtTW5/lJNTKguPGRqG+lEFtQVwqgqjd4Q=;
        b=CSsv9zo+gjH62jHqC3592QZ17YJnAzndEYS8uph/04F3pRwA2p+oapcIwPvIAuU/Vq
         VSWiKLahxAdQyYrAbAtpynZuKOy3b6Pl9sAadhl040qjvdjQ/bsR8dMLae1LUZjLZdgJ
         R1G1jRv+2r5uoRn8+hf3XukCqddY3W36/hn2G6KZCZPA0yw9Dc46Rck1swcFxwquE4Jr
         ZaDJD4S2eG3/ryRnB5GmgcBkbaD2n8ZEPcj4bgvVdoPR2OMFpTYi+Z82F2hEAt3w5LK2
         lhNg8N3ijlkhdMC6BEIujMLWrp/oCEoLPD68vuFgSbS/IcNUOQymj+UfnDM380K7nsAK
         OENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107249; x=1730712049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPBuezFB3CXtTW5/lJNTKguPGRqG+lEFtQVwqgqjd4Q=;
        b=P97slP+DA8CjrLXNW8ytbWTBpQ1T7S2rmuQCe86tjm7o0+QUA5xa1i5duGE0AhkGNc
         dSP1eSurhEVAZreOFxThFTd9YZ/51Jq3ArXVaSZXL7R3tNOmkX2k+fkyREQtzi/onJGr
         fkIBzo0QfQDDgExstUX8Vkl00woBXVE18/UGzPEy8itNR0gE3x+tgPzt/2knQHcm5phP
         bn5xT4c9NKubguXEl+avJW6ZzVfv4XGQumYZfNXHt+YC5MngzMSpuOp4BZ2vJXM3yJtN
         9k4qE4rZFQ+1uJgvtcJBfl9zM9EizYMwrvff60LCbOXQaFl/+/eXdV64D2fWvYxyqd9G
         Unsw==
X-Forwarded-Encrypted: i=1; AJvYcCUNk9eIeY2y2g8YCBYfa0nzVLz2j4T39BzX7YVfIokr2q8uoYxXNEjOMk6qgSlI8Atdp2NTInC61mK3mA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/1zeQfwsZu4W7A1cbfldY3gbh+c/6IPorAaVvVI8ziYUmVf0
	Cc0J03z0kjzkfieJZ/WtYicyEgU9UX8huA/7eBtpnRbX2mkY7VhHljYiE/569ng=
X-Google-Smtp-Source: AGHT+IHMzC2RrBK1gDyjb7BDtN9UQMSMyOUaimH3SDT8yHY0Jieo0+u5sTv3iUOAiXJhLKZA5AAPKQ==
X-Received: by 2002:a2e:bea0:0:b0:2fb:5014:c941 with SMTP id 38308e7fff4ca-2fcbdf71340mr25188781fa.14.1730107249435;
        Mon, 28 Oct 2024 02:20:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4507c44sm11199391fa.19.2024.10.28.02.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:20:47 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:20:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, 
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 10/13] drm/bridge: Add ITE IT6263 LVDS to HDMI
 converter
Message-ID: <tjtbvn5ewlzs6wqkp2ffquiiebakhv2eg3vt4mzooeb6nibx4u@qhwx4hxvj6ou>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-11-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-11-victor.liu@nxp.com>

On Mon, Oct 28, 2024 at 10:37:37AM +0800, Liu Ying wrote:
> Add basic HDMI video output support. Currently, only RGB888 output
> pixel format is supported.  At the LVDS input side, the driver
> supports single LVDS link and dual LVDS links with "jeida-24" LVDS
> mapping.
> 
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

