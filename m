Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8700172831A
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 16:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236114AbjFHOza (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 10:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235886AbjFHOz2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 10:55:28 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3572410FB
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 07:55:27 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51491b87565so1262526a12.1
        for <linux-media@vger.kernel.org>; Thu, 08 Jun 2023 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686236125; x=1688828125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t1Avui9kypOZ3ZbiikciJbjmFmLQsq6Wb+XsP3tHb1Q=;
        b=ZSq6CPK314GP1qwGsQfxMgt0G/lgNGPtr2TwNLKYTaQDrdDO6ZIFlUpGjknYNHOywz
         G7K1ueU/3oPOCkCyHPIvbLvKUp+bvTBcyZahVaIBYFyX4gbGqXvQsXWHPiC5ddfH6UBz
         OZywfCH2mDj+8F5oQI2Urd0ot+wmxFGLQhS5h0959rMoZhmXl6qOmdrqoa/RKKn8al14
         34QKvUH2tYS+9tBr0Ew6Hqvv/vf2ZdVHIRABM7eWYJtZBrIubOUG/J6+gkHeOTkB1exR
         srcev7yXF8vgFq2oSWWqg5F8rEtD1wIOnNdM9ApMcE4wBwKRf8y0C5n/b1TwxAFoZNS9
         kjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686236125; x=1688828125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1Avui9kypOZ3ZbiikciJbjmFmLQsq6Wb+XsP3tHb1Q=;
        b=iVJKUkyKO5aadd9JnP/Q3emv3ri/r1TLgoLSq7vXGyq48MHVnXOhIBS/UYppPfOZWm
         ALw4Em2GE0A0E8rKhiTYu6aUCRLDxHrQ7W6RsjJo8GZQDv+hH1F0P7l5jqIVeMOg410Y
         b7o6CXHkP2ww7WVsEedFNZg4NwRlBGgQ+rskPBF81QaTzVY89DtjCbQOnLfA02aSbJwh
         URY3MWoENVPWj1LrTHPdzUA0Mm8yxxgr/nBEbxflyqDokUOEjwbfna5Cm7IBzemTveK2
         +dPpgAkMKLq2ONxPNQXiS7ZgfHjZlMftg5SYAjyaTRh9tBCuBxtJwzxXCyq2Gw0r3b+l
         dznw==
X-Gm-Message-State: AC+VfDxV6BvJrX+8/xOYr3cgT1sAlPEq7t1uKDJSCcgOmCZh3jdJ+3Ng
        TOVw1rlV6nRrC4XzRqcpsZA=
X-Google-Smtp-Source: ACHHUZ7j7XsNpEScg4AJXGGocDhEREkMf9NXO9tHx/cfryXei5ej5JK7GIicG5/KJnzNHf4csHyFAA==
X-Received: by 2002:a17:907:268b:b0:965:fb87:4215 with SMTP id bn11-20020a170907268b00b00965fb874215mr7136ejc.15.1686236125260;
        Thu, 08 Jun 2023 07:55:25 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-50-121.cust.vodafonedsl.it. [188.217.50.121])
        by smtp.gmail.com with ESMTPSA id t23-20020a1709060c5700b0094f3d700868sm788626ejf.80.2023.06.08.07.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 07:55:24 -0700 (PDT)
Date:   Thu, 8 Jun 2023 16:55:23 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: drivers/media/i2c/imx290.c
Message-ID: <ZIHr26PdCPJ4Ehb8@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <ZIHiPhyQ7jxLuih1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20230608144146.GS5058@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608144146.GS5058@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jun 08, 2023 at 05:41:46PM +0300, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> On Thu, Jun 08, 2023 at 04:14:22PM +0200, Tommaso Merciai wrote:
> > 
> > Hello Manivannan/Laurent,
> > 
> > Theme is: drivers/media/i2c/imx290.c
> > 
> > 
> > Taking this driver as reference for some part of the Alvium
> > driver I found some doubts:
> > 
> > 1)----------------
> > 
> > 
> > Into imx290_set_stream
> > 
> > Lock is taken using:
> > 
> > state = v4l2_subdev_lock_and_get_active_state(sd);
> > 
> > but v4l2_subdev_unlock_state is never called except
> > that something fail during the stream_on.
> > This not cause a deadlock in your side?
> > I'm missing something?
> 
> The state is unlocked at the end of the function:
> 
> unlock:
> 	v4l2_subdev_unlock_state(state);
> 	return ret;
> 
> This code path is taken in the success case too, not only the error
> cases.

I miss that there is no return
before unlock.

Thanks for clarify this! :)

Regards,
Tommaso

> 
> > 2)----------------
> > 
> > imx290_ctrl_update has format param that is never used,
> > or I'm wrong?
> 
> Indeed, the argument isn't used, it could be dropped.

Oooks.

> 
> > -----------------
> > 
> > Thanks in advance for clarify this! :)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
