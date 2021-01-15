Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9EB2F78C1
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 13:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730567AbhAOMWW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 07:22:22 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32938 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730871AbhAOMWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 07:22:15 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E6E361F45ECD
Message-ID: <d194755d07ee6949d6577d8d08402548dbcd75cc.camel@collabora.com>
Subject: Re: [PATCH v3 2/2] media: rockchip: rkisp1: extend uapi array sizes
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, Laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com, tfiga@chromium.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Date:   Fri, 15 Jan 2021 09:21:25 -0300
In-Reply-To: <20210115112351.208011-3-heiko@sntech.de>
References: <20210115112351.208011-1-heiko@sntech.de>
         <20210115112351.208011-3-heiko@sntech.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2021-01-15 at 12:23 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Later variants of the rkisp1 block use more entries in some arrays:
> 
> RKISP1_CIF_ISP_AE_MEAN_MAX                 25 -> 81
> RKISP1_CIF_ISP_HIST_BIN_N_MAX              16 -> 32
> RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES       17 -> 34
> RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28 -> 81
> 
> and we can still extend the uapi during the 5.11-rc cycle, so do that
> now to be on the safe side.
> 
> V10 and V11 only need the smaller sizes, while V12 and V13 needed
> the larger sizes.
> 
> When adding the bigger sizes make sure, values filled from hardware
> values and transmitted to userspace don't leak kernel data by zeroing
> them beforehand.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

