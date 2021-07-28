Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EB13D8B74
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 12:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235750AbhG1KLj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 06:11:39 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49925 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231907AbhG1KLj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 06:11:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 8gXHmHFT4XTlc8gXImT2Kq; Wed, 28 Jul 2021 12:11:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627467096; bh=jjWSH+H0BTaVJaWIwjQLEitk8kA6uaV+3EF8jheXJSI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wEbWL88u3DWZ/zsF10CIJ/oetrEqizW5XDyJxP+4dRgZ+dvMrO4TmIC6+QQHLECFn
         xYfdZCnkU3h0D1ImOz6TN5l3FpnaWUbEFUjjRh9oQvl5PgabhCLb6RKvtiieqJu8aA
         TvhxKc98g59pccxNS5tI9djBoF2g1/lXmtVzoYmMNb7YAEgqGjWEsIL72fITo747YL
         bNOsDn7Mmce7ssZzQsY6HWvUa47gbB6nHIctcd5zfoHGkTxGzGq2CSiWLcZt79p1r9
         ZJmUCvSt6s/rrqu0/13snp1k+vgBbZKjlMBVuPL+dXWbUdTLsqYxu2L8FAvYKj+yeq
         1VDrOqjGwFekg==
Subject: Re: [PATCH v5 1/3] docs: ext-ctrls-codec: Document cyclic
 intra-refresh zero control value
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com
References: <20210622113958.809173-1-stanimir.varbanov@linaro.org>
 <20210622113958.809173-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0f1070de-2f21-82b5-8dfc-98c3afeb6d6b@xs4all.nl>
Date:   Wed, 28 Jul 2021 12:11:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622113958.809173-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFTYbXBjCcVn17DyNej90g17OoXOYMTq/AVpA8C5siFQQlp0qvGFqBSUqMaj1Ee5WKfRyqsBtdFhJAtz+cVJppf9K8zpwdKxUBVcMd98iVSLa0AHKv/F
 KLvwL1jhWOo3856j/0VLNgEUAq1y0YkESxAj+duGtmHKElwjeIN6j8uzh6YeOCcQ4jWB2xMGG9SxfkwsB4G0fFW5aPkUG3lT2kuYcfiGHYw5FBbkeZVaMHQY
 Z0v3FH3CYm28Kjj7En9Vr1lLd/wn/oQ/s0A1KrMJ5sdAthXC9PXqtHDZvr6cg/WPs1Y0XSCVWvPREMQW+X/hQagoST0RjIfrq13k3v2+Fi9PIuB4YdVO+wbS
 J1mlUn53fDcMBxTgTHIntzJdDWl92sKhobU99IrxroU1NdB3tYe01NBhK9BpXnM8eoqLSjLIxftISGvPoLC+jekWpm64NZN61SpduMW78LMVFIqCInwZo7JY
 qvqf1yquI8jfP91ZXd2xrMh4nzwXae31baGNRg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/06/2021 13:39, Stanimir Varbanov wrote:
> In all drivers _CYCLIC_INTRA_REFRESH_MB default control value is zero
> which means that the macroblocks will not be intra-refreshed. Document
> this _CYCLIC_INTRA_REFRESH_MB control behaviour in control description.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 8c6e2a11ed95..addf44b99dfa 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1174,7 +1174,9 @@ enum v4l2_mpeg_video_h264_entropy_mode -
>      Cyclic intra macroblock refresh. This is the number of continuous
>      macroblocks refreshed every frame. Each frame a successive set of
>      macroblocks is refreshed until the cycle completes and starts from
> -    the top of the frame. Applicable to H264, H263 and MPEG4 encoder.
> +    the top of the frame. Setting this control to zero means that
> +    macroblocks will not be refreshed.
> +    Applicable to H264, H263 and MPEG4 encoder.
>  
>  ``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE (boolean)``
>      Frame level rate control enable. If this control is disabled then
> 

