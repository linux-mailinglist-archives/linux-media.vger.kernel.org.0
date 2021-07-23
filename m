Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A963D3798
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 11:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbhGWIit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 04:38:49 -0400
Received: from mx-lax3-3.ucr.edu ([169.235.156.38]:18000 "EHLO
        mx-lax3-3.ucr.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbhGWIis (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 04:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1627031963; x=1658567963;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc;
  bh=11hdfmNQdEcgN5T5M4TZZU7b8pnUY8wBhrlerw8iwXw=;
  b=AvZDVuFMnxnvVpeMgHqdN45FdtGl62T3DGJqAz9uMNsM0gMs2LKVG+Jz
   or/apoBtBcDWTA205K3mnOPmYIugSvrrpkqAInHd9w4EN5ovxkIts2YQk
   Oj6yu91Wxu0jlSmRjRi/Q0qJ4hAuRXZk+69hCgCEm1K1gPT6CzmKLv0O+
   CcJNQfMOu2y/00BZPAJ2wqSuFhqOxoVEN/azTHU0Bwud0Lih0L+9X7oLy
   ZBb5ZkHTT4N0PahdTJ8LgnMYHBPv1XlMKs/6/UlT8G//C9Wx0Gr4SylHf
   o4nnc8ZnWd9CPGrTWjJ+BXwoE6XK/zNQNsXGU/SBxxIuMo9JtDV12Zt/6
   Q==;
IronPort-SDR: m/ksSIuEhXajroOwVkEhz4ZAnoPP34lVxgu/CNdNHxiKvdScjeNuhkqMe9vwcxej+uyDayvC/9
 XkQVVNpYfN6x6c0Jl8VNZnZC5xEEIve9kKVG86JsxyL4UEpxzNAhHm6cl4rlF2K9AnHZa66diz
 fThRdFpdMLfgtNSUFwrEZeLH38iqwUKrDZV+4uDVT6zohDJp9ST1IgJGUKR8Yf2al9gxFJkdza
 zsHRnQ7Wo/uxUfGrHE1L8WQptl6y1vdQhFMeRtKpWgynFJ4GivjSzil7eed9hBX6/WNbA+D1qH
 E8Vc9pTbVAdRRw5am5KYBib5
X-IPAS-Result: =?us-ascii?q?A2GiAwBviPpgf0jYVdFaHgEBCxIMQIFOC4N4bIRIkWqdW?=
 =?us-ascii?q?gIJAQEBD0EEAQGEWAKCegIlNwYOAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBA?=
 =?us-ascii?q?QUEAQECEAEBgQwLWQtjgU+BeQYEPYI1KQGDbQEBAQMSEVYQCwsNAgImAgIiE?=
 =?us-ascii?q?gEFARwGEyKFV5xbgQQ9izKBMoEBgl+FRQEJDU6BFRJ+KocKhmIngimBS4I4N?=
 =?us-ascii?q?z6HW4JkBIMdYxhugU4XgTkBAQGQMYMhiTiCCZ0PAQYCgwwcjS6FF4t6K4Nji?=
 =?us-ascii?q?16FfJEmuzEQI4FTgX8zGiV/BmeBS00BAgECAQwCAQIBAgECAQIIAQECnQskL?=
 =?us-ascii?q?zgCBgsBAQMJi2gBAQ?=
IronPort-PHdr: A9a23:Z4SDlBe6v6JboqkanuBYA4NFlGM+vd7LVj580XLHo4xHfqnrxZn+J
 kuXvawr0AWRG96EoKsc0aL/iOPJYSQ4+5GPsXQPItRndiQuroEopTEmG9OPEkbhLfTnPGQQF
 cVGU0J5rTngaRAGUMnxaEfPrXKs8DUcBgvwNRZvJuTyB4Xek9m72/q99pHNfwlEnjSwbLF9I
 BmrsQndqNQdjJd/JKo21hbHuGZDdf5MxWNvK1KTnhL86dm18ZV+7SleuO8v+tBZX6nicKs2U
 bJXDDI9M2Ao/8LrrgXMTRGO5nQHTGoblAdDDhXf4xH7WpfxtTb6tvZ41SKHM8D6Uaw4VDK/5
 KpwVhTmlDkIOCI48GHPi8x/kqRboA66pxdix4LYeZyZOOZicq/Ye94RWGhPUdtLVyFZDYy8Y
 YkAAeoPM+hbsofzuUcBoACiBQWwHu7j1iNEimP00KA8zu8vERvG3AslH98WsnvUrdT0NKcPU
 eCy0aLHzjXDYOlX2Tzg74XJchEgofGWUrJxbcbd1UciGhjYjlqMs4zpJS2a2fkQs2WC6edrS
 O2ghXI9pQ5rvjiv2tkjipPPho8NxV3J8SF0zYY7K9GmR0N2ZdGqHZhfuiyUN4Z7TN8vTmB0t
 Ss7xLALuoO3cTUXxJkk2RPSZfOKfouV7xztSeucPTF1j29mdrKnnxu+71Ssx+nmWsS30FtGt
 DRJnsTNu3wX1RHf9M6KQeZn8Ei7wzaAzQXT5/lBIUAziKXUNYYswqU1lpoPqUTDGTL2mFnug
 K+WaEok/u+o5vziYrr8p5+cM5Z4ihn8Mqgzg8C/D+Y1PhYUU2iU/uS807Lj/UnnT7lQkvI2l
 azZvIjbJcQduKG5HxdY3pg/5xu7FTur09QVkWMZIF5YeR+LlYrkN0/WLPD9F/i/glCskDlxx
 /DBO73sGpXML3nDkLj7fLZx91JQxQQowNBC+51UEKsNL+zuVU/srNDYFAM2MxSow+b7D9Vwz
 oceWWOJAq+EP6LeqFqI6fwyLOmNfoAYoyj9K/c76P70l3M5mkESfbOv3ZQJbHC0BPNmI1+WY
 SmkvtBUPW4M9iE3VvTnjkGPS3YHa3+0Gak1/Ck2Dp6rF6/EXImmhLHH1yC+SM54fGdDX2GNA
 3f1cM22W/4NIHaDMM9ok2RcDpC8QJVn2B2z4lypg4F7J/bZr3VL/ano08J4sqiKzUlayA==
IronPort-HdrOrdr: A9a23:qVnxl6DQw62knZLlHemX55DYdb4zR+YMi2TDGXoBMCC9E/bo7/
 xG885rsCMc5AxhOk3I3OrwW5VoIkm8yXcW2/h0AV7KZmCP01dAbrsD0WKI+UyGJ8SRzJ866U
 6iScVD4R/LZ2SSQfyU3OBwKbpP/OW6
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; 
   d="scan'208";a="59272167"
Received: from mail-pj1-f72.google.com ([209.85.216.72])
  by smtp-lax3-3.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2021 02:19:20 -0700
Received: by mail-pj1-f72.google.com with SMTP id j22-20020a17090a7e96b0290175fc969950so3584294pjl.4
        for <linux-media@vger.kernel.org>; Fri, 23 Jul 2021 02:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UZ6nos874yRZpIgf2Vh5xy3KOkgY+nI+yWtvY2gRCVY=;
        b=lOkOtmUwuYump2LRjrh45Wsp5ImoSZAmOhTejFoNmH6d93p3jwy+EEgnNrRUQbNiVA
         EKIUucov5+GNZtmiqyAWGffwv6ZZY+4rNVfFlpRz119iczqYQL8C/NRc141/RI7lMz1A
         VipAt/HWB0D/goRXq0SBsGWEWGWKglY1n2QmkSx67czN+mEM/61znouCt1RpL7+X9Wsh
         66dIeP8fIvLVZs6y1Xn3X7/RgquvJhk5edZJmafjc5P6xs+55D8Ln54dpMy00SsDWFw+
         RJYcnhQjiZuWEjiu6UZP6jOGC0unR1QNdwZyUHxkBLSfKTfML280oJl2V83OwsrfFRKn
         yEug==
X-Gm-Message-State: AOAM5302X3I1MtRbsPiYSbq+SckQ6vhTzPPkqxZzwSNpC56/H/Qbi+ow
        EqCDa8zhrKqRbLGDM9vrTMHqPtbs4/3WphLG7hYeaPCvu/S4ArTXcp1It/hDmiR/0Ex6hrmQxRb
        pprKKyrZmGtRA0dESy2NnZFOxAJwM2dHkoGSHCX31
X-Received: by 2002:a62:ed06:0:b029:32c:a800:ba47 with SMTP id u6-20020a62ed060000b029032ca800ba47mr3647609pfh.56.1627031959288;
        Fri, 23 Jul 2021 02:19:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+WXiuLmnX9MFdAd1e0I+8fQgzAvcb+FLbne5Z5luQOERXOyWsR3539QrgvbRqjef6Dr1euYIuxwFmnSGxjeM=
X-Received: by 2002:a62:ed06:0:b029:32c:a800:ba47 with SMTP id
 u6-20020a62ed060000b029032ca800ba47mr3647587pfh.56.1627031958961; Fri, 23 Jul
 2021 02:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210723085145.1ce7ee5c@canb.auug.org.au> <20210723003607.64179-1-yzhai003@ucr.edu>
 <20210723081034.GD1931@kadam>
In-Reply-To: <20210723081034.GD1931@kadam>
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Fri, 23 Jul 2021 02:19:08 -0700
Message-ID: <CABvMjLQ5PW+cddeYCgiR4xx9dKWVdKsaJLrUYFPMmsOLk+a1HA@mail.gmail.com>
Subject: Re: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan:
I updated the fix tag in this version, I would sign the patch using my
full name, thanks.

On Fri, Jul 23, 2021 at 1:11 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jul 23, 2021 at 12:36:04AM +0000, Yizhuo wrote:
> > Inside function mt9m114_detect(), variable "retvalue" could
> > be uninitialized if mt9m114_read_reg() returns error, however, it
> > is used in the later if statement, which is potentially unsafe.
> >
> > The local variable "retvalue" is renamed to "model" to avoid
> > confusion.
> >
> > Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> > Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> > ---
>
> Is your full name just Yizhuo or Yizhuo Zhai?  Please use your legal
> name as if you were signing a legal document.
>
> I don't think you have changed anything in this version?  It's basically
> a resend of the patch from Jun 25?  Please put that information under
> the --- cut off.
>
> Looks okay to me.
>
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> regards,
> dan carpenter
>


-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
