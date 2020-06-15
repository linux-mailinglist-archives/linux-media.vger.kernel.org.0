Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBCF1F9579
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 13:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729719AbgFOLnF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 07:43:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43426 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729665AbgFOLnC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 07:43:02 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BB6EF9;
        Mon, 15 Jun 2020 13:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592221379;
        bh=3hOFSk1cK+34wG1bvEHtnU19F5HIAao7dBTnNKSogOQ=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=aB9BsE6jshqEs4ZUENzYYx1jOrqIKcOnN+G7gt++nJsWhesia0/x21d6YP1912Far
         U93Jt+AyiKgScOimZA758aS/MnV9nq6tmJ9Lksa8Hg+VGGE5aYy1tV3exiIeHo7Wrv
         UW2Yh2SGdm75ATJ+x01FgGI3d2+WuGbkKumPSYWw=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 1/2] media: tpg: Add function to return colors' order
 of test image
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl
References: <20200614200239.18453-1-kgupta@es.iitr.ac.in>
 <20200614200239.18453-2-kgupta@es.iitr.ac.in>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <50f015af-3c09-3871-78a4-026baca56345@ideasonboard.com>
Date:   Mon, 15 Jun 2020 12:42:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614200239.18453-2-kgupta@es.iitr.ac.in>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kaaira,

On 14/06/2020 21:02, Kaaira Gupta wrote:
> Currently there is no method to know the correct order of the colors for
> a test image generated by tpg. Write a function that returns a string of
> colors' order given a tpg. It returns a NULL pointer in case of test
> patterns which do not have a well defined colors' order. Hence add a
> NULL check for text in tpg_gen_text().
> 
> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> ---
>  drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 32 +++++++++++++++++--
>  include/media/tpg/v4l2-tpg.h                  |  1 +
>  2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> index 50f1e0b28b25..c8257e860c6e 100644
> --- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> +++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> @@ -1959,12 +1959,14 @@ void tpg_gen_text(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
>  	unsigned step = V4L2_FIELD_HAS_T_OR_B(tpg->field) ? 2 : 1;
>  	unsigned div = step;
>  	unsigned first = 0;
> -	unsigned len = strlen(text);
> +	unsigned len;
>  	unsigned p;
>  
> -	if (font8x16 == NULL || basep == NULL)
> +	if (font8x16 == NULL || basep == NULL || text == NULL)
>  		return;
>  
> +	len = strlen(text);
> +
>  	/* Checks if it is possible to show string */
>  	if (y + 16 >= tpg->compose.height || x + 8 >= tpg->compose.width)
>  		return;
> @@ -2006,6 +2008,32 @@ void tpg_gen_text(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
>  }
>  EXPORT_SYMBOL_GPL(tpg_gen_text);
>  
> +char *tpg_g_color_order(const struct tpg_data *tpg)
> +{
> +	switch (tpg->pattern) {
> +	case TPG_PAT_75_COLORBAR:
> +		return "Left to right: white, yellow, cyan, green, magenta, red, blue, black";
> +	case TPG_PAT_100_COLORBAR:
> +		return "Left to right: white, yellow, cyan, green, magenta, red, blue, black";
> +	case TPG_PAT_CSC_COLORBAR:
> +		return "Left to right: white, yellow, cyan, green, magenta, red, blue, black";

Those three options return identical strings.

In C you can 'fallthrough' on case statements like this:

> switch (tpg->pattern) {
> case TPG_PAT_75_COLORBAR:
> case TPG_PAT_100_COLORBAR:
> case TPG_PAT_CSC_COLORBAR:
>	return "Left to right: white, yellow, cyan, green, magenta, red, blue, black";

So all three of those options will go to the same return statement.


> +	case TPG_PAT_100_HCOLORBAR:
> +		return "Top to bottom: white, yellow, cyan, green, magenta, red, blue, black";

It would be nice to be able to factor out the common color sequence from
those (two remaining) strings too, as only the direction changes.

But perhaps it's a pain to have to do a string join in this call,
especially given it's static string data otherwise, but that's also a
good reason not to duplicate unnecessarily (as it wastes space in memory).

With those fixed,

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>



> +	case TPG_PAT_BLACK:
> +		return "Black";
> +	case TPG_PAT_WHITE:
> +		return "White";
> +	case TPG_PAT_RED:
> +		return "Red";
> +	case TPG_PAT_GREEN:
> +		return "Green";
> +	case TPG_PAT_BLUE:
> +		return "Blue";
> +	default:
> +		return NULL;
> +	}
> +}
> +
>  void tpg_update_mv_step(struct tpg_data *tpg)
>  {
>  	int factor = tpg->mv_hor_mode > TPG_MOVE_NONE ? -1 : 1;
> diff --git a/include/media/tpg/v4l2-tpg.h b/include/media/tpg/v4l2-tpg.h
> index eb191e85d363..4f79cac87b85 100644
> --- a/include/media/tpg/v4l2-tpg.h
> +++ b/include/media/tpg/v4l2-tpg.h
> @@ -252,6 +252,7 @@ void tpg_fillbuffer(struct tpg_data *tpg, v4l2_std_id std,
>  bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc);
>  void tpg_s_crop_compose(struct tpg_data *tpg, const struct v4l2_rect *crop,
>  		const struct v4l2_rect *compose);
> +char *tpg_g_color_order(const struct tpg_data *tpg);
>  
>  static inline void tpg_s_pattern(struct tpg_data *tpg, enum tpg_pattern pattern)
>  {
> 

-- 
Regards
--
Kieran
