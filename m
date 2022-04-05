Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 853DD4F4AC1
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 02:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449961AbiDEWva (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Apr 2022 18:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443790AbiDEPkS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Apr 2022 11:40:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9872E81673
        for <linux-media@vger.kernel.org>; Tue,  5 Apr 2022 06:59:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31E675D;
        Tue,  5 Apr 2022 15:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649167178;
        bh=l6QBS7/8jM1BDEY9waat8n2aV1Pc3uDSWuEJOBFUKDc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YW+hEJS7ukP2v7rU57TdLO6sDpxG7f8rPRk8wIt8F+1dUg7V+l57fKHCV/RrylkVp
         JOQsINtyOFrJEX3QiJN//fk4n6TI9VV2RVVymotAcAUu5EvgpclJ+ACBlfTe7jUROP
         ZlkjEE0IyFb8B9hgyhEDKWVeMERClaoMT2rmjbFE=
Date:   Tue, 5 Apr 2022 16:59:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Massimo B." <massimo.b@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: Quanta Computer Inc. Astro HD Cam, not initializing
Message-ID: <YkxLR4Xqsxzu0hh2@pendragon.ideasonboard.com>
References: <1e3fff6f44830e910261bfb7629247cd89bf615a.camel@gmx.net>
 <YkGMSaAyUVNWMOsq@pendragon.ideasonboard.com>
 <771493a1110cacd87c42e66eea84c962be789532.camel@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <771493a1110cacd87c42e66eea84c962be789532.camel@gmx.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 05, 2022 at 12:40:21PM +0200, Massimo B. wrote:
> On Mon, 2022-03-28 at 13:34 +0300, Laurent Pinchart wrote:
> 
> > Could you send the output of `lsusb -v -d 0408:2090` (if possible
> > running as root) ?

[snip]
 
> > The audio interface causes issues, it seems it crashed the webcam
> > firmware. Could you try blacklisting the snd-usb-audio module and see if
> > video then works ?
> 
> Yes, that makes the video part work again.

So this confirms it's a USB audio issue. It may be possible to work
around it in the snd-usb-audio driver, but that's beyond my area of
expertise. You may want to contact the alsa-devel mailing list.

> However it is not sufficient anymore to just disable the audio via udev rule:
> 
> ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="0408", ATTRS{idProduct}=="2090", ATTR{bInterfaceClass}=="01", ATTR{authorized}="0"
> 
> Some while ago this was working to have the video part usable.

I'd be surprised if it wasn't possible to achieve a similar result with
a recent version of udev, but the way to do so may have changed. I
haven't tried it personally, so maybe contacting the udev developers for
support could help ?

> Blacklisting snd_usb_audio works, but I need that module to have at least
> another usb microphone doing the audio part.

-- 
Regards,

Laurent Pinchart
