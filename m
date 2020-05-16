Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76AAF1D6470
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2020 00:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgEPWJl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 May 2020 18:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726290AbgEPWJl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 May 2020 18:09:41 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD48C061A0C
        for <linux-media@vger.kernel.org>; Sat, 16 May 2020 15:09:41 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id ee19so2933389qvb.11
        for <linux-media@vger.kernel.org>; Sat, 16 May 2020 15:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:subject:mime-version
         :content-transfer-encoding:content-disposition;
        bh=BkHLOMLMneFUpUOxGiDV6yrhdLyNZi7S7wrfyjNRrVg=;
        b=CRKoLIxnPr5uqVCsrg2OYtSdBPGtAThY9owpp6sZit7oWS3qrXLD1v/97P9ZwLNjpA
         7cdr5pVpT9WQhvw6H48T2L8ISobEm719w1cPpE/jOciqK9AADagq3jPQbP3jUasLsdln
         sb/ImE7KP+sz6dJjYlbn7wekggWXN5BFacZeJndo9KQJK2Ii5KCIb4REV94tUbF+r7Z0
         N7C1UpSk9Ht96Q94/xjL9FRjg1NkRHvX4d5ZykaPk0q5zCiWl7Bvcib31M1Q0fzSyYwg
         S+NrDz8sJu+qjDrRemJvnyO9mCMy4dTzGmZs9D5IpMLXW1Yuf1VI0NHbt5niHK2UNWh2
         YoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:subject:mime-version
         :content-transfer-encoding:content-disposition;
        bh=BkHLOMLMneFUpUOxGiDV6yrhdLyNZi7S7wrfyjNRrVg=;
        b=GifGB7oqLaQ/YaWyy3SdPERhHKRZ36mQv2phJNCpEE+11xu6yJndp9/dA0KHCPUvpK
         l5JzLTBy74Yw3UhqAjs5rUbJfV/NwADZ6ZicGjvZw/7eehuZsyPQFgvEl9WV4TNKEwSw
         gn7ixQCylAPjz+SFxBUWDLIU5X7lNGEMUScLRs6Q+FPEcSEvIAl2vx3SoFyDQuJw+4U+
         AOLb5YK7lpqytVku0Q0MbOtw9MJXtqeJSbkc9mKZlp6xDx2vT6xeeTS89qwKhVjqHCrv
         gjmiXxAQpG/dnherjo+wTMSeIjS+Xl3QW6ShCb1fc9n67+4dLgZrCYDinHW8zSSUISB7
         Zwyg==
X-Gm-Message-State: AOAM5324dCtKMvvlhRVm1Xl5yHZ86APQosO+ggGQNK3fmPypm79esa3A
        3tfBNvxt3eseYH1ljoe8LVs=
X-Google-Smtp-Source: ABdhPJwofGOHiYgzVIu6qWpib7tvZOSNjmb8x4lGRBJyhKbBeYVDrfxTDrlqdDqln133+xzBogWObQ==
X-Received: by 2002:ad4:52ec:: with SMTP id p12mr9705860qvu.65.1589666979301;
        Sat, 16 May 2020 15:09:39 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id f68sm4793218qke.74.2020.05.16.15.09.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 May 2020 15:09:38 -0700 (PDT)
Date:   Sat, 16 May 2020 19:09:35 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     "=?utf-8?Q?mchehab=40kernel.org?=" <mchehab@kernel.org>
Cc:     "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?=" 
        <linux-kernel-mentees@lists.linuxfoundation.org>
Message-ID: <DE1E173D-8D56-4CA5-9838-E9476B24DD69@getmailspring.com>
Subject: modprobing 'vidtv' doesn't really do anything
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro!

I am trying to iron out the bugs in the virtual DVB driver I have been
working on for the past few months.

modprobing vidtv_bridge apparently works, i.e. 'vidtv_bridge' gets
listed in the output of 'lsmod' and there's a message on dmesg warning
against loading out of tree modules.

It does not seem like the probe function actually runs, though. I have
added a printk call in vidtv_bridge_i2c_probe() but it does not output
anything to dmesg.

Also, I am using QEMU + KGDB and the debugger does not break into this
function (or into any other function in vidtv_bridg.c) at all, although
it can actually get the addresses for them, i.e.

4       breakpoint     keep y   0xffffffffc0000025 in
vidtv_bridge_i2c_probe at drivers/media/test-drivers/vidtv/vidtv_bridg.c:373
5       breakpoint     keep y   0xffffffffc0000523 in
vidtv_bridge_i2c_remove at drivers/media/test-drivers/vidtv/vidtv_bridg.c:416

It can't find these, though:
2       breakpoint     keep y   <PENDING>          drivers/media/test-drivers/vidtv/vidtv_bridg.c:vidtv_bridge_driver_exit
3       breakpoint     keep y   <PENDING>          drivers/media/test-drivers/vidtv/vidtv_bridg.c:vidtv_bridge_driver_init


>The best is to start using dvbv5 tools inside v4l-utils.
>The first step to check if the demod code was properly loaded is to run:
>$ dvb-fe-tool 

I tried this, but to no avail.
>WARNING device dvb0.frontend0 not found

I am stuck, can I get some help with this issue?

Thanks!

-Daniel
