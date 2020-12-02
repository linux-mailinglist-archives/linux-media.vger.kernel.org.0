Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C37B2CBAB6
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 11:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729492AbgLBKkK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 05:40:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgLBKkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 05:40:09 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3140CC0613D6
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 02:39:29 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id z21so3709488lfe.12
        for <linux-media@vger.kernel.org>; Wed, 02 Dec 2020 02:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PRdEsQP3FzAy9QvWmmQsl0Ey32GurWMdzYHxnZ9TFvk=;
        b=AE6bLpRI5aQAWj0YhHisxqSI6vGjjEgkrSAAF5QzphcmDcS9rvPA01Q2+Wo55n5RrD
         wLPgGQlRRZpvuNLGDbJFi3yefsae2N3gUaqvS/FtW/yuUkVhMREAE9eT46ftQafqFvea
         iLyKCTAJKq0e7BueDynAikZSuND4/e2M+VhNgeG4LjJ9GdJQerzSNV4tVrfCZTo9hAuz
         s9et7lASDzz3i1kiWApXOtrbRPTQO10cRygwHqBK0x/W0FeE15D/2KRPwMhOn66Sylu9
         tz5h1hIsKS7nmKcF50hzl2nU0dXBwifQxfqjhipsS2vPM2jIMLispb3ZKpYKoN1M7K/T
         fPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PRdEsQP3FzAy9QvWmmQsl0Ey32GurWMdzYHxnZ9TFvk=;
        b=XMo7qd8DSw158D6KH5yBkuHkF89NwTZXlaNkHPZJHiPXkW9iRXAl3psIGufQGNZp+9
         upNxH+19JpCgs8EomUqXXS4xRgkDDWF2KuV8CUUplakcWqieiRF3e6EHW+MFB3+nLizA
         FVQA3jPNenDkd5ZrpXn1yqqajmttD5IGvFIzZVkZfytzi9p1KWyw/xckfy/9oJXOWaRI
         EBuRECEGGlaGBTogeTgSldkt5t4OzhP8/PKYD7ZrxdzGms7IokPz7AfyYdqjdy8PaKdF
         dHrPgLDOgz3QuZxdqv4B3AhzcwC87712XmznbI64lUAoNQ73/xKQAiqVvKNl4dvp9hbT
         ym+g==
X-Gm-Message-State: AOAM533EhUB2leeDDyFzEdjBi9t5mEfwO8afu6jWdZ1HBon09p+s1gZp
        40I1Brb/Busa94YRdEXvENVN1kDYpflVUvZ91cWxHVyfLko=
X-Google-Smtp-Source: ABdhPJw//PZdHNZ+6ZxvbfnV5dn4T5NjtBgfDeECu+Uky5LDTeP0g5nrczRk2DOpLj4Rk3xS6TkZkyzxVksNE3G8rn8=
X-Received: by 2002:a19:8686:: with SMTP id i128mr976020lfd.333.1606905567648;
 Wed, 02 Dec 2020 02:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20201124112822.29414-1-festevam@gmail.com> <f3820b3d-51c8-e58c-e11c-e8eb105636aa@xs4all.nl>
In-Reply-To: <f3820b3d-51c8-e58c-e11c-e8eb105636aa@xs4all.nl>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 2 Dec 2020 07:39:15 -0300
Message-ID: <CAOMZO5DMPNwoUBxBPxnBQZRJcQit6HC=BkXUDnBAAf+m-MrCOg@mail.gmail.com>
Subject: Re: [PATCH] media: coda: Convert the driver to DT-only
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Dec 2, 2020 at 5:50 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> >       struct coda_platform_data *pdata = pdev->dev.platform_data;
>
> So this can be dropped as well (and all related code), right?

Yes, you are right.

> And you can also remove include/linux/platform_data/media/coda.h.

Yes, thanks for the review. I have sent v2 with your suggestions.

Cheers
