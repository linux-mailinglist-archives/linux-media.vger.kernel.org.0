Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B0D3DCADC
	for <lists+linux-media@lfdr.de>; Sun,  1 Aug 2021 11:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhHAJM3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Aug 2021 05:12:29 -0400
Received: from gofer.mess.org ([88.97.38.141]:36689 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231363AbhHAJM3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Aug 2021 05:12:29 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 546B1C636F; Sun,  1 Aug 2021 10:12:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1627809140; bh=SNyJcNX4XforK4qu13Mp1QZ/0hd01HXkvNtmW/lFk+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ODjhOTjFtH9zkg9fnVSmaWl3E4LePOPQ+2i37LOhfO8ddkGJPoCfRAvC5/1OCWGd/
         5SOetT4JNR/9KeyMOhugfleAjMvWmnUI+5lDPJag2qtNuMNM6lGea9Bc834wL1WNyo
         60weJVcqMz8i0WwQoFeUWxeYBOdv2s9B0BBB6VNropnvEoeEWLhjo2XO1KO6lFHi9i
         J9UFrxshv5MVm+KN+7HYY4QSg4u1by7jU5usg/3cYkZfy/lu8u9miPSQwNl1m3wGkm
         fY9vljCQuohlAbCq3jiIftWUYL3ByPi1Ayu+h/lQnfl40hAgBAoxWfGmBfXFnwr3x9
         HqlTGxnEv4QuA==
Date:   Sun, 1 Aug 2021 10:12:20 +0100
From:   Sean Young <sean@mess.org>
To:     nil Yi <teroincn@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [BUG] drivers: media: rc: imon.c: dangling pointer in function
 imon_init_intf1
Message-ID: <20210801091220.GA14445@gofer.mess.org>
References: <CANTwqXD8rc9gySvXuCofOJnJZrZQqOiHw_aYPrPZ==3A+by2gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANTwqXD8rc9gySvXuCofOJnJZrZQqOiHw_aYPrPZ==3A+by2gg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 01, 2021 at 04:32:15PM +0800, nil Yi wrote:
> Hi, there is a dangling pointer in ictx->rx_urb_intf1  in function
> imon_init_intf1 in v5.14-rc3
> in function imon_init_intf1:
> 2322: ictx->rx_urb_intf1 = rx_urb;
> ...
> 2362:  usb_free_urb(rx_urb);
> leave a dangling pointer here,  I'm not sure whether it  can be
> triggered somewhere.

I think this error path would lead to a double free. So you have an imon
device with two interfaces, and the probe on the second interface fails.

Now when the driver is removed from the first interface, we get a double
free. I think.


Sean
