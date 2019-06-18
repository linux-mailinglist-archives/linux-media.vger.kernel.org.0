Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3E349A8E
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 09:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfFRH2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 03:28:24 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:38033 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725870AbfFRH2Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 03:28:24 -0400
Received: from [IPv6:2001:983:e9a7:1:9450:c90a:3140:14fc] ([IPv6:2001:983:e9a7:1:9450:c90a:3140:14fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id d8XVhzgn55qKad8XWhZDps; Tue, 18 Jun 2019 09:28:22 +0200
Subject: Re: [PATCH v3 0/9] media: vivid: add HDMI (dis)connect emulation
To:     Johan Korsnes <johan.korsnes@gmail.com>,
        linux-media@vger.kernel.org
References: <20190618073726.61776-1-johan.korsnes@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0d26807b-7f37-b8a1-78b6-b2cb84b9d995@xs4all.nl>
Date:   Tue, 18 Jun 2019 09:28:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618073726.61776-1-johan.korsnes@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNjd2tjziVFx1ZI6nZ3SL/zPnQuwvMJP1e2Lx6DFFhoElbRCj7jd23nfR+kLLj+sNUeueu+8bzgdEnWsHAqrLHxCsU1eRpaeZwcijL3d0LdcXco1H0K7
 J1fxihh5Ec4w2liHGFvVt3m0e/BBqNKac42ElqCD6loTQriTXTCVlYniWRWNhw0VTMT6r79Eh4a+vTP8+4UzgcvVefwMmqaJKtHblltlY5m26fWH8pD57pqR
 vKzHo2XE0hhjYvDqEpSBG+6ft6ukPR6rOyrsVQRE7f0ITJxHpRqpuRdHXEnRrierUMm8+XljZX9/oV8K/1mFzQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/18/19 9:37 AM, Johan Korsnes wrote:
> This patch series makes vivid V4L2-compliant by adding HDMI (dis)-
> connect emulation. This is done by by adding a custom display_present
> control to vivid output HDMI devices, along with the following standard
> controls:
> 
> -ctrl_tx_edid_present
> -ctrl_tx_hotplug
> -ctrl_tx_rxsense
> -ctrl_rx_power_present
> 
> With regard to v4l2-compliance:
> Series fixes the following 1/1 warning for HDMI input devices:
>    -V4L2_CID_DV_RX_POWER_PRESENT not found for input n
> Series fixes the following 2/2 warnings for HDMI ouptut devices:
>    -V4L2_CID_DV_TX_HOTPLUG not found for output n
>    -V4L2_CID_DV_TX_EDID_PRESENT not found for output n
> 
> Regards,
> Johan
> 
> v2 -> v3:
> - Various checkpatch.pl fixes. There are still some warnings as I am
>   not sure those really apply. Please let me know if they do, and I
>   will fix them ASAP.
> - PTR_ERR_OR_ZERO -> PTR_ERR where applicable

Ah, I was mistaken. PTR_ERR_OR_ZERO is the right call here. I got confused.

No need to do anything, I'll put back the PTR_ERR_OR_ZERO.

Regards,

	Hans

> - Fix broken check for cec adapter not NULL
> 
> v1 -> v2:
> - New patch: media: vivid: reorder CEC allocation and control set-up
> - vidioc_s_edid: Use bitmask (not boolean) value for bitmask controls
> - vidioc_g_edid: Changed dev->output to edid->pad
> 
> Johan Korsnes (9):
>       media: vivid: make input dv_timings per-input
>       media: vivid: make input std_signal per-input
>       media: vivid: add display present control
>       media: vivid: add number of HDMI ports to device state
>       media: vivid: add HDMI (dis)connect TX emulation
>       media: vivid: add HDMI (dis)connect RX emulation
>       media: vivid: reorder CEC allocation and control set-up
>       media: vivid: add CEC support to display present ctrl
>       media: vivid.rst: describe display present control
> 
> Documentation/media/v4l-drivers/vivid.rst     |   5 +
> drivers/media/platform/vivid/vivid-core.c     | 120 ++++++++++------
> drivers/media/platform/vivid/vivid-core.h     |  32 +++--
> drivers/media/platform/vivid/vivid-ctrls.c    | 108 ++++++++++++--
> .../media/platform/vivid/vivid-kthread-cap.c  |   8 +-
> drivers/media/platform/vivid/vivid-vbi-cap.c  |  16 +--
> drivers/media/platform/vivid/vivid-vid-cap.c  | 135 ++++++++++++------
> .../media/platform/vivid/vivid-vid-common.c   |   8 +-
> drivers/media/platform/vivid/vivid-vid-out.c  |   6 +
> 9 files changed, 312 insertions(+), 126 deletions(-)
> 
> 
> 

