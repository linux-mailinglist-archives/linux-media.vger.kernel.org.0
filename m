Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0C450D87A
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 06:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241105AbiDYEu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 00:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241104AbiDYEsr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 00:48:47 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF7BBF55
        for <linux-media@vger.kernel.org>; Sun, 24 Apr 2022 21:45:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E643ACE1021
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B70C385A7;
        Mon, 25 Apr 2022 04:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650861917;
        bh=2gZLH75MhvXmgXdEDwAZDudUMeUiaWw1yA8c9fQX3BI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nu/2lXmc6Av6YAwdkfyQIuYYY1h8pQ22d5pz6yqUKpwZetniiPnxYrwwP6wEqirRZ
         8JPDyZDPEWuJroM8bB50DdgNOUxWC7RheMpX1Yeq4ZRkvhK5MYRMHFTnYzLxtVJuMR
         SHBQnTCcB5beTmU+G1T8sZ/2qhAabYmMYiZ7K9y4=
Date:   Mon, 25 Apr 2022 06:45:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Cowan <ian@linux.cowan.aero>
Cc:     LABBE Corentin <clabbe@baylibre.com>, mchehab@kernel.org,
        dan.carpenter@oracle.com, mjpeg-users@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/4] staging: media: zoran: add zrdev_dbg() macros
Message-ID: <YmYnVfYPrWkcee1m@kroah.com>
References: <20220423051745.292683-1-ian@linux.cowan.aero>
 <YmWiQsrPj0uIpZ7w@Red>
 <YmX31vg+lCx6rsKF@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmX31vg+lCx6rsKF@fedora>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 24, 2022 at 09:22:30PM -0400, Ian Cowan wrote:
> On Sun, Apr 24, 2022 at 09:17:22PM +0200, LABBE Corentin wrote:
> > Hello
> > 
> > Thanks for your patchs, removing dprintk is a good idea.
> > Please use pci_xxx() instead of dev_xxx() to be consistent with the rest of the driver.
> > The comment title is misleading, zrdev_err is not about debugging. What about Logging macros ?
> > 
> > Regards
> > 
> 
> I have made those modifications, and I will resubmit patches 1 and 2
> shortly. Those are the only patches that affected by this change; 3 and
> 4 will not change.

You should send a whole new series, properly versioned as the
documentation in the kernel asks you to.  Otherwise it is impossible for
reviewers and maintainers to know what is the "latest" version to
accept.

thanks,

greg k-h
