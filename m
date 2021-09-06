Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355C0401C64
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 15:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242564AbhIFNh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 09:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242607AbhIFNh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 09:37:56 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43357C061757
        for <linux-media@vger.kernel.org>; Mon,  6 Sep 2021 06:36:51 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id g135so4617954wme.5
        for <linux-media@vger.kernel.org>; Mon, 06 Sep 2021 06:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BAhGQaiUNFMd0cF59B0SMEJVdU2tWj7S2/LF/UKcv6g=;
        b=RYSOiZFCjTkL418WGcVP8CEyv+CIL2CdD4Mr508ZMphamikcEWmCQYwh2rSgJSpjIj
         R7adpHoBEoteB8/pbIsVPFHdfwKjhMAEQ8Zpi/YujLxueK6V4bjolnfkAZ1KnlyMZez6
         A0r4Cs6ZxfawdLnGEnPiY1iRnYAkxaIQJceBww/0hDtoj8PxdMAXVK1qOz/VO5b/zzbQ
         CqGWUqebJtpfryjTuDyFV7TfNsN6KW9hIyWluZ5qM1rJV/XDF0+LeC6SvnRl224EEW8T
         HL6BXgWe0j32pQZ/DlegkQa6ym5eozBwadSbkxve+gfZ45jinlFvgqEipB+Eb8PycuDV
         WOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BAhGQaiUNFMd0cF59B0SMEJVdU2tWj7S2/LF/UKcv6g=;
        b=QxzkIZNe2vW8DSad3K9+30MwY0aMZ+GOJMBRz0MCO8Dg5lpEflLWFePmTDO8JYWhwj
         iBqQRIdrqyPxrrqdEYhTrginL5/cnyWFWapBXPXLwVjI55MYnYZiokYjw2ihh8+9fbEa
         vU2msh6ziUxezguB34ThVOFIXigF3LFiJAWB0rKO4aRzU2fRZd9INTgVu4k8TQygx6rX
         v9eAbMnA+reDw4ljXnmvn+OVdsTWw2j4RVJ9QRJYVLhfsAr3rj5E6K5kNnlu6klrU6sE
         0lhm9ret1mt/GPJ8UrGm+oUnk5UiSRoly2pOvUHSYK/PprhXMsJnuTB7mv842fDXA/8w
         c9Bw==
X-Gm-Message-State: AOAM533kyGDl0dp1L5uSs0OLFSHqXsilLtRuoQt3ZgsETZDU3b/OjXYf
        P5NQICnXievxMFHuyRkc/eMsLg==
X-Google-Smtp-Source: ABdhPJxhQ8DPhLD12SafiRBRfu4OijkIySpx5v+sXRBz4eKpz4sMYsbNfXMKlBllmBy+mdlAHXWmwQ==
X-Received: by 2002:a05:600c:3502:: with SMTP id h2mr11686505wmq.182.1630935409867;
        Mon, 06 Sep 2021 06:36:49 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id q195sm7559994wme.37.2021.09.06.06.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 06:36:49 -0700 (PDT)
Date:   Mon, 6 Sep 2021 15:36:43 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mchehab@kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 4/8] staging: media: zoran: add debugfs
Message-ID: <YTYZaxjiKzVurMEF@Red>
References: <20210903191540.3052775-1-clabbe@baylibre.com>
 <20210903191540.3052775-5-clabbe@baylibre.com>
 <YTMJvI1C1OmBgdeI@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YTMJvI1C1OmBgdeI@kroah.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Sat, Sep 04, 2021 at 07:53:00AM +0200, Greg KH a écrit :
> On Fri, Sep 03, 2021 at 07:15:36PM +0000, Corentin Labbe wrote:
> > Add debugfs for displaying zoran debug and stats information.
> > 
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > ---
> >  drivers/staging/media/zoran/Kconfig      | 10 ++++++
> >  drivers/staging/media/zoran/zoran.h      |  5 +++
> >  drivers/staging/media/zoran/zoran_card.c | 39 ++++++++++++++++++++++++
> >  3 files changed, 54 insertions(+)
> > 
> > +#ifdef CONFIG_VIDEO_ZORAN_DEBUG
> > +	struct dentry *dbgfs_dir;
> > +	struct dentry *dbgfs_file;
> 
> No need for these, the file is never referenced and the directory can be
> looked up when you want to remove it.
> 
> > +#endif
[...]
> > +#ifdef CONFIG_VIDEO_ZORAN_DEBUG
> > +	zr->dbgfs_dir = debugfs_create_dir(ZR_DEVNAME(zr), NULL);
> > +	zr->dbgfs_file = debugfs_create_file("debug", 0444,
> > +					      zr->dbgfs_dir, zr,
> > +					      &zoran_debugfs_fops);
> > +#endif
> 
> Wait, when are you removing the files when the device is removed?
> 
> That needs to be fixed no matter what before this patch is accepted.
> 

Hello

Sorry to have forgotten this.
I will fix this.

Thanks
Regards
