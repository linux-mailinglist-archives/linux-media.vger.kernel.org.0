Return-Path: <linux-media+bounces-20542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B82E9B5595
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 23:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB9ED1F240B8
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 22:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5217B20A5F3;
	Tue, 29 Oct 2024 22:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gg8bZnyr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4714DA03;
	Tue, 29 Oct 2024 22:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730239933; cv=none; b=PmeMFli7DZs/WqfHs7fH1Vu+taKJ9nle1COhM1kZLUgTpDNy07F7qWxJKygjIAzqgbJA+zZ4jbPHZXLfNMpZNBFtRUJeGtd5sGGWH/49CGPVPZjyNF6jgSDarPm0BHqTu5Qfo/eQBYaebYRJQCVtfUzFt1DlzGx01Zn1/sQuL40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730239933; c=relaxed/simple;
	bh=c3aGZZWMK/cHOKWA9yOCa4lAM9GBMssFkP4NL+CcNd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osJjvM7iSQls2FidltRAXH9aX05r9EUTK4cHcYy/ataVLdfktkJoSCyc/cIgFCW8g8ZA91fYUMlCsSvT0zCoTMNbYJS2qRVE7SGsD1exgrxWy/le7KPu4OOaBfmVTpNsy4oSEXcEHbRMcIl/8q2jBOrWJ4l+7iK+jYJJg9cdBi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gg8bZnyr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so56235375e9.3;
        Tue, 29 Oct 2024 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730239930; x=1730844730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VjldDN7xlB6pZ8+AS+ylEFBMT50QFwGIKzJe3PXu4nI=;
        b=Gg8bZnyrMCvhQqpnuTNhK8gYkBi905b7fpBXC21vLp6iYNjddqruK50q/mYSvG8SlA
         rQJ/MsDQmndYN3Iyp2mhRJQro3OoknNbRF9yVyTtSKltMDq4ak03BAwzhWT4g56i9IUQ
         Sy7OnLTex1R4paH9d8YbWHEJ3PWLlcLpfhLQz5zzoL4d5F6jZeOOruVbYIenEpJVjGGK
         6/XWmXstuT2H5u4xMLG3Tzz/0ULMWi0MndCKzzVnfH7+efr/UdtNQo0ByW5io3e0cT1r
         oPQtt+oCPYMAV6Ir4Jrd3hPcSGZWUQlyDIYeFb5EBGGLXZjKUs0JRqed8vqWUM6ZX/qL
         DXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730239930; x=1730844730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjldDN7xlB6pZ8+AS+ylEFBMT50QFwGIKzJe3PXu4nI=;
        b=prVi7VlW8X2M/54Lsps9ppeTQLu3/LoWMbVVGmBhQ7DN4+cEnuXC6FLbwkKVb/0u1w
         HpE+hb3mYfPkQQrn7+91Tf/2nUkKKWF9+RaXlTnWfqJsiW84LcR7DSIYVhGaJKyqSGjG
         MmsRgY9DOGf2Ci+cZMjx9KppqlZJPMZQ3aiqbgB67Lw37lpcnFTDvmIip5/vQqonZQ9v
         rHPpYUAMXmtMIal22sH0xcC1I4x5pAmQEiNtTnwvN4JK8FTLa63Z/JbAMtFtlxA9t5mu
         Agwi/ynKIr0AVrlKLybr2Q6eBR0UTY9oaoySFlnu9FqVBJ9lpbOVZGvofSyePrTwPTOs
         AFdw==
X-Forwarded-Encrypted: i=1; AJvYcCWW/6p01k12QPWemyShPv5tEiVSjRs/pLHjfJJd2XFBibryWQcExI92er5xjDcW7Pu6CeWIHhXeCShFljY=@vger.kernel.org, AJvYcCX/WB6ZkvHjjOBYDeKvKDme+LFj4NdHKY+5o0riMquTKzoP8g0bOFzn+x41TVm7ZKG373Jweanf4sKieiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4n4cbz8I0KDbAB8crqZTEAxkzAu5FybhRQiMxZYxjMtVrPIiy
	Vk1ZdhTE+Ipe3wIrGYNbDVpy5J7Kekh0Q+nz/P0RzQJp47HNLkvP
X-Google-Smtp-Source: AGHT+IFmuBS4ze6yhyaB5Uff3sHGb2kaV0oX5yBXJL1k6phhewFyPQNSg6fLXKT/pxhemKrzTn/rog==
X-Received: by 2002:a05:600c:1c03:b0:431:51a9:e956 with SMTP id 5b1f17b1804b1-431bb9775c8mr11261545e9.1.1730239929646;
        Tue, 29 Oct 2024 15:12:09 -0700 (PDT)
Received: from tom-desktop (net-188-217-53-167.cust.vodafonedsl.it. [188.217.53.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd97d620sm1970475e9.25.2024.10.29.15.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 15:12:09 -0700 (PDT)
Date: Tue, 29 Oct 2024 23:12:06 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sebastian Reichel <sre@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Julien Massot <julien.massot@collabora.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] media: v4l2-subdev: Drop HAS_EVENTS and event
 handlers
Message-ID: <ZyFdtsSe2lSh5+TA@tom-desktop>
References: <20241029162106.3005800-1-tomm.merciai@gmail.com>
 <20241029205849.GH6081@pendragon.ideasonboard.com>
 <ZyFQx6B6uNepUAoL@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyFQx6B6uNepUAoL@kekkonen.localdomain>

Hi Sakari,
Thanks for your review.

On Tue, Oct 29, 2024 at 09:16:55PM +0000, Sakari Ailus wrote:
> Hi Tommaso, Laurent,
> 
> On Tue, Oct 29, 2024 at 10:58:49PM +0200, Laurent Pinchart wrote:
> > Hi Tommaso,
> > 
> > Thank you for the patch.
> > 
> > The subject should start with "media: i2c:", not "media: v4l2-subdev:".
> > 
> > On Tue, Oct 29, 2024 at 05:21:05PM +0100, Tommaso Merciai wrote:
> > > v4l2_subdev_init_finalize() already sets the HAS_EVENTS flag if a
> > > control handler is set, and subdev_do_ioctl() uses
> > > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > > as defaults if the subdev doesn't have .(un)subscribe.
> > 
> > That will be true once patch "[PATCH v2] media: v4l2-subdev: Refactor
> > events" gets merged. It's good practice to list dependencies, possibly
> > below the --- line (or in a cover letter) if you don't want it to appear
> > in the commit message. I also recommend setting the format.useAutoBase
> > option to automate recording of the base commit in the patch.
> 
> There was some fuzz applying this to the Alvium driver. I've pushed the
> result to the devel branch in my git.linuxtv.org tree.

Sorry, I have some "todo" commits in my tree I will fix that in v2.

Thanks & Regards,
Tommaso

> 
> -- 
> Regards,
> 
> Sakari Ailus

