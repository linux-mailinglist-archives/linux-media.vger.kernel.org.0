Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD8FA2B220
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 12:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbfE0Kbc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 06:31:32 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:50267 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725943AbfE0Kbc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 06:31:32 -0400
Received: from [IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13] ([IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VCuehaL2PsDWyVCufhYhnd; Mon, 27 May 2019 12:31:29 +0200
Subject: Re: [PATCH v6 3/4] media: meson: add v4l2 m2m video decoder driver
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
References: <20190514135612.30822-1-mjourdan@baylibre.com>
 <20190514135612.30822-4-mjourdan@baylibre.com>
 <07af1a22-d57c-aff6-b476-98fbf72135c1@xs4all.nl>
 <480f2c43-9858-a4d3-7a6b-452756fb6076@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <79491b42-9296-1dfd-59ec-3ce7d58b2119@xs4all.nl>
Date:   Mon, 27 May 2019 12:31:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <480f2c43-9858-a4d3-7a6b-452756fb6076@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCEa+gP20jycLyMtenMCXcxM2gS9GjwMobnKRsYfUiIMNSzGAirKt25OGsqJdWYV0Fv4hkRA2qRYQ5o0rDb11LEAeCMqQ4VvUKgDsJdKkkbGFCXcRwk9
 H6HGVLolhV38puvk4WhdM1T5ZRgxrfpgbBEoatQfmx4z1z6rgJFwOIUJ3kfWrHYo9b4ngdSphORL/7YI0nX5mFyYaCmkJvP4xAHi8Wa54HjtS7m/wwf9P6BD
 h3aAiv3hrOU3kjpRqAQDp40SUnH58KbOgs3P/xN2YHHU9gA7P+NxONgl2zpyiWiEqcmxdvQY4aycGJIi+mi7X2r4rUJaAJzFqHv941kglABR2bix3FyXYxd0
 nIuhkqVrGekPqTajgEPUWr9LDMd05Gf/jr5+/Cj8hNHOT32tN7Q6xsKjqKFWA7ca5k67bmcjJuMAysSmyLlkPN67gn3HQtrBdZfdNSpgiyembennkdY3rhq/
 Kzua5JWlTGpdRtFgFKIC0p6pm7yz9Y6YH9LsT21pTgS7x/CW81fO9Oxxzu1+c55qoNLQJ75f4qSH+R1OnhZNICAkTiNEjtpnZOSsoL2yDuBTxJQY495DP5GL
 GOM43G+h4TovvmGSt2n7jKUYxRJySrBO9wXfzILfbBVyS8sygE1C4kMLqyOlcM/bphQSmjC/QtTsDmTCs2jtMDAk
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/27/19 12:18 PM, Neil Armstrong wrote:
> Hi Hans,
> 
> On 27/05/2019 12:04, Hans Verkuil wrote:
>> Hi Maxime,
>>
>> First a high-level comment: I think this driver should go to staging.
>> Once we finalize the stateful decoder spec, and we've updated the
>> v4l2-compliance test, then this needs to be tested against that and
>> only if it passes can it be moved out of staging.
> 
> I don't understand the reason since other stateful codecs are already
> mainline and doesn't match the in-discussion stateful decoder spec either.

With new drivers we should do better: I don't want to add such drivers
without them being fully tested for API compliance.

There is a bit too much variation in existing drivers and the main reason
for that was lack of compliance testing. We're close to having a proper
spec and proper compliance tests, but as long as that's not finalized I
want to keep new codec drivers in staging.

Once the compliance tests are available, then we have an objective way
of checking if a codec driver is following the spec.

Existing codec drivers in mainline will also have to be checked, for that
matter.

Regards,

	Hans

> 
> Neil
> 
>>
>> It is just a bit too soon to have this in mainline at this time.
>>
>> One other comment below:
>>
>> On 5/14/19 3:56 PM, Maxime Jourdan wrote:
>>> Amlogic SoCs feature a powerful video decoder unit able to
>>> decode many formats, with a performance of usually up to 4k60.
>>>
>>> This is a driver for this IP that is based around the v4l2 m2m framework.
>>>
>>> It features decoding for:
>>> - MPEG 1
>>> - MPEG 2
>>>
>>> Supported SoCs are: GXBB (S905), GXL (S905X/W/D), GXM (S912)
>>>
>>> There is also a hardware bitstream parser (ESPARSER) that is handled here.
>>>
>>> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
>>> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
>>> ---
>>>  drivers/media/platform/Kconfig                |   10 +
>>>  drivers/media/platform/meson/Makefile         |    1 +
>>>  drivers/media/platform/meson/vdec/Makefile    |    8 +
>>>  .../media/platform/meson/vdec/codec_mpeg12.c  |  209 ++++
>>>  .../media/platform/meson/vdec/codec_mpeg12.h  |   14 +
>>>  drivers/media/platform/meson/vdec/dos_regs.h  |   98 ++
>>>  drivers/media/platform/meson/vdec/esparser.c  |  323 +++++
>>>  drivers/media/platform/meson/vdec/esparser.h  |   32 +
>>>  drivers/media/platform/meson/vdec/vdec.c      | 1071 +++++++++++++++++
>>>  drivers/media/platform/meson/vdec/vdec.h      |  265 ++++
>>>  drivers/media/platform/meson/vdec/vdec_1.c    |  229 ++++
>>>  drivers/media/platform/meson/vdec/vdec_1.h    |   14 +
>>>  .../media/platform/meson/vdec/vdec_ctrls.c    |   51 +
>>>  .../media/platform/meson/vdec/vdec_ctrls.h    |   14 +
>>>  .../media/platform/meson/vdec/vdec_helpers.c  |  441 +++++++
>>>  .../media/platform/meson/vdec/vdec_helpers.h  |   80 ++
>>>  .../media/platform/meson/vdec/vdec_platform.c |  107 ++
>>>  .../media/platform/meson/vdec/vdec_platform.h |   30 +
>>>  18 files changed, 2997 insertions(+)
>>>  create mode 100644 drivers/media/platform/meson/vdec/Makefile
>>>  create mode 100644 drivers/media/platform/meson/vdec/codec_mpeg12.c
>>>  create mode 100644 drivers/media/platform/meson/vdec/codec_mpeg12.h
>>>  create mode 100644 drivers/media/platform/meson/vdec/dos_regs.h
>>>  create mode 100644 drivers/media/platform/meson/vdec/esparser.c
>>>  create mode 100644 drivers/media/platform/meson/vdec/esparser.h
>>>  create mode 100644 drivers/media/platform/meson/vdec/vdec.c
>>>  create mode 100644 drivers/media/platform/meson/vdec/vdec.h
>>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_1.c
>>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_1.h
>>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_ctrls.c
>>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_ctrls.h
>>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_helpers.c
>>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_helpers.h
>>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_platform.c
>>>  create mode 100644 drivers/media/platform/meson/vdec/vdec_platform.h
>>>
>>
>> <snip>
>>
>>> diff --git a/drivers/media/platform/meson/vdec/vdec_ctrls.c b/drivers/media/platform/meson/vdec/vdec_ctrls.c
>>> new file mode 100644
>>> index 000000000000..d5d6b1b97aa5
>>> --- /dev/null
>>> +++ b/drivers/media/platform/meson/vdec/vdec_ctrls.c
>>> @@ -0,0 +1,51 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * Copyright (C) 2018 BayLibre, SAS
>>> + * Author: Maxime Jourdan <mjourdan@baylibre.com>
>>> + */
>>> +
>>> +#include "vdec_ctrls.h"
>>> +
>>> +static int vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>>> +{
>>> +	struct amvdec_session *sess =
>>> +	      container_of(ctrl->handler, struct amvdec_session, ctrl_handler);
>>> +
>>> +	switch (ctrl->id) {
>>> +	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>>> +		ctrl->val = sess->dpb_size;
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	};
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct v4l2_ctrl_ops vdec_ctrl_ops = {
>>> +	.g_volatile_ctrl = vdec_op_g_volatile_ctrl,
>>> +};
>>> +
>>> +int amvdec_init_ctrls(struct v4l2_ctrl_handler *ctrl_handler)
>>> +{
>>> +	int ret;
>>> +	struct v4l2_ctrl *ctrl;
>>> +
>>> +	ret = v4l2_ctrl_handler_init(ctrl_handler, 1);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ctrl = v4l2_ctrl_new_std(ctrl_handler, &vdec_ctrl_ops,
>>> +		V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 1);
>>> +	if (ctrl)
>>> +		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
>>
>> Why is this volatile? That makes little sense.
>>
>>> +
>>> +	ret = ctrl_handler->error;
>>> +	if (ret) {
>>> +		v4l2_ctrl_handler_free(ctrl_handler);
>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(amvdec_init_ctrls);
>>
>> <snip>
>>
>> Regards,
>>
>> 	Hans
>>
> 

