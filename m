Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7813F4C86
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 16:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbhHWOmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 10:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhHWOmL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 10:42:11 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B949C061575;
        Mon, 23 Aug 2021 07:41:29 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id 7so15561498pfl.10;
        Mon, 23 Aug 2021 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ol6W4bXWCv9FTATuINyxwcfpsfeqvO0o5NfBCd1tqUQ=;
        b=DYocfm0++EzhgB+d4JslJIxlORV+9aHR55P1OsCMag8kHmS1XkVWgxCwPOFlIsVpz0
         q4/XgwRoGX5Pbp9nJ6XB4xXMkAzwJGuSXDivze+NJtaaXp3cJDycRy4mOnnslbFeHXzL
         uouOtDmPgYPiC6r684qObEmvrWzFdfyk1ssfJTTDHsVXL80CISef3JuDBcCyxi+nlfsq
         lbrY9o8myPm5+c4IstFVymMSE6IYNjhaXkz1dN2WPbxJ6dbFQfQLdouQeuFKuaryF5+Y
         4NpoG6/iRtSYSCTxEhpjQXvrlOMlXXjWHuCIsYP8BcpSCen3EJVkeUVDDI4HZjywMWgU
         mXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ol6W4bXWCv9FTATuINyxwcfpsfeqvO0o5NfBCd1tqUQ=;
        b=DlXkYf/1zWvga8Y+WtcVIlc2zmkmrVy3xoPz95ZZC7Un4aLTrpMexTwqZO52FIli6I
         WmZqs4Vj/RWpeAjAA35X57uQEp46ajkqNwjfyYdlyn2MuN9LzlC+BZFN5SOJMC8tOAAw
         X0hmSDEG0SiTOwEtkA2Kj7SKr3cFT88nzex10TWLJgd6Ssk6uihJP06UMIpq5quuDY8t
         oslV1CXDb9q5UnsqBVaN81BP9nPMUmxVRR3OrFEB51FSP9dB29Wq/5fct2eJxEh/+Pdu
         pVvbgVJCJn/JGKIgUMxV+XTrnAgSb55KHjuAwE4MHEhkVY49r52ZLU5YcGz/6/AcGidZ
         oEhA==
X-Gm-Message-State: AOAM530CLywRAVZDfDgHD1kGfR8onIL+Iw0BiUUHEOVbTm07C7zRTHyz
        NvnG/lufGVGE/ztO7pdtZ1AlCWTmvbFqOKbcsYA=
X-Google-Smtp-Source: ABdhPJyDTQ+mWmIFG3nt9aTJUBmVta3r7qpq2ruP7rHHSrKiC9FonF2CSKq3bTgSkUVbJtcGlnbEp3iJ4WXb/lFHX8E=
X-Received: by 2002:aa7:800b:0:b029:330:455f:57a8 with SMTP id
 j11-20020aa7800b0000b0290330455f57a8mr33784700pfi.7.1629729688684; Mon, 23
 Aug 2021 07:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210814155742.11392-1-novikov@ispras.ru> <b4069b42-7ce9-126c-0d0c-7ff6fb2b9631@gmail.com>
In-Reply-To: <b4069b42-7ce9-126c-0d0c-7ff6fb2b9631@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 23 Aug 2021 17:40:49 +0300
Message-ID: <CAHp75VeR5XC5Wd1CNx3VDgSayBinGL6q+ibFsRrSOECVy5x9Qw@mail.gmail.com>
Subject: Re: [PATCH v2] media: pt3: Switch to using functions pcim_* and devm_*
To:     Akihiro TSUKADA <tskd08@gmail.com>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kirill Shilimanov <kirill.shilimanov@huawei.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 23, 2021 at 11:12 AM Akihiro TSUKADA <tskd08@gmail.com> wrote:
>
> Tested-by: Akihiro Tsukada <tskd08@gmail.com>

Thank you very much!

-- 
With Best Regards,
Andy Shevchenko
