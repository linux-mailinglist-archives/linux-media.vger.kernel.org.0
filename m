Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C238D6E5993
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 08:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjDRGp3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 02:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjDRGp1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 02:45:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A88D40DC;
        Mon, 17 Apr 2023 23:45:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2702162723;
        Tue, 18 Apr 2023 06:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD3DC433D2;
        Tue, 18 Apr 2023 06:45:23 +0000 (UTC)
Message-ID: <7f528964-36ae-71b9-0bd9-5c75b9d89594@xs4all.nl>
Date:   Tue, 18 Apr 2023 08:45:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/3] media: rcar-csi2: Add support for V4H
Content-Language: en-US
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 11/02/2023 15:53, Niklas Söderlund wrote:
> Hello,
> 
> This series adds support for Renesas R-Car V4H. The work depends on the 
> series which adds the compatible value added to the bindings 
> documentation, posted separately [1].
> 
> Patch 1/3 prepares the driver for R-Car Gen4 by creating function 
> pointers for differences with Gen3. Patch 2/3 prepares for parsing CSI-2 
> C-PHY properties. Finally patch 3/3 adds V4H support.
> 
> Tested on both Gen3 and Gen4 hardware without any regressions. Tested 
> using both regular capture and v4l-compliance.
> 
> 1. [PATCH 0/3] media: dt-bindings: media: Add bindings for video capture on R-Car V4H
> 
> Niklas Söderlund (3):
>   media: rcar-csi2: Prepare for Gen4 support
>   media: rcar-csi2: Prepare for C-PHY support
>   media: rcar-csi2: Add support for C-PHY on R-Car V4H
> 
>  .../platform/renesas/rcar-vin/rcar-csi2.c     | 394 +++++++++++++++++-
>  1 file changed, 379 insertions(+), 15 deletions(-)
> 

Can you rebase and repost? This series no longer applies.

Thanks!

	Hans
