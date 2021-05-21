Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116D538C859
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236094AbhEUNje (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236379AbhEUNjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:39:31 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2509FC0613ED
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:38:08 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id m1so16526661ilg.10
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
        b=sTqvwAiaNQ4KCzK/vupskNveTsjdzDadubdftpH4LLYWoPKuaOdUIo9U1xR5EVxbfJ
         TRLkx3c8jK0PiM4IdWMl2eV+ZvnlcRKceTqZyBzMfE3/Fr/m83BxCdXZW81oUsRMgN9Y
         NXxToywYDx+qZi956HpmR30FEbygoENjpDxQ+uBBvk+G//rz5LQIPbiqGenaIeIpQJXN
         36IGvQRdFdKQx1P7EzP+Sz9hHYxU4fXiyCP5vJshd3WlG6nBK5zk/c3xjwov/fazOHBv
         IS8AM5XuSQqsdhzx8I43U/SEY2vhO66Se9s8PSKLbPqPqbxfceokm87MEZGIv6GMPNQ9
         x9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
        b=XFt8Jgi++kK3mmZGgeS46mgVMU620ZtbV5h/UAhBHlpyKCSgj08NNWO2YE4waVwz3w
         b3cKMB4MUKlZqR3LFNq/dZRxsmHuGOHW7vkcV92fejHa87slQehTtOCr/OcWkmSdMXkR
         EPLJgNXhtz1eobAVHELE7qdQoKE4pGaNx9TuOBQwDmlougHZK8FV+uA1zrbcO2973XRq
         FiK6kN4xJ8PaI92FK/TwMAAsndhavV6NnvkkMfp75gkgDveOlUbELCceVV+9nURpn9OG
         5ZTvEfIHp8n5jyrMFxvYAHCdkM9/DlnokYdRF7zPMS7HgITpxRKGbvrZ1Rv+oHulG4xa
         2dXw==
X-Gm-Message-State: AOAM530WjOr7mT5FIFoYFswfW8xzxX9M+6hESI3h9cF4rlS3fn3OtMl2
        s9Pt7BbC3NzxQbS7+wPXdfvBflab1SIc97UQL1CL3w==
X-Google-Smtp-Source: ABdhPJyaUbZvDwXtgI8l9+6HZmWpDoF/OCiE7D7LSvdnS5+eKPt7Yahz2r1YfmK06EAv4U7WFj6Zg7fgKtIaomcv92Y=
X-Received: by 2002:a92:cdac:: with SMTP id g12mr11540753ild.72.1621604287338;
 Fri, 21 May 2021 06:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org> <20210519143011.1175546-10-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-10-acourbot@chromium.org>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 21 May 2021 21:37:56 +0800
Message-ID: <CA+Px+wUXfT-agqaHB99nabLXeGxP5UCNRt0nV+wx+=vF=YcXAg@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] media: add Mediatek's MM21 format
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

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
