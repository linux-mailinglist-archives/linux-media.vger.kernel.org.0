Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29EE026B0BA
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 00:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgIOWSM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 18:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbgIOQdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 12:33:24 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5AAC06178B;
        Tue, 15 Sep 2020 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=DRZPq16Nwbe7wkPR64aqrha3z0JvuZxrmSCMnTXQmXs=; b=Ar6dKiwnflCK0BKblP1LY5tJ4j
        Osni+05bRKhLaXD5gtdPeP6w/f5cnoRAYa6+O+w/YzZzyA3Z02yaQ4sNmcovoRm7Kslc265LBntnx
        eidt6fqPkQeco0ytjkTUmbc0/JloJtZamyFf7gFWcqV1ipuW09w+cjkni6a8tmahXcTba8UQ4ib76
        RznZwfsQ/MeGWxQAOYAfPrKpVcc/uzLVxY/r/yd3+ZAdlOEVnyUmTh3Y9NToRGkYGQwcHAI8bK3+u
        acDDs8N4Xh1UcHu3vb+7NIGUBm6Yg7QZJuu2CrvhjXnwVfiowtSO0QRs4qLPBUUJSEalJADkl152J
        0e+u+42Q==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIDtO-0004Ri-My; Tue, 15 Sep 2020 16:33:19 +0000
Subject: Re: linux-next: Tree for Sep 15 (drivers/media/test-drivers/vidtv/)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
References: <20200915174932.3aa7d103@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <55ef0376-7809-c875-5dcc-5bb46d6204df@infradead.org>
Date:   Tue, 15 Sep 2020 09:33:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915174932.3aa7d103@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/15/20 12:49 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200914:
> 
> The v4l-dvb tree lost its build failure.
> 

media driver build problems on i386:
gcc (SUSE Linux) 7.5.0

build#1:

ERROR: modpost: "__udivdi3" [drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!

build#2:

ld: drivers/media/test-drivers/vidtv/vidtv_s302m.o: in function `vidtv_s302m_encode':
vidtv_s302m.c:(.text+0x1f3): undefined reference to `__udivdi3'
ld: drivers/media/test-drivers/vidtv/vidtv_mux.o: in function `vidtv_mux_tick':
vidtv_mux.c:(.text+0x3ee): undefined reference to `__udivdi3'
ld: vidtv_mux.c:(.text+0x40b): undefined reference to `__udivdi3'



randconfig files are available if anyone wants them.

thanks.
-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
