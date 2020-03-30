Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C55D0198128
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 18:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730209AbgC3QYm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 12:24:42 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:39983 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727905AbgC3QYm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 12:24:42 -0400
Received: by mail-oi1-f171.google.com with SMTP id y71so16169056oia.7;
        Mon, 30 Mar 2020 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JjfCOLMKdycWFBOZ9b3A3LlpJoO/05vIv2yLye2wGmw=;
        b=i7zcy/VfhxUrYKVVstzkkYihJHfjfDKUxxY8n2EJZLn2j94/dFSbCVyeGF/Lu30n3n
         58/iDF+91gDA1zkUm7Buuc3wbCy7H2Bi93h3liasII9FLmoXIKnLiszp5Gkukm2XpPPS
         z4AwtqIhGvEs8JaE6wnOl9jVCLOSvwAIThTlr+BEgyyWnG0gOSafGn6Hz59qndgQUFd6
         fbYXihmxNPJSmceO/vV0kxxk6vvZ4UexSxU22Ki3xBipP861WuL7mUPnfTjSJL4hqI2C
         3xF1DCb6x/Nxgi+3MqZYDRzG2PH5f2iEg16/SjjEKg06Xhpc3tE0mPP0Bt4qVjIJYbLf
         h6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JjfCOLMKdycWFBOZ9b3A3LlpJoO/05vIv2yLye2wGmw=;
        b=EFzcKFgtySAQzHM7F5y/4jNMNNBWgt6MPucjDeWTi1IrufZALID5h9zcyWn4kawHGh
         ih9vPrhHsFJaxFb0mtNfPEiFD6llbCY9n0IyTmsdAjfu3PXFefnaah2A0ekH/EmIzZaW
         DMionWgm+5sEGkqtKcbwqH/qob2Ob4qJmNYh7olbDJaDG3qRKUOHHPNDfqzihNWtE9Z7
         GpcYVcUbaK/4NzPSThPAawJbIM9oqCr+ZliYEFtqDf8Ig2DcpUKkbmxvXIM0ss3DeE0W
         Lv/ZgRjialkqGuGhOhhQTA9y340wNl895IWbNQ1LXdgZ/tE5gps8Sld+5qvn7DUl5Odi
         MZPw==
X-Gm-Message-State: ANhLgQ2tTm0PatqRLAH4RH0R11ciOC669jWu+eI8WAPs1EvH2IWGI0ne
        HP9Rbd+JNisDJnsEm0e8ibWzr92ZNuYs69UTLKs=
X-Google-Smtp-Source: ADFU+vszdO6Pl1GEL8mafiEkybs8ZJNTpNU4vWRJgCcsMtmIjwF+VEmFG0zf0C9Sw8R0YBqLMdP4kN8FOIKM+uyZeM8=
X-Received: by 2002:aca:ac89:: with SMTP id v131mr88437oie.7.1585585481754;
 Mon, 30 Mar 2020 09:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <DB7PR08MB3801F9765B4D16612BA0974B9CCB0@DB7PR08MB3801.eurprd08.prod.outlook.com>
In-Reply-To: <DB7PR08MB3801F9765B4D16612BA0974B9CCB0@DB7PR08MB3801.eurprd08.prod.outlook.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 30 Mar 2020 17:24:14 +0100
Message-ID: <CA+V-a8vYbUi3pypZ_TyjJ8VgFGQiXFMYP_iq-ZOvRv_B0xzLfg@mail.gmail.com>
Subject: Re: drivers/media/platform/davinci/vpfe_capture.c:883:20: warning:
 Redundant assignment
To:     David Binderman <dcb314@hotmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Mon, Mar 30, 2020 at 4:53 PM David Binderman <dcb314@hotmail.com> wrote:
>
> Hello there,
>
> linux-5.6/drivers/media/platform/davinci/vpfe_capture.c:883:20: warning: Redundant assignment of 'fmt->pixelformat' to itself. [selfAssignment]
>
> Source code is
>
>        fmt->pixelformat = fmt->pixelformat;
>
>
> Suggest code rework.
>
Fix for this is already in upstream with commit-id
5dbef6b3e09ffabf3b74d8d0fb230179d8fdc840
("media: davinci: fix incorrect pix_fmt assignment")

Cheers,
--Prabhakar

> Regards
>
> David Binderman
