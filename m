Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4F238C64
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 16:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbfFGOQX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 10:16:23 -0400
Received: from casper.infradead.org ([85.118.1.10]:57368 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728910AbfFGOQW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 10:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BXPeEK1OlBdbs1T5rGuo+GyuGakIfecrLIZOv/AwAT0=; b=SnGq4fZPlrB1dpoAxvybDhBTy1
        I46QL5VpE8N7K4kBwuBu8coDs/1BJZdD2NmWtouCgpb7btdDqB3sKiHOO7BfTGJwVQoGAxEd/TKDw
        R2tMI3HXBppusGDVgRlX8KOEFWbTnl/CychIkfFbN8JNpLLMKnq+qSAsxFOh0jgXdGGxYVj2n+tMc
        5uZTQaR5sLvuDSres56T4BprTPvSP2xmEVjY288D+vrr4f3CPmYrOyFmoDfA0Cu8cOVVzUUhd/QOf
        kM6ctw98glhFvXEh/2S9MJSJilbN8mOq/I2q03cgqoZktg9UghVndXB90KJyFSI9Vykd4z8A2gZ52
        pCsoCVGQ==;
Received: from [179.181.119.115] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hZFfI-00016C-K2
        for linux-media@vger.kernel.org; Fri, 07 Jun 2019 14:16:21 +0000
Date:   Fri, 7 Jun 2019 11:16:17 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     linux-media@vger.kernel.org
Subject: Re: [ANN] Patchwork version upgrade
Message-ID: <20190607111617.3a478cc2@coco.lan>
In-Reply-To: <20190531124050.3f06e1b8@coco.lan>
References: <20190531124050.3f06e1b8@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 31 May 2019 12:40:50 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Hi all,
> 
> For a long time, we were running an old Patchwork version. The thing is that
> we had applied some patches on the top of it, and the upgrade was not
> trivial.
> 
> Today, we upgraded it to its latest stable version. Just like before,
> you can access it via:
> 
> 	https://patchwork.linuxtv.org
> 
> As this is a new version, please report if you find any issues on it.

Btw, I just added a page that will track the number of patches that
are inside patchwork:

	https://linuxtv.org/patchwork_stats.php

The stats are generated for patches received over the last two years.

This is accessible via the main http://linuxtv.org menu. 

Thanks,
Mauro
