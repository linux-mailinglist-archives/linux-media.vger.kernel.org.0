Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A3F1AE980
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 05:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgDRDNk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 23:13:40 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:23684 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgDRDNj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 23:13:39 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200418031337epoutp04ef0baad49b07cd1992ba0a2537ddc1fe~Gy3P9zjNU2851528515epoutp04R
        for <linux-media@vger.kernel.org>; Sat, 18 Apr 2020 03:13:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200418031337epoutp04ef0baad49b07cd1992ba0a2537ddc1fe~Gy3P9zjNU2851528515epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587179617;
        bh=PNqePkFJpb+GbkXncFDdHUdqpNPiEttbkU3pj2IpZzc=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=OGyvG48XMmy7oBP8vvghkUN0YRwj7xSGVFGHwoptNoE5yz2BHLIsfNsxtoZI8Vkzc
         SxkFInWZNf43PAK9xJL/icRAQXlKjLsKWYmAP3DjfCXZy6kC6S6gB/2CsiP1I8UWyu
         k448+YdcHUESyD+RPP5QIXMsunuYqNFzbn/r1Tg8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20200418031336epcas2p4995f9bedba0d9800a6f36020ec330913~Gy3PNfSh72331123311epcas2p4y;
        Sat, 18 Apr 2020 03:13:36 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.188]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 493yht6k9vzMqYlp; Sat, 18 Apr
        2020 03:13:34 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        27.F8.04598.E507A9E5; Sat, 18 Apr 2020 12:13:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20200418031334epcas2p2594e3c5bd6d5c4726b7d9996650e124b~Gy3M728Db0781907819epcas2p2u;
        Sat, 18 Apr 2020 03:13:34 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200418031334epsmtrp1f4e4f9dd814f337db978ee78c85dbe4e~Gy3M7HTzP0377203772epsmtrp1x;
        Sat, 18 Apr 2020 03:13:34 +0000 (GMT)
