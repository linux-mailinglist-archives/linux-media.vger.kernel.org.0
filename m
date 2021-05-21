Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81DCF38C847
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235878AbhEUNiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235836AbhEUNio (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:38:44 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF85C0613CE
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:37:21 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id t11so20095110iol.9
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PUwH+KODosjJUjMPg9IAKpCYIeQTuD5ncp4ytmLDie0=;
        b=dX68k/vqLQj7dEmcf+9f2n2EFSx4AmpIebAbLKUYMqcDzhpqHtyMUTDlaIANEMTQsm
         187GxMYB9OrBNQXrUvvJsaluMvSvkVPpAgNcjbmQrMAbHPDBpKlkosomU3fskO2L94+F
         srMjBjOya61XzRSzr6ZTQ15Juai3s2sPr3JfdrASXUTXuNglJjhDPyCGG1IEx+w2+r8I
         rb5kjSSUJZF1C61Gx5ydkY2g4qx9FtuYgDN2uHBsWWg2M+KQyf9dLUZc9sLu83O9gc1w
         3xAu0b+0WxrjaE5tTOGlMbzaEFgEEmEVg2ok+Rx1idLZMDGFyqCYaps1Iqj/WFAbc0rx
         j3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PUwH+KODosjJUjMPg9IAKpCYIeQTuD5ncp4ytmLDie0=;
        b=DiZH2C0PjtVZbVprBjTqyZKwTjfrNyVeiE1WFkrvhF5oUrjOSR+ubIyCrMCOs0mniZ
         7A7PoRxi/4z6pJXEE5XMVA6+Yq5PB8Hptbo5optMP8IodNQLGe3gj8uybw1qwkIR4yFM
         FEHt0YMFLiJcdBOnjhOp14zWX15yF/HyHghHlWc8Ky94WHqMGbaI2GK+KX0newwG5alT
         EFEZ3NlU7JxZP0BgzwPJGQimo6MHiD1r3Vztsq/wz9oC2wmD2oSRL1PZmGpl7nUIh9Z1
         8h4ZJI0akUNHpffv8ur8qkvoaKsf8ApvG3zsPhn4C3ZquQUasw11D6kiOEfJ2cV6Rcfr
         dllg==
X-Gm-Message-State: AOAM530jhL29myIuEMVEsnA+7spH37bHZDfHU3Z0ckFhKgutsOffXSMg
        TGhynM+hQS3BkgdniaNeic6tfhGQpYhZwR+1cIy0SQ==
X-Google-Smtp-Source: ABdhPJxErXiEqANMcxd2fY+DnyF8+B5zbKwXCw+ONC3YxWp9MxJ/qb64jURWmaHd53lAI1/HJu6xOy0eGOwj7DmXTHo=
X-Received: by 2002:a5e:8c11:: with SMTP id n17mr12081480ioj.53.1621604240549;
 Fri, 21 May 2021 06:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org> <20210519143011.1175546-4-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-4-acourbot@chromium.org>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 21 May 2021 21:37:09 +0800
Message-ID: <CA+Px+wVAAg95YkB4nXb+Emr8Ce5GpfoHhUe5B4iUViRWdfVCZA@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] media: mtk-vcodec: vdec: clamp OUTPUT resolution
 to hardware limits
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
