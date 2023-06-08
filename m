Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 459A37282E8
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 16:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236047AbjFHOly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 10:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235563AbjFHOlx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 10:41:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C9711A
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 07:41:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126033089000.35.openmobile.ne.jp [126.33.89.0])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F21111AE;
        Thu,  8 Jun 2023 16:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686235282;
        bh=lvbmru48lpDtWSeP2081TUaoGyux7OnZrfBRecqO9oA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iREIEyVB0QKcleTuCqzrhTNuv6bkwUvsrmbN1OdBybRRW/5SblTrq0OXRi9CWjPDQ
         149//U4HiUNIQtBSx/342feWKQ77zkmesn1pjrJDQUPJPSlBSTsgnt4YLtO/OeTLgh
         VpctIy1vffkQb1avnIZNFY7QTU6UCa9y5Wvw4CxI=
Date:   Thu, 8 Jun 2023 17:41:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tommaso Merciai <tomm.merciai@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: drivers/media/i2c/imx290.c
Message-ID: <20230608144146.GS5058@pendragon.ideasonboard.com>
References: <ZIHiPhyQ7jxLuih1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZIHiPhyQ7jxLuih1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tommaso,

On Thu, Jun 08, 2023 at 04:14:22PM +0200, Tommaso Merciai wrote:
> 
> Hello Manivannan/Laurent,
> 
> Theme is: drivers/media/i2c/imx290.c
> 
> 
> Taking this driver as reference for some part of the Alvium
> driver I found some doubts:
> 
> 1)----------------
> 
> 
> Into imx290_set_stream
> 
> Lock is taken using:
> 
> state = v4l2_subdev_lock_and_get_active_state(sd);
> 
> but v4l2_subdev_unlock_state is never called except
> that something fail during the stream_on.
> This not cause a deadlock in your side?
> I'm missing something?

The state is unlocked at the end of the function:

unlock:
	v4l2_subdev_unlock_state(state);
	return ret;

This code path is taken in the success case too, not only the error
cases.

> 2)----------------
> 
> imx290_ctrl_update has format param that is never used,
> or I'm wrong?

Indeed, the argument isn't used, it could be dropped.

> -----------------
> 
> Thanks in advance for clarify this! :)

-- 
Regards,

Laurent Pinchart
