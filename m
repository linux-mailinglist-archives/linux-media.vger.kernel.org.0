Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3638593041
	for <lists+linux-media@lfdr.de>; Mon, 15 Aug 2022 15:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbiHONxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Aug 2022 09:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiHONxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Aug 2022 09:53:05 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3BE113D29
        for <linux-media@vger.kernel.org>; Mon, 15 Aug 2022 06:53:00 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r4so9635219edi.8
        for <linux-media@vger.kernel.org>; Mon, 15 Aug 2022 06:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc;
        bh=bVsAybxu4TB3T39oso5rlihbg5ctRC0CizEcheaeobI=;
        b=p5V+0gGRwJFMuwIaNiL9uZ9jxLPsOwE2rntaXXQaSV4om2JBrngmxZ5DBcu0zyqfvf
         jG9cYQFxxepHzEEojLJEf1QqflxCQcm29XrUdZxY0homeu8yobscl/FvVHKXKe9k1qbP
         Q2MoGSL45Id2wt+GRVCCHAOYIEzucfc1DwFDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=bVsAybxu4TB3T39oso5rlihbg5ctRC0CizEcheaeobI=;
        b=ficAjAtcaXNco5SVU/djUDqevhm2usypEyZJBsoks+zK2aqgqa7LsVOKE3hqAyzqA1
         00YmNXURVW9USv6ei493Lsn81+wCpGtZcta/UdmMVW3W9qS4X43p/ddxWfV+IZ76h7Jl
         0a3JX47geQv7+1GajZBckwLv80tSvlNxUzcG0NNRlbmVitZG7xkrEKkTAl+WNAYGrAid
         y/TMlKHMQTNpj4YxHJh6Kko5F8AWEvjOj2RhLofmLyMplmqhvmHmS423QAlpBjgO3uIV
         fLAlEmXnbPK6vPH/dA4RY/W5q8ha822jAKihBJUBjVV+5G9iy/AjI7nbnT+lb2+MmCTR
         wk1Q==
X-Gm-Message-State: ACgBeo2Mrc/UnVzYU6kbGVzobU8b4xRa396MscolhV4dBRaC0++T4I7C
        kB+vqgsXqxTeR04VrTzeo5PYk7rOTKARCw==
X-Google-Smtp-Source: AA6agR4ffsu8tDpT0lfjJnpxJMQuxQxl0LXGS37fwH60ks+51Z5r7+cuwQx8FTGQJb9VG2NajwTvUA==
X-Received: by 2002:a05:6402:1e8d:b0:441:58db:b6a2 with SMTP id f13-20020a0564021e8d00b0044158dbb6a2mr14301818edf.277.1660571579432;
        Mon, 15 Aug 2022 06:52:59 -0700 (PDT)
Received: from carbon.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id cn19-20020a0564020cb300b0043bdc47803csm6634788edb.30.2022.08.15.06.52.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 06:52:59 -0700 (PDT)
Date:   Mon, 15 Aug 2022 16:52:58 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Subject: imx8m-mini csi-2 limitations
Message-ID: <YvpPusE1rOzmgPYN@carbon.k.g>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

	Hello guys,

I'm developing a driver for Sony imx492 sensor and i'm using imx8m-mini
(Variscite SoM on Symphony carrier board) platform.  Thanks to Laurent i dumped
the vendor mipi-csi and csi-bridge drivers in favor of mainline (v5.19-rc6 atm)
and parts started to click in place.  However, there are still a few rough
edges.

The sensor is 47mpix, and is only capable of streaming over all four CSI-2
lanes.  Each lane is 1.728gbit, which makes 6.912gbps total bandwidth.
imx8m-mini's d-phy can handle (on paper) up to 6gbps.

I guess the main question here is: what's the fastest transfer rate that's known
to work with this SoC?  Does anyone have experience with imx8m-mini in this
regard?


Even with the settings that i'm able to obtain a (distorted) test pattern image
with, i keep getting tons of:

[99910.847591] imx-mipi-csis 32e30000.mipi-csi: FIFO Overflow Error events: 1353347

IRQs also look a suspicious on the 'csi' part:

214:    2653716          0          0          0     GICv3  49 Level     32e30000.mipi-csi
215:          2          0          0          0     GICv3  48 Level     csi

That's with this clock setup:

 sys_pll2                             1        1        0  1000000000          0     0  50000         Y
    sys_pll2_out                      5        5        0  1000000000          0     0  50000         Y
       sys_pll2_1000m                 3        3        0  1000000000          0     0  50000         Y
          csi1_phy_ref                1        1        0  1000000000          0     0  50000         Y
          csi1_core                   1        1        0   500000000          0     0  50000         Y
             csi1_root_clk            1        1        0   500000000          0     0  50000         Y

However, if i change the latter two (csi1_core & csi1_root_clk) to 1ghz, there
are still mipi-csi IRQs coming in, but nothing from the csi-bridge.

Any advice on where i shall start looking first?


thanks,
Petko
