Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B4E16F631
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 04:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgBZDmN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 22:42:13 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34795 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgBZDmN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 22:42:13 -0500
Received: by mail-ot1-f66.google.com with SMTP id j16so1713187otl.1
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2020 19:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zhbMFZH9TV9xXX3bi0AiULw9sla8JatRwgZ0NfA605c=;
        b=kJDoUvS6OOJk+ypY1EujEwgsPIKGLXE6pkmbSfiESFefGeQ4Nl1/uklyaEW0ZctjRf
         /BuGku1pbGbTJQkAKdFDT07ofldpcOno6F37PivyZNi0+RxqwzT/xWZ+7mdmIjlguqAH
         zHSYv7AFcb+vycN05DI991TYsea4JG/1ynAGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zhbMFZH9TV9xXX3bi0AiULw9sla8JatRwgZ0NfA605c=;
        b=MqIdgoUTgvJ0KOkk1TR6is7aksvqp/NMLRkwIuwZjokuixSik8gTMy5z6UABCYYLQv
         7dd1NqsJDM9qxxgv98iN8t4Pb1CTFjlQmG304Fli6h/FEg/SoQSUJsma4Gti4rIg3UQL
         1jFk3f9hNggXaW/ZJSEbLYcMXm0vnN93GWZvgGdmYfl/kF63yDVsr+KTtepUk+lIB9Sn
         RyZOFN+f5ao34bRHDPZybrCokColkK6q4soQVF5qLuiSMZtcZZflQYwmunbMhR3jUBFc
         RJOXvh9t6sgEmOmlk+fRwjm8CAK4PGlcn3Wn4bCWKgw08HZCVmr56czTcYzsDhRBgt7m
         8cxQ==
X-Gm-Message-State: APjAAAXYvsMp7i3t+SB/X5HUSKVS/nFaaWBa4HnYm82580S0HDGnYFbQ
        gKiO+2pnczHxhl2l1/a4DTKMUEM4cTc=
X-Google-Smtp-Source: APXvYqxjv40QQzzFkYNfIRrbnzX9ImkaL5SabV7Y+eW9yiLQRzN8E217SIWBlHiM6TNPuLQJ489Ifw==
X-Received: by 2002:a05:6830:1198:: with SMTP id u24mr1354957otq.215.1582688531601;
        Tue, 25 Feb 2020 19:42:11 -0800 (PST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id x15sm278153otq.30.2020.02.25.19.42.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2020 19:42:10 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id a142so1624664oii.7
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2020 19:42:10 -0800 (PST)
X-Received: by 2002:aca:ab53:: with SMTP id u80mr1537577oie.94.1582688529944;
 Tue, 25 Feb 2020 19:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20200226033646.20949-1-gtk_ruiwang@mediatek.com> <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
In-Reply-To: <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 26 Feb 2020 12:41:58 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
Message-ID: <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek: move MT8173 VPU FW to subfolder
To:     gtk_ruiwang <gtk_ruiwang@mediatek.com>
Cc:     linux-firmware@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, srv_heupstream@mediatek.com,
        Tomasz Figa <tfiga@chromium.org>, PoChun.Lin@mediatek.com,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 26, 2020 at 12:38 PM <gtk_ruiwang@mediatek.com> wrote:
>
> From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
>
> Currently vpu_d.bin and vpu_p.bin are at the root of
> linux-firmware git tree, it's not appropriate so we move
> them to subfolder mediatek/mt8173
>
> Release Version: 1.1.4
>
> Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
> ---
>  vpu_d.bin => mediatek/mt8173/vpu_d.bin | Bin
>  vpu_p.bin => mediatek/mt8173/vpu_p.bin | Bin
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename vpu_d.bin => mediatek/mt8173/vpu_d.bin (100%)
>  rename vpu_p.bin => mediatek/mt8173/vpu_p.bin (100%)

This is nice as it removes some stuff from the root, but for
compatibility with older kernels that don't know about the new path
shouldn't we at least temporarily create a symbolic link between the
old location and the new one?
