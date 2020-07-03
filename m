Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC8C2136AE
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 10:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgGCIqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 04:46:06 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:55211 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725779AbgGCIqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jul 2020 04:46:05 -0400
Received: from [78.134.117.153] (port=36702 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1jrHKd-00048h-Ld; Fri, 03 Jul 2020 10:46:04 +0200
Subject: Re: [PATCH] imx274: fix frame interval handling
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Leon Luo <leonl@leopardimaging.com>
References: <9f73f763-3b1f-bf18-0b4e-b69cfa22620b@xs4all.nl>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <39775903-00ed-20fe-2cad-0795196093cf@lucaceresoli.net>
Date:   Fri, 3 Jul 2020 10:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9f73f763-3b1f-bf18-0b4e-b69cfa22620b@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

[Cc: ing the imx274 maintainer]

On 02/07/20 15:52, Hans Verkuil wrote:
> 1) the numerator and/or denominator might be 0, in that case
>    fall back to the default frame interval. This is per the spec
>    and this caused a v4l2-compliance failure.
> 
> 2) the updated frame interval wasn't returned in the s_frame_interval
>    subdev op.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/i2c/imx274.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index 6011cec5e351..a9304b98f7af 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -1235,6 +1235,8 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
>  	ret = imx274_set_frame_interval(imx274, fi->interval);
> 
>  	if (!ret) {
> +		fi->interval = imx274->frame_interval;
> +
>  		/*
>  		 * exposure time range is decided by frame interval
>  		 * need to update it after frame interval changes
> @@ -1730,9 +1732,9 @@ static int imx274_set_frame_interval(struct stimx274 *priv,
>  		__func__, frame_interval.numerator,
>  		frame_interval.denominator);
> 
> -	if (frame_interval.numerator == 0) {
> -		err = -EINVAL;
> -		goto fail;
> +	if (frame_interval.numerator == 0 || frame_interval.denominator) {

Missing '== 0'?

Please excuse my noobness, but I'm unable to understand which code path
would lead to calling imx274_set_frame_interval() with a zero here. I'm
assuming the v4l2 framework won't call imx274_s_frame_interval() with
numerator or denominator set to zero.

-- 
Luca
