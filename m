Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B11213637F7
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 23:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhDRWAD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 18:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhDRWAC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 18:00:02 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6702C06174A;
        Sun, 18 Apr 2021 14:59:33 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g17so37679608edm.6;
        Sun, 18 Apr 2021 14:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zKhJxm1RSdj8QfjnKVIMLcDr9NABki4J6DO4XgQvnMc=;
        b=tPPwU9QmEIPjKzQfcYtm/aJ23QFtTBmpvzGfc0Cg50xfNQAbJ/xwlJ9f2d8VSx73bm
         Q3SNZfiaWG+zaYzEinuzoPIPEmLASHZFMfmit2snw+7p/ycucTz1a833PZu06ANqu+Li
         8F0PE03OgHMm4gijvomdQ+fx1gh4Wc2vnEST6yuNx76HShMdw+XrZxZSP3rrZtlwpYpv
         YyDuu9iw6yDe4vyNjUHYCp5WFwUX59yn1TeN5uJJze4h9NbhPUX+NytPRoWKim32BIrf
         A4lV/Cs+0CKiRUXx3qa+G+Zxbc1RP+BH70cbwIlpUdEKl+5n40sp+2WqLZQSdurhUcdH
         ipIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zKhJxm1RSdj8QfjnKVIMLcDr9NABki4J6DO4XgQvnMc=;
        b=jZBWcKSCE4hr1s9Ynzgb4qO2w8NacjAEmAG6vI4fswRaZrTtn5F79dYKt4zDDSG8rT
         aHIm02D8FyU/pPKcDuSse9lsi+madls7RyRBXSELrCXOP25f2mNeNq5luxyn9YTobK8C
         5gnnBGfwY51oIsnFrflNSGo1VIbm+49KNOBEEYhnXs0x8JpOc2PfbL6ICYf6gcewwy9t
         bSrySqZC0MEiH/v1A9JbA/ppQIyWfGAPvq7Lzeyuae7QapLjFXzI6atkhzo+KhqoCRwN
         M1/y1xOw2sySTJ+BQF2YM6DU70RWOStvWGHsAhCSq/Wt/qOzD7cSmvDbrTuYkR84GmhJ
         SA2g==
X-Gm-Message-State: AOAM532DEqGajw12UMQ8I083A1+0ZqmZDlWdQuSPa06JRWSKbjfMlzV0
        zmygPbHWNVxYKUnYWcQu7N8=
X-Google-Smtp-Source: ABdhPJyK9/bLfOB9mpmfDRd9zVLyp67oBp66w/qW+CP3pZFPq58B/Au4BGVVrizvJJFeubWF3ieshQ==
X-Received: by 2002:a50:ec83:: with SMTP id e3mr17225703edr.113.1618783172532;
        Sun, 18 Apr 2021 14:59:32 -0700 (PDT)
Received: from mail ([2a02:a03f:b7fe:f700:7ce8:97a5:cad6:876])
        by smtp.gmail.com with ESMTPSA id l1sm11302084edt.59.2021.04.18.14.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 14:59:31 -0700 (PDT)
Date:   Sun, 18 Apr 2021 23:59:31 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     David Laight <David.Laight@aculab.com>
Cc:     'Mauro Carvalho Chehab' <mchehab@kernel.org>,
        Ashish Kalra <eashishkalra@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: atomisp: silence "dubious: !x | !y" warning
Message-ID: <20210418215931.kbgme42kgnpqbwn4@mail>
References: <20210417153627.GA50228@ashish-NUC8i5BEH>
 <20210417205613.5c1aac74@coco.lan>
 <509f019decae433cab6cb367cdfa6fa9@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <509f019decae433cab6cb367cdfa6fa9@AcuMS.aculab.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 17, 2021 at 09:31:32PM +0000, David Laight wrote:
> > > Upon running sparse, "warning: dubious: !x | !y" is brought to notice
> > > for this file.  Logical and bitwise OR are basically the same in this
> > > context so it doesn't cause a runtime bug.  But let's change it to
> > > logical OR to make it cleaner and silence the Sparse warning.
> 
> The old code is very likely to by slightly more efficient.
> 
> It may not matter here, but it might in a really hot path.
> 
> Since !x | !y and !x || !y always have the same value
> why is sparse complaining at all.

They both will have the same value here and any half-decent
compiler know that and thus generate the same code, so no
worries about efficiency.

Sparse complains because the programmer's intention is not clear.
Was a boolean context or a bitwise context that was meant?
Maybe '||' was meant and the RHS had to be short cut?
Maybe what was meant was '~x | ~y'?

-- Luc
