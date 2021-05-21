Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E2C38C844
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235815AbhEUNim (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235792AbhEUNii (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:38:38 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA54C0613CE
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:37:15 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id z24so20150285ioi.3
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PUwH+KODosjJUjMPg9IAKpCYIeQTuD5ncp4ytmLDie0=;
        b=aNjUpsBMwnoOWHtnNBd+eSQErCc858AmiFEP8AvYFaSagPhuT2fvH7rWkwTQrxL3Ul
         fPQuXIHHlGeGl/q0PP1aGI95i/ejhMMhqyZj8xZ83N5Gi5u4DwSpdQ42Kux30GWa0Dxa
         5nutkCCxQacYk5uzd8c9V3OjMbVMMkdZF7/z8/u1bl4RuxT1AbCZwCGAHwK4Bok/smgf
         HPnOFo21uoQlN5DHATaQBTF/titNesNJzFGRuMT1Kn88ZNy7LAvqXKy6krOEp/HbkBsN
         WuDy6oTZ+TpSRrV/UIoatZ+O2o+lvahPUFfexxgnME6b+6Y3p34HA3eCy2+umxnB5ZiS
         NknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PUwH+KODosjJUjMPg9IAKpCYIeQTuD5ncp4ytmLDie0=;
        b=Y/Ki0Qcm66igtuU0Avw9vmrhw19evgjflOUelHLfG8GKfedJVVElksVbaC1Hu8MsLy
         okDIe7FDYjPHha3HtaQn4MpoLxxtHtR2WUjRGEugiJhhuoTIQz6tpU3ggJAOsYaVOBaJ
         EJdqOZoPcvmssYl+i5HKeTL737xcpmMl4YgsvD2f/jc/HFo98wEm7cFFvUl5aAK3/fOm
         h+oHFiHilTpJN2mUCed695Oi/DXkfJ5tC4aZEjy3HETg8pbg4ugGu6Cvf02J7IsVapjG
         RMUl25vNSNHXFJlKu+7z8yJp0d7TVg8V7ntVA0IOQ3uNJWQpoTqj3jBjGXp3bovPzCRf
         mLgg==
X-Gm-Message-State: AOAM532o14I/25UpGcB77WZ7IA9Q+AeMC2Vrtxc0i3XHeQSlv/uAM1IM
        iSqPuxzsCWztVnNODAhewB6VC+SGsVrzRBK9kIfUjw==
X-Google-Smtp-Source: ABdhPJzYJYUU4TXfu6NnTqNo4nok573ifIKYNvqaNAYKOX06Pzb5kUyxROhQJWDiS7PsLu06XjkoCqwZdt9bQjGdtK8=
X-Received: by 2002:a5d:9744:: with SMTP id c4mr12255133ioo.76.1621604234778;
 Fri, 21 May 2021 06:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org> <20210519143011.1175546-3-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-3-acourbot@chromium.org>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 21 May 2021 21:37:03 +0800
Message-ID: <CA+Px+wWf0JphnZOMLh5d0Q0DP-b32Pk4xzTE9cADHEXquUsLhQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 19, 2021 at 10:30 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
