Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EAB483848
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 22:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiACVTZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 16:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiACVTZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 16:19:25 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83EAC061761
        for <linux-media@vger.kernel.org>; Mon,  3 Jan 2022 13:19:24 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id n30so28394531eda.13
        for <linux-media@vger.kernel.org>; Mon, 03 Jan 2022 13:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o05RsrO4m4BGFiQn27xtfLBs7+b0jPGjINDxV/JyYwE=;
        b=dkY5fCl1EK5tcaQBMP/6XrAgX1g00zPn71vlXwiQrnbbgRBcYXRJZx78gxBl8Fe4TJ
         f5WNxRML5F9F6M4dLrLiGe89RVuoYmFg+TmT4brmktWhYuw6PA2lNHZ2uXfd6hbF1kjo
         MsogWXA2SleuLxyfC+tNyhIrQnPe9OQK2o6lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o05RsrO4m4BGFiQn27xtfLBs7+b0jPGjINDxV/JyYwE=;
        b=SNJbmT3+vPbpHedz4QfTgqJRPuagQkDhPrBM1Tb+3TSQ2kQyHD5qKI1bWuYEyv65fP
         zPm4bGiGYhfPR65+BL1adVRgahmomzauaYht23BBCTq5KOWXXs56EqbKLVl/ALYe5qHP
         PCmYOGlASWQ+qbWOBErv0QNxEEFo+aZbg79BrMohOuZshUeLb6aCEcpU0lReIXPJ2gvJ
         p5EArrTWazb6VTdvrX5dAVGBXFNxO/f/Vv2nvHhHTgKkJnKaadE/7qIz35eR3IpCcdQ0
         7UHSrEJqXlEYWTgiH+t3tyDY5v+5uQ/dMT7RXsGptdsSgDJWi9m/UBeuSOXgxvD5i/fm
         c3Tg==
X-Gm-Message-State: AOAM531nOkmiw7igqwhYLeuzpS6+YZvquoRhGU7FcL5z+xnxNGsoA9TR
        PF37E+2/io370+igHKfaMCb+Ww==
X-Google-Smtp-Source: ABdhPJzy7Y4n5Eg4dIOuweUfw2hNfvZGAeOYsTAmhYHeLHFKthQ1I/qWemWV14g+5LwIosnX6Tx2IQ==
X-Received: by 2002:a05:6402:8d9:: with SMTP id d25mr45212665edz.283.1641244763379;
        Mon, 03 Jan 2022 13:19:23 -0800 (PST)
Received: from karbon.k.g (78-83-68-78.spectrumnet.bg. [78.83.68.78])
        by smtp.gmail.com with ESMTPSA id ho9sm10945914ejc.86.2022.01.03.13.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 13:19:23 -0800 (PST)
Date:   Mon, 3 Jan 2022 23:19:21 +0200
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v2 0/5] adds ovm6211 driver to staging
Message-ID: <YdNoWZ/HddvBhJ4T@karbon.k.g>
References: <20220103110922.715065-1-petko.manolov@konsulko.com>
 <164121596292.3986460.16005535544209529901@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164121596292.3986460.16005535544209529901@Monstersaurus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-01-03 13:19:22, Kieran Bingham wrote:
> Hi Petko,
> 
> Quoting Petko Manolov (2022-01-03 11:09:17)
> > v2: Removes an unused function (ovm6211_set_pix_clk) and this patch series is
> > now based on media/master; Didn't receive any comments about the RFC version,
> > thus i assume everything is perfect... :P
> 
> Did you see
> https://lore.kernel.org/linux-media/Ya9XHiz%2FPm4CjQ13@valkosipuli.retiisi.eu/?
> 
> Sakari provided quite a few review comments to consider.

Nope, somehow his message has slipped from my attention.  I'd like to thank
Sakari for the thorough review.  This is my first v4l2 driver and i have most
likely made a lot of mistakes.  I'll address all his comments in v3 of the
series along with some elaboration on my part.

> I don't think we need to add new sensor drivers to the staging directory which
> would simplify your series quite a bit, and Sakari also stated the ovm6211
> KConfig and Makefile entry should be in the patch along with the new driver
> code (not in staging).

This is the exact opposite to what i've done for the netdev tree, where each
change should be in a separate patch.  Anyway, i'll follow the media tree rules.

> So you would need to refactor this series to a single patch adding the driver
> do drivers/media/i2c/, and a second patch which adds the DT-bindings
> accordingly.

I am not sure about how practical the DT will be in this case.  The sensor was
used on a custom board and a rather specific reset pin wiring.  I've tried to
remove this logic from the driver, but it is still reflected in the DT that
we've been using so far.  I've got to think about this one some more...


cheers,
Petko
