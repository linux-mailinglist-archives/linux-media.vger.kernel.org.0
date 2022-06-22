Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24822554925
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240007AbiFVKSt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 06:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234833AbiFVKSd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 06:18:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE82F39BB1
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 03:18:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 70F16B81D7B
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 10:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C801C34114;
        Wed, 22 Jun 2022 10:18:28 +0000 (UTC)
Message-ID: <29f86dc9-a62c-63bc-fe53-e80b5e65b21c@xs4all.nl>
Date:   Wed, 22 Jun 2022 12:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 4/6] staging: media: wave5: Add TODO file
Content-Language: en-US
To:     Nas Chung <nas.chung@chipsnmedia.com>, linux-media@vger.kernel.org
Cc:     Robert Beckett <bob.beckett@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
References: <20220427114638.1638-1-nas.chung@chipsnmedia.com>
 <20220427114638.1638-5-nas.chung@chipsnmedia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220427114638.1638-5-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/04/2022 13:46, Nas Chung wrote:
> Add a TODO file listing all that is need for destaging.
> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  drivers/staging/media/wave5/TODO | 34 ++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 drivers/staging/media/wave5/TODO
> 
> diff --git a/drivers/staging/media/wave5/TODO b/drivers/staging/media/wave5/TODO
> new file mode 100644
> index 000000000000..070a1171b211
> --- /dev/null
> +++ b/drivers/staging/media/wave5/TODO
> @@ -0,0 +1,34 @@
> +* Mutli-stream Test
> +
> +* Loop Test
> +
> +* Handle interrupts better
> +
> +  Currently the interrupt handling uses an unusual design employing a kfifo to
> +  transfer irq status to irq thread. This was done as a work around for dropped
> +  interrupts seen with IRQF_ONESHOT based handling.
> +
> +  This needs further investigation and fixing properly, with the aid of
> +  C&M and StarFive engineers.
> +
> +* appropreate error handling:

appropreate -> appropriate

> +allocation failure, mutex acquire failure etc.
> +
> +* remove all unused struct fields
> +
> +* change struct fields to 'bool' type or bitfield when appropreate

Ditto

> +Likely good candidates are fields named '*_enable' , '*_on'
> +
> +* handle vdi_allocate_dma_memory failure , each function has to clean after itself
> +
> +* make sure that 'u32', 's32' etc. are only used when reading/writing hw
> +and change s32 to u32 when s32 is not required
> +
> +* power management handling - add (runtime_)suspen/resume cb where the clock is enabled
> +
> +* fix checkpatch issues (mostly fixes , only left to fix MACRO_ARG_REUSE, LONG_LINE)
> +
> +* revise logic of wave5_vpu_(dec/enc)_register_framebuffer
> +
> +* check if the  normal kernel endianness/__swab32 routines are sufficient. (instead of the ones
> +  implemented in the driver

The cover letter says:

"The wave5 driver will be updated to support various EXT_CTRL encoder interface."

Should that be added to the TODO file as well?

Note that I am not entirely sure which EXT CTRL encoder bits you refer to in the
cover letter, that sentence was a bit vague.

Regards,

	Hans
