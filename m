Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8959E45349E
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 15:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237594AbhKPOwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 09:52:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237582AbhKPOv3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 09:51:29 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08511C061570;
        Tue, 16 Nov 2021 06:48:32 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 22B711F458BF
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637074110; bh=tVtgLQiEOpDHHHaJ5ct0SkMzxnFgc5BlaoIWWXimpko=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OggLjPtoRSPWS8ZLs8I799gkB90MsL/xFtgIKC8O+wdh/kgYzKP9odHJHnEbj1wPm
         GluregzK0LTcIzo2QE0TnM741ec+itkKBPSrloS2yGoZ/sw58LUk9uo29xnIcfiLf5
         CSfqHVVJfkq9sd0/Y69anMp33iJ1bVE10yloPxKjZF8BYWm377pN9QAemPR652FkJE
         fzMyYpzmN07MKwh0PhiC9XXC90rlpSXfI9dKJ9dSRkajkpd69HgZnh0M+3f1Hm0UlS
         IdvFNvu0tjB/wx3Q9j1InsK6ynl+f95QgVe3HutSuIVr2lDIp+1d3Xpd4s+7ZpbAbV
         4rouW9E311MIQ==
Subject: Re: [PATCH v8 00/12] VP9 codec V4L2 control interface
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
References: <20211116143842.75896-1-andrzej.p@collabora.com>
 <CAAEAJfANEficRLg2JCvOmv_pv9j9tEVPPsph4n4TYkeBjeUWiQ@mail.gmail.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <7496c1ab-4ee1-c13b-e7d4-3c3d47022f26@collabora.com>
Date:   Tue, 16 Nov 2021 15:48:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfANEficRLg2JCvOmv_pv9j9tEVPPsph4n4TYkeBjeUWiQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

W dniu 16.11.2021 o 15:47, Ezequiel Garcia pisze:
> On Tue, 16 Nov 2021 at 11:38, Andrzej Pietrasiewicz
> <andrzej.p@collabora.com> wrote:
>>
>> Dear all,
>>
>> This patch series adds VP9 codec V4L2 control interface and two drivers
>> using the new controls. It is a follow-up of previous v7 series [1].
>>
>> In this iteration, we've implemented VP9 hardware decoding on two devices:
>> Rockchip VDEC and Hantro G2, and tested on RK3399, i.MX8MQ and i.MX8MP.
>> The i.MX8M driver needs proper power domains support, though, which is a
>> subject of a different effort, but in all 3 cases we were able to run the
>> drivers.
>>
>> GStreamer support is also available, the needed changes have been submitted
>> by Daniel Almeida [2]. This MR is ready to be merged, and just needs the
>> VP9 V4L2 controls to be merged and released.
>>
>> Both rkvdec and hantro drivers are passing a significant number of VP9 tests
>> using Fluster[3]. There are still a few tests that are not passing, due to
>> dynamic frame resize (not yet supported by V4L2) and small size videos
>> (due to IP block limitations).
>>
>> The series adds the VP9 codec V4L2 control API as uAPI, so it aims at being
>> merged without passing through staging, as agreed[4]. The ABI has been checked
>> for padding and verified to contain no holes.
>>
>> [1] https://patchwork.linuxtv.org/project/linux-media/list/?series=6393
>> [2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/merge_requests/2144
> 
> Due to GStreamer monorepo, the MR has been moved to
> 
> https://gitlab.freedesktop.org//gstreamer/gstreamer/-/merge_requests/1012
> 

Thank you for catching this :)

Andrzej
