Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D56F316B2
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 23:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbfEaVmO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 17:42:14 -0400
Received: from casper.infradead.org ([85.118.1.10]:38986 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbfEaVmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 17:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=372fq0YAVFoeQh943Gbd5H6jbxujOiVgH7aaRxas3kA=; b=WmOvq4YLKrmqAMG+8FsLIvTrsU
        I2aJWLwr7FzrFq9xrv+ltfJM51sBHn+bapuRjz6nJ9/Up2eTQBuzbhNU1QOqGfil3zTbwCWX4fLna
        o6TJO6Lr0Fm67H9VAJ4tPOPpJyirKDK6UAO3f/1OM0uoLd28QfXHkdljlHpMhFcsDZYSMYZDM+QCU
        iWKLxTCz0yt5ItjPnowHD2jiEvWDeA0rhQoCWd2mfMctxO9013mMlKQdSV15eEwYGVsjo5a5fZm5z
        UQGckS0OLYggmHld+xim0zask1ISS7+bpiZ8C63djhnltvHo0F3UESyzkKM+IFMTEnDpfZ8v2OKCZ
        vHFLyuTQ==;
Received: from 179.187.96.185.dynamic.adsl.gvt.net.br ([179.187.96.185] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hWpHw-0003Kq-57; Fri, 31 May 2019 21:42:12 +0000
Date:   Fri, 31 May 2019 18:42:08 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org
Subject: Re: [ANN] Patchwork version upgrade
Message-ID: <20190531184202.00e4ad73@coco.lan>
In-Reply-To: <20190531164021.79cf54b7@coco.lan>
References: <20190531124050.3f06e1b8@coco.lan>
        <fd13ba000e24d15f4016cc89970766253e334d6f.camel@ndufresne.ca>
        <20190531164021.79cf54b7@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 31 May 2019 16:40:21 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Fri, 31 May 2019 15:01:06 -0400
> Nicolas Dufresne <nicolas@ndufresne.ca> escreveu:
> 

> > Actually I went a little into it, the black and white alternance for
> > lines clearly does not work.  
> 
> Black and white alternance? Here, the background is always black
> (tested with both Firefox and Chromium browser). Perhaps your browser
> didn't apply the style.css correctly, ignoring this from style.css:
> 
> 	.table-striped > tbody > tr:nth-of-type(odd) {
> 		background-color: black;
> 	}
> 
> What browser are you using?

I did some changes at style.css. Please check if it looks better now.


Thanks,
Mauro
