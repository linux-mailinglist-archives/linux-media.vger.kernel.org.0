Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59E99663B14
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 09:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbjAJIcG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 03:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbjAJIcD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 03:32:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010C4140A7
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 00:32:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C2E9614B5
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 08:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E866C433D2;
        Tue, 10 Jan 2023 08:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1673339521;
        bh=UyeZgHJZT70Fj8aWOL8C1090uhN4RG7XF83yhxSnaT8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PAzVkk0lHq/NH+INplkz/jHPp2Tc8HjNgbn8oKkjxg0NvFpgCosXjgk0k4Y9130dI
         pSP6qN1wWh796w/37hhTxcaxJAHdaLuFQLGwT3yYxQ9jsopWJ/rOikKGjyEcmczqq9
         zy4GbLahbTwWsnKfKgLV0UKUiJQiVQSibuR5wWwU=
Date:   Tue, 10 Jan 2023 09:31:57 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yui Washizu <yui.washidu@gmail.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media/av7110: cleanup coding style in av7110.c
Message-ID: <Y70ifV8ZUk3EHIGA@kroah.com>
References: <1673339336-27571-1-git-send-email-yui.washidu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1673339336-27571-1-git-send-email-yui.washidu@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 10, 2023 at 05:28:56PM +0900, Yui Washizu wrote:
> Fix everything checkpatch.pl complained about in av7110.c
> 
> Signed-off-by: Yui Washizu <yui.washidu@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110.c | 183 +++++++++++++++++-----------------
>  1 file changed, 91 insertions(+), 92 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
