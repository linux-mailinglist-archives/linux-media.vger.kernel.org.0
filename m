Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A0C2935AF
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 09:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404965AbgJTHXo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 03:23:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:53574 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730739AbgJTHXn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 03:23:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1603178622;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=M4hNooVwRH4pvvVMO83tz/yia6U6s9X5qMtsKqTTIcE=;
        b=phkdfIbJ/cVcm/qeun8CAvcUwNTRS5lHBszmhl+PIETT2VN9Y5zKFE/oLbZjirXhFAo0o2
        CMd62sRinNfxcfgPdHHC68BXHO5/ZLJ7bHAa0zfsR0VtpercbA8Khh2ZQB3t246o0IUPvH
        gRZ/XIlz4Hfdxh8IKgctSuHmEnMVBso=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 592D5AAD0;
        Tue, 20 Oct 2020 07:23:42 +0000 (UTC)
Date:   Tue, 20 Oct 2020 09:23:40 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com, dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 2/9] lib/test_printf.c: Use helper function to
 unwind array of software_nodes
Message-ID: <20201020072026.GD26718@alley>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-3-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-3-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon 2020-10-19 23:58:56, Daniel Scally wrote:
> Use the new software_node_unregister_nodes_reverse() function to
> unwind this array in a cleaner way.
> 
> Suggested-by: Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

If the new API gets accepted:

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
