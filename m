Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2EF154CD9
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 12:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729850AbfFYK4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 06:56:53 -0400
Received: from gofer.mess.org ([88.97.38.141]:35075 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727217AbfFYK4w (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 06:56:52 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2E5D260E3B; Tue, 25 Jun 2019 11:56:51 +0100 (BST)
Date:   Tue, 25 Jun 2019 11:56:50 +0100
From:   Sean Young <sean@mess.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: ttpci: add RC_CORE dependency
Message-ID: <20190625105650.scnahq2e5xgdnt2c@gofer.mess.org>
References: <20190617111718.2277220-1-arnd@arndb.de>
 <20190617111718.2277220-3-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617111718.2277220-3-arnd@arndb.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 17, 2019 at 01:16:53PM +0200, Arnd Bergmann wrote:
> The ttpci driver now uses the rc-core, so we need to ensure it
> is enabled:
> 
> ERROR: "rc_unregister_device" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> ERROR: "rc_allocate_device" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> ERROR: "rc_free_device" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> ERROR: "rc_keydown" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> ERROR: "rc_register_device" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> 
> Fixes: 71f49a8bf5c5 ("media: ttpci: use rc-core for the IR receiver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thank you for the patch, unfortunately this was already fixed in
commit 12e23ebb396e6ffea88b8c5e483059a297326afb (which was accepted
after you sent your patch).

Thanks
Sean
