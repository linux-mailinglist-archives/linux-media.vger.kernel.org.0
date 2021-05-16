Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB8238201C
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 19:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhEPRDN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 13:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhEPRDM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 13:03:12 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66AE1C061573;
        Sun, 16 May 2021 10:01:56 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id z12so4281436ejw.0;
        Sun, 16 May 2021 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AtiJHfdmT2LSVR4rbNIaNF36Xfs944KqtBektfTje5M=;
        b=DAGiCJN/B0AuQYxR2YMS1YdLG7E04XbNnAThdGjmBoPVyWeVm0Vt63bTbv2eoScYRQ
         SvAEYLrzwnmzOR5wp1CC3RKN4hyBnHKWJQKmPAax8xiYeQN0kxz2jQJP+F4Eg3PnYmne
         1tPqS44UJ6bIQx53XCLEzkUDSA0PKYzdiJ1Bm8Ux9G1YFwdM/2HDZfALKNqSjTCpM2/w
         /Rh5WhkPS0VtYInMu//A4ZE4YYK/MTrUiFkFfqoKnAk9XrjylD1xFHqznvRukMuPJ097
         ZgkrbbJ358Ttx/9WXCUX4sI2HnbgR0YAj0ln5t6NUysuwZ90LddsWhtadieg1uDXWzMv
         XHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AtiJHfdmT2LSVR4rbNIaNF36Xfs944KqtBektfTje5M=;
        b=rrJxHhVmnvwPsE9bFaNTi/KrxzBoPJmlOu2MQS6pU4umeWuXMrTSdKE+pwLgMhO9s4
         LBqa8MFVADkyrmp7VALoSNHIk7MBpwYNGyDHnYy8HKEiWOAEEenjVCNsNc/3o6zsJiHW
         gE6IUKDg1T7DsFeSGXda10xL3C3AENAJcPANf3lh1iyNSk3hvyxzjPe346srvu216lnz
         FXC2fyZXpxXjYrdH5FrgOzhllgyAigba4gbGYitiRqbyDN/4zASFbwpdM0ROdi13Go0T
         esV1ogqTUSYRann4fwIUgmzEMkN4MxlimP2pqyauT3grOjOYY0s99HQCALwjBvbsiwbR
         HZkQ==
X-Gm-Message-State: AOAM532Buv/UX7vrydWqZkAWLUlkY7o9/Cj95UKbb85FFvA9EMD7U6CP
        n/UI+gU/fViWIVBpwhIfJq4HqadiTK/RF3oG2Q4=
X-Google-Smtp-Source: ABdhPJxElTHfIzHywbG8S+ZiNXqSjJEqGZe2D3CIdGakxelu3WUAQhIbf0zHelLeFVb7YO60doX8+J/CEmulNZITgNg=
X-Received: by 2002:a17:906:57c3:: with SMTP id u3mr59329306ejr.162.1621184515178;
 Sun, 16 May 2021 10:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210513220317.137090-1-colin.king@canonical.com>
In-Reply-To: <20210513220317.137090-1-colin.king@canonical.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sun, 16 May 2021 19:01:44 +0200
Message-ID: <CAFBinCDde0+QzDOYF2EAkjmbdd80Emu3YuFV3jOCMaZuT+FNmQ@mail.gmail.com>
Subject: Re: [PATCH] media: meson: vdec: remove redundant initialization of
 variable reg_cur
To:     Colin King <colin.king@canonical.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 14, 2021 at 12:03 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable reg_cur is being initialized with a value that is never
> read, it is being updated later on. The assignment is redundant and
> can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
