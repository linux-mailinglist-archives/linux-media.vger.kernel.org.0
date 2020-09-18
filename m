Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0236126FACC
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 12:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgIRKm0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 06:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgIRKmX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 06:42:23 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2003CC06174A;
        Fri, 18 Sep 2020 03:42:23 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id u13so3251725pgh.1;
        Fri, 18 Sep 2020 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BFicauIeUOrnsvlqKGsQXozub1xATSeMYMtEaHTT4g0=;
        b=e0N7ia3fLHfHAR649eYTpypJn7blOCM9GO7orPVtX4EmgoJ/6YjpkWeMy/qKEWECAm
         0fRLFnhHrZB5dzFkDp7ZQEmmfJrXL3zjd+yv6/3X7SQRMDiL/hVr+YX4Jskk4kupex5I
         jl6iqE9LF8APZdFtexoFdPB8M99bnRBA/Av4O8h0X/1jCGyW+7CxJ4OxdNQaqWK2WZ34
         FgiMj88af5Ia7E1mwPln+bLBuEZpsmZweBi11knwlFnyq48APTgQeVNi/l7E+nImmDvp
         h9Fu42sVf3gSaCedHj+Qeq4ixte0Iq2g02tqvhmh0An8V4FlsdpxN0wCdDHDN9QIz9jN
         yevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BFicauIeUOrnsvlqKGsQXozub1xATSeMYMtEaHTT4g0=;
        b=EHOcfp2yPuKaEsGDQE8/kERDjeJKInNW8W1vp4QwCp14AQqW4M+kZ7QRBxXn/Sn/QD
         h5/niJLR79gcmbuq1NU2kGbaJQGIVI0mciRWGrzqDgvIbcGQz+v/4t8uybrc2sl7PEtt
         pcibFb2y+B6xZ5eFrkY9CQO8kSZRIdg35VIFIIf/XGSxrF2BICicn95gwb12AqqcJpkB
         Ntsd1O2ozjV80CNYgjNPVyTMDf3JPf5Z0s3Vt3N9HIcK3R//E3lPxlnqNLB8YUZSvIbN
         dpTFxiXi0rt6h2udVgK2XBj2HsOHARDUGVGdUI6XmHpsX9uRj2uc3vD3hhC8SiDkjoTO
         cWpg==
X-Gm-Message-State: AOAM532Zeg5Dsr3xDyFi3lMnpOT9RHbw97tijW8AF0WD0zmxWHDtXi3G
        zDwmUFwcfQMFogu4DugA9k/p+Eb6ZMY=
X-Google-Smtp-Source: ABdhPJxmkSH2bsqdT6f0XKAxVeedtX4lm17YBE1bMJENRq8W21F6cXNJfF18OFoYIYusjEAAEH7J5Q==
X-Received: by 2002:a65:42c2:: with SMTP id l2mr5480207pgp.61.1600425742614;
        Fri, 18 Sep 2020 03:42:22 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id bj2sm2492747pjb.20.2020.09.18.03.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 03:42:21 -0700 (PDT)
Date:   Fri, 18 Sep 2020 19:42:20 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uAPI: buffer.rst: remove a left-over documentation
Message-ID: <20200918104220.GF3049@jagdpanzerIV.localdomain>
References: <2fd3e12d82de1e0a1ee2f96dedc4d4cbe771c979.1600327262.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fd3e12d82de1e0a1ee2f96dedc4d4cbe771c979.1600327262.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/09/17 09:21), Mauro Carvalho Chehab wrote:
> Changeset 129134e5415d ("media: media/v4l2: remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag")
> reverted an uAPI flag, but it kept some left-overs at the documentation.
> 
> Drop them too. This should solve this warning:
> 
> 	Documentation/userspace-api/media/v4l/buffer.rst:692: WARNING: The "flat-table" directive is empty; content required.
> 
> 	.. flat-table::
> 	    :header-rows:  0
> 	    :stub-columns: 0
> 	    :widths:       3 1 4
> 
> Fixes: 129134e5415d ("media: media/v4l2: remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks for fixing this up.

FWIW,
Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss
