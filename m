Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA330430A35
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 17:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344069AbhJQPeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 11:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344077AbhJQPeP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 11:34:15 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F2AC061765
        for <linux-media@vger.kernel.org>; Sun, 17 Oct 2021 08:32:05 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6E9B4C6403; Sun, 17 Oct 2021 16:32:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1634484724; bh=oYNOJea4AjGpwm/3NzKh+HpuNgjf7NGwL6mKYbgsOig=;
        h=Date:From:To:Subject:From;
        b=k2IejN/rkIyQsv8oDhjYC/ru98KRTm/fCKKsSXv6Wb34yRQA8jZBaQR6MWTAYyY7/
         v0SaTUt09c89OAGBbWLW5/tvYJxlpbPae3mEGswyZi1NB3Iog5rxgFpw+/rd2AM+6W
         p3PWWZjkpEgNGJCRv4D7+daF51imgIaOWxSDNMSJcjn6us3B14LWQQXHMibRZMPIEK
         nMv18splAu6Fftx570xtHnypHb8hZK9N7vMdAxPCMooAnWuwky7oDX8Q/CRlu9LgF+
         37vukDUykyLjnhxxSOuVo/35Xelzw1DR4Y7YEEotvBJc7ozfhGKbAY4Ce48lCWuDeU
         1BsP0qrilGbkA==
Date:   Sun, 17 Oct 2021 16:32:04 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.16] ite-cir fix
Message-ID: <20211017153204.GA10244@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This is rather late in the cycle, but it's an important fix that should
really go upstream.

Thanks
Sean

The following changes since commit fd2eda71a47b095e81b9170c3f8b7ae82b04e785:

  media: remove myself from dvb media maintainers (2021-10-08 13:56:25 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.16d

for you to fetch changes up to c7830451ba84b6d2ee282a2fa0e93017be5ff72b:

  media: ite-cir: IR receiver stop working after receive overflow (2021-10-17 16:23:05 +0100)

----------------------------------------------------------------
v5.16d

----------------------------------------------------------------
Sean Young (1):
      media: ite-cir: IR receiver stop working after receive overflow

 drivers/media/rc/ite-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
