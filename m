Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9516E87948
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 14:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406600AbfHIMEd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 08:04:33 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40333 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfHIMEc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 08:04:32 -0400
Received: by mail-lf1-f67.google.com with SMTP id b17so69350833lff.7
        for <linux-media@vger.kernel.org>; Fri, 09 Aug 2019 05:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/B+CvQL5rs4wq7Xspdkm+Ri+jofCRq4T4Z6X75LinoM=;
        b=zbmS4e9Ctv/1RTpKHwiFA/SQuFNEismJ2x0EqOEJN1aYSSYaZa+KKU3YKJyFfD4J0X
         szT6fgsuLk591vkoCTjq/4q2Nx4ej3xSRW18xG1dS7VawP+H1RvBqTS4/l/zQ08yR8Et
         rBjLjVdi+ror3QG/S5c165tf05nMwYhBaNVkoNK84Z58Hd/VkkgRjI5uxWWkFXViHqYK
         4BRC9pqKt3JTzCaNn922TGFFwYParYXbdLDjw2mKEsQQDkayTmSSUWLDNCC8GacJYhb6
         P0g0KMnGVI/mqvX7C2UVfZ3u3KbJ3CLCbddkCVapKyVrfTGXUau2kmH/Zi0huSbZUoLh
         jRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/B+CvQL5rs4wq7Xspdkm+Ri+jofCRq4T4Z6X75LinoM=;
        b=gMpIL31axbmASYqQ6GSt6x++3CMtoEtYancGuh+WZFyR0gFtKC/Ftc/P7Yn+QEMnmB
         g54E7dkbMiv1uZNOiA2N1z3KgjgACVByR51hHu+sHFXWaH7DhXozEuJYApOUHbr0cXSR
         K4YGAHVIWqWyRtE0e+VPcJygXYm8popgGBY+bwIFIJS19OAgVaWIaC8RAFxmqqP+UvUo
         2GRyahOnt5g7MY0fOqMdr+SNKtMVDyyk9b2dkxa4f6jFojSyVQ1s2Rf0v25j4NI2pIDq
         PIKfLISM8iI9IiI55CbCtTcmxRap4cGZhMImBOAT5z8YCFO1Dv4a7in9AXmzjTjVhZom
         AwXA==
X-Gm-Message-State: APjAAAWkvIcPyLNbb1e084fK2pLYMlfXcH0VUlSsMi2JEqjiXWhFZ16K
        r3J31yd8GDw34LO4d8nFQXu+5Q==
X-Google-Smtp-Source: APXvYqzXDjsiSpiOIuL5xDOvfL/Qn1OhoC9VvuQ9d7mzUNCG0z4+5fpT89BZetjH/b7Odh9dfrhyRA==
X-Received: by 2002:a19:f819:: with SMTP id a25mr13214137lff.183.1565352270897;
        Fri, 09 Aug 2019 05:04:30 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id z85sm19400272ljb.101.2019.08.09.05.04.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 05:04:29 -0700 (PDT)
Date:   Fri, 9 Aug 2019 14:04:29 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] max9286: Add MAX9286 driver
Message-ID: <20190809120429.GE24385@bigcity.dyn.berto.se>
References: <20190809040558.10698-1-niklas.soderlund+renesas@ragnatech.se>
 <20190809040558.10698-3-niklas.soderlund+renesas@ragnatech.se>
 <5a640d94-799a-71ed-9f02-014adaabd595@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a640d94-799a-71ed-9f02-014adaabd595@ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thanks for your feedback.

On 2019-08-09 09:09:43 +0100, Kieran Bingham wrote:
> Hi Niklas,
> 
> This should be at least v5.

I don't agree ;-) This is a "new" series where multiple streams are not 
supported and there are no external dependencies. To indicate this I 
reset the version. I don't feel strongly about this next submission can 
remedy this if you do feel strongly about it.

> 
> Did you take the last v4 and work from there?
> I have made changes since the last posting. Did you get an update from
> my branches?
> 
> What changes have you made to this posting compared to whichever
> patch-base you have taken to start from?

I took my latest known good state and diffed it with all gmsl branches i 
could find picked what seamed most recent. Then I removed multiplexed 
stream support, fixed a few todos in error paths to clean up notifiers 
and unified naming of the private data structure.

-- 
Regards,
Niklas Söderlund
