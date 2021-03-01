Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0573F3278D7
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 09:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbhCAIDe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 03:03:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbhCAIDa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 03:03:30 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F1CC06174A;
        Mon,  1 Mar 2021 00:02:50 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id e9so7878633pjs.2;
        Mon, 01 Mar 2021 00:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nAI7JFt1UD5ie/O04aHZr9x4mcfS7unkHBLNfxD5o+o=;
        b=SFaZ0gv6F24x7eFsuB2qsvQxjOf3Z+NhYyfCnsBtSzeXCrFOVHKKq3cSMflFuJEf7t
         RGkm8xdQyxTkIASw+sSLeDsi6bS8cuUJLEj3I7f1uzp/SlsigQ81CL1idwQRhKYtySuc
         Nf5CkyIB/9l5D+Lwyo3YJLUVwOnYuTD05igzy8OO8W0sxzCR3gbQt+mE1/efA1mdlkcX
         i24auZTkaainMkAvmedRh78l+f8LL6f3fMnLehJZgPPrxXS/oec671sWwECykyt2X0ZH
         aD5+Q0buxKK8LEVfX5qmhHkROCoyl46sIed4OWUwQ9uEjKLz64z2B1pt4a25yW7JbqnG
         qd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nAI7JFt1UD5ie/O04aHZr9x4mcfS7unkHBLNfxD5o+o=;
        b=NMX7TDa5CJrBqmaJB87rIqFhddGO+B+JoZfarr1zcwXfimQdDYDKIxWJK2zHWYOHC4
         itNm++pzO83zN4cHH54zewc/isVLYT1Zcx/X3xQWFtdme+AgX3wplkiLiotIAiY5jbTF
         QaqV+IaCO6KNPupiYnbOuTnT93cZsv3kkN62N70gCDeqCi+PxlzXhNH8IKJXG0bRDk+c
         LpvDBn+BhdLQHPtxxBpP7BRrWIUDu++pOIN1dB7D75r+YPR2w/7xYYhQmbt3Om1e+3Vf
         0KYbYfdzxMgmiUd0y1dh53dRQ78So3f05jvd2GA4UC452vYRYNDhe7kGOwsqWNQlFoB7
         jVGA==
X-Gm-Message-State: AOAM532y6zIFJmRZVsv7PvFw4GHkTHrCnT9EOL9mSAf2fLdMytfyKkxy
        Tjgrz01SAIBE+9LM5O6uvC4=
X-Google-Smtp-Source: ABdhPJxKvn8bfIKb0AorjDObEuU809Zbvx4VRRIltMlNLHlIeNwYJzfXaB/rm0L8/nXEY/CuxicR0w==
X-Received: by 2002:a17:902:e54e:b029:de:8c70:2ed0 with SMTP id n14-20020a170902e54eb02900de8c702ed0mr14283605plf.3.1614585769917;
        Mon, 01 Mar 2021 00:02:49 -0800 (PST)
Received: from google.com ([2409:10:2e40:5100:b0d4:9de6:fcfc:43a8])
        by smtp.gmail.com with ESMTPSA id t23sm12102971pgv.34.2021.03.01.00.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 00:02:49 -0800 (PST)
Date:   Mon, 1 Mar 2021 17:02:43 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 6/7] dma-iommu: implement ->alloc_noncontiguous
Message-ID: <YDyfo9OKkRHxd89O@google.com>
References: <20210202095110.1215346-1-hch@lst.de>
 <20210202095110.1215346-7-hch@lst.de>
 <CAAFQd5BXAWeB2h4RvqsF1q8ip-Rhew80c7y1_og22-x3rS8KOQ@mail.gmail.com>
 <20210216084947.GA23897@lst.de>
 <YDyVFi26RPz5RrJB@google.com>
 <20210301072128.GA27039@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301072128.GA27039@lst.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/03/01 08:21), Christoph Hellwig wrote:
> On Mon, Mar 01, 2021 at 04:17:42PM +0900, Sergey Senozhatsky wrote:
> > > > Do you think we could add the attrs parameter to the
> > > > dma_alloc_noncontiguous() API?
> > > 
> > > Yes, we could probably do that.
> > 
> > I can cook a patch, unless somebody is already looking into it.
> 
> I plan to resend the whole series with the comments very soon.

Oh, OK.

I thought the series was in linux-next already so a single patch
would do.

	-ss
