Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C026932A864
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345842AbhCBRcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1838368AbhCBKgG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Mar 2021 05:36:06 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5076DC061794;
        Tue,  2 Mar 2021 02:35:26 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 510AAC6367; Tue,  2 Mar 2021 10:35:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1614681322; bh=3Og2/oTj0MpKaOPfTMdCr8ouIBHGGgvO2an7EUz1cZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bo9FFnhj96ftf24NNYw7LkEaEsN2OK1/kczBFrABRENP1QwLgl0OgX6I+LPA20zkS
         zw76Tw3KBLMk4EuB9I6mMaeg5ghe25DGehnRKP2kuNr4SzGlh/Ak7ngK0BIMRAbGYX
         +KgUTLW5ez4XlTINNwATki4I/xXFB+IHnQT9kv3DO0fn23P8BZA+55kAVpNnWqQ4Ep
         s60YRpUo/tj13lu4umphLQxKzS9SMqhY0eQwqFr+YopgugljMnQGHtEw+HukQClcLa
         g9PmZGcEaBLuGk6AR2lERLJaDH5XjuAze61MYCc3JVwRK19RXJ+FK6KqOjKb4aXjxH
         AiAIRQ67PDlkg==
Date:   Tue, 2 Mar 2021 10:35:22 +0000
From:   Sean Young <sean@mess.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/2] media: rc: remove zte zx ir driver
Message-ID: <20210302103522.GA6999@gofer.mess.org>
References: <20210120142542.4100741-1-arnd@kernel.org>
 <20210120142542.4100741-3-arnd@kernel.org>
 <20210301102522.GB25633@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301102522.GB25633@gofer.mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On Mon, Mar 01, 2021 at 10:25:22AM +0000, Sean Young wrote:
> On Wed, Jan 20, 2021 at 03:25:42PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The zte zx platform is getting removed, so this driver is no
> > longer needed.
> 
> I think the keymap should go too.
> 
> drivers/media/rc/keymaps/rc-zx-irdec.c
> 
> Any references to RC_MAP_ZX_IRDEC or rc-zx-irdec

Come to think of it, removing the keymap doesn't make a whole lot of sense.
There might still be users for the remote.


Sean
