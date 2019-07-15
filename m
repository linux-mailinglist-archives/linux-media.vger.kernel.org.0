Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D65A568809
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 13:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729843AbfGOLSV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 07:18:21 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47171 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729756AbfGOLSV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 07:18:21 -0400
Received: from [IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc] ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id myzqhcT8c0SBqmyzrhReOr; Mon, 15 Jul 2019 13:18:19 +0200
Subject: Re: [PATCH v2 0/5] cec: convert remaining drivers to the new notifier
 API
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
References: <20190701145944.214098-1-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b963102f-b318-a6ee-6762-23bd0da84010@xs4all.nl>
Date:   Mon, 15 Jul 2019 13:18:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701145944.214098-1-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHN/VGvGy8kCBjdfu05zsnXCuQiiq7eI4WY41/9kDIhS4kQ9yu91HuE5wjiua6LOi7z+Zf88M6u8vOi+8wMEIAhIU3z8lIjCIvjMth3se+uUJZQn7nkl
 VlRiBsuQ2Zzg8V++3IWcjqjMtyPJ3uGm81nw1x0ClFOhd+en5EUYlEiK2/ET12IbL0jXMxPvtPrK6rZLzTlCNy3eURpTded0p39QVZF5kWpUGfj2/RVrFJ31
 9AemonpRFQasc1l+Gms8xEWBARhyd5SYCZa64iN63hncIWkAtiLgKH3OtmYh0i4MhVV/y2T75ED71pLxLnc12lC7jSzoOVnvAn36cCNaoLo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dariusz,

On 7/1/19 4:59 PM, Dariusz Marcinkiewicz wrote:
> This series updates remaining drivers in DRM to use new CEC notifier API.
> 
> Those complement the "cec: improve notifier support, add
> connector info" patch series and also replace 2 following patches from
> there:
> - [PATCHv8 09/13] dw-hdmi: use cec_notifier_conn_(un)register
> - [PATCHv9 12/13] tda998x: use cec_notifier_conn_(un)register
> 
> None of those changes were not tested on a real hardware.

I assume you meant 'None of those changes were tested'?

I just reviewed this series. Apologies for the delay, I was out for a week and
then had to take care of other things.

When you post v3, can you include all older drm patches (i.e. tda9950, dw-hdmi-cec,
and the drm-dp-cec changes)?

That way there is only one patch series that I have to review.

Regards,

	Hans

> 
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
> 
> Dariusz Marcinkiewicz (5):
>   drm: tda998x: use cec_notifier_conn_(un)register
>   drm: sti: use cec_notifier_conn_(un)register
>   drm: tegra: use cec_notifier_conn_(un)register
>   drm: dw-hdmi: use cec_notifier_conn_(un)register
>   drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 37 +++++++++++++++--------
>  drivers/gpu/drm/exynos/exynos_hdmi.c      | 33 ++++++++++++--------
>  drivers/gpu/drm/i2c/tda998x_drv.c         | 32 ++++++++++++++------
>  drivers/gpu/drm/sti/sti_hdmi.c            | 20 +++++++-----
>  drivers/gpu/drm/tegra/output.c            | 18 ++++++-----
>  5 files changed, 91 insertions(+), 49 deletions(-)
> 

