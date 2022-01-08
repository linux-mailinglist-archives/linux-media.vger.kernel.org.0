Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4549D4884F8
	for <lists+linux-media@lfdr.de>; Sat,  8 Jan 2022 18:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233137AbiAHRfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jan 2022 12:35:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbiAHRfK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jan 2022 12:35:10 -0500
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8611CC06173F
        for <linux-media@vger.kernel.org>; Sat,  8 Jan 2022 09:35:10 -0800 (PST)
Received: by mail-vk1-xa2d.google.com with SMTP id bj47so615066vkb.13
        for <linux-media@vger.kernel.org>; Sat, 08 Jan 2022 09:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=rvET/fvWzhpToB747MDUFiFjig4Ir0KMz/xxf5A99jU=;
        b=QrX7lzXx933R1/zza9CDOcbNQRd8CDNcb9zRaOA1EYbU6WK3p5t53cAZtXf8NRNnJl
         BI7dVeYV5EZMY93S0qzqe3y+FkfmZqEWh+ubOeyzHPkm4E0vVuSoxCHzZUuxLlk1ueau
         uZKB5KTjbG6U5jL2AqBcWLOQ2Ww3T521nwbJ6PVsaF19P7whX79B1OJrXwsxq0tuIeto
         E2fqNjJZDWaxB1V3Ul93hh35WbLfYiVp0vbI4bq0egA+ZyqkjhQ859WnPGGYnSvqmFRm
         Mvi/JWxX1BeyJFVEVEAWFeGFXBKSkrC5rv5xND8Eir8g5i3K97fY1TOwjxhIFWQBgn+p
         MjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=rvET/fvWzhpToB747MDUFiFjig4Ir0KMz/xxf5A99jU=;
        b=jyYfbM3iKiy+y5j043bChusQadBlThcnLepuqXSdGaXMVVx2HE/mhzyG4x+SEyFnoR
         9luDlwe4mUX9pP/1POfDxLl2qIUi1gggsjpQ5wzcNmvfZZo/KWl5fu8d7GJLl+/jU/QS
         QYu4x7RvwcP2/mi4brpqjtaIQNRqUi5BRhIRAXqlj1XWf7owMrAH4MOZsevezhATyBjA
         OS7wKPB1UNaMWC9gLcSyPHbLoKtmnVvFW8F85tgnYQKYmfJ/+aBg/IF2dm4VO+fpGwgo
         Fuw9wXSoO16Of2SUVPUMC05Nm+W/BndGeB6yd8txzMDAk4BMbCnqVmxwe9WDNDquXCyU
         Fnsw==
X-Gm-Message-State: AOAM531yXkUOwda43lKDItH6EWtzB7c/4wv81T4Kc6VDfHGNeubbV8yS
        0fgg/NtuPJvBu8mCv9bO6j3QpXglMkMArVo7AogTwyFamOQ=
X-Google-Smtp-Source: ABdhPJxPDz2dba3152KA+EfjgEgTPSquQpSM6vyo4daSMKLrN4KVL773s4yPQxce4wC3Qa4MbZQkT5Oy+mchPyggfeY=
X-Received: by 2002:ac5:c848:: with SMTP id g8mr25168716vkm.3.1641663309546;
 Sat, 08 Jan 2022 09:35:09 -0800 (PST)
MIME-Version: 1.0
From:   Adam Stylinski <kungfujesus06@gmail.com>
Date:   Sat, 8 Jan 2022 12:34:59 -0500
Message-ID: <CAJwHY9W2ewhq7oUvgxUZpMJ77=9J=JavG=P2Q1pZC0b1XZiriw@mail.gmail.com>
Subject: DVB mmap API
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I'm probably just looking for a project of unnecessary complexity to
take on but I couldn't help but notice there's been driver support for
mmap on DVB devices in the Linux kernel now for a pretty long time.  I
also noticed that it's been marked experimental since inception and
that nothing seems to use it or have a real example of it for the DVB
spec (v4lutils' dvb wrappers included).  Is there a grave reason this
thing is still marked experimental?  It seems in theory like a good
way to prevent context switches.

I'm nearly considering experimenting with modifying mythtv's DVB
demuxing, tuning, and streaming routines to use this.  Not because I
need to, mind you, it's just an ancient system and I'm trying to
prevent every ounce of the occasional hiccup that happens.

https://www.kernel.org/doc/html/v5.15/userspace-api/media/dvb/dmx-mmap.html
