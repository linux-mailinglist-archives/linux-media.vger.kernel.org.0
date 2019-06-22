Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 652394F508
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2019 11:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfFVJ6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jun 2019 05:58:49 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46004 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfFVJ6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jun 2019 05:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=SpegnDhLlD97cGHu+yfulQXPQhM2A6IXFd7CIMehSmk=; b=QZBduBPgRl4gH+cKiiRqV1fpm
        4uT1AlBiK5c6XLjv28+81dJVazGOLJTlNhBjMbnJX2Qsamum3N/tkOEXZrrzFc8rjmIvNbAk5LrRL
        LRW+h6HeMS7QLkO9JGsmKtl35yQwxbrT7a/IzOXD4Ng0vRhz981kYhizy/i8zuld1Qhwy+hq8HDGP
        IAfkl7ezPxvXBn7jRTl8ycxBKV3OYbeWg38xd0vWJo1RUOF1vGNxjXdrg70Uwy6aeWAtW6tdMf4qM
        k1cwTjGcNCBGqCk8YqTHuiXFp9db9e6nxdc2LGLlEIdjBFplATaKVXNLJDiti7R3Rebtk30tKFoDh
        KJMAB6qkQ==;
Received: from [177.97.20.138] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hecnI-0004Xv-FY; Sat, 22 Jun 2019 09:58:48 +0000
Date:   Sat, 22 Jun 2019 06:58:44 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL for 5.3] More sensor and CSI-2 driver patches
Message-ID: <20190622065844.45deb0f6@coco.lan>
In-Reply-To: <20190622083909.kdm52xan2tgg7zro@valkosipuli.retiisi.org.uk>
References: <20190622082912.knhtiwvwjreok55v@valkosipuli.retiisi.org.uk>
        <20190622083909.kdm52xan2tgg7zro@valkosipuli.retiisi.org.uk>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 22 Jun 2019 11:39:09 +0300
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> On Sat, Jun 22, 2019 at 11:29:12AM +0300, Sakari Ailus wrote:
> > Hi Mauro,
> > 
> > Here's another set of CSI-2 and sensor driver patches for 5.3.  
> 
> Oops! This should have been for 5.4, not 5.3!
> 

I already applied those yesterday. 

Should them be reverted? If so, why?

Thanks,
Mauro
