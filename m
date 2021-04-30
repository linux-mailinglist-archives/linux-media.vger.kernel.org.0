Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E41136F6BE
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 09:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbhD3H40 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 03:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhD3H40 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 03:56:26 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E25C06174A
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 00:55:38 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f75d:b010:afd2:773e:79db:477b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4870B20B84;
        Fri, 30 Apr 2021 10:55:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1619769336;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=At6PZRFKsbGNruG3GNKdBBrXc6Ob2m8mGDbBrb0V0Eg=;
        b=YUqsBSdhv3hkiXIa/ey5fy7GyrH7I2IRqkijej/0lpv/oFzI//aSmtxzjdEuABfj07abjL
        AGbIGbp6k9DafgibIskqftuDlxTC+pVuzeGi7Z6LGrUZpUo4S8xmzNQuKom3cQ1vrwU4kb
        3niv3N6D7rJsALxOgvMfCsd+3rlHu6g=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 450A7634C89;
        Fri, 30 Apr 2021 10:53:32 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lcNzs-0004z1-De; Fri, 30 Apr 2021 10:55:36 +0300
Date:   Fri, 30 Apr 2021 10:55:36 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     dev.dragon@bk.ru
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: media: atomisp: pci: fixed a curly bracket
 coding style issue.
Message-ID: <20210430075536.GA3@valkosipuli.retiisi.eu>
References: <20210410191655.32719-1-dev.dragon@bk.ru>
 <20210430075423.GZ3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430075423.GZ3@valkosipuli.retiisi.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1619769336; a=rsa-sha256; cv=none;
        b=rlU3Xk/unWYF1DYfyc3psg8hrK5pATUEmMYY+CCk1jduxYZzftRKT0LlYFUEbt97MadRB/
        AVQAiTQDaD+7JEz5imgcx2u5OQmu1QHLZFKkkGaBPn+5zb1vw3g7MfJFYLGzo47RCrXTon
        QTdLR4SmILsGsOBE3r9BFS9ixLlTd6Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1619769336;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=At6PZRFKsbGNruG3GNKdBBrXc6Ob2m8mGDbBrb0V0Eg=;
        b=wB/8SPRq3GKoj+AJheJvD+ia53tUVs5lhzM+8ObfqB8V4gWZTgPInrFC+7QktZ4yQkMKzf
        l/sLCf0kjFiIDGnK2LGKKBNCpxl8kRe6heqmGf77J4GICzKAahKe+remGUMD/Za6Zl0kas
        YXCbI3moEDPCoRz4rRqe/voOXb7WOac=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 30, 2021 at 10:54:23AM +0300, Sakari Ailus wrote:
> Hi Dmitrii,
> 
> On Sat, Apr 10, 2021 at 10:16:56PM +0300, dev.dragon@bk.ru wrote:
> > From: Dmitrii Wolf <dev.dragon@bk.ru>
> > 
> > Fixed a coding style issue.
> 
> You'll need a Signed-off-by: line here. Please see
> Documentation/process/submitting-patches.rst .

Oh well. Please ignore. I see this was fixed in another patch (please use
v2 on the next time for the second version).

-- 
Sakari Ailus
