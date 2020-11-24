Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7712C2332
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 11:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731735AbgKXKpm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 05:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731503AbgKXKpm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 05:45:42 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CD8C0617A6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 02:45:42 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id t8so18101431pfg.8
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 02:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3kwegyRqAw46aqWt+s2hHGKYwjk1qlvqH33gfukWNu4=;
        b=eiVKagnSnyv2tiR2Et7Ql7AZP/9w9jlLNqQTHS3fRI9E4/SO+rwqGhlA+DkIvTcsGL
         GvP3Hbn/TFHAdKlTlh4r3TdYArZkggVbz9uC3/wr8TuEJkpUg77iFOhPRCSdFmL7yiFg
         ccSP9+rsqwf7PsbDC0GfR7NOovBce7xUPfKYzxtdh2pq5mGIc7I68tx70c38KTIZn/Br
         Rrz8Quw45lUlPaH+CWus9LpFO5surp/ggMPdemQ+8ijF5G5Ro3bqOV1Stf4zIeEXhJeI
         oNkJglxsxCrPf8eDQ9NLYeb0jyZeBdT+rhxrJ4nMBDtV1qApdxlSoHDJH3LWPeObwOVa
         IfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3kwegyRqAw46aqWt+s2hHGKYwjk1qlvqH33gfukWNu4=;
        b=k8uuTUzU7+gbLl75EVbIPHVU+xKFXEPWBXoC3s+3BgdM0mbMh6BRLgzSQAgGfvfJ7c
         aW+cqcFvL2jvM7XbC3iawu/V29K9yWobDhPpjsPH8dQO8iXnG9TjVds3OlWv1WMl3W0u
         t+XM6aOa79NFLJmnm1By9GxaYSrPaX1pyAa6SgTJm1X6EBVwa+MPLBoykLfHxnkc5ja1
         4pXljTzEZLVJ/ZMGuT1R9vPl4U7m3d3cvC29KDcjFqQae9YlC4utLfPKoGWolRu7ie3y
         it7DE4udDjuXWT1OVBpVCjN7dTZQMBewqSSBgX2i6MTk5+2I+yHVk7b/olNFVaft7vU9
         pEiQ==
X-Gm-Message-State: AOAM532GC/YApV0KfhdqcBQMXlpoOE77YsWwdPvtm207Z00zGsUglpu0
        9b2E+ex2iHyyeerd/dcSc5C/00kmvjsfi84l2WSQgw==
X-Google-Smtp-Source: ABdhPJwmGsSGTzfqADPhJaLR24JRKMUHU5sMY1UkaytHFUOVKZaQLOE6xRAFTRUNVPEkSd3eETejD2b4SxoTIHmKwtU=
X-Received: by 2002:a65:6a04:: with SMTP id m4mr3118476pgu.265.1606214741881;
 Tue, 24 Nov 2020 02:45:41 -0800 (PST)
MIME-Version: 1.0
References: <20201116155008.118124-1-robert.foss@linaro.org>
 <1606203651.4733.134.camel@mhfsdcap03> <20201124084343.GD3940@paasikivi.fi.intel.com>
 <1606212616.4733.157.camel@mhfsdcap03>
In-Reply-To: <1606212616.4733.157.camel@mhfsdcap03>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 24 Nov 2020 11:45:30 +0100
Message-ID: <CAG3jFyuBvjpbhNUOqH1dOX=9WZG4avG7vAHgXThoim4LeruXyA@mail.gmail.com>
Subject: Re: [PATCH] media: ov8856: Remove 3280x2464 mode
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Ben Kao <ben.kao@intel.com>, Tomasz Figa <tfiga@google.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>
> OV8856 sensor array region consists of 3 main window settings.
> The inner window is controlled by [H_win_off, V_win_off].
> From the old unusual 3280x2464 and 1640x1232 setting,
> H_win_off(R3810-R3811) is 0, V_win_off(R3812-R3813) is 1.
>
> Considering that the register TEST_PATTERN_CTRL(R4320) controlling pixel
> order is not set (default: 0x80, meaning BG/GR) and mirror/flip are both
> OFF, the absolute coordinate of crop_start is expressed as:
> [H_crop_start+H_win_off, V_crop_start+V_win_off] = [0, 7]
>
> Thus the first pixel shall start with G channel(according to datasheet).
> This is different with current resolutions (3264x2448 and 1632x1224).
>

Sakari: So this means that the patches introducing 3264x2448 and
1632x1224 modes really should have included code for configuring BGGR
format for those two specific modes only. Let me whip up another patch
for that, and put a pin in the bayer mode part of this conversation.
