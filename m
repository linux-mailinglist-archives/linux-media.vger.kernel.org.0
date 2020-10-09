Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D41288EB4
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 18:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389492AbgJIQXI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 12:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388719AbgJIQXH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 12:23:07 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9242C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 09:23:07 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id bb1so4689481plb.2
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 09:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8TE4U+VKbEi0E1ShyWEMbfLAHd1qUQl+rTJSQl6GsOw=;
        b=WhPWdEqZ/ETrgVw503UXhofOA2QT1Ovuf8yl8CDhTtSiFfc+cqw+T5R/ne3ff0/k/j
         fNx2aCOIdgia7F0Pk73yoNb+cRNut3XufZfn2vEuymPc1896z9BftA528Iruc6CUDRBi
         ZBjA77YqTtattS2Hq1XsHaVfnfq2pRg6CRbE8Vouc1uh5dOOJ806hmhPCVKM4RSDpi0s
         ChF9z0thKogfdJi0AMIuVigUJXPf3Re3uYjsOLh1ePaqnkiH6NJ5DMzYVUxLJX4C2fsq
         /1YE1PH7vLaiYcpjCqbMc7oQuruMLQuCQhWzWGU4JjGK3FwZJ6wzAsb4Cx6OSvUCX0z/
         7n6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8TE4U+VKbEi0E1ShyWEMbfLAHd1qUQl+rTJSQl6GsOw=;
        b=tCYuDC3GEPivN/HBQPqPjhGZoKDlalx2cMtLbsX3p4V05KMYDXcZUfYD60nnliifNQ
         IOO4hhx0ytwL2rv416cTCOU7ndr/vELDRHVzulLrqIdH7HNHiK+X9KUACQ97Na03lX/+
         Ezfnx8R9eW+cBwPIQA3wBckhcQSb8dwFYyCnVHt8bthfITzI/T7tJL/3C8jl6dqqpUde
         kvjM7jv/SDh1sBpILxx6Bi4MDAAdN8Qp264qS0tNJw+VBBMxpS7eBZoO7ZiqA1nQotGu
         IP5Uq79DwZLPTXXC/80ylNxTs5PyJIzrObSQ8B8CP+kNDm/HRy6jKYLRy5tSzkKnEMsE
         CUtQ==
X-Gm-Message-State: AOAM532GnmBjLOX5osU+4goo6Z+PccshXwF4jQtq44JVD0xjQIAyNhFi
        vNug6gbEeiCrIF83hJylzI4PdYbwjiGtALdddBc=
X-Google-Smtp-Source: ABdhPJy4J1q5e5rAQqohDn9AnNAHkJXsvtmdHg9v5pybUiWA7VxFjwcLTDj/HsC1HmBAzH2JnyR+YIgaBjke5/CIs2o=
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id
 d10-20020a170902aa8ab02900d3c9dd77d1mr13105498plr.0.1602260587510; Fri, 09
 Oct 2020 09:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com> <20201009150827.GJ6413@valkosipuli.retiisi.org.uk>
In-Reply-To: <20201009150827.GJ6413@valkosipuli.retiisi.org.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 9 Oct 2020 19:23:57 +0300
Message-ID: <CAHp75VeK9O4OMaeBHU04LrMq06oKe-UppYsd4OZHNvDwp5S5fQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] ipu3-cio2 format fixes
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 9, 2020 at 6:11 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> On Fri, Oct 09, 2020 at 06:07:51PM +0300, Sakari Ailus wrote:
> > Hello all,
> >
> > This set addresses most notable subdev format related issues, namely the
> > sub-device sink format being unaccessible. The result of accessing it
> > varied from oopses to crashes.
> >
> > since v1:
> >
> > - Validate try format, too
> >
> > - Set field in subdev format to V4L2_FIELD_NONE
> >
> > - Add a comment explaining the lock
> >
> > - Make values that should be unsigned, unsigned
>
> This is obviously v2. v1 is here:

v2 is good enough, but few nit-picks here and there. In any case
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> <URL:https://lore.kernel.org/linux-media/20201008204747.26320-1-sakari.ailus@linux.intel.com/T/#t>
>
> --
> Sakari Ailus



-- 
With Best Regards,
Andy Shevchenko
