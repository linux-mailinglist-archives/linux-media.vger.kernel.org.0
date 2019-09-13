Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D07E7B1E0E
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbfIMNAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:00:14 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:41639 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730272AbfIMNAN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:00:13 -0400
Received: from [IPv6:2001:420:44c1:2577:888a:538c:8dda:557b] ([IPv6:2001:420:44c1:2577:888a:538c:8dda:557b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8lBIiWgdfV17O8lBLi2hZJ; Fri, 13 Sep 2019 15:00:11 +0200
Subject: Re: [Patch 02/13] media: am437x-vpfe: Fix missing first line
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-3-bparrot@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <018a5f55-a750-c86d-da82-2b7c586cb33e@xs4all.nl>
Date:   Fri, 13 Sep 2019 15:00:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909162743.30114-3-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFOjpCl+mpovnjlfvZNktYbZD5Fxh/9Jy/6b+9DTn74H4KMwT9wFTUfbhL0/sOJRLJytI29TC0zENCVs6gSrowG7egXGEpb1aJiC9Rn4luEBW4qnF7Gh
 l8cvAgbwfMjG27cy+vcZ+kdidMTtgT+0y1g4j5P4BGJANuPV8xWQDOyAPIJqSqqwIfedqC3ap0Px84ajgKlrhWhAVuA2Ya1QSD3M5Q+MJXsDM/dgaR5seC0p
 Zr+ZqhvVCFhMjo0rd1N27yJPAaOoafcoidKlTwAnjBOOYzq5iCXbKfOpUsKXhXYTsUibDZE+zsOG9jrachN5oBSm+kK/dlmDlcGN68RUUzgKPOgC4wphmC49
 31hy/ovoBoP/ADv8utCyVFeYWtn4gsMj/3kFZ5HZn6N/YHGndVfSDcqPQY8zNUi1BXj2rBgnPDdf3fUiVcFi7s1m03MJeA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/9/19 6:27 PM, Benoit Parrot wrote:
> Previous generation of this driver were hard coded to handle
> encoder/decoder were the first line never contains any data and

were -> where

> was therefore always skipped, however when dealing with actual
> camera sensor the first line is always present.

sensor -> sensors

Regards,

	Hans

> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index ab959d61f9c9..0ecb75bf5abd 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -345,13 +345,9 @@ static void vpfe_ccdc_setwin(struct vpfe_ccdc *ccdc,
>  	if (frm_fmt == CCDC_FRMFMT_INTERLACED) {
>  		vert_nr_lines = (image_win->height >> 1) - 1;
>  		vert_start >>= 1;
> -		/* Since first line doesn't have any data */
> -		vert_start += 1;
>  		/* configure VDINT0 */
>  		val = (vert_start << VPFE_VDINT_VDINT0_SHIFT);
>  	} else {
> -		/* Since first line doesn't have any data */
> -		vert_start += 1;
>  		vert_nr_lines = image_win->height - 1;
>  		/*
>  		 * configure VDINT0 and VDINT1. VDINT1 will be at half
> 

