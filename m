Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3395980C2
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 11:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbiHRJXr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 05:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240585AbiHRJXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 05:23:42 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C225766A6B
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 02:23:40 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id tl27so2170341ejc.1
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=XbW8Y9Fr/zSM+IRTxsrF2wB9vn6cxLr67MT3bmmqopw=;
        b=XKfhscJzXKdVvatPbSk16xxOkItLJbrMI9egHTkTi8ioMyKopPwfE6yEzYo1bUtHat
         0YLdO1p5IsGkpRWyzItjOEea0Yjq99ZDo3HWIwQHVRI9hlgPbDVemBZn93pHIdkRRHhj
         wOyuUtVnCyhcvgtdzn/kROw8BWQ5LCvUWoFJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=XbW8Y9Fr/zSM+IRTxsrF2wB9vn6cxLr67MT3bmmqopw=;
        b=D3lIxmMrTPFT0xKLbKO/fcSxyyT/hNgOPOZzBv+uMv7pKGYyx/sChiWcfCYPs/SBr3
         ocrtcsRqDzcaexhMdPc+4s2uFIV9PEpzPqtQpP/DW+M0HsU7mj84GQdjyX/6TemHXOeQ
         94r+MfZl3xBXmjBjXJn2AlDoFo8qExGZ/Bq2eqcgAkRDO9J3sYLIDebJQug3WgNOoOk0
         3x2GIqX/x6Ivea22oPOKQkZr5+7o89EwlJ5y/YlRGIx7n5GIFD/f5pHrDwNYBaRcadO7
         9mk7jhBAWlnvsP0VeUvzYix/rnZ9IFIxpLbPeCpoH1qJ5r+4AksgktLRs1/o/s5MGomb
         ZNSA==
X-Gm-Message-State: ACgBeo0NUABcuJhdon1vtGZIcHF9k30r5q7BNRS7rPUN5BbcO39epQZj
        yXX8Bv8ySqxUSpfD0+HKJ69K3TVB8RjHsQ==
X-Google-Smtp-Source: AA6agR4yy2+wgFCFBGbye+864pqUJ/CPhbDiwk7B1e0ydIsVRdHqJ1fqpVSU/2xRJNUWO3a1hDI7rw==
X-Received: by 2002:a17:907:9816:b0:730:73fc:1fae with SMTP id ji22-20020a170907981600b0073073fc1faemr1331210ejc.310.1660814619152;
        Thu, 18 Aug 2022 02:23:39 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id f12-20020a17090631cc00b0073c1e339a37sm192681ejf.149.2022.08.18.02.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 02:23:38 -0700 (PDT)
Date:   Thu, 18 Aug 2022 12:27:45 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo@jmondi.org
Subject: Re: imx8m-mini csi-2 limitations
Message-ID: <Yv4GEUTj4rMiagAX@p310.k.g>
References: <YvpPusE1rOzmgPYN@carbon.k.g>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvpPusE1rOzmgPYN@carbon.k.g>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

	Hello again,

After digging down NXP's documentation and reading some comments within kernel 
drivers (sorry Jacopo, you've left some nice comments in imx7-media-csi.c, hence 
you're spammed now :) i came to the conclusion that mipi-csi to csi-bridge data 
path can only be 8bits in raw12 format.  The only exception is YUV422 format, 
which get BIT_MIPI_DOUBLE_CMPNT flag set.

So i guess there are two questions:

	a) can the csi-bridge (and mipi-csi) be persuaded to do two-bytes for 
	raw12 format;

	b) what's the maximum frequency for csi-bridge PIXCLK?

I've increased PIXCLK up to 1ghz (as opposed to the default 500mhz) and this seem 
to hung the bridge.


cheers,
Petko


On 22-08-15 16:52:59, Petko Manolov wrote:
> 	Hello guys,
> 
> I'm developing a driver for Sony imx492 sensor and i'm using imx8m-mini
> (Variscite SoM on Symphony carrier board) platform.  Thanks to Laurent i dumped
> the vendor mipi-csi and csi-bridge drivers in favor of mainline (v5.19-rc6 atm)
> and parts started to click in place.  However, there are still a few rough
> edges.
> 
> The sensor is 47mpix, and is only capable of streaming over all four CSI-2
> lanes.  Each lane is 1.728gbit, which makes 6.912gbps total bandwidth.
> imx8m-mini's d-phy can handle (on paper) up to 6gbps.
> 
> I guess the main question here is: what's the fastest transfer rate that's known
> to work with this SoC?  Does anyone have experience with imx8m-mini in this
> regard?
> 
> 
> Even with the settings that i'm able to obtain a (distorted) test pattern image
> with, i keep getting tons of:
> 
> [99910.847591] imx-mipi-csis 32e30000.mipi-csi: FIFO Overflow Error events: 1353347
> 
> IRQs also look a suspicious on the 'csi' part:
> 
> 214:    2653716          0          0          0     GICv3  49 Level     32e30000.mipi-csi
> 215:          2          0          0          0     GICv3  48 Level     csi
> 
> That's with this clock setup:
> 
>  sys_pll2                             1        1        0  1000000000          0     0  50000         Y
>     sys_pll2_out                      5        5        0  1000000000          0     0  50000         Y
>        sys_pll2_1000m                 3        3        0  1000000000          0     0  50000         Y
>           csi1_phy_ref                1        1        0  1000000000          0     0  50000         Y
>           csi1_core                   1        1        0   500000000          0     0  50000         Y
>              csi1_root_clk            1        1        0   500000000          0     0  50000         Y
> 
> However, if i change the latter two (csi1_core & csi1_root_clk) to 1ghz, there
> are still mipi-csi IRQs coming in, but nothing from the csi-bridge.
> 
> Any advice on where i shall start looking first?
> 
> 
> thanks,
> Petko
