Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD8678D866
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 20:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbjH3SaY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 14:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242866AbjH3Jyb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 05:54:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C611C1B0
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 02:54:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 608286136A
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 09:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F47C433C9;
        Wed, 30 Aug 2023 09:54:26 +0000 (UTC)
Message-ID: <9a344111-483c-0883-9685-0d571e2295b2@xs4all.nl>
Date:   Wed, 30 Aug 2023 11:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/6] drm/edid: parse source physical address
Content-Language: en-US, nl
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
References: <cover.1692884619.git.jani.nikula@intel.com>
 <8c6b6403932536b6849e0b44e1ee6e7ebdbe4a69.1692884619.git.jani.nikula@intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <8c6b6403932536b6849e0b44e1ee6e7ebdbe4a69.1692884619.git.jani.nikula@intel.com>
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
> CEC needs the source physical address. Parsing it is trivial with the
> existing EDID CEA DB infrastructure.
> 
> Default to CEC_PHYS_ADDR_INVALID (0xffff) instead of 0 to cater for
> easier CEC usage.
> 
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/gpu/drm/drm_edid.c  | 5 +++++
>  include/drm/drm_connector.h | 8 ++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 1dbb15439468..39dd3f694544 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -29,6 +29,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/cec.h>
>  #include <linux/hdmi.h>
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
> @@ -6192,6 +6193,8 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
>  
>  	info->is_hdmi = true;
>  
> +	info->source_physical_address = (db[4] << 8) | db[5];
> +
>  	if (len >= 6)
>  		info->dvi_dual = db[6] & 1;
>  	if (len >= 7)
> @@ -6470,6 +6473,8 @@ static void drm_reset_display_info(struct drm_connector *connector)
>  	info->vics_len = 0;
>  
>  	info->quirks = 0;
> +
> +	info->source_physical_address = CEC_PHYS_ADDR_INVALID;
>  }
>  
>  static void update_displayid_info(struct drm_connector *connector,
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index d300fde6c1a4..40a5e7acf2fa 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -816,6 +816,14 @@ struct drm_display_info {
>  	 * @quirks: EDID based quirks. Internal to EDID parsing.
>  	 */
>  	u32 quirks;
> +
> +	/**
> +	 * @source_physical_address: Source Physical Address from HDMI
> +	 * Vendor-Specific Data Block, for CEC usage.
> +	 *
> +	 * Defaults to CEC_PHYS_ADDR_INVALID (0xffff).
> +	 */
> +	u16 source_physical_address;
>  };
>  
>  int drm_display_info_set_bus_formats(struct drm_display_info *info,

