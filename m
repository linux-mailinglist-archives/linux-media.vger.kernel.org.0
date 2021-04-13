Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5123635E255
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 17:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346506AbhDMPKl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 11:10:41 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49113 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229812AbhDMPKj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 11:10:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WKg5lFlIKMxedWKg8lj9kz; Tue, 13 Apr 2021 17:10:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618326617; bh=APSrpDri2gHEYWyjG8TbwYgAolOfNqXeXdzok49rhQM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DUMMkDg3NE0JepjNZ6wA6SkSGRf5FFUN6K9xFcejyHDe4QtZZHwZGeDeUDxKASkgM
         YnXde8OKmHqkYDVv0eni6NwWsAyP0s7tXZtpCsbNeX+kFZAVencNtv9RUDEYqc0Mk1
         C8DAFYh4mW86MIU1gajAETC0p2WS6C7a6+Afv0B7sxxsk2K4sqQYobr64jyEavX/6t
         WBfiVclE+eQthhTYjkK1v6cw6ixkwTuqG6xyaFde5VCyTWb1g7P4agJpDOXulAWyI6
         1bR7PRI/KGvnkyVgzoiUGQmUnQ1toVefAQw+5+z1y8J8y29w2581Y3/H89hOKLVzhV
         8b4gaPORGGJKQ==
Subject: Re: [PATCH v3] staging: media: meson: vdec: declare u32 as static
 const
To:     Mitali Borkar <mitaliborkar810@gmail.com>, narmstrong@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
References: <YHWmiBYAbOUw5YrY@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a7162f8a-e706-c144-c355-7e2a130c453d@xs4all.nl>
Date:   Tue, 13 Apr 2021 17:10:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHWmiBYAbOUw5YrY@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOp7iwyIYwwEGU6SZLgtanc/6jZz3y+gJlF5rx1w3QIiBopfW+X08QRP5Q3HsQMW4Oi6IwSkpRk4fHgoShiyLN0l6YZtbwDMvSRK8CbjBM1fMSdDMKv7
 SKoWodaiijQpgUekfb4A/mi5fvm+KScYddjHWQ6PBb3c3cR+Lp3jrymUDSg2hdEHWRRIpG49cUwLGVU5TwPpXx6mn2f8OllcYxs/pXZKJP5P552gJ6W0S2nc
 6VnbQul+cFr2w4p5cV85iBKhtzNMXtDZSFAxG2j11Qe4RNeGCLOYu3BfooODMlB/jkfZx+0F4amJGmk3vESY26uvt+keLZ6i+wgGr0lW/r0UvxLLSX9AoP/Z
 Clp2QhI+8W01vyQ+2dEn+1Wj7v1g9VsOYppMwZBScmzzv111S3OwJ7ik4vGnkZDkrHYH6u54hSghA4RO0LTPQMabuolnJh1X/XI+9sfznWdeEKMcz3jl3MJc
 5nfW4UL4XTcjcJktxog8gbj81l/tb4yOfsKwsNhx0PyP/9qab6bTfmHDdU4O0DJGVYACb2RwFIoh1UX0NnzOJWubRlDNlesanw0UpfDsAKaBYEyJ6lafvldt
 X4cC46z1S6rU19UA+hPpOTcZq5PLMhdvP0J7Jw4McF6umGlH9LXQQuw/RKJ7+NcX0UJ5YuhvRTcIwnTRxBMV1QQi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/04/2021 16:11, Mitali Borkar wrote:
> Declared 32 bit unsigned int as static constant inside a function and
> replaced u32[] {x,y} as canvas3, canvas4 in codec_h264.c
> This indicates the value of canvas indexes will remain constant throughout execution.

checkpatch.pl output:

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#9:
This indicates the value of canvas indexes will remain constant throughout execution.

Regards,

	Hans

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
> Changes from v2:- Rebased this patch and made changes against mainline code
> Changes from v1:- Rectified mistake by declaring u32 as static const
> properly as static const u32 canvas'x'[]
> 
>  drivers/staging/media/meson/vdec/codec_h264.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
> index c61128fc4bb9..80141b89a9f6 100644
> --- a/drivers/staging/media/meson/vdec/codec_h264.c
> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> @@ -287,10 +287,10 @@ static void codec_h264_resume(struct amvdec_session *sess)
>  	struct amvdec_core *core = sess->core;
>  	struct codec_h264 *h264 = sess->priv;
>  	u32 mb_width, mb_height, mb_total;
> +	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
> +	static const u32 canvas4[] = { 24, 0 };
>  
> -	amvdec_set_canvases(sess,
> -			    (u32[]){ ANC0_CANVAS_ADDR, 0 },
> -			    (u32[]){ 24, 0 });
> +	amvdec_set_canvases(sess, canvas3, canvas4);
>  
>  	dev_dbg(core->dev, "max_refs = %u; actual_dpb_size = %u\n",
>  		h264->max_refs, sess->num_dst_bufs);
> 

