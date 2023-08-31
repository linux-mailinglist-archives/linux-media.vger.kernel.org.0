Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2DB78EC26
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 13:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244709AbjHaLiS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 07:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbjHaLiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 07:38:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DC6B9
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 04:38:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A238A611E0
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 11:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A80EC433C8;
        Thu, 31 Aug 2023 11:38:12 +0000 (UTC)
Message-ID: <f312fc14-13b0-43ea-3502-0ca4eef7aaca@xs4all.nl>
Date:   Thu, 31 Aug 2023 13:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] media: cec: core: add note about *_from_edid()
 function usage in drm
Content-Language: en-US, nl
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
References: <7cebfea8f999d2d0d49533f9849d109830c5d1b6.1692884619.git.jani.nikula@intel.com>
 <20230831105144.25923-1-jani.nikula@intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230831105144.25923-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/08/2023 12:51, Jani Nikula wrote:
> In the drm subsystem, the source physical address is, in most cases,
> available without having to parse the EDID again. Add notes about
> preferring to use the pre-parsed address instead.
> 
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> 
> ---
> 
> v2: rephrase comments, in particular indicate cec_s_phys_addr() should
> be false (Hans)
> ---
>  drivers/media/cec/core/cec-adap.c     | 5 +++++
>  drivers/media/cec/core/cec-notifier.c | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
> index 241b1621b197..1109af525c35 100644
> --- a/drivers/media/cec/core/cec-adap.c
> +++ b/drivers/media/cec/core/cec-adap.c
> @@ -1688,6 +1688,11 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
>  }
>  EXPORT_SYMBOL_GPL(cec_s_phys_addr);
>  
> +/*
> + * Note: In the drm subsystem, prefer calling (if possible):
> + *
> + * cec_s_phys_addr(adap, connector->display_info.source_physical_address, false);
> + */
>  void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
>  			       const struct edid *edid)
>  {
> diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
> index 389dc664b211..d600be0f7b67 100644
> --- a/drivers/media/cec/core/cec-notifier.c
> +++ b/drivers/media/cec/core/cec-notifier.c
> @@ -195,6 +195,11 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
>  }
>  EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr);
>  
> +/*
> + * Note: In the drm subsystem, prefer calling (if possible):
> + *
> + * cec_notifier_set_phys_addr(n, connector->display_info.source_physical_address);
> + */
>  void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
>  					  const struct edid *edid)
>  {

