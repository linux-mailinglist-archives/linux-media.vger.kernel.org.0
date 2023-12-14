Return-Path: <linux-media+bounces-2398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D318812A95
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 09:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68AFAB212CB
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 08:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C34A22F1C;
	Thu, 14 Dec 2023 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/uUSJEg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD19E3
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 00:44:22 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c60dfa5bfso6478935e9.0
        for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 00:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702543460; x=1703148260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxa4OK+VJbygMlWzrcKVmRH3zv2mpgLim7r6Tj6GZ4A=;
        b=F/uUSJEgAmlHU0ngrQIZ19x2RlYhcLUwT7S4hA8iEHhjiP4XBGMz46fZ8S2Oz4hCBX
         svOXFKUnLXSlrtMZ0CHTpFgfOKhq37/TEGq/Ij8g96jG+YTWw7wGL6so2Lcv+AXG8VBt
         G7qzD9zPnW+AGoa1Y4xVwTmwNtPM4XbY8ytdcAo9ZaoH1pB9eO4l3LDkmeb6Tv1Qu/FF
         TfAjpUG5lqp2ANgbglBuBV4vQ926teYLcITRuZ/nJGlvxfRtcOVlAjRhjlv7IZ5/64Jj
         FJjrbn7Pp8AbuOroDsI3nH7d50R5GT4vAgEkQn33oVmvBgkp0DktjLesxgTVI5M3wlru
         tFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702543460; x=1703148260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxa4OK+VJbygMlWzrcKVmRH3zv2mpgLim7r6Tj6GZ4A=;
        b=vq5oTAoF3TQ0z+XER0RaO1ng0VSclHNlCoWKiQLexWEeA8BUrGLDoUqwvNojmLaojp
         053gWBys34/oNl4qhASxt8SqX7Y4m3H704XMKzMWbZ610LejOxWmXakYSWznfC6eXlG1
         96p+SiAv+IedIq1n+rp28ok0V0BxgqE1I1bfNiCNQ0f9wJHoCy9xrbTr8Dnflwq8Kff2
         mgHI+GdR+fJN4/2TaDz4/NBO7tDmYe5D/hcu/ED8Wn0do1AoeZi0FGjuneF82YluRe20
         0znJ9LZTF4cvLsipyaLXtKSyUTj8jkcjt9GeWB5RwhRtCeFZROM3jIo6OCLCZiRQSmFG
         lOvA==
X-Gm-Message-State: AOJu0YxRaS1Hpwo893cTw8EVyUaHCHL+7eWmCMwNemvsLoVDuncrctD8
	QbX4S9RiKgU9TJllgjx9R3oaPmXQn4k=
X-Google-Smtp-Source: AGHT+IHdx9vMWjImTqcXoiqouvFCLaK6bAtp00VG+95CVMcLK69/bHDVbFpnz2/KpkMQ2AD8IbXlkQ==
X-Received: by 2002:a05:600c:601d:b0:40c:3e43:418e with SMTP id az29-20020a05600c601d00b0040c3e43418emr4948399wmb.20.1702543460245;
        Thu, 14 Dec 2023 00:44:20 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-59-229.cust.vodafonedsl.it. [188.217.59.229])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b0040b2c195523sm25951188wmo.31.2023.12.14.00.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 00:44:19 -0800 (PST)
Date: Thu, 14 Dec 2023 09:44:18 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v6 4/8] media: v4l2-subdev: Store frame interval in
 subdev state
Message-ID: <ZXrAYpx49Nh1gVO0@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20231213150010.25593-1-laurent.pinchart@ideasonboard.com>
 <20231213150010.25593-5-laurent.pinchart@ideasonboard.com>
 <ZXq8Gc+1gqVFbTAR@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZXq-oJovi7O7S6gF@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXq-oJovi7O7S6gF@kekkonen.localdomain>

Hi Sakari,

On Thu, Dec 14, 2023 at 08:36:48AM +0000, Sakari Ailus wrote:
> Hi Tommaso,
> 
> On Thu, Dec 14, 2023 at 09:26:01AM +0100, Tommaso Merciai wrote:
> > Hi Laurent,
> > 
> > Applying this patch I received the following error from checkpatch.pl
> > maybe is a false positive or maybe I miss somenthing. Btw hope this help. :)
> > 
> > Applying: media: v4l2-subdev: Store frame interval in subdev state
> > No codespell typos will be found - file '/usr/share/codespell/dictionary.txt': No such file or directory
> > ERROR: Macros with complex values should be enclosed in parentheses
> > #135: FILE: include/media/v4l2-subdev.h:1411:
> > +#define v4l2_subdev_state_get_interval(state, pad, ...)			\
> > +	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
> > +		(state, pad, ##__VA_ARGS__)
> > 
> > ERROR: space prohibited before that ',' (ctx:WxW)
> > #136: FILE: include/media/v4l2-subdev.h:1412:
> > +	__v4l2_subdev_state_gen_call(interval, ##__VA_ARGS__, , _pad)	\
> 
> Checkpatch can't handle well macros that do something as unusual as this
> one and it's not really worth fixing it for a few rare cases. This macro
> generates a name of the function (or macro) and the two consecutive commas
> (separated by a space as they should, think of it as an empty argument) are
> there intentionally.

Thanks for the explanation,

Regards,
Tommaso

> 
> -- 
> Regards,
> 
> Sakari Ailus

