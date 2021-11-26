Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D7445F5DC
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 21:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242218AbhKZU2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 15:28:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233186AbhKZU0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 15:26:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50422C061574;
        Fri, 26 Nov 2021 12:22:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E32F1B8272C;
        Fri, 26 Nov 2021 20:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10D1C9305B;
        Fri, 26 Nov 2021 20:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637958166;
        bh=9j0724BF59xz5hgcXRsM5EU2xOSwmkgZb6y8/qpKBvY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X2OelROH+EgtX/xn8VUQCk1zozAR8YL/IKP2wk+myP3f0UgtVUQHJcHMqkiMwDTc2
         mmXXywHqgJqOzyPMxDFPVAKCAG2FBba9b0TruAnE4vx8qS9DFMDNosyW9BvVUpJVxq
         geRDKK9VdPLceF7K4bYhXwz8rwCWovKF4C50XBR4oHHiunYAmsfQCzdvjoOMdPfviJ
         InrNec4gascC6Z8tR6eXzq9EOhbnP0lgTE4Bd8dhooef9EQJhzgi1AFOgeXdzlOMcn
         ZfbgkqSonVzL4Q+UvR7ZjCzXh5Ap1bVabRvlul/tPlXeV2Ehb8eJNQYUii5cXBkml/
         jN3AgorHHL+cQ==
Date:   Fri, 26 Nov 2021 13:22:41 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 12/20] media: au0828-i2c: drop a duplicated function
Message-ID: <YaFCESx6o6wD6Wac@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <1c5aeba00713d643e6f5600090b68e3d3689c5dd.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c5aeba00713d643e6f5600090b68e3d3689c5dd.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:15PM +0100, Mauro Carvalho Chehab wrote:
> This function is not used and it is identical to
> i2c_slave_did_read_ack(). So, just drop it.

Not quite, i2c_slave_did_write_ack() checks against
AU0828_I2C_STATUS_NO_WRITE_ACK, whereas i2c_slave_did_read_ack() checks
against AU0828_I2C_STATUS_NO_READ_ACK.

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Regardless of that, it is unused and I do not see anywhere obvious where
it should be.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/usb/au0828/au0828-i2c.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/media/usb/au0828/au0828-i2c.c b/drivers/media/usb/au0828/au0828-i2c.c
> index 708f01ab47fa..749f90d73b5b 100644
> --- a/drivers/media/usb/au0828/au0828-i2c.c
> +++ b/drivers/media/usb/au0828/au0828-i2c.c
> @@ -23,13 +23,6 @@ MODULE_PARM_DESC(i2c_scan, "scan i2c bus at insmod time");
>  #define I2C_WAIT_DELAY 25
>  #define I2C_WAIT_RETRY 1000
>  
> -static inline int i2c_slave_did_write_ack(struct i2c_adapter *i2c_adap)
> -{
> -	struct au0828_dev *dev = i2c_adap->algo_data;
> -	return au0828_read(dev, AU0828_I2C_STATUS_201) &
> -		AU0828_I2C_STATUS_NO_WRITE_ACK ? 0 : 1;
> -}
> -
>  static inline int i2c_slave_did_read_ack(struct i2c_adapter *i2c_adap)
>  {
>  	struct au0828_dev *dev = i2c_adap->algo_data;
> -- 
> 2.33.1
> 
> 
