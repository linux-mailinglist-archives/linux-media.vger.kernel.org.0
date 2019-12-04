Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44BB4112C79
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 14:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbfLDNVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 08:21:22 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44118 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbfLDNVW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 08:21:22 -0500
Received: by mail-lj1-f196.google.com with SMTP id c19so8017773lji.11;
        Wed, 04 Dec 2019 05:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y33AlJcYvO1OmVMuMYOOm75WFOxK3BGRBIJ5MgkStJU=;
        b=L3+CGCujvAvJ3rIxKujwSWlcL0ZeX+ftnnWN/2v4qqnCgP3De2nUxaIw2P42tByoGj
         AdQSL8EP+U03ogcxjZbZyXtYDjPMue36mb9lGqd2pIIhiXUWDVsOzqgNSSDhAjvzaQ4A
         ceon6/mIUT+GG1/JWXsYTID9U0h0Y8aUOYQ0JLgXl6cW8fRKoHKhGHGutfig5d5ER8zE
         fh4clHbDqVgQ9VJu7qBeO1B14jaZknJ11C0gu1Ivei9s6+ZvoxYrVZmBrD2STdfcHDAK
         j5UjJA21bRyDMZGGcLEbXno5w4m7fNRt5+72Sa3FVjDOHHYdl3uAMrqDfDwPBEJTOinZ
         im2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y33AlJcYvO1OmVMuMYOOm75WFOxK3BGRBIJ5MgkStJU=;
        b=aXPXEgEaQ/y8YNQSqBqwR+uEUuYlrZ9lYR/RsyPpNeWxmpmN2RymhFTgz4hBryI1PW
         bpLGn4hh7rY4Do35JgriN8LlVE2p4GX8+Yz2ioIw4LDu6zNnUnpmwoxVlx7nUWEQkV9O
         AEM96+sdy3DNKwlzudnZZYUHBO0D8e/gvxfaLUM0TSykY7mo4YosgY95HPbZHdehSI2X
         oMgdZ75t6qsvuyjGzUzCewQKrYkkI8SSYg0YCOWu++XTVCuhTjir0Aq3yUWovUzB2gGn
         ImSsSkGogWkf1R3H7I5rHKLEXjb+fZvxteHwpRTtcrVNXwEXDSWFHzOHAjgycS/kC1Pl
         M1yw==
X-Gm-Message-State: APjAAAWPF22nMz1ZcdjYewwTtyJ89rxkKLokBfG/HPTHkm/8rUATVYyK
        dwDasoANocl+DVBQRht1A74YBSlrHV+2d02XDkWWFg==
X-Google-Smtp-Source: APXvYqwNA8Vu62EU+m5WgUKPateXfyTPiRq1VdPKGeU0ICcgTODLvKHdV6qlqEf1qISGTAM/xbjRpiD9HjRCi7Ng+cs=
X-Received: by 2002:a2e:b532:: with SMTP id z18mr2024773ljm.239.1575465680089;
 Wed, 04 Dec 2019 05:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20191204130907.19799-1-aford173@gmail.com>
In-Reply-To: <20191204130907.19799-1-aford173@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 4 Dec 2019 10:21:35 -0300
Message-ID: <CAOMZO5A0XGRYmOj2Gg=b5XhVX1FYJPpu1Cs788pJLVV4TA6QiA@mail.gmail.com>
Subject: Re: [PATCH V2] media: ov5640: Fix check for PLL1 exceeding max
 allowed rate
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Wed, Dec 4, 2019 at 10:11 AM Adam Ford <aford173@gmail.com> wrote:
>
> The PLL calculation routine checks the wrong variable name 'rate'
> when it should be called '_rate' when checking to see whether or
> not the PLL1 output frequency exceeds 1GHz.
>
> This patch changes it to the correct variable '_rate'
>
> Acked-by: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Maybe add a Fixes tag too?
