Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 299BE76E365
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 10:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjHCInc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 04:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234901AbjHCInL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 04:43:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1D7B0
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 01:43:09 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DA275A4;
        Thu,  3 Aug 2023 10:42:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691052124;
        bh=b+njT2Ztw+1dGB49xUnkqEmKpsSmxKcIxWQXqoUtIMs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Kdl0Vf4l16VXPH6z0RFL59iwExNaUpp16WgVDw9E1lVI75an+7GVpkQWWkMMdBgzA
         /i3RVVCSFdyVlP7S1CYKG1IXb7vKifisG01+EFQDI/ktuFRA54bTzM3nJB6WtcTECI
         BQiJTdg+70tYVy+HQd5wcjleZLYVhsX28fnr4glo=
Message-ID: <54555ef9-1281-d2ef-dd92-cd9847194256@ideasonboard.com>
Date:   Thu, 3 Aug 2023 11:43:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: smatch errors in ds90ub913
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <8d6daeb1-b62a-bbb2-b840-8759c84f2085@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <8d6daeb1-b62a-bbb2-b840-8759c84f2085@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/08/2023 10:55, Hans Verkuil wrote:
> Hi Tomi,
> 
> I discovered that this driver was disabled in the smatch build, and after I enabled
> it I got these smatch errors:
> 
> drivers/media/i2c/ds90ub913.c:481 ub913_log_status() error: uninitialized symbol 'v1'.
> drivers/media/i2c/ds90ub913.c:481 ub913_log_status() error: uninitialized symbol 'v2'.
> drivers/media/i2c/ds90ub953.c:655 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
> drivers/media/i2c/ds90ub953.c:655 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
> drivers/media/i2c/ds90ub953.c:655 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.
> drivers/media/i2c/ds90ub960.c:1788 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
> 
> That's also the case with the fixes PR for this driver that Sakari posted.
> 
> Can you take a look?

I have sent fixes for these. And added smatch to my toolset...

  Tomi

