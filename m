Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32C12DFE4C
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 09:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387740AbfJVH3a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 03:29:30 -0400
Received: from mail-qt1-f177.google.com ([209.85.160.177]:42452 "EHLO
        mail-qt1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387723AbfJVH3a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 03:29:30 -0400
Received: by mail-qt1-f177.google.com with SMTP id w14so25303156qto.9
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2019 00:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=PTLxvi63CZDnAk81X8iobU3vOJsRSiwibKLMi068GiE=;
        b=o5UnhWQcvf2zP/7Oti+G0XAqHAPogzvPf47O4QUrYGiAxclyHr6qcLTkAMARmj1SXz
         1IS+wQI5TN05rGwvtSU5wwudw/wvpTADcVcm6zYwiO1x9+dcHykx+N+ANzgxNG8uCvdA
         NK8G5wb1CQ7vBSjLjgE/CmvhbFMdbv83vKigeO7vUw0lYIapn74Ovd6bRyqB8lKiMeAQ
         kGQwzH7YuhEtkde5fWJFkvZjG1NICLmW+6XoUQjpK+H2t++aXE7dJCFSO6DJEAaXZNsK
         E+B1mZlQHTYxGFGuwhBB0/s2v4/LR+AGLCEZYwyX3TZcRKUE9T072UFPq7rynMtnPMUf
         xRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=PTLxvi63CZDnAk81X8iobU3vOJsRSiwibKLMi068GiE=;
        b=X8RkHVXGup+A9JaNyS899it2TL5IgD2sLeCeAQONMYfu1UGtw/vfFLYuNzc2yRusO1
         GiKue946rAzsLarTL0ZeTL2fHh5RPT2biAr7KB+dDzCjfSQXrb5yEB09NwyvQl6aKhAB
         I4zbP1l9zKMCczUB/0HpD9hwXhtTmUiGSim/0S0/wKZ5F76WLwBb+x1eyLE6HNi4cnhZ
         uXq7y+Dz/Cg4oJaKHPXpkzygGgZAgDO2F9VVHeCvNaq91LRVVwOS23OYVsTm5hfy+v5C
         Axkf4euyscU0LjME9QAzQ3tgBI0LGK3M2KwvSUIf8upTLgHLNzG0SB4SSidAu9scTESR
         bpxg==
X-Gm-Message-State: APjAAAXNut6iUVpwbOk0nTwKuRNogmau8TBKeLrLRpuU2I6NRmKBr3Ej
        fT+vD6gPoOo9m/cQiyuVL8SmvVgLE6bZ+VQpO1p89wYkDvw=
X-Google-Smtp-Source: APXvYqztmY7U5AHMp+fhrMkHocEL3YplwUW2ZGId0SmBImY4kjAQDtYAbH53ZbD55HDvHbkQcnZ0GV4C/eJWD3Fylco=
X-Received: by 2002:ac8:3408:: with SMTP id u8mr1913901qtb.380.1571729368060;
 Tue, 22 Oct 2019 00:29:28 -0700 (PDT)
MIME-Version: 1.0
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 22 Oct 2019 09:29:16 +0200
Message-ID: <CACT4Y+ZMxcvnZnDa=uYyaLQaW5r22vBpXkDuMU=CM2BVzjF_Tg@mail.gmail.com>
Subject: adv748x: missing parens
To:     kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Building kernel with clang gives me:

drivers/media/i2c/adv748x/adv748x-afe.c:452:12: warning: operator '?:'
has lower precedence than '|'; '|' will be evaluated first
[-Wbitwise-conditional-parentheses]

ret = sdp_clrset(state, ADV748X_SDP_FRP, ADV748X_SDP_FRP_MASK, enable
? ctrl->val - 1 : 0);
#define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) & ~m) | v)

This is on linux-next commit a722f75b2923b4fd44c17e7255e822ac48fe85f0
Date:   Tue Oct 22 16:17:17 2019 +1100
    Add linux-next specific files for 20191022

It seems sdp_clrset needs some more parens.
