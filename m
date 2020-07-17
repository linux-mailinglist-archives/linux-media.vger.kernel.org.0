Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CE522436B
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 20:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbgGQS4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 14:56:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:59454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727821AbgGQS4W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 14:56:22 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 282992076A;
        Fri, 17 Jul 2020 18:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595012182;
        bh=I9y75J42IaBzL+25s+fqD6Tv/7wRsnJAIgF5M/KtE8s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YOgbEyq8cf4E8Nzby24S64YuwCPk30Pyc6TNnN/7KLYSfVxUlRfo1LKhyrR1mxvky
         +WKAv9mBFQCbvz0vPdtusnhCt+1CL9ug4b0T469Si4vy4cJvJHsD2BUfA5WF5cfTXu
         Ip34uThPZIACCqnZWc/Fy2nh0q2P7d7z2nDgCfPo=
Received: by mail-ot1-f49.google.com with SMTP id n24so7584082otr.13;
        Fri, 17 Jul 2020 11:56:22 -0700 (PDT)
X-Gm-Message-State: AOAM530qIsmAXEaTjrYq9QFK+J/sBdSxFgxfeZgVBICnTp8fVmvoLkTP
        YHvAmVgrvKdj8FTidbfMDb2qHeCKrLeWH9eoBw==
X-Google-Smtp-Source: ABdhPJywlK24TqAj8hYZIsgs4xNwf07oJW+ZcpWB866d/ln/mXcc0o7YOwYsKhM3niloEukzN1I53bEoEo12QLx0uaA=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr9524072otb.107.1595012181490;
 Fri, 17 Jul 2020 11:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <1594878139-3402-1-git-send-email-rnayak@codeaurora.org>
 <1594878139-3402-2-git-send-email-rnayak@codeaurora.org> <20200716195913.GA2744252@bogus>
 <cd368ea7-6ddc-004c-164d-dbbad8516853@codeaurora.org>
In-Reply-To: <cd368ea7-6ddc-004c-164d-dbbad8516853@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 17 Jul 2020 12:56:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+RXcgTVwd_JC8YLYb1Ni29zFD9AxcNsmcpyrdefWq3Kw@mail.gmail.com>
Message-ID: <CAL_Jsq+RXcgTVwd_JC8YLYb1Ni29zFD9AxcNsmcpyrdefWq3Kw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: venus: Add an optional power
 domain for perf voting
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 16, 2020 at 11:52 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
>
> On 7/17/2020 1:29 AM, Rob Herring wrote:
> > On Thu, Jul 16, 2020 at 11:12:16AM +0530, Rajendra Nayak wrote:
> >> Add an optional power domain which when specified can be used for
> >> setting the performance state of Venus.
> >
> > The h/w suddenly grew a new power island/domain? Seems like an abuse of
> > power-domains...
>
> The power-domain always existed, we have just managed to survive without
> having venus support DVFS and have the domain always be at a high performance
> level (set statically by boot code)
> Now, if we care to do DVFS and support better PM on the SoC, its important
> for the devices to manage this additional power domain (and dynamically
> scale it)
>
> That said, if the name 'opp-pd' makes it look like a software construct,
> like Bjorn mentioned, I am fine to give it a real name like 'cx-pd'
> Does that sound good?

He suggested 'cx' as '-pd' would be redundant. I have no idea what
'cx' means, but fine.

> PS: Like I mentioned earlier [1], cx is a shared power island,
> not a power island specific to this block, and definitely not a software
> pm-domain construct.

Put this context/detail into your patches. Assume I don't remember
what happened last week.

Unfortunately, gmail seems to have no way to filter on unread mails in
reply to my replies and doesn't move the thread up in 'Sent' filter,
so older threads get lost.

Rob

> [1] https://lore.kernel.org/patchwork/patch/1241077/
