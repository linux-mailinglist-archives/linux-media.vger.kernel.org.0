Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E7F3B2026
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 20:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFWSVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 14:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWSVQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 14:21:16 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1D5C061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 11:18:58 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f75d:b010::e64])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 252291B001A5;
        Wed, 23 Jun 2021 21:18:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1624472335;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pX3gPGJ41LBD4DqVKhb5Z3JyywBpBSTWq1JhFmRVHE8=;
        b=IGUoPRmCVbaITM+7fTgi3iEB/6vtEQd39SR7qxfT4hughD7SdHpSnj6rRwQKhxZE/R5osN
        fyc3f6quJPxIA0CkHg2TIcGpZUPOqGh3YwOdqOew1imvDTaNEcxxqf9815c4o2P5YCDipV
        pPJykFew2dsnpNZVkoXkPxKvDUVSgqt4dv4T74CneTW2O5uHhCG/fvye51BqgIuqc2VH3C
        abvK7KqFjI51nWG3rztxbNDbtrwqlrRJaY1hYdH/SEV5VdkpzNov6CoS59NjKlBuO7Vm3/
        FKoTKRa/UZ4S59ykL2PpnV4bfuslKluxn7XSqSaqRNH9eU+2G3NSEgMfuikmTA==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 41A70634C87;
        Wed, 23 Jun 2021 21:18:41 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lw7Sf-0000vZ-So; Wed, 23 Jun 2021 21:18:53 +0300
Date:   Wed, 23 Jun 2021 21:18:53 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Michael Tretter <m.tretter@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 0/3] Explicit CSI-2 LP-11 / LP-111 support
Message-ID: <20210623181853.GD3@valkosipuli.retiisi.eu>
References: <20210623181302.14660-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623181302.14660-1-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1624472335;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pX3gPGJ41LBD4DqVKhb5Z3JyywBpBSTWq1JhFmRVHE8=;
        b=FSKOKfOW52lD1CqlKtzcsgx2K4RAeDtVfKnXmq+x2kPldXgFziE8esEwugNYsbxipKgHFs
        EQsfjMhkwfm535d6FSI6jxxYbRX9Ylud45l/YQXdQk8SUBQuu/fsIKiyMh6QGahdh/yWEl
        6ayVoxZrZhtGT+dkeugxy1AtABFhs2pILbEcexwe8tzv4ABe6YaizihZAe9Z+D35qQhOxi
        z8ZFsY4krlZQYln/tlp4zlcDg2/A7B7zBWc/1J/vHu76JVzgzHmBjrqVImejJsgqC+9h5r
        F33X7A+eIdm/t6O3mi9m9w6Fiq+owNQ16aqPu2G7ikBRXliBHs/rwnDYJ1Ky/w==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1624472335; a=rsa-sha256;
        cv=none;
        b=rWZ9I9hu2TlwFDOXSlOT8zKQdziri65IBLCkhDI0viQRpVy+VOpsFlWblTVrrZg2V9NB8H
        U79VKBYPH2QQQTPnWhXxsMwa/3gLcqQ4Eh9hqQerg/OiUW6OrdMWGopCpmLWy212NzV9WM
        JRmbb5HIg8WI4fKpl9tffeaqJRZxWWeSKEaNDf0IWRyCtdYJ6rA0mH4PEFkTVl/gIRI/9d
        odwP2RIu8gWX4mi9P+ppCknkzDmOv4EN3771O9pLgGyFsCuJz0PY2LMsFGl5iAEZion4LU
        bp6GU55cKwZVhlfEIJUq1kjXNNI3DAI+GMTVrsCuyRVUp/eqxPoy13uTRhCbAg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 23, 2021 at 09:12:59PM +0300, Sakari Ailus wrote:
> Hi all,
> 
> Some receiver devices requires explicit support for transitioning
> transmitters to LP-11 or LP-111 state before starting streaming. As
> there's currently a single operation (s_stream()) callback to do that,
> there's no way for the receiver driver to differentiate between the two
> things.
> 
> This set adds two more callbacks, pre_streamon and post_streamon, to do
> exactly that. The usage on CSI-2 is to set the transmitter state to LP-11
> or LP-111 (depending on the PHY) and thus allow reliable receiver
> initialisation.
> 
> The set also adds support for this in the CCS driver.

I forgot to mention the set goes on top of my earlier patches I sent
recently. This is all here:

	https://git.linuxtv.org/sailus/media_tree.git/	camera-stuff

-- 
Sakari Ailus
