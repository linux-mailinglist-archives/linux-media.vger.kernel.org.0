Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C902748E6
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 21:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgIVTPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 15:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgIVTPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 15:15:42 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856BDC061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 12:15:42 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y15so4502044wmi.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 12:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8JHPz5MB4op1E/QMo/ofzAV1pf8fpFit4gQe97vjeBo=;
        b=y0SiXBD6J9NQ3M9xk68ZG4Xy3Vql64rKBE4QlYvaUpTZR4UNaZVB9grChIR0qCoYrF
         pcwzY9r604nbPKLj+stTs2aQeSBn+yNB1rxixsVa1pezlXX4H8T3Qs6R2G5/QhinA1fg
         u0pXV6xFNdCwFVZM18ZnPsuJmqfCqlYzXxyZNJq2MuofyiOsZXcg97xpPuGD9BqqQsxD
         tvBlsQt7k6Q/LYqZ2IRBt4HLGOJQw6Xd0PxxFJjA3heVvnUnL+80mEzMfFurEg8V+zks
         pFmAuX7DMfiDEyJu0DOIa88CBYThiA4GZIDLkvr6/OTXrqTYJs0rS8npy8rXPkTW/eoo
         mb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8JHPz5MB4op1E/QMo/ofzAV1pf8fpFit4gQe97vjeBo=;
        b=Bs6V3wRcuCr1Lej7/fwpMIdvAuR8xhqW/FCXQ7JLqT8SnvrHAuI6NlshDiHYuogl1j
         +wuYA9CJrVEwwOBbpOBscr5d5sPHtzWLa9jwnyGhTv/lx14p/QB6sg0iHYKRV/eYXhPQ
         hgD43+y3X4Lnef714l8lJoGlRq6bwo3AIMTS+RJ/IuvnDaA2nYujip8ZYWm8pJcp2097
         UGcskDkfnsHeIIyLMTi6PL/0c1RHJ6Aya9EX/xTibSDimC2LKsWkGCPINd7qygctbaul
         nnxVUQ8YARqrcXFCqHuGncPsTrvwb3N5PCeRqLwnbtHGVI40ece+YiBXYwf5M2glneBC
         noEA==
X-Gm-Message-State: AOAM5302yJ9kFEAFXS0Pjq7M1Zw8cO6sIantOVETce0KnR2+voOS/tCl
        IOx6uEg7YdI0pHXWzPXThlxasA==
X-Google-Smtp-Source: ABdhPJwED3IQ4OaZXiJzEgrIZmn98ae0TlXWdgza8puSbYb8D8lQDHqM6/GWZ3QBDm+UqK2ygsLX4w==
X-Received: by 2002:a1c:4b17:: with SMTP id y23mr2536272wma.162.1600802141131;
        Tue, 22 Sep 2020 12:15:41 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id l5sm5915697wmf.10.2020.09.22.12.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:15:40 -0700 (PDT)
Date:   Tue, 22 Sep 2020 21:15:38 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH RFT/RFC 01/49] staging: media: Revert "media: zoran:
 remove deprecated driver"
Message-ID: <20200922191538.GB12261@Red>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
 <1600683624-5863-2-git-send-email-clabbe@baylibre.com>
 <20200922051601.GC29480@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922051601.GC29480@infradead.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 22, 2020 at 06:16:01AM +0100, Christoph Hellwig wrote:
> > +		fh->buffers.buffer[i].v4l.fbuffer = mem;
> > +		fh->buffers.buffer[i].v4l.fbuffer_phys = virt_to_phys(mem);
> > +		fh->buffers.buffer[i].v4l.fbuffer_bus = virt_to_bus(mem);
> > +		for (off = 0; off < fh->buffers.buffer_size;
> > +		     off += PAGE_SIZE)
> > +			SetPageReserved(virt_to_page(mem + off));
> 
> This messing with SetPageReserved needs to go away before we bring
> back the driver, even for staging.

The whole old buffer management (with some virt_to_phys, virt_to_bus, SetPageReserved, etc...) is removed in "zoran: convert to vb2".

Regards
