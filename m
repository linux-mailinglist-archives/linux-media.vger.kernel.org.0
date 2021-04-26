Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC6736B68C
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 18:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbhDZQPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 12:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234124AbhDZQPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 12:15:42 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D405C061574
        for <linux-media@vger.kernel.org>; Mon, 26 Apr 2021 09:15:00 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a25so51485746ljm.11
        for <linux-media@vger.kernel.org>; Mon, 26 Apr 2021 09:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=aKDlh2mU+e66HY6Ll/ExGEg/5/Em/CQ6F6H1SHjpg+o=;
        b=RUV9adeEjT6gKxHhjPzJ4QiI2bEMF2kTANvY5y9xEbeg+XSyQyxI1sIl6RdINEzTYg
         6IC2wlsYqPRs87pydjUQJlm6q00a4vdnZ/Z624K001qsmJjn05cmREJpbh58lydbvEJ0
         DIr0a+xa03LTydY9I0SR4XJn+WF1XmcCNNryd+128NIxmRe3Mdg9JNENeQBMd2dQf1gI
         dQpe+UILcR4oyH1ZKd/ssiVCvO1dT71JE7hat6SNMx8ZJsUGUZH1UQDT7FV0Y6YZ9OL4
         DM3aICk7+uFuvck32MavBQxfY5/mHOS7sAz/mveZqPploUj9rj58B+LmFVKuD/F7+sfO
         e95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=aKDlh2mU+e66HY6Ll/ExGEg/5/Em/CQ6F6H1SHjpg+o=;
        b=nrE01JYoq4PmuLMxs67K83qChYEsItxhFCW1iYpWZ99YN1oohGfQO8vx19c3qfeCz+
         z3Wii6Vu0JriKq74sC3DFCjZB77bAl5H9W45iRFwiMBdmOaFtUFREwti0g26jnJjEJmu
         1iM99pYVZVnpN66aym/fHA4NEMU35RuZRCXZQHn2+xOu55q4aYYYvH2Htvt/vfrkZyb0
         PFc18wVgfXvsJpAhdcu3E00xTI3j/+WvPrsJYt5wqJDwIGeY+uGEkDqcknXDTSvg4/mK
         VUcEzTHrwdYEFeEQhkhDqetR6EVe7O7I27saNosZOkEIJTVwzQX6Wr+Q0sLtsLrqEqiP
         WqOw==
X-Gm-Message-State: AOAM533ltF7eim7spz1bOXRc8jjiQYk15TzkLwb2HYgqyEnZSEZjUTNJ
        BUMIEw6ZCGXPNqnNUAdPuP/UimVxpRZZiBw3bkY=
X-Google-Smtp-Source: ABdhPJy+y7cm3zT4HmOZ2NItaS526tYPwsMpk74yKLtAYYf6yjqnQx1y83ljsNKISoma5dz6TwbK2JyL69PZcLQWobc=
X-Received: by 2002:a05:651c:1102:: with SMTP id d2mr12716044ljo.490.1619453698675;
 Mon, 26 Apr 2021 09:14:58 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 26 Apr 2021 13:14:46 -0300
Message-ID: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
Subject: adv7280: Scrolling images on imx6
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

I am back at trying to get a proper image captured by the ADV7280 on
an imx6dl board connected to the parallel CSI bus.

I tried your patches against 5.4 and 5.12:

https://github.com/Gateworks/linux-imx6/commit/959fbd4
and
https://patchwork.kernel.org/project/linux-media/patch/20190827215539.1286-1-mmichilot@gateworks.com/

,but I am still getting horizontal scrolling images after running:

media-ctl -l "'adv7180 0-0020':0 -> 'ipu1_csi1_mux':4[1]"
media-ctl -l "'ipu1_csi1_mux':5 -> 'ipu1_csi1':0[1]"
media-ctl -l "'ipu1_csi1':1 -> 'ipu1_vdic':0[1]"
media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
media-ctl -V "'adv7180 0-0020':0 [fmt:UYVY2X8/640x480 field:seq-tb]"
media-ctl -V "'ipu1_csi1_mux':5 [fmt:UYVY2X8/640x480]"
media-ctl -V "'ipu1_csi1':1 [fmt:AYUV32/640x480]"
media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/640x480 field:none]"
media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/640x480 field:none]"
media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/640x480 field:none]"
v4l2-ctl -d2 --set-fmt-video=field=none

gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink

Also, I saw your commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.12&id=9483a3f8e1b58ba1d7cd21687d8d0a63a015c36b

,but adv7180_get_skip_frames() does not get called. Is there any
missing patch from the mix csi driver that should call
g_skip_frames()?

Any suggestions?

Thanks,

Fabio Estevam
