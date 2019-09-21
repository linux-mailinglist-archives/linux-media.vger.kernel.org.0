Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2A6B9F25
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2019 19:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbfIURR5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Sep 2019 13:17:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45224 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbfIURR5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Sep 2019 13:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=npyIJ4oToPFwwAoSLl7eEajl0gPXRwoTouB58DzCRGQ=; b=hNI/MfVNYzfEi84RDy1At19Zo
        V+5ZYbYYZwtcSf64eVEDRE+ju7B0ruNN/SG6AUjDrP1dPeE/SRmQUMhK1OPP926DbYT6l9kWQUjwu
        OMMSSm9HRcOPus3tg4Vd3QUdDT+KORmpqwV9tb3N0jsItX2kK0NDyoYnqz1cu5X0UcBOHQRlE5eYd
        gVSXIcNt94elgV4VOhqpfoPmr1B/BthcB9PoL+N9f1oVs2KhBS90iwwrB8qmXG1W9QOX1blB9rykT
        +rwxguDr+ellBQf5SgQNwLQ0A7CxE43IJYzl6ycCvdmtF2G5fu2eyXkt64zzT4R2rC094Suf+16CI
        VUhvuOL2Q==;
Received: from 177.206.132.221.dynamic.adsl.gvt.net.br ([177.206.132.221] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iBj19-0008MP-4N; Sat, 21 Sep 2019 17:17:55 +0000
Date:   Sat, 21 Sep 2019 14:17:49 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Corentin Labbe <clabbe.montjoie@gmail.com>
Cc:     mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Subject: Re: bringing back media/zoran driver
Message-ID: <20190921141749.03ebb25f@coco.lan>
In-Reply-To: <20190921170357.GA26626@Red>
References: <20190921170357.GA26626@Red>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 21 Sep 2019 19:03:57 +0200
Corentin Labbe <clabbe.montjoie@gmail.com> escreveu:

> hello
> 
> I am the owner of a zoran based DC10+ card.
> I am in the need of using it since yesterday and I found that its driver was removed.
> 
> Reverting the removing patch made to a temporary working situation.
> 
> If I understand correctly, it was removed due to lack of vb2 convertion.
> If I am able to do this vb2 conversion, does bring it back in mainline will be posssible ?

Yes.

> In that case I am ready to assume to be the maintainer if needed.

Yeah, if we're willing to re-add it, the best is if you can also
maintain it.

Thanks,
Mauro
