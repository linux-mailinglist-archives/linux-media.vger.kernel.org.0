Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971B135DC6F
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 12:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241408AbhDMKXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 06:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbhDMKXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 06:23:51 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D075BC061574;
        Tue, 13 Apr 2021 03:23:29 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f444:fb00:f814:8791:6dad:f550])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 1FAA61B00348;
        Tue, 13 Apr 2021 13:23:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1618309404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z7kx6it9HR4h3rh5xEqXP9YVys6uySu3VVFrBBK0aRs=;
        b=NzsrtbLG+ZRJL60z3ZIOGs0zIYNNBz3LOHkw6WlhnL9cE9rjGcPFg3OPUlkD+WnvHrf7Rn
        Tkca+1R/yvdiVi/im+nyN4Q5tIYIsmQfGSfuLp8HpMiIvn0u3+c6F2l4YS82J8LpafB9S1
        i05K/OENyEBoMyQPgMekaVlpZw9kg6ZC2K5y2ZGgD8aSdnRz0blxVFwphilMA4DUtVDD12
        5vNp7Eu9bSR5CpzZ74f3fRUUJY9h1Wzz+xrIcbA/7xVyVjIZZqm/1DMocwbG8FrRE8aJyS
        o5wd6IPvcUlbQdwxaS83YvH+4c8Vrcf3UOTI9wwbNbihSEKMsKYoEYeTVrVjGw==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 39EF4634C87;
        Tue, 13 Apr 2021 13:22:31 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lWGCY-0002B3-AB; Tue, 13 Apr 2021 13:23:22 +0300
Date:   Tue, 13 Apr 2021 13:23:22 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     dev.dragon@bk.ru
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: media: atomisp: pci: fixed a curly bracket
 coding style issue.
Message-ID: <20210413102322.GL3@valkosipuli.retiisi.eu>
References: <20210411134840.7184-1-dev.dragon@bk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210411134840.7184-1-dev.dragon@bk.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1618309404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z7kx6it9HR4h3rh5xEqXP9YVys6uySu3VVFrBBK0aRs=;
        b=XKZMCZ9xRc5fvWswBb44cLhE/86zKwVqHWCp+50R8mNHIbv5eeOvBu/bzOn/Sqy8wXJeET
        oD3RyVbnsshohNkp+H41vnvqtocqXFArQMwrWZPy7lrDyJ72smgFe20RROF61X1MRi8k0E
        xj8+Rjt7HyCVIn58IVngnMgBrSZUnJAM5wmqNBnzwVTYk3dgHu4EbDhlOgvKnurzKdWhH9
        o3jjlsEbuGCMY2i3GLF+kI27dYDzv6jJC1rlf9eMU+aws9X19IVvGPLHt+WfdtrMqGStpF
        sAqo2u/ptsYcX4U0wEweWsev1Glcfd5CYsQeCM5hmHkoxyh2EweESYopnC50nA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1618309404; a=rsa-sha256;
        cv=none;
        b=Hz72SJ0klz0GEAIgrg5jEXvZOGRLc1HhIwRWtnVO0gHu01Q14AotnxCV+YzxpGA+E+Fo3b
        sBaKy4qDln5IKvKq0au9XqQrCKXR6H8YONBlzWSUFS4p/C5LIgWcj1NLJ101jkNFabagnx
        CGjkUWZ8jrhct+6NirBOuTMRCCn4EpjNb5rMhThEk3pGmatNDvz6DNE11S3tsnqdXY/8h0
        XudPvFfZe7d1eg1EA7NCApqHOF6QDKNjrV2je98Bj8qW6at9XnkDhnUe0JEL1uVB5nx2wo
        BIftP/QJ7+x7RRB78caOPa3KIlgIktVzzJI9jrbotx2rhvXVoYCe9troNLnljw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 11, 2021 at 04:48:41PM +0300, dev.dragon@bk.ru wrote:
> From: Dmitrii Wolf <dev.dragon@bk.ru>
> 
> Fixed a coding style issue.
> 
> Signed-off-by: Dmitrii Wolf <dev.dragon@bk.ru>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
