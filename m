Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3946F23A299
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 12:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgHCKN7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 06:13:59 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:57309 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725951AbgHCKN7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 06:13:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 2XTgkn7nfuuXO2XThkbxJj; Mon, 03 Aug 2020 12:13:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596449637; bh=sawjpA9yuhKZYg5oldMKkjlZ4rJeHY9PQAV3y6xGM0E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Jjub5vXYiyZCYNyq3sF0sj53bj14fkIt2q4K2jVWFGAOVS+090LLnQ3MZNNwe8nla
         +B1wly5xn0/ejBrFmSUJ1NqT7f5HrtD349Gjl6EV6uv3AqGq0UMTnLDUFXJ2y5dKgq
         WicZib5PInyJGt8/Y+DuBkqappsuAMwcSV4vELr/2EugqsYBvf9w8y9i9g+5TxVoq+
         pGlNbqBUJ007biL/IH0s+IfIRVsPGtXhwAmd5Ecad6xRRh/eWBftiQTW1Hzf5iWcd+
         UPy72DeFDVNjiQXkaOpDaQsfUoORjTAVY3dNWzUNocyMcgBsHtPkcq3FTgOpp0LJq5
         98L8BG4HttLlw==
Subject: Re: [PATCH 1/8] fix GCC enum warning
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200727031456.232955-1-rosenp@gmail.com>
 <20200727031456.232955-2-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0ef63b12-e469-e857-8570-498b80aa1768@xs4all.nl>
Date:   Mon, 3 Aug 2020 12:13:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727031456.232955-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfILsCwudM1NLZ6keqyYQvvQbGUiS0D0Q+shFyiX9kZC1uQ3klnl6tV8YKbiihN2ttU/knmSLjOl8Xig/QfiReHoilNV7zgF4XAk3iVR3gGvPAmmSDd/K
 Y9YJsKUDUwThrfew1WV8yQI2VLfLeHzhTu6Xvd/3NTsFEWqUlcjr1URHvR43vO9faJB0fzKUerBeNW+QcgA1idtKDks7e5biHW5X9alwESFc2TqtfTYkozm8
 Xy0xFTDBcazeWwk50kJ1a6BVD/hVwg7STrvdDykFX28P5Gf75BJrmxVrja5JqdtgH+55vMY9rStC3Is4Bw2H+w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/07/2020 05:14, Rosen Penev wrote:
> Found with -Wenum-compare

Can you copy the warning in this commit log?

Regards,

	Hans

> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/common/v4l-helpers.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
> index e093e717..edd21c16 100644
> --- a/utils/common/v4l-helpers.h
> +++ b/utils/common/v4l-helpers.h
> @@ -877,7 +877,7 @@ v4l_format_g_hsv_enc(const struct v4l2_format *fmt)
>  {
>  	unsigned hsv_enc = v4l_format_g_ycbcr_enc(fmt);
>  
> -	return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;
> +	return hsv_enc < V4L2_HSV_ENC_180 ? unsigned(V4L2_HSV_ENC_180) : hsv_enc;
>  }
>  
>  static inline void v4l_format_s_quantization(struct v4l2_format *fmt,
> 

