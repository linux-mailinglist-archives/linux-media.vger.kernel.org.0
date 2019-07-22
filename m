Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 845837021C
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 16:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729446AbfGVOUW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 10:20:22 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35708 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbfGVOUW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 10:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=RRkg62vrm2QNfVhgLDXu0pufIRiZ8Lp3UvnAuyYJelU=; b=aV2N4iY7b925zhAui/9ooWC7P
        +wHB07UPrcH2Njr5HamScaNQS6El1AJ19jAJla4bpYYfb3jvGWY2vRqKb9sMTUdPwxbQb07YJ/eHP
        XFgrRju768R+0udhocSPWkHW8NiQLw0FSIWPG8KBxwErkH9vGMgQ3nxyKrAYLx69rM8mwVCweg1X7
        N1FZ69kqzghVW/3qRf1k0mYGnNfdoKqWn/M2fRVuyM8DbHqAZy8dzVKXz6zYgxYruMr8k46zsDeZu
        dCTvZGuKHOzbrOILJgJ6GA/6P+9Rxh+w+PiRnTeim1/WWDrf3sSumqb0R4KoUBB/mzHJbgqUBo0tu
        7NCwCfHgQ==;
Received: from 177.157.124.3.dynamic.adsl.gvt.net.br ([177.157.124.3] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hpZAr-0005HG-IC; Mon, 22 Jul 2019 14:20:21 +0000
Date:   Mon, 22 Jul 2019 11:20:18 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [git:media_tree/master] docs: interconnect.rst: add it to the
 driver-api guide
Message-ID: <20190722112018.42df9cc0@coco.lan>
In-Reply-To: <19f6ec1c-9ae9-db94-6080-37d751dd5d22@linaro.org>
References: <E1hpWim-0008Ff-Q7@www.linuxtv.org>
        <19f6ec1c-9ae9-db94-6080-37d751dd5d22@linaro.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 22 Jul 2019 16:07:23 +0300
Georgi Djakov <georgi.djakov@linaro.org> escreveu:

> On 7/15/19 15:20, Mauro Carvalho Chehab wrote:
> > This is an automatic generated email to let you know that the following patch were queued:
> > 
> > Subject: docs: interconnect.rst: add it to the driver-api guide
> > Author:  Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > Date:    Tue Jun 18 17:15:10 2019 -0300
> > 
> > This is intended for Kernel hackers audience.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > Reviewed-by: Georgi Djakov <georgi.djakov@linaro.org>
> > 
> >  Documentation/driver-api/index.rst          |  1 +
> >  Documentation/driver-api/interconnect.rst   | 93 ++++++++++++++++++++++++++++
> >  Documentation/interconnect/interconnect.rst | 95 -----------------------------
> >  MAINTAINERS                                 |  2 +-
> >  4 files changed, 95 insertions(+), 96 deletions(-)  
> 
> Hi Mauro,
> 
> Maybe the script that generated this email can be improved a bit, as it does not
> show the renames. So the diffstat here looks a bit different compared with the
> original git commit:
> https://git.linuxtv.org/media_tree.git/commit/?id=9b1f44028ff2e051816517781153e10a2d748dc3

Thanks for the hint. I changed the post-receive script to do:

	$ git show -M -C -D

instead of just git show.

Thanks,
Mauro
