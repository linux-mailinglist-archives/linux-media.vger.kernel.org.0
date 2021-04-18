Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018573632F0
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 03:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236900AbhDRB1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 21:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234904AbhDRB1V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 21:27:21 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E42C06174A;
        Sat, 17 Apr 2021 18:26:54 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id u15so7347328plf.10;
        Sat, 17 Apr 2021 18:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LdLHlKsKEFT/fVDlILkUUrriYCxDyTZYAd5HOZ1HRDg=;
        b=Y0gFQuR+R5X/OWidUG3xXW1k5G4ht/w3sArhSwgYPfIXmWFZZpOUuRA6+ndA7zDpah
         UcDGBb9DdAcgl2Flx2FbkIZKyLlnABL6x0vPedND0opA+TyTO8tt7GJihjyBXu4QLDis
         5PSVWoXJH5lSLmNcjSrxR44s+T2JqlEAWkuDUQfxGgQOSloFbtZI0n8KujZoRq3c1+Gr
         v+xiS9bT5X0JDMFdOL77Z27z4dBPlr/HllGPzWxnQKi9RSLccMY4c4GIxxNeNt8fdmkM
         YxkG4oj9lkbvHYOxr3R0gxcqoQx9F+7dTaenu9YoCr2ds0/BvJOON6hAf9yt13PvnzsN
         Ipuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LdLHlKsKEFT/fVDlILkUUrriYCxDyTZYAd5HOZ1HRDg=;
        b=VnC8CXpDCRZQulI42o4bNthF+/4+z0j8CBRvY7ziNmnYoQUfHwg+8QnymT3khNLsGc
         olIC4nREz8BFAZTAk6MZkTKWCWsw/Qh/p19WPc8T+/d9lghGEO7DjriwOwkF21vMA/VN
         fwTSZUps3z9xgVs3gMAi6zQVCIUgTfMXpiXvzhOdx2YzEdgZuQ1ls9JLCykoRWQfQk/2
         MUKkcnjuH3WpA3mYocoYzgX8kcbnLeyrk0OntD9ckW3r4h/GAcQpAyDI+EnDs+2rkpYt
         SsYdP/gItX4RdRtizR567vPj0ylzrLs0JIszp+bab55icEvno2uPYD1GbkFpYWOfCXO3
         MqrQ==
X-Gm-Message-State: AOAM532hpKJyy7bY6bGstV3pWZRdBco3Ww8rPqSxoaZxZgaxbR0LTZ34
        NnyJvdrVnw6ygy8W9LK3D0o=
X-Google-Smtp-Source: ABdhPJxen3CTLTnRJO3l85gPTk589xOv1MyaXv++LG9X73e6GTpGQ1RSUPafJMwC5mRQmOy6BqDzgg==
X-Received: by 2002:a17:90b:285:: with SMTP id az5mr17055801pjb.0.1618709214008;
        Sat, 17 Apr 2021 18:26:54 -0700 (PDT)
Received: from ashish-NUC8i5BEH ([122.177.44.217])
        by smtp.gmail.com with ESMTPSA id i11sm9059473pfa.108.2021.04.17.18.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 18:26:53 -0700 (PDT)
From:   Ashish Kalra <eashishkalra@gmail.com>
X-Google-Original-From: Ashish Kalra <ashish@ashish-NUC8i5BEH>
Date:   Sun, 18 Apr 2021 06:56:48 +0530
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Ashish Kalra <eashishkalra@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: silence "dubious: !x | !y" warning
Message-ID: <20210418012648.GA4821@ashish-NUC8i5BEH>
References: <20210417153627.GA50228@ashish-NUC8i5BEH>
 <20210417205613.5c1aac74@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <20210417205613.5c1aac74@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 17, 2021 at 08:56:13PM +0200, Mauro Carvalho Chehab wrote:
> Em Sat, 17 Apr 2021 21:06:27 +0530
> Ashish Kalra <eashishkalra@gmail.com> escreveu:
> 
> > Upon running sparse, "warning: dubious: !x | !y" is brought to notice
> > for this file.  Logical and bitwise OR are basically the same in this
> > context so it doesn't cause a runtime bug.  But let's change it to
> > logical OR to make it cleaner and silence the Sparse warning.
> > 
> > Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
> > ---
> >  .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> > index 358cb7d2cd4c..3b850bb2d39d 100644
> > --- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> > +++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> > @@ -58,7 +58,7 @@ sh_css_vf_downscale_log2(
> >  	unsigned int ds_log2 = 0;
> >  	unsigned int out_width;
> >  
> > -	if ((!out_info) | (!vf_info))
> > +	if ((!out_info) || (!vf_info))
> 
> 
> While here, please get rid of the unneeded parenthesis:
> 
> 	if (!out_info || !vf_info)
> 
> 
> >  		return -EINVAL;
> >  
> >  	out_width = out_info->res.width;
> 
> 
> 
> Thanks,
> Mauro
Updated Patch as per your feedback

Thanks
Ashish

--XsQoSWH+UP9D9v3l
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-media-atomisp-silence-dubious-x-y-warning.patch"

From 770317157c3a7abf2fda1d71b0bd651c33bf0bfa Mon Sep 17 00:00:00 2001
From: Ashish Kalra <eashishkalra@gmail.com>
Date: Sun, 18 Apr 2021 06:52:03 +0530
Subject: [PATCH] media: atomisp: silence "dubious: !x | !y" warning

Upon running sparse, "warning: dubious: !x | !y" is brought to notice
for this file.  Logical and bitwise OR are basically the same in this
context so it doesn't cause a runtime bug.  But let's change it to
logical OR to make it cleaner and silence the Sparse warning.

Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index 358cb7d2cd4c..71c3e7dac052 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -58,7 +58,7 @@ sh_css_vf_downscale_log2(
 	unsigned int ds_log2 = 0;
 	unsigned int out_width;
 
-	if ((!out_info) | (!vf_info))
+	if (!out_info || !vf_info)
 		return -EINVAL;
 
 	out_width = out_info->res.width;
-- 
2.25.1


--XsQoSWH+UP9D9v3l--
