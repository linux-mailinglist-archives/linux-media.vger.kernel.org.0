Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF9CE107F51
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 17:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfKWQMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 11:12:50 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:35439 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726487AbfKWQMt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 11:12:49 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YY1bilegQcs92YY1eiKV9Q; Sat, 23 Nov 2019 17:12:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574525568; bh=wYPjlw+sdAM3Hp8yjlB8iBiEL8rPkWYK/DsqEMgNxEM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Zb5lcVU6weweJ8qa4SqWE5/H5xPEIZ2xia0xLwhB6ooznwwymFxKwUXpunTT8dd6T
         Mg07lbpdCHgbYIwxOBomwQWU3JD5HuGQuv2MeVaJBRjTpnoOyWfcaRY38NHxxZrMlt
         iOk66ItArAwFtk5bu00SCItOWwmj0QeY9FmjoYOXHW0+hvF6iwkacCvz7ZAsVpplN3
         Niq+n4+dtgUhY+ml9VqkH5MNXv7a3x+ZCxd24MN4tOEIYY537y7UAujWvSrfhMMkbI
         TeXygzjlGDrClopRMht6URjGWs7+JsHQRvh+lvLQPkRNxHEoMx352Bc6EdnRzYT1O7
         mOj2PCwtT4FTg==
Subject: Re: [PATCH 3/5] pixfmt-tch-td16/tu16.rst: document that this is
 little endian
To:     linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
 <20191119105118.54285-4-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c1e0aa48-f22d-afcf-d9a1-1ab4302d0ee6@xs4all.nl>
Date:   Sat, 23 Nov 2019 17:12:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119105118.54285-4-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCe/X11GVh0ubc6WROdGi5ESCRkLdteoGdgeibfmwQw3Iiz/tsjvEoRoBlnkwHJwvx0D0TYkMvqtkh7jPy+jB6zzsB7a1LSYx19P/4fH9qxe6TTu+Y3H
 MjLClhW7hFKN0j3I+tvzrrz+3+t9dwb/x3ttXfMsvKIzUsvc5yizL3uKcpU8/Qm8U55nd2LKk+uzlHUt8oiQEKznEhuJlmg19AB6sbru8tIV3JwyiJ5AF2y6
 85wF85tShxo22BgM4hH4zaDWy59hiQa7Rj70gqnXeGsr8Kz4t0XnWdV+1ccqSvPadPNyQp0DOr6WzfmXirf/cge2p3uRI1PqCHFVWDVSeVb21LaMR9Wxk2tF
 Kl/C+kPVj5pn3BGm/gHgl6vTuYGIVh1//m9yvcQTeJetFn0TFIf5SGJXu0iYSeUgcDq2XCiD
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

Is it OK with you I merge this patch via the media subsystem?

It's pretty independent of the other rmi4 patches in this series, so it makes
sense that I handle this one.

Regards,

	Hans

