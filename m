Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1118359651
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 09:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhDIH1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 03:27:06 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:40293 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229621AbhDIH1G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 03:27:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id UlXUlYlbJgIC3UlXYlBMSQ; Fri, 09 Apr 2021 09:26:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617953212; bh=CAEIwKj3X76oz7KxEQomi77buHSBZk7Ze/1D90Ei9e8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=n/a/t+7B5rmX7paTuiC16pUydqp1HEhmpUQRg2gG/3yZz/jKlf5eIur6ZME4hYVdG
         xk7M6vxSahTZm56g3KTavl1sgIpGJ7CpPbQr1m+XoXNHy5vx/sY/dFygidfX/cHfAv
         KKtD0ehym1BN5BvrkrjbvJSl486lb7Q9r8/5Fh/Loa/mBlzHJdgZjUlJqQGF++aWTa
         /Xyfrzot9+7Xwz0Tx+3ZIceb3Bhxd7g/Dm/ciL3yGazLnX0MIdSFKHTULuJ4uKhmZ4
         uKvtaIYWVlmjCGnvAp894DlT4gjgOuVAVBN+JHfKZYeU2gO0nrUPq3w+MjZY8gt3a5
         +lKIvyqkeVPgA==
Subject: Re: [PATCH] staging: media: zoran: reduce length of a line
To:     Mitali Borkar <mitaliborkar810@gmail.com>, clabbe@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
References: <YG9zvMnYlZVbJhQn@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <003b2d17-2fe4-c3f3-6b1e-60d0301a1413@xs4all.nl>
Date:   Fri, 9 Apr 2021 09:26:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YG9zvMnYlZVbJhQn@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFJJJBK955hvzlpccXP9vNThirZiryIss2Ro6C/Jnh15Fz9TQVqW45+Le3jHQFhuV2ph0EZwwhhVlvEDAkehFBJ7WcHYzetIPV/E2JMgh5PDMxefQBxK
 PB1bQae+4seIWsEbB1QHg9qnTHGJnjx6Rki8XVoUD8ICtAh29P2AGe25RJkPcW5eRU9U1GjhQN9YNujxstMAp84N82ntXyoJbofV89iLnu5x8mqPInTKIe5s
 dhJm3TxD40CK9dR6zGMKtxq2xgmnEh6hgHJbPm7gCasQqP3NtHvPEm4F/LUSWu4HZRWf+T5JO4FJSJv3J3UMPyI5pfQCzGMMnF9l8iDPft7YfKA44MdMMoOD
 ngD6uX/kQeuokaHt1T5s94F6agR57Yz9aaQ6l3mFYy5CpL3vc2koXy87GpTr9P/pw7/qHzYClX7LwDdy3Aq5Ep8Xd2FV1LXid5IXtcxtjsNyBwhcZ1BzBKPZ
 k/i2AcVIpuohFBqaynIhfE2uXdxVyxErgCo4lQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mitali,

Something to improve:

On 08/04/2021 23:21, Mitali Borkar wrote:
> Reduced length of a line which exceed the 100 columns limit by splitting
> the line into two statements and commenting it with '*'
> Reported by checkpatch.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/media/zoran/zr36060.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
> index 4f9eb9ff2c42..035634fc1c6d 100644
> --- a/drivers/staging/media/zoran/zr36060.c
> +++ b/drivers/staging/media/zoran/zr36060.c
> @@ -249,7 +249,9 @@ static const char zr36060_ta[8] = { 0, 1, 1, 0, 0, 0, 0, 0 };	//table idx's AC
>  static const char zr36060_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
>  static const char zr36060_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
>  
> -/* SOF (start of frame) segment depends on width, height and sampling ratio of each color component */
> +/* SOF (start of frame) segment depends on width,
> + * height and sampling ratio of each color component
> + */

See the coding style guidelines: the preferred style for long comments is:

/*
 * text
 * text
 */

Regards,

	Hans

>  static int zr36060_set_sof(struct zr36060 *ptr)
>  {
>  	char sof_data[34];	// max. size of register set
> 

