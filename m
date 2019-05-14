Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D263A1CF52
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 20:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfENSrI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 14:47:08 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45003 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbfENSrH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 14:47:07 -0400
Received: by mail-oi1-f196.google.com with SMTP id z65so5707489oia.11;
        Tue, 14 May 2019 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b3wKV2yvyhNXBHezd2g3VNLzJd77vsTJn5OuHUZElkE=;
        b=FSuDnTxaDbNRibS/cl1V/LWshcY/nC5P8Wwb7sEKTQIA9N2sXN/aZ6qS/B9N6ZZYli
         iSBFSvSmeeYzin0eC/VMw0QMTnlgL6WK1P6ZSSX7g7RIkiQlQ+zVRYyuU+L6c1KQtOUm
         H1eZ1Jhgv6syoz7DG5/dU3a6wKSu4JpdNY90IRtdlh8byKBHrEgvzB8s0C2DAGu7u3g7
         ecabg5KjKS48Qa6iSf+sF7zgW7KHddpTQClz7GvcquLTMtxqN2S6BOGnxIxUWSmrdZru
         E/VAnuEYZ3NTqFnB3QqeLNELRDkAwZjEk4qOK/laDM+wxE5Day3oWcT4Y4fqgcKRX2gl
         3A4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b3wKV2yvyhNXBHezd2g3VNLzJd77vsTJn5OuHUZElkE=;
        b=IgNXG6EFCdj+WS+rk+3ba/Rqu39o6lpzKBRJC7XNw6zBDWBycPyS/7hWSUaVGqLu7v
         NQelS5y8nRnHsvyzfA5mDTwjgs5BDiUsKrZiqlywNguI8HLAENSX5DrQDKZn6YG6NZfO
         kMnrqYJvdO6kPD71/XpFdShIUTZJy/IJD41Ac+Fh/klxk1fmjTFvy6IZh646yQd9ObVE
         pm5J9YFGBCXKJ/lcH5vQ/7Jss5fm9ZE/gpxWofKt5ZCCmd+ryuwtf+O7lmg3ZtN5N19a
         ETcLMSuoADqnCICvV5EH81kJxLKEFKqh2CsVj4B7Kif+H/Fb9b0SunNt9K9AdbVJc+GL
         Y3lQ==
X-Gm-Message-State: APjAAAXKs4YDAYKF/hOUcBfAq/0piUTMsycyDhDecA1qCQrhnRz8Sorv
        ifJzBG/n4wErb+D8U6+/kAHRvsfVfeZfWxQO5Hs=
X-Google-Smtp-Source: APXvYqyAsqSOHm/4PjG8rmz2z+47hObMZtkODxPLmkZxrCSNCrhSrYuN8g3dNQ1msbyt5tew1NttZ3FWwieMhIJnR2U=
X-Received: by 2002:aca:ab04:: with SMTP id u4mr3815658oie.15.1557859627031;
 Tue, 14 May 2019 11:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190514135612.30822-1-mjourdan@baylibre.com> <20190514135612.30822-2-mjourdan@baylibre.com>
In-Reply-To: <20190514135612.30822-2-mjourdan@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 14 May 2019 20:46:56 +0200
Message-ID: <CAFBinCBm=zJb9Ap3XL03X4LUAPcPQ2u=gJsBhBdHSUXYD5BMpw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: media: add Amlogic Video Decoder Bindings
To:     Maxime Jourdan <mjourdan@baylibre.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Tue, May 14, 2019 at 3:56 PM Maxime Jourdan <mjourdan@baylibre.com> wrote:
>
> Add documentation for the meson vdec dts node.
thank you for working on this!

> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +Required properties:
> +- compatible: value should be different for each SoC family as :
> +       - GXBB (S905) : "amlogic,gxbb-vdec"
> +       - GXL (S905X, S905D) : "amlogic,gxl-vdec"
> +       - GXM (S912) : "amlogic,gxm-vdec"
> +- reg: base address and size of he following memory-mapped regions :
> +       - dos
> +       - esparser
> +- reg-names: should contain the names of the previous memory regions
> +- interrupts: should contain the following IRQs:
> +       - vdec
> +       - esparser
> +- interrupt-names: should contain the names of the previous interrupts
Maxime already mentioned in the RFC version that there may be more
interrupts in the future. I'm fine with adding the missing ones on
demand

> +- amlogic,ao-sysctrl: should point to the AOBUS sysctrl node
my goal is to remove this property at some point and replace it with
references to the power-domains.
however, we don't have a power-domain driver for this yet (it's
somewhere on my TODO-list - it involves splitting the current
meson-gx-pwrc-vpu into two separate drivers, so we need to do it
carefully so we don't break HDMI support)


Regards
Martin
