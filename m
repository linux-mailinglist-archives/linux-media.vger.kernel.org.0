Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E725E257124
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 02:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgHaAKO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 20:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgHaAKN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 20:10:13 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A06C061573;
        Sun, 30 Aug 2020 17:10:13 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id g207so3615087pfb.1;
        Sun, 30 Aug 2020 17:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qLPEfrUi2jCIWCjZKRo6ZLLPjq6acaeWm3ALBWaznXk=;
        b=F3CnXuCn2pzKt3lquHeMzcnfquvPYqjIIQrtoVQ84O4mtYiNWRWGSKyMzzLuDuhGR4
         Nssb7lzRM/8lmZn3YJ/SDCYbCK1WuoIDIOLyZIoCfI3iBh0ZaKcgxUz1KdFsHqvFBFhd
         JFgXycahfNDgPcdZzml0356S32S3kCnUReHH0TM+YcG0DuVLLILPwNtTxc6IzG//KJP5
         vTDafW5Mg2L7N4q+XmztACw6cYDx5XNBq7kGiriHSjFiivFuSsbngdaP8f2YoCKeaF5z
         K24hzkPCpJZNT/X3sG6KbmlL/C7QVm79GnceeFKDJz4tJIzhc9ecsuX7QBcJclyJQnDI
         og+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=qLPEfrUi2jCIWCjZKRo6ZLLPjq6acaeWm3ALBWaznXk=;
        b=X/EWMkQVfuS4gERhDQqbdQYQXCRvkUWTXm+FvxNwZ+vQOj9apiJUlE/d7InOT2ro47
         yXFlYoMstB83fsoAmPwL3tdyoRqz4ZtyI6Z2sNhShEjqWzE09y+kamXK5PF8EzS4svum
         EkbHnqEHcgDjXwHBX6mWcpnXhnbdSyxhZI8nP8NsQ/cyY+Ke1F/rYG/dhMeIerN+yHHP
         Xi26+tpM59Lnd4PKU/+5Lu1Io+XhlKc2v2D7WvLRHhaCw/MBc7uL8yCTY350SHDPBZQK
         VbZRHfY9hm/zwdPkH+Pl4ptl5AnIbtBiIZ8OiA9KhJDss9kvxk538V6uoDcltBXX1ap9
         WIGA==
X-Gm-Message-State: AOAM530SbBufLc4UdCfEc/QyTVcCsUAmHXKhNAwBM3YQdFM+bhaGMz6u
        FzI1a6j10wc/82QPXrGMbQw=
X-Google-Smtp-Source: ABdhPJwWpKZRGsCUjZpmp33QErRgjRznzLg4iQdazkktoI5TvtWGJPMJCAhKW2BkvmSCD8WTPNRe2Q==
X-Received: by 2002:a63:cb0a:: with SMTP id p10mr2440832pgg.314.1598832612609;
        Sun, 30 Aug 2020 17:10:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q5sm5961917pfu.16.2020.08.30.17.10.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Aug 2020 17:10:11 -0700 (PDT)
Date:   Sun, 30 Aug 2020 17:10:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] media: uvcvideo: Fix race conditions
Message-ID: <20200831001010.GA92208@roeck-us.net>
References: <20200830150443.167286-1-linux@roeck-us.net>
 <20200830155833.GA6043@pendragon.ideasonboard.com>
 <ac2080a1-3b00-ac9e-cd49-d1ee84c6ca25@roeck-us.net>
 <20200830213621.GC6043@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200830213621.GC6043@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 31, 2020 at 12:36:21AM +0300, Laurent Pinchart wrote:
> Hi Guenter,
> 
[ ... ]

> I'll try to prototype what I envision would be a good solution in the
> V4L2 core. If stars align, I may even try to push it one level up, to
> the chardev layer. Would you then be able to test it ?
> 

Sure, I'll be happy to do that.

I ordered a couple of non-UVC webcams (pwc and gspca) from eBay for
comparison. Both of those use the v4l2 locking mechanism, so we should
be able to see the difference.

Thanks,
Guenter
