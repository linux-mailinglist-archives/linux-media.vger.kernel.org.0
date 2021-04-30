Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 138F836F6BC
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 09:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhD3HzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 03:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbhD3HzR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 03:55:17 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C21C06174A;
        Fri, 30 Apr 2021 00:54:27 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f75d:b010:afd2:773e:79db:477b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 7EFB41B00F45;
        Fri, 30 Apr 2021 10:54:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1619769263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3U4TwvCNSP5Ieq1hIP9Sa1BflL5QZOrUpAEsHU6H8XU=;
        b=fQCCSlco6qa44izNHBA8d6fDLU9t/oi2ULCR2mpTIUnI8WD5pF/V5vavZhfYVjC9p15sH1
        9BtgdYULvBNWGvSTuZNlbB8d0/PHOyobFxekhHhly2G26/V5QhIvV3vFy6KMa/0HdNFKCy
        4bz/EXrQiUUIqCatEJ6KFfGMb4H7xRUswi27AixmUqrORYO4pB6VEn3AL0a9G9CQET5LQK
        MBn7JEc86MMEerTgZUkqeGQ7lSi8bWKjAoeVGCnWNhBWp+YYrBaK61OxCam0rBTML2Ytcv
        ThPbxUp1z9q0e7PJoHzbViQbkBq+XcKESJ6KIQCxrzOJ29Cy27CNDuEU7TwMFg==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 63E7D634C89;
        Fri, 30 Apr 2021 10:52:19 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lcNyh-0004yu-FC; Fri, 30 Apr 2021 10:54:23 +0300
Date:   Fri, 30 Apr 2021 10:54:23 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     dev.dragon@bk.ru
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: media: atomisp: pci: fixed a curly bracket
 coding style issue.
Message-ID: <20210430075423.GZ3@valkosipuli.retiisi.eu>
References: <20210410191655.32719-1-dev.dragon@bk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410191655.32719-1-dev.dragon@bk.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1619769263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3U4TwvCNSP5Ieq1hIP9Sa1BflL5QZOrUpAEsHU6H8XU=;
        b=XOMJlrwMJpx77f+GpeWh1bZkXtNUdzBvR+QqAnadcBRqpum+y0nCjzIQwhcv4El0008hqS
        IvSkwNdhwtb6sju3F/V3ydQMVTTjqDdhe0+jAgy3KacacD40IzemGL41qJxBP+cP25/asT
        Ij0Odol5TENjs5ad3zeckhIRwsBTHu0PyWDUlxaMGYE+oInCKgL00T4Z9RtQtbue1OPk4T
        S/ryC5e8Jyg1zEMlsdVD6V02I3Rkeyxlr3eDWqCn4O7g2pxe0moCnhRraU93dAbl1Vy7y1
        +Xf1cXSD3rilbGnSWRqGVWC0xKdsKrBQfpQDbnNhtGzisNY1HZoF3V1tD+69Dg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1619769263; a=rsa-sha256;
        cv=none;
        b=BFrqSDwPkn5EbbJtfrVtJiSc1M9WAM2aBT5amM+NaiWSAy8DaZUrQV+3TmliHO9IHpSAji
        AMS9uKDNSHL/kfg8NIt0sNhUBCsH0JyV+0P15F5nfX7bqHJX+ELWcN+k7zFWJdwZB3vNIC
        2XNTtnyllzcD0WGOhxHbBUfwkzIN4inNZHTJJYmjUdrEHY/4Cb+jrU7ANjX6eoiRN9857a
        umkwwqVrwPXR2El3RD6zazX+X0cxOGt171Jr/F4WLGCg5NSZr11o5oR2UMk90+uLzZ5vSH
        MNA6V+JlUXAXg/4oZeEHCfKCxVM3ybnwr0NufdRPspVJ7MmLS4KGBMEsNrR5bg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitrii,

On Sat, Apr 10, 2021 at 10:16:56PM +0300, dev.dragon@bk.ru wrote:
> From: Dmitrii Wolf <dev.dragon@bk.ru>
> 
> Fixed a coding style issue.

You'll need a Signed-off-by: line here. Please see
Documentation/process/submitting-patches.rst .

-- 
Kind regards,

Sakari Ailus
