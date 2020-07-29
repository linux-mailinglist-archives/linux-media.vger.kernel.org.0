Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D76EE232474
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 20:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgG2SK7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 14:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbgG2SK7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 14:10:59 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CFFC0619D2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 11:10:58 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id w22so8033907vsi.3
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 11:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uCoModElWAnbMRvPO3YU9XQVQgftZ0hKK53c1cAKSbs=;
        b=QIBt/1ooWx13u1wuOLTIXdWssccajDzsKyxD32hHiHwZrVsqw/Iw9vLsv8+Z8E4gEy
         iEiguY8ka10wGb70eyABHcDiVLisSk0H3fV6NvNFulhN68llC5a9dvZPNtFPxwp3L5Ad
         AC9vJlcYBsOaBTsD4WtfRj2yMEjviNinT33WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uCoModElWAnbMRvPO3YU9XQVQgftZ0hKK53c1cAKSbs=;
        b=MjP4DPOOA8a44dMuVfFfjCzFR8cxDrTT1OU+jwXR6v9Ce0EJo0M2efjFE9tMzjaVK4
         fW0mOd3gwD1nuJ0Wa1lfbfwx9CjRePp6+OlD3sQ8tV6NRxBfqccGUGW/aYqcYwg/c27d
         tSvExHJhA+P7IhQ2jNHPDKddajmcDTNBq6qTYGCaz9pR+jibB8nLQbNZtspnwnoYiJ+W
         2pBRXMI4FfdDTbVcfyBEBeIwtNpMBiVJlFTXbl6gd5a1ZhjYgDId3v0Q6fBYnyHxKc/5
         pR8S5S8JcY4x+mj0wAQuf2+vwi/bFcWfk31D+K1DKChJqIzzCxAUh7gQPDUZ1SNgLaJ0
         OMYw==
X-Gm-Message-State: AOAM531u+KBmGmqqcHP7S5LtR+ieEdYAEuy0VzR82i3bIKsUC6g86PhI
        J+SOlozGxoA5LOm2k++V8LW86bL9Yg4=
X-Google-Smtp-Source: ABdhPJyhZk/nCrehBpJ1EdQE/ttY/eihztgCLjdiEB+PE3M2rAWNERMMByIuaSBDdBrs8lommKh5HA==
X-Received: by 2002:a67:e412:: with SMTP id d18mr6177594vsf.41.1596046257708;
        Wed, 29 Jul 2020 11:10:57 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id j23sm367351vke.45.2020.07.29.11.10.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 11:10:56 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id c197so3448657vkc.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 11:10:56 -0700 (PDT)
X-Received: by 2002:a1f:9f17:: with SMTP id i23mr23539610vke.65.1596046256240;
 Wed, 29 Jul 2020 11:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org> <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
 <654e0fcb-ae4d-c151-fa8a-4d029fc823fb@codeaurora.org> <20200724162825.GH9185@codeaurora.org>
 <159589714088.1360974.13205114501389777927@swboyd.mtv.corp.google.com>
 <20200728165212.GA32586@codeaurora.org> <159596590401.1360974.283437162250734878@swboyd.mtv.corp.google.com>
 <20200728201133.GB32586@codeaurora.org>
In-Reply-To: <20200728201133.GB32586@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 29 Jul 2020 11:10:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XB8jqq+WGHL4czvZ96kPMpAB5wkkN9tx4++o=a2i4DXQ@mail.gmail.com>
Message-ID: <CAD=FV=XB8jqq+WGHL4czvZ96kPMpAB5wkkN9tx4++o=a2i4DXQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, Jul 28, 2020 at 1:11 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
> On Tue, Jul 28 2020 at 13:51 -0600, Stephen Boyd wrote:
> >Quoting Lina Iyer (2020-07-28 09:52:12)
> >> On Mon, Jul 27 2020 at 18:45 -0600, Stephen Boyd wrote:
> >> >Quoting Lina Iyer (2020-07-24 09:28:25)
> >> >> On Fri, Jul 24 2020 at 03:03 -0600, Rajendra Nayak wrote:
> >> >> >Hi Maulik/Lina,
> >> >> >
> >> >> >On 7/23/2020 11:36 PM, Stanimir Varbanov wrote:
> >> >> >>Hi Rajendra,
> >> >> >>
> >> >> >>After applying 2,3 and 4/5 patches on linaro-integration v5.8-rc2 I see
> >> >> >>below messages on db845:
> >> >> >>
> >> >> >>qcom-venus aa00000.video-codec: dev_pm_opp_set_rate: failed to find
> >> >> >>current OPP for freq 533000097 (-34)
> >> >> >>
> >> >> >>^^^ This one is new.
> >> >> >>
> >> >> >>qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
> >> >> >>
> >> >> >>^^^ and this message is annoying, can we make it pr_debug in rpmh?
> >> >> >
> >> >> How annoyingly often do you see this message?
> >> >> Usually, this is an indication of bad system state either on remote
> >> >> processors in the SoC or in Linux itself. On a smooth sailing build you
> >> >> should not see this 'warning'.
> >> >>
> >> >> >Would you be fine with moving this message to a pr_debug? Its currently
> >> >> >a pr_info_ratelimited()
> >> >> I would rather not, moving this out of sight will mask a lot serious
> >> >> issues that otherwise bring attention to the developers.
> >> >>
> >> >
> >> >I removed this warning message in my patch posted to the list[1]. If
> >> >it's a serious problem then I suppose a timeout is more appropriate, on
> >> >the order of several seconds or so and then a pr_warn() and bail out of
> >> >the async call with an error.
> >> >
> >> The warning used to capture issues that happen within a second and it
> >> helps capture system related issues. Timing out after many seconds
> >> overlooks the system issues that generally tend to resolve itself, but
> >> nevertheless need to be investigated.
> >>
> >
> >Is it correct to read "system related issues" as performance problems
> >where the thread is spinning forever trying to send a message and it
> >can't? So the problem is mostly that it's an unbounded amount of time
> >before the message is sent to rpmh and this printk helps identify those
> >situations where that is happening?
> >
> Yes, but mostly a short period of time like when other processors are in
> the middle of a restart or resource states changes have taken unusual
> amounts of time. The system will generally recover from this without
> crashing in this case. User action is investigation of the situation
> leading to these messages.

While I do agree that seeing the "TCS Busy, retrying RPMH message
send" message printed a lot was usually a sign that something was
wrong in the system (possibly someone was spamming RPMh when they
shouldn't be), it still feels like we need to remove it.
Specifically, the prints would also sometimes come up in normal usage
and always sounded a bit scary.  These types of prints always confuse
people and lead to log pollution where it's super hard to figure out
which of the various things in a log are "expected" and which ones are
relevant to whatever issue you're debugging.

Presumably we could either change that from a "info" level to "dbg"
level.  ...or we could find some other thing to check for that's a
better signal of problems.


> >Otherwise as you say above it's a bad system state where the rpmh
> >processor has gotten into a bad state like a crash? Can we recover from
> >that? Or is the only recovery a reboot of the system? Does the rpmh
> >processor reboot the system if it crashes?
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
