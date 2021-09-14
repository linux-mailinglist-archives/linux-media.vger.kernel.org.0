Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8182A40A541
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 06:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbhINE0X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 00:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232322AbhINE0T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 00:26:19 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE5EC061574
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 21:25:03 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id q22so10981694pfu.0
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 21:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:user-agent:content-disposition;
        bh=5H2bcMfxByKm2EVUg1iJMD5chj5K7B0S9zZLnk9vCwM=;
        b=FID+wq/FYlPSh2Z7HxqDdnou1mMCkl3k4Skk0P+X88RAl/VcGXiAkriocgpWuvPcXG
         Kq3x15rxwghXkeMt1PwPxs2PPwN4E0psiiCaEVxtG6OtHLt8RQ92CqEsCPCyUMGeQ/NY
         pXftPl9TKE+evQ16m0LGZWDNAfja9y63J5ojp537+OX+ZDqAZFAZu/iPzxeHMJkhjAE2
         lFkQaD9GgI6GLq6zLc5jTUFF5IB51gATkDgjNTPGbHa4Xz93EKHJnslXlZ/ygM5RYDHL
         EtALtr6T+Xr1/2ClFzFLIOGukp024UM3n/umm294jlEpwxy/lycqYXX5/qqoCXdPTMbE
         Q6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:in-reply-to:user-agent:content-disposition;
        bh=5H2bcMfxByKm2EVUg1iJMD5chj5K7B0S9zZLnk9vCwM=;
        b=csrbhkJdeWE1tl5MmLqEYHJiCf4Q5jtJ0IQ/zobBe03Xl0ZISRR13vQEoY3OEMmHoH
         /zC7SdxuDgPJ9NG/40HJ4qSxJla4tKWhuMxpVSk91A/dJFICnHGkKoElZU5T0p0DwatD
         TLH8EIw+yoEaAankS4+xkfbIAcsWtRMKxEAFV8/lzVD/FiUfW6YCDA+2bzDC28UqzfRc
         LuiVAj4YA+iHaRHLjUEqPYZmRe5Sgvp/AFGv1IwnRp0kUzDQoaPKM1sVvR2OZcbnNz7W
         rTBSKr/GTOPLflA4r/dWVAAbQDNw1VmgFgCBWHXDFrsaHjeiU8nt3kIE5HF9KSdjueUi
         lG7Q==
X-Gm-Message-State: AOAM531EMtEGlUSk8gbuZRPMgUOz72cih+PlJz6wsK2zlsmSvqa/yj00
        lc8RtQjg/jJm+lhq1WWk1ZSoCfDK6oy5hZUt9grC/AWi+0OO82YNbDCSOK1F7FfIo25y2BxJpyI
        3D3YSl60Bk2vF7UXL
X-Google-Smtp-Source: ABdhPJyhUBnsaiA7W9PWKhumgbVl2XyGla6we+u1qEcEzZ4T0Rmx6kI2MD23reRzjgQ+fm8rIXiCoQ==
X-Received: by 2002:a63:ef57:: with SMTP id c23mr13797054pgk.60.1631593502582;
        Mon, 13 Sep 2021 21:25:02 -0700 (PDT)
Received: from sidraya-laptopU ([203.201.61.238])
        by smtp.gmail.com with ESMTPSA id d3sm9797780pga.7.2021.09.13.21.24.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 21:25:02 -0700 (PDT)
Date:   Tue, 14 Sep 2021 09:54:55 +0530
From:   Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, prashanth.ka@pathpartnertech.com,
        praneeth@ti.com, mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com
Subject: Re: [PATCH 09/30] v4l: vxd-dec: Add idgen api modules
Message-ID: <20210914042453.ttbf2atkzymqt5yl@sidraya-laptopU>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
 <20210818141037.19990-10-sidraya.bj@pathpartnertech.com>
 <20210824140005.GQ1931@kadam>
MIME-Version: 1.0
In-Reply-To: <20210824140005.GQ1931@kadam>
User-Agent: NeoMutt/20171215
Content-Type: text/plain; charset="US-ASCII"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 24, 2021 at 05:00:06PM +0300, Dan Carpenter wrote:
> Of course this is all staging code and we normally don't review staging
> code too hard when it's first sent because we understand that staging
> code needs a lot of work before it's acceptable.
> 
> One of the rules of staging is that you can't touch code outside of
> staging.
> 
> But since I happened to glance at a some of this code then here are
> some tiny comments:
> 
> On Wed, Aug 18, 2021 at 07:40:16PM +0530, sidraya.bj@pathpartnertech.com wrote:
> > +/*
> > + * Structure contains the ID context.
> > + */
> > +struct idgen_hdblk {
> > +	void **link; /* to be part of single linked list */
> > +	/* Array of handles in this block. */
> > +	void *ahhandles[1];
> 
> Don't use 1 element flex arrays.  Do it like this:
> 
> 	void *ahhandles[];
> 
> You will have to adjust all you math.  But you should be using the
> "struct_size(hdblk, ahhandles, nr)" macro anyway to prevent integer
> overflows.
> 
> > +int idgen_createcontext(unsigned int maxid, unsigned int blksize,
> > +			int incid, void **idgenhandle)
> > +{
> > +	struct idgen_context *idcontext;
> > +
> > +	/* Create context structure */
> > +	idcontext = kzalloc(sizeof(*idcontext), GFP_KERNEL);
> > +	if (!idcontext)
> > +		return IMG_ERROR_OUT_OF_MEMORY;
> 
> We need to get rid of all these weird error codes?  You can add that
> to the TODO file.
> 
> > +int idgen_destroycontext(void *idgenhandle)
> > +{
> > +	struct idgen_context *idcontext = (struct idgen_context *)idgenhandle;
> > +	struct idgen_hdblk *hdblk;
> > +
> > +	if (!idcontext)
> > +		return IMG_ERROR_INVALID_PARAMETERS;
> > +
> > +	/* If incrementing Ids, free the List of Incrementing Ids */
> > +	if (idcontext->incids) {
> > +		struct idgen_id *id;
> > +		unsigned int i = 0;
> > +
> > +		for (i = 0; i < idcontext->blksize; i++) {
> > +			id = lst_removehead(&idcontext->incidlist[i]);
> 
> You're not allowed to invent your own list API. :P  Generally there just
> seems like too much extra helper functions and wrappers.  Removing this
> kind of stuff is standard for staging drivers so that's normall.  Add it
> to the TODO.
> 
> regards,
> dan carpenter
> 

I will make change for void *ahhandles[1] with void *ahhandles[];,
will use "struct_size" while allocating memory.

I will replaced all Error macros with directly linux Error macros.

About customized data structure API e.g-list,queue, I am currently working on
replacing them with Linux kernel generic dtata structure API's.
Thank you for reviewing.

-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
