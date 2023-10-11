Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E67D7C577E
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 16:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235091AbjJKOxR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 10:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbjJKOxQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 10:53:16 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05101A9
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 07:53:14 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E3C6D10005E; Wed, 11 Oct 2023 15:53:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1697035992; bh=s5PBy5Ecbm1fwlz1fP5d/6y5+u7wSy2SWSd13TkdrRk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k54yJ1kKklvgJ+U8m51Its+lN5dW++uPVsOAMUxIGIt2lrv30euUySvZQNBR0WzSv
         6UfUZn7UBuqztc7MfeutqFOb03tVi/Qsnl9QvW3xeGe8Eps+hV3B1FyNOumOi5Fato
         EhPlTUMfB4RcK8l2HB1tv+Whjht+U0ia2Wj/Rehyk6MJiVMy7LaYHgRQ4Uv1sntE+T
         vMfa2qqBtB3fc2cfkr6nnsoR+uwi35apT5f+wRFrmGeOw/rz2HBeR7VjEHCdiaKQ/t
         XMpxz952CpHXWWN5V5iEhQJjvQXo53Xf0l2YDsAH7CARew1iAMrAW/cJ6CKY0hqoIB
         qhJqRBhnqXTsw==
Date:   Wed, 11 Oct 2023 15:53:12 +0100
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v6.7] Minor rc fixes
Message-ID: <ZSa22E0RLQmWxR9X@gofer.mess.org>
References: <ZSOux5a0d0tu9FtE@gofer.mess.org>
 <3faae6db-140a-4eb0-a72e-4d2a82e281ec@xs4all.nl>
 <ZSalxiDPtztvdW0x@gofer.mess.org>
 <d556ab48-b4a4-4699-ba8a-8cb5700f2eec@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d556ab48-b4a4-4699-ba8a-8cb5700f2eec@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 11, 2023 at 03:51:29PM +0200, Hans Verkuil wrote:
> On 11/10/2023 15:40, Sean Young wrote:
> > On Wed, Oct 11, 2023 at 02:58:19PM +0200, Hans Verkuil wrote:
> >> On 09/10/2023 09:41, Sean Young wrote:
> >> These two patches have a Cc to stable, but no Fixes: tag.
> > 
> > I've added the fixes tags and retagged the v6.7c tag in my repo.
> 
> I'll pick it up from your repo again. No need to do anything.

Thanks.

If we have rules like "Cc: stable" requires "Fixes: " then we really need 
tooling that picks that up and warns us about it. Otherwise, not everyone
will know or remember.

Something for your build-scripts?


Sean
