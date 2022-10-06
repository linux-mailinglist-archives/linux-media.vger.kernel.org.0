Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8A95F635A
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 11:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbiJFJO1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 05:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiJFJO1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 05:14:27 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BC497EE1
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 02:14:25 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A29EF20015;
        Thu,  6 Oct 2022 09:14:23 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:14:21 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 01/16] media: i2c: ov9282: Remove duplication of registers
Message-ID: <20221006091421.yxbiickbuunnxmtd@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-2-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-2-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Wed, Oct 05, 2022 at 04:27:54PM +0100, Dave Stevenson wrote:
> TIMING_VTS (registers 0x380e/f), EXPOSURE (registers
> 0x3500/1/2), and GAIN (0x3509) are all set from
> ov9282_update_exp_gain as part of the control handler,
> therefore they do not need to be in the main list of
> registers.
>
> Remove them.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I don't have the datashee but I can confirm the removed registers are
programmed when setting up controls

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/media/i2c/ov9282.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 699fc5b753b4..2c13bcd59c2a 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -173,14 +173,10 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
>  	{0x3030, 0x10},
>  	{0x3039, 0x32},
>  	{0x303a, 0x00},
> -	{0x3500, 0x00},
> -	{0x3501, 0x5f},
> -	{0x3502, 0x1e},
>  	{0x3503, 0x08},
>  	{0x3505, 0x8c},
>  	{0x3507, 0x03},
>  	{0x3508, 0x00},
> -	{0x3509, 0x10},
>  	{0x3610, 0x80},
>  	{0x3611, 0xa0},
>  	{0x3620, 0x6e},
> @@ -214,8 +210,6 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
>  	{0x380b, 0xd0},
>  	{0x380c, 0x05},
>  	{0x380d, 0xfa},
> -	{0x380e, 0x06},
> -	{0x380f, 0xce},
>  	{0x3810, 0x00},
>  	{0x3811, 0x08},
>  	{0x3812, 0x00},
> --
> 2.34.1
>
