Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFAE978F49F
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 23:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235570AbjHaVcb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 17:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbjHaVca (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 17:32:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867F0B8
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 14:32:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 112BFB823E3
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 21:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7809CC433C8;
        Thu, 31 Aug 2023 21:32:22 +0000 (UTC)
Message-ID: <f24abf55-7261-f0b5-b95f-bf94ab80ea30@xs4all.nl>
Date:   Thu, 31 Aug 2023 23:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/6] drm, cec and edid updates
Content-Language: en-US, nl
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
References: <cover.1692884619.git.jani.nikula@intel.com>
 <8734zzjb9v.fsf@intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <8734zzjb9v.fsf@intel.com>
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

On 31/08/2023 20:51, Jani Nikula wrote:
> On Thu, 24 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> Avoid accessing the raw edid directly. Pre-parse the source physical
>> address during normal EDID parsing and use that for CEC.
>>
>> Jani Nikula (6):
>>   drm/edid: add drm_edid_is_digital()
>>   drm/i915/display: use drm_edid_is_digital()
>>   drm/edid: parse source physical address
>>   drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
>>   drm/i915/cec: switch to setting physical address directly
> 
> Maarten, Maxime, Thomas, ack for merging patches 1, 3 and 4 via via
> drm-intel?
> 
>>   media: cec: core: add note about *_from_edid() function usage in drm
> 
> Hans, while there's no build dependency here, I think it would make
> sense to merge this together with patches 3 and 4. Ack for merging via
> drm-intel?

That's fine, it makes sense to do that.

If you need it, for this series:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> Thanks,
> Jani.
> 
> 
>>
>>  drivers/gpu/drm/display/drm_dp_cec.c      | 22 +++++++++++++++++++---
>>  drivers/gpu/drm/drm_edid.c                | 22 ++++++++++++++++++++--
>>  drivers/gpu/drm/i915/display/intel_crt.c  | 11 ++++-------
>>  drivers/gpu/drm/i915/display/intel_dp.c   |  7 ++-----
>>  drivers/gpu/drm/i915/display/intel_hdmi.c |  8 +++-----
>>  drivers/gpu/drm/i915/display/intel_sdvo.c |  7 ++-----
>>  drivers/media/cec/core/cec-adap.c         |  4 ++++
>>  drivers/media/cec/core/cec-notifier.c     |  4 ++++
>>  include/drm/display/drm_dp_helper.h       |  6 ++++++
>>  include/drm/drm_connector.h               |  8 ++++++++
>>  include/drm/drm_edid.h                    |  1 +
>>  11 files changed, 73 insertions(+), 27 deletions(-)
> 

