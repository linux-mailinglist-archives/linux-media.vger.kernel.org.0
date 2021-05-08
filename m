Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA1C3771F0
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 15:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhEHNA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 09:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhEHNAv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 09:00:51 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93414C061574;
        Sat,  8 May 2021 05:59:48 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id l13so11897785wru.11;
        Sat, 08 May 2021 05:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=r56wwvOkk5KtOS6qDl36Vf4/PDgdK1xTKxZ+baf0zEA=;
        b=G+bLWWrL/DSdYUiU6vaq6hNPMh7IYOYCWfeiOw3c26r+Awf+pi+7MFysvmIJ5er0Mc
         Kar+KFiFU5PwVOvFhSbNQRlLRHehj0EAOOyYimXJaTSTfgc3OhYmi3BP5OiQatajElTr
         OswiDICzt6HD3BE27W6mdi8LFdol5XDPJsm1KRvv/DtRw0UiM/kuTn4DZwmOPoQVMenc
         KuImHTY9cYhIMg6/MFBhwmFfZ587jeM/F+J6iw2k9mYPdQV0vl255BVg797BkUKn/cfu
         yGsRRwhZSUAOAIsut3Ye1KIJtP6yoJ6jEbZTGDa4wmZkNz47JH3LdA0YTHEc9J70Uq18
         4F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r56wwvOkk5KtOS6qDl36Vf4/PDgdK1xTKxZ+baf0zEA=;
        b=goz3H9QjuDJVWa751H9XCsnvRNhpKDLSzrCIsJ3gblhGsYxTWMG8W7j/td1TKaCZjQ
         5i6G0sxlZZnwLYww2vb9cuMSRIQu7iZz7+mDpHu7prcNc2U01576uQgAZKcjj1qIwVim
         bSUqoKuAGNlkQ7Kf3wzTEtvdR4q31hDxT4Xj3MqAhaFglY2h1+Bj2GaMsFkIfASic49j
         U9r5dJ3rOT7L6QNAk9B9zkmiMC3O/p226My04Jk1NiNak1HwwAVmJv5qlsde1PydHsbe
         UJtEGaQgYYu00DpQBXToR5S1SjTHShxk8YXZz7mB07OGAv5SOf5qVT9TZZ8pmzGjO/o0
         0Z/g==
X-Gm-Message-State: AOAM531f7gxymwR3IlkJLbqCdJ7xENXL21D6K9zXq70z5opxh0LKtSAs
        8nMA+cGED4PzLWCPDk5fOw4=
X-Google-Smtp-Source: ABdhPJwW/yE97ERQ1dJIxtUww7DExYQG/2FNJPnt+FtC/WHrX4W666jEeDMTzSjhyzepvVCCZkep+w==
X-Received: by 2002:a5d:6302:: with SMTP id i2mr19205592wru.237.1620478787287;
        Sat, 08 May 2021 05:59:47 -0700 (PDT)
Received: from agape.jhs ([5.171.72.44])
        by smtp.gmail.com with ESMTPSA id s5sm11324774wmh.37.2021.05.08.05.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:59:47 -0700 (PDT)
Date:   Sat, 8 May 2021 14:59:42 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Pavel Skripkin <paskripkin@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: media: atomisp: remove useless returns
Message-ID: <20210508125942.GB1403@agape.jhs>
References: <cover.1620475909.git.paskripkin@gmail.com>
 <f5b8abd8a92fcdd9b0ec49902d4363bc35c86218.1620475909.git.paskripkin@gmail.com>
 <20210508124334.GA1403@agape.jhs>
 <20210508124841.GM1955@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508124841.GM1955@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 08, 2021 at 03:48:41PM +0300, Dan Carpenter wrote:
> On Sat, May 08, 2021 at 02:43:35PM +0200, Fabio Aiuto wrote:
> > Hi Pavel,
> > 
> > On Sat, May 08, 2021 at 03:21:52PM +0300, Pavel Skripkin wrote:
> > > Breaks are not useful at the end of void function,
> > > they can simply be removed.
> > 
> > this commit description is not really describing the changes that
> > have been made
> > 
> 
> Pavel clearly intended to say "Returns" instead of "Breaks".  But when
> you're complaining about commit messages please write a better one so
> the people can cut and paste it.
> 
> regards,
> dan carpenter
> 

got it, thank you Dan, and sorry Pavel

fabio
