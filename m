Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9F73B9B3D
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 06:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhGBELq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 00:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhGBELn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 00:11:43 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F65CC061764
        for <linux-media@vger.kernel.org>; Thu,  1 Jul 2021 21:09:11 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id g3so8556338ilj.7
        for <linux-media@vger.kernel.org>; Thu, 01 Jul 2021 21:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1gC6Cvl08bnslgy8WMJr7QNn+YYwFlDy13+HxzwRk8M=;
        b=NciZtOZ25evhYvZlsCKUK1olqhbASLK7QkPiPHy3BPnDfBvV6maHGibVQjs3Z4CDc+
         709TkprfM2FKC7TqPaO+aYrdwKZDiiJ5ClxrAXLYh7Msp1YpidnvopVGGYdUFymYM6H1
         sTnEQBKNMflYZ1VUcPcjzAmjhv6QoqZL8cTVw0ttSHHdoKuYJE9OVNlGaY84gKzOhzgg
         y+2ASjN+MsOpKHXicCrLjSYsimbuOxGM1HsfUXmcHbYL7MD+KN1zAnIz8ZekVK59YTJR
         6pN6UorVkUbHoxolVAFDBGivrpeGfQHuuKiNuZF6DM1v1EnONybezObTzRyquu4h2vlU
         fCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1gC6Cvl08bnslgy8WMJr7QNn+YYwFlDy13+HxzwRk8M=;
        b=HP4yHulYPZi1QGP892qI5rmLAZOnTTEsBXfi3A8AXcxDlGzpxQ9cnqfzqrRqKUCz5Q
         ai8DnEyqPtecAi8KD3DbxribRsdr9ddgSm6LHpZnRFoNJQra7nDd5fPPI42yYKjy4dmQ
         1QTNS0AikCIboqsEbTCEY/tkPi7sJDqjN8L8u1lXHdX2vWuIUIIuiwJjHxN687fdpRU3
         ANOGOYYr9wqc8K3t21pgjE0VHe14Q/MUl6wXu3XPGTH4FL2LqpKRHN93O2RM8VWAOAVf
         R+aI9RCNfOBDYBy4XYlCSs6b9vAKDqzvoJX16bbuIZUnsHbW3qvFFnp7s9egCZpL3qZq
         S71w==
X-Gm-Message-State: AOAM530G0VSRZKt9M/pULAI9/zeFi+ZLnDNl0KH5p5zrESMnF0uK+Vs9
        13gCw7nNEsLJKQs305WBnZAlFj6jQTXtBfdghuEhVg==
X-Google-Smtp-Source: ABdhPJyMAYJ+oj3Ah4Z5Te9mpgidxlbMPme/PtZviWgLgSIfiUPgsYDOKP3BdaS2QUHV4m/FgKmZbeNg5jF0BLg85Zs=
X-Received: by 2002:a92:dd05:: with SMTP id n5mr1966777ilm.72.1625198950511;
 Thu, 01 Jul 2021 21:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210630085247.27554-1-irui.wang@mediatek.com> <20210630085247.27554-3-irui.wang@mediatek.com>
In-Reply-To: <20210630085247.27554-3-irui.wang@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 2 Jul 2021 12:08:59 +0800
Message-ID: <CA+Px+wUdPx39jQ2OPi_yTfmqAiPT=TB_vdQFpe+GVRfNm3R3pQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: media: mtk-vcodec: Add binding for
 MT8195 VENC
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <Yunfei.Dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 30, 2021 at 4:54 PM Irui Wang <irui.wang@mediatek.com> wrote:
> Updates binding document for mt8192 encoder driver.
Typo in the commit message.
