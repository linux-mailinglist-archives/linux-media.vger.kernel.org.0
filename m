Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1949910402B
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 16:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732553AbfKTP6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 10:58:12 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:40564 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732074AbfKTP6L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 10:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:
        Date:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rZATSJTysQCO56h3LwKw2qC0RxVglfFhE4m2/zUXBNE=; b=iCe2/x8LjrL19zZjE3MDmZnmN
        SAU83VbgIPsYTwLZIIeaJTTrT1mTOOijvcfnzo8Qor+avEl0ZXxxqC1llIE77Z2W5dfp23We9Mn1T
        MNaBzH/fTyjWeNCMHRhUTdN6PU+C/5XFJZKqy+8gWz1flYr0zCSv8LnJ+HIAIZUE/OuUDSv7PcmfO
        SLLO+k4lG9mXvp8mC8L/V5KoAzm8/a4LvYdodRhGa/hH6CHsLCXaLhGTc4Bb7u2+oW6Oa3QkzbLIG
        3++MJjJvaEMJb+cm71sLY6NjV14sejsMVa3Ow6SUyQqcR1ijLnZg2NBfTRwPJbG1kVdJYqb4WLVj8
        Y1bhhHNvQ==;
Received: from [80.156.29.194] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iXSMt-0000iy-7E
        for linux-media@vger.kernel.org; Wed, 20 Nov 2019 15:58:11 +0000
Date:   Wed, 20 Nov 2019 16:58:08 +0100
From:   Mauro Carvalho Chehab <mchehab@infradead.org>
To:     linux-media@vger.kernel.org
Subject: Re: [ANN] possible LinuxTV.org maintenance on Wednesday
 (2019-11-20)
Message-ID: <20191120165808.54ac4b32@infradead.org>
In-Reply-To: <20191120114131.4000bb1b@infradead.org>
References: <20191118111323.5ccd8f27@infradead.org>
        <20191120114131.4000bb1b@infradead.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <mchehab@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 20 Nov 2019 11:41:31 +0100
Mauro Carvalho Chehab <mchehab@infradead.org> escreveu:

> Em Mon, 18 Nov 2019 11:13:23 +0100
> Mauro Carvalho Chehab <mchehab@infradead.org> escreveu:
> 
> > Hi all,
> > 
> > Just to let you know, we'll be doing a preventive maintenance tomorrow by
> > 1pm-3pm (UTC). 
> > 
> > During that time, we'll be stopping the services (wiki, web, patchwork, git)
> > at *.linuxtv.org.  
> 
> It ends that the upgrade didn't happen yesterday. So, we are trying to
> re-schedule it for today.
> 
> In principle, the maintenance will happen between 1pm-3pm (UTC).

The Maintenance activity is almost finished. 

Developers with git trees hosted at linuxtv.org:

Please notice that we're now using a newer sshd version, with a different
server key.

If you experience troubles while cloning/pushing using SSH, then perhaps
your key is too old and the cryptography algorithm is now considered
unsafe. That applies, for example, for DSS keys:

	https://www.gentoo.org/support/news-items/2015-08-13-openssh-weak-keys.html

If you're using such keys, please re-generate your keys using the current
last practices, and re-send your new public key to me in private.

Thanks


Cheers,
Mauro
