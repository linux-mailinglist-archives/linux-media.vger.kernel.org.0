Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC952231BE
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 12:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730508AbfETKuq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 06:50:46 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:52463 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbfETKuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 06:50:46 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id SfsOhqxuR3qlsSfsRhiyoi; Mon, 20 May 2019 12:50:43 +0200
Subject: Re: [PATCH v6 1/3] media: cec: expose HDMI connector to CEC dev
 mapping
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org, hans.verkuil@cisco.com
Cc:     linux-kernel@vger.kernel.org
References: <20190517154256.255696-1-darekm@google.com>
 <c0007b51-5e9f-4788-b860-d0623e21013b@xs4all.nl>
Message-ID: <3300cffd-62e7-7e2d-3c73-dc5fc7455c88@xs4all.nl>
Date:   Mon, 20 May 2019 12:50:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c0007b51-5e9f-4788-b860-d0623e21013b@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfH2u1XC9W1AeULLKABa1KeV48WihI7kLEBY0VIqkJ9SmdFfczG8189/ZCLXPic4rjjJHlsxzVeghMjoc6kWSQN/Y/YqXAOcn/cVM9pzLx9O5KrYGt7I+
 ijZjL3fQ2ukMWNhWngSlFNaWvYoKiM/Wc0f/1K4mEhTpt+j84hsaWsz94kO5IBJgjSkOXV59+KT7DDiIfq2KoBBYKhl+fEX+w0iL913mguE4kmbGAv99EItk
 7LLEJbgsH0P0vX/CsWk3pZED7qZ1SJMr0RpF2SV25Gk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/20/19 12:25 PM, Hans Verkuil wrote:
> Hi Dariusz,
> 
> On 5/17/19 5:42 PM, Dariusz Marcinkiewicz wrote:
>> This patch proposes to expose explicit mapping between HDMI connectors
>> and /dev/cecX adapters to userland.
>>
>> New structure with connector info (card number and connector id in case
>> of DRM connectors) is added to cec_adapter. That connector info is expected
>> to be provided when an adapter is created.
>>
>> CEC notifier is extended so that it can be used to communicate the
>> connector's info to CEC adapters' creators.
>>
>> New ioctl, exposing connector info to userland, is added to /dev/cec.
>>
>> Changes since v5:
>>  - make the patch apply against the latest changes in the affected code
>> Changes since v4:
>>  - small tweaks + added documentation
>> Changes since v3:
>>  - cec_get_connter_conn takes connector_info as argument
>> Changes since v2:
>>  - cec_s_connector_info removed, the connector info is now passed to
>>    cec_allocate_adapter
>>  - updated commit message
>> Changes since v1:
>>  - removed the unnecessary event,
>>  - extended cec_connctor_info to allow for various types of connectors.
>>
>> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
>> ---
>>  Documentation/media/kapi/cec-core.rst         |   7 +-
>>  Documentation/media/uapi/cec/cec-funcs.rst    |   1 +
>>  .../uapi/cec/cec-ioc-adap-g-conn-info.rst     | 109 ++++++++++++++++++
>>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   2 +-
>>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c  |   3 +-
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |   2 +-
>>  drivers/gpu/drm/drm_dp_cec.c                  |  22 ++--
>>  drivers/gpu/drm/i2c/tda9950.c                 |   3 +-
>>  drivers/gpu/drm/i915/intel_dp.c               |   4 +-
>>  drivers/gpu/drm/i915/intel_hdmi.c             |   6 +-
>>  drivers/gpu/drm/nouveau/nouveau_connector.c   |   3 +-
>>  drivers/gpu/drm/vc4/vc4_hdmi.c                |   8 +-
>>  drivers/media/cec/cec-adap.c                  |  13 +++
>>  drivers/media/cec/cec-api.c                   |  12 ++
>>  drivers/media/cec/cec-core.c                  |   8 +-
>>  drivers/media/cec/cec-notifier.c              |  20 +++-
>>  drivers/media/cec/cec-pin.c                   |   2 +-
>>  drivers/media/i2c/tc358743.c                  |   3 +-
>>  .../media/platform/cros-ec-cec/cros-ec-cec.c  |   7 +-
>>  drivers/media/platform/meson/ao-cec.c         |   6 +-
>>  drivers/media/platform/s5p-cec/s5p_cec.c      |   6 +-
>>  drivers/media/platform/seco-cec/seco-cec.c    |   8 +-
>>  drivers/media/platform/sti/cec/stih-cec.c     |   6 +-
>>  drivers/media/platform/stm32/stm32-cec.c      |   2 +-
>>  drivers/media/platform/tegra-cec/tegra_cec.c  |   5 +-
>>  drivers/media/platform/vivid/vivid-cec.c      |   2 +-
>>  drivers/media/usb/pulse8-cec/pulse8-cec.c     |   3 +-
>>  .../media/usb/rainshadow-cec/rainshadow-cec.c |   3 +-
>>  include/drm/drm_dp_helper.h                   |  14 +--
>>  include/media/cec-notifier.h                  |  34 ++++--
>>  include/media/cec.h                           |  16 ++-
>>  include/uapi/linux/cec.h                      |  24 ++++
>>  32 files changed, 310 insertions(+), 54 deletions(-)
>>  create mode 100644 Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
>>
> 
> I've been doing some testing with my Khadas VIM2 board (amlogic SoC).
> 
> It's a bit unusual since it uses the Synopsys bridge, but not the Synopsys
> CEC driver (it has its own meson cec driver).
> 
> The first thing I noticed is that I did not get any connector info.
> I think that the root cause of that is that you forgot that there are
> several drm drivers that call cec_notifier_get() instead of cec_notifier_get_conn().
> 
> I think all those calls to cec_notifier_get() in drm drivers should be replaced
> by cec_notifier_get_conn() where the second argument is NULL, but the third argument
> should contain valid connector info.
> 
> A quick grep gives me the following drivers that need work:
> 
> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> drivers/gpu/drm/exynos/exynos_hdmi.c
> drivers/gpu/drm/i2c/tda998x_drv.c
> drivers/gpu/drm/sti/sti_hdmi.c
> drivers/gpu/drm/tegra/output.c

You also missed updating drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c: the
cec_allocate_adapter call should be extended with the connector info.

You also missed these three v4l cec adapters:

drivers/media/i2c/adv7511.c
drivers/media/i2c/adv7604.c
drivers/media/i2c/adv7842.c

Use NULL for the connector info for these three drivers.

Also note that in 5.2-rc1 a new meson cec driver was added, that should
be updated as well, similar to the existing meson cec driver.

Regards,

	Hans

> 
> The second thing I noticed is that patch 2 gave me a new kernel warning, but
> I'll do some more testing for that and reply to patch 2/3 once I know more.
> 
> Regards,
> 
> 	Hans
> 

