Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B923E4593
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 14:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235366AbhHIM0M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 08:26:12 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56333 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235360AbhHIM0K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Aug 2021 08:26:10 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id D4Lhm0TBH4SnAD4LkmmRE9; Mon, 09 Aug 2021 14:25:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628511948; bh=sQBLeYDznGTa/2TP6veQAIGI6Jhn8ZN06fqsZIRYYXg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tUiJPw1RnUHDdjztX1Zss2CG/k9iJY/l6SX9J+exEjtnfsYZlm45yUb+Rk2A6cfkr
         q07FbBz0ANMqWFfNxacLa3kVh29zy48tW4Gque88p11WwVAEujqKuQa4vYSBkodkzi
         kAt3n5RcFuwelHPiPbhW2FNFcEEwvlS24iej32+DrrzMMJexfmH9OzUeKpGIfgD7b/
         icQcX5cSaeXZV1nbsHfncJ1UMbS6f/VrLFXEBQooKssn/wnVTpTSfdT3UlJamMVnr2
         M9efopAl18nwSWmATCpmwnVEfaSYXAVekCw+QF0SQ4iimKXMA4Sw8PdeepC+Dez5hR
         LgYnFgZpprQYw==
Subject: Re: [PATCH v4 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS
 control
To:     David Plowman <david.plowman@raspberrypi.com>,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210809093448.4461-1-david.plowman@raspberrypi.com>
 <20210809093448.4461-3-david.plowman@raspberrypi.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9dd9c8ec-1168-60d3-2a94-fdd68eb9553e@xs4all.nl>
Date:   Mon, 9 Aug 2021 14:25:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210809093448.4461-3-david.plowman@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGuSy4ucVejC8ZA0l9rLeE6BzfXi5q8/fP9drCYmdk/jMj8q94PP1xxlzKQUVwramjeOEaGso8VOEmKexKKH7YWaqjosqkjkbzN/KwdZA8wXgunTofDw
 qrYr231DE4+8q/M7+PICedLzR/lWWpGToM5Yg8Lj8lrMci84QL4HomeHKVKNdtl+Vsv+oowLlb2PD0q+cajqiztYxehhaCDArV/T0d6oR6WRQwyIYCgiLM7W
 5aWuxOy0fZ+EyoSQeYnRw3ZxURbWLEo7IKixtAj6VrzBAY1jcWi72sC+DHc3yyZymX0DVOaQpSkVAStgKFioNKEn4a0AZTPSqaUTGt4pn6YdsVvuHwYbIuL5
 uwMxlfya7Zv7lGhsWQkIQ+23dS59S0txTDp+gHabjkK1T/4SOsY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/08/2021 11:34, David Plowman wrote:
> Add documentation for the V4L2_CID_NOTIFY_GAINS control.
> 
> This control is required by sensors that need to know what colour
> gains will be applied to pixels by downstream processing (such as by
> an ISP), though the sensor does not apply these gains itself.
> 
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> ---
>  .../media/v4l/ext-ctrls-image-source.rst          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index de43f5c8486d..c1793fda1429 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -72,3 +72,18 @@ Image Source Control IDs
>      * - __u32
>        - ``height``
>        - Height of the area.
> +
> +``V4L2_CID_NOTIFY_GAINS (integer)``

Say '(integer array)' here to clarify that this is an array.

> +    The sensor is notified what gains will be applied to the different
> +    colour channels by subsequent processing (such as by an ISP). The
> +    sensor is merely informed of these values in case it performs
> +    processing that requires them, but it does not apply them itself to
> +    the output pixels.
> +
> +    For Bayer sensors this is an array control taking 4 gain values,
> +    being the gains for each of the Bayer channels. The gains are always
> +    in the order B, Gb, Gr and R, irrespective of the exact Bayer order
> +    of the sensor itself.
> +
> +    The units for the gain values are linear, with the default value
> +    representing a gain of exactly 1.

Add an example here to clarify this.

Regards,

	Hans

> 

