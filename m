Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35F15B5721
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 22:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729861AbfIQUr2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 16:47:28 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44795 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728821AbfIQUr2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 16:47:28 -0400
Received: by mail-ot1-f68.google.com with SMTP id 21so4300735otj.11;
        Tue, 17 Sep 2019 13:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FoSYGBaKDzCX0ap+/LUel/1p6EkFjnJkCMtNziAAsIA=;
        b=TRZXBy088oRJkpwo3x0/UqmBIjcn3sHKAoP+5UYQdio4/FOpabkAcZ7fF71g1Iar0e
         Xb8NB9jr8TBZGfmWI2uktCOhqIj2ZCC2He+FkwAw91hWrCSRQE9kD07rc1g43bBKHTs+
         Ij54Aop9Uy4tVp3hJJIfwBvm3DNMIVWqXyFTD0Lg6LjOUIaGx7CdYbYCkm+mNEK0hjsx
         U//y3wD74IvnRLIlbuN3SPwFoQd5LxzOObtHWF6VH4IbrPioDZZ9obt62N20u28LhUbu
         LzRFGjrhcjL+cckbK3x1WxA/sH/y1IMcAoeiM+MEm6VRV4PkLT2fjwi8sg3uNHy5OUaQ
         qwyQ==
X-Gm-Message-State: APjAAAXTcSsAVj3X4zoH1ZHuR94uIx0yjOsKGxRCPIJYG4omKJm8xQfq
        oMg3b34yeFnSXJIZul/POQ==
X-Google-Smtp-Source: APXvYqz+B89UMDC9IY7k7wKv0ix99w6NLjJtzUmU9gXsyI/P+JljCrWHrrmyk4+rrKlIMXNQIZBZSg==
X-Received: by 2002:a9d:829:: with SMTP id 38mr609273oty.372.1568753247649;
        Tue, 17 Sep 2019 13:47:27 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e7sm994561otp.64.2019.09.17.13.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 13:47:26 -0700 (PDT)
Date:   Tue, 17 Sep 2019 15:47:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        dongchun.zhu@mediatek.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, drinkcat@chromium.org,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, sam.hung@mediatek.com,
        shengnan.wang@mediatek.com
Subject: Re: [V2, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS
 entry
Message-ID: <20190917204725.GA14339@bogus>
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
 <20190905072142.14606-2-dongchun.zhu@mediatek.com>
 <20190905101406.GA2680@smile.fi.intel.com>
 <20190905104829.GB5475@paasikivi.fi.intel.com>
 <20190905113509.GD2680@smile.fi.intel.com>
 <CABxcv=knP+-x0O-Ga-Dy8WTNovHk6GfX4ZEv0vVjnQvwchuVzg@mail.gmail.com>
 <20190905120012.GD5475@paasikivi.fi.intel.com>
 <20190905122449.GG2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905122449.GG2680@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 05, 2019 at 03:24:49PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 05, 2019 at 03:00:12PM +0300, Sakari Ailus wrote:
> 
> > And I see no reason to add a separate patch just for
> > MAINTAINERS change.
> 
> It's up to maintainers of the subsystem.

Just update MAINTAINERS with the driver. It doesn't need to be so 
complicated or per subsystem. There's enough of what each maintainer 
wants already.

Rob
