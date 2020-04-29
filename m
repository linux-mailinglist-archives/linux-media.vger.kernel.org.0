Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFD21BE4C6
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 19:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgD2RI2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 13:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726456AbgD2RI2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 13:08:28 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2CF1C035493
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 10:08:27 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id y4so3418079ljn.7
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2F/GGX+E0c0+b/vD1LG0X0Imv+S43d6dDOK/FkPT3g8=;
        b=jNkYpc6S0ZAt1d7I3WBLADvu8AvAoumyVfy15MqXYeffwC+o4Cob9YDhPtMZ8QWvH+
         NIwdCDYO3Ztb8zQ3NlSssEXDT66TreFG8fQZFp2Sf/GUZvt3pdbYSGtLKGnxRX+tQTcQ
         zb1kabUEdqdEgPGAX3PG8+MATiYMctEl87v0wIV8vw6cs9cJg5IaVwlKG6Zfiv5akn75
         jDsY1e2YbK6YsNoc8BmOCB3Kw7UeY8zYQ1iUdKYUGLuug2TQemrSwaCGKE4Xe4nS9V9P
         WBX0kvYhtVFlazgSsG0wd6v0mt1vwy7k9/83/pCmG6nJkn1eoGUkQmSC02Cnl2AeuK8+
         nCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2F/GGX+E0c0+b/vD1LG0X0Imv+S43d6dDOK/FkPT3g8=;
        b=l6d3dBN131Xi25OFm+I++ut2pKjzRhXlqSCVowXZpc+ZzDcwYL1IVa2swZ01A1fs/G
         fyNxlqS81MQotjekeoDIAje9S9gw8fZQp84/LQAQPdq0+TMX434pBatl8n1J2ZGCa8xH
         0iw/wD5ttP3ML+5M4rJ20joa698aPZLd0VyIdyyVT0urKbDZ5KZN3omD1wCnHhLKqzfi
         h6c7WsKt2BGMB5CondlABmCCeZqv6LML/0xMQ4FMJ5mKVx6ORV5wAoxT6S87pdkHnFla
         3XnhOrKqy7hqyGukuZcrMxW7aWHqFOAALgeLc2cFtb7gHNNmZtNk38h/JUtf3ARoMQ99
         1kQQ==
X-Gm-Message-State: AGi0PuYILDuf06CdjkU8HFsNEI6do/FtxyIiJYfFAlhflcKr5CkhJpET
        Hrh3pdRdI/Em0K86+XDNINp6MyuFjgmFO/K4/oAPQA==
X-Google-Smtp-Source: APiQypI/p8hMCfeSVM1tpb+Hmphas9b6HroclmJaxP7F1hxtSeUvsqPKT++NGG1tH/H5GveF7lU55+kiTYZblxp87+I=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr20607906ljg.21.1588180106288;
 Wed, 29 Apr 2020 10:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200424114058.21199-1-benjamin.gaignard@st.com> <7657495.QyJl4BcWH5@kreacher>
In-Reply-To: <7657495.QyJl4BcWH5@kreacher>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Wed, 29 Apr 2020 19:08:14 +0200
Message-ID: <CAKfTPtBNH8x=83RVQajgK859qQGjMTyvEdP4GioMONEZp9t-NA@mail.gmail.com>
Subject: Re: [RFC 0/3] Introduce cpufreq minimum load QoS
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        Viresh Kumar <viresh.kumar@linaro.org>, hugues.fruchet@st.com,
        mchehab@kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        LAK <linux-arm-kernel@lists.infradead.org>,
        Patrick Bellasi <patrick.bellasi@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 29 Apr 2020 at 17:50, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> On Friday, April 24, 2020 1:40:55 PM CEST Benjamin Gaignard wrote:
> > When start streaming from the sensor the CPU load could remain very low
> > because almost all the capture pipeline is done in hardware (i.e. without
> > using the CPU) and let believe to cpufreq governor that it could use lower
> > frequencies. If the governor decides to use a too low frequency that
> > becomes a problem when we need to acknowledge the interrupt during the
> > blanking time.
> > The delay to ack the interrupt and perform all the other actions before
> > the next frame is very short and doesn't allow to the cpufreq governor to
> > provide the required burst of power. That led to drop the half of the frames.
> >
> > To avoid this problem, DCMI driver informs the cpufreq governors by adding
> > a cpufreq minimum load QoS resquest.
>
> This seems to be addressing a use case that can be addressed with the help of
> utilization clamps with less power overhead.

Can't freq_qos_update_request() be also used if you don't have cgroup
enabled on your system ?

>
> Thanks!
>
>
>
