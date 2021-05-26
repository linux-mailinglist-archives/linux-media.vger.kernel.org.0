Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCA3391466
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 12:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233798AbhEZKIe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 06:08:34 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:46763 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233773AbhEZKId (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 06:08:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id lqRFlSYYrWkKblqRIlCbAY; Wed, 26 May 2021 12:07:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622023621; bh=QP7uSUzeBedOP/1n1Z/ut19kYR8grdlDG6nSrUb3goY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jCJGhOSlNv0ZqqcCtMfrA8FQ74EymfZ3K4H0jRY2Ecx3dDKwMlRLA2ucRALVEx27I
         akevdPb03pv57nVfiksE6L/fye1UvCvppfaq/hIs9RBtoxSt4UTuKSx8pSOeq0Koc+
         JJFsAlX3eP8r4SEKJRNK6VrMRqLKYKhwBo3+vGGkjSYGBsRQy4AOmBY3c+hsqRb+XY
         wHk6tWZXUYxxjtFuNHehqiRTrzsWGrvcf2KK02OgK6j3L04HlOFpYP5B4FRZbYlc4L
         kauydH2camm7vnhbBDL+JNO/6MUt7bilALzC7Q5X00CZZAMJlRly6FN4KkzT/ApzFy
         bidrHrmtbEUtQ==
Subject: Re: [PATCH] drivers: media: Simplify the return expression of
 interpolate_value()
To:     zuoqilin1@163.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        zuoqilin <zuoqilin@yulong.com>
References: <20210524124754.1491-1-zuoqilin1@163.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f80d155f-42f3-1a7c-bf42-1b9ebb1e3889@xs4all.nl>
Date:   Wed, 26 May 2021 12:06:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210524124754.1491-1-zuoqilin1@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEIZc8FjKISpTvbf2DIVIS9NtYVSdR+1K5SQQMWD1/EwgYFOl+7yTkm6EMU8esoaLyaehDzCx6uQSSoSyhiCol8FkP4DHSq4zcLWD0bj8B6z7RIjJMLV
 CZ+RibIKBeIHLQH9VPWF4yt4Op1HBH1CCuNGqYxSzHXFtRUrutgvd/Pb3rrUQIF8fVh84vGxxmf6XcrkDAq2d7GyLxjwz/rVjcN0gpBXFS1Hd1LQ58U03UVg
 YzO6Jqz2MTy1tWK55MIFANU1kfRlm3Jrirok6OVbqCCab7cWlNgOSopvYXZFsH6AT70GkiZVIjHQBAM0OmpYXZcfRyBGkUTaNJIJe2qkaQ0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please include the driver you are changing in the subject line. I asked for that
before. Just saying 'drivers: media:' suggests it is a media-subsystem wide change.

Rejecting this and the other patch you posted on the same day with the same problem.

Regards,

	Hans

On 24/05/2021 14:47, zuoqilin1@163.com wrote:
> From: zuoqilin <zuoqilin@yulong.com>
> 
> Simplify the return expression.
> 
> Signed-off-by: zuoqilin <zuoqilin@yulong.com>
> ---
>  drivers/media/dvb-frontends/mb86a20s.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/mb86a20s.c b/drivers/media/dvb-frontends/mb86a20s.c
> index a7faf0c..fc80391 100644
> --- a/drivers/media/dvb-frontends/mb86a20s.c
> +++ b/drivers/media/dvb-frontends/mb86a20s.c
> @@ -1346,7 +1346,7 @@ static u32 interpolate_value(u32 value, const struct linear_segments *segments,
>  {
>  	u64 tmp64;
>  	u32 dx, dy;
> -	int i, ret;
> +	int i;
>  
>  	if (value >= segments[0].x)
>  		return segments[0].y;
> @@ -1367,9 +1367,7 @@ static u32 interpolate_value(u32 value, const struct linear_segments *segments,
>  	tmp64 = value - segments[i].x;
>  	tmp64 *= dy;
>  	do_div(tmp64, dx);
> -	ret = segments[i].y - tmp64;
> -
> -	return ret;
> +	return segments[i].y - tmp64;
>  }
>  
>  static int mb86a20s_get_main_CNR(struct dvb_frontend *fe)
> 

