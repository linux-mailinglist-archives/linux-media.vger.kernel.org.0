Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDE3B4B38B
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 10:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731215AbfFSIDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 04:03:52 -0400
Received: from retiisi.org.uk ([95.216.213.190]:45124 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726142AbfFSIDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 04:03:52 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 4498F634C7B;
        Wed, 19 Jun 2019 11:03:24 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hdVYy-0000zL-A5; Wed, 19 Jun 2019 11:03:24 +0300
Date:   Wed, 19 Jun 2019 11:03:24 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Eugen.Hristev@microchip.com
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atmel: atmel-isc: fix i386 build error
Message-ID: <20190619080324.nc33gtuxzwpailmy@valkosipuli.retiisi.org.uk>
References: <1560928828-31471-1-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560928828-31471-1-git-send-email-eugen.hristev@microchip.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Wed, Jun 19, 2019 at 07:24:41AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> ld: drivers/media/platform/atmel/atmel-isc-base.o:(.bss+0x0): multiple definition of `debug'; arch/x86/entry/entry_32.o:(.entry.text+0x21ac): first defined here
> 
> Changed module parameters to static.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> 
> Hello Hans,
> 
> Sorry for this, it looks like i386 has a stray weird 'debug' symbol which
> causes an error.
> I changed the module parameters of the atmel-isc to 'static' but now they
> cannot be accessed in the other module files.
> Will have to create a get function to be used in the other files if needed
> later. Any other way to make a symbol static to current module and not
> current file ? It would be useful for other config variables as well.
> I was not sure if you want to squash this over the faulty patch or add it
> as a separate patch.

Please consider using dev_dbg() instead of a driver specific parameter for
debug.

For the patch:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
