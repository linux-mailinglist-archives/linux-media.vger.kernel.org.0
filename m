Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C5E45F5F2
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 21:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237012AbhKZUlB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 15:41:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234041AbhKZUjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 15:39:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E35C06174A;
        Fri, 26 Nov 2021 12:27:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D3DC6B828C9;
        Fri, 26 Nov 2021 20:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FC5C004E1;
        Fri, 26 Nov 2021 20:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637958436;
        bh=QM2OHNxT6azeLWqJ+md9LhQ+Vv96dNnVoq5Sbyr5d6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e/geKY9CfT8EnMc+9fY37Z6Bo8Dbb2LFC7YVS3dMI7cjp8p2k/eZ3uZTmI5nrJSVG
         pNoYY4lhGbpGxm2OXiQL//jQG86dOprEs9ChN3K500QsGPYQm3FazWTGPbxRIithSv
         UHRoa3QSIpP8oBecB5+YVVkVZ08QsVphVBED4ppRFbL7i4mVhK8GZNPU8vuxpaSrxK
         aMKYz50pebjN+2LEvz/ooNijfEq+aPDM7by6Pkd+exb1B1Qxt3qubT58qAdG/7POLh
         tCk8ANGfPL3NrwPLij8vfIQn+Mm++DLspX4iFanNhOGL2s9efAckDCWKLOg9G1FVGx
         quWBHCqZ1u5sw==
Date:   Fri, 26 Nov 2021 13:27:11 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 14/20] media: adv7511: drop unused functions
Message-ID: <YaFDHyiiIvSPPknY@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <031cdb0042f8239a6746831f5c8f89cf4aef6107.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <031cdb0042f8239a6746831f5c8f89cf4aef6107.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:17PM +0100, Mauro Carvalho Chehab wrote:
> Those are aliases for another function and not used at the
> current implementation. So, just drop it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/i2c/adv7511-v4l2.c | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
> index 41f4e749a859..8e13cae40ec5 100644
> --- a/drivers/media/i2c/adv7511-v4l2.c
> +++ b/drivers/media/i2c/adv7511-v4l2.c
> @@ -270,28 +270,6 @@ static int adv7511_pktmem_rd(struct v4l2_subdev *sd, u8 reg)
>  	return adv_smbus_read_byte_data(state->i2c_pktmem, reg);
>  }
>  
> -static int adv7511_pktmem_wr(struct v4l2_subdev *sd, u8 reg, u8 val)
> -{
> -	struct adv7511_state *state = get_adv7511_state(sd);
> -	int ret;
> -	int i;
> -
> -	for (i = 0; i < 3; i++) {
> -		ret = i2c_smbus_write_byte_data(state->i2c_pktmem, reg, val);
> -		if (ret == 0)
> -			return 0;
> -	}
> -	v4l2_err(sd, "%s: i2c write error\n", __func__);
> -	return ret;
> -}
> -
> -/* To set specific bits in the register, a clear-mask is given (to be AND-ed),
> -   and then the value-mask (to be OR-ed). */
> -static inline void adv7511_pktmem_wr_and_or(struct v4l2_subdev *sd, u8 reg, u8 clr_mask, u8 val_mask)
> -{
> -	adv7511_pktmem_wr(sd, reg, (adv7511_pktmem_rd(sd, reg) & clr_mask) | val_mask);
> -}
> -
>  static inline bool adv7511_have_hotplug(struct v4l2_subdev *sd)
>  {
>  	return adv7511_rd(sd, 0x42) & MASK_ADV7511_HPD_DETECT;
> -- 
> 2.33.1
> 
> 
