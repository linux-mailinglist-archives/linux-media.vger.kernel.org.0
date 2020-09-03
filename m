Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E72025C8A8
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 20:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbgICSVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 14:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbgICSVf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 14:21:35 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5FFDC061244;
        Thu,  3 Sep 2020 11:21:34 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u18so3809072wmc.3;
        Thu, 03 Sep 2020 11:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xnj90cQeIAUzM8X1DU7D3qe+cvr4mKrVyMj9gojTDnU=;
        b=lit6mD8ojmWLJpH5VgviiSew4e1h6g7UkWjSaHP2CMmto+VctmLLpfonu9y5YYszfh
         4HRUqwK2/QZPAE91f/cYntJYJujunP9AklTQdkbAJXKuaiO7xjgYxb8H6R4aTa0qcUSS
         kXoWkAKPcrnhAAHCVxFz97xvJEP3nDFDuRdOmN3MPxonghZxLFZubUP+1z/jrNV/fhUe
         yCd34Pa8JvrlXfS5+6xaO3PTMZNHagjUGlR7MCRI5BfOcEalbG+gh8ajfxAXT7qzpcSG
         fCnPdtfiDLfGitPPfP1HdBgQrCB3aDRa4xnfHPZTPQUmIIsUxDaAU8tDy1c0dXSDQ5f4
         OjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xnj90cQeIAUzM8X1DU7D3qe+cvr4mKrVyMj9gojTDnU=;
        b=MGMTlwv647S+orPH09Zlu85in9QqmXL659MJTYG1uzmHAcWDQF+BNdjhtIfntoKeCw
         PVFR+78UI/cgu7KgJraUIqXigrODFN1KQdi4vE8yKJpV90mEhUJ3dMc9OIYHj7mA7u6F
         cseu7Il5MwbhSFao4CXzacgnY017d8DIqOs4q0NNv+YN9KcJHuoeu4EDYCO4KEsETPHn
         7WF279QCjPiDtcbMztdjqhqByMk5pSUhIKCmxUVEOA6vjnyy6gszOvRt/pdyTESZ+4R9
         tyqFEp004SkWjUao1QYJHt0HKv8o84fLE5jeoXi8JxmXEa7LwPQzti/ff9WJS5JCMQ4v
         La2Q==
X-Gm-Message-State: AOAM531pySLFr8MCFIpINtTnXt11FY6jBbvQ6+QmDMAIXB7Zs+ntoVqZ
        4eXy7JXR0qLSwUEgUcaIzYo=
X-Google-Smtp-Source: ABdhPJwuvVasdL+HnKler9zAB3ZWl1DtRzxQYr6hcc4+i0MKXr+7UH36ZTM5rxPOl+5QOzlcwous4w==
X-Received: by 2002:a1c:bdc4:: with SMTP id n187mr3707848wmf.109.1599157293356;
        Thu, 03 Sep 2020 11:21:33 -0700 (PDT)
Received: from medion (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id p11sm5302865wma.11.2020.09.03.11.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 11:21:32 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
X-Google-Original-From: Alex Dewar <alex.dewar@gmx.co.uk>
Date:   Thu, 3 Sep 2020 19:21:30 +0100
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>, devel@driverdev.osuosl.org,
        Alan Cox <alan@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Fix error path in lm3554_probe()
Message-ID: <20200903182130.ugsbzjyq3yc56mdv@medion>
References: <20200902184207.479525-1-alex.dewar90@gmail.com>
 <20200903121134.GB8299@kadam>
 <20200903154841.w5rppm325jobimud@medion>
 <20200903173843.GF8299@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903173843.GF8299@kadam>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> You're right.  I wonder if there is really any need for the
> lm3554_gpio_uninit() function at all?  It's basically the same as
> lm3554_gpio_init() except for the order of function calls.  Probably
> we could just rename lm3554_gpio_init() to something like
> lm3554_gpio_set_default() and use it in both the probe() and remove
> functions()...

I think you probably also don't want to return error values from
lm3554_gpio_uninit() as it is only called on module removal, so it'd
probably make more sense to just print a warning and carry on. I'll do
this as a separate patch and send it to the list, though.

v2 to follow...

> 
> But I don't know the code and can't test it so let's leave that for
> another day.
> 
> We still do need to clean up if atomisp_register_i2c_module() fails
> though, and the timer as well so could you resend a v2?
> 
> regards,
> dan carpenter
> 
