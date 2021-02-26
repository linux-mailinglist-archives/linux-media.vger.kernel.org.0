Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE31326144
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhBZKaW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:30:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:47184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230139AbhBZKaV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:30:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B41F964EE2;
        Fri, 26 Feb 2021 10:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614335377;
        bh=YNWSUpBBEtxB4i+CJpuo5l2fb40VGQVshhznjKLxP/8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o5YM32uniY8JGmhdU2mfkWTfNTmgARB+SFtM4x+jSOvD++I4WFNm2UbirQ8aFyOpG
         bwoZgpv6LOq1mi1z/gIDVTyj3eZ6j/WLKoyK/la5rUIlPGXT048TC9X1GQVSkQ4d0v
         ULWHuf8nEsc4NwgepmYgGO+IJPJTP0MYztgVd9BeE0vkaDUkCu2wSx+rntN4QOZOct
         Q5CY0wxd4DU1+K51NkxrF+tlk+5bZKeetn/ANusAnmCmIa1MIYT1jUQ5bI0j6sP9xR
         Kr8oz1Psy+9Smpd6vBYtdnY+YAQTvCM9HrduwgxaH9PeWBbcOEjVqRb1w9HZfSzbuU
         3l/TDreckHeXQ==
Received: by mail-ej1-f44.google.com with SMTP id g5so13957637ejt.2;
        Fri, 26 Feb 2021 02:29:36 -0800 (PST)
X-Gm-Message-State: AOAM5312LpBx7tbaIBJK5BRc0Ibf/q8RLedSn9bjWqxJPT9gQCPeVjiu
        6rBq0USRs9HzAM5DF4t989cJkYAd1LdaO4b1R5A=
X-Google-Smtp-Source: ABdhPJw6j1MeqTqnvIznLmkp9C+b/BZM5vgzxywTeZDDKXiREVY8JIiGwzwmpM/kNtkC39EdkWsuS/sfffdaO3zcHNU=
X-Received: by 2002:a17:906:a896:: with SMTP id ha22mr2522464ejb.503.1614335375164;
 Fri, 26 Feb 2021 02:29:35 -0800 (PST)
MIME-Version: 1.0
References: <1614302920-19505-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1614302920-19505-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 26 Feb 2021 11:29:23 +0100
X-Gmail-Original-Message-ID: <CAJKOXPf9kqOSng5XULJ8qTADfk3VB273dTqY2qoUA3b+MUPJ+g@mail.gmail.com>
Message-ID: <CAJKOXPf9kqOSng5XULJ8qTADfk3VB273dTqY2qoUA3b+MUPJ+g@mail.gmail.com>
Subject: Re: [PATCH v2] media: exynos4-is: add missing call to of_node_put()
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     mchehab@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 26 Feb 2021 at 02:28, Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> In one of the error paths of the for_each_child_of_node() loop in
> fimc_md_parse_one_endpoint, add missing call to of_node_put().
>
> Fix the following coccicheck warning:
> ./drivers/media/platform/exynos4-is/media-dev.c:489:1-23: WARNING:
> Function "for_each_child_of_node" should have of_node_put() before
> return around line 492.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>

You ignored the comment for this. Anyone can run Coccinelle and it
does not equal "Reported-by" credit. Reported by is for reported bugs,
but I asked three times to you guys to share the reports. This is not
an open way of working.

This should be removed.

Best regards,
Krzysztof
