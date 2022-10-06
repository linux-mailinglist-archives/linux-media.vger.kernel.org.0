Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C505F6874
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 15:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiJFNqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 09:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiJFNqa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 09:46:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FE7754B8
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 06:46:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 695AE6199B
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 13:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA46C433D6;
        Thu,  6 Oct 2022 13:46:27 +0000 (UTC)
Message-ID: <57697459-50e6-5609-0634-6f7f12f21cbe@xs4all.nl>
Date:   Thu, 6 Oct 2022 15:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] edid-decode: fix clock step for CVT RBv3
Content-Language: en-US
To:     Simon Ser <contact@emersion.fr>, linux-media@vger.kernel.org
References: <20221005121221.14882-1-contact@emersion.fr>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221005121221.14882-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Simon,

On 10/5/22 14:12, Simon Ser wrote:
> According to CVT 2.0 table 3-2, C_CLOCK_STEP = 0.001 for both
> RBv2 and RBv3.

Another nice catch!

Thank you,

	Hans

> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>  calc-gtf-cvt.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/calc-gtf-cvt.cpp b/calc-gtf-cvt.cpp
> index dc22ad535135..6330bb7ac814 100644
> --- a/calc-gtf-cvt.cpp
> +++ b/calc-gtf-cvt.cpp
> @@ -152,7 +152,7 @@ timings edid_state::calc_cvt_mode(unsigned h_pixels, unsigned v_lines,
>  	double interlace = int_rqd ? 0.5 : 0;
>  	double total_active_pixels = h_pixels_rnd + hor_margin * 2;
>  	double v_field_rate_rqd = int_rqd ? ip_freq_rqd * 2 : ip_freq_rqd;
> -	double clock_step = rb == RB_CVT_V2 ? 0.001 : 0.25;
> +	double clock_step = rb >= RB_CVT_V2 ? 0.001 : 0.25;
>  	double h_blank = (rb == RB_CVT_V1 || (rb == RB_CVT_V3 && alt)) ? 160 : 80;
>  	double rb_v_fporch = rb == RB_CVT_V1 ? 3 : 1;
>  	double refresh_multiplier = (rb == RB_CVT_V2 && alt) ? 1000.0 / 1001.0 : 1;

