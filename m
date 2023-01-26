Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF7B67C525
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 08:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235664AbjAZHt3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 02:49:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235269AbjAZHt2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 02:49:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB1E8698
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 23:49:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4CB84B817C1
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E3AC433D2;
        Thu, 26 Jan 2023 07:49:20 +0000 (UTC)
Message-ID: <d64b59f5-31f4-b0e9-0873-df1e9f6865fc@xs4all.nl>
Date:   Thu, 26 Jan 2023 08:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 1/8] media: i2c: Drop unused ad9389b video encoder
 driver
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
References: <20230125224856.22266-1-laurent.pinchart@ideasonboard.com>
 <20230125224856.22266-2-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230125224856.22266-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/01/2023 23:48, Laurent Pinchart wrote:
> The ad9389b video encoder driver doesn't support DT and relies on
> platform data. No board file has ever provided platform data for that
> device. The driver has thus never been used in the mainline kernel since
> its introduction in v3.7. Drop it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../admin-guide/media/i2c-cardlist.rst        |    1 -
>  MAINTAINERS                                   |    6 -
>  drivers/media/i2c/Kconfig                     |   14 -
>  drivers/media/i2c/Makefile                    |    1 -
>  drivers/media/i2c/ad9389b.c                   | 1215 -----------------
>  include/media/i2c/ad9389b.h                   |   37 -
>  6 files changed, 1274 deletions(-)
>  delete mode 100644 drivers/media/i2c/ad9389b.c
>  delete mode 100644 include/media/i2c/ad9389b.h
> 

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

It was used in Cisco products that are end-of-life for quite a few years now.

So I am OK with dropping this driver.

Regards,

	Hans

