Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9518F44BEA2
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 11:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhKJKcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 05:32:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbhKJKcx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 05:32:53 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FAADC061764
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 02:30:06 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id g18so2274127pfk.5
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 02:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rtnO7Bm6moxapJOpDmqW3UadGBsmBZSmf1oZQVTs5BY=;
        b=P3Zjx0Hyq+32RzMf/e+0TH7R6bZPDc1VQVGRm6mJklPXjJ3E2y7zll3a/h5hwzInd2
         d63C9cHfkm618jGYGz2nEbxTURHcRncu7AQy7kda908zmtTJmYdpod2M+GxzBQkOgAaW
         3pyJW9FPadAoWPwK/fx0Dc1zYve3/+A99znjsQy0RNF26CBDA/mW1FQOyXjer+8hdQVg
         KHPaswheEtKBH09v60AmcUAH3/2TMbbowGDQYdmswgZ4HnwD6jwN7jpBmhO36SZb2VhP
         uAzn+IF5SvZbDi5vO8caloxssl1Sqt0FspfoohNqFJyd62Cg6vs5JINLSu6arcJ/cviJ
         L0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rtnO7Bm6moxapJOpDmqW3UadGBsmBZSmf1oZQVTs5BY=;
        b=yQPGNPLFLZnJ0DhQ4QtsV5pYYLk+XZpWoT8t5UaxdZzxRXhmJlazPMoMgn7Rt0+Ddu
         utdSQCjHBXkE1Ot/r4jt8gnd/ibwmlN1aEwp2AyzZER80kzEo5cbsvr/e0Ij4p7ZoYwn
         OGTdT0oGneXKUkV6e53nWE7aNbxl6yH9LcDymUcuSdCXMunlWHx4+UfpSX3qDbEJCTBw
         rpsazxq9sFKMQT1Ieq5lpoFoNQHv2VXyrNRUHZ/j5Jg2IbZQQvJxmD4zzwN0KaCRRSVJ
         iTuYxxGvMUQg65VIej1mJZXriBaU3wSxk/PHwRHWO4erGSvGJAjil442Fc4y3UYDlwEm
         Wavw==
X-Gm-Message-State: AOAM533tErz41WFZXEhglPVm8lzDqy4J/Uxu7dCvYn5WV2z/elMsOqQv
        SWowOAb2NIGCKx+7KBFZgeOAJCYbWPEHvbELGUFUug==
X-Google-Smtp-Source: ABdhPJybXxLo5OYv4x3FX2EtYjPECd+qMB38G5dsYqeB2wevijTEozvPGP7GKTPKRoWDFUr1d6wpqdx/mT+1NE8lE1U=
X-Received: by 2002:a63:9518:: with SMTP id p24mr11113932pgd.80.1636540205425;
 Wed, 10 Nov 2021 02:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com> <20211109125030.26299-4-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-4-yunfei.dong@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Wed, 10 Nov 2021 18:29:54 +0800
Message-ID: <CA+Px+wXw96jDAbtuJ-Mt5MnY9D4xPX-6wGZq5U_hwhrg+5UNPA@mail.gmail.com>
Subject: Re: [PATCH v9, 03/19] media: mtk-vcodec: Refactor vcodec pm interface
To:     Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 09, 2021 at 08:50:14PM +0800, Yunfei Dong wrote:
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

s/B/b/, the suggested tag name is "Reviewed-by"[1].

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
