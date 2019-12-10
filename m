Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46251184FD
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 11:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfLJK0j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 05:26:39 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38119 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbfLJK0j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 05:26:39 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so19390566wrh.5
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2019 02:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=97xF32EIBIFJNHB3mGMcUkFGhGxvatxTdrICNm/qrcc=;
        b=f41oTppPt+Wg3AOVTt+B2xwxkAwtU0Z+3cEx9m09thFrxJTFSHKou4Mh3JfEbLY7ty
         zxWTSZnBiLVa9g6ck5xV0ClbF0FLM57+E9BTltMupGvFAeE3tVK8M61Asm4hSx+BuEyA
         AzI2bZzTZkDyZdPJR2HxPfMJsakbSeRZcXkDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=97xF32EIBIFJNHB3mGMcUkFGhGxvatxTdrICNm/qrcc=;
        b=IcQxk22eBzZnVxH2a4dXwyedBpyfYz1Nj/2G94hXE5aMfCfphxWQgbD/VVJgfW0WQd
         dlijqBVGoLt3nHRm0NGjvfUZB446E3Ygd5xWJN6xJgqELVlLUYuwZw2K1woLez++MFcg
         59E3ufP078ah/M3IkC/iCQ9F7wYir5wfIviGZJ4ZEuAHzEYIik8AAiUkhWmmFIMbEjLf
         HSfN2ci0bMcfHexey7x/wN2WN+qQ32XABc6OYrspbf7VVCBasyidcgfgdQNwDXTDtmVe
         f01Sgm78Viwf9OnBWux5TyExYgMVmVC04dlFGyHahN47JWY2/DyS/C/QIr2HpjGYp0ov
         lnwQ==
X-Gm-Message-State: APjAAAValRGAy8luwREtOJBQ3Y4/IGiAuIP5Ff1GbOuFwsJ1foj5Cwhm
        0gGitfZkFZaNCDLriqh7n8+tug==
X-Google-Smtp-Source: APXvYqyisjRA8OXYGasr47OpUHsgLNSuGGT4qkK6eh9dxEHb8YE7Cub1BSpya6wB8Hb82X3rE8xaZA==
X-Received: by 2002:adf:e609:: with SMTP id p9mr2220769wrm.397.1575973597557;
        Tue, 10 Dec 2019 02:26:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
        by smtp.gmail.com with ESMTPSA id m3sm2748694wrs.53.2019.12.10.02.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 02:26:36 -0800 (PST)
Date:   Tue, 10 Dec 2019 11:26:34 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Match on dma_buf|fence|resv anywhere
Message-ID: <20191210102634.GR624164@phenom.ffwll.local>
References: <20191204215105.874074-1-daniel.vetter@ffwll.ch>
 <20191205155111.GA1914185@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191205155111.GA1914185@ulmo>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 05, 2019 at 04:51:11PM +0100, Thierry Reding wrote:
> On Wed, Dec 04, 2019 at 10:51:05PM +0100, Daniel Vetter wrote:
> > I've spent a bit too much time reviewing all kinds of users all over
> > the kernel for this buffer sharing infrastructure. And some of it is
> > at least questionable.
> > 
> > Make sure we at least see when this stuff flies by.
> > 
> > Acked-by: Dave Airlie <airlied@gmail.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Pushed to drm-misc-fixes.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
