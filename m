Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695F4373033
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 21:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbhEDTCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 15:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbhEDTCy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 15:02:54 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D84C061574;
        Tue,  4 May 2021 12:01:59 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 408DEC644F; Tue,  4 May 2021 20:01:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620154916; bh=qyaWWXt04vNl+6GQ15lwuYcgMJjXC593iUTOhQFiKCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gPLp1RYRgG/espT+PhiZmOBg4ha7j3AIE66qW7g/s2oP6jquRec45hE7bKUu6JsAU
         fq/WrjbR3SsI6pyNUTsf5mtlSnQcSaPNzpUhdCNt/qItqvgFK9LGH0WGkHxo9pPICx
         u/iGJdhv2cNuB8COwq8MJD3Pj38r0I4ub/sqfY+NF4UJdrHO0belIcu+Q1qGBbIJnc
         nvSuU344EsEVF03Z7UvH+wXAWfee2r6hoypPfrQMe8/AMQzg5PbAmKUUekspWc+HkM
         SwB0r1bWOiH5wOtNiZN1nImNHjpbWrSpcrVkAl5dZq8mF0BjmPEvdVI4T30acr9pHD
         Ia3DDJ2OYt6SQ==
Date:   Tue, 4 May 2021 20:01:56 +0100
From:   Sean Young <sean@mess.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
Subject: Re: [PATCH 3/3] USB: serial: blacklist USB-UIRT when driver is
 selected
Message-ID: <20210504190156.GA5074@gofer.mess.org>
References: <cover.1620149665.git.sean@mess.org>
 <6df6e3c02c7f736e99799fca757056608ccaf6c0.1620149665.git.sean@mess.org>
 <c8b4a545-a33f-6f7c-0c51-e6cca8fbb8d5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8b4a545-a33f-6f7c-0c51-e6cca8fbb8d5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 04, 2021 at 10:00:18PM +0300, Sergei Shtylyov wrote:
> On 5/4/21 8:52 PM, Sean Young wrote:
> 
> > The USB-UIRT device has its own driver, so blacklist the fdti driver
> 
>    It's ftdi, right?

Yes, sorry that's a typo.

Thanks,

Sean
