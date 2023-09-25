Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 650027AD1F3
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 09:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbjIYHmn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 03:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbjIYHmm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 03:42:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D44DADA
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 00:42:36 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D1DC433C8;
        Mon, 25 Sep 2023 07:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695627756;
        bh=6DZHtB0PCCh+zPp9QeExIafKroe58DHcwPkeFugsBHU=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=U1/vSwKHOCEN9MgF3eLbvcyh1GSUvqCPjKbOAK0YI8ZqdG7TwQhBsLuW7sE5snz6i
         CEjC1VX49itnONKd/bOjF1VFh6WU9RSnVXeA7Q1IoKwP0WBma5l3kjENK5GFrwElFB
         SGdIYJ2hg2LT2RT9DUYJZYrT5VPfGU2lc9TfBYjUY3odPFElnvpuH6gtiqSn1ofHiB
         mtmcrGH7xnEmIeocB8k0hMTI3t2cvX+YpeqSuKGaBanHzGZkYS70XJkwmH4xaoCgQ3
         L97U/O6OdmsRE4/7tRyk8XWuST4Orpt33EQVxjqpuxEiNhD6hzcfr+uo4VX3loGk3n
         o7nzR5r2y3+3Q==
Message-ID: <912a5b5417e67684500ef3bcb4668566.mripard@kernel.org>
Date:   Mon, 25 Sep 2023 07:42:33 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCHv2 13/23] media: use sizeof() instead of
 V4L2_SUBDEV_NAME_SIZE
In-Reply-To: <20230923152107.283289-14-hverkuil-cisco@xs4all.nl>
References: <20230923152107.283289-14-hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, "Arnd Bergmann" <arnd@kernel.org>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
        "Maxime Ripard" <mripard@kernel.org>,
        =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        "Sowjanya Komatineni" <skomatineni@nvidia.com>
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 23 Sep 2023 17:20:57 +0200, Hans Verkuil wrote:
> Don't rely on a define, let the compiler use the actual
> field size.
> 
> Remove all uses of the V4L2_SUBDEV_NAME_SIZE define and also
> drop the define itself.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
