Return-Path: <linux-media+bounces-21579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 804A09D228A
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 10:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F307E1F218AD
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 09:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3B319C54D;
	Tue, 19 Nov 2024 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaNAnIwu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8248139566;
	Tue, 19 Nov 2024 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732008868; cv=none; b=dNXwsSWvkE1bTlGnlt/d6k5dnsfq2Yet/OoEDgLYW/aC7fW0WTCTNVbvcqVILlVv85Q4Lr1T0IoB1+XJa89avsC22hMQWHpKYCftZnMOgvGB9ThNi1QsCTBRJZZvdJDh6v8lJrRUsv9OsmnIR2j5JC2zRA7TJiR0pbGCkyCwDGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732008868; c=relaxed/simple;
	bh=cUPHrgIk3h/1fGaI12CR5fxcQ3Jb1XerDEZi03yMIb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6IBz2a5zCGrZXNQXgtfxXkRB3HQQahWJdAzNwxCMMOelliE6pj+xxrrjexAGisFYhrHiqpxQjO5VEjts+zBn/Vq0lyw+832ie/zO2i5+W5xhd937Z22Uf5DTE75tYlV0FntuZQBpNcnnf3ctMtog5dUM55Qj2MywDeKfbxQRoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaNAnIwu; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-212348d391cso16128315ad.2;
        Tue, 19 Nov 2024 01:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732008866; x=1732613666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pPExtlge3msjkZF91Z4CEG8tmqsBNvouLTtNJroiSf4=;
        b=NaNAnIwuhkzoYV26fqDwxJPcRUbtv0HYy/fH3/g0MBNr1fEm44RxC9LVtq6zVVmrJY
         DsSqtgZDB0mlb7NG7sRWLY5VU5j9EIc3CPWM745umXkcWLtn0bJG+eaEl+I4yumWcPZb
         +XwXRjXWN38BP4dl+VUT0dwk0nevCEStnXDZeFkUp+2dDjxT6zK0arGbt4/ltjBHCyTl
         +K0MVp15wmFymGtYu+TMLEH32BU9QQAEpLyL2/BiKMTpwU+tjkLo69SBSC5L0a++ymWG
         37kGNY86MCKzkzz8Zji7ldi3NEk0RBv1BfepJx2ZpUO6FTxOxCKSpX4u7uLc4UBh3dNL
         3IVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732008866; x=1732613666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPExtlge3msjkZF91Z4CEG8tmqsBNvouLTtNJroiSf4=;
        b=R2+wT7u7NOMr4GfAZ64ZyqLL7FiHotXF3JEw+xkdGMv1+jwZNd6SM7s/u1K3htaqQ1
         bAuq2vS8x8ifWwNpZiQtJjvUq1ihUvO5lxrI1ImTV2bQpwH8UewfkbdirEucVc+BarzT
         mZsoCbDZjv8YT4J1ZOZjtH54UBTULmv1AKmwBd6+dT9k0lRC7g0l5WgnNkghYV3I7Jkw
         DfpTdc7bj++iT4UhpALAxPyZ4pUtnM/rEbUd/qyIJRKRb24n+qzKRS3qsvfzvf4DRAMf
         1qovM6SOJPCOWbj03dEc5FyKUge2LJ0uLONpatNnQXnkxP0DnTk+va3SF3NNqwjpuIBk
         Tyqw==
X-Forwarded-Encrypted: i=1; AJvYcCWDGIsavCdwHNjHT/dLGjzqziZFYcOYbALrz/+T/wW19pJvIM3oUPAyZ2ZJ/126UZ57jQ/ijrA+XtugIK8=@vger.kernel.org, AJvYcCXB70lnXq9d7l7/nUkneFrQaY0Ol4Q9BtvG5dunrx40m6e4haA7G+UbYIVe6tfGozkJuutFcHNZGE9dG0g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfb6og3PAShtl5vcq9yYuw3vZ3OuR3+mOLz2iz7lEbqxmopJ6Z
	Bc6Ed9fVR7oylyiLGudZhMvaJqt+i1RbcsNuwrrBhv7bYU/kdSefFsWFdqva
X-Google-Smtp-Source: AGHT+IGk0ioib0jianP/JWeRLCWZdzMBOeRSZzyDXcvD2UaEgV8gbzUU0BUTO/h3v2TJ3Zgql38YQA==
X-Received: by 2002:a17:903:186:b0:211:e66d:7450 with SMTP id d9443c01a7336-211e66d78d8mr206006795ad.32.1732008865846;
        Tue, 19 Nov 2024 01:34:25 -0800 (PST)
Received: from HOME-PC ([223.185.132.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212134ab989sm38763335ad.17.2024.11.19.01.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 01:34:25 -0800 (PST)
Date: Tue, 19 Nov 2024 15:04:22 +0530
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dafna@fastmail.com, linux-media@vger.kernel.org, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 media-next] media: rkisp1: Fix unused value issue
Message-ID: <Zzxbnkq86EKEWwFf@HOME-PC>
References: <20241119072653.72260-1-dheeraj.linuxdev@gmail.com>
 <20241119075944.GA31681@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119075944.GA31681@pendragon.ideasonboard.com>

On Tue, Nov 19, 2024 at 09:59:44AM +0200, Laurent Pinchart wrote:
> Hi Dheeraj,
> 
> Thank you for the patch.
> 
> On Tue, Nov 19, 2024 at 12:56:53PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> > This commit fixes an unused value issue detected by Coverity (CID
> > 1519008). The error condition for the invalid MIPI CSI-2 is not
> > properly handled as the break statement would only exit the switch block
> > and not the entire loop. Fixed this by returning the error immediately
> > after the switch block.
> 
> The patch doesn't "return immediately". You can write "Fix this by
> breaking from the look immediately after the switch block when an error
> occurs." or something similar.
> 
> > 
> > 'Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver
> > optional")'
> 
> The Fixes tag should be formatted on a single line, without outer
> quotes, and without a blank line between it and the Signed-off-by line:
> 
> Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver optional")
> 
> > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> 
> I can update the commit message when applying the patch, there's no need
> to submit a v5, unless if you want to. Please let me know if I should
> take this version and update the commit message, or if you will send a
> v5.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index dd114ab77800..9ad5026ab10a 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> >  			break;
> >  		}
> >  
> > +		if (ret)
> > +			break;
> > +
> >  		/* Parse the endpoint and validate the bus type. */
> >  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >  		if (ret) {
> 
> -- 
> Regards,
> 
> Laurent Pinchart
Hi Laurent,

Please go ahead and take this version and apply the patch with the updated 
commit message.

Thank you and Jacopo for your valuable comments. As a new contributor, 
your feedback is extremely helpful.

-Dheeraj

