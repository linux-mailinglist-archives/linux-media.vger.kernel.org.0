Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B664655FA8F
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 10:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbiF2I2v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 04:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbiF2I2t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 04:28:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9C43BA6F
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 01:28:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AFC24A8;
        Wed, 29 Jun 2022 10:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656491326;
        bh=YOvcSjcuxDLRjbRYCh++Klg6tofOOopruFMbY2bb+qI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J9hnTXMWwDPiI6dMjQjp/Byaq9T3KsUMsY6LIClN6qpAnZ2LkX664xXv1zbvGNEEL
         8RBbdzgmEyHIMR3kncJ34XYLHBe8enR+ngT25+/qDFN8r+7V5pzfjmO50CqGdoAnvH
         vngN2Z5E6294QUCTorbnIWiL2zPCdK6/inhbRE3k=
Date:   Wed, 29 Jun 2022 11:28:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YrwNKiJA+cnm7pGr@pendragon.ideasonboard.com>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrwFf7Jw2/yDlcDq@carbon.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

On Wed, Jun 29, 2022 at 10:55:43AM +0300, Petko Manolov wrote:
> 	Hi guys,
> 
> First, i'd like to apologize for the noise and sending this email directly.

Your support request is directed to the linux-media mailing list, CC'ing
appropriate developers is a good practice to make sure we notice,
there's nothing to apologize for.

> I am trying to hook Sony IMX492 sensor to v5.10 imx8m-mini based platform.  The
> capture driver does not support Bayer GBRG 10 and 12bit pixel format, so i had
> to add these.  I also stumbled upon a bug in mx6s_capture.c which, i assume, is
> completely out of interest here as it's related to a vendor tree.

I'm surprised you stumbled upon one bug only :-) I always advise to stay
away from BSP code as much as possible.

> I got as far as sensor is registering with the capture mipi csi driver and, if
> HW is properly set up on both sides, should be streaming.  While my confidence
> is pretty high about the IMX492 setup i can't say the same about the recipient
> part.
> 
> So here is my question: how stable are NXP's MIPI CSI2 and CSI2 bridge drivers
> in v5.18?  Would it be better to switch to this version instead of hacking madly
> at the v5.10 vendor code?

I consider them more stable than the vendor code. If there are issues
there, we can help fixing them.

> I've already published the code here.  Once the development is done the intent
> is to mainline Sony IMX492 sensor driver.

That's great ! I'm looking forward to that.

-- 
Regards,

Laurent Pinchart
