Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4C57D04B6
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 00:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbjJSWYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 18:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbjJSWYg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 18:24:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058CB112
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 15:24:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C1E4C58;
        Fri, 20 Oct 2023 00:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697754260;
        bh=Tz7C0AIzjYDckRmEfNZ+ThnoAND8IZxwsiH9+PCRtto=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IhaQH+KAABrqeHnogsuKry5vJw26/yZ+QQAe4uD/rzB5vrsL+DLHPCgoKTvg3rLRE
         r9yanAiiZ+YKpRb5ex8rNSLhYYc6MW1agsMrNDftJR+LobDp/LQqTgtZKrf00mVhk1
         j/T8/wmHz0VLJbdJAxDqSgfmmi8hRYpTKOcnvTlA=
Date:   Fri, 20 Oct 2023 01:24:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Karel Janda <karel1@tutanota.com>
Cc:     Linux Media <linux-media@vger.kernel.org>
Subject: Re: Problematic Alt Setting for ALi Corp. Newmine Camera. (plaintext)
Message-ID: <20231019222434.GR14832@pendragon.ideasonboard.com>
References: <Nh6D0WI--3-9@tutanota.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Nh6D0WI--3-9@tutanota.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Karel,

On Thu, Oct 19, 2023 at 11:15:40AM +0200, Karel Janda wrote:
> Hi,
> 
> in my class I use ten C-TECH CAM-07HD cameras, detected as
>     ID 0402:8841 ALi Corp. Newmine Camera.
> The camera works OK with resolutions <= 320x240@60fps.
> Bigger MJPEG resolutions were laggy, with lots of errors in kern.log:
>     usb 1-2: USB isochronous frame lost (-75)
>     xhci_hcd 0000:15:00.0: WARN: buffer overrun event for slot 9 ep 4 on endpoint
> Bigger YUY2 resolutions did not get any data. Quirks doesn't help.
> Behavior is the same on (Ubuntu) kernels 6.5.0, 6.2.0, 5.4.0,
> both on 2.0 and 3.0 USB ports.
> 
>   So I start USB scanning and finally find the reason:
> - camera sends four isochronous interface descriptors for wMaxPacketSize 1024 bytes
>    and linux uvcvideo module always chooses bAlternateSetting 4.
> - Windows 10 always chooses bAlternateSetting 1 for the camera
>     and bigger resolutions are working OK there.
> 
> (I attached listing from lspci -v -d 0402:8841 )

Thank you for the report and the detailed analysis, that's great work !

> This original line of code from drivers/media/usb/uvc/uvc_video.c 
>   if (psize >= bandwidth && psize <= best_psize) {
> 
> chooses last alt setting in case the same wMaxPacketSize values.
> 
> If I force using settings 1, 2 or 3 instead in uvc_video.c,
> my REALLY BAD camera starts working OK like a charm, without log errors.

Ouch. A buggy firmware then. That's very common, unfortunately :-(

> So I offer you to change the line above in some future uvc_video.c to:
>     if (psize >= bandwidth && psize < best_psize) { //first preferency
> 
> which I probe completely solved this problem 
> and as Windows does the same will not harm other types of cameras.

Normally I would be fairly worried about making such a change. As I
mentioned, lots of devices are buggy, and picking the first best
alternate setting instead of the last one may well fix the problem for
your device, but break other devices.

In this specific case, however, I have good hopes it would be safe, as
we would implement the same behaviour as Windows 10, and most devices
are tested with Windows (and Windows only, otherwise they would have
caught the firmware bug).

I will submit a patch shortly and CC you.

-- 
Regards,

Laurent Pinchart
