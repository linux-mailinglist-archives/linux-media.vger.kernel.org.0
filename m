Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C186841898F
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 16:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbhIZOx1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 10:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbhIZOx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 10:53:27 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84B0C061570
        for <linux-media@vger.kernel.org>; Sun, 26 Sep 2021 07:51:50 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id bx4so57895498edb.4
        for <linux-media@vger.kernel.org>; Sun, 26 Sep 2021 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sLce4anF/Ldxr9zJgqQp47ftX0X/kbCvqATSWd0SLuI=;
        b=S+hw9FjUgdENuVuqSrXHDlFjl4Zr9rPqWNEez8sEdpicMAbHwC2QIRkpRloWZzwpuA
         vcuMX59mB52afIhYL1N6sSE1uki387Gw42gR6DqohyNOmFG9GUak+ALFy6SY2nxvuJCV
         A2csKPZIvtE9OjBsqYJgK5KYHU3GQ5PWrOErJC+AkLR9AMU45iRWE2QcCuMPv9v8DKoy
         qoe95ToLD0LZgt1tjsejG8rlWCzpSokJCGwoxOPRyCCUn7/eZLQrd2YksqMy8/yvhgA/
         Uri7Z7xPRnCKqsMT7fOrkvP9dYwRU1KQ/eI0xQFhBswN1xq+Tq3yra/1IUJWxnPH9inB
         lZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sLce4anF/Ldxr9zJgqQp47ftX0X/kbCvqATSWd0SLuI=;
        b=DOH3z9vmyKYeo8QSPw6LeReu372ITw7ioSEnFcXGfTP82gi7+cUkkW3j4hQtjQINZz
         xMhkqsurpgXIdFUVSbe94XtrFsyqOhnTutaf1JbKox3jDIlRB2FYqTuxeWuZOZb2+ZfE
         zktenEO3nza5ctXjTooXT1EaLyRz3XDYZEdp8ePakXfyv5eX1qyKOWr3DN6clHQxTk2o
         sDMm4VdxbN97kPET3WHEQy4JF2H+AKUBlfy5Fp5NK9pJTcauVqeQ/FEhDyGzaA5tOKHA
         jNixxBFn2rwsdNFZeLOXT4b07XLQd9//pBmQlxsY8cyFArGxZYPaUoemsxYVF4qp/VuP
         mtnQ==
X-Gm-Message-State: AOAM5327fJsOmUI48fIUxVmJ71hxwW+uePbIVqAH01oqLp28n/lr8zOd
        ybkC5wkexTY81q5DGJ0Xdr40AGeaQ4lxm7PoOG5iHA==
X-Google-Smtp-Source: ABdhPJwEI9Otw5j+Kubnt1ZjqadmE4duy9lhN+7xJz+VYfyRhHhxfTsqb0Bln6cUv2IXEVGS0gPu4vV4A28m+/m9Cgc=
X-Received: by 2002:a17:906:e20e:: with SMTP id gf14mr22462818ejb.244.1632667909119;
 Sun, 26 Sep 2021 07:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com> <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
In-Reply-To: <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 26 Sep 2021 11:51:37 -0300
Message-ID: <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To:     "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 26 Sept 2021 at 05:27, yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Ezequiel,
>
> Could you please help to give some feedback when you are free for iommu
> limitation?
>

How about you work on the architecture I originally suggested?

As the saying goes, talk is cheap, show us the code.
So let's see the code and let's discuss the limitations
with the code.

> According to google's suggestion, it's better not to use v4l2 async
> also.

Hum? I haven't seen such objection on the mailing list.

Thanks,
Ezequiel
