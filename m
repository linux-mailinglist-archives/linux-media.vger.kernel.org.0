Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA4335F6D9
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 16:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352168AbhDNOvn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 10:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352135AbhDNOv3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 10:51:29 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F79C061574;
        Wed, 14 Apr 2021 07:51:07 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id t11so7045587qtr.8;
        Wed, 14 Apr 2021 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=hGtfqo5Bo6cc29ptmRB3Rcvg0AUrNYFdCJJIvwgoZk4=;
        b=W+wbeZWbrNkJ38iJZGGqvLcGCG5QfT2PDdv9szoQGjlZ/ht5i0k77xTd0wfuWKrnE/
         vsRJXOeXLzndtAMMkqApYdqssKzVxMCNE7v7tfVZmcESZ+e3IOk8lxHGQr8ZL6Fkt+wT
         CDHuURFLWlKMpEOVQ77UMNYx1O48RWV7C3DP3gBXyjcLiIchh0eiyVH0zRU7hMBYHwaF
         U3GA4SiW2Qz3tbK7hRAQj9G0N1Pz4OTqoH2C8JJKmEcxgXYqsgSXHvqhG8XYRA+V8zeP
         JiehTHXsjqiwCPNZwhNzjQ6LIgFoieaBa9ASFNv5cpRPaGP6rqOoH0oHQAsh5NcQCUzz
         R5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hGtfqo5Bo6cc29ptmRB3Rcvg0AUrNYFdCJJIvwgoZk4=;
        b=j3uB7g50Blku6Q5WoEhion3uQdTlv6mI8cskVEIFEE03qb0ChypeSFKXsOMsHP9wF1
         LuEBQiIxMPY6oWil7H4Bzk7Pdz7DtejZcB0A1QIVpOpquGfhHXksIzpS2hLn/a482xdM
         mbx4ADFUm7HPWtKOziiMGxUTWwPXGH89CE+IyBPelsl/q022+mNtm4QH7qeT8XnYSB8l
         3SsmWTBd8Rn+b0SPVlf+KemKwjjaDjD4PvtATcR+9s7/l0/XIij/56VttfQ8sOx7dGok
         zmcSikKL9gVnG3LPSDKToMO7Nj04iOQ0O0W6azBvUMM0G2ff1ol7WQ5c5BqhlKtJIlZC
         6mvQ==
X-Gm-Message-State: AOAM5313Q3xvhGYLN0i30c1lG/3w0n22C+6fo+1xsH7xK3Th49i2NaaJ
        BZvRbjexbr0TMEmH2k8CTqt3lAbSPzSzMKGa
X-Google-Smtp-Source: ABdhPJxxLl/SLPnQiIUj5qukT/Wp0of+NZJZ40B76pC2bad/th4kkBgMUo80bs8aBHs5wqj6Wt9YFA==
X-Received: by 2002:a05:622a:2d2:: with SMTP id a18mr21067960qtx.146.1618411866781;
        Wed, 14 Apr 2021 07:51:06 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:e514:d03b:27b2:153? ([2001:1284:f016:a037:e514:d03b:27b2:153])
        by smtp.gmail.com with ESMTPSA id p10sm8688096qtl.17.2021.04.14.07.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:51:06 -0700 (PDT)
Message-ID: <1ae81e5c2380cf928579d5c62360bdd03a6bbc67.camel@gmail.com>
Subject: Re: [Outreachy kernel] Re: [PATCH 1/2] staging: media: atomisp:
 pci: Correct identation in block of conditional statements in file
 atomisp_v4l2.c
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Julia Lawall <julia.lawall@inria.fr>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Wed, 14 Apr 2021 11:51:02 -0300
In-Reply-To: <20210414144502.GW6021@kadam>
References: <cover.1618409028.git.alinesantanacordeiro@gmail.com>
         <0ef18a36d6905628fa596fd5e0a32fdb9c6a8ada.1618409028.git.alinesantanacordeiro@gmail.com>
         <20210414143011.GV6021@kadam>
         <alpine.DEB.2.22.394.2104141638140.25259@hadrien>
         <20210414144502.GW6021@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em qua, 2021-04-14 às 17:45 +0300, Dan Carpenter escreveu:
> On Wed, Apr 14, 2021 at 04:39:20PM +0200, Julia Lawall wrote:
> > 
> > 
> > On Wed, 14 Apr 2021, Dan Carpenter wrote:
> > 
> > > On Wed, Apr 14, 2021 at 11:06:02AM -0300, Aline Santana Cordeiro
> > > wrote:
> > > > Correct identation in block of conditional statements.
> > > > The function "v4l2_device_unregister_subdev()" depends on
> > > > the results of the macro function "list_for_each_entry_safe()".
> > > > 
> > > > Signed-off-by: Aline Santana Cordeiro <
> > > > alinesantanacordeiro@gmail.com>
> > > > ---
> > > >  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > > b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > > index 0295e2e..6d853f4 100644
> > > > --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > > +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > > @@ -1178,7 +1178,7 @@ static void
> > > > atomisp_unregister_entities(struct atomisp_device *isp)
> > > >                 atomisp_mipi_csi2_unregister_entities(&isp-
> > > > >csi2_port[i]);
> > > > 
> > > >         list_for_each_entry_safe(sd, next, &isp-
> > > > >v4l2_dev.subdevs, list)
> > > > -       v4l2_device_unregister_subdev(sd);
> > > > +               v4l2_device_unregister_subdev(sd);
> > > > 
> > > 
> > > It's really more common to use curly braces for list_for_each()
> > > one
> > > liners.
> > > 
> > >         list_for_each_entry_safe(sd, next, &isp-
> > > >v4l2_dev.subdevs, list) {
> > >                 v4l2_device_unregister_subdev(sd);
> > >         }
> > 
> > A quick test with grep shows 4000 lines containing list_for_each
> > that
> > contain no {, out of 15000 lines containing list_for_each in all.
> > 
> 
> Huh...  You're right.  Never mind then.
> 
> regards,
> dan carpenter
> 

Ok then :)

Thank you all,

Aline

