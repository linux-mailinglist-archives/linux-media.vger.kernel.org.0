Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F0A1F13B2
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 09:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729041AbgFHHkG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 03:40:06 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36036 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgFHHkF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 03:40:05 -0400
Received: by mail-ot1-f67.google.com with SMTP id 97so1498213otg.3;
        Mon, 08 Jun 2020 00:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aDfs1F4OdafycBApWUDwkkf2j85MeirTmfPU3v1iT58=;
        b=gNG5Mbw3UmCuTySLt83VBAhd8r9VPz7xnAJW1303GSE3htiAzdBaQPTYmpx+DTK9kQ
         z9cSiAra/4GVlGqiMtYRz3GUhTOokgAFERBePf0vJEiwOK1cUHBJ0r1c231+NJFuW2DK
         bm6osqyuchCy4YH2QTzYxRfw1BAeY3B3Oo210ETMcyC7KZ2ENRL42mdqB7updHJdCKfy
         qx9RtkyoI37ioda4jVe4D6uBRa4A5GRO1txDHe2jNlYq9rA3KH1B0oAeFz15IT/A3yyR
         fzkzG4tQCPCb1oHaA8xd4Tt6Efr8Sp/jN+7H8PlXVpnuHOWDPcwNx8MgpEbQmHuP1vRm
         t4fw==
X-Gm-Message-State: AOAM5317dVcrijgHPoSZJlP4a6yeq9c0Hezh313PqieNy45ZOwRSH6zz
        1xgLmq6YMVhSA/TbCnCqVHvp6/F6Nwl7disC0hM=
X-Google-Smtp-Source: ABdhPJw6LZWyQO6k6m3npgne3D8qld9e6+4z6U9SP4XxGKdCCB8U4lEcsrneeJ2rC4AB/koN4Y/A8y8u1I0/WujGk1A=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr15599146otr.107.1591602002975;
 Mon, 08 Jun 2020 00:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200523115426.19285-1-dinghao.liu@zju.edu.cn>
 <20200608015456.GJ22208@pendragon.ideasonboard.com> <20200608015753.GK22208@pendragon.ideasonboard.com>
 <7b79863f.f636d.17291e1ff94.Coremail.dinghao.liu@zju.edu.cn>
In-Reply-To: <7b79863f.f636d.17291e1ff94.Coremail.dinghao.liu@zju.edu.cn>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jun 2020 09:39:51 +0200
Message-ID: <CAMuHMdUDcpCxmgdJtMRX7K9NvDxj+tDu33ebax0TOMBNZaygDw@mail.gmail.com>
Subject: Re: Re: [PATCH] media: vsp1: Fix runtime PM imbalance in vsp1_probe
To:     dinghao.liu@zju.edu.cn
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kangjie Lu <kjlu@umn.edu>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dinghao,

On Mon, Jun 8, 2020 at 5:03 AM <dinghao.liu@zju.edu.cn> wrote:
> > > I wonder how many bugs we have today, and how many bugs will keep
> > > appearing in the future, due to this historical design mistake :-(
>
> Good question. It's hard to say if this is a design mistake (some use
> of this API does not check its return value and expects it always to
> increment the usage counter). But it does make developers misuse it easier.

On Renesas SoCs, I believe these can only fail if there's something
seriously wrong, which means the system could never have gotten this far
in the boot sequence anyway.  That's why I tend not to check the result
of pm_runtime_get_sync() at all (on drivers for Renesas SoCs).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
