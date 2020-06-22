Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8802041F3
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 22:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbgFVU2g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 16:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728421AbgFVU2g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 16:28:36 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15511C061795
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 13:28:36 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id t132so10430078vst.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 13:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/mKQob2TcXV+3bi2u2MxE4v2x49LHk6pqKAA851megE=;
        b=lRzqiLuRgFSf5qcalDvWRL4YbaOQjHCkIkS1z5jnftIuujWTgyicIdl0B3e48B1VQc
         jxfPF2B38RxGI3M1N+8iAp8EJBK/mNFW88o9CRBomgNN3BbrS8IK5fgOjUfRWAReLCVZ
         hXzlEE7ISDIQaPItEDQ0AnroKyoMxwdSONEfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/mKQob2TcXV+3bi2u2MxE4v2x49LHk6pqKAA851megE=;
        b=NkXd7ENasCttec+Qec4HSh0W4a2hOjy+3wXyOKzd6a0zOrqWVt7q9FZvmShxkfNJUL
         xwKlx+I7y/PEYZX1PxCMvA85iXKcweY27V9x6eDr1x8LkQSi5V/rOHnoJAgF3BY4V64T
         TPATuIcKYQF9E5tJGd6PS3ykCzNmgYuhsxQ26FVmVQQe6MShAKZG6a37iGDG8bRy/MLh
         YldAGuWkmkEf2Cx76YZTIGrFsnfXXlZcPVTCwI0wGaQfvUrop1juxemralECDQdChf0V
         /gMeYV1J3AOEayEWEy67ugBKmRaCePTw3NK8AlITbKwu3L1x2hY9sKAbeStaSCQXDMl6
         K1DQ==
X-Gm-Message-State: AOAM530nTmxOOXiM4aMj8ZRn1mYBmPmFC3hS5+pVZ9rC5RZYf0wJAw+G
        dmlUqi5B5cUCnKKlGb4iyAqpBcJfUs0=
X-Google-Smtp-Source: ABdhPJzymGMx4Hv5NdCp2oIe0APplysycz6y9tMu78KfGTBcoLhkhJ75fgDfE3cIjQz6ZLRUBgX1cw==
X-Received: by 2002:a05:6102:802:: with SMTP id g2mr6525063vsb.142.1592857714006;
        Mon, 22 Jun 2020 13:28:34 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id g10sm1899119vsa.2.2020.06.22.13.28.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 13:28:33 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id r5so7874937vso.11
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 13:28:33 -0700 (PDT)
X-Received: by 2002:a67:62c4:: with SMTP id w187mr15458333vsb.109.1592857712942;
 Mon, 22 Jun 2020 13:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200622121548.27882-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20200622121548.27882-1-stanimir.varbanov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 Jun 2020 13:28:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WF4Sc5yDRc0FgtkqVvDr3brXA7ttTFU6nozCNwBfSQ9w@mail.gmail.com>
Message-ID: <CAD=FV=WF4Sc5yDRc0FgtkqVvDr3brXA7ttTFU6nozCNwBfSQ9w@mail.gmail.com>
Subject: Re: [PATCH v3] venus: fix multiple encoder crash
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        "# 4.0+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, Jun 22, 2020 at 5:16 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> From: Mansur Alisha Shaik <mansur@codeaurora.org>
>
> Currently we are considering the instances which are available
> in core->inst list for load calculation in min_loaded_core()
> function, but this is incorrect because by the time we call
> decide_core() for second instance, the third instance not
> filled yet codec_freq_data pointer.
>
> Solve this by considering the instances whose session has started.
>
> Cc: stable@vger.kernel.org # v5.7+
> Fixes: 4ebf969375bc ("media: venus: introduce core selection")
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>
> v3: Cc stable and add Fixes tag.
>
>  drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++++
>  1 file changed, 4 insertions(+)

The code is the same, so carrying over my tested tag [1]:

Tested-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=FV=Vt8je1AtT8id-rPC3JToF_7uGKpC-uDuSpzCkwi3e4Sw@mail.gmail.com/
