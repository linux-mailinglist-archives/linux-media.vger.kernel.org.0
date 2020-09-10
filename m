Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0CB264375
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 12:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730572AbgIJKOr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 06:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730588AbgIJKOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 06:14:35 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2044C061756;
        Thu, 10 Sep 2020 03:14:34 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id md22so1101399pjb.0;
        Thu, 10 Sep 2020 03:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mlowAeJMKqkcl7Mu0ko5uXG5nR+oH8UXp7jLCOmoM+M=;
        b=evFgao75kuYNkt4R4dISzYava/Hdxgc2lluO6j07su8K+myo53OpZtCtl37/d5cS92
         iTYUyvuFwZguUgUCQ2Q4twgDdnkWDU1+3wqUmETya2d9shKYYHhVbJRJ29NohU3zjfbO
         0hPe/FN/pykg2pFbX/9Bn4tXEhjHqg+QWc5DyPFqJ0zpcHM/nZIFXuuYDDrSkfP/oxOm
         zQt+2mseYJF7JJSuCb8qZVdvvupT5bMsJLpPUha1ya3oe3CnDCzRG2+cfjdVkfTTMU2l
         RAFklVbQz5EJhk10yu/kZWq60PprxrPUvu4Y5jYbDSOcErUlJSrXQI783WXagVbizV5q
         RZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mlowAeJMKqkcl7Mu0ko5uXG5nR+oH8UXp7jLCOmoM+M=;
        b=BWtKavMvRfuGuVIEvNwguscdJYRlLJ98KNbLoY1iZLUQuWzdU1WyS9z/XQqLIDT+1c
         lhOoOEjXM+sgzrrXlt07sq3vbne6uWU/NT8xZm6nXKAb9USdkGjZ580ANAN1hrwmg0Ae
         GJT4N8ADMjnj/EzCfTakl+kDijLeGjAfnDnRI9NqmigGKBLM3BeQZ8QwsxX5vSfDz8kt
         TuhvLFETUXO956MgDA+TVFTz0uGIx4N+OOIoprgOA0G/tGyvIDvEszeLq8zaM+ViRpKM
         6CkH2jbKis1z0vz797CQMDTs6UPIIVQkYNiZvNwLFq9Qfa87c406pN1/AYcQr2VdFX3b
         /wfQ==
X-Gm-Message-State: AOAM533XYS0C4xLRK+nj6jPkXqbe6c4kauJIWkuunbdqwEaYJzOcfK1a
        Sd3wMDT3ZRs7wHFSSJET9nQ=
X-Google-Smtp-Source: ABdhPJwG0X9iBwFstxXRg+m9cgl4mftTgFYyg5wVNa4+LLL10Xlckr4+OdMweuV+oonbp2xPkWTYOg==
X-Received: by 2002:a17:902:6ac1:: with SMTP id i1mr4961217plt.60.1599732874441;
        Thu, 10 Sep 2020 03:14:34 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
        by smtp.gmail.com with ESMTPSA id t24sm4723914pgo.51.2020.09.10.03.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 03:14:33 -0700 (PDT)
Date:   Thu, 10 Sep 2020 19:14:31 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
Message-ID: <20200910101431.GC97481@google.com>
References: <20200820044347.GA4533@lst.de>
 <20200820052004.GA5305@lst.de>
 <CAAFQd5CFiA2WBaaPQ9ezvMjYZfNw37c42UEy9Pk7kJyCi1mLzQ@mail.gmail.com>
 <20200820165407.GD12693@lst.de>
 <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
 <20200901110617.GA13232@lst.de>
 <CAAFQd5CmPVSxmZJVn7HnNUn8srZbAbnfzpNMYw3KcDzn7xD2cg@mail.gmail.com>
 <CAAFQd5BDh05DNPShr54opY2GyY-FcH7g8=V2t4xBwz0OwRu9xQ@mail.gmail.com>
 <20200910094921.GB97481@google.com>
 <f92991e1-e0d7-69ca-9541-1546bb139dd3@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f92991e1-e0d7-69ca-9541-1546bb139dd3@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/09/10 11:57), Hans Verkuil wrote:
> 
> Perhaps, but this patch is meant to revert *all* changes relating to
> V4L2_FLAG_MEMORY_NON_CONSISTENT. We don't want to have unused fields
> in the public API.

OK, would you prefer a squashed patch for all the kernel rollbacks and
cleanups or a patch series?

	-ss
