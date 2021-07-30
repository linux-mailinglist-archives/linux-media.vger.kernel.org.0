Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4F53DB5EF
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 11:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238221AbhG3JcQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 05:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238167AbhG3JcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 05:32:16 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85E6C0613CF
        for <linux-media@vger.kernel.org>; Fri, 30 Jul 2021 02:32:10 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id c3so8754758ilh.3
        for <linux-media@vger.kernel.org>; Fri, 30 Jul 2021 02:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QKbni/aqZ76egtkhHkdY0UN0LLkLh5aeXXQeCasUkGw=;
        b=tsJk19gj3PkHmJlHLJBetwd4R6wBhJLLd/jqdoeSuniGamNJhUloHmn9Om5S6Xtb1F
         aHESwW0AAwDpr4rE3MHELlyFuZgtOjXswiUzKTi5UF2y8bQwaDTccAtbqBTgdi6k0uLp
         Xom+icaVuL6AmjU70Bs9WjQ00OyqCm1h5XHAOamMUzKmLWRIed7TJ97AsvC9QLS1k8Bx
         5Cjdoq4OAW91rRhW089foyTtOwVoRPQ9dHGYvFquGDPqo2eg0PsC7ooG2eLZEZIv3WNg
         vnuuBvVUnz0q5RFoU0Wale42c6jGEexWwBqS7Lb5bc4DJp2T7EvP8Y7znE1E95N+K0oW
         JxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QKbni/aqZ76egtkhHkdY0UN0LLkLh5aeXXQeCasUkGw=;
        b=q1ThL6gS25QBeIhIhhrbgfR1wJrQOy0EWS6RDN4f/4A9Ag1Emal/k6Gv2J9tAs3T05
         uDpy+Bp1rBjJMzQk1IMuxRD2B2EUQx5gD8clX0Pts8JMjDcAuhyMZHBZSyd3OfvuGB2+
         xu7ZVpr2UrjATvrX74/6B9/G8mBtqNIT9z4Oqiwf9aG5H16SUMIsUtDLjv11dbl5g/bD
         sqnXiXTDRvNKPU2ZKpOdlSOsgzXN8Z3Xv63BILxRpDTThH4eP6pnyrfWfq5VSHA00tLM
         u+WD9sg5ap3gQOqVGOudM63CS63kmS9ZiZOOcaa41zIpso7oLGA03uUPcPParPdiQGh7
         qmaw==
X-Gm-Message-State: AOAM533zZwHGMIRQFLgyssC8yVucRkbl9DwBAY+1g+NiOCX+klK+gTrq
        U6V12so07hbZXLdZh/63ciiZhZQGuOQ2Jg7WueqJOQ==
X-Google-Smtp-Source: ABdhPJwZLOf5Uom5UUNk1V2tXMhgVFLbgGGQQUfIB7390G3ZNeOxSBTJlaBusk0ofIKvM2BK/hKZ296u0QH3MGgaERk=
X-Received: by 2002:a92:b748:: with SMTP id c8mr1288763ilm.302.1627637530193;
 Fri, 30 Jul 2021 02:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210727101051.24418-1-yunfei.dong@mediatek.com> <20210727101051.24418-3-yunfei.dong@mediatek.com>
In-Reply-To: <20210727101051.24418-3-yunfei.dong@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 30 Jul 2021 17:31:59 +0800
Message-ID: <CA+Px+wWBWsxL=5_QYA6_v18uuRwFyoO4gT5CEL6_On4GeY+jag@mail.gmail.com>
Subject: Re: [PATCH v3, 02/15] media: mtk-vcodec: Align vcodec wake up
 interrupt interface
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
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 27, 2021 at 06:10:38PM +0800, Yunfei Dong wrote:
> Vdec and venc can use the same function to wake up interrupt event.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
