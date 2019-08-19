Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C152927AA
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 16:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfHSOzl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 10:55:41 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:50185 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725536AbfHSOzl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 10:55:41 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id zj4ChI5vQzaKOzj4Ghs6MN; Mon, 19 Aug 2019 16:55:38 +0200
Subject: Re: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier
 API
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     Kate Stewart <kstewart@linuxfoundation.org>,
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
 <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
 <ad2a4af0-aeff-a81e-7885-7e9fc3c5cf90@baylibre.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6ef361f6-2f56-32ea-c7da-52799990cac7@xs4all.nl>
Date:   Mon, 19 Aug 2019 16:55:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ad2a4af0-aeff-a81e-7885-7e9fc3c5cf90@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAcnCVFj1krAOhrj/mufKqBlxMbOSgzSeUXEOKbpJLud4IZ5fiLiUug6x1ZqKp7+UUxICVYS1sbyuUUnrOXFLal39KYAgJkS9hQGkukxRIwMWkn3VN+i
 TlIwZ9a/czbewfmvQ/bnqr12/uQglwwExPpRSW6UMiqBkKAEZ3+DdBaUMvj8+8oTfBbl7cNbeCPaQ07xeSeBmmq9MFl2lBxz2akLHWAcE7Qk0Ss4uoR6i2NR
 bIZQxb0ej6/tz5Q4RNVa88cAFcoQeKuIG1L7ROnGnOk633i1oN6lF74PD6BSXHG2/v+JXzT25/5ho9Gv6QTKd80O8s0W9bBT8qRyMRRr3fb9r5vxyRVK5psz
 QgciIFY6Ft/w4rXomKAWfE+jVIg1RTAj/P6SxJ7tKA/RvXpkRv9OF8NxB0Y4tvM8bqSNrLXcWNdXUiRQpWUXIX3sV7kh/yy7O2Dl3guC3WrQ2eS1Mws603np
 +P2tiKWBOuBBwI5YWD8OHDz+8b6MhUlCVr1e6tdwL6DIbldlhQuHFmP+UH3+rm2WmTeLTpeGAHfztQu9vI93M6utuOjz/VahKjVfz+Lqg538SjRiGtoHqsFR
 I2+hPiEJhKuIQxvwKJzHENZwtWiV0aFJpNSjffCk4PI7JpOVcYdtwz87NhCyDh1IHFor1V/TlLnSKVlEX87VNX4B2BZerHERC/UVJG6C/lnwJm2AnrFDJwUD
 55goQlcE+9rgN0iwsSLIcag0pwppehYQ+WBOceth4A627FakEjluXWxFW7/IZSlip89wUR1/bZWTqFrGQ/C0jN7vZb1/ptOaFiVlq+A1Iut+c0ToEbym6nWn
 5kSgZ5ATlC0J+sZIfgadUMTL7f5Qf3MYq16CbpwGESfmn8nxPGWpje1Ao/0c53GJQO/x/TpBelbj3iKHxLI/DBblHxm2FxSXXkpM5bpZ6C4ntCFQviRLyeNK
 YQAH4MHXARJXkpiv5eljDCxzpu7QWBc/DiQUNptcYFz8QJ+qfdCYOG8LoEMIw3toCPfIYHYznluRBxHziZbQ/Amuj2Rfk0a0fBam4oMd8CjaKVMPzwz1xAU7
 5zZ1he1OHjKi+nkZZ/4OLpRZ0ga07ac06gcEs+9jMgbr2oy2fIFLmBGsEx5DEIzsYxTtvq4krxsv1zkiryvF9fLE+ifV48fBarS4e+Lh32XHR0snf212eITy
 WP3Ye6Hoymy6XM8YVT2LOAElK+2+sYGN3KxJqlP9ZNqCS2x5ZC3yswQytMIufJyPzfpT/tWwGKLQCjUZg85bqs6XxhAb4FbR1jOuaFCBw7fs8c1QDdz18gig
 U2JQcgaTIA5RkOjbnD47o6ev230hQziueyxOqBVuDLyQPhe3I/g+N/1grCxgU4TT7V7AATItgXxaHD0I40r/DpdwGlw9jZpV2oxsvrXsdsBJm43L93Sx6cRv
 x4k81GGwO7UKT7bV
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/19 4:48 PM, Neil Armstrong wrote:
> Hi Dariusz, Hans,
> 
> I can apply the dw-hdmi patches if necessary.

