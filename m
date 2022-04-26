Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE86C50F9B5
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 12:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348416AbiDZKKO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 26 Apr 2022 06:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349231AbiDZKJ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 06:09:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539461CD8F2
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 02:33:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1njHZ4-0005Yq-Lg; Tue, 26 Apr 2022 11:32:58 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1njHZ4-005JmZ-Rt; Tue, 26 Apr 2022 11:32:57 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1njHZ2-0004AD-Dh; Tue, 26 Apr 2022 11:32:56 +0200
Message-ID: <5029cf076d4be8a7b3495722be2398a395245358.camel@pengutronix.de>
Subject: Re: [PATCH 1/7] media: coda: set output buffer bytesused to appease
 v4l2-compliance
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Tue, 26 Apr 2022 11:32:56 +0200
In-Reply-To: <63c20ead-6c83-64ab-3178-7629d5df5008@xs4all.nl>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <3b1ace8f-a425-6a61-cb97-39e93100e75c@xs4all.nl>
         <2d160491ffdba0642e2bda6096524d10ad2b647d.camel@pengutronix.de>
         <63c20ead-6c83-64ab-3178-7629d5df5008@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Di, 2022-04-26 at 07:52 +0200, Hans Verkuil wrote:
[...]
> > > Are there still applications that rely on zero-sized output buffers to stop the
> > > decoder?
> > 
> > This was used by GStreamer 1.8. The code is still left in current
> > versions, but is never executed unless the decoder stop command fails:
> > 
> > https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/gst-plugins-good/sys/v4l2/gstv4l2videodec.c#L446-454
> > 
> > Whether there are still any applications using GStreamer 1.8 for V4L2
> > video decoding on devices that get kernel updates, I don't know.
> > 
> > > I'm not actually sure that I want this in the driver, perhaps v4l2-compliance
> > > can be modified to turn a fail into a warn if the driver is the coda driver.
> > 
> > Same for nxp/imx-jpeg, qcom/venus and samsung/s5p-mfc?
> 
> Yes for venus and s5p, but why would imx-jpeg use this?
>
> It makes no sense for a jpeg codec. I think it should just be removed for imx-jpeg.
>
> IMHO, once a decoder supports the STOP command, it should no longer set
> allow_zero_bytesused to true. But that decision is up to you for the coda
> driver.

Turns out there is no associated v4l2-compliance failure at all.
I'd just drop this patch for now and keep the allow_zero_bytesused flag
as-is.

regards
Philipp
