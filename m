Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A04A3670FC
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 19:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244460AbhDURL3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 13:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237498AbhDURLY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 13:11:24 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53C3C06174A;
        Wed, 21 Apr 2021 10:10:50 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id n2so64564292ejy.7;
        Wed, 21 Apr 2021 10:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Rkwiaa+jDirhSShgjwe6icAk4sFKZ5EO8zRW1jIFg44=;
        b=DsDkE0eGwAkD3YmuxAcuy1TVhxXhwELGxCW2xA2E4g2uydgtItcJNYoH9Sa58mIvvF
         QybA/NKXi81EHOrwzVNacmnzawvR11PDtRhfgLGd8C5TmnBHTzFw/2AVC6RfyrCmNKna
         M/mpe1xHHKnkaWeHcWhkeOWhwLfMCIq36kWufAu9eIU2cyilL/CMEsCXA3hjRtH3Hz8L
         5/4Wd7kFie2NDNoPnyqodl+d6H5whYRXLuQn843retaqEt5vp/Bg1R3rJgEDDSsIAJWv
         nGmAmXeKhophjawX8YjH3WAdfalFEF5Sm24lajzgzj/ILVocLJyexA2HEDXMtUkF5bcr
         B4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rkwiaa+jDirhSShgjwe6icAk4sFKZ5EO8zRW1jIFg44=;
        b=F/8pzZbjeF7w1QyoCkmGNMcGC7Zw4hOBjaDMTx5UvEhJzbRakTpAwIxIajuPLYIOgr
         faTw7uJdJEkPOxenK5cm3AZhNgQnoanaq9i3iGXX1wBSjnbT07v3GEzK9V/P7tEwEgAL
         X5HHg30aEI+h/brWOAdsn0WD4VRwgKpeIxCAUtYlxPcMdvx+jedDcO4GAfmFY370D0YJ
         5UqSuEZ+OCKQaMahUvRL7NeUXnyjH7Os648cC4tcuxEjk3HbG2N4xmj655vN7TtJESbd
         b0L+yo2mYXwOqM4TF+92pThH8vBMbZmIFetEV/Bh/995nJ7Q2PKb8V5WvxOuWoiCSLfV
         Lnwg==
X-Gm-Message-State: AOAM5308r0mngh8FVm/L+3UhJN5uC4pg0YivswxvTaBmbkZwF9/gKxRS
        +ku9o9cILyMkrgqemZ4EULc=
X-Google-Smtp-Source: ABdhPJxyXGyiyR0G9YsfYYLPW+LoFsrJ+5akqfwUQh7rQhXfA32oUMLzR/q7nluYdZEEogQZrk5UBQ==
X-Received: by 2002:a17:906:28c9:: with SMTP id p9mr35058595ejd.111.1619025049289;
        Wed, 21 Apr 2021 10:10:49 -0700 (PDT)
Received: from agape.jhs ([5.171.81.3])
        by smtp.gmail.com with ESMTPSA id dc24sm66566ejb.123.2021.04.21.10.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 10:10:49 -0700 (PDT)
Date:   Wed, 21 Apr 2021 19:10:46 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH v1 4/6] staging: media: atomisp: reformat code comment
 blocks
Message-ID: <20210421171045.GB1414@agape.jhs>
References: <cover.1619022192.git.drv@mailo.com>
 <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 21, 2021 at 10:26:09PM +0530, Deepak R Varma wrote:
> Reformat code comment blocks according to the coding style guidelines.
> This resolves different checkpatch script WARNINGs around block comments.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Changes in v1:
>    - implement following changes suggested by Fabio Aiuto                              
>        a. Corrected commenting style                                                               
>        b. Similar style implemented for other comment blocks in                                    
>           the same files.                                       

If you want to tag me you should add the Suggested-by: tag in commit message
before Signed-off-by tag...

$ vim +485 Documentation/process/submitting-patches.rst

thank you,

fabio
