Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C857F367020
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 18:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244205AbhDUQ3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 12:29:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:56074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242194AbhDUQ3A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 12:29:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CEF36144C;
        Wed, 21 Apr 2021 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619022507;
        bh=1FhKmwxkUvOhW5ofHS2ZHVQEQBfTWme4x3p4vrbhYak=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lPkmyP7LhUAjALOWfiO0ZSgWBxG5K6q607QGimrD2RVO/qjRrtr8/22GlIfOGPll9
         igxejtBNbjAWxbisIWxDi2gSc8deZ6mmSEjPoyx8dMlZg+e3r7jUPxGxxOZ6mtPnn6
         0+KjkwgczVC8oVQb56C+xr0pGaV+MnhsDxbDRNXdul0JiOkHk89bNKhMmsu/IS4/HA
         V76Rx3DZpzgq3T7sJiCWp51TOEW5ZcBzZ6Bu9COMjkAYmjxnKPmOOcjrPvsCiPP57O
         G8XY5VPwnu8VzIRTUronON2S/W7HL3ss2FdNv2G5tdDiifpD5tv4X86+ps/KxOLfYK
         u5WAkJS7lvWAg==
Received: by mail-ej1-f50.google.com with SMTP id r12so64429281ejr.5;
        Wed, 21 Apr 2021 09:28:27 -0700 (PDT)
X-Gm-Message-State: AOAM532cJV6mtlf6QXeQg6tUuekKH3ZeFTIIIQSYYHC5fQasglK7hgZq
        p7CReI5bzm7Wwr3NXSXnvG+rPVwBI/zjQTSk7g==
X-Google-Smtp-Source: ABdhPJyskwjpa5j1jXVTSKDzdbejTJHQm/e15lG5RSA2ryx7jF3kp3bGHtg6KqkiN328dBWy/CKohhI+S58mT8kD0PY=
X-Received: by 2002:a17:906:7806:: with SMTP id u6mr31633768ejm.130.1619022505597;
 Wed, 21 Apr 2021 09:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210421135935.3653827-1-arnd@kernel.org>
In-Reply-To: <20210421135935.3653827-1-arnd@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 21 Apr 2021 11:28:13 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+3M5jpQ7K=HjcvvYhiZD_A41_RODGfr66QcctFy8Dscw@mail.gmail.com>
Message-ID: <CAL_Jsq+3M5jpQ7K=HjcvvYhiZD_A41_RODGfr66QcctFy8Dscw@mail.gmail.com>
Subject: Re: [PATCH 1/2] [v2] media: rc: remove tango ir driver and keymap
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, Arnd Bergmann <arnd@arndb.de>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 21, 2021 at 8:59 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The tango platform was removed, so the driver is no longer needed.
>
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Acked-by: Mans Rullgard <mans@mansr.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Sorry for the late resend
> ---
>  .../devicetree/bindings/media/rc.yaml         |   1 -
>  .../devicetree/bindings/media/tango-ir.txt    |  21 --

Acked-by: Rob Herring <robh@kernel.org>

BTW, looks like we still have mtd/tango-nand.txt and
pci/tango-pcie.txt. Want to send me a patch removing those?


>  drivers/media/rc/Kconfig                      |  10 -
>  drivers/media/rc/Makefile                     |   1 -
>  drivers/media/rc/keymaps/Makefile             |   1 -
>  drivers/media/rc/keymaps/rc-tango.c           |  89 ------
>  drivers/media/rc/tango-ir.c                   | 267 ------------------
>  include/media/rc-map.h                        |   1 -
>  8 files changed, 391 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/tango-ir.txt
>  delete mode 100644 drivers/media/rc/keymaps/rc-tango.c
>  delete mode 100644 drivers/media/rc/tango-ir.c
