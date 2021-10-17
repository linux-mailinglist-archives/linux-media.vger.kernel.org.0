Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572AE430BEB
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 22:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242805AbhJQUHV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 16:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234367AbhJQUHU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 16:07:20 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9DDC061765
        for <linux-media@vger.kernel.org>; Sun, 17 Oct 2021 13:05:10 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id p21so6933022wmq.1
        for <linux-media@vger.kernel.org>; Sun, 17 Oct 2021 13:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=B17ugjfsl4NIFBjvUZANXnVzu0w3U/j7jZVs0/846lc=;
        b=DATvT66RtKTqRcxQ9DWqOw2LxPNEGsz9rz51ZHhCY7hkVrbU3TM8WgLKtqB+1j4NyL
         wOUXP5Pc+qYbRIzl7Tmo3hruNmndRq3PUSPs5fER8llI/32hmJv0tuy87Fx0l4yMBSGJ
         QAcLnAD7mLHM3T/rr5ozBJ6lOdIMuIFy998tMTx1IB6/njjPVVAG3de0W+hPKZy2zyno
         bZALe76UMxF0bMwyhigeepcN8QLEwXmQqVCLv52NpX8Pf9y6tb0gPapICKaYvo7I6yJd
         wBSQ2o112Ll/ch3V1LYR7ZpcNLZ9lq6kEIutd5V5Rs7ZmMSuZRHpem2O3Fl9FiffYya7
         JXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=B17ugjfsl4NIFBjvUZANXnVzu0w3U/j7jZVs0/846lc=;
        b=vH5BPVrWRoPydCosuGZMNaEE3fbd0TNYSnjRWFnWCNcW9BsG5mMGo/LhJ+4D7p51Q7
         c0oAtWs8VCts1nnGkT1DK+PX6RHA3aMUxHiA3z2egknF/xm/sgVa/qZaAFe+Fbye5VNU
         aed3RVODdOaBMBm0z1YJ6WPvMOTZO9WUHOcEeErDffjoH5jCACYb4R5rP58jn0J9BDeY
         3Ud6CIJRHF/ETdJxJ1NGbtRx1BkttAH3vPl3DRKGZxEa02Bd4Tpb6VItXaqrsDcVNUiQ
         isHBEaTiIDpGSRg9kMvlMgZ8br0Y59X9/B2zDKt89ZWp4rkEigN1eP/4presXSaYQJ3I
         j9qw==
X-Gm-Message-State: AOAM5301Krrb0rpGPz6BePxMJQOKhJPfUPCzqN04FnGGpMVfptC2DeAm
        tJoMAFeE66+6cAaRohyp/bOS2A==
X-Google-Smtp-Source: ABdhPJwcDtpPg2mxmJM2XYwjmyUOwrYqD4Lkj7YPm36EiMTbS1W1XW9FfS2RUez7WsF+rqNC5j9qSQ==
X-Received: by 2002:a05:600c:1989:: with SMTP id t9mr26088433wmq.48.1634501108682;
        Sun, 17 Oct 2021 13:05:08 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id z6sm10909246wro.25.2021.10.17.13.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 13:05:08 -0700 (PDT)
Date:   Sun, 17 Oct 2021 22:05:06 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v2 04/10] staging: media: zoran: add debugfs
Message-ID: <YWyB8kwsqAvHMuhb@Red>
References: <20211013185812.590931-1-clabbe@baylibre.com>
 <20211013185812.590931-5-clabbe@baylibre.com>
 <20211014073752.GM8429@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211014073752.GM8429@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Thu, Oct 14, 2021 at 10:37:52AM +0300, Dan Carpenter a écrit :
> On Wed, Oct 13, 2021 at 06:58:06PM +0000, Corentin Labbe wrote:
> > +config VIDEO_ZORAN_DEBUG
> > +	bool "Enable zoran debugfs"
> > +	depends on VIDEO_ZORAN
> > +	depends on DEBUG_FS
> > +	help
> > +	  Say y to enable zoran debug file.
> > +	  This will create /sys/kernel/debug/CARD_NAME/debug for displaying
> > +	  stats and debug information.
> 
> Why bother with a CONFIG?  Just make it always on?
> 

Hello

I love to provides choice to user (and so avoid a dep on DEBUG_FS), even if I think I am the only one remaining user.

> > @@ -1286,6 +1321,12 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  
> >  	zr->map_mode = ZORAN_MAP_MODE_RAW;
> >  
> > +#ifdef CONFIG_VIDEO_ZORAN_DEBUG
> > +	zr->dbgfs_dir = debugfs_create_dir(ZR_DEVNAME(zr), NULL);
> > +	debugfs_create_file("debug", 0444,
> > +					      zr->dbgfs_dir, zr,
> > +					      &zoran_debugfs_fops);
> 
> This whitespace is weird.

Definitively Yes, fixed!

Thanks
Regards