X-AuditID: b6c32a45-ea1ff700000011f6-7f-5e9a705efde3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        67.2C.04024.E507A9E5; Sat, 18 Apr 2020 12:13:34 +0900 (KST)
Received: from KORCO038849 (unknown [12.36.155.199]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20200418031334epsmtip13a6e59867c94bce300d28a5a32300598~Gy3MwIT6C2622726227epsmtip1Z;
        Sat, 18 Apr 2020 03:13:34 +0000 (GMT)
From:   "Sunyoung Kang" <sy0816.kang@samsung.com>
To:     "'Mauro Carvalho Chehab'" <mchehab+huawei@kernel.org>
Cc:     "'Hans Verkuil'" <hverkuil-cisco@xs4all.nl>,
        "'Arnd Bergmann'" <arnd@arndb.de>,
        "'Greg Kroah-Hartman'" <gregkh@linuxfoundation.org>,
        "'Thomas Gleixner'" <tglx@linutronix.de>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20200417092402.3322e2da@coco.lan>
Subject: RE: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
 get_v4l2_buffer32
Date:   Sat, 18 Apr 2020 12:13:34 +0900
Message-ID: <145201d6152f$584a7850$08df68f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ7gu42VSZ3MiAb9Gs8yfburY36QgIZ9gAxAyzVj4OnCSH6MA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRmVeSWpSXmKPExsWy7bCmhW5cwaw4g7NnTC3+TjrGbtG8eD2b
        xcWZd1ksLu+aw2bRs2Erq8XD2VcZLTZvmsrswO7x+9ckRo9NqzrZPN6dO8fusX/uGnaPz5vk
        PE59/cwewBaVY5ORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6Dr
        lpkDdIuSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8DQsECvODG3uDQvXS85P9fK
        0MDAyBSoMiEno+1rE3PBZMGKXY+WsjYwzubrYuTkkBAwkXhx8ihjFyMXh5DADkaJy2/mskE4
        nxgl7u2fwALhfGOUeHTmNCNMy7O3s9ghEnsZJb7+3ATV8pJR4kzXWhaQKjYBfYn21o/sILaI
        gKVE176HYN3MIKMu7nMCsTmBalav6AaKc3AIC8RJ3NioDhJmEVCVWL52MSuIzQvU+mbDFUYI
        W1Di5MwnLBBj5CW2v53DDHGQgsTPp8tYIVY5SSzd/g9qlYjE7M42ZpDbJAS+s0kcOLOKDaLB
        ReLRuh4WCFtY4tXxLewQtpTEy/42KLteYtrnz6wQzRMYJV4sOM4KkTCWmPWsHexoZgFNifW7
        9EFMCQFliSO3oG7jk+g4/JcdIswr0dEmBGGqSmz4ZAQxQ1ri7dvLjBMYlWYheWwWksdmIXlg
        FsKqBYwsqxjFUguKc9NTi40KDJHjehMjOJlque5gnHHO5xCjAAejEg+vQc/MOCHWxLLiytxD
        jBIczEoivAfdgEK8KYmVValF+fFFpTmpxYcYTYHhPpFZSjQ5H5jo80riDU2NzMwMLE0tTM2M
        LJTEeTdz34wREkhPLEnNTk0tSC2C6WPi4JRqYJQwW6GStXnilRX2k6XFtJ67d6nFO6XdTViz
        Q6TqsHmjXz1T1JaasJvR2fc/6tY/f7/qzL7qGYHX0zRmBz549iDhGev3OfMXVU67nM1Y56H0
        Y3vthhivwsm9qja/VAznLhDd2PZxl95dfvHHfttnLkh5bHYy8WNPYDH3g77HegVccwLjjTIW
        syuxFGckGmoxFxUnAgC2fFAPvAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsWy7bCSnG5cwaw4gxeTxC3+TjrGbtG8eD2b
        xcWZd1ksLu+aw2bRs2Erq8XD2VcZLTZvmsrswO7x+9ckRo9NqzrZPN6dO8fusX/uGnaPz5vk
        PE59/cwewBbFZZOSmpNZllqkb5fAldH2tYm5YLJgxa5HS1kbGGfzdTFyckgImEg8ezuLvYuR
        i0NIYDejxPl/X1i7GDmAEtIS+zfmQtQIS9xvOcIKUfOcUeJUy0xmkASbgL5Ee+tHdhBbRMBS
        omvfQ0aQImaBX4wSW9efZYHo2MgocXTeVLAOTqCO1Su6GUFsYYEYiX/rZoN1swioSixfu5gV
        xOYFmvRmwxVGCFtQ4uTMJywgFzEL6Em0bQQLMwvIS2x/O4cZ4joFiZ9Pl7FCHOEksXT7P6ga
        EYnZnW3MExiFZyGZNAth0iwkk2Yh6VjAyLKKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93
        EyM4rrQ0dzBeXhJ/iFGAg1GJh9egZ2acEGtiWXFl7iFGCQ5mJRHeg25AId6UxMqq1KL8+KLS
        nNTiQ4zSHCxK4rxP845FCgmkJ5akZqemFqQWwWSZODilGhhXSbldPpt/frbGpj2X/e9LPrhm
        Fl8zdVmF0GJhmZWWFdl7L67LMi4wqnH8U/395O4I8xlNc5f9v3Kquazq66Xd8xpchR+y3HDa
        foHv76PvFb6POpacsLhhpnrdV6G19Zh877fsh8cstN7+n7fo+uzGhzY7u+u7ojYHrHh9fO51
        +a23vRbLvZXTUWIpzkg01GIuKk4EAKlg7rGnAgAA
X-CMS-MailID: 20200418031334epcas2p2594e3c5bd6d5c4726b7d9996650e124b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e
References: <CGME20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e@epcas2p4.samsung.com>
        <20200417024543.66785-1-sy0816.kang@samsung.com>
        <20200417092402.3322e2da@coco.lan>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It uses the reserved 2 field to receive additional information about the
buffer from the user. 
Additional information is for special functions.

Copy the Reserved2 value to put_v4l2_buffer32(), but it is missing in
get_v4l2_buffer32(). Can't I put it in get_v4l2_buffer32() also?

Thanks,
Sunyoung

> -----Original Message-----
> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Sent: Friday, April 17, 2020 4:24 PM
> To: sy0816.kang@samsung.com
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>; Arnd Bergmann
<arnd@arndb.de>;
> Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Thomas Gleixner
> <tglx@linutronix.de>; linux-media@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
> get_v4l2_buffer32
> 
> Em Fri, 17 Apr 2020 11:45:23 +0900
> sy0816.kang@samsung.com escreveu:
> 
> > From: Sunyoung Kang <sy0816.kang@samsung.com>
> >
> > get_v4l2_buffer32() didn't copy reserved2 field from userspace to
driver.
> > So the reserved2 value is not received through compat-ioctl32 in driver.
> > This patch copy reserved2 field of v4l2_buffer in get_v4l2_buffer32().
> 
> Why should it copy reserved values? Those should not be used anywhere.
> 
> >
> > Signed-off-by: Sunyoung Kang <sy0816.kang@samsung.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> > index a99e82ec9ab6..e9b2b9c0ec9a 100644
> > --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> > +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> > @@ -665,6 +665,7 @@ static int get_v4l2_buffer32(struct v4l2_buffer
> __user *p64,
> >  	if (V4L2_TYPE_IS_OUTPUT(type))
> >  		if (assign_in_user(&p64->bytesused, &p32->bytesused) ||
> >  		    assign_in_user(&p64->field, &p32->field) ||
> > +		    assign_in_user(&p64->reserved2, &p32->reserved2) ||
> >  		    assign_in_user(&p64->timestamp.tv_sec,
> >  				   &p32->timestamp.tv_sec) ||
> >  		    assign_in_user(&p64->timestamp.tv_usec,
> 
> 
> 
> Thanks,
> Mauro

