Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5657DF515
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 15:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjKBOdE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 10:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjKBOdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 10:33:02 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2272B1BB
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 07:31:19 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9c41e95efcbso149458266b.3
        for <linux-media@vger.kernel.org>; Thu, 02 Nov 2023 07:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698935477; x=1699540277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IM5n/dsc1U3VyZD/kU7nFCD3rW9G/9wfv8XONCzUoVQ=;
        b=vBlzl1CZVZNRYlwLKEFPN0c/8KRxxrWUYlo+b1k+WgWSdV1KXOebpflvDGM+3hgkI5
         T/lSsxKOlzOhDUyWdL66oSH4cWPSsClpTeTloiSKzLmBG0IVGHKr2URb2LxYBvnvZDd9
         NoBbX8QGw6tUrZ5W9PWDmLiBi/Lxd/du8vJEt/HHr1p05VgPok7tVD9PMqTSQp+3OM8E
         jSfKLVmgtfMUB6v/zBJesRjqMSC6rOhMNH3ILtqZ9j6+mBWHTkomEZYkd9PK/CpUbFKd
         x1f8Rn4XOmp5uV8hVNP1mPniGxMgNk/pKsB7dt3UB/O6oOZA/yXyj4/GFdZ/tZYeqafx
         uhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698935477; x=1699540277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IM5n/dsc1U3VyZD/kU7nFCD3rW9G/9wfv8XONCzUoVQ=;
        b=UpODrr7Eqd/a/OM5AaTC4OGfgEpj8oa4OvfO+olp9bfju56/dDKukbffO6/9D2w6X0
         QEQ4gxaK3wgyiiphb5294GD3eB7u4UXOLeYXMS4zINkCTLsR3Is6R5kVqImbI5NrVKik
         pHXYsO7hNgM4IJSaZHljClT4o04SAyfjpQ1Xb/QwLVDZGuj/nb4MtL4vtRQVm+FDzuCZ
         bVk3i0wgn4DzBSwX4jy/4fvDGFnNxvIcP5CVBpw0LWr6v7X8ZQHT4wBMccddlk/+ddcc
         4zKOg/4NvR7TcqsDTvgkhIzO+tjioZ8iJm7EM7pa2hpKiufRV5LCnSXBRzAZ4H/8NRJC
         w5Sw==
X-Gm-Message-State: AOJu0YxC6u64UBTeWKSoarKYdfcWkNsJ+5eTWPfppYE58ZTAcn4l1plQ
        2vpVP5fq8uGiVzNdhghQ5XtuiA==
X-Google-Smtp-Source: AGHT+IHyujoiAsaChivrEQn1HXmVMVyLwPAXky87rdhKgOFCHxxWUybvxziS+0RLPGY5Y130m30Fgg==
X-Received: by 2002:a17:906:7956:b0:9c3:a3f2:4cec with SMTP id l22-20020a170906795600b009c3a3f24cecmr5101056ejo.0.1698935477571;
        Thu, 02 Nov 2023 07:31:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f25-20020a1709062c5900b009ad7fc17b2asm1199083ejh.224.2023.11.02.07.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 07:31:17 -0700 (PDT)
Date:   Thu, 2 Nov 2023 17:31:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Alexandra Diupina <adiupina@astralinux.ru>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
Subject: Re: [PATCH 1/4] Remove redundant return value check
Message-ID: <fc1ba609-93d6-4508-b6ac-bba9471cb075@kadam.mountain>
References: <20231102141135.369-1-adiupina@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102141135.369-1-adiupina@astralinux.ru>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 02, 2023 at 05:11:32PM +0300, Alexandra Diupina wrote:
> media_entity_pads_init() will not return 0 only if the
> 2nd parameter >= MEDIA_ENTITY_MAX_PADS (512), but 1 is
> passed, so checking the return value is redundant
> 

It can return an error because of this check:

drivers/media/mc/mc-entity.c
   215                  if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
   216                                               MEDIA_PAD_FL_SOURCE)) != 1) {
   217                          ret = -EINVAL;
   218                          break;
   219                  }

Plus I don't like removing error checking for this reason.

Earlier this month I fixed a case where someone removed an IS_ERR()
check but then we modified the function to return error pointers.
https://lore.kernel.org/all/356fb42c-9cf1-45cd-9233-ac845c507fb7@moroto.mountain/

regards,
dan carpenter

