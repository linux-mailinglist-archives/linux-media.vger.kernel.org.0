Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69F09A9FB2
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387430AbfIEKbv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:31:51 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36934 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731058AbfIEKbv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 06:31:51 -0400
Received: by mail-wm1-f66.google.com with SMTP id r195so2321201wme.2
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 03:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qL99XLRHt2jIQ56iyz66TEVMPVnlDErB8b24wNn4m68=;
        b=d2oxeXrM+UoClIdqM0pU66l3VWtdMts6dPw9pHY+pJRkGnDJrDv/KZIVetp8KYfQPu
         6rShorReksEXCMvLBklD9GGX5t+v1pYo0yMZuA3hB9YF9kb2gCMtttm+GHLr7MXlrV38
         Dw2p7xVTopIwxWDEjNoTEgaLvCPqVkvLtmRlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qL99XLRHt2jIQ56iyz66TEVMPVnlDErB8b24wNn4m68=;
        b=pozGClw02DhxKgjEGcOS8LagQjvR13KfoEbrrNEsizq4HvB1Jzpu6X1NVqY4dXTuPd
         AAfi7LtQm5XDN6kTzst0klRO+nIus9oeAQU/hCk1nZ+H22P5i0887b6Jmpnk/ZtWC22n
         WOEgFtYnFIWhZ1f24pvz2QUBGgdcwZYxhtFOexlg3hc456PzrvLjz1jAbrz0YTBRnMgg
         GKvS04QQu0PTxclmeR136A6ibh73Vj7INvXUCEH0pkL1KcbhFp7tDI8SZUXtAk9wYJF/
         gkATYyler2SzMh1dyYKiO7OvlIUKLISszjPfEa+J8E7s82bh0DqMzZIWnMLtM6HIthkJ
         Ro9w==
X-Gm-Message-State: APjAAAUXyRmWWU5ZSKL2T84fHxaB/vPupgJel8aURYciwE5H+o8nMX/I
        eF1aIiPYVE7RvPscipSRPix173dLuPiDnWZ8FdxZ/PHmdRk=
X-Google-Smtp-Source: APXvYqxDi9lmrfGY8EHAhZq+a0nMj/Oollsj+5vsj4Oc+/FbM6i35xCcG8EclmCKrJ88iFW0TGNq9/31TgNRtUcnsQc=
X-Received: by 2002:a1c:2302:: with SMTP id j2mr2288167wmj.174.1567679509012;
 Thu, 05 Sep 2019 03:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190905101533.525-1-p.zabel@pengutronix.de>
In-Reply-To: <20190905101533.525-1-p.zabel@pengutronix.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 5 Sep 2019 19:31:37 +0900
Message-ID: <CAHD77H=q48Zx=dWMOMT527au8FzKZdQ9SrRr4sos8oNfCeCzQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: uapi: h264: Add num_ref_idx_active_override_flag
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 5, 2019 at 7:15 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> This flag tells the kernel whether the slice header contained the
> num_ref_idx_l[01]_active_minus1 syntax elements, or whether the
> num_ref_idx_l[01]_default_active_minus1 from PPS should be used
> instead.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 +++
>  include/media/h264-ctrls.h                       | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> index bc5dd8e76567..451a5b0f2a35 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1860,6 +1860,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
>        - 0x00000008
>        -
> +    * - ``V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE
> +      - 0x00000010
> +      - Corresponds to the num_ref_idx_active_override_flag syntax element.
>

As far as I remember, the idea was for the userspace to always put the
right num_ref_idx in the slice_params and the drivers always use that.
Was there any problem with that?

Best regards,
Tomasz

>  ``Prediction Weight Table``
>
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index e877bf1d537c..dab519aea9bf 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -133,6 +133,7 @@ struct v4l2_h264_pred_weight_table {
>  #define V4L2_H264_SLICE_FLAG_BOTTOM_FIELD              0x02
>  #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED    0x04
>  #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH             0x08
> +#define V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE       0x10
>
>  struct v4l2_ctrl_h264_slice_params {
>         /* Size in bytes, including header */
> --
> 2.20.1
>
