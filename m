Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B6A44AF8C
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 15:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbhKIOh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 09:37:57 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49866 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhKIOhz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Nov 2021 09:37:55 -0500
Received: from [IPv6:2a01:e0a:120:3210:5cd8:9f51:76ae:8ed8] (unknown [IPv6:2a01:e0a:120:3210:5cd8:9f51:76ae:8ed8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 101901F4465D;
        Tue,  9 Nov 2021 14:35:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636468508; bh=BrTB4hM7VfksIFjI74aYf8PVE6yEqs2GneUpf/pr2cM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=y7DTvCV8PHyoqWkUXpkmGvqdr5Gi1Dp5auF4QWib1j2XSplCTEiXtlMZl63EYSvyA
         MJJeoP6cCNKOc1ZC31KvOdEV08rQNdRndGUEyoxtoOFjXbjw8mHK0/woPMtZtWq9oU
         Z4nuXpJojaHbIs95c+vHH9kOAtczz4V23iR5v7/6y6KVZUhHO7/x1XjOfXW7ZE19wK
         kW4x6ec5hivMi0xRsw+SCBRDsrAO0a7ZJKFjPQMhhuEMzDINqInms2NYyXIPRSe3Fe
         qUGKxhUewJgAV1Uw4poa/86eU1Y8KiddqqHLnE1tB1II+vgBXgT5mur6LiDS/NONcT
         9B5uDGPiLXzyg==
Subject: Re: [PATCH v2 0/4] media: HEVC: RPS clean up
To:     mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl,
        jc@kynesim.co.uk, ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20211012143552.661751-1-benjamin.gaignard@collabora.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <b0a0c2be-c4e1-a7fa-23a4-034e181ebf1b@collabora.com>
Date:   Tue, 9 Nov 2021 15:35:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012143552.661751-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 12/10/2021 à 16:35, Benjamin Gaignard a écrit :
> This series aims to clean up Reference Picture Set usage and flags.
>
> Long term flag was named with RPS prefix while it is not used for RPS
> but for mark long term references in DBP. Remane it and remove the two
> other useless RPS flags.
>
> Clarify documentation about RPS lists content and make sure that Hantro
> driver use them correctly (i.e without look up in DBP).

This series generates feedback about what is missing to move HEVC uAPI
out of staging but lack of remarks about the proposed changes themselves.
Does someone has an opinion about this RPS flag clean up ?

Regards,
Benjamin

>
> These patches are the last in my backlog impacting HEVC uAPI.
>  From my point of view, once they get merged, you could start talking
> about how move HEVC uAPI to stable.
>
> version 2:
> - change DPB field name from rps to flags
>
> Please note that the only purpose of commits 3 and 4 is to allow to test
> G2 hardware block for IMX8MQ until a proper solution isuing power domain
> can be found. Do not merge them.
>
> GStreamer HEVC plugin merge request can be found here:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1079
>
> With those piece of code fluster score is 77/147.
>
> Benjamin
>
> Benjamin Gaignard (4):
>    media: hevc: Remove RPS named flags
>    media: hevc: Embedded indexes in RPS
>    media: hantro: Use syscon instead of 'ctrl' register
>    arm64: dts: imx8mq: Add node to G2 hardware
>
>   .../media/v4l/ext-ctrls-codec.rst             | 14 +++---
>   arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 43 +++++++++++++----
>   drivers/staging/media/hantro/hantro.h         |  5 +-
>   .../staging/media/hantro/hantro_g2_hevc_dec.c | 27 +++--------
>   drivers/staging/media/hantro/imx8m_vpu_hw.c   | 48 ++++++++++++-------
>   .../staging/media/sunxi/cedrus/cedrus_h265.c  |  2 +-
>   include/media/hevc-ctrls.h                    |  6 +--
>   7 files changed, 84 insertions(+), 61 deletions(-)
>
