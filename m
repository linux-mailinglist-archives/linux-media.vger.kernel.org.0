Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1569731FA4
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 16:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfFAOJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 10:09:24 -0400
Received: from casper.infradead.org ([85.118.1.10]:40658 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfFAOJY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jun 2019 10:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HMgE4NOfuD1y+txLeI+CpHA2UOtahG0/vjKdYggheao=; b=BI0NZH7CMS5qwQH+X7P2rUCyKq
        C4NDI4lpOxmXhuv7hgwSFP4g12L3iMgycbQXH5oNmXnhU4KswqWv+bzFdwBQtHLHDT0rw8erAbOrt
        BbFSDDVHfcJ8Pnvncr5o9qNmq7vDWEK8F6dYQdDrmtnrm/HZmwRqFLmrPNPqNpO1cOMFAIl+ZtafM
        dNVMXRZaL/yynvdbPqJEYDpYxCAbmgz1gLXdk8DT4hjhBD2xHUEQ9LYmJ/5jSAnyO6uW1G/xP7Zub
        ib8qXGRBqopD3YU2f+rQbEmOGwpG97in4DY8aePNnnZhtS8V1PpKtsCWZlxV/AvNsXlIYXNNuYtLk
        ws1H2IEA==;
Received: from 179.187.96.185.dynamic.adsl.gvt.net.br ([179.187.96.185] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hX4hG-0005ke-KU
        for linux-media@vger.kernel.org; Sat, 01 Jun 2019 14:09:23 +0000
Date:   Sat, 1 Jun 2019 11:09:19 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     linux-media@vger.kernel.org
Subject: Re: [ANN] Patchwork version upgrade
Message-ID: <20190601110919.2ea904ef@coco.lan>
In-Reply-To: <20190531124050.3f06e1b8@coco.lan>
References: <20190531124050.3f06e1b8@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 31 May 2019 12:40:50 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Hi all,
>=20
> For a long time, we were running an old Patchwork version. The thing is t=
hat
> we had applied some patches on the top of it, and the upgrade was not
> trivial.
>=20
> Today, we upgraded it to its latest stable version. Just like before,
> you can access it via:
>=20
> 	https://patchwork.linuxtv.org
>=20
> As this is a new version, please report if you find any issues on it.

I found a minor issue at the database where 166 patches didn't have
a commit message. On patchwork 2.1, the commit message is mandatory.
Not having it prevents being able to change the patch status.

After looking into it, it seems that this was due to some bugs with
the initial versions of patchwork, as the database before the
migration were also missing the data.

This was fixed by setting the commit message with an empty value.

=46rom all I see, this happened only with patches that were already
applied, so it shouldn't be an issue. Yet, if you have any patches
pending to be applied, it doesn't hurt to check if the commit
message is empty at patchwork.

Btw, I'm tagging all patches that aren't with "new", "under review"
or "TODO" status to the archive.

Regards

Thanks,
Mauro
