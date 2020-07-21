Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA042279F4
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 09:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728689AbgGUHzd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 03:55:33 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56419 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728550AbgGUHz2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 03:55:28 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xn7VjfUH2NPeYxn7WjsO2w; Tue, 21 Jul 2020 09:55:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595318126; bh=/v79hKJJGRj6BzbMDkBIw597JdY422SD+5dhz06Pjoo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=E0Dp32ecGVC2zSDgeY6KLpgLujdeQRvj674g6uBfnL4OSWfzivez4CJk6zrdlOdof
         /gDjzQ0c0jvRIXF5iHqpSiVVh1WtrDvVGvarhwVYnUsjwgidXmRmpBkoX1lFFaYzYG
         /iBYRR4GFL8m9pUqejzhqjr5A49D5mZwlaSUANRSQ5ozjCaQE3lwJmbZO/iN93RMRR
         lctsgeD9eg3FcZAymJ/AAEAmSemG+QSG2cPHojZY564qTiRj/kyBTnhv0Qj86zrEw4
         kJFMurxsJp9HE8vFFU75WKs9dOzfgpTjRRdYRzRvG5zH16pktZb32gm3YOgsPk1m4A
         wMHey373YkJAQ==
Subject: Re: [PATCH v2 6/6] media: docs: Deprecate mfc frame skip control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20200721074538.505-1-stanimir.varbanov@linaro.org>
 <20200721074538.505-7-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0195497b-a64b-e501-45af-b3847fe3108d@xs4all.nl>
Date:   Tue, 21 Jul 2020 09:55:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721074538.505-7-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPmZ2fNz+MsuKWtZE7Hw0mxslV4JLJgnH+exA32HpgMPVpj+zK3AX9ZL4xCN+7LiHEY1utWNYeb6beC54iEcmiMCjXyqlJvBk4D/sXUJG1RZau6BPS4I
 8hJneXG+lCnneUiwc2yotKW68Hv6SWkoPRBFnCEsTbQDyFKaGhhPozx4HGU27pz5XHW0eeKV82HR+ssTWZ3kHuBdjL3lSxCRCnQJQvtfnQN7vMjE6MeGzy8i
 lfubeitgnty8veyAJE0VqZVyLAR1ExPUyUr1Epa125ZW+zOjutSPXCLLiGLCoXlFMZee29tHBWZThaCLSsKHf8WNLHvnz/Ui1EU7G+drEmjU77rJzxPrTs1y
 o5mRAYhtMr0/3BRxfTR7GM02HlK4qAcUOqjJokIyy5JWLrV5IH0eE+kyQEHa9z4VAEdMY+orhKLNX467PIg/N9OErF8Rp02r9LLb1kdkuU0BzhrZtXVmozPp
 9eZGGtvOETiW1TUB40ciDitM5Uxh2uVSOQlJCa+sjEaZfLwcEkoRNRFUeZW3mh1E8iDGzNif2Niq9Jk6JeMXBpk1GuTYj22Zmvc1e8vBk//ehgfUk3U8myZz
 tsGC0zbYGEtbKx/ujl6pUsbohhBr38VEAOPUqo1EL4mid4zcxtanpvyDXcAzxBYbnS1nZDx0J1pgUcVHg0xgVIuxRPlJnb88WekUgmpKGhCF7vZ8f5SkjYnh
 1G2DoM9LqX4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/07/2020 09:45, Stanimir Varbanov wrote:
> Deprecate mfc private frame skip mode control for new
> clients and use the standard one instead.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 985e4c2d29bf..31d77d1cdcc9 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -2821,6 +2821,11 @@ MFC 5.1 Control IDs
>  ``V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE``
>      (enum)
>  
> +    .. note::
> +
> +       This control is deprecated. Use the standard
> +       ``V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE`` control instead.
> +
>  enum v4l2_mpeg_mfc51_video_frame_skip_mode -
>      Indicates in what conditions the encoder should skip frames. If
>      encoding a frame would cause the encoded stream to be larger then a
> 

