Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5F771AE7
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 16:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbfGWO4M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 10:56:12 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:37504 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfGWO4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 10:56:11 -0400
Received: by mail-ua1-f43.google.com with SMTP id z13so17021896uaa.4
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 07:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z217PvHXzA+sTOva4uOaY/NmQ/Cvv08x0jX2HEPTGv0=;
        b=PR4CvZDf0kWnSiAE5hS2c5fXVBcHr3UqNlDLjvMhU0KoVuXI5SJbazESydUMJxQaU0
         nhLnAKbwvjLNSWKkfgPXzObcDFKZsCPvOFORvgSFNPBchB1VV1KjnNjFspxdpA8Q5Lhe
         OSCil41G0PtowDm4R6QHy8EtbFMXyA+gU1kb/G2YczHBHJBjtqabD4liNjnMcw1aj1fD
         w0zF0DzR+xcITr16A9E+LETj/QMn55ie4VDd/3kLSbwHcvJoZdTi5/hPKFmzfJVK43F1
         QqxQJEJBS7EO0NE8kY/xMnXk3eTj2uOki8G9r18qGDAi784LV/uVrFreQ+GcTWsivWXC
         Zhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z217PvHXzA+sTOva4uOaY/NmQ/Cvv08x0jX2HEPTGv0=;
        b=OD2iDCes5iP1Zbu63nor64HL2HprpWLZCR/Y6mySnRa4KhBto9nN21ohBjR5yHK7uc
         +RXyL2ACstNeZxkCEYcHkpN4OueIk6Zf25PRncN9zxauIBseiReQULe/icY1vn1Ldq57
         lbVWk+y3cv+V0+tmcdb9putBICGG2h5j48SOp24IjxqtX/mkHqRcvtLeciGCYP3kUmWM
         FX9FT4NuLYTuxTbBKt39vLZ8B9QJbaqYE5Q9+8jK9VSVi0KoD43ninpvINYNRbGj6RPT
         RNw7j6YETWVKBLOa/+7TuASP/374pUT0cUtrHUHNWXlqqOAcVW+1qipf2bQDd6xopLPV
         UkCg==
X-Gm-Message-State: APjAAAX3Jj5HOOOVc+6WCwUe2Ngx888GoaUe95mojfKkUv+nRmJL23BK
        UBj1ehyVEL03Bmmez/vJaR0jZ3RQH+g/F/CJNug=
X-Google-Smtp-Source: APXvYqwA7UA4npa6Bn1rZQhXRrsyDzWrlNtxDpU0KuA8b1sB5d1qy3P0A8PDRqJETC7uRk4DZjuk896ekek3ZrPL1ow=
X-Received: by 2002:ab0:6619:: with SMTP id r25mr124522uam.33.1563893770868;
 Tue, 23 Jul 2019 07:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <68cb708f-c567-ce2b-be1f-c2d9c7b68f46@gmail.com>
In-Reply-To: <68cb708f-c567-ce2b-be1f-c2d9c7b68f46@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 23 Jul 2019 11:55:59 -0300
Message-ID: <CAAEAJfD7V-dBS7vN_XqHh_v25+-ui3md5KgmBK13cStzkbOumg@mail.gmail.com>
Subject: Re: Question about TW686X driver
To:     =?UTF-8?Q?Mark_Balan=C3=A7ian?= <mbalant3@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Mark,

I'm glad you are having fun with the driver.

On Tue, 23 Jul 2019 at 11:45, Mark Balan=C3=A7ian <mbalant3@gmail.com> wrot=
e:
>
> Hello all,
>
> My name is Mark and I am working on contributing to the open-source Linux=
 project.
>
> I would please like to know more about the TW686X driver. In particular, =
when running concurrency tests on the driver, it seems like there is no evi=
dence of interrupt handling/calling before tw686x_memcpy_dma_free(), which =
could be problematic. Am I missing something? I would highly appreciate you=
r explanation for educational purposes.
>

Not necesarily, as the code explains:

/*
 * We can call this even when alloc_dma failed for the given channel
 */
static void tw686x_memcpy_dma_free(struct tw686x_video_channel *vc,
                                   unsigned int pb)

Are you having any specific issue ?

Thanks,
Ezequiel
