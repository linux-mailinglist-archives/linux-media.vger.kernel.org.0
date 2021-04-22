Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97AA83681A2
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 15:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236363AbhDVNno (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 09:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236333AbhDVNno (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 09:43:44 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72484C06174A;
        Thu, 22 Apr 2021 06:43:09 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id h8so13371292edb.2;
        Thu, 22 Apr 2021 06:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/X+gdpa7nitmW2LfUzsCx+59dgi99zMR2DugLsgYeVY=;
        b=r6lLcdebfCTFu2pd9lwHbs5JefCnwomGDE9DWqi02d0FlvcgrAdgFei4gyN/l4l3DM
         Z6UveAIULr/vdBT1XOOYKMn0ZLPA9ndTj456Va2XnM0COfIaYdof/AOGH++/PYKX96QX
         lMtucwWwqedRrVOfMxMrOCTY6alMO1JvDK5da0gX4iYmuFGpUj1va5GWG4ukBwMgCj6l
         +td0fxi3r2K8ICwb1k+L80907KZPKnksmc/r3Zc2nU1rx+uF5PkNsX61BtsFkuaIOlWZ
         NZawvZ1qXxpQfV8j/+36qIMqUSUbTKe4BTrnhzsVH5rNSjX2bjaoXxRe5s/YRNfKdCYi
         /fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/X+gdpa7nitmW2LfUzsCx+59dgi99zMR2DugLsgYeVY=;
        b=c14pTchRViLX5a5ht/SX0rIuO16TCwwA23Ueg7tOwdULgzyC9eqz/R93+t45CpXIvB
         5L7IXvjbc9jOk3maZ03j7sYXlUqohPtRTAnYJoCky50NtHZGNn0TEEgmeO+Diq4nuJoX
         pzIiDkuGpQC63vz9qnF9MUM8oxJw/pZgZxZcwzQkkZ7Yrx3pGzGVsZpMczrAzUknu05Z
         QydmiATdnTUgC79jsFNg7Pn5wmgT0bjxbrSJ5qpk22L6XJzHZ+MYx9kBukUzrkhCW3Cg
         0FMOeH7On0vn4/HV2+6LINUERwWhyQjiX2ORsb4jXu92w++Ebkgi63xfv44zAke8EleG
         daoA==
X-Gm-Message-State: AOAM530S8smhjc/qJqu+cF+zS4Pq6+t40jv5qAzFK1B20WMLUg0x03R6
        VJg0hX3i2dLmo3/1+pyJ5Yo=
X-Google-Smtp-Source: ABdhPJxni7A19BFMdj/QOaNYmYXKzoN9GGJkUu7R1VHY8fFW0VN7v9e3beuiEtbxdpyntwIAaKM2TQ==
X-Received: by 2002:a05:6402:4314:: with SMTP id m20mr3862131edc.5.1619098988214;
        Thu, 22 Apr 2021 06:43:08 -0700 (PDT)
Received: from agape.jhs (na-19-64-241.service.infuturo.it. [151.19.64.241])
        by smtp.gmail.com with ESMTPSA id hg19sm1931269ejc.24.2021.04.22.06.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 06:43:07 -0700 (PDT)
Date:   Thu, 22 Apr 2021 15:43:04 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH] staging: media: atomisp: replace pr_info() by dev_info()
Message-ID: <20210422134302.GA1388@agape.jhs>
References: <20210422103037.GA239298@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422103037.GA239298@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 22, 2021 at 04:00:37PM +0530, Deepak R Varma wrote:
> It is recommended to use driver model diagnostic macros dev_*() instead
> of pr_*() since the former ensures that the log messages are always
> associated with the corresponding device and driver.
> 
> Suggested-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Note: There are few more pr_into() calls that I have not replaced since
> they are very basic (entry and exit) and temporary. They can be removed 
> if the APIs are fully tested. See this example:
> 	pr_info("%s S\n", __func__);
> 
> Let me know if I should remove them and resubmit this patch.
> 

Hi Deepak,

usually log functions saying "we are here in the code" are not needed,
ftrace is designed for function tracing and other useful things.

I think this patch is aimed for substitution which is logically
different from deletion of function calls.

pr_info deletions can be provided in a separate patch.

Thank you,

fabio
