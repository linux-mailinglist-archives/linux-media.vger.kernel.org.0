Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB80288C44
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388914AbgJIPJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732056AbgJIPJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 11:09:20 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECC0C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 08:09:20 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C6A54634C87;
        Fri,  9 Oct 2020 18:08:27 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kQu0R-0002AG-K4; Fri, 09 Oct 2020 18:08:27 +0300
Date:   Fri, 9 Oct 2020 18:08:27 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tsuchiya Yuto <kitakar@gmail.com>,
        bingbu.cao@intel.com, Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 0/5] ipu3-cio2 format fixes
Message-ID: <20201009150827.GJ6413@valkosipuli.retiisi.org.uk>
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 09, 2020 at 06:07:51PM +0300, Sakari Ailus wrote:
> Hello all,
> 
> This set addresses most notable subdev format related issues, namely the
> sub-device sink format being unaccessible. The result of accessing it
> varied from oopses to crashes.
> 
> since v1:
> 
> - Validate try format, too
> 
> - Set field in subdev format to V4L2_FIELD_NONE
> 
> - Add a comment explaining the lock
> 
> - Make values that should be unsigned, unsigned

This is obviously v2. v1 is here:

<URL:https://lore.kernel.org/linux-media/20201008204747.26320-1-sakari.ailus@linux.intel.com/T/#t>

-- 
Sakari Ailus