On 11/19/19 11:51 AM, Hans Verkuil wrote:
> Testing with the rmi_f54 driver on the Lenovo X1 Carbon 6th gen
> laptop showed that the data is in little endian format. Update
> the documentation accordingly.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../media/uapi/v4l/pixfmt-tch-td16.rst        | 34 +++++++++----------
>  .../media/uapi/v4l/pixfmt-tch-tu16.rst        | 34 +++++++++----------
>  2 files changed, 34 insertions(+), 34 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/pixfmt-tch-td16.rst b/Documentation/media/uapi/v4l/pixfmt-tch-td16.rst
> index 4031b175257c..6f1be873bec1 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-tch-td16.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-tch-td16.rst
> @@ -15,7 +15,7 @@ V4L2_TCH_FMT_DELTA_TD16 ('TD16')
>  
>  *man V4L2_TCH_FMT_DELTA_TD16(2)*
>  
> -16-bit signed Touch Delta
> +16-bit signed little endian Touch Delta
>  
>  
>  Description
> @@ -37,38 +37,38 @@ Each cell is one byte.
>      :widths:       2 1 1 1 1 1 1 1 1
>  
>      * - start + 0:
> -      - D'\ :sub:`00high`
>        - D'\ :sub:`00low`
> -      - D'\ :sub:`01high`
> +      - D'\ :sub:`00high`
>        - D'\ :sub:`01low`
> -      - D'\ :sub:`02high`
> +      - D'\ :sub:`01high`
>        - D'\ :sub:`02low`
> -      - D'\ :sub:`03high`
> +      - D'\ :sub:`02high`
>        - D'\ :sub:`03low`
> +      - D'\ :sub:`03high`
>      * - start + 8:
> -      - D'\ :sub:`10high`
>        - D'\ :sub:`10low`
> -      - D'\ :sub:`11high`
> +      - D'\ :sub:`10high`
>        - D'\ :sub:`11low`
> -      - D'\ :sub:`12high`
> +      - D'\ :sub:`11high`
>        - D'\ :sub:`12low`
> -      - D'\ :sub:`13high`
> +      - D'\ :sub:`12high`
>        - D'\ :sub:`13low`
> +      - D'\ :sub:`13high`
>      * - start + 16:
> -      - D'\ :sub:`20high`
>        - D'\ :sub:`20low`
> -      - D'\ :sub:`21high`
> +      - D'\ :sub:`20high`
>        - D'\ :sub:`21low`
> -      - D'\ :sub:`22high`
> +      - D'\ :sub:`21high`
>        - D'\ :sub:`22low`
> -      - D'\ :sub:`23high`
> +      - D'\ :sub:`22high`
>        - D'\ :sub:`23low`
> +      - D'\ :sub:`23high`
>      * - start + 24:
> -      - D'\ :sub:`30high`
>        - D'\ :sub:`30low`
> -      - D'\ :sub:`31high`
> +      - D'\ :sub:`30high`
>        - D'\ :sub:`31low`
> -      - D'\ :sub:`32high`
> +      - D'\ :sub:`31high`
>        - D'\ :sub:`32low`
> -      - D'\ :sub:`33high`
> +      - D'\ :sub:`32high`
>        - D'\ :sub:`33low`
> +      - D'\ :sub:`33high`
> diff --git a/Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst b/Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst
> index 8278543be99a..cb3da6687a58 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst
> @@ -15,7 +15,7 @@ V4L2_TCH_FMT_TU16 ('TU16')
>  
>  *man V4L2_TCH_FMT_TU16(2)*
>  
> -16-bit unsigned raw touch data
> +16-bit unsigned little endian raw touch data
>  
>  
>  Description
> @@ -36,38 +36,38 @@ Each cell is one byte.
>      :widths:       2 1 1 1 1 1 1 1 1
>  
>      * - start + 0:
> -      - R'\ :sub:`00high`
>        - R'\ :sub:`00low`
> -      - R'\ :sub:`01high`
> +      - R'\ :sub:`00high`
>        - R'\ :sub:`01low`
> -      - R'\ :sub:`02high`
> +      - R'\ :sub:`01high`
>        - R'\ :sub:`02low`
> -      - R'\ :sub:`03high`
> +      - R'\ :sub:`02high`
>        - R'\ :sub:`03low`
> +      - R'\ :sub:`03high`
>      * - start + 8:
> -      - R'\ :sub:`10high`
>        - R'\ :sub:`10low`
> -      - R'\ :sub:`11high`
> +      - R'\ :sub:`10high`
>        - R'\ :sub:`11low`
> -      - R'\ :sub:`12high`
> +      - R'\ :sub:`11high`
>        - R'\ :sub:`12low`
> -      - R'\ :sub:`13high`
> +      - R'\ :sub:`12high`
>        - R'\ :sub:`13low`
> +      - R'\ :sub:`13high`
>      * - start + 16:
> -      - R'\ :sub:`20high`
>        - R'\ :sub:`20low`
> -      - R'\ :sub:`21high`
> +      - R'\ :sub:`20high`
>        - R'\ :sub:`21low`
> -      - R'\ :sub:`22high`
> +      - R'\ :sub:`21high`
>        - R'\ :sub:`22low`
> -      - R'\ :sub:`23high`
> +      - R'\ :sub:`22high`
>        - R'\ :sub:`23low`
> +      - R'\ :sub:`23high`
>      * - start + 24:
> -      - R'\ :sub:`30high`
>        - R'\ :sub:`30low`
> -      - R'\ :sub:`31high`
> +      - R'\ :sub:`30high`
>        - R'\ :sub:`31low`
> -      - R'\ :sub:`32high`
> +      - R'\ :sub:`31high`
>        - R'\ :sub:`32low`
> -      - R'\ :sub:`33high`
> +      - R'\ :sub:`32high`
>        - R'\ :sub:`33low`
> +      - R'\ :sub:`33high`
> 

