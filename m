Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEA5E5E6FEF
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 00:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiIVWsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 18:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbiIVWsf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 18:48:35 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B8CF3728
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 15:48:33 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 3AD6C1B00176;
        Fri, 23 Sep 2022 01:48:30 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1663886910;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oQmyNW4QjCVMTuTLvDyXjbmweZCaSS18t8qdvPShZYc=;
        b=dVaa1QsrKUtqKkkSCglOX0ab5ncesjMjGhaxAMWaL1WqI1lZ7INtJMddWL46eXuRkSiJoi
        hpOusjBOSFfAbVuutkzQIYU6ncZwZeqrMkX88QFtqGP2LuXdR2E/9VAwfzfL+4FcI9bvS7
        dUEqvtYwwxbAB1yHnAf4zvIUWfJMvxcmoaT9WzR3L9YIi/JwOmvvQIt5oiz6gFu5lOMisx
        ChpAXtO0yqBvZAEejgYe61K7m2D5PVQ00fkIPHK/ghXKVSErEwx2X6+ACGc5cIW4++9Oh4
        UAaPCbF0n4zQBU3obXEjhFJdbNJhSXFbIWt7yrNWVKj3g5WpS9DBv3M42vhBQg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AF5AF634CD2;
        Fri, 23 Sep 2022 01:48:29 +0300 (EEST)
Date:   Fri, 23 Sep 2022 01:48:29 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] media: v4l2-async: Use endpoints in
 __v4l2_async_nf_add_fwnode_remote()
Message-ID: <YyzmPWQ7vtigUxBI@valkosipuli.retiisi.eu>
References: <20220321145134.29820-1-laurent.pinchart@ideasonboard.com>
 <CGME20220922140658eucas1p29f9d609e795ed064e51694c0e7be80d3@eucas1p2.samsung.com>
 <083edac1-8a8f-d842-e496-b657b4e4014e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <083edac1-8a8f-d842-e496-b657b4e4014e@samsung.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1663886910;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oQmyNW4QjCVMTuTLvDyXjbmweZCaSS18t8qdvPShZYc=;
        b=hCoFvdnPZ/bsUHF+Tz2dFl4YyW7LyMFFK2tuBRpNEKuMBZ0xv47TMyjwgs66fOrom/5RPw
        w8uTRF6kZ+xR2G30Rg041JXtxXYGxRLovGbmoubbiQPduxpHhYtnq4GivaR6TfhvYzr7um
        uNBVssMDOk5nMiA453O64ssXaV7mQMffsb01VbcXv0hF5B2bw+6Atc1d3kEJYqBE+jKsI6
        0qHf7z/XkViMZEQvl57SCEvqEXxmntTWdHS6F7iasZxxk0HHYjXqGOq6fQ+v3jaH2EkjQK
        YLwJ3zGqHn2AODSDGexNOnUj5CTiZ+Yby+KJV9R0rc97pq3l7hfdXgPqrJiBDg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1663886910; a=rsa-sha256;
        cv=none;
        b=IvBQB70Neo5ad1vG2k9bARKbeiWJNUJgjgTAbMaydKjliM8Gi/081EZmUYYAOrmLq/A3U4
        tJlBsAceKZ5BseNvJ+dUH+eF5a3oLiDEQhJ2Be6Ci2f7Wudjw9EjLk1Amtp3P8ViHYwOQ1
        WZEg19JckGVYQ3A9eo+BX/m/RpvaP79l4bCWxXL5/IHy2gG3TejXBBN40L3pjF/wNGV5QC
        oisf4rIYLSgq4Fy+1UJx1ucXDt6wSHB6aZJ6bT1IWuDDJFt0OeTr4b5lbXIVpm4QeCpDfG
        AcRGFnfhynX+NLnB1F2o2kp/0WQllbLWgwo3miU3pybRdOPz+IHIapzHRh8dEg==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Marek!

Good to hear from you! And it's so nice you're testing the Samsung Exynos
drivers! :-)

On Thu, Sep 22, 2022 at 04:06:58PM +0200, Marek Szyprowski wrote:
> Hi Laurent,
> 
> On 21.03.2022 15:51, Laurent Pinchart wrote:
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Matching on device fwnode handles is deprecated in favour of endpoint
> > fwnode handles. Switch the __v4l2_async_nf_add_fwnode_remote() function
> > to use the latter. The match code handles backward compatibility by
> > falling by to the device fwnode handle, so this shouldn't introduce any
> > regression.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> I love the last sentence of the patch description. :)
> 
> Unfortunately, recently I found that this patch breaks Exynos4 IS (FIMC) 
> driver operation on Trats2 board (exynos4412-trats2.dts). After merging 
> this patch I see the following errors related to the camera sensors:
> 
> [   16.038705] S5C73M3: S5C73M3 SPI probed successfully
> [   16.097399] S5C73M3: Sensor type: CML0801-M017, FW version: GDFD01
> [   16.106842] S5C73M3 0-003c: Consider updating driver S5C73M3 to match 
> on endpoints
> [   16.298323] S5C73M3: probe of 0-003c failed with error -22
> [   16.343173] S5K6A3 15-0010: Consider updating driver S5K6A3 to match 
> on endpoints
> [   16.434968] S5K6A3: probe of 15-0010 failed with error -22

Have you checked what exactly caused the probe to fail? Laurent's patch
changes how matching works but if that fails, the result should be a bunch
of waiting async sub-devices and notifier(s), not a failure on probe.

> 
> I'm a bit puzzled, because I don't see anything related to endpoint 
> matching in the sensor drivers. Instead I only found that 
> v4l2_async_nf_add_fwnode_remote() function (which is modified by this 
> patch) is called from the 
> drivers/media/platform/samsung/exynos4-is/media-dev.c code. Do you have 
> any idea what is broken after this change? Could you help fixing this issue?

You can assign the endpoint node to subdev->fwnode instead of the device
fwnode. No regular sensor driver appears to be doing that though.

-- 
Kind regards,

Sakari Ailus
