Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7A843DCAC4
	for <lists+linux-media@lfdr.de>; Sun,  1 Aug 2021 10:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhHAIce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Aug 2021 04:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbhHAIcd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Aug 2021 04:32:33 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77443C0613CF
        for <linux-media@vger.kernel.org>; Sun,  1 Aug 2021 01:32:26 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso20508325pjf.4
        for <linux-media@vger.kernel.org>; Sun, 01 Aug 2021 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=kLHuLgXm0DNvTHSjozOJ3tWPAYBhCUOW4wA2qHTCmM4=;
        b=HQp3OQ4ek++YB7fRVhRBa3k9YfLiSPhqWgzIZ/5vZ1xrChEtowj12IcKFRd2cmtzrA
         ZbZhf6f91kBIgSUUyb/+oYk11m11sph24ceNVLJz5qhjXzao+d1RB0KAfpZoMHMS5GOV
         DOnSQCwGPJwJJDCGd/hjIWf4RhkXpPzMt8mJR/3R+5Ppr7mdXyHWqmHinQlKQTaZRYzg
         T0+jIN9zE1UPlNKZremeW4y/bhdqNQKIaZzQQTAsRgrv5VbKPD434tuh7poJ6Dknv9f6
         niO2UM/aqnz7WBdJnIyUx4ac8lIo2t/ZofqONGaMsqTMu+cXtXb37KQr+jZKvhiS7nVS
         HwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=kLHuLgXm0DNvTHSjozOJ3tWPAYBhCUOW4wA2qHTCmM4=;
        b=pcuKWaEemJm49Of98rqoQYJXeyccFCRjL0ySwwPONuLFRvoe22p0p2yswmzzBWQIhm
         ZgrfOVdec1tpR6xRoDz5/56gmX6caBOkBpAmWtihSAUBpP35a3tuDHEnLsxI8t+QtAJm
         zpCsUPYPnXXmj54TTZXqh5yuKSvOtzueUeOUkR0KCxiNw2ZB+b5GZEaLiyqpTFUI7oVQ
         sgn9Ziup2qumwKoehJBokKmTfmfgYCDnUFO2g9OAKM6PERpBt3VvVcslpjvFaLEVbXRx
         mbQimSYV8kkq5HcDqXKLRKcWmblgwCh2Ug6aqX+lFrpiLk/t5J5oWc9v0C0RBIweSGj1
         /Edw==
X-Gm-Message-State: AOAM531uoNcsLOQIl1wAHn1Ozr9kPtziLUrGSkodeGB4yaZnD7L+vQ7J
        8BnJq9VUaJUdcojHojHHre+D4L7vhdGzTm1sBHkRT7Js3vM=
X-Google-Smtp-Source: ABdhPJyp44CsXxb/sBMuMwU7iPJsysiL6OMGQs5EgMLNxAxSwSKuybAs5meVuWI7OLfnIFzlM/95IC3ZaQU9vuMElXM=
X-Received: by 2002:a17:90a:708c:: with SMTP id g12mr12095927pjk.13.1627806746000;
 Sun, 01 Aug 2021 01:32:26 -0700 (PDT)
MIME-Version: 1.0
From:   nil Yi <teroincn@gmail.com>
Date:   Sun, 1 Aug 2021 16:32:15 +0800
Message-ID: <CANTwqXD8rc9gySvXuCofOJnJZrZQqOiHw_aYPrPZ==3A+by2gg@mail.gmail.com>
Subject: [BUG] drivers: media: rc: imon.c: dangling pointer in function imon_init_intf1
To:     sean@mess.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, there is a dangling pointer in ictx->rx_urb_intf1  in function
imon_init_intf1 in v5.14-rc3
in function imon_init_intf1:
2322: ictx->rx_urb_intf1 = rx_urb;
...
2362:  usb_free_urb(rx_urb);
leave a dangling pointer here,  I'm not sure whether it  can be
triggered somewhere.

Any feedback would be appreciated, thanks :)


Best wishes,
Nil Yi
