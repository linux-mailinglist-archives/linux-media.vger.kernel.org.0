Return-Path: <linux-media+bounces-6612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C7874923
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 08:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19E581C2144D
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 07:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46B063130;
	Thu,  7 Mar 2024 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vUInqjBw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922E76311B
	for <linux-media@vger.kernel.org>; Thu,  7 Mar 2024 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709798123; cv=none; b=YvoX7OrVhuvL6RN+JNaxlXWKH1Nh5DzoayK6H3Ql8ynIFHH+r44Qf1ffTJ3QKEts/BdkvwpHxHJFXwBVn5r7ubkOu9jHGIcwH29un39mBHIHjW8NUbtlxsJsYd+1T1WiEIvpTcaCh7K/rkGYpudHH4OOabbIZzYyTXVk+xPxIug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709798123; c=relaxed/simple;
	bh=Aa66jG2WGimBH4GX5jmV/YXE8uZyBO6e9RgV/X53laE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHHNwuC8JSq/GMMCyjQV4E4bs6B+Grbdm5ONyQwvA0KmK4fK/SvCuIdRGChM22MkD+wjF1OCGd2y3PrNCLc8Y4dHJXC6t7SrpbzrsL6orqmSwc0X0kkKSwV8zF8o/9L7qk/kOOtdZXOnPI5c3ohk28LWdWbhpYuYLzx889bSm/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vUInqjBw; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a4429c556efso81053366b.0
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 23:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709798120; x=1710402920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn0DWqG7g9N74WkvhFXOQ0ffZSSFhFrSnC9Q4XDpoto=;
        b=vUInqjBwkR9a9RVfmg7a2IODcxTrbnVbXOEfzFN0264q073mNb80bbBgjHP8Do/nVc
         wp7Wx1qxIdhGNQMSSWKZ7NFGHf8mDLbKzo6aMaz9W+9nyd5QFzFTheD49vjzk/KtTMIt
         ZtieHxPNI2w0mAk4Kp8MTnSsml3ZhdD9LSYPrQrmSexAspUPt3YlBX8wnkUgAqx5m0/P
         jjhRNQQfDn6U6fmNJqG+voG7IJpRCOLruKXL20NGZKQMkjxnaiyBc04Kn7OXEJcTzQJL
         CXpr0BuuE1EKA7Nw36gGiapCd6RwREdTJVqIk7U2+elGEv/pTDqGI4hB18Oz+dxgHHa0
         7gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709798120; x=1710402920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn0DWqG7g9N74WkvhFXOQ0ffZSSFhFrSnC9Q4XDpoto=;
        b=vHzbCxfUOXPQ8hb7lFYAz2Os1ItOJ8F4O1utiGr4xNp/qFRm2SIbsZntXohVZ2jhvz
         PYs6Clk1r0YIzaRJT2b+e0TQh8DnrHgTU80j51/XW73Qoa0OhB4A5GxhST1HTGGR2lGg
         3dGOV+j/XPCprc5Ve+ldBLOiQO9Cd1xGbw4Dqs1lvOlniZTLeCcqUlxo5X+ZqdhPPkif
         WtEStoiWSUe5wRHChp0mqI9Dnq5fEzy12EicdHrt1GB5zt6waXVOra/2i4oIlVdd+4JX
         xC2J/DaJwXmlOY6FkOV4kw/VHbMjUqtjlsCH+zkmlFVWiENhjqCSoX6uzGmJySSu0K/n
         MeXA==
X-Forwarded-Encrypted: i=1; AJvYcCV3BP/qVLvSFtxZDDf5n82twSsLJ7H+MEnBZ0LeQv3UWqvseLTTlmyAeVcRwlM/EUeUnprb13k0DnscDqkxTLhaxksK5ck4uwiB3C0=
X-Gm-Message-State: AOJu0YxGejkFl+QsdNoJP/DW0c959IRYoRUyXav0T+fMqLwUIP0Vs078
	bOcwunLb0/TB4VRk8y8FRi0anoWPcc8rlw9EZHHThNJzC7zKoi/JXXGMZ6xdBCE=
X-Google-Smtp-Source: AGHT+IHWh6qHbiDAcCnz7U/s5fQPQnTrwoA3CIOujNr0ES6F4oppiRIthyVdwep26V/Yz6L0NmQdfQ==
X-Received: by 2002:a17:906:a456:b0:a3f:5144:ada2 with SMTP id cb22-20020a170906a45600b00a3f5144ada2mr11682129ejb.2.1709798119161;
        Wed, 06 Mar 2024 23:55:19 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id lb7-20020a170906adc700b00a4479997b97sm7037985ejb.66.2024.03.06.23.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 23:55:18 -0800 (PST)
Date: Thu, 7 Mar 2024 10:55:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= v1 5/7] staging:
 media: starfive: Add ISP raw video device
Message-ID: <17e9c68f-0019-4b76-908b-6763fb24eb22@moroto.mountain>
References: <20240306093334.9321-1-changhuang.liang@starfivetech.com>
 <20240306093334.9321-6-changhuang.liang@starfivetech.com>
 <c474bd8f-6c23-4536-a915-efbc197a223e@moroto.mountain>
 <SHXPR01MB06715A4810E596B068029472F220A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SHXPR01MB06715A4810E596B068029472F220A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>

On Thu, Mar 07, 2024 at 02:13:50AM +0000, Changhuang Liang wrote:
> Hi, Dan
> 
> [...]
> > >
> > > +err_rm_links0:
> > > +	media_entity_remove_links(&isp_dev->subdev.entity);
> > 
> > I don't think this line is correct.  I think we only need to remove
> > &cap_yuv->video.vdev.entity.
> > 
> 
> The instance I refer to needs to clear both the source entity and the sink entity. See
> https://elixir.bootlin.com/linux/v6.8-rc7/source/drivers/media/platform/verisilicon/hantro_drv.c#L855
> 

Oh yeah.  It's the same in v4l2_m2m_register_media_controller().

regards,
dan carpenter


