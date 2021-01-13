Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C005B2F483F
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 11:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbhAMKFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 05:05:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbhAMKFP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 05:05:15 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05C8C061575
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 02:04:35 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id c132so1187361pga.3
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 02:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wquRWJ+XSdWEkC1CKLlpx83RnASpvB9JfJs+0o8pqSw=;
        b=my4TThoY1QY04zJXin/7iCneXOx2awY7h5fcxmkmNVUKjCWvA6MfexjBCtKp16/Ub/
         T3YGu1Yw78e2PmJKbPxJ0vc7mSZhq/IelGudOEcncdBpeDAkBSZEZ53KqDwAgxaHMhFa
         LCgdNbiaFQPt55lNXCZ6LBZZkT6Q+ZqYgR3aSkdp+VYLlyx1hR7m9Fa6BPeZQzMm1t/f
         D9eFAVELVgg66Z6DsRdmZajRpQihlEWm1aOGjg5dFXE7dZAU27DXfj4ak8XBtGE0zz8H
         aHWlcNh8jZkq6Q6Uxiq0cqciZnF1A8yaQDJtkHIOk9z4MXrmORuNE9lNLVYiT3I/haay
         DxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wquRWJ+XSdWEkC1CKLlpx83RnASpvB9JfJs+0o8pqSw=;
        b=JP0VTwPRvXRX7dGnx+oKeVHc4UaPp+rJelWk8HUjS9OyCuTRoduqedsyxPL8G8bizo
         oC9rIWqGA33F12/G75o0M3Spl1flGX3Vie0Y/rBK1tCq193cmZs8nR8BpR4m4ViZijjm
         U3ckwg9xHH1gSVRwl4if7LpKbuV3Wj57UAK9dj83cQ8kxTTZC7LGNsB5ucsBFNyIqYfA
         yCbklzBQVVu+6T2LZQUhdQUsshWJbxSgLoEaTPekyWrdVqqtlzi+FdxyqpmXQoJgNsOv
         sJ6kMVJZ20X64E2CaJ3eFa7tL944J0JBmwwd4RrsgbNZ89CMN1it7rMCWvSQiecgv7YO
         bG6w==
X-Gm-Message-State: AOAM533nnTvb7Z1I7MiXAeLttb0e8FBo6bH5jkstPnUXJpbhcUgRaNu9
        qRfpu2UslaZ6S04fdpCkL/D0RW6FF6PE6jZUXUabvA==
X-Google-Smtp-Source: ABdhPJy4A6h7Yl1bmD5zFijMJFck5yvrhVoaKXZKAFR8qf0yCrO11pB7cjnmhRIPdpNASxw+lEjoEg5de41q+buNfTA=
X-Received: by 2002:a63:e151:: with SMTP id h17mr1383808pgk.120.1610532275264;
 Wed, 13 Jan 2021 02:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20210108120429.895046-1-robert.foss@linaro.org>
 <20210108120429.895046-2-robert.foss@linaro.org> <X/ippoemGT9d28Sd@builder.lan>
In-Reply-To: <X/ippoemGT9d28Sd@builder.lan>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 13 Jan 2021 11:04:24 +0100
Message-ID: <CAG3jFyv4Bnk1c0fm3wQ5CkXA9POEXM1JbmE4SqAFQ23hBvftBw@mail.gmail.com>
Subject: Re: [PATCH v1 01/17] media: camss: Fix comment using wrong function name
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, shawnguo@kernel.org, leoyang.li@nxp.com,
        geert+renesas@glider.be, arnd@arndb.de, Anson.Huang@nxp.com,
        michael@walle.cc, agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Bj=C3=B6rn!

On Fri, 8 Jan 2021 at 19:51, Bjorn Andersson <bjorn.andersson@linaro.org> w=
rote:
>
> On Fri 08 Jan 06:04 CST 2021, Robert Foss wrote:
>
> > Function name is comment is wrong, and was changed to be
> > the same as the actual function name.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/me=
dia/platform/qcom/camss/camss-vfe.c
> > index fae2b513b2f9..478be4f0cab5 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> > @@ -1077,7 +1077,7 @@ static void vfe_isr_wm_done(struct vfe_device *vf=
e, u8 wm)
> >  }
> >
> >  /*
> > - * vfe_isr_wm_done - Process composite image done interrupt
> > + * vfe_isr_comp_done - Process composite image done interrupt
>
> It's a function, so it should be "vfe_isr_comp_done()", but unless the
> comment is denoted kerneldoc by starting with '/' followed by two '*' it
> "doesn't matter".
>
> As a matter of fact, none of the kerneldoc in this file has the proper
> '/**' start, so this file is "undocumented".
>
> So please add another '*' and some () throughout the file.

Ack

>
> Regards,
> Bjorn
>
> >   * @vfe: VFE Device
> >   * @comp: Composite image id
> >   */
> > --
> > 2.27.0
> >
