Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECC9221D42
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 09:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgGPHXW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 03:23:22 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:39157 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726069AbgGPHXW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 03:23:22 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id vyEcjTVy0yPEdvyEgj3GW2; Thu, 16 Jul 2020 09:23:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594884199; bh=VSXAybE9aorsGhHWcD4kPLlmmss3u6qmIv6iB6zxOuw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=eEpd37B6zIN93WW+VPbMQ65FzbCxnCS9oCwJgQxdURnEMvHrQftmKUkyZXUrFBMqJ
         KVkaycysoknaY86Aj+krfkW3fCUTtXTKWib7coOH/4rmYwdEvA4DFlTTeY5J0sjpdw
         +hbxl+xEGH0zFo3W2uieDNuGLBFTr87p7vp6u4Z/1XZHCLBr3Bhv5xy+ERCNa6EY8j
         vynrBfoEvinr8n2wm+737OeD00uiyTz3QtQvd4OBJkrjZiVZaAPHlXoo3ycko/RHQn
         79x/9CKLTk5i7OIzFyqjrd2sP/LEgMp9slM4xPlUzIH2wyEdCE/2da8PEEc2CBkdL6
         /Q8oN3AkuLx5g==
Subject: Re: [PATCH 02/10] media: uapi: h264: Further clarify scaling lists
 order
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
References: <20200715202233.185680-1-ezequiel@collabora.com>
 <20200715202233.185680-3-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bfb5d0df-779f-78d2-fc48-3c6056f5fdd3@xs4all.nl>
Date:   Thu, 16 Jul 2020 09:23:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715202233.185680-3-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfImMhQ7c+BIsZ9AqMnePPQ/AN5ldCv/cinMIdByxFnEhoK5ohC0mMuhrKNMvYEhs5lHor2olkGMhT8MkOEh0z1wsu+aCLpqcr8y+5EToYgRDDRvMRCrF
 bux0cEc1KTIcXF9D5bSeUrVsT5yKrZzh4kN1+yp+Dl7/NZ9mwqMKTZr+UkMIkcPnGNucILOeBVws+6rOrUEIg/tx9nzs4XbZPDFnTe9KOKZLRg2kSD6g/BZr
 oIqlPOZgJDF72FqixedYcW1D/A0RaI8FwDoS0zcxVs0ZwxRpn2WCkaS0hxv0KeXsN3oeS1Ey6d4IfGxiX8/6adVf9O3fOiV69kuZA1/PKFOSRgTR5wjPBw2F
 PRvcjSMQBq9N2gNGL0meVLe2wwt1go92kSiKan19DNioRXxZPAOcE86cwxiLN98NWfPcfZJsIAbVulu8R5YJuwsgYZWt0PVkt6C2ih+sqhwLmne0wf/2iGnY
 5G4g9ooZQWLYqMwg9HsmNcZ5GT87ohIzpMvx8ITZlnJhFoO/+vEZnV6gaqfyaGsiL0hfEuweU8GZD0PGR4USTclb+OAg7enbl+Wa3A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/07/2020 22:22, Ezequiel Garcia wrote:
> Commit 0b0393d59eb4a ("media: uapi: h264: clarify
> expected scaling_list_4x4/8x8 order") improved the
> documentation on H264 scaling lists order.
> 
> This commit improves the documentation by clarifying
> that the lists themselves are expected in matrix order.

"matrix order" is not a well defined term. Especially since different
programming languages lay out matrices differently (e.g. fortran uses
column-major order). Perhaps something like this is more unambiguous:

"The values on each scaling list are in row-major order."

BTW, why not be explicit and use:

__u8 scaling_list_4x4[6][4][4];
__u8 scaling_list_8x8[6][8][8];

That makes it explicit and the order is just that of what the C language
uses.

Regards,

	Hans

> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index c2e17c02f77e..16bfc98ab2f6 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1725,12 +1725,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - ``scaling_list_4x4[6][16]``
>        - Scaling matrix after applying the inverse scanning process.
>          Expected list order is Intra Y, Intra Cb, Intra Cr, Inter Y,
> -        Inter Cb, Inter Cr.
> +        Inter Cb, Inter Cr. The values on each scaling list are
> +        expected in matrix order.
>      * - __u8
>        - ``scaling_list_8x8[6][64]``
>        - Scaling matrix after applying the inverse scanning process.
>          Expected list order is Intra Y, Inter Y, Intra Cb, Inter Cb,
> -        Intra Cr, Inter Cr.
> +        Intra Cr, Inter Cr. The values on each scaling list are
> +        expected in matrix order.
>  
>  ``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS (struct)``
>      Specifies the slice parameters (as extracted from the bitstream)
> 

