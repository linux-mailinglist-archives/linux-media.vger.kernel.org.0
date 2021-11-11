Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E99344DA3A
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233937AbhKKQUs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 11 Nov 2021 11:20:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbhKKQUr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:20:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A29C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:17:58 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mlClw-0005D4-LM; Thu, 11 Nov 2021 17:17:56 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mlClv-000JLv-JG; Thu, 11 Nov 2021 17:17:55 +0100
Message-ID: <d125181203cd03cfb01eb5b4d86770b74d8d7b77.camel@pengutronix.de>
Subject: Re: [PATCH] V4L2_PIX_FMT_GREYSCALE for coda960 JPEG Encoder
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Martin Weber <martin.weber@br-automation.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Date:   Thu, 11 Nov 2021 17:17:55 +0100
In-Reply-To: <VI1PR0602MB35495D33CD3DD897F0A41D5ED3929@VI1PR0602MB3549.eurprd06.prod.outlook.com>
References: <VI1PR0602MB35495D33CD3DD897F0A41D5ED3929@VI1PR0602MB3549.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Tue, 2021-11-09 at 11:43 +0000, Martin Weber wrote:
> support greyscale pix fmt input for coda9_jpeg_encoder. The hardware
> supports it, so allow V4L2 Mem2Mem JPEG Encoder use it as well. Tested
> on an i.MX6QP.
> 
> Signed-off-by: Martin S. Weber <martin.weber@br-automation.com>

thank you for the patch! I never tested grayscale encoding, so I didn't
expect it to work out of the box :)

The code is fine, just a small formal issue: the subject should be in
the style used in the media subsystem. For example:

  media: coda: V4L2_PIX_FMT_GREY for coda960 JPEG encoder

(note that there is no V4L2_PIX_FMT_GREYSCALE). Please resend a v2 with
the subject fixed and feel free to add:

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
