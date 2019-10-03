Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59784C9E25
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729831AbfJCMML (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:12:11 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60598 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729733AbfJCMML (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 08:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Z6z+KsbbvfNDmZ8hWhm3ZrpQ2X1uMleoDabYVy67j9Q=; b=js3Fmk4c6buCzxnUeBl6k2K0M
        MN2liDvDktfLQ1nJX89ieB+sCpLVkGxzYRQHUs1Jv6G/MBpSCY0mUpSjCSxCuL2T3MQrEVbpG2uW9
        b3/1trU0q9tTzqyTuUJ1vurX5dOyhA18s/dtvs0R/wYceaWSW7Mgem1HQcZs0ePkrMf26RrXKaetF
        W6pg3esZATuDHnToGMg8IYo5+7UX+4qn4mXLfxpqgwQMKCdDsCMwWo5DQCMTFidVqkOsOTztJrITU
        fxCP51Dp7LFiNakWNO0jehMcyBDUAJQrvQFdtKR/AL9rHla3yfBHRy+H2NQfOXwQFmdOOLCz4v34I
        tkDohY8vQ==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFzxl-000839-MY; Thu, 03 Oct 2019 12:12:06 +0000
Date:   Thu, 3 Oct 2019 09:12:01 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gon Solo <gonsolo@gmail.com>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003091201.7e94c617@coco.lan>
In-Reply-To: <20191003120143.GA2995@Limone>
References: <20191002141359.30166-2-gonsolo@gmail.com>
        <20191002142744.GA3475@gofer.mess.org>
        <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
        <20191002150650.GA4227@gofer.mess.org>
        <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
        <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
        <20191002154922.7f1cfc76@coco.lan>
        <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
        <CANL0fFTwJ4yRO+5q6WkL0+DtwdrRti6r_WY1intisYJhs5En8w@mail.gmail.com>
        <20191003081742.0933264b@coco.lan>
        <20191003120143.GA2995@Limone>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Oct 2019 14:01:43 +0200
Gon Solo <gonsolo@gmail.com> escreveu:

> Hi!
> 
>  
> > Btw, could you please try the enclosed hack and post the results?  
>  
> [  210.178948] si2168 1-0067: downloading firmware from file 'dvb-demod-si2168-b40-01.fw'
> [  212.404011] si2168 1-0067: firmware version: B 4.0.25
> [  212.656467] si2157 2-0063: Needed to wait 100 ms to get chip version
> [  212.656470] si2157 2-0063: Unable to retrieve chip version

well, you could try to increase the timeout - although 100 ms seems a lot
of time to me.

Thanks,
Mauro
