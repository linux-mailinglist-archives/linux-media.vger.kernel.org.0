Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19AF2F7C64
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 14:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732859AbhAONUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 08:20:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732855AbhAONUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 08:20:49 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F22C0613C1
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 05:20:26 -0800 (PST)
Received: from [IPv6:2003:c7:cf1c:ce00:50c3:215:f597:23ab] (p200300c7cf1cce0050c30215f59723ab.dip0.t-ipconnect.de [IPv6:2003:c7:cf1c:ce00:50c3:215:f597:23ab])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A879B1F45E0E;
        Fri, 15 Jan 2021 13:20:24 +0000 (GMT)
Subject: Re: [PATCH v3 2/2] media: rockchip: rkisp1: extend uapi array sizes
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>, helen.koike@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com, tfiga@chromium.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210115112351.208011-1-heiko@sntech.de>
 <20210115112351.208011-3-heiko@sntech.de>
 <d194755d07ee6949d6577d8d08402548dbcd75cc.camel@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <771f6491-e3c4-a845-e845-11e71d7044f4@collabora.com>
Date:   Fri, 15 Jan 2021 14:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d194755d07ee6949d6577d8d08402548dbcd75cc.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 15.01.21 um 13:21 schrieb Ezequiel Garcia:
> On Fri, 2021-01-15 at 12:23 +0100, Heiko Stuebner wrote:
>> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>>
>> Later variants of the rkisp1 block use more entries in some arrays:
>>
>> RKISP1_CIF_ISP_AE_MEAN_MAX                 25 -> 81
>> RKISP1_CIF_ISP_HIST_BIN_N_MAX              16 -> 32
>> RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       17 -> 34
>> RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28 -> 81
>>
>> and we can still extend the uapi during the 5.11-rc cycle, so do that
>> now to be on the safe side.
>>
>> V10 and V11 only need the smaller sizes, while V12 and V13 needed
>> the larger sizes.
>>
>> When adding the bigger sizes make sure, values filled from hardware
>> values and transmitted to userspace don't leak kernel data by zeroing
>> them beforehand.
>>
>> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Thanks,
Dafna

> 
> Thanks,
> Ezequiel
> 
