Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4ACE5035CF
	for <lists+linux-media@lfdr.de>; Sat, 16 Apr 2022 11:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbiDPJxM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Apr 2022 05:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiDPJxK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Apr 2022 05:53:10 -0400
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F938C7E7
        for <linux-media@vger.kernel.org>; Sat, 16 Apr 2022 02:50:38 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id k5so17282026lfg.9
        for <linux-media@vger.kernel.org>; Sat, 16 Apr 2022 02:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7FKpOlw6Hw9CPLBA6p8zIHP8esRgyjtC59a4HGy9d6A=;
        b=OGFNIFUJGBCqiMLDCDItj6idpGoSC8IpE6j/MXRg22orFmqaAyZP/W9O2CoO9XBrpy
         hokeOjkBoq3NsDEH4XDNZ4ALWV2v0Qj2ITN+34TPiEU9pDBtHrcsZDudpKheg3ECcZD+
         9hdSVKyVhBBKovxtnI3mVcqyBgNJrmrG95kH05Q+T61vNh8fhUFXxjk5emaMtr/aSSsy
         kx9u83DbCYos4tVqvuQnbwKykIfMfzWoilDys7U457jtd7z3NkyLvJEeX2VeFAKhbl1i
         HhoXrRilBsevBOKmUr5qOPC0OO9Lzv2vKZXN438z7Wz3SlsyA8Sr2bvSI3uIAftPq6ql
         n8Fw==
X-Gm-Message-State: AOAM530EK4hUCwrA/fMejEYU2tDvQhO/hGA3YdtXNgp/36MGg1lsUzfO
        HAFOZnhB+4JtTJOv3SX4CSK3bN8xvK7zjzBRSZhS1Kfff1FmPw==
X-Google-Smtp-Source: ABdhPJxp8XZL++rWCjH3LcfdFEoYQDiUiK+VSBIR7+l0+8qt87nIgMi8wvG/0nvZ8GZdXqRKhmAFEE3xh/ES9T9hucU=
X-Received: by 2002:a05:6512:139d:b0:46b:af15:a15b with SMTP id
 p29-20020a056512139d00b0046baf15a15bmr2042198lfa.36.1650102636316; Sat, 16
 Apr 2022 02:50:36 -0700 (PDT)
MIME-Version: 1.0
From:   Gerald Hollfelder <gho@gmx.de>
Date:   Sat, 16 Apr 2022 11:50:25 +0200
Message-ID: <CADrDvBcE0Qy3-G9Kwcvza-QcBDzo=LzdXihRGsW8_Vfi1H4FwQ@mail.gmail.com>
Subject: Merging support for HD809 DVB device
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

found yesterday this linux-media tweak
https://github.com/dickh768/HD809-Driver---Buster for a DVB tuner (w/
Si2168) sold for Android devices. Maybe someone with appropriate skill
is as interested as me to get this merged into linux-media?

Regards,

gh.
