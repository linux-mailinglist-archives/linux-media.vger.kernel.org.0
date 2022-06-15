Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86B0D54C68A
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 12:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347506AbiFOKxn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 06:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347341AbiFOKxm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 06:53:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15585130A;
        Wed, 15 Jun 2022 03:53:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 83AAE6162D;
        Wed, 15 Jun 2022 10:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BCEC34115;
        Wed, 15 Jun 2022 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1655290418;
        bh=xorApPrJYjqRVSP/59nC6A1gHUam/lVIdxd8tViYqNs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XLzcAJdjue7U4UAgQgf9+RKr6LPQLQ1VcUI/upqTv1jd4xn6ffwn+7ka1a4EDGE8U
         zqx74/OmAxwHanaqgwTA7wUZlgugxFfwkQhE/i3XRtI35ar4o26wDmuNDE1Dgh11mi
         /epAMQstrnhJN4qD2PnkwxCSW90WgW64Lkp7vHmk=
Date:   Wed, 15 Jun 2022 12:53:34 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     heliang <windhl@126.com>
Cc:     ldewangan@nvidia.com, jirislaby@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        p.zabel@pengutronix.de, sumit.semwal@linaro.org,
        christian.koenig@amd.com, linux-serial@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drivers: tty: serial: Add missing of_node_put() in
 serial-tegra.c
Message-ID: <Yqm6LvDGqaRMaUHa@kroah.com>
References: <20220615104833.3963552-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615104833.3963552-1-windhl@126.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 15, 2022 at 06:48:33PM +0800, heliang wrote:
> In tegra_uart_init(), of_find_matching_node() will return a node
> pointer with refcount incremented. We should use of_node_put()
> when it is not used anymore.
> 
> Signed-off-by: heliang <windhl@126.com>

We need a real name please, one you sign documents with.

thanks,

greg k-h
