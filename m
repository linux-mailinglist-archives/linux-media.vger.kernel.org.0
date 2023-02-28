Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB3566A5C68
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 16:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjB1PxJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 10:53:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjB1PxH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 10:53:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01679E04E
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:53:05 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 182C756A;
        Tue, 28 Feb 2023 16:53:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677599583;
        bh=nRRX93wK7SzRy56s8q0FxZ0H+j0bWtfSzQbq55xfwac=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=LJ7Z9OPbkK9ODjXi5kNBAptlokCADtx1OECZQhdmir2/E2BVOZlJX2zwC6Dz3fcTY
         dCHQFg3ZXp/EEQTYNh4wKPsJUm0yeU3RFLgfI5d8lSjaAjCa48mRXSRFb8tPjCTz5q
         gIGlQJ5mxF8wjdw/pjd46l4HlZW/hBYgmcjjyMks=
Message-ID: <7fa4508b-471c-e348-e4b9-9d46918b21e1@ideasonboard.com>
Date:   Tue, 28 Feb 2023 17:52:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/3] media: Zero-initialize structures passed to subdev
 pad ops
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
References: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/02/2023 18:50, Laurent Pinchart wrote:
> Hello,
> 
> This patch series fixes a (surprisingly large) number of drivers that
> don't zero-initialize structures passed to subdev pad operations.
> 
> The rationale is explained in patch 1/3, which fixes the issue: while
> this doesn't cause any immediate problem, it leaves reserved fields
> uninitialized, and any future change of in-kernel APIs that make use of
> some of the reserved fields may introduce hard to catch breakages.
> 
> Patches 2/3 and 3/3 are not strictly required to fix the problem, but
> they address coding style consistency issues that bothered me when
> developing 1/3.
> 
> Laurent Pinchart (3):
>    media: Zero-initialize all structures passed to subdev pad operations
>    media: Prefer designated initializers over memset for subdev pad ops
>    media: USe designated initializers for all subdev pad ops

For the three patches:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

