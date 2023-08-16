Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17E2377DC9A
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 10:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242871AbjHPIn6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 04:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243024AbjHPInr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 04:43:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C89CB5;
        Wed, 16 Aug 2023 01:43:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CDE0764576;
        Wed, 16 Aug 2023 08:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D98C433C8;
        Wed, 16 Aug 2023 08:43:43 +0000 (UTC)
Message-ID: <363eda4c-8b4e-5871-6e5c-9864ba6fdfe4@xs4all.nl>
Date:   Wed, 16 Aug 2023 10:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC 00/13] drm/connector: Create HDMI Connector
 infrastructure
Content-Language: en-US, nl
To:     Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/08/2023 15:56, Maxime Ripard wrote:
> Hi,
> 
> Here's a series that creates a subclass of drm_connector specifically
> targeted at HDMI controllers.
> 
> The idea behind this series came from a recent discussion on IRC during
> which we discussed infoframes generation of i915 vs everything else. 
> 
> Infoframes generation code still requires some decent boilerplate, with
> each driver doing some variation of it.
> 
> In parallel, while working on vc4, we ended up converting a lot of i915
> logic (mostly around format / bpc selection, and scrambler setup) to
> apply on top of a driver that relies only on helpers.
> 
> While currently sitting in the vc4 driver, none of that logic actually
> relies on any driver or hardware-specific behaviour.
> 
> The only missing piec to make it shareable are a bunch of extra
> variables stored in a state (current bpc, format, RGB range selection,
> etc.).
> 
> Thus, I decided to create some generic subclass of drm_connector to
> address HDMI connectors, with a bunch of helpers that will take care of
> all the "HDMI Spec" related code. Scrambler setup is missing at the
> moment but can easily be plugged in.
> 
> Last week, Hans Verkuil also expressed interest in retrieving the
> infoframes generated from userspace to create an infoframe-decode tool.
> This series thus leverages the infoframe generation code to expose it
> through debugfs.

Some background here: I maintain the edid-decode utility to parse and verify
EDIDs, and an infoframe-decode counterpart would be very nice. I can add
support for exposing infoframes to debugfs in HDMI receivers as well, and
that will help parse and verify received infoframes for correctness.

I added the linux-media mailinglist as well, since this will be of interest
for that subsystem as well.

Regards,

	Hans

> 
> This entire series is only build-tested at the moment. Let me know what
> you think,
> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Maxime Ripard (13):
>       drm/connector: Introduce an HDMI connector
>       drm/connector: hdmi: Create a custom state
>       drm/connector: hdmi: Add Broadcast RGB property
>       drm/connector: hdmi: Add helper to get the RGB range
>       drm/connector: hdmi: Add output BPC to the connector state
>       drm/connector: hdmi: Add support for output format
>       drm/connector: hdmi: Calculate TMDS character rate
>       drm/connector: hdmi: Add custom hook to filter TMDS character rate
>       drm/connector: hdmi: Compute bpc and format automatically
>       drm/connector: hdmi: Add Infoframes generation
>       drm/connector: hdmi: Create Infoframe DebugFS entries
>       drm/vc4: hdmi: Create destroy state implementation
>       drm/vc4: hdmi: Switch to HDMI connector
> 
>  drivers/gpu/drm/Makefile             |    1 +
>  drivers/gpu/drm/drm_hdmi_connector.c | 1112 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.c       |  720 ++++------------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h       |   37 +-
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c   |    4 +-
>  include/drm/drm_connector.h          |  256 ++++++++
>  6 files changed, 1508 insertions(+), 622 deletions(-)
> ---
> base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
> change-id: 20230814-kms-hdmi-connector-state-616787e67927
> 
> Best regards,

