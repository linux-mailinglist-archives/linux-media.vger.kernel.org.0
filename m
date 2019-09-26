Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE27BF69E
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 18:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfIZQY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 12:24:57 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41338 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727430AbfIZQY5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 12:24:57 -0400
Received: by mail-pl1-f195.google.com with SMTP id t10so1267767plr.8
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 09:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=10H/U7S2ghOV1iSbFD3M/tAhuyIEQ4KVMg/2VEiOBIw=;
        b=f4xNzzXKr4mmYi1uFJITBf57fJUx5x05Hkxv0qpTY9MyQY7d7lSG6T3OhoVN+7ASXP
         2G2hWm1pgUPavrJONXg8F5ia8/Z8ziT6auEr/eyTaW+wzq0d/70KkCofW3UnwbdbOJ8u
         l5Lqreyr1TB0yu5ebWkkXqlIFLa7JU6hQMGwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=10H/U7S2ghOV1iSbFD3M/tAhuyIEQ4KVMg/2VEiOBIw=;
        b=c+4IEHHvCE13LFSdrmVzGrvN9jpYCiTVGpvIWWZnpt16LXEY3lHKst1oGMb0VCT7Js
         hewFuaO58jF62W0hMHweLGSto8yf9EK11Zu4U5G58uKClEdTWi7+rYNskH2pQd35VCtX
         69vTno/MLSApmtSfUCjhRQSVOoRN33opunw3ctSZcmMl4yitm0vw4SANlw4/sAPiDQVW
         C5mXGbQtf1GQDjnTp8ocG/Aa2U004uqXZ0H2IIbBd1bErfAjT42RB3e38N/DVcOdQpk+
         t4m1Ev0haF/vALgRcqezhS78/4neZvnTpvGpMPG47sk0sJFEER1jM4tcv8VB5sBZJONR
         sojg==
X-Gm-Message-State: APjAAAXDdwd00saC+mfTlZcMwsrgWUuxPcHXg0zjNPlPOcVORABdGTwN
        89+qpbBHrYkG067TjrBrOEl/XA==
X-Google-Smtp-Source: APXvYqzJO6o2+q3kThM5imEaNfRgKTekPjo4iKpqxyWBQTs7ilT2ZwiNMLKi6UzmS5vgRsehaaTGjA==
X-Received: by 2002:a17:902:36e:: with SMTP id 101mr5188747pld.46.1569515096274;
        Thu, 26 Sep 2019 09:24:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l7sm2408166pjy.12.2019.09.26.09.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 09:24:55 -0700 (PDT)
Date:   Thu, 26 Sep 2019 09:24:54 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joe Perches <joe@perches.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        ksummit-discuss@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile
 documentation
Message-ID: <201909260924.D6287F93@keescook>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <20190918123620.GA6306@pendragon.ideasonboard.com>
 <20190918105728.24e7eb48@coco.lan>
 <20190919065447.GF2959@kadam>
 <5d71311232fd6d4aa0fab038512eab933c13a722.camel@perches.com>
 <201909251127.D0C517171E@keescook>
 <4eca5297a213357995c05b90c74a8bc638f54f02.camel@perches.com>
 <201909260848.B429B7DF@keescook>
 <b2e180a2d2d1d205c426ec02051a002f2c77832e.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2e180a2d2d1d205c426ec02051a002f2c77832e.camel@perches.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 26, 2019 at 09:02:07AM -0700, Joe Perches wrote:
> > the [a-f0-9]{1,40} already excludes "commit".
> 
> No it doesn't as commit starts with c which matches [a-f0-9]{1,40}

Whoops! Yes, sorry, you're right. I needed a trailing whitespace in the
regex.

-- 
Kees Cook
