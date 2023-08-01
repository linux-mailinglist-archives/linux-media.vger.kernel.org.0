Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A89E676B1AE
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 12:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbjHAKYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 06:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234253AbjHAKXC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 06:23:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A245FE1
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 03:19:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6BC9D6153B
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 10:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58791C433C8;
        Tue,  1 Aug 2023 10:19:01 +0000 (UTC)
Message-ID: <5e202eb1-3c5b-6135-1d39-4e96f5971e2e@xs4all.nl>
Date:   Tue, 1 Aug 2023 12:18:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] Compiler warning fixes
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20230801071430.3302630-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230801071430.3302630-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 01/08/2023 09:14, Sakari Ailus wrote:
> Hi folks,
> 
> These two little patches address a couple of compiler and smatch warnings.
> 
> Sakari Ailus (2):
>   media: ccs-pll: Initialise best_div to avoid a compiler warning
>   media: pci: ipu3-cio2: Initialise timing struct to avoid a compiler
>     warning
> 
>  drivers/media/i2c/ccs-pll.c              | 2 +-
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Much appreciated! I've merged these two patches.

I'm left with one more ccs smatch warning in the daily build:

drivers/media/i2c/ccs/ccs-data.c:524 ccs_data_parse_rules() warn: address of NULL pointer 'rules'

While 'rules' shouldn't be NULL, it is too difficult for smatch (or me, for that
matter) to see that. And I am also wondering if a NULL check wouldn't make the code
more robust in case of broken rules.

Regards,

	Hans