I'd appreciate it if you can do that.

Thanks,

	Hans

> 
> Neil
> 
> On 19/08/2019 11:38, Hans Verkuil wrote:
>> Hi all,
>>
>> The patches in this series can be applied independently from each other.
>>
>> If you maintain one of these drivers and you want to merge it for v5.4
>> yourself, then please do so and let me know. If you prefer I commit it
>> to drm-misc, then please review and (hopefully) Ack the patch.
>>
>> I would really like to get this in for v5.4 so I can get the userspace
>> bits in for v5.4 as well through the media subsystem.
>>
>> Dariusz, can you post a v7.1 for patch 5/9 fixing the typo?
>>
>> Thanks!
>>
>> 	Hans
>>
>> On 8/14/19 12:44 PM, Dariusz Marcinkiewicz wrote:
>>> This series updates DRM drivers to use new CEC notifier API.
>>>
>>> Changes since v6:
>>> 	Made CEC notifiers' registration and de-registration symmetric
>>> 	in tda998x and dw-hdmi drivers. Also, accidentally dropped one
>>> 	patch in v6 (change to drm_dp_cec), brought it back now.
>>> Changes since v5:
>>>         Fixed a warning about a missing comment for a new member of
>>> 	drm_dp_aux_cec struct. Sending to a wider audience,
>>> 	including maintainers of respective drivers.
>>> Changes since v4:
>>> 	Addressing review comments.
>>> Changes since v3:
>>>         Updated adapter flags in dw-hdmi-cec.
>>> Changes since v2:
>>> 	Include all DRM patches from "cec: improve notifier support,
>>> 	add connector info connector info" series.
>>> Changes since v1:
>>> 	Those patches delay creation of notifiers until respective
>>> 	connectors are constructed. It seems that those patches, for a
>>> 	couple of drivers, by adding the delay, introduce a race between
>>> 	notifiers' creation and the IRQs handling threads - at least I
>>> 	don't see anything obvious in there that would explicitly forbid
>>> 	such races to occur. v2 adds a write barrier to make sure IRQ
>>> 	threads see the notifier once it is created (replacing the
>>> 	WRITE_ONCE I put in v1). The best thing to do here, I believe,
>>> 	would be not to have any synchronization and make sure that an IRQ
>>> 	only gets enabled after the notifier is created.
>>> Dariusz Marcinkiewicz (9):
>>>   drm_dp_cec: add connector info support.
>>>   drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
>>>   dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
>>>   tda9950: use cec_notifier_cec_adap_(un)register
>>>   drm: tda998x: use cec_notifier_conn_(un)register
>>>   drm: sti: use cec_notifier_conn_(un)register
>>>   drm: tegra: use cec_notifier_conn_(un)register
>>>   drm: dw-hdmi: use cec_notifier_conn_(un)register
>>>   drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
>>>
>>>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 13 +++---
>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 46 +++++++++++++------
>>>  drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++----
>>>  drivers/gpu/drm/exynos/exynos_hdmi.c          | 31 +++++++------
>>>  drivers/gpu/drm/i2c/tda9950.c                 | 12 ++---
>>>  drivers/gpu/drm/i2c/tda998x_drv.c             | 36 ++++++++++-----
>>>  drivers/gpu/drm/i915/display/intel_dp.c       |  4 +-
>>>  drivers/gpu/drm/i915/display/intel_hdmi.c     | 13 ++++--
>>>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +-
>>>  drivers/gpu/drm/sti/sti_hdmi.c                | 19 +++++---
>>>  drivers/gpu/drm/tegra/output.c                | 28 ++++++++---
>>>  include/drm/drm_dp_helper.h                   | 17 ++++---
>>>  13 files changed, 155 insertions(+), 94 deletions(-)
>>>
>>
> 

