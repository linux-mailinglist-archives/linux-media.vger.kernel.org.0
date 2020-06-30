Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E75720FDEB
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 22:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbgF3Uot (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 16:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728340AbgF3Uos (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 16:44:48 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF36AC061755;
        Tue, 30 Jun 2020 13:44:48 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 7C68426D012
Subject: Re: [PATCH v8 1/3] media: tpg: change char argument to const char
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20200630195052.23880-1-kgupta@es.iitr.ac.in>
 <20200630195052.23880-2-kgupta@es.iitr.ac.in>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <94403bfb-6fb5-55b7-72ad-2e4afc74aa1e@collabora.com>
Date:   Tue, 30 Jun 2020 17:44:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200630195052.23880-2-kgupta@es.iitr.ac.in>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/30/20 4:50 PM, Kaaira Gupta wrote:
> Change the argument of type char * to const char * for function
> tpg_gen_text().

I don't think it is required for this version, but it would be nicer
if you could add an explanation regarding why you are doing this change :)

> 
> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>

lgtm

Reviewed-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 10 +++++-----
>  include/media/tpg/v4l2-tpg.h                  |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> index 50f1e0b28b25..dde22a4cbd6c 100644
> --- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> +++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> @@ -1927,34 +1927,34 @@ typedef struct { u16 __; u8 _; } __packed x24;
>  
>  static noinline void tpg_print_str_2(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
>  			unsigned p, unsigned first, unsigned div, unsigned step,
> -			int y, int x, char *text, unsigned len)
> +			int y, int x, const char *text, unsigned len)
>  {
>  	PRINTSTR(u8);
>  }
>  
>  static noinline void tpg_print_str_4(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
>  			unsigned p, unsigned first, unsigned div, unsigned step,
> -			int y, int x, char *text, unsigned len)
> +			int y, int x, const char *text, unsigned len)
>  {
>  	PRINTSTR(u16);
>  }
>  
>  static noinline void tpg_print_str_6(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
>  			unsigned p, unsigned first, unsigned div, unsigned step,
> -			int y, int x, char *text, unsigned len)
> +			int y, int x, const char *text, unsigned len)
>  {
>  	PRINTSTR(x24);
>  }
>  
>  static noinline void tpg_print_str_8(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
>  			unsigned p, unsigned first, unsigned div, unsigned step,
> -			int y, int x, char *text, unsigned len)
> +			int y, int x, const char *text, unsigned len)
>  {
>  	PRINTSTR(u32);
>  }
>  
>  void tpg_gen_text(const struct tpg_data *tpg, u8 *basep[TPG_MAX_PLANES][2],
> -		  int y, int x, char *text)
> +		  int y, int x, const char *text)
>  {
>  	unsigned step = V4L2_FIELD_HAS_T_OR_B(tpg->field) ? 2 : 1;
>  	unsigned div = step;
> diff --git a/include/media/tpg/v4l2-tpg.h b/include/media/tpg/v4l2-tpg.h
> index eb191e85d363..9749ed409856 100644
> --- a/include/media/tpg/v4l2-tpg.h
> +++ b/include/media/tpg/v4l2-tpg.h
> @@ -241,7 +241,7 @@ void tpg_log_status(struct tpg_data *tpg);
>  
>  void tpg_set_font(const u8 *f);
>  void tpg_gen_text(const struct tpg_data *tpg,
> -		u8 *basep[TPG_MAX_PLANES][2], int y, int x, char *text);
> +		u8 *basep[TPG_MAX_PLANES][2], int y, int x, const char *text);
>  void tpg_calc_text_basep(struct tpg_data *tpg,
>  		u8 *basep[TPG_MAX_PLANES][2], unsigned p, u8 *vbuf);
>  unsigned tpg_g_interleaved_plane(const struct tpg_data *tpg, unsigned buf_line);
> 
