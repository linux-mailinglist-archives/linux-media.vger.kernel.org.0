Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C54529B46
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 09:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236436AbiEQHnV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 03:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242014AbiEQHm5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 03:42:57 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0ABE49932
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 00:42:40 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 008EB101BE5; Tue, 17 May 2022 08:42:38 +0100 (BST)
Date:   Tue, 17 May 2022 08:42:38 +0100
From:   Sean Young <sean@mess.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org
Subject: Re: [PATCH] imon_raw: respect DMA coherency
Message-ID: <YoNR7ngGGzqxf8+/@gofer.mess.org>
References: <20220512130321.30599-1-oneukum@suse.com>
 <Yn6F87BxKsOaDYR5@gofer.mess.org>
 <2c6478af-6247-0cbf-8761-7ca288522f7f@suse.com>
 <YoJ+jhKDxUokK207@gofer.mess.org>
 <61569f96-4424-eb40-c546-47353de33501@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61569f96-4424-eb40-c546-47353de33501@suse.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oliver,

On Tue, May 17, 2022 at 09:34:49AM +0200, Oliver Neukum wrote:
> On 16.05.22 18:40, Sean Young wrote:
> > On Mon, May 16, 2022 at 01:00:30PM +0200, Oliver Neukum wrote:
> >> On 13.05.22 18:23, Sean Young wrote:
> >> Hi!
> >>> On Thu, May 12, 2022 at 03:03:21PM +0200, Oliver Neukum wrote:
> >>>> No buffer can be embedded inside a descriptor, not even a simple be64.
> >>>> Use a separate kmalloc()
> >>> This patch needs a tiny change from be64_to_cpu() to be64_to_cpup(), I've
> >>> tested that change with the hardware.
> >> Needs? It is certainly not wrong and the subsequent logging will be in the
> >> converted order, but need
> > It certainly is wrong, and it doesn't compile without it, so yes it does
> > need it. The kernel test robot also complained about.
> >
> >
> 
> Hi,
> 
> sorry, it seems I forgot a "*". You are right.

Thank you for your patches, they fix many important issues that I missed.


Sean
