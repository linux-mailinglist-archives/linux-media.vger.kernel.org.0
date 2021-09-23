Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3768415C0F
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 12:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240421AbhIWKio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 06:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240387AbhIWKio (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 06:38:44 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF202C061574
        for <linux-media@vger.kernel.org>; Thu, 23 Sep 2021 03:37:12 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id w1so6163266ilv.1
        for <linux-media@vger.kernel.org>; Thu, 23 Sep 2021 03:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=Ba1uVDZ6iIGLN7Sn7UcVSSj6h+Y/qnnwP0fZz914bBM=;
        b=BeLanyPYRQqm3CvyGgN0LdlylQpszQ6F86/hVrOj4BofUgmfDGRTfDqB/fs7aou8wu
         buYdEesMrbnJ3Uo3tJaYOrbI2h/5G+l0rjPuqUyEmA4ugsARnMaqcXyWTDmHbQv0e4LQ
         fyoFQjOXrlCSw8tCyFuBNSD9KS4PpOTHWVrkowYtwyMfod8uQ7GWYKAZw3X9CXj17OLZ
         w2dKP7pmMhcugKLd2s8kB2ck0hWm3m3MZEsigPn0UkoCt002y3IcSa52n7p+KHp6lLg2
         +505ClIj6GNLUiBFHAUtjDGPYAvrTGATHMPo8lLaNRfJPwTTkhJ4eenZv5QCPHJZKqvQ
         cMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Ba1uVDZ6iIGLN7Sn7UcVSSj6h+Y/qnnwP0fZz914bBM=;
        b=YkNCJAE3gnffDMZ9FZ8QQowd4hX84siURWGQz5bvKGOte9ES532P85AFP2EtrXnkO5
         g8gmaOZQDQYwPE+TsJ6F997sy/EpCgSPpEACaMJXMFVv3aZQdE2UaRE9VOU47FU6NiA9
         7Ldy9+3jRdK1qEIXgw9XNsBNFOVmP+uhlY2xaCGqeejeSRzw+4UczsHcmvVs1p1+sHGq
         bJ8F212m/ZEr/dlAWpAcXZ7pgb7vkGK8DN10Lkgf+rqnDtdu7PR67imill4J7SRqydqM
         1QjQYVKp4PqXigOIcmfzwARGLbGKMDHElFJEkE/VEBbtSojIt2X+X/1UCW0nx/VOnDKZ
         WB2Q==
X-Gm-Message-State: AOAM531IPAl9Eotgd/PbjJz2SEHGm+9oZN7SJxNLdF7cO2vG4u8npnUk
        31A78Vl+T9IbYg85HEl3ioD8oFU5Wljyu6l4fWIprSP5pd8=
X-Google-Smtp-Source: ABdhPJydeClRxdfDScF5OaQhWtrN++cgXdyORCrBpH4CyxSLlUzyZOs4cMfn9/LB8PqgkhULFAakO992R1kPZdWGLgs=
X-Received: by 2002:a92:6f06:: with SMTP id k6mr2940858ilc.116.1632393432242;
 Thu, 23 Sep 2021 03:37:12 -0700 (PDT)
MIME-Version: 1.0
From:   Borut Lampe <nude.bird@gmail.com>
Date:   Thu, 23 Sep 2021 12:37:01 +0200
Message-ID: <CAHfbzRsFzunBDNPbQt=HUx+cBSHdBzzrJ-s4bjj+bEoB2sNvqw@mail.gmail.com>
Subject: OV5640 720p@60fps
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I noticed that for now only VGA resolution supports 60fps even though
the documentation says that 60fps is possible also for 1280x720.
Is there a reason this hasn't been implemented yet (e.g hardware
restraints)? Are there any plans to implement this? Can anyone give me
some pointers on what would have to be changed in the ov5640 driver to
achieve this (starting point would be linaro kernel qcomlt-4.14)?

Kind regards,
Borut
