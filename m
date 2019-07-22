Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 479926F9C2
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 08:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfGVG4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 02:56:13 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46921 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfGVG4N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 02:56:13 -0400
Received: by mail-wr1-f66.google.com with SMTP id z1so38083028wru.13
        for <linux-media@vger.kernel.org>; Sun, 21 Jul 2019 23:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1scnAc3sjeh3WnhlFA65T1sb9Wb1g8NqJ7QEYKWinXI=;
        b=dcq8pFqd4whWmN0hnHjTTI8gBlxfAFygZQYCUnkKG6l5Dnep7c1/qbOjMP1b8376Rg
         xHUZOwwOLr3SuWX+LHjx1Gunrx3InG2MC335OZ9KQON3Q/+xtzeZI5b2V7BkvV19N4s6
         D9w1mNn8rrFiGVPbDFWx2F8bROD6olINKM7DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1scnAc3sjeh3WnhlFA65T1sb9Wb1g8NqJ7QEYKWinXI=;
        b=CqnkzpUprlO/wq927NOX0GMg5XhDdwYQiwJEifbPWXvb6UZ6l2IzY+qxngA80T7zYG
         MPOpzP6FDDRGK8wN7HyyOAW9+B2pra8W1oKix0yyQiBTIQ1PazDLWJR6dTjaFFWMaJLv
         hRCRmKc1qsIuIbYVGYG6cvNi0Wd1sSlkMFvE7yfSFO8IEl+AigcMcGPV4Sc4ZpwpMwuX
         4FeRsILV8+w8Js3eBU87+DjFjFSbs1Mta8SMbNiUJenxhWtFjEyQ7ErLm6IvzPsw2wAf
         Is+AG2sG3ZE5nF3w993wQHpX9MocRuAyq9C4prxvYTlpzkHvOfAkAizeQntVxHImh8ef
         6ysw==
X-Gm-Message-State: APjAAAVkIE5+e3u03Ftq7rYf6J45lWQ1BmoH5a566/SZojM87/JMPFhp
        zctpNbD/w8dN49y+lS9vgelA+qLyzTFPlt5uHReG6uTZ
X-Google-Smtp-Source: APXvYqwCsFlLcZIboFmBzsjOKnB2+3vm3wBmHSjjERq1FdF1fyAUmXB8XhbTC41jULay24oeapefuqgs+ZsLgVKZXYk=
X-Received: by 2002:a5d:4284:: with SMTP id k4mr70423576wrq.194.1563778571585;
 Sun, 21 Jul 2019 23:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190708100641.2702-1-dongchun.zhu@mediatek.com>
In-Reply-To: <20190708100641.2702-1-dongchun.zhu@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 22 Jul 2019 15:56:00 +0900
Message-ID: <CAHD77HkDrGgiTceE2jLX8Tqc8GH9R1UyRhiU83=HRvZKjoDYjw@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: add support for DW9768 VCM driver
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>, devicetree@vger.kernel.org,
        Louis Kuo <louis.kuo@mediatek.com>, shengnan.wang@mediatek.com,
        dongchun.zhu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 8, 2019 at 7:12 PM <dongchun.zhu@mediatek.com> wrote:
>
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
>
> Hello,
>
> Add a v4l2 sub-device driver for Dongwoon's DW9768 lens voice coil.
> This is a voice coil module using the i2c bus to control the focus position.
>
> The DW9768 can control the position with 10 bits value and
> consists of two 8 bit registers show as below:
> register 0x04(DW9768_REG_POSITION):
>     +---+---+---+---+---+---+---+---+
>     |D07|D06|D05|D04|D03|D02|D01|D00|
>     +---+---+---+---+---+---+---+---+
> register 0x03:
>     +---+---+---+---+---+---+---+---+
>     |---|---|---|---|---|---|D09|D08|
>     +---+---+---+---+---+---+---+---+
>
> This driver support :
>  - set DW9768 to standby mode once suspend and turn it back to active if resume
>  - set the position via V4L2_CID_FOCUS_ABSOLUTE ctrl
>
> Dongchun Zhu (2):
>   media: i2c: dw9768: Add DT support and MAINTAINERS entry
>   media: i2c: dw9768: Add DW9768 VCM driver
>
>  .../bindings/media/i2c/dongwoon,dw9768.txt         |   9 +
>  MAINTAINERS                                        |   8 +
>  drivers/media/i2c/Kconfig                          |  10 +
>  drivers/media/i2c/Makefile                         |   1 +
>  drivers/media/i2c/dw9768.c                         | 458 +++++++++++++++++++++
>  5 files changed, 486 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
>  create mode 100644 drivers/media/i2c/dw9768.c
>
> --
> 2.9.2
>

Gentle ping. Some help with review would be appreciated!

Best regards,
Tomasz
