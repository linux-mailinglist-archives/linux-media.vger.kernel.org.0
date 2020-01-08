Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00626134999
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 18:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbgAHRmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 12:42:40 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46437 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbgAHRmk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 12:42:40 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so4253301wrl.13
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2020 09:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O+A+WGxi0nAa4MDN7MlwBOCpZtr6xwChxZp9hyHT+/4=;
        b=OJ1/VRTldJ4+N7z9YwHfSDLy+mLK8xLKAYujtuNwaot4RfR5gs/dKu3d806jV/2zDS
         ARhKuDrb1kVXFY1KGKLaEyftVU4+zGNgJPTNUwBJ1b43LSeTrkYDSm1tT+Zmyjy2tAf9
         TaOz25CinXMFGGjxR009IxpoJXF64ON1ooIKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O+A+WGxi0nAa4MDN7MlwBOCpZtr6xwChxZp9hyHT+/4=;
        b=b2lJwNd5o5lVmt/Xv7FuYDhYcSpD5DHAdZj4GDkbZopN90rUKwLhc5L0ZVuzPh0jI0
         8XZaGZcP6fOdLXIKaMzjpW5b6/oXiCvMnzBn9ma2pv99eN7jJpkuf2+WnEmhRUGl9mLL
         L+IBqtxzJ9qSu6nTNJePteSoO1gZ8z5zBhkgtXBhA0mkbH9ibkrR0w6s9wMslmpBCxbc
         929Pw8t35vgSd4syI3is0KQI7biWmj3YNtLZ/MkJM4ye5BFLcMYOZiRZuBv6FKJUbalU
         3/OTtxW7bjG6HFIihBJ6pIH79edvlRqDCciY/fk4WX1wp/PS5T+LEgiIHCRxPJVLvKVk
         tanA==
X-Gm-Message-State: APjAAAXrm4EP52m0Pn1rcROeN00R4+p/XaQgFzQkae/dFWclenYIVa93
        uOZ2WH+tw3SNm/pEpAHvMQnc+w==
X-Google-Smtp-Source: APXvYqzw5sExskfpGMJwohq6vsHaqb5uRL/OXFV5TaohyzQzIUisOAsudGz8Ub1PVd9wrc/rArLSCA==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr5658429wrr.309.1578505358959;
        Wed, 08 Jan 2020 09:42:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
        by smtp.gmail.com with ESMTPSA id q11sm5031155wrp.24.2020.01.08.09.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 09:42:38 -0800 (PST)
Date:   Wed, 8 Jan 2020 18:42:36 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/Kconfig: add missing 'depends on DRM' for DRM_DP_CEC
Message-ID: <20200108174236.GH43062@phenom.ffwll.local>
References: <489bdaae-9b05-2d70-12e1-4fda7899dfc1@xs4all.nl>
 <bbbef09d-6c90-75ba-e480-28365474b1a5@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbbef09d-6c90-75ba-e480-28365474b1a5@xs4all.nl>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 08, 2020 at 01:08:47PM +0100, Hans Verkuil wrote:
> On 12/6/19 12:26 PM, Hans Verkuil wrote:
> > Add a missing 'depends on DRM' for the DRM_DP_CEC config
> > option. Without that enabling DRM_DP_CEC will force CEC_CORE
> > to =y instead of =m if DRM=m as well.
> > 
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Daniel, can you review this? It's annoying that the cec core is
> compiled as part of the kernel when it can just be a module.

Why did we even make this optional? Really worth it to compile out 4
functions and some change?

Anyway the one you really want here is CONFIG_DRM_KMS_HELPER, but that is
a selected variable, and you can't mix select and depends on because that
breaks Kconfig in hilarious ways. Or so I thought, but other public
symbols like this (e.g. DRM_FBDEV_EMULATION) do the same trick. So I guess

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But really, is all this complexity?
-Daniel

> 
> Regards,
> 
> 	Hans
> 
> > ---
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 1168351267fd..e8e478d6da9c 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -163,6 +163,7 @@ config DRM_LOAD_EDID_FIRMWARE
> > 
> >  config DRM_DP_CEC
> >  	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
> > +	depends on DRM
> >  	select CEC_CORE
> >  	help
> >  	  Choose this option if you want to enable HDMI CEC support for
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
