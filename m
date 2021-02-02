Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC60630CB0A
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 20:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239556AbhBBTKn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 14:10:43 -0500
Received: from meesny.iki.fi ([195.140.195.201]:52244 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239491AbhBBTIp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 14:08:45 -0500
Received: from hillosipuli.retiisi.eu (213-243-181-26.bb.dnainternet.fi [213.243.181.26])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 153C520168;
        Tue,  2 Feb 2021 21:07:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1612292878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iED9/bsv62xclPHCgDTFayfsix4RS/oy4XGwwbCpS70=;
        b=iL0uADKOLImuTf97sPdS8rAAaavCcdwB+tFn727545Uir3pJS0ktnz/4+kpQzNWvdV0IBk
        c/4aEDqLlnqY+NIDOMbGYA7bp9Vv/uIeilR7xHTbPKFIrSKZApfCRj3Mxl7f5VFGMGQwUE
        /+9sW7+aD1zmKCpEWCXuFQK5O/J3pKE=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8137C634C96;
        Tue,  2 Feb 2021 21:07:53 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.org.uk)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l711o-0000Z5-W4; Tue, 02 Feb 2021 21:07:57 +0200
Date:   Tue, 2 Feb 2021 21:07:56 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH v2 2/6] media: pxa_camera: Drop the v4l2-clk clock
 register
Message-ID: <20210202190756.GD3@valkosipuli.retiisi.org.uk>
References: <20210112194919.50176-1-ezequiel@collabora.com>
 <20210112194919.50176-3-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210112194919.50176-3-ezequiel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1612292878; a=rsa-sha256; cv=none;
        b=V+7Tvhny7wzLuCrYocZb4CbfpLmTBvccB3m8SBEc7gdliUNQbEmOfCZ1fGDwit/02nYpep
        4hR/T1np+Lh546onpW+Allh058SM2MOGW7NjrTgvJum14EMuHs5RtNpSv6UPAy4GaHskY7
        2NEVWaOe/nw/mgF+KiyivO8MZpoQpZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1612292878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iED9/bsv62xclPHCgDTFayfsix4RS/oy4XGwwbCpS70=;
        b=JgnA25G0SB/K+2rg22su9fddHW+7FR54NxRe+MGjdHtDAQCk++uiicjmH12AJPu4W9NG3e
        iLS9/6fQzzf93UgRLorfueO1D/nyIi9MJNaO02GQXvEzPxO5pgQndfR49ij5xWvvTk9UHM
        OHaGbS+7ds94LKYPeeD7OUE3I/jIv8A=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 12, 2021 at 04:49:15PM -0300, Ezequiel Garcia wrote:
> Now that mach-based PXA platforms are registering proper
> fixed-rate clocks through the CCF, the v4l2-clk clock
> is no longer required.
> 
> Drop this clock, so the driver no longer depends on the
> legacy v4l2-clk API.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

There was a minor conflict with the recently merged patches. I resolved it
(second last chunk) here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?id=2bd3c6097aaac76c0a7846456820de1ccf48194e>

-- 
Sakari Ailus
