Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5AF5BA5FF
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 06:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbiIPEpG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 00:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiIPEpF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 00:45:05 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B3C17E3A
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 21:45:03 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id e1so3414331uaa.1
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 21:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=mCwjiH+4nS+oWg0KsRDbxSKcSB1z5/kpvqnCycbir+Q=;
        b=j92P0vwoOOoKulMSU+WgGksRGPuiqqHo2FGoMEmejJOFofhXRyOXOSbOwVKRQ6lHkn
         VoEPGMZlPuHeqlMAjQKEOa31krO+Fq3QOawJI5Mf5by4IgGglFnUMKoQTeadDd9iXHex
         MzNp+GUNVFh9aZiUBhRHFDJ2KLjIH+FiMP4bIKB5srouPS1ZoanwOBJ46lS1L/vLoIYG
         ecopGGgTMGVkqA8W5zey4ESQMYHgKu2ru0+Ss4hlXrEL9VeqspgNCVoYo1iaof6oBXqQ
         WBD8GD5uSd4o2ot8OpI0Jqq0936mao/WCnFyUvoA3WYmtWuBu3S4ezB1xN3usdgxLeXT
         YNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mCwjiH+4nS+oWg0KsRDbxSKcSB1z5/kpvqnCycbir+Q=;
        b=na4khakOoCv++oQzT4HQHJCPwuF4EyK45ttPrdlRZ03OV+ABbBglXBEmLw6aIhzEBS
         iIKNi9ltgQw5eKsto13aBX2Zc7d5z3EljfVYdTTkQ6tWkvcTccZdFojbb69IRStP9BI7
         5Y8o6k1Ipw/E1EkiEs2w1zC4nt2nTlTur27kcxl0w3I+W8shSiU3L7gGyo/6o1rme6gb
         nT8chBAkiq6q+wzvuAcV+EijJc3B4veJuk5cUZoLh+j9sw+sG7m0pvVtKBTpn6TWw5fT
         k9WAZwsQLrfRpL+gMTEj5QVfSh7qh6RA2CJLq1ziXRRketYgqM38Xz8At+Swa+dmN5Qy
         LRIQ==
X-Gm-Message-State: ACrzQf2hh87tbnbp3bV6mYuNtW6KgEv7ZhSCGHJKFWWlKQR0BX1lZr5B
        /ihV7VHo2rQsCz3J8054Kp8ggP2+dFa5pyVJB3JyZAd4KKM=
X-Google-Smtp-Source: AMsMyM45CTzYLwR/p71h/F5+NLYEhHEr3ArivFAcJ1li3AgS2mXyjPsY0TJ3AUWpCIeRD99BDzqnNiDbsuxsO2Wz0PA=
X-Received: by 2002:ab0:4909:0:b0:3b9:1782:7fe1 with SMTP id
 z9-20020ab04909000000b003b917827fe1mr1273969uac.32.1663303502251; Thu, 15 Sep
 2022 21:45:02 -0700 (PDT)
MIME-Version: 1.0
Reply-To: Rob.Townley@gmail.com
From:   Rob Townley <rob.townley@gmail.com>
Date:   Thu, 15 Sep 2022 23:44:50 -0500
Message-ID: <CA+VdTb_iMbJE5RGkuEu3K9s=L4GRGvp03taUiLRz118-d7FKJA@mail.gmail.com>
Subject: edid-decode reports "Missing Display Range Limits Descriptor".
 Non-conforming embedded All-in-One monitor.
To:     linux-media@vger.kernel.org
Cc:     Robert ECEO Townley <rjt@eceo.us>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have had a major problem for almost four year with these HP
EliteOne 800 G1 All-in-One machines.  Since the monitor is embedded
inside the All-in-One machine, there is no separate power button for
just the monitor.   Forcing Power Off or ssh'ing from another machine
to sudo reboot is required.   The BIOS defaults to  automatically
selecting among three different models of LVDS from two different
manufacturers.  Manual selections do not "stick".   I have a
linux-hardware.org writeup i am working on as well.  Will reply back
when done.

edid-decode SHA: 791ce31e7dc6 2022-09-09 08:44:21
"Missing Display Range Limits Descriptor."

The BIOS settings allow choosing between two models of Samsung and one LG model.
Alphanumeric Data String: 'V07'  which happens to be an OEM of LCD monitors.
Display Product Name: 'HPQ 800 AIO'
Alphanumeric Data String: 'LM230WF3-SLL1'
Manufacturer: HWP
Model: 4233
Made in: week 21 of 2013


$ edid-decode --check --hide-serial-numbers /sys/class/drm/card0-LVDS-1/edid

edid-decode (hex):

00 ff ff ff ff ff ff 00 22 f0 89 10 01 00 00 00
15 17 01 03 80 33 1d 78 0a a0 40 a6 56 52 9d 27
10 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 19 38 80 00 71 38 14 40 60 40
84 00 fe 1f 11 00 00 78 00 00 00 fe 00 56 30 37
0a 20 20 20 20 20 20 20 20 20 00 00 00 fc 00 48
50 51 20 38 30 30 20 41 49 4f 0a 20 00 00 00 fe
00 4c 4d 32 33 30 57 46 33 2d 53 4c 4c 31 00 a0

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.3
  Vendor & Product Identification:
    Manufacturer: HWP
    Model: 4233
    Serial Number: ...
    Made in: week 21 of 2013
  Basic Display Parameters & Features:
    Digital display
    Maximum image size: 51 cm x 29 cm
    Gamma: 2.20
    RGB color display
    First detailed timing is the preferred timing
  Color Characteristics:
    Red  : 0.6503, 0.3378
    Green: 0.3203, 0.6132
    Blue : 0.1533, 0.0625
    White: 0.3125, 0.3281
  Established Timings I & II: none
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  1920x1080   59.997 Hz  16:9    65.997 kHz 143.610 MHz
(four way interleaved, 510 mm x 287 mm)
                 Hfront   96 Hsync  64 Hback  96 Hpol N
                 Vfront    8 Vsync   4 Vback   8 Vpol N
    Alphanumeric Data String: 'V07'
    Display Product Name: 'HPQ 800 AIO'
    Alphanumeric Data String: 'LM230WF3-SLL1'
Checksum: 0xa0

----------------

edid-decode SHA: 95d81c9 2021-01-01 22:37:47

Failures:

Block 0, Base EDID:
  Missing Display Range Limits Descriptor.

EDID conformity: FAIL
