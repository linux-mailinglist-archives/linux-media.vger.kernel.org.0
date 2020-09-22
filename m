Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143C9274381
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 15:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgIVNve (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 09:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbgIVNvd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 09:51:33 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B073C061755;
        Tue, 22 Sep 2020 06:51:33 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y15so3447013wmi.0;
        Tue, 22 Sep 2020 06:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ysqz6GyyNFAHuc6XNq36xYUlncxXozuNxpnDdtcRHI4=;
        b=WXFdwlqUUNEI/1EwlxVKHGNQJgea/QOvczBrlAL3LVIZxU0EHzFZ3dFNp7as2Hjlyq
         Uw2VC09xn3mh92riN9pPqj9Rfq4BFz+FchDRoVilKepcdpTfzMsY+LJ5j4tdhkiQg+Tr
         uer1db60wLEbMcDlNJlEaad80Oi1Hql5rXHEadRAGPGGxgr5kQMYC4FsBUJiKXZeiK95
         iTM45RjqpguYkU+ZNatnajENvxS8xoUy75WPJL8DHkE98KkZ9gEtsu6UbpPbmhEiWrAZ
         Pp3KkhGa/4jS7fgVIP1wPUL9aBU6dK29/mpvPqLaouKaX69JzNYMibXSqzYqLs/raAuW
         KsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ysqz6GyyNFAHuc6XNq36xYUlncxXozuNxpnDdtcRHI4=;
        b=uUyvoOYrRmVYMexgf27sf9/3fkejjGUMjtfnaz3qVmViHYY9ot/CFoRpBlTjhr1m46
         fRSIBcNjn/kvw9cXjgREpC9AcfofPB3mkirr+WiBnTxyrVko79rXbQDUPTrpVCQrDd6U
         kgy+/Vbmq5I4HhQGBkF6uDrw3YX6J70dskxGuOj/HbvJ3XD17PSo9VfGPaOeWCP0mZcu
         1Aljho8E/VOKBiY1xkUfcWNeqN2FfhV4vkGB9hDHbmAisHmivPDN2ksbkc2+jMxSdvXl
         IbPZxT1zY68L5PcCOXDvDQbJbngCTcNKlqvx9FdaEF8yYa7E498SFoaMpj/vlzyRM/9r
         LiRQ==
X-Gm-Message-State: AOAM530BauCyL0GSScSdVL1ch4guCtNzFgMvQ524IMQFE7cU435iQet0
        VoOCDNRMoQckIHeSiFPdF88=
X-Google-Smtp-Source: ABdhPJyaXlYNr/My6wmvyG7+TvO3d2qoj25uGwR0xvS4xN6bjft3EN5lwy5xfsv2s+GJmPV/+Wub5Q==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr1128137wme.89.1600782692118;
        Tue, 22 Sep 2020 06:51:32 -0700 (PDT)
Received: from lenovo-laptop ([176.12.107.132])
        by smtp.gmail.com with ESMTPSA id m23sm4452000wmi.19.2020.09.22.06.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 06:51:31 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
X-Google-Original-From: Alex Dewar <alex.dewar@gmx.co.uk>
Date:   Tue, 22 Sep 2020 14:51:28 +0100
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH REBASE 0/3] atomisp: Rebased fixes
Message-ID: <20200922135128.f2yuf7cixb3hfwba@lenovo-laptop>
References: <21f18dc2-a1bc-0a37-0336-fc35170a40e9@gmail.com>
 <20200922090914.20702-1-alex.dewar90@gmail.com>
 <20200922112729.313d454d@coco.lan>
 <f14fac45-d713-a6ee-f0be-906a6d971b43@gmail.com>
 <20200922132727.GG4282@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922132727.GG4282@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[snip]
> > That sounds more sensible. I've also just noticed that I introduced a bug in
> > the first patch when rebasing it :-/, so let's hold off on the whole series
> > and I'll do a proper tidy and resend after the next merge window.
> 
> Is the bug the memory leak if lm3554_platform_data_func() fails?
> 
> regards,
> dan carpenter
> 

>  
Nope. I put a "return ret" for the last check instead of "goto err_del_timer"...

The version of this code in linux-next does the correct "if (PTR_ERR(...))"
check after calling lm3554_platform_data_func(), but this patch doesn't
seem to have made its way into linux-media yet. All the more reason to
resend my patches after the merge window, I suppose.

Best,
Alex
