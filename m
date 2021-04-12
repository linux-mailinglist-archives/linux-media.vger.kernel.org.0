Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF2135D11B
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 21:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237410AbhDLTdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 15:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236717AbhDLTdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 15:33:45 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE96DC061574
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 12:33:26 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id z8so16730769ljm.12
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 12:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=iN3SWFtipBq1Cl9jSAiVnGpEJX9QbkyUIK7YAo68n9s=;
        b=fOlWWnqbXWuN2N/y1g7TYnopNNUj/BU6s4t/9sbT+QFArvVvg2kAZA8kctwvetgbnp
         x7igW1cgdGbFxBVUA0y+4j9GRachOpj316ECsO395x0mxXBKeBasAfbcO68kqs8ov0uO
         s9S3EkV61xlFcpjBslCnInjjZdpkwvZbTy/Wy4LM1DYYbpCAW4S4s0wFRUaokKZ/fWdI
         EkAF3MAL/YA2PbqK0wYah7zessYRHOvlm0KZgNcf6KwmyBTMGZ+rnjQaqlCcXsT2TnAR
         0nOg0Xz0gT55JJNhWSSU23sJjfaNFmScGAM9MGyooNLo7SeZLE3OUIA6tfpnsZfvkTv3
         aNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=iN3SWFtipBq1Cl9jSAiVnGpEJX9QbkyUIK7YAo68n9s=;
        b=lsqFX45oa92mUFneJUBWBNyutRD3T/zmQ/LKOOG/9C2dYbZFQ+Mg0W20sbaSdFxjBV
         NXTZBT8FxjWj5XbrFCi6d/AXBLSNOTrGDY1BL5AACAqgUP0qD9NpZvPUkDwbVvuKuC/L
         1HKT5hKLXaXevoYkYcbeUViUqvO0JvGaAxvCkgAaWP4SsNV8tXVQc5xYDeiW34dTwa43
         ColnSv4yKsOIDdhbYHWRoyFFH39wFVW3EiLrYsoJcB7CRkbtdir4MJgaGJbrT6KBKtQ7
         mthvLCc2Wb8zOYcslOf9YTRiZ9sVuv7t9ZquVN2a12gY/ZcYvFlr3QLzf+EQvXyQumQP
         3Eqw==
X-Gm-Message-State: AOAM5307Yd4M7X9vSdN3bH5TMCfYBiWcsF27A1aUL5YCIvfS48nhXznV
        WPszThLIDMi3Qezd3hRQCy1oYd3SZPts6uvPvUH/UDlFObA=
X-Google-Smtp-Source: ABdhPJyELgwDSwuS0egiYaSRsCJjb1yaY8GnhMb8LwL6GMSOV8gS3QpMGrRyiDQ7HZ3zvlgK6UeMrF0xdX/NGcjXizc=
X-Received: by 2002:a2e:92d6:: with SMTP id k22mr2379003ljh.71.1618256005336;
 Mon, 12 Apr 2021 12:33:25 -0700 (PDT)
MIME-Version: 1.0
From:   Aleksey Demakov <ademakov@gmail.com>
Date:   Mon, 12 Apr 2021 22:33:14 +0300
Message-ID: <CAFCwUrA8L--cdeSjTt=o0u2bK0tabFfUwJmyx3umv=M9_11J6A@mail.gmail.com>
Subject: canyon 2k fhd camera
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I had an issue with a newly bought camera and after a day of looking
for a solution I confirm that after I applied the patch I found
exactly in this list the issue was successfully solved:

https://www.spinics.net/lists/linux-media/msg181666.html

I would ask to apply the patch from the link above as indeed working.

Regards,
Aleksey
