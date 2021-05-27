Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCF3392B7A
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 12:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236083AbhE0KML (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 06:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236100AbhE0KMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 06:12:06 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A86FC061760
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 03:10:32 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id p20so41800ljj.8
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x4yEjCZpjXjlLtm8fIGk3hS7YCL51ZB0U7PousVU3z0=;
        b=ehfhag2ColEd2R3+qduQ1URjFhb+8Dy6hnhyDGq+Z/YorltmfPecHA0Qzss59HJrj5
         6PzCTDrPNFTQmDDJI9s/Ic5C6WRxC1A2y+095uulcjneTfYYKOUIZeTUv+fv8EvvR86q
         0VemvTJREFYEOfXJ8XtOcP4X+X38X49UwA5ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x4yEjCZpjXjlLtm8fIGk3hS7YCL51ZB0U7PousVU3z0=;
        b=jRNeldtLzT7uO3iGFJ1PDQGfrICvx+RYhgCcMISRxo/Uzxxcr18lTJfQ9FUOdzFz5b
         BlXB8RKkk+5rRD5NMKPd61751YKSS6OaJQtnKXiyBswVxsw+HOaRYOFG0anFjo+7SpCd
         K7xTcoATp2IsNnxvNzX56y4FqQvyj8KJBJN9GJWoLPwWTj/Q5AUsLEfHW//vRb6+/VgY
         xwA2+PwjVpQy88aW0x9fnHQil0fmuuwFHSKUxsHnp9j7mTfgsVHm/G/7WUKPDPE4o20q
         dUSSV8bbmWxdWdkMAkfnu1UqRgus8caVaev5YYt5Uw7KECVna2vsJDpp0rb7SsOhhJoo
         k+YQ==
X-Gm-Message-State: AOAM5337ggQz1PnJIhroGt9nwr2COmQRtRuCFyEbcqri7H7X3OqvQ52m
        4kopKaaRdFU0hBI5OQAcfJEzhk6ghgoktA==
X-Google-Smtp-Source: ABdhPJw3cuGY36lP5SILh4zKNbmgQbDyks95o9VjTShMyB/MsmTGa6dQiCGssBPprUL4PClZSlDqdw==
X-Received: by 2002:a2e:7a06:: with SMTP id v6mr1912281ljc.219.1622110229836;
        Thu, 27 May 2021 03:10:29 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id y22sm159462lfh.154.2021.05.27.03.10.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 03:10:29 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id v8so7176116lft.8
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 03:10:29 -0700 (PDT)
X-Received: by 2002:a19:6102:: with SMTP id v2mr1818325lfb.403.1622110228818;
 Thu, 27 May 2021 03:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-6-acourbot@chromium.org> <CA+Px+wUaA9o+Aom4weuTH4TDpCfFpxv0YHDArCJswEs6QmCw0A@mail.gmail.com>
In-Reply-To: <CA+Px+wUaA9o+Aom4weuTH4TDpCfFpxv0YHDArCJswEs6QmCw0A@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 27 May 2021 19:10:16 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXnv0g5knZ_KNhTKkwyRh29zQWqKV-vyA+dQyDn4qkMGA@mail.gmail.com>
Message-ID: <CAPBb6MXnv0g5knZ_KNhTKkwyRh29zQWqKV-vyA+dQyDn4qkMGA@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] media: mtk-vcodec: venc: support START and STOP commands
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 21, 2021 at 10:37 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
> <acourbot@chromium.org> wrote:
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > [hsinyi: fix double-free issue if flush buffer was not dequeued by the
> > time streamoff is called]
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Per guideline[1]:
> > Notably, the last Signed-off-by: must always be that of the developer submitting the patch.
>
> In the case, should you provide another signed-off at the last line?
>
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

IIUC the main author's signoff should come first, and you should not
sign patches twice. checkpatch.pl did not raise any objection, so I
suppose the current form is correct?
