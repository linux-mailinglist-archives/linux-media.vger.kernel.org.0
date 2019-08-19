Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA2B192085
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 11:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfHSJix (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 05:38:53 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:48805 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726477AbfHSJix (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 05:38:53 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ze7ghLtkkDqPeze7khngI6; Mon, 19 Aug 2019 11:38:50 +0200
Subject: Re: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier
 API
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     Kate Stewart <kstewart@linuxfoundation.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        linux-samsung-soc@vger.kernel.org,
        David Francis <David.Francis@amd.com>,
        amd-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
        "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>,
        linux-arm-kernel@lists.infradead.org,
        nouveau@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
        Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Sean Paul <seanpaul@chromium.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Thomas Lim <Thomas.Lim@amd.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org,
        Manasi Navare <manasi.d.navare@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Enrico Weigelt <info@metux.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20190814104520.6001-1-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
Date:   Mon, 19 Aug 2019 11:38:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPDgGfS7c9tn4rafxcc15L+sdU94YNd12NYSgxtW27RjNdWt8soWf0p7zwZtSmj5HF9HsGpidCpnUpt5hDO/L/H68USjBoTVY6y1GnWXCIZIGReaUbCR
 r4vAQe5xN1v/w07oNHcOJEsALfrneb1NuHIyy7V6sy8SIyaqln5q6vgESUB5xmUmpjy4J2O7D6fMHK+OU+bRJ9fYkvsP+Uc1l3/bG66OSNAQMIGJgtsV4V9i
 ILw/etbBTDN7if1Tx31wHjdGiAqAi2pNFQmMYTY5myx6Zdx9FohbrBpgZlTicKwY1GlNJ9Iyh3AoVqqW1A8DqPYjFzp9Ll5zCNL3o5E2o11NlByJtcaZxbdb
 ZzMqPs6UKce370BAWUuRPehhbW6Di1dnt0WRsX2wZQ/VdQu7h4ZauWcS91g3bhRrgqS9bzdyGIpOjL87l2z8V9uBXaKe2ZzI9v+iYftgLh7dRwbvkIsodc3L
 WSoB8f180Sr1hqSugtvbyhNsAz0YjYmzNY3N9pdgBp+SXQvKyt4hoILiopomIs4P/sy1Z5DxYk6FugifGpJIu1+7L6C+KppnIjS8pNy6VK+oGq4FEr3vh8yB
 GxK95UWqdQSIhX5OpbXpMoJ1xZmtr0G+RKLUKZDTYJSdjAUPeR/nzCbyJnokpxsiyNJnK4uM/ViGRSjjxIDEsrh+rESV2nH1GrdKW7cijdSormeE7cD32w/Y
 SX3ShlplIcVz0YZ5B8TsYacwnzQTsn4VUfa/28rKuR6IqQuOAgHZnAlsMMhXgsG1r2OSGeLsTxxaMWxH0amG69rQr+TNjlWMj/cr+E6orZcfJlTMcRWxYl9s
 pStvJvOg2MVG68BZKEV+zg/qwvrlhBBPPX0ZnnNTfJ+iQv5pjalUb9V4NR+zO6Qg54qpGx0riTn+U77CD6GTAk6QtjbbB+nCdXM33ABE2eN2Hgh4tc1ruyeg
 9mcen89SqOMwc8sv/qhbPgWy3HH+8lVyhyOBp+hmdZ8rG/D+z2mq2ChOL+dcZZR8AkwGQjqwvAaRWg5JHa+Y5KTiYFP83SDWVbrNyxGr3zRZffKLNhowaDJn
 zHowYOOzbcQVlLA1ur0m5DgUw5xYQ0UkqTnJ6Tlsb9DeEI2CKn9KGZYNj30AuDa9UxqQpbm3MDZAcA8RHy4gocSZFLl1QNgdacx/7qqpgtPzScG6Ys3q3Xxw
 I0yKiDHFPgtI7wAeA2FVAF1U0T+zL+XSN+JFmJ8tInpbkc2DGoFlTHOifew7zb3whYgFm8yo1XlmgYVMOodmQN27MgKXEZSu8e+48bmOZMThMe4c0hB7HIQ1
 isOyI2fWFj4vcXK+iyPqg6WPTlG2knIJKBvRjbCUXfG+BlthwJNCaWT9hIW2+EkaB7acj4Mz4wiysngKHyZeWWVtQP7lT/zOY8Un7oWmFWfQttd+y+/nHxEg
 nsVrYV+6yi3BHXec
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

The patches in this series can be applied independently from each other.

If you maintain one of these drivers and you want to merge it for v5.4
yourself, then please do so and let me know. If you prefer I commit it
to drm-misc, then please review and (hopefully) Ack the patch.

I would really like to get this in for v5.4 so I can get the userspace
bits in for v5.4 as well through the media subsystem.

Dariusz, can you post a v7.1 for patch 5/9 fixing the typo?

Thanks!

	Hans

On 8/14/19 12:44 PM, Dariusz Marcinkiewicz wrote:
> This series updates DRM drivers to use new CEC notifier API.
> 
> Changes since v6:
> 	Made CEC notifiers' registration and de-registration symmetric
> 	in tda998x and dw-hdmi drivers. Also, accidentally dropped one
> 	patch in v6 (change to drm_dp_cec), brought it back now.
> Changes since v5:
>         Fixed a warning about a missing comment for a new member of
> 	drm_dp_aux_cec struct. Sending to a wider audience,
> 	including maintainers of respective drivers.
> Changes since v4:
> 	Addressing review comments.
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
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 13 +++---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 46 +++++++++++++------
>  drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++----
>  drivers/gpu/drm/exynos/exynos_hdmi.c          | 31 +++++++------
>  drivers/gpu/drm/i2c/tda9950.c                 | 12 ++---
>  drivers/gpu/drm/i2c/tda998x_drv.c             | 36 ++++++++++-----
>  drivers/gpu/drm/i915/display/intel_dp.c       |  4 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     | 13 ++++--
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +-
>  drivers/gpu/drm/sti/sti_hdmi.c                | 19 +++++---
>  drivers/gpu/drm/tegra/output.c                | 28 ++++++++---
>  include/drm/drm_dp_helper.h                   | 17 ++++---
>  13 files changed, 155 insertions(+), 94 deletions(-)
> 

