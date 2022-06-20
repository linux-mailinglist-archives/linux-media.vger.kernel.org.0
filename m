Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E7E5512A7
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 10:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235467AbiFTI0R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 04:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234725AbiFTI0P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 04:26:15 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E5928D
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 01:26:13 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id o9so4782434edt.12
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ytMUXjmaN8uHSvhOnNn2seCP4qJ7rfDpUHNy7RTqCxM=;
        b=hd1CcsMoEubcv6jr6mmIlVzkPnefJUP8r20R0zYK/c+jUCgKI8Q3JnLWgClt35Uisy
         4KbHXd9q38JNpI5fY6UQgh6EaWIHQxw+4tio8Di8lZre94OlHMYRIdM/jJdTFqHVz7B3
         bSbk0rAc/JmUZdW8yMVeBf8pChYxs09lHNpEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ytMUXjmaN8uHSvhOnNn2seCP4qJ7rfDpUHNy7RTqCxM=;
        b=wM8imeYNbFifP1J+wGHNmHZ6SjnpaXH2om0vZaWjiSy3NEb2cxE59BSJuOgwm2CIAb
         CpS94mPmnqGqGh1KKjll33YaB1SjZ7JfTmZx36V99Au78CShC0rVIJq/wjej+2LELEvg
         WqmJGiHZ3JKnHbd/CXSHWl+rAU+XFBmSlrBS35uhHCTj8sNmDfyxy0ePEyMlZ11Sz2q7
         wnH5ix7AqqBatnm2+6eHe9/6yXiNk9gtPr6FzI3TGX8NrqpqnUbkUIySrCyD3T/iWeyE
         RaJlWQz32zMt8+p4efjPVV8C9JSr08kdCiKL7QaM2hSR4raqLMO/EE2fe0DU9wllGC9j
         WjCQ==
X-Gm-Message-State: AJIora9A2S9z9irOuq2CxIuNBfIq06zYTe5JoEAjZqWmvPB3v8MOV6lC
        eaKiBzjniGuiEL7cudYXMhIxtrmPcrHmdXFs5NEpMg==
X-Google-Smtp-Source: AGRyM1sW1N2WJNAFBze0aVQVaROgZ8Ht/RO6hxNo4xmROEhN05naPzIBxPQWeqLSKYLqFDl/OC2uAiiLvkZXDWbHcKQ=
X-Received: by 2002:aa7:c84d:0:b0:431:4226:70c9 with SMTP id
 g13-20020aa7c84d000000b00431422670c9mr27849166edt.51.1655713572457; Mon, 20
 Jun 2022 01:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220620063217.9867-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220620063217.9867-1-yunfei.dong@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 20 Jun 2022 16:26:01 +0800
Message-ID: <CAGXv+5F8jvzz9DkM4x0MKQ_hZGpYXwQNfOEp_Gvqr__t-WDW+w@mail.gmail.com>
Subject: Re: [PATCH, v2] media: mediatek: vcodec: Initialize decoder
 parameters after getting dec_capability
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 20, 2022 at 2:32 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Need to get dec_capability from scp first, then initialize decoder
> supported format and other parameters according to dec_capability value.
>
> Fixes: fd00d90330d1 ("media: mtk-vcodec: vdec: move stateful ops into their own file")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
