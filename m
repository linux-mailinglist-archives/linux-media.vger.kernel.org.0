Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C6D35B14C
	for <lists+linux-media@lfdr.de>; Sun, 11 Apr 2021 05:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235038AbhDKDrG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Apr 2021 23:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234979AbhDKDrF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Apr 2021 23:47:05 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1C5C06138B
        for <linux-media@vger.kernel.org>; Sat, 10 Apr 2021 20:46:50 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id z23so1971741uan.8
        for <linux-media@vger.kernel.org>; Sat, 10 Apr 2021 20:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=+21d1+Xiy2omcSMMCwmCklembRtQhN8kaO5Rb9pLpM0=;
        b=QWeuLPNCtKCDjVNOr2zwPBrUyJL1ignw6RKyuGw7MjVbufaYUUkuu8b/nL1jgevtzH
         DmVfdzLTQo9aBIztZKaUXObuWcWgeQ/Aesr/gCPc1WcG6bdMVH9ibltvzSGr9iI+O3ac
         ag7XjjkX2bFDGkLVp+puu7hrW4jKLGqXHz6UtPYxfk2BvBhGfJjIhKmQ3ci2UoCj6fpv
         tDoQe3wZUwTHcdblEu05I+/N8JNaG9TbQcXlQRKNYXFUQtFJvZHMwr/uBCNnChDJJivR
         h8tsBS8vf92/B/EuDs1l5TanQGMztZcuoqSrxhdBISnI19vgllixhQgEtVJuoldRSXcV
         bbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+21d1+Xiy2omcSMMCwmCklembRtQhN8kaO5Rb9pLpM0=;
        b=tO+uElK0q4xB2Oc1rJz7ir9eTUS86oD76QzpkbbOaDqfoJl/vQ70CkUX3H1X5NLp+R
         C7n2qPWlhXgDe3oKV7eRgOEpup9/038lmWBjytJV2ImBzHSPscodN3IuZ9H4OIvejWc/
         UqeEZnMZeAMOUrwkub5h2GAGHLA3fwEP3wuvh9nDQEq7qbi08ARMJIQnNo9fkAhZLvFY
         IWTdWtVXPiL805JgbXwWRCTyq9aD7zJqT/epnTZEDhfATOYAsfAWW7Fj9RFs6PWDP3gG
         ErQE572el/diSRpGlcWEwnqr+Wv7bEp38nY2fRDSFZXtF3uy9iOP9WNOvdyU3OF9m0KJ
         26Ew==
X-Gm-Message-State: AOAM532p1H4QGH8xz+8AFMjHcyToPuSgWa0OE51SjWLQH9VsE3ehrmzP
        rxAGXeWCocL7BzRqf7PKuSNx1CfWuLPg/ts6Vo2jYbEeZLw=
X-Google-Smtp-Source: ABdhPJzYobvwlMxAkVHqB3/WqyHXsofaKxDNNvUAI83MaRUp5MKdbzeQTEWB9pgJPEn0Rfp9GBbaJtR76YD/EtYWrRQ=
X-Received: by 2002:ab0:4285:: with SMTP id j5mr16653213uaj.38.1618112808966;
 Sat, 10 Apr 2021 20:46:48 -0700 (PDT)
MIME-Version: 1.0
From:   Robert Goodman <robertpost214@gmail.com>
Date:   Sun, 11 Apr 2021 13:46:38 +1000
Message-ID: <CAJk+WOcRnqv_=NQj_urDQyj7F5x53eg4RVaGABCP9Uo3i0gOAg@mail.gmail.com>
Subject: Camera update
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

please add to the UVC camera supported list as Untested. I'll check it
in a while.



 USB Camera:


          Product ID: 0x6366

          Vendor ID: 0x0c45  (Sonix Technology Co., Ltd.)

          Version: 1.00

          Serial Number: SN0001

          Speed: Up to 480 Mb/s

          Manufacturer: USB Camera

          Location ID: 0x14100000 / 2

          Current Available (mA): 500

          Current Required (mA): 500

          Extra Operating Current (mA): 0
