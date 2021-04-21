Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A62367214
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 19:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243132AbhDURzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 13:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245079AbhDURzD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 13:55:03 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54911C06174A;
        Wed, 21 Apr 2021 10:54:29 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id j7so13479026eds.8;
        Wed, 21 Apr 2021 10:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NNHrI9PudBGjVSwUN3nmEntVSmixq7OdjkvqE9eSJV4=;
        b=ZTZzpQTGenymX5Ef0xQGOxHKMY5SJsxboIZ2xb2iornwvQSBmKb3VLgHdi4Dsgkjim
         2Z7CvQIHDwAhYF0ceuXebraEHsNz2HAKyze0cu2w0SoRz4aXFlIBalc/eFYAMLAaW8VE
         8yjq8WV7Ap7bqiU5MVYCSPGKF41pSlOmHTX4jzTwMgymIJDaSecJeZP3deisFeWLPVfP
         qunVK7nsBexehZ/swxeLlxSYYiheTnRQ6t/xhI7Xb2xMSs3hMxPfaN3vpyDHAIl3PPyz
         mU83OGwLbHPvC4417/9cvL7ynK1QnhYf2yNWl1gMMoz/XGr1iZTC0jYknNcrYknD9o15
         X7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NNHrI9PudBGjVSwUN3nmEntVSmixq7OdjkvqE9eSJV4=;
        b=ZJWUxHTONgVUEvh0a+T22lKS1a9aXBq9mnN6u7dDgVYeQq5j0HruBFSzGwzP6e6pVJ
         4D9HjHMB+r7a6mhyhyHxmkGY8nPslD9lztLrO6zfcP5C4nFH3SZ0OVX47ryVxRrxexkH
         pkiX7XXaq/WW7AAx7M1QpP3ImmL3ictHYne5ndpJ94C6cygc2JjpL0yyU7QeMT0IDrie
         TBgkQA+VUfYe40vsod4rLgD6z/5CfwGrI1docgQXTilPNq08BEJXyBVsYeBbPp4Ioz39
         /zByc6+1+/UHjYnVb0JIKq/TasCOgE3+yw1hzZBxuvUqn0NTAG41ebk31x1iwQ9nx9g5
         89XA==
X-Gm-Message-State: AOAM532Qmf1sMYU5VUHJdsukXzqE9VH5kCYY9DqrElAMj/ECnqbJHuhb
        zGlZqXlIB0LEjQ3C1Hl9c/c=
X-Google-Smtp-Source: ABdhPJwWYyF5WLRhLUbucnYzQEisWLDY1LAD4e5mzjMEsW6upH0WHg13lY+gcqMV8KhNEUjdeunO5g==
X-Received: by 2002:a50:e607:: with SMTP id y7mr40639278edm.18.1619027668091;
        Wed, 21 Apr 2021 10:54:28 -0700 (PDT)
Received: from agape.jhs ([5.171.81.3])
        by smtp.gmail.com with ESMTPSA id t4sm93905edd.6.2021.04.21.10.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 10:54:27 -0700 (PDT)
Date:   Wed, 21 Apr 2021 19:54:24 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH v1 4/6] staging: media: atomisp: reformat code comment
 blocks
Message-ID: <20210421175423.GC1414@agape.jhs>
References: <cover.1619022192.git.drv@mailo.com>
 <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
 <20210421171045.GB1414@agape.jhs>
 <20210421175144.GA224467@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421175144.GA224467@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 21, 2021 at 11:21:44PM +0530, Deepak R Varma wrote:
> On Wed, Apr 21, 2021 at 07:10:46PM +0200, Fabio Aiuto wrote:
> > On Wed, Apr 21, 2021 at 10:26:09PM +0530, Deepak R Varma wrote:
> > > Reformat code comment blocks according to the coding style guidelines.
> > > This resolves different checkpatch script WARNINGs around block comments.
> > > 
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > > 
> > > Changes in v1:
> > >    - implement following changes suggested by Fabio Aiuto                              
> > >        a. Corrected commenting style                                                               
> > >        b. Similar style implemented for other comment blocks in                                    
> > >           the same files.                                       
> > 
> > If you want to tag me you should add the Suggested-by: tag in commit message
> > before Signed-off-by tag...
> > 
> > $ vim +485 Documentation/process/submitting-patches.rst
> 
> Yes, perfect. I will tag you in v3 accordingly.
> 
> Thank you.
> deepak.

feel free, you don't need:)

> 
> > 
> > thank you,
> > 
> > fabio
> 
> 

thank you,

fabio
