Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3312A02A9
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 11:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgJ3KSa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 06:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgJ3KS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 06:18:27 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A952C0613D7
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:18:27 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id k27so6114130oij.11
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IwY6FSEEQBoBQdBLoaBkXQfT/X+1XphfDMCbhC85FPE=;
        b=DvmaArxE3OLEtqflsjntfLlw/Wss53+p2/dgBLUeQywMt9TgtmFviI9Ck1dtZoxs0S
         osEpDNFeaFdOpCvTmssUE0GQLkrYE7+2oesIMZe3W7dBb3WC9jZOuo94KTIjnbM2W3kP
         7hevmXm2cfinGdnEnBdAJM3QkvRQc5FGjF/jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IwY6FSEEQBoBQdBLoaBkXQfT/X+1XphfDMCbhC85FPE=;
        b=m+di1+XaCIcceZC4LE0tmOFIqi2q5VQMVmOGS1wA0s9+gmacqKyRUH3AwuZCj6apVT
         AQm8BcQ04WWGvir2Ax1cdwAyaYVgehh02dpAGiv4kkcs1KvIchqCPcKu1ctQ5zVCeh78
         DBw0AmhMCf1capQerfHDwTEN44B/EYTvn4+1Guwd4v4hFbp7mDWWhT+G18F2P5tsHlOg
         Xt/5NTyIDSV0P0gv2abHBWf+wNmB6bJsL0Kr5RU8o0wd0zsDiMWJCr10895146bt++UB
         v/wFMTdURjXutPfy+nw6Q0r7bk6F9OK9TKQiK512lfB9TrEI/TA4dgmMIgsw66MxI0N5
         p5xA==
X-Gm-Message-State: AOAM532ybEKI2VOmrFQ7ugBu2JixYwkRZccSEm0a6ZqlEJYdrhBuKSd/
        UKF44ITE91oYP69MuIDt5PWo9wS90ZB9JA==
X-Google-Smtp-Source: ABdhPJxYyF1D+4vtIqX3P/lmxc6DafZ09fR+ftDWU4NrPtJzRs9KNBw6Cq1sgb5NNb6SNY/u1XAehw==
X-Received: by 2002:aca:c410:: with SMTP id u16mr1106949oif.65.1604053106560;
        Fri, 30 Oct 2020 03:18:26 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id a17sm1240176otl.77.2020.10.30.03.18.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 03:18:25 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id l62so489092oig.1
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 03:18:25 -0700 (PDT)
X-Received: by 2002:a05:6808:95:: with SMTP id s21mr1001625oic.55.1604053104887;
 Fri, 30 Oct 2020 03:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201013124428.783025-1-acourbot@chromium.org> <20201013124428.783025-2-acourbot@chromium.org>
In-Reply-To: <20201013124428.783025-2-acourbot@chromium.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 30 Oct 2020 19:18:14 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUscqohRt4v10=L+yM0KO65Ny6DskvG5V549YByVDDgbA@mail.gmail.com>
Message-ID: <CAPBb6MUscqohRt4v10=L+yM0KO65Ny6DskvG5V549YByVDDgbA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: mtk-vcodec: move firmware implementations
 into their own files
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 13, 2020 at 9:44 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> mtk-vcodec supports two kinds of firmware, VPU and SCP. Both were
> supported from the same source files, but this is clearly unclean and
> makes it more difficult to disable support for one or the other.
>
> Move these implementations into their own file, after adding the
> necessary private interfaces.
>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

This should also have included a

Fixes: bf1d556ad4e0 ("media: mtk-vcodec: abstract firmware interface")

Sorry for the omission.
