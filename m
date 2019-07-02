Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0BD5CCB0
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 11:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbfGBJd4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 05:33:56 -0400
Received: from mail-ed1-f51.google.com ([209.85.208.51]:44212 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfGBJd4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 05:33:56 -0400
Received: by mail-ed1-f51.google.com with SMTP id k8so26567045edr.11
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2019 02:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to;
        bh=R4iW/1wTW8dd+GxPaWC/3CdfCF8vBJEjhQQv9dha0aU=;
        b=U7x7ut2Te2QB8jLTUUZTbUq5eoisk1JArtu1uzsr0z9Cou3cuiWQyOOSMXUbaKfvat
         uHLBuH+4SHZkKHW+XrKkoAXoBPu7RYnSn78Kdf6y9/8SnCSVGUAH1tc7tTF4v7GHl+q0
         Ca8/u6FsiJm6drcG2YhhrgPHzYOtM4ARe8Gu52D6K/593U0n0bW9+PoJbMzAP04xcct8
         7AKX3hhrensJ7z9OUv3/eAMOkkzKF3PjjPkoRXMVXMgSGaYFp2IJOaA2tiuTT0+OsQKJ
         Wlx/8g7bJNoBkdky04SPkXmliN53M67pzb0S0J2RhJpCxR0tRgfpD81oGpwvgP3U6aiG
         aosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to;
        bh=R4iW/1wTW8dd+GxPaWC/3CdfCF8vBJEjhQQv9dha0aU=;
        b=Q6xOUj0XwPOxzcqrXKuQX1K2uVLY3qcITErgqmGJhYfFfLMMyhPYsHJO0lxv02DUDQ
         wDNef3vI4dHGayot2DKTzK7hglYSnuelKGlfQDq5tAj+T+My1XAsAiuXcbmOC3TjZ4/z
         jp/UPoBkMUj5kkDdNw3ZesfDTkZkPSgIuyc28zBc/qc9lfkzGKC3vkm0TNfYtipbCwXF
         DjWHWykg8SDhROwcCW7xh1CejWUXluQ4IxlugeHy9emlaHviV17Vff5cVHSrAF68UQbS
         qRna72xznbttz6e3npcswl61lwnJkDduG8aeX5NzVqr4TCDJpy8EZiVfThgaTZdJU5Al
         sk9w==
X-Gm-Message-State: APjAAAWPgMogdDSZjhTI62waAOHhwp+Bnrhlnm4HijjHSWCXs81Uowyo
        dORqm92K7xeZd9bjjn/7+tznROeIuhpyHEBb5h8I6g==
X-Google-Smtp-Source: APXvYqxXh7CFVbrj1jr2kJWMONGxa7FU0jIKobLfxHJqkiXTOPiOns/oOwmqWVK+JHH7E9v9uZybb20+E/dRhv5LjoU=
X-Received: by 2002:a50:ba28:: with SMTP id g37mr34507669edc.109.1562060034108;
 Tue, 02 Jul 2019 02:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <CABOqhrLv_2f2LNTi5x6YHKYS9a_e-FFsh5ABz7Wte8FGj0iC3w@mail.gmail.com>
In-Reply-To: <CABOqhrLv_2f2LNTi5x6YHKYS9a_e-FFsh5ABz7Wte8FGj0iC3w@mail.gmail.com>
Reply-To: stestacct@gmail.com
From:   stest <stestacct@gmail.com>
Date:   Tue, 2 Jul 2019 05:33:42 -0400
Message-ID: <CABOqhr+UcV4rfDkKc2p-HqWN5Rs4j6KYhOGTQ8r9o2=6o8C_Sg@mail.gmail.com>
Subject: Fwd: Twinhan 7240 support
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have a Twinhan 7240 USB tuner dongle that is unsupported for
linuxtv, and I'd like to offer my efforts if anyone wants to help make
it supported. I don't have a ton of experience with this work, but I
can follow instructions and send back results. Please be in touch if
you're interested, or if I missed somewhere that it's actually
supported already. Thanks!

~$ lsusb -s 1:3
Bus 001 Device 003: ID 13d3:3215 IMC Networks DTV-DVB UDAT7240 -
ATSC/NTSC/PAL Driver(PCM4)
