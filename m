Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89781433369
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 12:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbhJSKYF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 06:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbhJSKYF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 06:24:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDD9C06161C
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 03:21:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5439312A;
        Tue, 19 Oct 2021 12:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634638910;
        bh=OTGnV8tLKeJqWMHvKNeTrjCW/m4y4GZsWBKKjuXTQN0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bwE1CVg7yLNOemB2hA603ypzxD9BbT6ZFWUHKXtho/6WRC7xMC2XTJmBD7/l9hQ6U
         5Ght68Vg8GAkIovGiFEO3HWM+j/BeSjHLaI4eUO7xbQ9hPovFPm+kTo4R489wul7Li
         oYiey0J7jqRwILDd520X5UKlxykPfx808RQhH7Po=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1634525295-1410-1-git-send-email-bingbu.cao@intel.com>
References: <1634525295-1410-1-git-send-email-bingbu.cao@intel.com>
Subject: Re: [PATCH v2] media: staging: ipu3-imgu: clarify the limitation of grid config
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, jeanmichel.hautbois@ideasonboard.com
To:     Bingbu Cao <bingbu.cao@intel.com>,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com
Date:   Tue, 19 Oct 2021 11:21:47 +0100
Message-ID: <163463890722.1853916.13254760106889780500@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Bingbu Cao (2021-10-18 03:48:15)
> There are some grid configuration limitations for ImgU, which was
> not described clearly in current uAPI header file, add the description
> to help user to set the grid configuration correctly.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drive=
rs/staging/media/ipu3/include/uapi/intel-ipu3.h
> index fa3d6ee5adf2..6d3ebb880a64 100644
> --- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> @@ -34,11 +34,17 @@
>   * struct ipu3_uapi_grid_config - Grid plane config
>   *
>   * @width:     Grid horizontal dimensions, in number of grid blocks(cell=
s).
> + *             For AWB, the range is (16, 80).
> + *             For AF/AE, the range is (16, 32).
>   * @height:    Grid vertical dimensions, in number of grid cells.
> + *             For AWB, the range is (16, 60).
> + *             For AF/AE, the range is (16, 24).
>   * @block_width_log2:  Log2 of the width of each cell in pixels.
> - *                     for (2^3, 2^4, 2^5, 2^6, 2^7), values [3, 7].
> + *                     For AWB, the range is [3, 6].
> + *                     For AF/AE, the range is [3, 7].
>   * @block_height_log2: Log2 of the height of each cell in pixels.
> - *                     for (2^3, 2^4, 2^5, 2^6, 2^7), values [3, 7].
> + *                     For AWB, the range is [3, 6].
> + *                     For AF/AE, the range is [3, 7].
>   * @height_per_slice:  The number of blocks in vertical axis per slice.
>   *                     Default 2.
>   * @x_start: X value of top left corner of Region of Interest(ROI).
> --=20
> 2.7.4
>
