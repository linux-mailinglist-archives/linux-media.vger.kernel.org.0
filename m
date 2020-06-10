Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB871F529A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 12:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgFJKs5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 06:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbgFJKs5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 06:48:57 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369EFC03E96B;
        Wed, 10 Jun 2020 03:48:57 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b16so928700pfi.13;
        Wed, 10 Jun 2020 03:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cTTPoX0KpmupCOXvZZmijW76miLqR7hhHk9arTeotRY=;
        b=Mciw29rg7ScHOgwOlqOT0M47c03O7TGw/FA2VhlMFCokYF7e0tnoWc5nGFRcPlfn6W
         2Tcb5fLPyjjLrDQNS1DDbiABmsXWDr2GzsQ5z1uJgjpD7F9ocK4d/eKzAvLg2SDpt0xf
         H7X4M5CEssNINyky8/uszDU6JHXeUJUobI42PiYN6fPvaJmZdEhdruYF3Vndx6UkAmiy
         Zg/kidsuf12g5pfDhJu7ecv8ah7CsGKE1m+wGa7jxrbksyszROWOV0Dh5x/r3RDJ+iXq
         OLZUrwejsSXCBGtIewd2iBoFoG7oy2HY5ooD9skkmhIq2sJqrZ68m6A5DCeMPeyMdC0d
         MAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cTTPoX0KpmupCOXvZZmijW76miLqR7hhHk9arTeotRY=;
        b=DnjBfSvnDmmQ5usMVHeGNVrtUocFqqiUpR2Gs/aeIUSyMuaef519c6I53JAoNthRPI
         67Wby8jqz8PcehYm0w7aIhKuDsBXHWssMLrZ6JejgoLLBytSQqJrzbdUuunIhQLtLxo3
         CuT64i787iIcRUSQRsXjhnJ2j3gQciWikslpclAyttUT7l4HJNjAHzlsSZ8SPGjY8n+D
         PExWwIrb3pIOQEzKC8GPcWmA6Gcs/GQDsfKeklYOH8Z0fCvO0EYZaKzV96jp6iY/6H1f
         i91c96TXmg9kNbcuvz172MHD81WFhCQ17eUADhW9U/ZHLpyBM6qjihLIIafnHwJnqtQ9
         fXOg==
X-Gm-Message-State: AOAM532ft3ChEPIPt1xi2WkXRBQMH8gky/JNxRXWfsfIIWmF2+XTj3DK
        jUO8SjI1rrMQhQDmgDtG7Q0=
X-Google-Smtp-Source: ABdhPJxZAYV39dsqkPZAZPTGiSmiln4luYD5dHt4wG13n8+VbDLKOURxeVt9nI4BPf4TbLAGh6j5ug==
X-Received: by 2002:a62:9255:: with SMTP id o82mr2175756pfd.218.1591786136726;
        Wed, 10 Jun 2020 03:48:56 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id o16sm10729138pgg.57.2020.06.10.03.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 03:48:55 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Wed, 10 Jun 2020 19:48:53 +0900
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] videobuf2: always re-init queue memory consistency
 attribute
Message-ID: <20200610104853.GB271650@jagdpanzerIV.localdomain>
References: <20200609060417.8066-1-sergey.senozhatsky@gmail.com>
 <d1ebdb9b-ceea-3582-831d-7cef5134d8f9@xs4all.nl>
 <CAAFQd5C=01Jpmn3TTEhPWufg8f72ta9ZUjeRG2VCB8F9NPwvJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5C=01Jpmn3TTEhPWufg8f72ta9ZUjeRG2VCB8F9NPwvJw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/06/10 12:17), Tomasz Figa wrote:
[..]
> > Is it OK with you if I fold this patch into the original patch series and make a
> > new PR for it? I prefer to have a series merged without a bug, rather than fixing
> > it in a final patch.
> 
> I believe this didn't introduce any real bug, because dma_attrs would
> end up used only for MMAP buffers anyway. Still, the current behavior
> could end up being confusing for whoever has to deal with vb2 in the
> future, so should be fixed.

This also requires user-space code that constantly use different ->memory
types and ->flags in inoctl()-s on the same queue.

	-ss
