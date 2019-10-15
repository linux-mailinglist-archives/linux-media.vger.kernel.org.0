Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB03D7A94
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 17:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387562AbfJOPxz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 11:53:55 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39482 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbfJOPxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 11:53:55 -0400
Received: by mail-lf1-f67.google.com with SMTP id 195so1941983lfj.6
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4D9oZzF7ii6+y1gG0yIQy8LuEiyj06RTHsMl8tP80UY=;
        b=LVdGUFPkcfIpYuZYQQp7HphB2oRMShE1xbPmcS0KBaS8B6FZKRuFKB+ZAP4BGxhjAl
         e9qfqpU4FEIU3FfSgfnK1P0EG5srVV9XthTK/+bFGHkfLVc3nnY/+1iVrsBqBWuAhr8o
         KczIBMjVhCo8rNaj+5RmYLy6FGSZ+E9ZIrg/ln43jVzxvZld++Nj9OQkc5APbc88s5uL
         WTvZhlCXOMzigyBtwVB1aOusq9MU/0wuhKuXMLRHEU8Ye3my7r/vHZ55eM8S+APZ2PAH
         QnvkzSFm4SlaOAw0wF+47Ge7NDUKjdqab56CwBzY3Olfu7AMRUdbl2o2r0wJb1Famypu
         UTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4D9oZzF7ii6+y1gG0yIQy8LuEiyj06RTHsMl8tP80UY=;
        b=hmT/42/lfaSnLfO3XZOMrv+Rvq831pviF43pcuMDFDglGYPyE/0DsCV6YaCdVOEaq3
         OHPnb7Af5v2Muki0kzuI9gtSpbMuP6eD+cRDWlrOYklXLbqwqTa6NYnW2nvUequEZeZ3
         2vUrQucky5DRgGqnLPwkxWgiP+WJZ8UEDaiirupOdQjoA2J50aIbia15/6QkqCKY1+sB
         ev+j5jEdAJ31XRqYor3vFvxPfqkeiZeH2bcdBtLNrpC7K7zYRVm5o5iKCqnMOsF0SE2k
         0DQhpcBIKMQ0HBlX4gxwH0Ld4m2mnegCQCE76hu6kkmqo3tL3mNnwywhkKzqrObiKed7
         gNOg==
X-Gm-Message-State: APjAAAXf7YFQ+xPEdIAcDLleopWaOCx63Dfo2XPaOcIpOLIyw9qEYoZE
        2aYmmAngjQ83zXweGfn9jKwR0Ux0aPYvCQ+nh0ODiGyu
X-Google-Smtp-Source: APXvYqzmyRMZziUgihKAk9tB8dyBQgtpbf/NlpiF5eTDV88YBs+ciqFyN67qFBqkul2ppXmeEL9Oirls0mIDoMwT9r4=
X-Received: by 2002:ac2:4888:: with SMTP id x8mr21183793lfc.90.1571154832897;
 Tue, 15 Oct 2019 08:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191010154417.9437-1-festevam@gmail.com> <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
 <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com> <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
 <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com>
In-Reply-To: <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 15 Oct 2019 12:53:49 -0300
Message-ID: <CAOMZO5ABOV+Z7FenZykU82w-yUvae6zm6d6inN8SYrhViudYnA@mail.gmail.com>
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180 instructions
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On Tue, Oct 15, 2019 at 12:49 PM Tim Harvey <tharvey@gateworks.com> wrote:

> Fabio,
>
> I assume your seeing the same rolling video issue on capture unless
> you discard the first few 'corrupt' frames? I'm still wondering how we
> can address this properly upstream.

On i.MX53 I still get the rolling video even if I discard the few
corrupt frames.

I tested the same i.MX53 hardware with a vendor 2.6.35 kernel and it
captures correctly, no scrolling at all.
