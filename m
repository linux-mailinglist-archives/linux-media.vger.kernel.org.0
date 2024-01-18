Return-Path: <linux-media+bounces-3844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 124BB831516
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 09:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A566A2816DD
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 08:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7264D125A7;
	Thu, 18 Jan 2024 08:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fq11AmjU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1F2D51B
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705567803; cv=none; b=fWNR7UU3azY8gf6YUHvaEuKPfDgWCgT8KEA0MQO+5f2kX03cP/q45j0y8bvGlWtgj2sXF/2RovP3lM/2IL9pGDZy8IQOPIyKdJWMuqk/xCldl92L2hq2egsDctpgjm+sW0qS+k11gFVhavtEijlBsHCGLjrK281TBfkipymHv5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705567803; c=relaxed/simple;
	bh=Co4AC53XXV3EelNX3hjwiRfXJ6YSyYkMqW5U92Yy6+I=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=tTEJ3GrZ/mRHOsRj+JF/7OLjG3jbyit0bBpSkws34Ba55z9PmzRv78v/f+pVc8vY2ZIp7RpnD+Trj/DqRaTQWy+qjItxLvM+SlO2NI9deKoA3HF6pYebWJ4vxlqGo9m4i0+bXUL7S6f+C50ZK+o2tS8BsGcaqjm9N9t0oayyEaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fq11AmjU; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so31550466b.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 00:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705567800; x=1706172600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4sWXeJaZ+cg8Y5fEJGmTGdKc56/Jt97g7ia/aoNnuUc=;
        b=Fq11AmjUoMsj0zrF+KHYdXlvG4KfVncgqI3R/0YtCv7wDXgNHy9gL/yOjFdBxnzXEY
         xdRjLt8itE129/6k8XvH9JRbcLzFaRJeXkvRr5r+XnWxigehsYiwktO1/7tJpW6sPNSj
         th14+C7dJ0KtU2RSeLGAFgnxPQYmCXzt1dgMYRunP1rBmjg1tzlR6UVo7zNn4Zv5QIQu
         T9S9G3UjrTmA3NrkWMJNdjR1LdsjpAWb78XDfDLZ8hSq42iwzJ3E2zxMSh2SlPSaKquq
         uwURJThNmWgOauX/dbY8kezKYwgDWH2LZBP0UzwwcquNWU7Xb1gklPt4LN9mv/cX/es1
         B0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705567800; x=1706172600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sWXeJaZ+cg8Y5fEJGmTGdKc56/Jt97g7ia/aoNnuUc=;
        b=ZqCfnOer/ATNx/ZzklQCH/zC0Qhvd1E6qP4O/6Y96X+2SbSZpx8p8svZLFWzr8mrDy
         0SjdffLuJ7ElIYn1j2ZxhvMHOVElevFPWD07I6jA5yWfyjR/6teOCGBEHs4WCveHwv3u
         sKf/9ts3+auCUJCEVoj70MX13gq62c3+mtwZZqi1fn1Vb4KrnvpJOOo5bQY2tUcOhhah
         M0X7RX3m8eyRbKxVmWNwRTVZZzLqeM0FgLFWkYbWYj9derpEQ9NDBwGOpOKVGPw52vtN
         n6GLG7h7Db/hPmWtvSUn9SlBNhfZpPnhn8vx1AaK3/iOKVls74eFmiWNQSC9bb1o6ath
         F3aw==
X-Gm-Message-State: AOJu0Yz2Mj9IEyYdqxB9enxs0JbOm3p0vTOZk4WUIXTRUhp+WNHJlN57
	xAFeR34RENHnwKHPr0dQWZ+ncDoqxJQ8+950Lp/+Wy8T6gvmt8MGKvFnzauB
X-Google-Smtp-Source: AGHT+IGXbQIXygoSXdul24viKvxDUn3rEeAgTvP2sxVDtLYb3I+BLNtmoiCt9e7E9UynURO0n8TcLw==
X-Received: by 2002:a17:906:da04:b0:a2b:55a:9e13 with SMTP id fi4-20020a170906da0400b00a2b055a9e13mr324522ejb.11.1705567800144;
        Thu, 18 Jan 2024 00:50:00 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-49-42.cust.vodafonedsl.it. [188.217.49.42])
        by smtp.gmail.com with ESMTPSA id a5-20020a1709063e8500b00a28badcf367sm8845604ejj.54.2024.01.18.00.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 00:49:59 -0800 (PST)
Date: Thu, 18 Jan 2024 09:49:57 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [bug report] media: i2c: Add support for alvium camera
Message-ID: <ZajmNUQyvtnctg+J@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <9709fbf7-2769-4b25-ad6a-d59058e9946d@moroto.mountain>
 <b926fc2b-a29b-472b-b68b-4383eed8b43c@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b926fc2b-a29b-472b-b68b-4383eed8b43c@moroto.mountain>

Hi Dan,

On Thu, Jan 18, 2024 at 09:56:02AM +0300, Dan Carpenter wrote:
> On Thu, Jan 18, 2024 at 09:54:06AM +0300, Dan Carpenter wrote:
> > Hello Tommaso Merciai,
> > 
> > The patch 0a7af872915e: "media: i2c: Add support for alvium camera"
> > from Dec 4, 2023 (linux-next), leads to the following Smatch static
> > checker warning:
> > 
> > 	drivers/media/i2c/alvium-csi2.c:420 alvium_get_fw_version()
> > 	error: uninitialized symbol 'spec'.
> > 
> > drivers/media/i2c/alvium-csi2.c
> >     403 static int alvium_get_fw_version(struct alvium_dev *alvium)
> >     404 {
> >     405         struct device *dev = &alvium->i2c_client->dev;
> >     406         u64 spec, maj, min, pat;
> >     407         int ret = 0;
> >     408 
> >     409         ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_SPEC_VERSION_R,
> >     410                           &spec, &ret);
> >     411         ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_MAJOR_VERSION_R,
> >     412                           &maj, &ret);
> >     413         ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_MINOR_VERSION_R,
> >     414                           &min, &ret);
> >     415         ret = alvium_read(alvium, REG_BCRM_DEVICE_FW_PATCH_VERSION_R,
> >     416                           &pat, &ret);
> >     417         if (ret)
> >     418                 return ret;
> > 
> > Only the last read is checked.
> 
> Oops.  Sorry for the noise.  I hadn't seen that it takes &ret as an
> argument and so it preserves the first error code.
> 

Thanks for your comment.
No problem :)

Yep ret is checked on every call, if one fail this is propaged to every
others calls.

We already talk about this into the driver thread and Laurent give me
this really smart solution :)


Thanks & Regards,
Tommaso

> regards,
> dan carpenter
> 
> 

