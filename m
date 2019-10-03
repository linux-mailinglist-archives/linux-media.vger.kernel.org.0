Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50904CAF93
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 21:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731889AbfJCTw7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 15:52:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44540 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfJCTw7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 15:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1yFNFXuAcr496RCSAiHWQcK6F/VRk+66pua7RRYRJMM=; b=XztyqVSJvQb1FIWeXD0gf0BRW
        CBmTggGyeketQtpqlyVx6EgxS3c3KBE9WTmWrvPC4auRg+VM2tZXqY5KahRI/r2LRKWMrPlv4voHK
        113OvYWO1Z/5CdzEiGqORrsdIzsIzE5Ue7bu8ksGIMmP50jrZm08OpRQQ4IzElU5l36GxCG9PAZ56
        PT6WrrNjRRkqf/UZwoa8Jr+DtnvFVaMpOE4+/ZexTHEBq/3Gcu5odOmT4jNKywSDqRn8g9ZRhzwgM
        StAdsHab1gIrxocn8qy5q7X0YQcyrpqkqBO1Lf8XQmAnhU5dZTwEvG2zSeJjM06bptX9U7vBBe/O3
        hnGrBNuYw==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iG79k-0007gZ-DP; Thu, 03 Oct 2019 19:52:56 +0000
Date:   Thu, 3 Oct 2019 16:52:52 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gonsolo <gonsolo@gmail.com>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003165252.4145accf@coco.lan>
In-Reply-To: <CANL0fFQCax1XHMaVj6Hvwe3JMzreH2w-dP-efr5VyGAc7Vd9aA@mail.gmail.com>
References: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
        <20191002154922.7f1cfc76@coco.lan>
        <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
        <20191003080539.2b13c03b@coco.lan>
        <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
        <20191003120238.75811da6@coco.lan>
        <20191003160336.GA5125@Limone>
        <20191003130909.01d29b77@coco.lan>
        <20191003162326.GA2727@Limone>
        <20191003144225.0137bf6c@coco.lan>
        <20191003183200.GA2631@Limone>
        <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl>
        <CANL0fFQms9oyec_1UevbJ7aLp+KNJ3h6UhGEbqrnCNO286rbGg@mail.gmail.com>
        <CANL0fFQCax1XHMaVj6Hvwe3JMzreH2w-dP-efr5VyGAc7Vd9aA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Oct 2019 21:40:28 +0200
Gonsolo <gonsolo@gmail.com> escreveu:

> From si2168.c:808:
>                /* Sometimes firmware returns bogus value */
>                 if (utmp1 == 0xffff)
>                         utmp1 = 0;

Huh? are you using the upstream Kernel? the above code is at line 215!

Please always use the upstream code when sending patches.

> 
> Maybe we can include my "bogus" hack to get at least Logilink running.
> Maybe with an info message to tell users what is going on.
> 
> g



Thanks,
Mauro
