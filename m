Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F0D45D5B4
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 08:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235330AbhKYHs3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 02:48:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:40952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234489AbhKYHq2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 02:46:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0BA861107;
        Thu, 25 Nov 2021 07:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637826197;
        bh=5JmydjakFnLr1DXYN6HX8GSmUQA89caK93Xg2HhpGcc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Lo5Q88DYMszIwzEUP4xaWaHGk4thoYzc5zXWgjpJuOTUVXi1mPa8iX/67WsoBF7VX
         rD+xFR2liyM3yRAaTbAXGsOj47cCGJ+pmRW4xo3//I0BaJCRWB7Z/kA9Bg6qN82TTp
         AyNEbOE2BXH9BstgBxeYZFkKd5estm6tPwCv0ZhK5vFObG7HXzo9p2BkZTOqP06Ado
         D9rIbDKkqEiQCL6iTDt/xMw4g5anPMfwERqQRsWQdkDFjcXO12pCFH7xee6CupoAY/
         BgeUpmSYEn4QRRAuJK5p8WSv720GLXo7fAlnvaSQGonBLPRyg5X15OgHidOKf1WCNO
         bnEzHNLpF18uQ==
Received: by mail-wr1-f54.google.com with SMTP id i5so9612926wrb.2;
        Wed, 24 Nov 2021 23:43:17 -0800 (PST)
X-Gm-Message-State: AOAM5317Pt88MKlMckofCA2lrlV7fz6db+TI+tZa4F6mcggpkQdXaGDG
        8+FEohGDVNjooei9b1Zkfvwu62+jCHCj2/SbTWg=
X-Google-Smtp-Source: ABdhPJyuLBhKBRzn/KY8mhWpsA5nVPv2Qy5ZAD6+THS3UuR1IIWEOkVnw5icB8DlWWMQACCSb4V0WCkZu7KyR+FPEq4=
X-Received: by 2002:adf:d091:: with SMTP id y17mr4508644wrh.418.1637826196259;
 Wed, 24 Nov 2021 23:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20211124192430.74541-1-arnd@kernel.org> <YZ68G09viJA/vkby@pendragon.ideasonboard.com>
In-Reply-To: <YZ68G09viJA/vkby@pendragon.ideasonboard.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 25 Nov 2021 08:43:00 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2kEByuNJu9NMiD2m3v+K0acE-XwdevHGByi_82bko7Uw@mail.gmail.com>
Message-ID: <CAK8P3a2kEByuNJu9NMiD2m3v+K0acE-XwdevHGByi_82bko7Uw@mail.gmail.com>
Subject: Re: [PATCH] media: omap3isp: fix out-of-range warning
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vaibhav Hiremath <hvaibhav@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Dominic Curran <dcurran@ti.com>,
        David Cohen <dacohen@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 11:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Nov 24, 2021 at 08:24:15PM +0100, Arnd Bergmann wrote:
> >
> > Add a cast to 32-bit to avoid the warning. Checking just the lower bounds
> > would be sufficient as well, but it seems more consistent to use
> > the IS_OUT_OF_BOUNDS() check for all members.
>
> Mauro has submitted a fix that handles the cast in the
> IS_OUT_OF_BOUNDS() macro, see
> https://lore.kernel.org/all/b70f819b11e024649f113be1158f34b24914a1ed.1637573097.git.mchehab+huawei@kernel.org/.

Ok, thanks. I've marked my patch as 'Obsoleted' in patchwork now.

      Arnd
