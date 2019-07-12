Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7924167195
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 16:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfGLOid (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 10:38:33 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:35548 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbfGLOid (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 10:38:33 -0400
Received: by mail-ed1-f47.google.com with SMTP id w20so9410234edd.2
        for <linux-media@vger.kernel.org>; Fri, 12 Jul 2019 07:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=08/mRbtXclBQw8b7vh031TiXeQXkHVXmOqMEmnOJk5M=;
        b=O1DXxvVQCzPhtPSRmgiqjJ0JIDo56lig/pvn6oUKYGE6D1ONvmAXdZi81iXFo6nCjb
         0owMPzuJ8ucGUwbQ7QhWqmYefp/41idF+fu8rPw5Da68KxeslYI6viZ1AKYN+jxbscTv
         yud7iKJCA2vD2rC/1uXXOj5uIHZ6gt66HhTnfilk/SmSlGBkLr5cDYX8bj95bcxBKVcR
         PT10KDh+jVHzio3xsXPF70jXOlIzx5J419UUrwEPsW6gAeb3Of/nmPYO8sHzpBoVnPgb
         YN95xKwRZ0vgE05qnRT4hlYzEaTKZGl31+Tctu0NsfzU2/myN7usIMluruiyUPmhMGzk
         RkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=08/mRbtXclBQw8b7vh031TiXeQXkHVXmOqMEmnOJk5M=;
        b=hyXcqLfiaeTTSUldRXeRUj202WpfRm9qDtbpgfBPnvQUFjPUmOl5hjjawtwCv+kR6L
         PTVERvwkRF3brC1sH3gK3B32USzDBhp2v/kql/xCZ76rwaDMs5PNFS3IOqA1XSAO6etP
         ldurxM+FB/igLjAvU6+A/I+AGrLjPQ6hnG82RUAtz2eH9MBmAkebkTDKD1L2YYoWp0Mo
         /R9XueqWrGhUbQrwYhH1u1sDjEdpKd2v0wxESEbqimsJ4bY3m9wUIMgB+vov74EGu5hm
         1gFl4i2v9EjTyEti+pbaEeP0goqGV5wkpmnM3hB4jXxSUiLT125B4Hd/CKZhnqzSEI0u
         WzVw==
X-Gm-Message-State: APjAAAW1o8vPYj5Ys3ubbAwhpZl8f+GeEQO409pb5vpM1pJHR3hSnue9
        LCp+p1CU6G2Z/UqcdKtQik2RnrZR1yivk0wW2RNEiDu5
X-Google-Smtp-Source: APXvYqzblFQlW27mgTZmy/BK9qt9Ou3FcbWkjcyuUpbQc8qgwotBM/UvdkpsozkgfhdAf6MagqEHTmbBFCth2N0bIDE=
X-Received: by 2002:a17:906:1804:: with SMTP id v4mr8756612eje.188.1562942311135;
 Fri, 12 Jul 2019 07:38:31 -0700 (PDT)
MIME-Version: 1.0
From:   JLA <neonmann@gmail.com>
Date:   Fri, 12 Jul 2019 16:38:23 +0200
Message-ID: <CAG2KHmfuFcX6L_rchAeV3bzpcj00d_XNbPL7FHtHJUVHXzf3wA@mail.gmail.com>
Subject: Adding support to NPG Real DVB-T Hybrid PCI Express [cx23885]
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have a NPG Real DVB-T Hybrid PCI Express capture card, it is a
DVB/Analog PAL/FM hybrid card based around the cx23885 chip. I've
taken some pictures and checked the cx23885-cards files and it seems
most of the parts are there and I would like to add the card entry for
this model.
I can, if needed, probe the card with a logic analyzer.

ICs found on board:
 * Conexant CX23885-13Z
 * Intel CE6353 [Clone of Zarlink ZL10353 ?] (DVB-T Demodulator)
 * XCeive XC3028ACQ (RF tuner and analog IF demodulator) (Not in
tuner.h but on wiki?)
 * PI5V33OSQE 2-way (analog?) multiplexer

Windows driver ships with the `AV88PCIE.SYS` file and a somewhat
documented .inf file with it.

Any help on how should I proceed adding support for this card appreciated.

Best regards.
