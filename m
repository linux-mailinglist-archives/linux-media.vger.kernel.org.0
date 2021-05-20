Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77FE038ADF6
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbhETMUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbhETMUd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:20:33 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224C8C081428
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 04:10:57 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id g24so8928673pji.4
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 04:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+SQgtRFMTp/VNytQ8r2NMcxoq1dwxAECxDdDjfqIL4s=;
        b=P3b/Duz8M4+Hge7/LfFHO6OMmXFcXb6YJWngVCFP30Cqt2TUl7tTfjonWXL6xcV0q6
         YHjHgB9FKTVS8VZxA8in9hltL44LI1jo5rOL2qSDOAmK5kxlFm7PIJ7C5WtMB2M8VSXl
         PYgXweW80DrRT+vmN3DfYebgYYfgJU0yKCoxUS82cNpRQKTsG+sM32LktXd4PxRhN33y
         JFXXWSraFn+EGPocj1LYIAS7ZuZQqDksLJr7CA9r94zw+ijR+paOLSoTVe2j/eZyFYD6
         QfytsDf6AcM9xzqVplhtpNaHeyxiWf00T78zZW61CThPH7kkrUxuosIW7vW7ITmObmOj
         1+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+SQgtRFMTp/VNytQ8r2NMcxoq1dwxAECxDdDjfqIL4s=;
        b=oG9uc4Uzc86kHec3cv2RhoWwUqufgiU0UnwmfDQAKCHL7A/9lSlEGJUg/Tmeq8MDLA
         tZLpUUsnGr6pHLDXcdOuClL0yy715WM9NRnK1Q7j3VAmDaIvPMWD2H+HhQmLhfwe8PgM
         2RMEgBPGHJh0TVBBPIzw+5MsBmuBXPxTz+kHz5jiriVrF1Uqa29jtekolkhQBE6E2oqi
         Ado6EUGMLMXPxP9MIWK78W+2VfTIFTeu8UDEsSJJW38D3HnupJSlOIxqxBqBIyujzoNL
         was4q/WCjY5SHYzL6vMjtpCWJt89nOKu4Tl19sReX/uPawC/VIbHJSttjhZmBSq+tP9G
         gBuw==
X-Gm-Message-State: AOAM532iKpjorasbhKCjV2w77muupotRyq9W+4Mb0Ou50xW9QpOxG3dq
        OODlDpBjKMQBYmbe1AeAVjyaS6Cw03Jmh+1inG8qyA==
X-Google-Smtp-Source: ABdhPJxDatCkyaJySsM7YbGJJF1h+SyvbWfKKUQgB5JZyAvMmGF4EU5+OXQG1W4UyBPcNUeSO9L3ZjFa6fX//+V5nOs=
X-Received: by 2002:a17:902:8693:b029:f3:b47e:6a08 with SMTP id
 g19-20020a1709028693b02900f3b47e6a08mr5169048plo.69.1621509056670; Thu, 20
 May 2021 04:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-9-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-9-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 20 May 2021 13:10:45 +0200
Message-ID: <CAG3jFytmf4fo_EZ4bcQOkszXe1u7uKYdUStP0WbOVAaZemgB8w@mail.gmail.com>
Subject: Re: [PATCH 08/17] media: camss: csid-170: set the right HALF_CMD when disabled
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Jonathan,

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Use the "HALT_CMD_RESUME_AT_FRAME_BOUNDARY" define instead of a "1" which
> is otherwise confusing, and add a "HALT_CMD_HALT_AT_FRAME_BOUNDARY" which
> is set when disabling.
>
> Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-170.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
> index af134ded241d..9f6334fd68fc 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
> @@ -105,7 +105,8 @@
>  #define CSID_RDI_CTRL(rdi)                     ((IS_LITE ? 0x208 : 0x308)\
>                                                 + 0x100 * (rdi))
>  #define                RDI_CTRL_HALT_CMD               0
> -#define                        ALT_CMD_RESUME_AT_FRAME_BOUNDARY        1
> +#define                        HALT_CMD_HALT_AT_FRAME_BOUNDARY         0
> +#define                        HALT_CMD_RESUME_AT_FRAME_BOUNDARY       1
>  #define                RDI_CTRL_HALT_MODE              2
>
>  #define CSID_RDI_FRM_DROP_PATTERN(rdi)                 ((IS_LITE ? 0x20C : 0x30C)\
> @@ -443,7 +444,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>         val |= 1 << CSI2_RX_CFG1_MISR_EN;
>         writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
>
> -       val = 1 << RDI_CTRL_HALT_CMD;
> +       if (enable)
> +               val = HALT_CMD_RESUME_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
> +       else
> +               val = HALT_CMD_HALT_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
>         writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));

Reviewed-by: Robert Foss <robert.foss@linaro.org>
