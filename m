Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE0832C733
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244810AbhCDAbR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:17 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:47657 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234806AbhCCOai (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 09:30:38 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id HSVYlagPSqY4WHSVblTRwa; Wed, 03 Mar 2021 15:29:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614781792; bh=OD4+J9g7kR64H+MvYSZM1+w0yW+kwKUZYu8ehKXQfSM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dfRvhehrZ3E2O97E15uEY2WNs5Nnln+ohgfG3q5l7jCGuIXOjCqfnUortr72DXDZh
         o+tfQjLDY0OF3sI61Mq/9xNNj6szOTwwkWaZtWa0ZZysJy6/VKyIRw0PNyS/R/P9rz
         hR592jo8go7Sfdj+k/cMR9+k4UpV8m+EPRUjrOW0UW5tTA1CqqZha94/dereUSlupH
         LOEmdCjnvk2/zQb21CsWqFzHElR7r6bEgdBxgt5FjOuQDMIL3J4uAuQAT/aknMlMeL
         BLQyapplG1GRcWGmAS0tbzx/BQZmfOz60eV70dOyMWRKjCA8cyISy+RNYRn9+v+WvG
         rwzimX/lkVFLA==
Subject: Re: [PATCH 7/7] media: uapi: move VP8 stateless controls out of
 staging
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>, kernel@collabora.com
References: <20210302205405.69538-1-ezequiel@collabora.com>
 <20210302205405.69538-8-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3f2e178d-34fa-d527-022b-820b1363cb55@xs4all.nl>
Date:   Wed, 3 Mar 2021 15:29:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302205405.69538-8-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIDkfq2HEl5XKNP9paNDiZkUhpDTsQwowAZ+i6/2yGP3laKa9rDwc2YiNnaBxIhxmv56mGGF20mSMyuW2AIyvblYjlQFW4BJdGlgAA3xRVmtRhzFD1Vt
 hMmbHojBg7ez+vx/XbE02Q0EtLIY4zq04MatNbK0Qr/bkOirk8i0OSRCxnJov137+fM4unkvQCAWsiXinYlWpgDZ3U4oSHgHibq3qhTfwdduy3ugyzkw/kvX
 4ilx6pqLZMN+HDGpSJW2FEaPZr8le5aCmETH107CdA9tgLDMiPRCinYhwVfkL3/KWTkx2A6cI8Zxix+NmyROwZ2aBNkWm0KHs4Wo+98Xk8FyUaaZ/Gtlwk2a
 /X9Pg1SQ/XeWfWzjm78ROSxW0oto1w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

This series looks very good. There is just one define that needs a V4L2_ prefix:

On 02/03/2021 21:54, Ezequiel Garcia wrote:
> Until now, the VP8 V4L2 API was not exported as a public API,
> and only defined in a private media header (media/vp8-ctrls.h).
> 
> The reason for this was a concern about the API not complete
> and ready to support VP8 decoding hardware accelerators.
> 
> After reviewing the VP8 specification in detail, and now
> that the API is able to support Cedrus and Hantro G1,
> we can consider this ready.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

<snip>

> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h

<snip>

> +#define VP8_FRAME_IS_KEY_FRAME(hdr) \
> +	(!!((hdr)->flags & V4L2_VP8_FRAME_FLAG_KEY_FRAME))

It's used in several drivers, so it is probably best to add a separate
patch before this patch to rename it.

Everything else looks fine, so I expect to make a PR once I have a v2 that
fixes this.

Regards,

	Hans
