Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADF5B1878F
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 11:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbfEIJRH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 05:17:07 -0400
Received: from mxc1.seznam.cz ([77.75.79.23]:26820 "EHLO mxc1.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725869AbfEIJRH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 May 2019 05:17:07 -0400
Received: from email.seznam.cz
        by email-smtpc3a.ko.seznam.cz (email-smtpc3a.ko.seznam.cz [10.53.10.75])
        id 482e64529f95dd3748867a95;
        Thu, 09 May 2019 11:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
        t=1557393394; bh=XjvbiKo2zl/YKABc6B1muGoSPYkFEBf4z1CFtDMY/qo=;
        h=Received:From:To:Date:MIME-Version:Subject:CC:Message-ID:Priority:
         In-reply-to:References:X-mailer:Content-type:
         Content-transfer-encoding:Content-description;
        b=Nyn2HWpUdcGtZ9/hFTqUuisZ6i4toUU67TS/XIaU/KWAGg2hw6q6GlEpXBeFrZd2T
         oiPvu150KqYNeIWNPuo5jbaTpEltWCeqEJZMbhLXDcbsrKB02U/f2iJAQjyZIQffB0
         z3nimFnM8pxNsUXWRKL5R+Xa0IUO2ZwRXDKo9AiU=
Received: from [192.168.2.14] (250.68.pool1.tetanet.cz [109.202.68.250])
        by email-relay29.ko.seznam.cz (Seznam SMTPD 1.3.103) with ESMTP;
        Thu, 09 May 2019 11:16:32 +0200 (CEST)  
From:   "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To:     linux-media@vger.kernel.org
Date:   Thu, 09 May 2019 11:16:30 +0200
MIME-Version: 1.0
Subject: Re: Support for 2D engines/blitters in V4L2 and DRM
CC:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Message-ID: <5CD3EFEE.5732.6BF8A27D@Frantisek.Rysanek.post.cz>
In-reply-to: <6ffb32e804a27557ca49216c4d8f117837c78f4e.camel@bootlin.com>
References: <0df3d4b5178d8a37b67b275e0771741c6c268de3.camel@bootlin.com>, <20190506112835.6d4ecf29@eldfell.localdomain>, <6ffb32e804a27557ca49216c4d8f117837c78f4e.camel@bootlin.com>
X-mailer: Pegasus Mail for Windows (4.63)
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear gentlemen,

I've noticed your debate - the topic is something simple enough for 
me to superficially grasp and "blitting in the DRI/drmfb" is 
something I've been wondering about for a while.
Thanks for sharing your insight.

What actually prompted me to respond is this:
vaguely in the context of your debate, this is what Google has 
revealed to my casual query on the topic:

https://www.phoronix.com/scan.php?page=news_item&px=Intel-Mesa-Blitter
-RIP

It's not a blow at the heart of the hypothetical "blitting API in 
DRI", but given the market share of Intel, it does look like a splash 
of cold water in the broader context, or does it?
If the "DRI blitting API" should go forward, could the Intel DRI 
driver in the kernel maybe take inspiration from MESA's approach?

I know I know - Intel may be strongish in the desktop and general x86 
market, but apart from the Nvidia vs. AMD wars, Linux actually runs 
on a number of non-x86 embedded SoCs that have a plethora of small 
proprietary GPU's, the CPU horsepower and RAM bandwidth may be scarce 
(though not as a rule), X11 is not mandatory and HW blitting may 
actually matter...

Frank Rysanek
