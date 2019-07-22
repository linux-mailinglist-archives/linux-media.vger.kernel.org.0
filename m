Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4366FECF
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 13:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbfGVLie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 07:38:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42740 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726895AbfGVLie (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 07:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ltugbnpezrITv6PW0eJoJBKvZoB4R0R+O+F/CaDzarg=; b=lZxe+8B5XreE6IPnKOegKppFg
        2n+UjjHl0py+CIL6+9f+rQ5pLC0xdKGucXOdjxfCpx8rIZZknYZ+RXumxlejJzw+N50/Hg1bbokEx
        doV75TMHWA+nk75kcreMpANJQCC7a0C5BoPrmfbft3hsl9ZNA6ocNsDT06geApisrM3/yyC2ORdRj
        AcWRZ2a3Gl8PYDHvUzi+sFgQyiywOjPc0oFW7iEo6X2BcMAp1/iHFw9B5ERFdTkgbjfs0lb/SyvHy
        ZaHVwNZn2GhmDM3tkHAccgB4gbuO1MhOGOqxzQTdhpWxxN1SFWKXIXHczurOL9geh8zdHlqrxn74E
        eYJ5rBjeQ==;
Received: from 177.157.124.3.dynamic.adsl.gvt.net.br ([177.157.124.3] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hpWeE-0004Wz-5p; Mon, 22 Jul 2019 11:38:30 +0000
Date:   Mon, 22 Jul 2019 08:38:26 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     p.zabel@pengutronix.de, hans.verkuil@cisco.com,
        vincent.abriou@st.com, linux-media@vger.kernel.org
Subject: Re: kernel Warning when using vivid with contiguous dma
Message-ID: <20190722083748.2abd3fe1@coco.lan>
In-Reply-To: <1563794460.2546.3.camel@collabora.com>
References: <1563794460.2546.3.camel@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 22 Jul 2019 13:21:00 +0200
Dafna Hirschfeld <dafna.hirschfeld@collabora.com> escreveu:

> I loaded the vivid module with contiguous DMA and ran streaming with
> it with large image dimensions

> [=C2=A0=C2=A0306.437327] Call Trace:
> [=C2=A0=C2=A0306.437338]=C2=A0=C2=A0__dma_direct_alloc_pages+0xc9/0x1c0
> [=C2=A0=C2=A0306.437343]=C2=A0=C2=A0dma_direct_alloc_pages+0x24/0xf0
> [=C2=A0=C2=A0306.437348]=C2=A0=C2=A0dma_direct_alloc+0xe/0x10
> [=C2=A0=C2=A0306.437351]=C2=A0=C2=A0dma_alloc_attrs+0x84/0xd0

Hmm... we had a recent regression affecting other media devices,
reported via Kaffeine mailing list:

	https://bugs.kde.org/show_bug.cgi?id=3D408004#c35

While this one was for S/G, maybe it is somewhat related.

Thanks,
Mauro
