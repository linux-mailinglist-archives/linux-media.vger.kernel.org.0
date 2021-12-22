Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA74947D40F
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 15:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343645AbhLVO75 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 09:59:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241483AbhLVO74 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 09:59:56 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68092C06173F
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 06:59:56 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so6124675pjj.2
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 06:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=R4fAvto+5kiJhIGMycVJNRIDsGMunfWc3NoA9gToFxc=;
        b=yAYsIew16rDxK2O8IBSr18NkIZNRERvjTpiLlglFWe7mdn+WkOxn6IU5Ar2X5kHWqW
         71UgZbTwcoNT5Olu2zDRURo8mWCi+LY6l3M3D3UXfEZicV7wCMfOj7Op5zDWDfVIx2w3
         CRK/Tf/UZM5tSjXeKNEoQbC9F6PHwtEL0AzoihUU5ccqp0U28BRygvV3N2MKvDNhg5on
         pyYw73E46Vhal0zXq/48c7XQxUPw4ihx2Jlb3TMYhB8cjTOutZEgY+XvDoWnVPBlcFG/
         aBOtJOiU8njTxlHaBeQMLTt8LMz2WSbXCA62sVBTUVYano6heJeY3yrb1IFIEHIMWthq
         DPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=R4fAvto+5kiJhIGMycVJNRIDsGMunfWc3NoA9gToFxc=;
        b=XoEBmqPgbyMcLFtEwZBzvNA6bKbEDZPn3exd5ilJbfSXKtuGDLFOlrHYpJYhU3u5SA
         CqvThwUzhskbbTZlodbseEFurCmGKNLk2k1e26e4akB4+U27AyWcQtIdEKJfbWOs0ceA
         CuUiSjP6jffVsRTdjL1eSIeKE/CoF26tmKuTaingj8i8ktyoxZqa5OW1AV0JS0J0FFQv
         eKiAU/xH59z/bGg/hWLs8DA5g6by9Dp2aOsbzYl10EgWg8FPdFpvubOao3gDZJ7sYRBa
         MT85HHsthOgTuExNQNWPvRcbIr8Mixl/NovpZg+kpAp+ykAa+ZbbSk1JZldm4+7pfvoY
         69gw==
X-Gm-Message-State: AOAM530LQF5vEK1ESv7tjC7Of8fVH/SOdsyNK/TsLl+tGk8OYgRxaMyx
        3d1sIna0wtJUfbXkqPnf8RZ+rxvU8orppqpe1OLYnQ==
X-Google-Smtp-Source: ABdhPJxD+B+hmQU/gZDQgKwOCAzSvQG1Z4rSyD47kKB+7bVpUE/kfF9NRmwJWNjPCxWHnv2nROBlW7MbbxP2zerqXEs=
X-Received: by 2002:a17:90a:a6d:: with SMTP id o100mr1780124pjo.179.1640185195954;
 Wed, 22 Dec 2021 06:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20211206151811.39271-1-robert.foss@linaro.org> <20211206151811.39271-2-robert.foss@linaro.org>
In-Reply-To: <20211206151811.39271-2-robert.foss@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 22 Dec 2021 15:59:44 +0100
Message-ID: <CAG3jFys1MO461TeWMdasVS0B_ya5NU=5mMomchq_nZ+X+v07SQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: camss: csiphy: Move to hardcode CSI Clock
 Lane number
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bjorn: The CAMSS changes related to this series have just been applied
to the media tree, so I think this series is ready to be applied now.

https://lore.kernel.org/all/20211206151811.39271-1-robert.foss@linaro.org/
