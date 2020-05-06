Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088FF1C7C99
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 23:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729979AbgEFVk6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 17:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728621AbgEFVk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 17:40:58 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC661C061A0F;
        Wed,  6 May 2020 14:40:57 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id w2so3440797edx.4;
        Wed, 06 May 2020 14:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LXXs5LjNhXfTMDLlshuYhmrYmHs5uv6Ir1TO6JX74Qw=;
        b=QrhsV9z5Ly7gtxIhu16wP0b+RIj2Cys6z7a/RIhLtLIAYGRmpN0xTUrudpNbfuNwLq
         8aswalpES5l5EEI0geh/NnIEKuJEzh5vXnu3u989LTUOqApWSsOuNzZdHUO4xREim/OU
         283+bvMXk97s2NRNwPfrAYs96I2SlG7JqGH3B+mKna91VGjyZYZAr6piSwOsIKTfM4eL
         g9JT2boMYrni98DIKtHx0gVgBeo2/sVP3qLd1OoVej1/6GovMo0k61if9Wht8yd4eCCj
         cjP2AMER+XK45Cg7MnjUppMkYBvY5xvUUjGe7A/+LZgyA57i92nXTQw/Ci4SL5Rz4tdL
         ACSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LXXs5LjNhXfTMDLlshuYhmrYmHs5uv6Ir1TO6JX74Qw=;
        b=o78gxvcVi5DjbIRMXbtRU9JRSSlYKHkspVFS87vvDN6oNLYgLLjeFn5g/GqnaYkzsQ
         RaFVdqw1i78KmDvkppNFWcMMDWDfAR8vOsyFPtU6ArNcnBZBcp1NhruFCKVFc0p/POzV
         GSqhW4jjc5aJQctZQbWqzAZWUD5dg4632WB3QBWYd1UbWFg0cprhuymzLfnGoJVO7TDX
         gP2tFL1aHe7XTVAenM4LwBE5RgrrWW7GcIItkOHUxodmSBnVV3r8uLODsQiQ/cEUjUOo
         fguLslYq3vS/+jWG4wsnQqD5BDaQDnldGxwhVbIZJPB4De8WvFbYgye5uoKFhAm1y7fP
         sFrw==
X-Gm-Message-State: AGi0PubeZuQy6aM78mKkmKsNY6/TLqgzeW2SpOtctwjbzxTwLQ/SEM7q
        yDBeIGH7PTamx6mNnpiVG/d7Je9XyI2TEsSHafM=
X-Google-Smtp-Source: APiQypJgWIk0ip7ySmymMEWqtUOhgHq7HRKnJvWS8Q9T1ZrhWCiLPpV+NYi8cPogzhd9NXi/bhzkYmUl8zrSjzjMlMU=
X-Received: by 2002:aa7:db0b:: with SMTP id t11mr8508257eds.304.1588801256576;
 Wed, 06 May 2020 14:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200501203505.144362-1-konradybcio@gmail.com> <1bd1e0ea-0be3-340c-9c2a-0e7a03017cc4@linaro.org>
In-Reply-To: <1bd1e0ea-0be3-340c-9c2a-0e7a03017cc4@linaro.org>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Wed, 6 May 2020 23:40:20 +0200
Message-ID: <CAMS8qEWGX-55yGfd4QGO9OE5b2oaaiWdoe1=v2uPVhKJ2LKrZQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for venus on msm8939
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-media@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vincent Knecht <vincent.knecht@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

Unfortunately it seems like I made some mistakes, as I've pointed out
in the reply in [1/2] patch,
and therefore this submission can go to the bin and wait for a v2. But
answering your question
wrt to 8939:

The platform is currently shaping out good, as we can reuse a large
number of 8916 drivers.
At the moment we have 4 out of 8 cores working reliably with
out-of-tree patches (8939 doesn't support psci)
and the latter 8 cores aren't there only because of the core
interconnect not being handled yet
(well they can be enabled but performance goes waaaay down when one does so).
As for other features, I have adreno, iommu, i2c, sdhci and other
basic things like that working,
and Vincent Knecht (cc) with an Alcatel Idol 3 5.5 (same SoC) even
reportedly got USB and
Wi-Fi to work (though we have different hardware in both situations).
Currently Vincent and I have local support for the aforementioned
Alcatel, Asus Zenfone 2 Laser
1080p (Z00T) and partial support (as in no panel yet) for Sony Xperia
M4 Aqua with Linaro
folks preparing some drivers (like GCC) for an unknown-to-me 8939 board
(or perhaps a phone, too?). I already pushed Adreno 405 enablement to
mesa, too and it's
going to be there in the next release, so this platform will only get
better from now.

Konrad
