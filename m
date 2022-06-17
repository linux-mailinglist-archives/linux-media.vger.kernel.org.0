Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42BF254F143
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 08:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380352AbiFQG4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 02:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243756AbiFQG4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 02:56:46 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BFD5C36C
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 23:56:44 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id eo8so4990953edb.0
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 23:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sLhfCJ8PekgBeiM3KU80x7Qwq344wsuKnT/r+LcG2GM=;
        b=e7KAaUnuA0HYGg2Lg9mBPj3DrKLEvfZUjQBilNBT6iFsQwiChqYLbSFMpt1CZw49hu
         Uhh/Z4UzfmH1tgChFd4GYmJPuADEzaM36JeRF/stmNvDIRYGsPkJEfUx2gcYqjIzk+1Z
         4pTq/kEcbLMa+GGo+ioysby8f4NVMsOllC4QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sLhfCJ8PekgBeiM3KU80x7Qwq344wsuKnT/r+LcG2GM=;
        b=2Z/hcn1iy6XLB+xVDxYSSj02/l4cQpMcYiYCiBHmp9M7EaJq8HIJVKpHlnD14NOciv
         I6JHYl4GW/7ngexygjSgIaKhEnJOZBsclE9OOL7puOXiPSV+iI3hiv29D+x1Yug7Cazz
         VcTYa4Cqb/22RgHuYoyH+dU5PloUzbEVP4knGZujj24L4dDKOzhOuTw66wIrrpf9HqG2
         HrZ7jBZs3l+Q5LgkW0h+n8NPnWUMCKbWsHB4VE8DyZUteiIqJC+Ppd8h//ipbjisEwCc
         npZ6lZ16Pa2ap60PnzieUiYzFZd9XRX3wOWrNv5gEi8yyKpAwfFKbhkqJ1nelpHJlMkb
         EJ1w==
X-Gm-Message-State: AJIora+bAcIHCaJiITubOZx2qAS3KTY7+qUgZ2K0/yFrGgzHZhwvhJ0h
        f8gFL5oBz8BYzoCeFtGeD54rtocNHmdRzm6hgGrjmQ==
X-Google-Smtp-Source: AGRyM1tIbRFLJsIG8ha9JMgB0N9ZCD+AhfPO/Aq8IF+A20gJm7k5xF0so9i5AD1klMG7BMMrL3Xu6QF5ZW0ApN7BiWc=
X-Received: by 2002:a05:6402:6cc:b0:42d:bd2d:9f82 with SMTP id
 n12-20020a05640206cc00b0042dbd2d9f82mr10669676edy.59.1655449003429; Thu, 16
 Jun 2022 23:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220617032113.18576-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220617032113.18576-1-yunfei.dong@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Jun 2022 14:56:32 +0800
Message-ID: <CAGXv+5EZ+Mu1481gM9h0kgqO3a0xFKP8drvGv7gRp6=3NU2oKA@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix non subdev architecture open
 power fail
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 17, 2022 at 11:21 AM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> According to subdev_bitmap bit value to open hardware power, need to
> set subdev_bitmap value for non subdev architecture.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Fixes: c05bada35f01 ("media: mtk-vcodec: Add to support multi hardware decode")

?

ChenYu
