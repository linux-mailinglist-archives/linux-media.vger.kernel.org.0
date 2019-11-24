Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D90351082DD
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 11:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfKXK0v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 05:26:51 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:39017 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725980AbfKXK0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 05:26:51 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Yp6LiFqCmLwWdYp6OiSwsb; Sun, 24 Nov 2019 11:26:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574591208; bh=HD/JKKEdMs3W4QDS+rtaaDYQYHdNt3OyLlxuquE5Ovs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bXbeVGtcFlir9qZDkZGcAR8F8VcyeclDpSMkEWcIb4Z+AqT3OmQwwlu5u7SWTYxDV
         CYEiOMoRnSUTxo+0JjtoQITQQkQ4mtpG686t98dGXUtSYxrQYLT15zYdUlkTb3rbkX
         gOR/Qqv4Q+M0z0vzUoolOmBaRwh7rFEvsiAiRDtWWRAen2l/iymNkFEWJSspRZIhAO
         C8kL6ujLmUAf27kZmDstTdu4MuVAyJ/z7s4Uc1rPptdXXhmkm/qKL/1sMt3D8dh1dd
         0+NVXRnuS87kgG57XlbKv++He8G0R4YvbFOYeux1DaYIDO1AKgNpXc5GnaXZVx8ooq
         bDiOKSzw4R98A==
Subject: Re: [PATCH 05/10] edid-decode: output timings for YCbCr 4:2:0 cmdb
To:     joevt <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20191123164604.268-1-joevt@shaw.ca>
 <20191123164604.268-6-joevt@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <94798280-18ca-31af-6544-3cd6e9447f12@xs4all.nl>
Date:   Sun, 24 Nov 2019 11:26:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191123164604.268-6-joevt@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJeVSO0ApmzCUiWcr75Kf7syuGcxN26h+CLiskAJZ1vWLFZOifSwyJ4cvb6RMxgmXdRDHKQ+bgrqMgD3JQ89sCEd1qvCJ2Kod+xxj3xFUprbI9WEAXTD
 +Do3r8i5uNwIMc+5UE4kascv+yPQZMcAnm4795/IHwO8AwexaI0r/nHSHGUh1QKYyYJRybNtWWKjW59S1JdrWCKS9UThl5Lx1MI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/23/19 5:45 PM, joevt wrote:
> - "YCbCr 4:2:0 capability map data block" now outputs the modes that support YCbCr 4:2:0 instead of just indexes of the modes. Indexes refer to timings in "Video Data Block".
> - Warnings are included in the output if "Video Data Block" doesn't appear before "YCbCr 4:2:0 Capability Map Data Block" or if the index is outside the range defined in the "Video Data Block".
> - Moved inner loop of cta_svd into a new function cta_svd_one so that it can be reused by cta_y420cmdb.

This isn't sufficient. There may be multiple SVD blocks in the EDID, and that's not taken
into account.

Also, I can't find any requirement in the CTA-861 spec that the YCbCr 4:2:0 Capability
Map Data Block has to appear after all SVD blocks. So the final check if the Y420CMDB
block references invalid SVDs should be postponed to the end of the CTA block.

I also found a pre-existing bug: if length == 0 in cta_y420cmdb() then that means that
all SVDs support 4:2:0. That should be added to cta_y420cmdb().

Regards,

	Hans

> 
> Signed-off-by: Joe van Tunen <joevt@shaw.ca>
> ---
>  edid-decode.c | 44 +++++++++++++++++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 9 deletions(-)
> 
> diff --git a/edid-decode.c b/edid-decode.c
> index b833178..4d6fe29 100644
> --- a/edid-decode.c
> +++ b/edid-decode.c
> @@ -1454,13 +1454,10 @@ static const struct edid_cta_mode *vic_to_mode(unsigned char vic)
>  	return NULL;
>  }
>  
> -static void cta_svd(const unsigned char *x, unsigned n, int for_ycbcr420)
> +static void cta_svd_one(const unsigned char *x, int for_ycbcr420)
>  {
> -	unsigned i;
> -
> -	for (i = 0; i < n; i++)  {
>  		const struct edid_cta_mode *vicmode = NULL;
> -		unsigned char svd = x[i];
> +		unsigned char svd = x[0];
>  		unsigned char native;
>  		unsigned char vic;
>  		const char *mode;
> @@ -1468,7 +1465,7 @@ static void cta_svd(const unsigned char *x, unsigned n, int for_ycbcr420)
>  		unsigned clock_khz = 0;
>  
>  		if ((svd & 0x7f) == 0)
> -			continue;
> +			return;
>  
>  		if ((svd - 1) & 0x40) {
>  			vic = svd;
> @@ -1511,10 +1508,23 @@ static void cta_svd(const unsigned char *x, unsigned n, int for_ycbcr420)
>  		if (vic == 1)
>  			has_cta861_vic_1 = 1;
>  	}
> +
> +static void cta_svd(const unsigned char *x, int n, int for_ycbcr420)
> +{
> +	for (unsigned i = 0; i < n; i++)  {
> +		printf("    ");
> +		cta_svd_one(x+i, for_ycbcr420);
> +		printf("\n");
> +	}
>  }
>  
> +unsigned const char *last_cta_video_block_start = NULL;
> +unsigned last_cta_video_block_length = 0;
> +
>  static void cta_video_block(const unsigned char *x, unsigned length)
>  {
> +	last_cta_video_block_start = x;
> +	last_cta_video_block_length = length;
>  	cta_svd(x, length, 0);
>  }
>  
> @@ -1531,9 +1541,25 @@ static void cta_y420cmdb(const unsigned char *x, unsigned length)
>  		uint8_t v = x[0 + i];
>  		unsigned j;
>  
> -		for (j = 0; j < 8; j++)
> -			if (v & (1 << j))
> -				printf("    VSD Index %u\n", i * 8 + j);
> +		for (j = 0; j < 8; j++) {
> +			if (v & (1 << j)) {
> +				unsigned k = i * 8 + j;
> +				printf("    VSD Index %u", k + 1);
> +				if (k >= last_cta_video_block_length) {
> +					if (last_cta_video_block_start) {
> +						printf(" (out of range)");
> +					} else {
> +						printf(" (missing CTA video block)");
> +					}
> +				}
> +				else
> +				{
> +					printf(" ");
> +					cta_svd_one(last_cta_video_block_start+k, 0);
> +				}
> +				printf("\n");
> +			}
> +		}
>  	}
>  }
>  
> 

