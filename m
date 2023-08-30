Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20D3F78D846
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 20:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233144AbjH3SaC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 14:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242997AbjH3KDL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 06:03:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0B81B0
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 03:03:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 648CB61248
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 10:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044CDC433C7;
        Wed, 30 Aug 2023 10:03:06 +0000 (UTC)
Message-ID: <343ed7f5-194a-805c-5608-b9000a868d5f@xs4all.nl>
Date:   Wed, 30 Aug 2023 12:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/6] media: cec: core: add note about *_from_edid()
 function usage in drm
Content-Language: en-US, nl
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
References: <cover.1692884619.git.jani.nikula@intel.com>
 <7cebfea8f999d2d0d49533f9849d109830c5d1b6.1692884619.git.jani.nikula@intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <7cebfea8f999d2d0d49533f9849d109830c5d1b6.1692884619.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/08/2023 15:46, Jani Nikula wrote:
> In the drm subsystem, the source physical address is, in most cases,
> available without having to parse the EDID again. Add notes about
> preferring to use the pre-parsed address instead.
> 
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/media/cec/core/cec-adap.c     | 4 ++++
>  drivers/media/cec/core/cec-notifier.c | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
> index 241b1621b197..2c627ed611ed 100644
> --- a/drivers/media/cec/core/cec-adap.c
> +++ b/drivers/media/cec/core/cec-adap.c
> @@ -1688,6 +1688,10 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
>  }
>  EXPORT_SYMBOL_GPL(cec_s_phys_addr);
>  
> +/*
> + * Note: In the drm subsystem, prefer calling cec_s_phys_addr() with
> + * connector->display_info.source_physical_address if possible.
> + */

I would rephrase this:

/*
 * Note: in the drm subsystem, prefer calling (if possible):
 *
 * cec_s_phys_addr(adap, connector->display_info.source_physical_address, false);
 */

I think it is important to indicate that the last argument should be 'false'.

>  void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
>  			       const struct edid *edid)
>  {
> diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
> index 389dc664b211..13f043b3025b 100644
> --- a/drivers/media/cec/core/cec-notifier.c
> +++ b/drivers/media/cec/core/cec-notifier.c
> @@ -195,6 +195,10 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
>  }
>  EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr);
>  
> +/*
> + * Note: In the drm subsystem, prefer calling cec_notifier_set_phys_addr() with
> + * connector->display_info.source_physical_address if possible.
> + */

This comment is fine, there is no similar last argument here. But perhaps
it is good to use a similar format as above. Up to you.

>  void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
>  					  const struct edid *edid)
>  {

Regards,

	Hans
