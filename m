Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC474243EE8
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 20:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgHMSfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 14:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMSfk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 14:35:40 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFCDC061757;
        Thu, 13 Aug 2020 11:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=R0TbUVnS+LBBcuAR5BFfn8q7iOgSSh24gcpRLah9OLo=; b=H4oTw6XtpdFTxq8jH4skOl/Obx
        7T2pjjbWEHuXzIh6AneSVgk+JsCeOx0xxuyyOJYfF6gaq8PYVAQ7BZ61WmlbQuK4qvMJoHNdtk1jg
        0zVgPF9bNw0X3pl5vmyCNlS4mF6hJio0o4xdaoWaHLs37972RVDYJLdOJTB9qZ4CeLofmJQso83pA
        ouIZA9fms+mII3oTTo2TizKYpMPGggJB2uPpNS6FdRLuTwKaLwI0U7NbXFJWZ2SpTtitKheKXx1D6
        RuaCHB/yWTgzIsMKuqxrSjnGMLTYoHhufSjtpd5iPQPhcwGpC/EoQjomZY+EfDkLWlxorTRuIanVY
        d0/mtl+g==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k6I4c-0002EY-Od; Thu, 13 Aug 2020 18:35:35 +0000
Subject: Re: linux-next: Tree for Aug 13 (drivers/media/i2c/max9286.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
References: <20200813165846.27887669@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <17a1c5aa-2f38-c84d-bf2d-485862dc0615@infradead.org>
Date:   Thu, 13 Aug 2020 11:35:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200813165846.27887669@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/12/20 11:58 PM, Stephen Rothwell wrote:
> Hi all,
> 
> News: The merge window has opened, so please do not add any v5.10
> related material to your linux-next included branches until after the
> merge window closes again.
> 
> Changes since 20200812:
> 

on x86_64:

# CONFIG_GPIOLIB is not set

../drivers/media/i2c/max9286.c: In function 'max9286_register_gpio':
../drivers/media/i2c/max9286.c:1033:6: error: 'struct gpio_chip' has no member named 'of_node'
  gpio->of_node = dev->of_node;


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
