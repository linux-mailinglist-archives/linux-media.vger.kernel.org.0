Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D287C46746A
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 11:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350422AbhLCKD2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 05:03:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbhLCKD1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 05:03:27 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20BAC06173E
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 02:00:03 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id r25so9191238edq.7
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 02:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0dtq3RV/7mFC2iXGzu3eJkRL8kV5NvLsOgUXONAcOTU=;
        b=Croet5EHtSpev9rm8E4i2UfIK3Z7SmmLWGXamCXY7QvEysTJOYHRJMNGYF1ayDa/fd
         WSl9iQvm0RR2OgNvS9ds9odV8ZCx1RK+uiSBiSRx8xLK5LGCKOfAtUPaC3GAA4MuGGOq
         brCNWXXuTklz7JtV7hKUplSR7JA+COcoJ9BX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0dtq3RV/7mFC2iXGzu3eJkRL8kV5NvLsOgUXONAcOTU=;
        b=yLR7Z2QjgO/YcD1itgCl3ojuhgt/kZb8i+TF+MfBjM6uieLkiCgUxvMgBfSmJdUa1p
         4gMEfqU+ZnXJHhE/woC1IRzjzb0A2irT1B8606hnJf5iOAw9RqBuZ3/unH+ERL71RGYF
         GuaUXrngz3OCReVaLSe6b4bON63RMdVDEfSeJd1gl4lLbqPM1r0slNLden43mpn7g9K9
         nm++rN+pN0TAy2Ngl6zUT8sVmQcUE1R2cxPBj29Zi+Mb43SKPMTxRNOIb764S7Xb7CXY
         8odTLmZvVQXGhv9qF0q1mzLev4s6gVKQDndFA+dPI03vSp62pPA4m8UREY3NepzMfb9+
         RCGw==
X-Gm-Message-State: AOAM532mo6HZ2lEbxOI71d25ed1asjX64wNv8vqq2uV0jLslBFIbdJ4i
        PHm4sleafgLHt2eqTjd1/bp9ww==
X-Google-Smtp-Source: ABdhPJxX04cr0jIBXinQQx2RsdrSaRxOB2S52HaQxZh8lMIwwJGQIATRWpoD5FSTf09TkGqd5/fZVw==
X-Received: by 2002:a17:906:1993:: with SMTP id g19mr22447246ejd.50.1638525602465;
        Fri, 03 Dec 2021 02:00:02 -0800 (PST)
Received: from karbon.home.net ([94.26.108.4])
        by smtp.gmail.com with ESMTPSA id d1sm1651767edn.56.2021.12.03.02.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 02:00:02 -0800 (PST)
Date:   Fri, 3 Dec 2021 12:00:01 +0200
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: ovm6211 linux driver
Message-ID: <YanqoZ4xh+vtPIRM@karbon.home.net>
References: <YanepzHYQMH/DfHY@karbon.home.net>
 <b881c5b5-ee29-f250-5270-66c9d7357c94@xs4all.nl>
 <63c9501c-6a58-ed69-265f-45f203952242@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63c9501c-6a58-ed69-265f-45f203952242@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21-12-03 10:55:15, Hans Verkuil wrote:
> On 03/12/2021 10:43, Hans Verkuil wrote:
> > Hi Petko,
> > 
> > On 03/12/2021 10:08, Petko Manolov wrote:
> >> 	Hi guys,
> >>
> >> On request by certain company we've developed a media driver for 
> >> OmniVision's ovm6211 camera sensor.  We just got permission to mainline the 
> >> code.  How shall i proceed?
> >>
> >>
> >> cheers, Petko
> >>
> > 
> > You found the correct mailinglist, so that's good :-)
> > 
> > This is a good starting page:
> > 
> > https://www.linuxtv.org/wiki/index.php/Developer_section
> > 
> > Check the 'Kernel driver development' - 'Submitting Your Work:' links.
> > 
> > Regards,
> > 
> > 	Hans
> > 
> 
> Actually, this is a better source (for the media-subsystem-specific stuff):
> 
> https://www.kernel.org/doc/html/latest/driver-api/media/maintainer-entry-profile.html

Thanks for the pointers.  Perhaps i should have mentioned that i am already 
maintaining several kernel drivers.  This is my first 'media' driver and my 
question was more in the lines of how you guys are doing it, although i did not 
vocalize it explicitly.  I assume the above link will give me the bits i still 
don't know about.

I'll send the v0 patch shortly.


thanks,
Petko
