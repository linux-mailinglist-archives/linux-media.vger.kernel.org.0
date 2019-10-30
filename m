Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE8DE9936
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 10:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfJ3JeB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 05:34:01 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32968 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfJ3JeB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 05:34:01 -0400
Received: by mail-pl1-f194.google.com with SMTP id y8so743996plk.0
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2019 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dHt8xmgIY1Zu8o3Odq810rQJYiQ3EDnuokPmILyCi40=;
        b=Q5NAYgao/jXfBsZ4i0cijFUPxE6TMxG8N+DDCvw3S0ypSp9Uhkclrt0C7ZyXQJkxMF
         B5Azo0yVgzK1Lm/HtVC1+P+8NLO3GeiOUYhY9n0iA19RIL9bEjRDd++5Y74jA/jFlBL6
         HJ6YOEtkuNRg/kvrxZrbYVXL1Qz4ifJYEhAEeeMnrMTbeGaWlVHQMuhXFGCJcHSavPwO
         0F0bO0uCvFr2GAJ+DFYT2fkQo6GlTX0kZ4qzg6ig6DH7KVJDNVYCkmxnWONGu/Zk1duS
         w3xqZ7lk0A633sBiDEluslRqG9O0RHKN+1Tdq+/wJGvD3Wz/Uqt75MFGjYNc+Au3jlI0
         hDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dHt8xmgIY1Zu8o3Odq810rQJYiQ3EDnuokPmILyCi40=;
        b=kbBbkvB0uR+Wi14zRjoPMSEKtvPkcP0kYgepGdE6yPJZySouBDhXXVyoPBBfnFyRdT
         +lhF09osjF8/BchY+zslschgpqkSJ/6SLrIVA5fU0SHVFATHGRoS1pYB2EGkDlPaMulQ
         FmMLtPEERBFPEkWvZziVE6IJfg/m0CVSlbeHQfUXY5JNcg+gtJnDhCsvx7gDALMFsRkq
         LNMdpAYaILL38fw1rbQpmrA/wggwtOLntMweDaZURLR559fAxAI1G1En2Ryeeg9sHkz9
         v6IgScdn3nvk8u7Cxiz/Cc5n0Brl4fRZ+5dTAU6dimVULhKdYjH8i1objt2iwx//s+w2
         hzAQ==
X-Gm-Message-State: APjAAAWbHcLhOt7Toa3qQq7YcfQe6FuWKyM1HM5NfE9acpSiO4GK29gf
        xxkwYIYTKMq0zPM6T4zdMpiY
X-Google-Smtp-Source: APXvYqyB79vuui3L771+FWwAqgE5eWr71fvsNfKt24AA2PmRgygcBC0iGb+2exeZLjcTPu46alJzGw==
X-Received: by 2002:a17:902:a584:: with SMTP id az4mr3507150plb.74.1572428040369;
        Wed, 30 Oct 2019 02:34:00 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:618e:77d9:c9fa:423a:3851:8df4])
        by smtp.gmail.com with ESMTPSA id i126sm2090862pfc.29.2019.10.30.02.33.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Oct 2019 02:33:59 -0700 (PDT)
Date:   Wed, 30 Oct 2019 15:03:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v3 2/2] media: i2c: Add IMX296 CMOS image sensor driver
Message-ID: <20191030093351.GC11637@Mani-XPS-13-9360>
References: <20191025175908.14260-1-manivannan.sadhasivam@linaro.org>
 <20191025175908.14260-3-manivannan.sadhasivam@linaro.org>
 <20191029121320.GA5017@valkosipuli.retiisi.org.uk>
 <20191030062634.GA11637@Mani-XPS-13-9360>
 <20191030083544.GG5017@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030083544.GG5017@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Oct 30, 2019 at 10:35:44AM +0200, Sakari Ailus wrote:
> On Wed, Oct 30, 2019 at 11:56:34AM +0530, Manivannan Sadhasivam wrote:
> > Hi Sakari,
> > 
> > Thanks for the review!
> 
> You're welcome!
> 
> > 
> > On Tue, Oct 29, 2019 at 02:13:20PM +0200, Sakari Ailus wrote:
> > > Hi Manivannan,
> > > 
> > > On Fri, Oct 25, 2019 at 11:29:08PM +0530, Manivannan Sadhasivam wrote:
> 
> ...
> 
> > > > +static struct i2c_driver imx296_i2c_driver = {
> > > > +	.probe_new  = imx296_probe,
> > > > +	.remove = imx296_remove,
> > > > +	.driver = {
> > > > +		.name  = "imx296",
> > > > +		.pm = &imx296_pm_ops,
> > > > +		.of_match_table = of_match_ptr(imx296_of_match),
> > > 
> > > No need for of_match_ptr here.
> > > 
> > 
> > AFAIK, of_match_ptr is needed for !OF case. Else we need to manually add
> > #ifdef clut to make it NULL. Does the situation changed now?
> 
> ACPI based systems can also make use of the compatible string for matching
> drivers with devices through of_match_table. This may sometimes be the most
> practical approach. I.e. you don't need ifdefs either.
> 

Oh okay, I'm not aware of this. Will remove of_match_ptr then.

Thanks,
Mani

> -- 
> Regards,
> 
> Sakari Ailus
