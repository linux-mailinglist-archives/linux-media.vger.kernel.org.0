Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80D507A825
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 14:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbfG3MXm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 08:23:42 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:43727 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728171AbfG3MXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 08:23:42 -0400
Received: from [IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372] ([IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372])
        by smtp-cloud9.xs4all.net with ESMTPA
        id sRAJhmfLPAffAsRAKhjf2J; Tue, 30 Jul 2019 14:23:40 +0200
Subject: Re: [PATCH v4 0/9] drm: cec: convert DRM drivers to the new notifier
 API
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
References: <20190716122718.125993-1-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f334b1a0-b0a4-05f5-322a-e5be56d0c7d2@xs4all.nl>
Date:   Tue, 30 Jul 2019 14:23:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190716122718.125993-1-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLu4QQKU/t38/KC16z3MFhDcnS3zqvOD3mCuQZLPjicOq1MIIRiGfZ+GY19OZim/mbOf9pnfZ6S5zfrkaBI1He+Ph1zaOjH8X4WwCCyqKxnsuGspiSHl
 rvhYH7GP0tEbtFK6S1iFClypqgCDEG/Z1PXv3FS+I5SEtilxhJKcErkYwj04WykMmlAsP4fGjo/TgeHINSdaHUlzkNRRe5Ztmwc28S31zLtA2XUJH8qG68Kl
 BTdOBTgIs8lK2itoCmdW1FpDDXl7Y/X/pLTQJDgv/6kx4g5wfugdf1JoiGfLaQMiM0j4wxL8r4HkeHqp9Pf6LA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dariusz,

On 7/16/19 2:27 PM, Dariusz Marcinkiewicz wrote:
> This series updates DRM drivers to use new CEC notifier API.
> 
> Only first two patches were tested on the actual hardware.

Thank you for this v4 and apologies for the delay in reviewing.

A v5 is needed (my review of the tegra driver flagged a serious
issue there, but it shouldn't be difficult to fix).

My tentative plan is to do a final check second half of next week
and merge it. So if you are able to make a v5 before that, then that
would be very nice.

Regards,

	Hans

> 
> Changes since v3:
>         Updated adapter flags in dw-hdmi-cec.
> Changes since v2:
> 	Include all DRM patches from "cec: improve notifier support,
> 	add connector info connector info" series.
> Changes since v1:
> 	Those patches delay creation of notifiers until respective
> 	connectors are constructed. It seems that those patches, for a
> 	couple of drivers, by adding the delay, introduce a race between
> 	notifiers' creation and the IRQs handling threads - at least I
> 	don't see anything obvious in there that would explicitly forbid
> 	such races to occur. v2 adds a write barrier to make sure IRQ
> 	threads see the notifier once it is created (replacing the
> 	WRITE_ONCE I put in v1). The best thing to do here, I believe,
> 	would be not to have any synchronization and make sure that an IRQ
> 	only gets enabled after the notifier is created.
> 
> Dariusz Marcinkiewicz (9):
>   drm_dp_cec: add connector info support.
>   drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
>   dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
>   tda9950: use cec_notifier_cec_adap_(un)register
>   drm: tda998x: use cec_notifier_conn_(un)register
>   drm: sti: use cec_notifier_conn_(un)register
>   drm: tegra: use cec_notifier_conn_(un)register
>   drm: dw-hdmi: use cec_notifier_conn_(un)register
>   drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
> 
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |  9 +++--
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 36 +++++++++++--------
>  drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++++-----
>  drivers/gpu/drm/exynos/exynos_hdmi.c          | 31 +++++++++-------
>  drivers/gpu/drm/i2c/tda9950.c                 | 11 +++---
>  drivers/gpu/drm/i2c/tda998x_drv.c             | 33 +++++++++++------
>  drivers/gpu/drm/i915/intel_dp.c               |  4 +--
>  drivers/gpu/drm/i915/intel_hdmi.c             | 13 ++++---
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +-
>  drivers/gpu/drm/sti/sti_hdmi.c                | 19 ++++++----
>  drivers/gpu/drm/tegra/output.c                | 18 ++++++----
>  include/drm/drm_dp_helper.h                   | 14 ++++----
>  13 files changed, 130 insertions(+), 88 deletions(-)
> 

