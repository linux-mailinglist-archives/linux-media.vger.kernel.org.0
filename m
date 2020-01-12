Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06EEA138873
	for <lists+linux-media@lfdr.de>; Sun, 12 Jan 2020 23:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387440AbgALWnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jan 2020 17:43:37 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45307 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbgALWng (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jan 2020 17:43:36 -0500
Received: by mail-pg1-f194.google.com with SMTP id b9so3761476pgk.12
        for <linux-media@vger.kernel.org>; Sun, 12 Jan 2020 14:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+ShsEjNhpOzPOvXgPh9E0OrWn1BweWqy02bpDa5vEPM=;
        b=SjC/0IH9J0r3xXXN27JRYLGa2ug+ywUFhtcLIi5rbf1ym/mrKNUDRdqjp8eBe+bUu/
         Iq/Fy3naihP7QpdenrWV1hRqFlXEHeErCexkeKAhqGpbFC04/m661z/ZOl9L/UwbzTQ4
         ifymvoQW7Ge+le3sHMhHGP4G/a/jgr67JXEqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+ShsEjNhpOzPOvXgPh9E0OrWn1BweWqy02bpDa5vEPM=;
        b=LVuWmBrrvve3GWVzMk3/18eORGhu8QmkHBxUPrdd63DuCq4gSbIadf22BDDbMQur/J
         lmqQOB6k+aBtd7tCcrNE6NkxyoATC+4RUsxEHP/Xk0h4iOUQbxxHPzZ6AcKlCU6sd8nl
         zz8PFLJxGnjzUP0GZ8NKhJzlzHtrRj1kiClkwj0RdedpDrUX/ikx2qeqvmx+DwDMuKKR
         TOWIZCjfZC+KjShbnjHhymiowDYCreVJfc6BUHbeUoto8Lqx06lrZK8eXDuruLtQeWnJ
         09qjLUcaQWWtYXjPRMYD4BX7CC5Sz4ctwR5PJuFGceL31HmYaVCituOtSUsNnA8p6UMg
         nQtQ==
X-Gm-Message-State: APjAAAUmIasdBJ8JLgQGgDv9XXvYZJdo8Accw4C0EbGdcyHZJbflTYV5
        a3SYJdZi3uUnDUxpnfIn1ZJFXg==
X-Google-Smtp-Source: APXvYqyv2IeFysbjNVlQn+TlwieQWIr7YHfIEe6RktGt9ZCJtvHpb4tppM3O/dW6K/TTA/I5KZyS4g==
X-Received: by 2002:a63:3e03:: with SMTP id l3mr17916506pga.118.1578869016123;
        Sun, 12 Jan 2020 14:43:36 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
        by smtp.gmail.com with ESMTPSA id w20sm11285607pfi.86.2020.01.12.14.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 14:43:35 -0800 (PST)
Date:   Sun, 12 Jan 2020 23:43:15 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/Kconfig: add missing 'depends on DRM' for DRM_DP_CEC
Message-ID: <20200112224315.GA5340@dvetter-linux.ger.corp.intel.com>
References: <489bdaae-9b05-2d70-12e1-4fda7899dfc1@xs4all.nl>
 <bbbef09d-6c90-75ba-e480-28365474b1a5@xs4all.nl>
 <20200108174236.GH43062@phenom.ffwll.local>
 <008645fc-29e0-6cf1-5871-dc01898449f0@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <008645fc-29e0-6cf1-5871-dc01898449f0@xs4all.nl>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 09, 2020 at 10:11:48AM +0100, Hans Verkuil wrote:
> On 1/8/20 6:42 PM, Daniel Vetter wrote:
> > On Wed, Jan 08, 2020 at 01:08:47PM +0100, Hans Verkuil wrote:
> >> On 12/6/19 12:26 PM, Hans Verkuil wrote:
> >>> Add a missing 'depends on DRM' for the DRM_DP_CEC config
> >>> option. Without that enabling DRM_DP_CEC will force CEC_CORE
> >>> to =y instead of =m if DRM=m as well.
> >>>
> >>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>
> >> Daniel, can you review this? It's annoying that the cec core is
> >> compiled as part of the kernel when it can just be a module.
> > 
> > Why did we even make this optional? Really worth it to compile out 4
> > functions and some change?
> 
> It's not about those few functions, it's because this enables the CEC
> framework as well (drivers/media/cec).
> 
> If CEC is not needed, then disabling this saves a lot more code than the
> few functions in drm_dp_cec.c.
> 
> CEC is an optional HDMI feature, so CEC support for HDMI input/output
> drivers is optional as well in the kernel config.

The trouble is that once you have multiple layers of such automatically
optional pieces of code, Kconfig keels over: select isn't recursive. So if
you want to make CEC stuff optional, just compile the DRM stuff only if
both CEC and DRM are enabled, and drivers can then select the overall CEC
stuff. Or alternatively have dummy functions at the CEC library, and just
always compile the DRM CEC stuff in.

You could also fix Kconfig, if you have a life or two to spare :-)

Cheers, Daniel

> 
> Regards,
> 
> 	Hans
> 
> > 
> > Anyway the one you really want here is CONFIG_DRM_KMS_HELPER, but that is
> > a selected variable, and you can't mix select and depends on because that
> > breaks Kconfig in hilarious ways. Or so I thought, but other public
> > symbols like this (e.g. DRM_FBDEV_EMULATION) do the same trick. So I guess
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > But really, is all this complexity?
> > -Daniel
> > 
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
> >>> ---
> >>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> >>> index 1168351267fd..e8e478d6da9c 100644
> >>> --- a/drivers/gpu/drm/Kconfig
> >>> +++ b/drivers/gpu/drm/Kconfig
> >>> @@ -163,6 +163,7 @@ config DRM_LOAD_EDID_FIRMWARE
> >>>
> >>>  config DRM_DP_CEC
> >>>  	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
> >>> +	depends on DRM
> >>>  	select CEC_CORE
> >>>  	help
> >>>  	  Choose this option if you want to enable HDMI CEC support for
> >>>
> >>
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
