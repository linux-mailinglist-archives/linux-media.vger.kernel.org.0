Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0055122CF0C
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 22:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgGXUIH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 16:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXUIH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 16:08:07 -0400
Received: from forward500o.mail.yandex.net (forward500o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::610])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F568C0619D3;
        Fri, 24 Jul 2020 13:08:07 -0700 (PDT)
Received: from mxback5o.mail.yandex.net (mxback5o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::1f])
        by forward500o.mail.yandex.net (Yandex) with ESMTP id 3A4CD60153;
        Fri, 24 Jul 2020 23:08:03 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback5o.mail.yandex.net (mxback/Yandex) with ESMTP id 5fFSXZVXpp-82RmFQZQ;
        Fri, 24 Jul 2020 23:08:02 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1595621282;
        bh=m2BanQAPl69vRg18tTrq/938FSkS17kTikJwpIpVrUM=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=M/PUXsLP+lUs7DO8C50LfiUKM3ttQZKL0NvefnDa02DzdYpudYOguaf9HpnVDk682
         cys3JqbfQWB50XohGatwOYcp2diDsfY3u7i19Bvw+nB7lopKC/JnJbdF386PpNzAwJ
         nV9sQID/QnKZ2jvWAnQPunMeyR7rIOIjq54M5X3Q=
Authentication-Results: mxback5o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by sas8-b090c2642e35.qloud-c.yandex.net with HTTP;
        Fri, 24 Jul 2020 23:08:02 +0300
From:   Evgeny Novikov <novikov@ispras.ru>
Envelope-From: eugenenovikov@yandex.ru
To:     Markus Elfring <markus.elfring@web.de>,
        "ldv-project@linuxtesting.org" <ldv-project@linuxtesting.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>
In-Reply-To: <b179ad63-b895-39f7-dc18-23636f77e1e4@web.de>
References: <b179ad63-b895-39f7-dc18-23636f77e1e4@web.de>
Subject: Re: [PATCH] media: davinci: vpif_capture: fix potential double free
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Fri, 24 Jul 2020 23:08:02 +0300
Message-Id: <236161595621028@mail.yandex.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Markus,

It seems that Lad Prabhakar detected a critical issue introduced by the patch instead of a minor bug fixed by it. So, we should take care of this first, but I will address your notes as well. 

-- 
Evgeny Novikov
Linux Verification Center, ISP RAS
http://linuxtesting.org

23.07.2020, 23:15, "Markus Elfring" <markus.elfring@web.de>:
>>  In case of errors vpif_probe_complete() releases memory for vpif_obj.sd
>>  and unregisters the V4L2 device. But then this is done again by
>>  vpif_probe() itself. The patch removes the cleaning from
>>  vpif_probe_complete().
>
> * An imperative wording can be preferred for the change description,
>   can't it?
>
> * Would you like to add the tag “Fixes” to the commit message?
>
> Regards,
> Markus
