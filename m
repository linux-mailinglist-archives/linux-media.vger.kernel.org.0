Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269B333FE51
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 05:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhCREr7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 00:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhCRErf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 00:47:35 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4B3C06174A;
        Wed, 17 Mar 2021 21:47:35 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id m3so640312pga.1;
        Wed, 17 Mar 2021 21:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9NCkW2IVPVUoHJfhuX15I+pwmGGe0JBtiOOfzHJHs1M=;
        b=SkI7FYD9kHEeycjHKe6FI/GwpmopjMjhlJKlCiBO2+1ipmekVbl35uQrtHCMhh3OG1
         nodBwEPw1WjflNJYNuyk0T5QoGxb5P31NjOEexMk9R7F9onDem8THZH8k5eHScMC/ncQ
         0NRWMLku0gN3mb93Jn+LC7SPFtUUHyR2RlZI4D5FmFq+7PrzFm9Tk7uLh7XWrUHUzwKT
         azUmdX3SlI5zmG1ErusD0GmicRK+vz4Ug+V6uy5dYkDL5Vwdw0l4NVM901n482dU0YEF
         PrH0mwDipjQGFf22QDUSHha8mjNGQmW/+ItmO86a29W0xq7utAvam3vTeWSTkytJMEG1
         wJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9NCkW2IVPVUoHJfhuX15I+pwmGGe0JBtiOOfzHJHs1M=;
        b=d7oTLBuoRt1zyqr00mTnHRGmMpzpg2XG5g4skCRw0CLqVbohk9r5HTQdhgPTtCZDx9
         bMLe2E91mtlc+iMHjb/mHGeL9Sg1PpoYdSUtlqw7bPJsVgPbxEqQt9zLLsRXw0rCVz6Y
         hollpvMbXIhqYACbr8wYN+eTMQQYFml4b3b3fHdegDkzOAbgBA+DIyGKiG8IEImKmFRk
         0q80cwwHvOtbPgvDhu6132vvERFl9REL/Cc+VlUIs+BNHEr0cgGtD1+g8A0ZSX8fsgi5
         RNXFTkQfCX5+ALsy9RxQUEV5agwNnOXygZogNHS0mhsfrqmkK1EyTwbW5GOcFYhfWNXC
         uAhQ==
X-Gm-Message-State: AOAM532w0myLaKPk0Tv+7jIry7oVVfLwmXgQYd6JGrL/34sqPPC0LEU/
        pIE1ygXUPoFW1ezyq8ItTKY=
X-Google-Smtp-Source: ABdhPJyBtP/eCT3QgYD2K1j7L0sY8+nELm1QgiH5yMKBfY9+FwjV8dGeEK9szB7L5eS5mjghMnHwSw==
X-Received: by 2002:a63:4652:: with SMTP id v18mr5194227pgk.87.1616042855262;
        Wed, 17 Mar 2021 21:47:35 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:b48f:f050:bdc5:eb89])
        by smtp.gmail.com with ESMTPSA id mp1sm604278pjb.48.2021.03.17.21.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 21:47:34 -0700 (PDT)
Date:   Thu, 18 Mar 2021 13:47:30 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCHv2 3/3] media: uvcvideo: add UVC 1.5 ROI control
Message-ID: <YFLbYjm0VyzaEMkr@google.com>
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
 <20210208051749.1785246-4-sergey.senozhatsky@gmail.com>
 <CAPybu_10Uz0Eb2U5ZohNV1t0gf98ZBZOa3KFCzdi1RJ0k3c1yQ@mail.gmail.com>
 <YFFiizDjNBMG3uI+@google.com>
 <CAPybu_0ruoc-w3402j-vVNs2-xq8=-_XzVKSxiG+iuyB=eNimA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPybu_0ruoc-w3402j-vVNs2-xq8=-_XzVKSxiG+iuyB=eNimA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/17 08:58), Ricardo Ribalda Delgado wrote:
[..]
> >
> > GET_CUR?
> yep
> 
> >
> > > https://www.kernel.org/doc/html/v4.13/media/uapi/v4l/vidioc-g-selection.html?highlight=vidioc_s_selection
> > > On success the struct v4l2_rect r field contains the adjusted
> > > rectangle.
> >
> > What is the adjusted rectangle here? Does this mean that firmware can
> > successfully apply SET_CUR and return 0, but in reality it was not happy
> > with the rectangle dimensions so it modified it behind the scenes?
> 
> I can imagine that some hw might have spooky requirements for the roi
> rectangle (multiple of 4, not crossing the bayer filter, odd/even
> line...) so they might be able to go the closest valid config.

Hmm. Honestly, I'm very unsure about it. ROI::SET_CUR can be a very
hot path, depending on what user-space considers to be of interest
and how frequently that object of interest changes its position/shape/etc.
Doing GET_CUR after every SET_CUR doubles the number of firmware calls
we issue, that's for sure; is it worth it - that's something that I'm
not sure of.

May I please ask for more opinions on this?

	-ss
