Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C601B57B0
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 11:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgDWJEs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 05:04:48 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:33645 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725884AbgDWJEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 05:04:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RXmljLA0v7xncRXmojPrkw; Thu, 23 Apr 2020 11:04:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587632686; bh=DMvubRBQqXiyEbcMdqC10gncpLndhd6V1EwrYaS/Yv0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Q2JBFtdiMAUgAJU3aaRy19L1xaUUFYz9LzPCM+ITIf//y1DON1uvHZ8UyZr2JXpnm
         zJY5dCx/9lXwS86dcm3OWkw37UHhJpY3PgfOwi35dA1/Wvo97IPYnPvyQ2X6nzts8n
         B2VXsyr1AkwfDLeDdXHixGkgu4AsCmBJLduS3PTpYMtnsEyzH0FoNtJ/HTFaPcBy1L
         aXVM/6Y3mAvlfRUsBQbM3YKgJUZrgky56M/CNxP5QYrEoaYMMbl+jVWeCg+AddQMjk
         D5v8eESELDPitOxyV4bWLr4Ptucfpru+2BYOhfYqRIVG3yLBZ8z1xZVlHaGtlmo2Y/
         uHXWhkW7r8xeQ==
Subject: Re: [PATCH 07/12] utils: fix implicit double promotion
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200422003735.3891-1-rosenp@gmail.com>
 <20200422003735.3891-7-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <41f2c748-02aa-f5e0-eb9b-9e68c95da739@xs4all.nl>
Date:   Thu, 23 Apr 2020 11:04:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200422003735.3891-7-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKBa5WKnXNUpWjHcPhXRax9QLhqRDtIeXhLlrtHrtIHQzFgPlIqC23MPY/+9ScAXvhqJLkFgfLbA47pPE7lcTHqSCFeXmpi0s7cGV22QGeqeBxYQOYPp
 FN4NkSg52rulb8fjLQW3Th4+vUmrXhFavyUgN47SJFaBRBeYeHcNz/smnzsOmW4X3ySdUPjCL3M46sGdpbiWgaRW47xIAUT11dw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2020 02:37, Rosen Penev wrote:
> Found with -Wimplicit-float-conversion
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/rds-ctl/rds-ctl.cpp | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
> index 0e497b2a..cc1d3bf7 100644
> --- a/utils/rds-ctl/rds-ctl.cpp
> +++ b/utils/rds-ctl/rds-ctl.cpp
> @@ -525,7 +525,7 @@ static void print_rds_statistics(const struct v4l2_rds_statistics *statistics)
>  
>  	if (statistics->block_cnt)
>  		block_error_percentage =
> -			(static_cast<float>(statistics->block_error_cnt) / statistics->block_cnt) * 100.0;
> +			(static_cast<float>(statistics->block_error_cnt) / statistics->block_cnt) * 100.0f;
>  	printf("block errors / group errors: %u (%3.2f%%) / %u \n",
>  		statistics->block_error_cnt,
>  		block_error_percentage, statistics->group_error_cnt);
> @@ -534,7 +534,7 @@ static void print_rds_statistics(const struct v4l2_rds_statistics *statistics)
>  
>  	if (statistics->block_cnt)
>  		block_corrected_percentage = (
> -			static_cast<float>(statistics->block_corrected_cnt) / statistics->block_cnt) * 100.0;
> +			static_cast<float>(statistics->block_corrected_cnt) / statistics->block_cnt) * 100.0f;
>  	printf("corrected blocks: %u (%3.2f%%)\n",
>  		statistics->block_corrected_cnt, block_corrected_percentage);
>  	for (int i = 0; i < 16; i++)
> 

I think this patch can be removed once the type of block_error_percentage and
block_corrected_percentage is changed to double, so I am skipping this patch.

Regards,

	Hans
