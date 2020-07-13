Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7193421CF90
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 08:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729041AbgGMGUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 02:20:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:49566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728488AbgGMGUU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 02:20:20 -0400
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C14720674;
        Mon, 13 Jul 2020 06:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594621220;
        bh=WuqdpFUcq4uF0/RIHZ+88zR6TAiC4uqqH38bj35kais=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mAHy2i16DHnsjtZOV9CiFKZ8CB6E94YhMONfe1eYB8cgTEYhjamHkCxYaxqhpNEpV
         fGje76CwK0714jEll/wPYDMz/deqygPuGMeSMnIvkbfJ+0+VcMd+/8ldR5U4k4ERYt
         NjDeFeKkyR2QPSj9g5FGo+LVWq3C0yRijSnJSTTY=
Received: by mail-lj1-f182.google.com with SMTP id e4so15451448ljn.4;
        Sun, 12 Jul 2020 23:20:19 -0700 (PDT)
X-Gm-Message-State: AOAM532by/n0cQogQYUYwdv8n4KWvfxFZzpilIj6gKRb5OcPi8+/j+8k
        L23y3q56gghv84zKQNW0DJi0Q7+fgEh4S6a7nXk=
X-Google-Smtp-Source: ABdhPJwb9dJ9VZo72PEXS5lIrY6ZN22jA33AQiuxNlQxQodB1qXlHopTmumJdSl0lOT2r+0ZQLDwGAu+Y+IPRKaEWJE=
X-Received: by 2002:a05:651c:200f:: with SMTP id s15mr36978008ljo.125.1594621218404;
 Sun, 12 Jul 2020 23:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org> <20200713060842.471356-3-acourbot@chromium.org>
In-Reply-To: <20200713060842.471356-3-acourbot@chromium.org>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Mon, 13 Jul 2020 14:20:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v66rFAb6eczD=ct68b7Q60ZvFyMCRN6XdY-rUAbk6zVupw@mail.gmail.com>
Message-ID: <CAGb2v66rFAb6eczD=ct68b7Q60ZvFyMCRN6XdY-rUAbk6zVupw@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 13, 2020 at 2:09 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> The mediatek codecs can use either the VPU or the SCP as their interface
> to firmware. Reflect this in the DT bindings.
>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index b6b5dde6abd8..7aef0a4fe207 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -19,7 +19,9 @@ Required properties:
>  - iommus : should point to the respective IOMMU block with master port as
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
> -- mediatek,vpu : the node of video processor unit
> +One of the two following nodes:
> +- mediatek,vpu : the node of the video processor unit, if using VPU.
> +- mediatek,scp : the noode of the SCP unit, if using SCP.

                         ^ typo / extra o

ChenYu
