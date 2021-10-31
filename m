Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D898440E84
	for <lists+linux-media@lfdr.de>; Sun, 31 Oct 2021 14:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbhJaNGu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 09:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhJaNGt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 09:06:49 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCDEC061570;
        Sun, 31 Oct 2021 06:04:17 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id k24so5565496ljg.3;
        Sun, 31 Oct 2021 06:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EMe2Z2587AVutQZvLwNBuhISbQ8pHURWp8p6vvRjrlc=;
        b=a2iKCDA/nqe1HltLr9hVTTfl2+nGyDu2Z3sl5WvHKWffYUTP1PzdUqf468l1TtR5bK
         KmOlJqV58zjINjRK+rB6IcQNIZR/GvPvBHBAxGJat4OVhs4SjudzbaHCVdf8yvrfeTKh
         dn9SKK/iqD0p9ax7zF/mmifUJJ3Oq8mJw8pLMt00GX0O+idlBo+dcyUEFhac7YAUZlB5
         vwQJhhZ77ixkgVrjKdlZryIabUtNaUjBfFcjb7+wgDy0beWPQSUzm+TkF2VWj42jgqSr
         hR1Qic+nb+yJNXQKOW2qo8b0pttbT1IEJCGSNWaC/wimitqp0hmK6oE9fMoVJLbmNO/t
         0SvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EMe2Z2587AVutQZvLwNBuhISbQ8pHURWp8p6vvRjrlc=;
        b=RRNbYLjjX3Nqxh4RpqAfdfNSEwYrd8DjUcs7hHJqwDvc0SWU749CZnl3TUKmypK3O2
         Y8a1m5D15z6c0J35HkhqVgN569LSQNI66F+nDQWDmn0tx4oPXyWNQU2aoPK9OvPXIYTx
         geac94HnFL2W/HR3ZV7ylQRlLQtan7fP5LGTz5ptWKbtM11NusCRuDV1NcDMWFwNrZho
         E3ItK/mQ5XaMUQtogJ/7ynuwkAVfa+3K9cbvQ4GY12X5XWJMsF/wBIUZt52wDKYdpJlD
         NjcXIXsOxBcUYbR6wnAn0h+upUPsB5XwNFaylMpzepz9DXNHeANVEv4pnR7bNr9r2ICZ
         5XNw==
X-Gm-Message-State: AOAM5319r7eCjSGda/IYVDRleJnyXXBoOs2oH1DqOo5YkxB5EF5SZSiW
        dce1sHuD5FHGGUI4G46GHLlJ9yfubILJonByxvk=
X-Google-Smtp-Source: ABdhPJwu7xlJgXcDLfBtqzUnE3+rerLqH1wzhSdAeqWlQfbNF5Kythz68RK7/JMcva/SffISoH67p1nJGkwCfHQG3eY=
X-Received: by 2002:a2e:81c8:: with SMTP id s8mr18128016ljg.407.1635685455484;
 Sun, 31 Oct 2021 06:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <dc24ab2a6c9bb0831e1bb732d3377529fb0ead87.1635679495.git.mchehab+huawei@kernel.org>
 <b561275a4b10949ac06ff834e27243ec6ad6d546.1635679495.git.mchehab+huawei@kernel.org>
In-Reply-To: <b561275a4b10949ac06ff834e27243ec6ad6d546.1635679495.git.mchehab+huawei@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 31 Oct 2021 15:03:39 +0200
Message-ID: <CAHp75VcaWqeY2=13WE+ObQzjA1q83QPU4NGJnPR0H12m68uzVQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: atomisp: comment-out JPEG format
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linuxarm <linuxarm@huawei.com>, mauro.chehab@huawei.com,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 31, 2021 at 1:30 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> This is already disabled on some parts of the code, and trying
> to use it with current firmware causes an error:
>
> [   53.799946] atomisp-isp2 0000:00:03.0: can't create streams
> [   53.799962] atomisp-isp2 0000:00:03.0: __get_frame_info 1600x900 (padded to 0) returned -22
>
> So, completely disable reporting it.


Can't we simply remove all these pieces altogether?
The rationale:
 - code is still kept in the index of the Git
 - avoid robots and humans of sending patches against dead code
 - leaving dead code (even in staging) is not what we want in the long term

-- 
With Best Regards,
Andy Shevchenko
