Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C83322FE8E
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 02:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgG1Apo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 20:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgG1Apn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 20:45:43 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5FEC0619D2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 17:45:43 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x9so9038752plr.2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 17:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=s70EzhyKxlSAhKM0fGvVkhFo9EQqTJUAHiD+GN3KFyY=;
        b=GL3pxdKwFAqDwcC70W3bfx0WaxfsDTCgWZUptaqnjsi+7wfqgco+NzxxWYcRtSTbjd
         p71BHGqPKa4dO4omjvEfs7PhwW/bf/o7aLBkZCgQYqehshdyVE+Z2RjwkFE7m9UsxX/A
         pylQ2LOc+i18U/0AFf6akH2k6IqQtprx5XooU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=s70EzhyKxlSAhKM0fGvVkhFo9EQqTJUAHiD+GN3KFyY=;
        b=JLsdu3SIcyFcSE9gSN9CuIAI+pQo2DB2natFC1KH9CwKTLv9wps9JNDhkLhd/64Syj
         2w8Im6O0LDT1vX0s3JKGqGnuccOnRMFq2y7qmbY6adbWHK3ysugQqzhENDbM9l/KUfCs
         vOH/+n1fMStc5SL03bzde1BTz/eLqAzQePonrcVqzRu6RWcsPxOeUj9EbYO9S844xfGt
         NR5sEP6SJ4eaqwILQa46K7MRYLr/Bnz/tCCOvCWRKGtTQw91Rv0RyXKF51sQgsKjXaqf
         jiNA6MGJ7YDImWeEdTeMVv7EUTP2qzVmIPwVPhBjbyq/xDOmIkRnFZOZkpCcaTj3IEUE
         ZSAQ==
X-Gm-Message-State: AOAM530pNxOmYZxTLDnlaWd3z66VGgWHBFGgjnQMZ5T9mG20X7ujAtIj
        jc+CuzPnEoNKtgRgaUfFcPXMFg==
X-Google-Smtp-Source: ABdhPJxCf2EOAHBqt4YuTnwoVAvGCzFPk6dO2ccTlQJK+FF78kSqwS6oIuKqghsVCIj+Jy8HtOIPPg==
X-Received: by 2002:a17:90b:11ca:: with SMTP id gv10mr1862049pjb.19.1595897142954;
        Mon, 27 Jul 2020 17:45:42 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id t5sm15636757pgl.38.2020.07.27.17.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 17:45:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200724162825.GH9185@codeaurora.org>
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org> <1595503612-2901-5-git-send-email-rnayak@codeaurora.org> <e68ff810-362a-5b99-206b-f676b204101d@linaro.org> <654e0fcb-ae4d-c151-fa8a-4d029fc823fb@codeaurora.org> <20200724162825.GH9185@codeaurora.org>
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and power-domains for venus
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Maulik Shah <mkshah@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Date:   Mon, 27 Jul 2020 17:45:40 -0700
Message-ID: <159589714088.1360974.13205114501389777927@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Lina Iyer (2020-07-24 09:28:25)
> On Fri, Jul 24 2020 at 03:03 -0600, Rajendra Nayak wrote:
> >Hi Maulik/Lina,
> >
> >On 7/23/2020 11:36 PM, Stanimir Varbanov wrote:
> >>Hi Rajendra,
> >>
> >>After applying 2,3 and 4/5 patches on linaro-integration v5.8-rc2 I see
> >>below messages on db845:
> >>
> >>qcom-venus aa00000.video-codec: dev_pm_opp_set_rate: failed to find
> >>current OPP for freq 533000097 (-34)
> >>
> >>^^^ This one is new.
> >>
> >>qcom_rpmh TCS Busy, retrying RPMH message send: addr=3D0x30000
> >>
> >>^^^ and this message is annoying, can we make it pr_debug in rpmh?
> >
> How annoyingly often do you see this message?
> Usually, this is an indication of bad system state either on remote
> processors in the SoC or in Linux itself. On a smooth sailing build you
> should not see this 'warning'.
>=20
> >Would you be fine with moving this message to a pr_debug? Its currently
> >a pr_info_ratelimited()
> I would rather not, moving this out of sight will mask a lot serious
> issues that otherwise bring attention to the developers.
>=20

I removed this warning message in my patch posted to the list[1]. If
it's a serious problem then I suppose a timeout is more appropriate, on
the order of several seconds or so and then a pr_warn() and bail out of
the async call with an error.

[1] https://lore.kernel.org/r/20200724211711.810009-1-sboyd@kernel.org
