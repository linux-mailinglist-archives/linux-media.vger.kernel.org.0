Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19DA33E1420
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 13:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241126AbhHELwC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 07:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241122AbhHELwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 07:52:01 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F9CC0613C1
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 04:51:46 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id h1so6289744iol.9
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 04:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TsqI2f4PszkolvCq0Vj/MJlhnRVimXlHdN3ztF9TtDc=;
        b=h9Ihuy67i+BPHbno8ksO+l7rRWsFMJu0B6yiBfPHRxv4EmpMJbRxqk5YJXlz6W7+CO
         uE3dUWZx6q63v5aX0O09Q1JMpskADy5RGDyKu0RfrPTskZomGnqFq8kR03Wv17C8H9jf
         N+IXJJsN/bX0rJY4TQlkBqADVsXV/DK/cCjXZwEJGTXFlh3gOL3PIs38B+fbEyzOFZ+c
         Cs6INT1PEHeTw3r58VBWcelXrfih83TPWsmxr7DYsBdHtP6IXYj3+Javgv7UWyjjAqdt
         kdrp9QL8apoFudTcrcGvz2k3dGUHLWb20nIxajEAC2b+aZCBG2qEr/us4XG0zUJbVouw
         yVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TsqI2f4PszkolvCq0Vj/MJlhnRVimXlHdN3ztF9TtDc=;
        b=Qq2t8rpmi1sLZ/Ps/hVc0QsnpePyg+oY4Y8dtcca6CjgX7bv4Sq7JT47xtzRB1Rzux
         6CBkFVkM2fQijsrjDo5BjAARF/65zNgc5TzQJJ/jz2EgQEStk1XRNlTf1ecmSbKtbm/2
         AQ0sVrScI0GNA4ulnhaTnxmBi9IdiRsifYxS7JOEKKWEJ9/M8wwUGyBG/oiVCPTE8yUq
         sbS/4oHjEOPEmZ64HA3ae2CoDgEz1B7rCbN+lL0rlokPTVbT0J2dtuVdLbCndenwqIv0
         jxHhwtc6MCJKNwTg8MQ1SVUzsp4sRafMGQyFZevGKRfwU4BsNyt9HC55F8foSM6P2pZY
         FZSg==
X-Gm-Message-State: AOAM5330EJx+clRtMeBm/IaaxKIl0sJZ0CokZlSXG60fph1r6osdbYXr
        +vWKJ2tWreVQSoREuWiX9cGMRMzg5kvRdzmhKqepNQ==
X-Google-Smtp-Source: ABdhPJwN2okbkH6vhEz2oQAP4lCx3J40CVTNusFx6KveRCIE/34YDrRFFEclMt3GEqmVWTQ5dVQczfBztrR21Vfltj4=
X-Received: by 2002:a02:cf2e:: with SMTP id s14mr4381393jar.74.1628164305688;
 Thu, 05 Aug 2021 04:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210705053258.1614177-1-acourbot@chromium.org>
 <20210705053258.1614177-12-acourbot@chromium.org> <8929c97f-b105-ee35-d882-1cd218edcfd1@xs4all.nl>
In-Reply-To: <8929c97f-b105-ee35-d882-1cd218edcfd1@xs4all.nl>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Thu, 5 Aug 2021 19:51:34 +0800
Message-ID: <CA+Px+wWARA-TF66x3k8nY+TNqNo90Cn2Q_c73a66JUXWkY0dsg@mail.gmail.com>
Subject: Re: [PATCH v6 11/14] media: mtk-vcodec: vdec: support stateless H.264 decoding
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <Yunfei.Dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 20, 2021 at 6:52 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> Several new structs do not have any field documentation, but they do start with /**,
> so I get complaints about missing field docs.
>
> After manually changing this to /*, I still get a few remaining warnings:
Will fix in next version.

> mtk-vcodec/vdec/vdec_h264_req_if.c:189: warning: Function parameter or member 'h264_slice_params' not described in 'vdec_h264_vsi'
> mtk-vcodec/vdec/vdec_h264_req_if.c:210: warning: Function parameter or member 'h264_slice_param' not described in 'vdec_h264_slice_inst'
> mtk-vcodec/vdec/vdec_h264_req_if.c:210: warning: Function parameter or member 'dpb' not described in 'vdec_h264_slice_inst'
>
> Can you fix this?
Will fix in next version.

> I also want to take this patch series at the same time:
>
> https://patchwork.linuxtv.org/project/linux-media/cover/20210630085247.27554-1-irui.wang@mediatek.com/
>
> Can you verify that this would not cause any problems with your series? As far as
> I can see it is fine, but a second pair of eyeballs wouldn't hurt.
Series [1] shouldn't cause any problems with this series.

However, series [1] doesn't apply after this series (conflicted with
[2]).  It needs to rebase and send another version after fixing the
typo anyway.

[1]: https://patchwork.linuxtv.org/project/linux-media/cover/20210630085247.27554-1-irui.wang@mediatek.com/
[2]: https://patchwork.linuxtv.org/project/linux-media/patch/20210630085247.27554-3-irui.wang@mediatek.com/
