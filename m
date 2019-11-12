Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47915F8C90
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 11:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfKLKOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 05:14:35 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34207 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfKLKOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 05:14:35 -0500
Received: by mail-oi1-f195.google.com with SMTP id l202so14302706oig.1
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2019 02:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=bZsKHNo0GC0+2KVuqBYqpf+K5CfIZe5TFEXHmpUzDtA=;
        b=W4WbRR2X+2JiBrMJx/QDWTN6rGP8oEYKo01Ep+3+k1Xtuk0KPkJq0J+zyDDI0TSURk
         yok/KRteDY3qCxxDaDBQUX0clFoOJdjT65U8WQPTExOvR+bct9Gr3bzkHSBVlAvnsQDn
         sKBaqk+t4HKsBKac1l3/I6FP87zNm1Jvcc6jdwtAhaTsB0m0Hqk12v7cXyrI4w3amwiD
         mkHbgjCKHymL3mdNZVxZNzcMjp+vKtb2kLxM5g0OPUmiNoXbZwvLJCBXks2n+fWWQAX8
         VPT7my19b3aEibeRrmjl0t2gEhClU44t+SB92mzROttHiVlR1/RPIS4p1Q+KZi2wmv7M
         agyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=bZsKHNo0GC0+2KVuqBYqpf+K5CfIZe5TFEXHmpUzDtA=;
        b=H/uM4BpmLvfg/WS/J550GLN075WZc/A/swtyAKNNep8UOQTObL0E6BAYRofS+hiOly
         11V8Ii/cbRgpGLY+1jGDOV9kzQntPIzV3SXj2ku9tIgP+DYwc7RWYEC22mR6bPILJpyD
         HkHKyfQrFJzoENdwxxmL8O1MD1C4rm7mKK1rEZGwXr1nD+nwth3xXWaaoeIjRKK+i6Dm
         Ducq/miWavD0FmCsDC3IzQvR2Iht+V68dMbCJShUJstIIX+fsdecO8oiTKioEsX7gy0t
         xlMLfg6rAH85xjs4A6kjuK5fAgF7A49Vc15f1KLli6/ojyHim4ZPfjEts+O9pEYmtfx/
         kZTw==
X-Gm-Message-State: APjAAAVp5vqjFgW278nh2cEsnzxC15NJkKc9cx32YGjHM0rPpaS7T7D8
        FZ6z7hT6+I7V0FpA2HQswmsvyMpv+WSPtadww7uv4Q==
X-Google-Smtp-Source: APXvYqyvI71n1pdPUNQTiGEKyDUZHEl7mGVk6LBT09Jvr4fVT3hJ3hwzTwEeOpqbN90+m9BZE1FFrJL6WT+VrcBnrM4=
X-Received: by 2002:aca:3256:: with SMTP id y83mr3150987oiy.55.1573553674029;
 Tue, 12 Nov 2019 02:14:34 -0800 (PST)
MIME-Version: 1.0
From:   Alexandre Courbot <acourbot@google.com>
Date:   Tue, 12 Nov 2019 19:14:22 +0900
Message-ID: <CAPBb6MWXj+PNbJ0_m6O6wnYf6Z9NcYwr49qbSowG66NB-23k2g@mail.gmail.com>
Subject: H264 stateless reference frames ordering lists
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris and Ezequiel,

Patch c3adb85745ca6 has removed the ref_pic_list_* members from the
v4l2_ctrl_h264_decode_params struct. The MT8183 stateless decoder
driver I am working on still relies on these lists and I am trying (a
bit late to the game) to remove them from the Chromium OS kernel UAPI
in order to match upstream.

I have dug into the discussion that resulted in this removal and could
not really find how these are supposed to be reconstructed and on the
basis on which information. The commit log for the above-mentioned
patch mentions that "generic helpers will be provided for drivers that
need this list". I could not find any in the kernel so far, do you
have any code available at the moment? Or any idea on how these can be
reconstructed? The process seems to involve reading the DPB itself as
well as reordering information from the slice parameters, and seems to
be a bit involved to be done in the kernel, but maybe I am missing
something here.

Thanks for your help!
Alex.
