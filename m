Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6E5256CD8
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 10:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbgH3IgA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 04:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbgH3IgA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 04:36:00 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A2BC061573
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2020 01:35:59 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 82D71C63F6; Sun, 30 Aug 2020 09:35:57 +0100 (BST)
Date:   Sun, 30 Aug 2020 09:35:57 +0100
From:   Sean Young <sean@mess.org>
To:     Daniel Gielen <gielendaniel@gmail.com>
Cc:     mchehab@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] DVBSKY S952v1 (M88TS2020 tuner, M88DS3103 demod): Set
 clk_out_div to 1 for M88TS2020, 0 locks up demod M88DS3103
Message-ID: <20200830083557.GA17813@gofer.mess.org>
References: <20200502211809.3906-1-gielendaniel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502211809.3906-1-gielendaniel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 02, 2020 at 11:18:09PM +0200, Daniel Gielen wrote:
> Signed-off-by: Daniel Gielen <gielendaniel@gmail.com>

Please can we have a better commit message, explaining what behaviour
you seeing before the patch and how this fixes it. A bisect which show
what regression you are fixing would also be helpful.

Thanks,

Sean

> ---
>  drivers/media/pci/cx23885/cx23885-dvb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/cx23885/cx23885-dvb.c b/drivers/media/pci/cx23885/cx23885-dvb.c
> index 45c2f4afc..7123e1487 100644
> --- a/drivers/media/pci/cx23885/cx23885-dvb.c
> +++ b/drivers/media/pci/cx23885/cx23885-dvb.c
> @@ -2139,6 +2139,7 @@ static int dvb_register(struct cx23885_tsport *port)
>  		memset(&ts2020_config, 0, sizeof(ts2020_config));
>  		ts2020_config.fe = fe0->dvb.frontend;
>  		ts2020_config.get_agc_pwm = m88ds3103_get_agc_pwm;
> +		ts2020_config.clk_out_div = 1;
>  		memset(&info, 0, sizeof(struct i2c_board_info));
>  		strscpy(info.type, "ts2020", I2C_NAME_SIZE);
>  		info.addr = 0x60;
> -- 
> 2.25.1
