Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76C2542866
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 16:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436976AbfFLOIr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 10:08:47 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]:44345 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436722AbfFLOIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 10:08:47 -0400
Received: by mail-qt1-f182.google.com with SMTP id x47so18602036qtk.11
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=VKcSESLp49fdHSooN0hgUtmzIOklgJMPpTWXa+CtaFk=;
        b=Q0G9ew1G+zIsWD6R/t+QguND86OMJwoVQmBarSwYwijaUZty5RlXkhhlVr56sV7Pvx
         FmNoiQD7Avvtfsb1ipW8PO1RyVAPx8GPu6sdRnQgceXZAhsKdw30IvhB47yUuiG2L5N4
         rbUszZLogpZcAuOfwJ8WNrQKpquB2ehmvrUU5xj4PtELLwKy7VO64s7ZtGLQefSB9UY3
         NGAgO+E+W63v+ZViqJXJFJscWxQuFxUvSgIiIrQ5KFPRtqefxMfCguoZLBHTklhH7H2n
         7J7V+UtipBdVr9jBSA/0NCSQ1lVQrkRM3+5sref8qLuDlt9x0iM7jY8IqEoVzKs6vC0f
         bRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=VKcSESLp49fdHSooN0hgUtmzIOklgJMPpTWXa+CtaFk=;
        b=CvRDHqbrIqfNAWmoTsd00gg+kdHTkaxZAdJixchxn6sfluWF4Kv7B2ziDjnUN2gpkA
         fvZcVFJI01/k2e+2LskPL6LtXAeQjY0l1sPnkKgAVnmUJ1V77+jf9NNPFgp3fNDbYfkS
         ldGcr3fMIIsRdw/4Zeq5UV8bMmyrPBX5hdGD1Hn+pwAfxpByJ8+VajnAuEvYBYz1USGV
         5b4jZaErWwmUClEL/ukGcGFSo9xmA6dAAysGWgb7SL0rMlZPI/Hto9Js4p6ekBiGKaSz
         4N72rPNeW/plzfTQ5790rbzc8KEY6PKX6fXI1qlA6qsXdUjoJJHE6okFr9fxsO9v0JZz
         DVcw==
X-Gm-Message-State: APjAAAUrMXIgL62D/d1AGr1+lnNFGI6838vPyoN6my9mVxjE5L1VWRgn
        eoKn4ktgEdrGM+OZL7JOOJ9+GHNQtoRE1LXJOudj+/+B
X-Google-Smtp-Source: APXvYqyGO1keM7ZRlaE2Pc0zSXWLkKE54s4xM7gUTEdT3FeFNGVIWxx72Fp929tNASdvjaFzxWeUfSM2EV/CP9CwMiY=
X-Received: by 2002:ac8:2f35:: with SMTP id j50mr55444945qta.363.1560348525850;
 Wed, 12 Jun 2019 07:08:45 -0700 (PDT)
MIME-Version: 1.0
From:   Takashi Kanamaru <neuralassembly@gmail.com>
Date:   Wed, 12 Jun 2019 23:08:34 +0900
Message-ID: <CAKL8oB_qPGVXd3MCj=f1Lzh02ifGzYTS2YAD77s2MY2LAnc+1A@mail.gmail.com>
Subject: The restricted number (LIRCBUF_SIZE) of pulse-spaces in IR sequences
 is too small
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear all,

When using kernel 4.19.X and sending IR commands with LIRC,
the number of  pulse-spaces of IR sequence is restricted to be smaller than 256.

In kernel 4.19, this restriction is caused by the following line in
media/rc/lirc_dev.c,
which did not exist kernel 4.14.
https://github.com/torvalds/linux/blob/v4.19/drivers/media/rc/lirc_dev.c

#define LIRCBUF_SIZE 256

An IR sequences of a remote controller of my air conditioner has 439
pulse-spaces
with about 250ms duration, so, it cannot be sent with kernel 4.19.

The max duration of IR sequence is detemined as 500ms by IR_MAX_DURATION.
Therefore,  I think signals with about 1000 pulse-spaces should be allowed.

So, could you please set LIRCBUF_SIZE to the value 1024?

I built a kernel 4.19.46 with LIRCBUF_SIZE=1024,
and I confirmed that IR sequences  with 439 pulse-spaces
could be sent correctly.

Sincerely,

Takashi Kanamaru
