Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0FD53771DF
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 14:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhEHMol (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 08:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhEHMol (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 08:44:41 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C04C061574;
        Sat,  8 May 2021 05:43:39 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id h4so11874694wrt.12;
        Sat, 08 May 2021 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8dWNJqGeO28h3+LJctIyuduk63WWQ2H2We1e6Kmdbcc=;
        b=WJlqlfw4KqEJEYtwo3XvIxHn2oPgFjIosnEp35LUQWmP6KIWRPCLeFPwhBe2hued2W
         qRPVKROfJq0qsWqSW+VhzZLwF36wc2sjLKsvWCSRD80Z3a8efekHbJmuTjHbsH2JDrGc
         gltTqoqxFiEQbhF3C2wuq7Qd/5T8hGkTyLRqun1VbtNH5DkxmA+aWC5RSsiuE1eZsOAz
         omUhnanjUSPgUlNIq1/mwvczuUBycxAFvdkSSrVmF+4d3dAYd1GcZtwcsugcOHuxOkRf
         dWp6UkJKc1EZJB4bqflfrj6ptYZ+RiVSOWjX9YtdbZU4Chk6xqB1i5O/xNlIq11yQhhn
         qIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8dWNJqGeO28h3+LJctIyuduk63WWQ2H2We1e6Kmdbcc=;
        b=bqXZJwdB43wxAj2r22XDbwUrCZzH0ChOtIUqzdqztrmj+1yIlRp/3T+xkFS0MkUZpk
         EwEa5cNtKWETLLBZpknmb7+jgZ7XWEAdq+ro36W8NxjcErcpAtRCw/Rnt//U8uroW9bv
         8FblRa9qEDeVI6Hc0AJjF2XC8D7XX7/bYgTkm263OjS7+VJe33LF5BzxRPcgv9Xr6zZI
         ucnOA2+s26mV0++eHR2YDKqoMTjtQbk/qWEUOabSA3/0A+EBDD1tYZ8vtBwzi7kVJTKA
         goqJXwHL7MNXpGt7FeFr162FFBnDruyxf0JKKH4XCOi5/36NGwy62VrNR33hPQj9aONQ
         qTXQ==
X-Gm-Message-State: AOAM532oTLfWp2qPr5eB47B4/Rw6AwI82umyMlebzzTKU9eDbuO/7VFJ
        xCR2dXWn6ahqI5nwGJI2ToLe0nN6JCF2Sg==
X-Google-Smtp-Source: ABdhPJwHlX5yjTi1BS6fd7w3SLeYJMZkzI9LwKOChEaQhz+1kQpQxmiv8o4Q6ozyrp+9E8awxNt9OA==
X-Received: by 2002:a5d:4acd:: with SMTP id y13mr18747852wrs.185.1620477818392;
        Sat, 08 May 2021 05:43:38 -0700 (PDT)
Received: from agape.jhs ([5.171.72.44])
        by smtp.gmail.com with ESMTPSA id e38sm16491786wmp.21.2021.05.08.05.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:43:38 -0700 (PDT)
Date:   Sat, 8 May 2021 14:43:35 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: media: atomisp: remove useless returns
Message-ID: <20210508124334.GA1403@agape.jhs>
References: <cover.1620475909.git.paskripkin@gmail.com>
 <f5b8abd8a92fcdd9b0ec49902d4363bc35c86218.1620475909.git.paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5b8abd8a92fcdd9b0ec49902d4363bc35c86218.1620475909.git.paskripkin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel,

On Sat, May 08, 2021 at 03:21:52PM +0300, Pavel Skripkin wrote:
> Breaks are not useful at the end of void function,
> they can simply be removed.

this commit description is not really describing the changes that
have been made

> 
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

thank you,

fabio
