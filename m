Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A0735E75A
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 21:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346342AbhDMT5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 15:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbhDMT5Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 15:57:24 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C49C061574;
        Tue, 13 Apr 2021 12:57:03 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id nm3-20020a17090b19c3b029014e1bbf6c60so5381800pjb.4;
        Tue, 13 Apr 2021 12:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pjmQnwxfPUybeCrE9NSnjQV62TPPi6ZBYSR55ZeQzdY=;
        b=XDGIZELhZ+0EIloHFZPdtwERzwXtg6kPYHwQYxP7NsOZrrps0tGe3FBm6wNhbL4L4D
         HeOF6C5yUjuBfnQgT2BlipmVf+iGqrPJQHhrHOdPEpX7FSr9cr8bWU4vbYXUpeid5kw/
         5SemG54HMUwhn9tOyJjRrZA4Xj0Reie5USxLNVOEP4K60Rm5hNetn8uHyQyC5GwdpFlU
         NTNJfCxCAgHNZ92OXtT/Bz++WzKFRhZFd3p+Mz4fPLlDXe60vep4zR8P0mmGyvqTgBk+
         /18DlAWz7bFhgwHZJsMBVz1O0WDyLYv+CpvPh2m5SAagaM2GYf3Dihly431U7QroN0nl
         72hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pjmQnwxfPUybeCrE9NSnjQV62TPPi6ZBYSR55ZeQzdY=;
        b=a2rgm1NmOvvwBVfgfgUpehRbSf/QP742zhU98cjbAm+66GePoEh5GzcNStMYcjJ8LI
         em/3t6PPTHESdmj+l1Hlw6pNrwQyWcpsxZ04+m3/pdJLkgBOwzfNBEANqOOsc9b9RK0E
         k9DgbJf3mulfiR84yotNtAKcMxuA+tBPJoS4dUmjESgNRjnpzYcrizmo/0gYyw2FvlJq
         N4MeeMDV1tiL9/9LZ7KCk4ViZ5i0aJ0FJRPigbG/zcSZCNe5odIfo35jj/E5jNdG7KGO
         m8pz0Ld+HrG2WEpPrjGg485mkRKhz+b7JZ/SJXGVhqV5EA95lAfPhLyaMV/Bv+OO2Abb
         hRGw==
X-Gm-Message-State: AOAM532bObU3wxR67JgQTBkIkSTlraqPBvf8EHROAqtuyH13DGcfOzJt
        tohqhi3MDGKMv8JXtKRK0Hk=
X-Google-Smtp-Source: ABdhPJwAQjtu9apHd32uFbz1TDHgiLSc1xIdvb9R6/S6jsjZ3RwnHQV4iKZgVMFoGuG+RAYrLDtnnA==
X-Received: by 2002:a17:90a:c501:: with SMTP id k1mr1707108pjt.101.1618343823356;
        Tue, 13 Apr 2021 12:57:03 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id x69sm13078153pfd.161.2021.04.13.12.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 12:57:03 -0700 (PDT)
Date:   Wed, 14 Apr 2021 01:26:57 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v3 4/4] staging: media: intel-ipu3: remove space before
 tabs
Message-ID: <YHX3iVCNXJlOsmuQ@kali>
References: <cover.1618326535.git.mitaliborkar810@gmail.com>
 <01ad7ff353f805dfc48e7bcc26ed974e7bb5ef9f.1618326535.git.mitaliborkar810@gmail.com>
 <20210413181712.GI6021@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413181712.GI6021@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 13, 2021 at 09:17:12PM +0300, Dan Carpenter wrote:
> On Tue, Apr 13, 2021 at 08:59:34PM +0530, Mitali Borkar wrote:
> > Removed unnecessary space before tabs to adhere to linux kernel coding
> > style.
> > Reported by checkpatch.
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  
> > Changes from v2:- No changes.
> > Changes from v1:- No changes.
> > 
> >  drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > index 47e98979683c..42edac5ee4e4 100644
> > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > @@ -633,7 +633,7 @@ struct ipu3_uapi_bnr_static_config_wb_gains_thr_config {
> >   * @cg:	Gain coefficient for threshold calculation, [0, 31], default 8.
> >   * @ci:	Intensity coefficient for threshold calculation. range [0, 0x1f]
> >   *	default 6.
> > - * 	format: u3.2 (3 most significant bits represent whole number,
> > + *format: u3.2 (3 most significant bits represent whole number,
> >   *	2 least significant bits represent the fractional part
> 
> Just remove the spaces, don't remove the tab.  It's looks silly now.
>
Okay Sir, do I have to send a v4 patch on this now?

> regards,
> dan carpenter
> 
