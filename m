Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C9F49F6DC
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 11:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237790AbiA1KKx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 05:10:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiA1KKx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 05:10:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC4FC061714
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 02:10:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 912BB61DE2
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 10:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A03C340E0;
        Fri, 28 Jan 2022 10:10:51 +0000 (UTC)
Message-ID: <614a766a-2669-1141-732f-9f11c952fbda@xs4all.nl>
Date:   Fri, 28 Jan 2022 11:10:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCHv3 04/12] media: s5p_mfc_dec: set flags for OUTPUT coded
 formats
Content-Language: en-US
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
References: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
 <20190815144456.54583-5-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190815144456.54583-5-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I'm going through a bunch of (very) old patches in my patchwork TODO list
that for one reason or another I never processed. This patch is one of
them. I'd like to merge this if there are no objections.

Regards,

	Hans

On 15/08/2019 16:44, Hans Verkuil wrote:
> From: Maxime Jourdan <mjourdan@baylibre.com>
> 
> Tag all the coded formats where the s5p_mfc decoder supports dynamic
> resolution switching or has a bytestream parser.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../media/platform/s5p-mfc/s5p_mfc_common.h    |  1 +
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c   | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> index 96d1ecd1521b..31b133af91eb 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> @@ -723,6 +723,7 @@ struct s5p_mfc_fmt {
>  	enum s5p_mfc_fmt_type type;
>  	u32 num_planes;
>  	u32 versions;
> +	u32 flags;
>  };
>  
>  /**
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> index 61e144a35201..1423c33c70cb 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> @@ -62,6 +62,8 @@ static struct s5p_mfc_fmt formats[] = {
>  		.type		= MFC_FMT_DEC,
>  		.num_planes	= 1,
>  		.versions	= MFC_V5PLUS_BITS,
> +		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>  	},
>  	{
>  		.fourcc		= V4L2_PIX_FMT_H264_MVC,
> @@ -69,6 +71,8 @@ static struct s5p_mfc_fmt formats[] = {
>  		.type		= MFC_FMT_DEC,
>  		.num_planes	= 1,
>  		.versions	= MFC_V6PLUS_BITS,
> +		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>  	},
>  	{
>  		.fourcc		= V4L2_PIX_FMT_H263,
> @@ -76,6 +80,7 @@ static struct s5p_mfc_fmt formats[] = {
>  		.type		= MFC_FMT_DEC,
>  		.num_planes	= 1,
>  		.versions	= MFC_V5PLUS_BITS,
> +		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc		= V4L2_PIX_FMT_MPEG1,
> @@ -83,6 +88,8 @@ static struct s5p_mfc_fmt formats[] = {
>  		.type		= MFC_FMT_DEC,
>  		.num_planes	= 1,
>  		.versions	= MFC_V5PLUS_BITS,
> +		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>  	},
>  	{
>  		.fourcc		= V4L2_PIX_FMT_MPEG2,
> @@ -90,6 +97,8 @@ static struct s5p_mfc_fmt formats[] = {
>  		.type		= MFC_FMT_DEC,
>  		.num_planes	= 1,
>  		.versions	= MFC_V5PLUS_BITS,
> +		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>  	},
>  	{
>  		.fourcc		= V4L2_PIX_FMT_MPEG4,
> @@ -97,6 +106,8 @@ static struct s5p_mfc_fmt formats[] = {
>  		.type		= MFC_FMT_DEC,
>  		.num_planes	= 1,
>  		.versions	= MFC_V5PLUS_BITS,
> +		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>  	},
>  	{
>  		.fourcc		= V4L2_PIX_FMT_XVID,
> @@ -104,6 +115,7 @@ static struct s5p_mfc_fmt formats[] = {
>  		.type		= MFC_FMT_DEC,
>  		.num_planes	= 1,
>  		.versions	= MFC_V5PLUS_BITS,
> +		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc		= V4L2_PIX_FMT_VC1_ANNEX_G,
> @@ -111,6 +123,7 @@ static struct s5p_mfc_fmt formats[] = {
>  		.type		= MFC_FMT_DEC,
>  		.num_planes	= 1,
>  		.versions	= MFC_V5PLUS_BITS,
> +		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc		= V4L2_PIX_FMT_VC1_ANNEX_L,
> @@ -118,6 +131,7 @@ static struct s5p_mfc_fmt formats[] = {
>  		.type		= MFC_FMT_DEC,
>  		.num_planes	= 1,
>  		.versions	= MFC_V5PLUS_BITS,
> +		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc		= V4L2_PIX_FMT_VP8,
> @@ -125,6 +139,7 @@ static struct s5p_mfc_fmt formats[] = {
>  		.type		= MFC_FMT_DEC,
>  		.num_planes	= 1,
>  		.versions	= MFC_V6PLUS_BITS,
> +		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  	{
>  		.fourcc		= V4L2_PIX_FMT_HEVC,
> @@ -132,6 +147,8 @@ static struct s5p_mfc_fmt formats[] = {
>  		.type		= MFC_FMT_DEC,
>  		.num_planes	= 1,
>  		.versions	= MFC_V10_BIT,
> +		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION |
> +				  V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>  	},
>  	{
>  		.fourcc		= V4L2_PIX_FMT_VP9,
> @@ -139,6 +156,7 @@ static struct s5p_mfc_fmt formats[] = {
>  		.type		= MFC_FMT_DEC,
>  		.num_planes	= 1,
>  		.versions	= MFC_V10_BIT,
> +		.flags		= V4L2_FMT_FLAG_DYN_RESOLUTION,
>  	},
>  };
>  

