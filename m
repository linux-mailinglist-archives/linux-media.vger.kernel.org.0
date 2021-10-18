Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8CF4315DE
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 12:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbhJRKXu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 18 Oct 2021 06:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232070AbhJRKXg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 06:23:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB6EC06161C
        for <linux-media@vger.kernel.org>; Mon, 18 Oct 2021 03:21:25 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mcPlb-0000YE-Kn; Mon, 18 Oct 2021 12:21:15 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mcPlb-0005J3-76; Mon, 18 Oct 2021 12:21:15 +0200
Message-ID: <b99705233d4a79c22d99c41568477491a51f48c6.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx: Round line size to 4 bytes
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm, phone-devel@vger.kernel.org
Date:   Mon, 18 Oct 2021 12:21:15 +0200
In-Reply-To: <20211017130713.4668c616.dorota.czaplejewicz@puri.sm>
References: <20211006110207.256325-1-dorota.czaplejewicz@puri.sm>
         <7d61fdbd161fce40874766bde5f95c3b73f1a96d.camel@pengutronix.de>
         <20211013112636.6963344d.dorota.czaplejewicz@puri.sm>
         <1d8878e86b862ae8d551b6796e86c4fb1eb5d671.camel@pengutronix.de>
         <20211017130713.4668c616.dorota.czaplejewicz@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 2021-10-17 at 13:07 +0200, Dorota Czaplejewicz wrote:
> Hello,
> 
> On Thu, 14 Oct 2021 13:26:26 +0200
> Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > Hi Dorota,
> > 
> > On Wed, 2021-10-13 at 11:26 +0200, Dorota Czaplejewicz wrote:
> > > On Fri, 08 Oct 2021 14:19:41 +0200 Philipp Zabel <p.zabel@pengutronix.de> wrote:  
> > [...]
> > > > I wonder: if you use 4-byte aligned width and odd height, does the CSI
> > > > write over the end of the buffer?  
> > > 
> > > I tested this case, and found a glitch which suggests the last 4 bytes are ignored:
> > > 
> > > https://source.puri.sm/Librem5/linux-next/uploads/cfb59e3832431aaa3a69549455502568/image.png  
> > 
> > Thank you for testing, so it appears that at least without FBUF_STRIDE
> > the only requirement is that the whole image size must be a multiple of
> > 8 bytes.
> > 
> > > That would be taken care of rounding up towards a number decided at runtime, like:
> > > 
> > > divisor = 8 >> (mbus->height % 2);  
> > 
> > Which would then cause the CSI to write past the end of the buffer?
> > 
> I'm not sure if you point out the mistake here (should be "4 <<"), or
> the fact that rounding is happening. If it's the latter, then it's of
> no concern: the values derived here are used to calculate buffer size.
> 
> I'm submitting a new series where this is fixed.

Thanks, I just didn't understand your intention. The name "divisor"
threw me off, see the comment in the new series.

regards
Philipp
