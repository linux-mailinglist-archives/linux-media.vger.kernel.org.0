Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 042A435C0FF
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239635AbhDLJSz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:18:55 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35899 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242026AbhDLJR7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:17:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Vsh9l4ds1MxedVshClcWf2; Mon, 12 Apr 2021 11:17:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618219057; bh=Q1WZNfMjfd81Sw0tEZCD6aKfvpmjF/TsYGs4OFIOV90=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=o+/G/vwvsxmiN6f9yPpXnexKz/biPXZQl/+q892dF7qwphl7qU7rMSNrkay5sYpmY
         EiBXWrQ4kCGqRas76lMzhtLD84rQmBkKsY6jzbxOP8D43FEKi634GKRzFDUpp3Rnv9
         v7l53TByppykUspP8DbzfNCTVzS+RSY70u2AKjW39vL4uqzY8b1nMYi13rfLAYGpFD
         /vrSaVeIVi1j525TMHSY5pwjlNVrkiQunNBXLcrALw0J8AbD80AeYRjCvEU6pUO7/g
         EnGxIn8SR6pfEWuI+k9aads8Cqqr5VgDgStsbvRBxNwfdiBcLyL0cGg7/Ep3UeMOup
         sLwdMicOoo1jQ==
Subject: Re: [PATCH v2] staging: media: meson: vdec: declare u32 as const and
 static const
To:     Mitali Borkar <mitaliborkar810@gmail.com>, narmstrong@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in, linux-amlogic@lists.infradead.org
References: <YHIDufKhTEeuxyl5@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <88d04746-717d-5a7a-7ea7-67cf6c95aba9@xs4all.nl>
Date:   Mon, 12 Apr 2021 11:17:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHIDufKhTEeuxyl5@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBXMnifIVjZ62y0VHvnBJNSP+hYxNbiNOZUfNetfEJgBcv5GMZ7getv0zN6yKyIx13mzQ7aTrYqwCmTTMLYyK7NQCiI56Mim4l4qN7U1OJEtPirTxTaG
 wAIJSK62f+3rEUKw6xbtNv93Z77fl7qctwlLxqDe/ABpVE3pcRpcNdMFZovtEeo+aq1rBpa/w26EwT0OhPBPZA4A8uyyVCN6U4t7nCy69kzZHrjV88ZyihYT
 nTWyeUBWznOsD99N+Dn/DWVtt+XGQ59EpzKaYyLvnG5kGOSdNGVCL4nZprNPI0dqkoZZQ+sVfCgFiaPDHfsipka8aV8WLWoP8V1WIlkZ8Ab62W7YsVYaQ3iO
 ansPPfKTP4dfu8bD+NIMZb6vWnjsNYwWo4faIFL1SSjvcpDCu/m82sq5S2aA0a2n/2G9W/t6z3cIkeyVMXyr/drugGue6ygTa3dtYumausj7yBx2EhGaj9LG
 EbX73dVXhEcsdkUwsESaJjcVx4quNChI25SjjPB3ol3wmWm6RbfO8xs6Zht/yWosh3ksT4xs9eE7f2tQ3uYfGa8XgXlY4iSeYdVzPpARdpFkuVXzsxTWaxX7
 hcsVUTO77rgfsjK0ekHUKUwzthrqK00iSKv2LEGjkA/6/YVG1NDn9tMCPbJVjKFqtgm5eKjBGTFcbJhOiVYIIUR2
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/04/2021 21:59, Mitali Borkar wrote:
> Declared 32 bit unsigned int as static constant inside a function and
> replaced u32[] {x,y} as canvas1, canvas2 in codec_mpeg12.c
> This indicates the value of canvas indexes will remain constant throughout execution.
> Replaced u32 reg_base and u32 reg_name with const u32 reg_base and const
> u32 reg_name as it will contain data/registry bases to write static
> const indexes declared above and will keep track of of contiguos
> registers after each reg_base.
> This makes code look better, neater. It improves readability.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 5 +++--

Also change drivers/staging/media/meson/vdec/codec_h264.c.

It's a nice improvement, so let's do this for both callers of amvdec_set_canvases().

Regards,

	Hans

>  drivers/staging/media/meson/vdec/vdec_helpers.c | 2 +-
>  drivers/staging/media/meson/vdec/vdec_helpers.h | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> index 21e93a13356c..861d8584f22f 100644
> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> @@ -65,6 +65,8 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
>  	struct amvdec_core *core = sess->core;
>  	struct codec_mpeg12 *mpeg12;
>  	int ret;
> +	static const u32 canvas1[] = { AV_SCRATCH_0, 0 };
> +	static const u32 canvas2[] = { 8, 0 }
>  
>  	mpeg12 = kzalloc(sizeof(*mpeg12), GFP_KERNEL);
>  	if (!mpeg12)
> @@ -80,8 +82,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
>  		goto free_mpeg12;
>  	}
>  
> -	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
> -				  (u32[]){ 8, 0 });
> +	ret = amvdec_set_canvases(sess, canvas1, canvas2);
>  	if (ret)
>  		goto free_workspace;
>  
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> index 7f07a9175815..df5c27266c44 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> @@ -177,7 +177,7 @@ static int set_canvas_nv12m(struct amvdec_session *sess,
>  }
>  
>  int amvdec_set_canvases(struct amvdec_session *sess,
> -			u32 reg_base[], u32 reg_num[])
> +			const u32 reg_base[], const u32 reg_num[])
>  {
>  	struct v4l2_m2m_buffer *buf;
>  	u32 pixfmt = sess->pixfmt_cap;
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
> index cfaed52ab526..ace8897c34fe 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.h
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
> @@ -17,7 +17,7 @@
>   * @reg_num: number of contiguous registers after each reg_base (including it)
>   */
>  int amvdec_set_canvases(struct amvdec_session *sess,
> -			u32 reg_base[], u32 reg_num[]);
> +			const u32 reg_base[], const u32 reg_num[]);
>  
>  /* Helpers to read/write to the various IPs (DOS, PARSER) */
>  u32 amvdec_read_dos(struct amvdec_core *core, u32 reg);
> 

