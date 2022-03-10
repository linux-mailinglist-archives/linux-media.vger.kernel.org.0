Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1944D4C56
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 16:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245169AbiCJOzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 09:55:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347931AbiCJOvc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 09:51:32 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE8D222;
        Thu, 10 Mar 2022 06:49:54 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7AB0C10001C; Thu, 10 Mar 2022 14:49:50 +0000 (UTC)
Date:   Thu, 10 Mar 2022 14:49:50 +0000
From:   Sean Young <sean@mess.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org, smatch@vger.kernel.org
Subject: Re: [PATCH] media: lirc: suppress false positive smatch warning
Message-ID: <YioQDufZYul4jl14@gofer.mess.org>
References: <20220310132350.78729-1-sean@mess.org>
 <20220310144230.GI3315@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310144230.GI3315@kadam>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 10, 2022 at 05:42:30PM +0300, Dan Carpenter wrote:
> On Thu, Mar 10, 2022 at 01:23:50PM +0000, Sean Young wrote:
> > The latest smatch says:
> > 
> > drivers/media/rc/lirc_dev.c:632 lirc_read_mode2() error: uninitialized symbol 'copied'.
> > drivers/media/rc/lirc_dev.c:671 lirc_read_scancode() error: uninitialized symbol 'copied'.
> > 
> > This is a false positive since in all reaching code paths, copied will
> > be set. Work around this by providing a zero initializer for copied.
> > 
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > Cc: smatch@vger.kernel.org
> > Signed-off-by: Sean Young <sean@mess.org>
> 
> I'm sorry for this.  I can't reproduce this on my system.  I just did a
> push for something unrelated and I don't know what the previous HEAD
> was...

You're right, with the latest HEAD the warning goes away. Great, let's drop
this patch then.

Thanks for a great tool


Sean
