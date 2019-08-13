Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 412788C398
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 23:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfHMVYL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 17:24:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:55616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726631AbfHMVYK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 17:24:10 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BA962084D;
        Tue, 13 Aug 2019 21:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565731449;
        bh=R5Yh9wFJPtJIKxbptxdaKPDiX/ZNZf1g/oJL8un702U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MiH5H3LCM2A75FvZHCjHYqJ7oaK3Hwwla30yyL6yij7D9l51oJfnojqROrQffWVas
         h2XULaadDYcbeM7LNjIAzIuOJkw/52DQHUs/vLmfMQ1r0rjsLlBVjNCrd/b6X2RLvI
         dU4bAw9iuhkZRIK6H1L/4zgMNHRgSa8+PksNZHqQ=
Received: by mail-qt1-f174.google.com with SMTP id z4so107998643qtc.3;
        Tue, 13 Aug 2019 14:24:09 -0700 (PDT)
X-Gm-Message-State: APjAAAXjtaFYklp82/mb75HY8MwQNQ3KEeu3veClFHNdnD6Bo7xd59E3
        aK3ZB+RwfIT9P0M/TxxSUl5WlW/N9HiNqmmUnw==
X-Google-Smtp-Source: APXvYqyDoMF5kcqlkAQ276qRzcr1OCkIYQIe1bsUEqWU0awHa7ShjdR60+MD54WSwZGK3ztXNw5WmKIXTDoa+P8D+Ws=
X-Received: by 2002:ac8:386f:: with SMTP id r44mr18216092qtb.300.1565731448864;
 Tue, 13 Aug 2019 14:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190813124513.31413-1-mripard@kernel.org>
In-Reply-To: <20190813124513.31413-1-mripard@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 13 Aug 2019 15:23:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLUfQdtXZMNTLJX9uMpdCY0NNN=AEDqGiemrdDazB8HeA@mail.gmail.com>
Message-ID: <CAL_JsqLUfQdtXZMNTLJX9uMpdCY0NNN=AEDqGiemrdDazB8HeA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: Add YAML schemas for the generic
 RC bindings
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 13, 2019 at 6:45 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The RC controllers have a bunch of generic properties that are needed in a
> device tree. Add a YAML schemas for those.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../devicetree/bindings/media/rc.txt          | 118 +--------------
>  .../devicetree/bindings/media/rc.yaml         | 135 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 117 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/rc.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
