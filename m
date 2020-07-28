Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC374230E58
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 17:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731034AbgG1PrZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 11:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730856AbgG1PrY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 11:47:24 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74F3C061794;
        Tue, 28 Jul 2020 08:47:24 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id 12so17879527oir.4;
        Tue, 28 Jul 2020 08:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YCLgayXVR84rgFeMyBYYYRpAkGF7Ck+bhddMBVycb04=;
        b=cMJVZYUseob/GyYm/slYbGX7F8Nm5ECy0snr5+bGRfsWn8HC2dUbmghG5UDIsTrSSR
         8x0ItKdNvs85NKfK4qfcO36B0boH5tg+a9gswRmK2V+NxlgokEPiT8xTIDjvbxB2/da/
         I4YL4YbfIg3tAhgIJQzOSlfc9UlydG6BQiUZYETqUftJsIkQc1tPlVbbONQsOJxrdkCC
         RELXTSJsxvsPXTEUu24HF4+P1BhD/9m5OAle1WfYTHywf8uOaBoXEghmPBxvwlKPZY41
         w2Re/IabeFqMyp75VmjBGkiJRDBRqPjon0D5eUa1N6IPBpnEKjgSzrwZ05oae5j/cvJQ
         uPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YCLgayXVR84rgFeMyBYYYRpAkGF7Ck+bhddMBVycb04=;
        b=rYbtiAYSAR2cXFAORZ9nY0xxJLlNM0LQ2vxofpt6T4eKFZ6Ye1wDzWoc1K2ULEaHXk
         PRS3BB8GWNKzFn5/V8ZzwMNSkCewPQJ2NJ6aiE4o4zNvFFIAGxR787j37/ZyYERwZFml
         p8KaGYmg7g6Ohf+X6Hf40vuMAAmIGprqHYBP/66xg7m3ZN2Rw4oG2htdlcAMzza7BCYN
         GWXYBWdWkiBSwOxvULv79Wj9g6IFzQwVYyg6Phs1G3ToYRD/vRjrJlOngAoPpVlntpj5
         ujyl19lNWHxYlkPA8s4horr5d/raklu0MbbNY8fDYlRb0YSVWcYOrQFZrx9fNtXTpJZQ
         an8w==
X-Gm-Message-State: AOAM531WEmNffzKDb8ASCrxWFp9plsxAy+uoVc5Ih9g43rAfdCGumMFY
        /HxEXXz7E+uQZ/Fu/XwXUDZLJJFN5rSU7moWfcc=
X-Google-Smtp-Source: ABdhPJyS7mrzx8DGeBh07Zri8yZLkxWNUUJWMY7Z5K/tddbNBKhDPUNoIvoOAGnCP4K4OomxSuELQP2R4UDNmGX56YA=
X-Received: by 2002:aca:c5d6:: with SMTP id v205mr4223108oif.143.1595951244137;
 Tue, 28 Jul 2020 08:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200728143004.3228-1-dhiraj.sharma0024@gmail.com> <b357f49c-0ce6-18f5-9f3c-fdead5e4c838@xs4all.nl>
In-Reply-To: <b357f49c-0ce6-18f5-9f3c-fdead5e4c838@xs4all.nl>
From:   Dhiraj Sharma <dhiraj.sharma0024@gmail.com>
Date:   Tue, 28 Jul 2020 21:17:11 +0530
Message-ID: <CAPRy4h0sZRuYSJr5+Au-H5iaL-73m9b02wAkL5xY-qMvvZY=VA@mail.gmail.com>
Subject: Re: [PATCH] media: usbvision: fixed coding style
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Greg KH <gregkh@linuxfoundation.org>, stern@rowland.harvard.edu,
        arnd@arndb.de, jrdr.linux@gmail.com, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry I had committed a mistake by not replying to all.

> Hi Dhiraj,
>
> On 28/07/2020 16:30, Dhiraj Sharma wrote:
> > As per eudyptula challenge task 10 I had to fix coding styles. Thus I
> > used checkpatch.pl script and fixed a chunk of warnings and few errors.
>
> As both drivers/staging/media/usbvision/Kconfig and .../TODO say, this
> driver is deprecated and will be removed by the end of this year.
>
> So don't bother with this driver.
>
> Regards,
>
>         Hans

Alright Sir, I read that and thought that it can be merged this year
though. Next if i see such sentences I will not do that
