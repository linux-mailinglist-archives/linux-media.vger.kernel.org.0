Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E324971B5D
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 17:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733070AbfGWPSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 11:18:04 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:35458 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733050AbfGWPSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 11:18:03 -0400
Received: by mail-vs1-f53.google.com with SMTP id u124so29046923vsu.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 08:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=XPMfZ43dUCKNfnjQs1HTQ63HH4wVmfBGyruTFtIl7nA=;
        b=UAkcsGVI/OMMiwjVwBQ285Bp34w2HeRR0gzCSvp8uRTdElaphcIZLBZUk0NT0xV81d
         ABZb2uw2YiAuEdfAHM9+JI5dGvzHHw+laEkMx5kMzwJXuWp09c1zpurjg+NG1dT0mCbK
         bVN9xcshWgUBNA/ArDfQkNw5NYME3Yj6C7HZm+xf7Nj9CaYZL+4pZWAuYgAitcJoV/K6
         XJblMKqk1J0GSNUscz415/962hxxYAWeuvO0nDum1J69I53WpOq1RU9EWyR5uh+kxsM8
         ZpxY9Z931DG4kFQwXJwYv2JohDIlkcXNthaK0ZWbqCeoJ5Ocm3Chu0RF9YsdDEvPIoDp
         iQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=XPMfZ43dUCKNfnjQs1HTQ63HH4wVmfBGyruTFtIl7nA=;
        b=OxA9ZwQ8zGIt19mIJ5rZKVgQdTvv4rbfrhVgwW76lQ7Pxz/NzwbsUKMWjXYjXJL4rC
         WQPrCfnTdkl+bhr/XXQo3zQK2t3DlRxKLyUK6W7WN9Df3DIVVDIDpugLir8mOSrXUwaq
         cS61EpJTTMBkyH1p9demp7DOsi5yq7taKbBRl5VtydOMPQCB8LB7XGAKLqP1G2CTk5f7
         CQ+rPHCoprgpAX2bRbohJ+26ksVDwoVnan5Qh4ieFALrBPsWmuc8mIGgNjupRnwEclPB
         eEFKeuJrij+CYsVbme6Dd8Y5F0KvPYsfFM4bfk5m6JiZJqcQYaNfYMLT+E22D5404UzN
         0eKw==
X-Gm-Message-State: APjAAAXgO6l7k6XpYOtInme0b+E90y0HXtzkGk02x3CqjssI02+jxVRP
        Ulcf0dfeNMKJlEkjdWP27KwFlhHBz8QqAGzD16k=
X-Google-Smtp-Source: APXvYqzR9822JuOVPPaSvm7rUs4hSLI7IG1SeYwJsM0APiS+2ghcnt+dw1fUqCELVwk/iQ8h5dyrsDNI/HAeEUl6szQ=
X-Received: by 2002:a67:e9ca:: with SMTP id q10mr15676326vso.105.1563895082718;
 Tue, 23 Jul 2019 08:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <68cb708f-c567-ce2b-be1f-c2d9c7b68f46@gmail.com>
 <CAAEAJfD7V-dBS7vN_XqHh_v25+-ui3md5KgmBK13cStzkbOumg@mail.gmail.com> <C268B9DE-3871-48AF-90B1-527422AD9282@gmail.com>
In-Reply-To: <C268B9DE-3871-48AF-90B1-527422AD9282@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 23 Jul 2019 12:17:51 -0300
Message-ID: <CAAEAJfDKJ2rur1wBSTkUySGkZMMJNN5fiYrSxmqbx-QiKgP4nA@mail.gmail.com>
Subject: Re: Question about TW686X driver
To:     =?UTF-8?Q?Mark_Balan=C3=A7ian?= <mbalant3@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 23 Jul 2019 at 12:02, Mark Balan=C3=A7ian <mbalant3@gmail.com> wrot=
e:
>
> I see. I guess then my issue would be help in seeing how tw686x_memcpy_dm=
a_free alone does any required interrupt handling, since there are also fun=
ctions tw686x_irq and tw686x_audio_irq for interrupt handling as well? Howe=
ver, in my analysis, they were called after tw686x_memcpy_dma_free.
>

What are you trying to do? and what is exactly not working?

PS: Don't drop linux-media from the Cc list, and please don't top-post.

Thanks,
Eze
