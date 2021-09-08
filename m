Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E653404099
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 23:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234941AbhIHVnH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 17:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233502AbhIHVnG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 17:43:06 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15929C061575
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 14:41:58 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g21so4889999edw.4
        for <linux-media@vger.kernel.org>; Wed, 08 Sep 2021 14:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8l9J1CZcA1+c+q5qGgiKd78GEd6eEjP9WF5NOkb266c=;
        b=QeXEXrG5RA9S1O7Q35LBdLmcEhPeR6HUZo/VnzbGPHiB66zHv7l+QXEUP7RT+wItqc
         Lx8C2S1fZAdYRg1XCzcNITDhhwY3WwHSdwGgpcNTyJ2ggIYTrZrtrz8ToWNfO6N6MLgO
         fgjM29tD9zsS2ZLDBjgIzVnHC23sAwnwLDHC1OE+15k+W3Hutg3iu+F8mBMuHTXaIRRF
         kmZol/r/1qsFRvWk9abSqQmo/wmqbM1NBQycCr7fE/EXoT5ZY4qi66oih59BRFVnWO3k
         f6CLSuYXNZ4ELV3PNMLK9XDLR8cpZ9rPDpEWLHt/QIRdE7eRzvqt4Di2owfoifby7USC
         Gk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8l9J1CZcA1+c+q5qGgiKd78GEd6eEjP9WF5NOkb266c=;
        b=R7t8DsNUgRv5nwY2bVX9I/Ur8T6WRQJ+e819uwEx6q9sQoIUPjQ2Sp0D5OkWHreQXr
         5NH2e93s9ToLjeglgqQwtzU3jAStBSGK2E2QgFB4UaOqq2f+lEL+/hEkPAAZ/Yu9ZMWZ
         O5V2cn6zEAEShECTx2HEYQxMfPM1HnhdsF/WtM0RLgYA/kXmDZK/M2w0vtTFu/2Pw+aJ
         SOEhmhUHRg8lQFpdjZvIgHbgDcVs8jWVo8HLCpizvMd3/y/tdDbXTFeGift5s2XvPYF0
         Z4ns60TqA0wZBAZarkK+2JlU3zJOmj/94hoGeeuvdv5KlHsxyPQDVB4DUpdLnZ6IVIgm
         +Khw==
X-Gm-Message-State: AOAM530HNmlX8CJkytNahXipJmgiwcxNQ4T0XIL3J9GxGrmnDSi8LgQ6
        rHchlY7tHRFy7IaCLE2tx4gTL++Fp3WKbGInm/MI9w==
X-Google-Smtp-Source: ABdhPJztqzpQz2HTTEXV/2dRmg79Ewo2SWDdk0EoVY0M45DJ8Mxj2SMAzWJiRpVu2JWLHCo7bPPsjltBvmghjZu7tzU=
X-Received: by 2002:aa7:db10:: with SMTP id t16mr336962eds.357.1631137316633;
 Wed, 08 Sep 2021 14:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <cecdec24-d3ed-1bab-5144-018f685b9374@xs4all.nl>
In-Reply-To: <cecdec24-d3ed-1bab-5144-018f685b9374@xs4all.nl>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 8 Sep 2021 18:41:45 -0300
Message-ID: <CAAEAJfCWA6785TTSDweFFWGkCmxjx7JS-OJ1tOcMu21j35+V0A@mail.gmail.com>
Subject: Re: [RFC] Move meson/vdec out of staging?
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Neil,

On Fri, 30 Apr 2021 at 03:52, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Neil,
>
> Is there anything still keeping meson/vdec in staging? The TODO says:
>
> "This driver is in staging until the V4L2 documentation about stateful video
> decoders is finalized, as well as the corresponding compliance tests.
>
> It is at the moment not guaranteed to work properly with a userspace
> stack that follows the latest version of the specification, especially
> with compression standards like MPEG1/2 where the driver does not support
> dynamic resolution switching, including the first one used to determine coded
> resolution."
>
> Certainly the first part is done, so what is the status of the second part?
>
> It would be nice to move this out of staging, or, if that is not possible,
> at least update the TODO file and ideally have someone work on the remaining
> issues.
>

Is dynamic resolution switching really a reason for the driver to remain
in staging?

AFAIK, the stateful decoder API is now finished, there are a couple
drivers that implement it, do we have reasons to believe meson is not
at the same level?

I don't have Amlogic hardware but I suspect the driver is now
mature for the promotion.

Thanks,
Ezequiel
