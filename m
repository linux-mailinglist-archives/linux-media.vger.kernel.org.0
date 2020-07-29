Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB75232657
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 22:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgG2Ulv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 16:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2Ulu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 16:41:50 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3319FC061794
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 13:41:50 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a9so2574542pjd.3
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 13:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YvzhXhs+JqZkgfJI4360duB0MXbYsCTMFViWzLaBlaY=;
        b=ebUQVAeh8oE9FLMF9AsZ87X4Bi3SZ95sD+qPv7yxrGQmqc+m4ZVd8/q1WbFVTG4dSa
         9oackYGLw45aqQ7gFTRCKhWBkluwx4XZYOm5TTgTGBg/Zb+PslBiRvk7seA/bm+2DjWu
         M//BLJQkWMKgRBOUqc3roEaOE3dDfQQyuSMJAsMERWRsPgV0Tg0ri3BEgzZ9PI9zIw/9
         9qdREY/BrrI9H3juf0wAXWPAo68hTJr9IPs7rdCr1lEZl1HCPlEl3KCYE+vnhdoVU+8q
         A+k4GiJbHiwlx5wHARK8m26FHHJvh/mVeLTQh5Vo/bpg5omN1TcDTh2Wd9t3YHCvFjgg
         TBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YvzhXhs+JqZkgfJI4360duB0MXbYsCTMFViWzLaBlaY=;
        b=XDsN5Aycssx1f3teZ0KdXxXCNWfpzezoWSO3/XbNjdUUKl8DZ7u5Ugk80GzeT8YRx8
         w4476XpqqC1kj+qW8rLgm0R3dy8dMAf8pwgcU2/5Ow/HvTdaEmWG7dBtFsiCyN+h5u6A
         7XzKQmlEq58m3bKgdmXuVasnvB5yLKveiW8I3pK5aXSBKUHdBMPSh2dV6as7KCbKjJ/4
         ydEFWNdJypJpgh/Ix0UJ4bOpxlKYrwhMSdOH5wge9ptDwfGfnwbV9CsrVPtiyrsKq+Ml
         NV7VKn/3W/tXbdxjUPwOcd81lHQiMXGvHpOSsMW965Hi+2M+kuITbEUy2SxsKJSO98PY
         7M0w==
X-Gm-Message-State: AOAM532SmNhWEYdyazuCSs8FEMzehdolPcs/qRl0Jqk/AyNQBNV0W9RL
        oOf/L9pY1082MzZvOWxekhZbDg==
X-Google-Smtp-Source: ABdhPJwsED3u/CI8qpXKMn9KJe3biAkdbIN+MAMnL/4+m7CEx4Qr6JR9g57bHrdOIP94RHn84laC3g==
X-Received: by 2002:a17:90a:ef17:: with SMTP id k23mr260429pjz.45.1596055309594;
        Wed, 29 Jul 2020 13:41:49 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s30sm3448581pgn.34.2020.07.29.13.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 13:41:48 -0700 (PDT)
Date:   Wed, 29 Jul 2020 13:38:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
Message-ID: <20200729203820.GK229995@builder.lan>
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org>
 <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
 <654e0fcb-ae4d-c151-fa8a-4d029fc823fb@codeaurora.org>
 <20200724162825.GH9185@codeaurora.org>
 <159589714088.1360974.13205114501389777927@swboyd.mtv.corp.google.com>
 <20200728165212.GA32586@codeaurora.org>
 <159596590401.1360974.283437162250734878@swboyd.mtv.corp.google.com>
 <20200728201133.GB32586@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728201133.GB32586@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue 28 Jul 13:11 PDT 2020, Lina Iyer wrote:

> On Tue, Jul 28 2020 at 13:51 -0600, Stephen Boyd wrote:
> > Quoting Lina Iyer (2020-07-28 09:52:12)
> > > On Mon, Jul 27 2020 at 18:45 -0600, Stephen Boyd wrote:
> > > >Quoting Lina Iyer (2020-07-24 09:28:25)
> > > >> On Fri, Jul 24 2020 at 03:03 -0600, Rajendra Nayak wrote:
> > > >> >Hi Maulik/Lina,
> > > >> >
> > > >> >On 7/23/2020 11:36 PM, Stanimir Varbanov wrote:
> > > >> >>Hi Rajendra,
> > > >> >>
> > > >> >>After applying 2,3 and 4/5 patches on linaro-integration v5.8-rc2 I see
> > > >> >>below messages on db845:
> > > >> >>
> > > >> >>qcom-venus aa00000.video-codec: dev_pm_opp_set_rate: failed to find
> > > >> >>current OPP for freq 533000097 (-34)
> > > >> >>
> > > >> >>^^^ This one is new.
> > > >> >>
> > > >> >>qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
> > > >> >>
> > > >> >>^^^ and this message is annoying, can we make it pr_debug in rpmh?
> > > >> >
> > > >> How annoyingly often do you see this message?
> > > >> Usually, this is an indication of bad system state either on remote
> > > >> processors in the SoC or in Linux itself. On a smooth sailing build you
> > > >> should not see this 'warning'.
> > > >>
> > > >> >Would you be fine with moving this message to a pr_debug? Its currently
> > > >> >a pr_info_ratelimited()
> > > >> I would rather not, moving this out of sight will mask a lot serious
> > > >> issues that otherwise bring attention to the developers.
> > > >>
> > > >
> > > >I removed this warning message in my patch posted to the list[1]. If
> > > >it's a serious problem then I suppose a timeout is more appropriate, on
> > > >the order of several seconds or so and then a pr_warn() and bail out of
> > > >the async call with an error.
> > > >
> > > The warning used to capture issues that happen within a second and it
> > > helps capture system related issues. Timing out after many seconds
> > > overlooks the system issues that generally tend to resolve itself, but
> > > nevertheless need to be investigated.
> > > 
> > 
> > Is it correct to read "system related issues" as performance problems
> > where the thread is spinning forever trying to send a message and it
> > can't? So the problem is mostly that it's an unbounded amount of time
> > before the message is sent to rpmh and this printk helps identify those
> > situations where that is happening?
> > 
> Yes, but mostly a short period of time like when other processors are in
> the middle of a restart or resource states changes have taken unusual
> amounts of time. The system will generally recover from this without
> crashing in this case. User action is investigation of the situation
> leading to these messages.
> 

Given that these messages shows up from time and seemingly is harmless,
users such as myself implements the action of ignoring these printouts.

In the cases I do see these messages it seems, as you say, to be related
to something happening in the firmware. So it's not something that a
user typically could investigate/debug anyways.


As such I do second Doug's request of not printing what looks like error
messages unless there is a persistent problem - but provide some means
for the few who would find them useful..

Regards,
Bjorn

> > Otherwise as you say above it's a bad system state where the rpmh
> > processor has gotten into a bad state like a crash? Can we recover from
> > that? Or is the only recovery a reboot of the system? Does the rpmh
> > processor reboot the system if it crashes?
> We cannot recover from such a state. The remote processor will reboot if
> it detects a failure at it's end. If the system entered a bad state, it
> is possible that RPMH requests start timing out in Linux and remote
> processor may not detect it. Hence, the timeout in rpmh_write() API. The
> advised course of action is a restart as there is no way to recover from
> this state.
> 
> --Lina
> 
> 
