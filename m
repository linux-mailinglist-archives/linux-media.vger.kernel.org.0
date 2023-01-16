Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3BB966D0B9
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 22:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbjAPVKD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 16:10:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233847AbjAPVJ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 16:09:59 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1161CAE3
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 13:09:59 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 555CD1B0023B;
        Mon, 16 Jan 2023 23:09:56 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1673903396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dbAdlK0BxI0psHjrkM7TVjI+sE/7hkpjcx3VvL3xT0Q=;
        b=bIstBwWnhMDNZ2QCxBOEcg9qZDxMJ7lXTJBW2oKmMwxp47VhX+PGY0FHO6vRn3OJ1tf0cR
        uD8MOL1mn58isNBaG6AfX2ke6JrgI+IyW0jAchLX9lL5bw/nyciKzkrX1YUsoVAPXGt/oY
        JCgdVKBnj+WpHh5XHzuPVaa3veZqBox0GsQaUWMkOeVX6F/rkkurR6tqKo8HOrZ27iIWvj
        F8fdvukwUE5lRR14oI0GojOflqFte8R+2KKfn2c0QGBhauMkb8yB2jsEwc3my1HYwyixh7
        qEXs9OhiRIN6lhWyQcjmt4g6m/JisZVqYq8MDORbU1kjA2sy9M0MQ72HC2tQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1673903396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dbAdlK0BxI0psHjrkM7TVjI+sE/7hkpjcx3VvL3xT0Q=;
        b=g98QCzmgjDAzq5HKRGFKeXczCOyNrbndIT6rSbigDX//srAp7jAtDYu/lZF6ImdU2VW4XA
        SDnO+lsgkQBQ8HGTW2U6YAQ1n4a80ZYWGESdO5sc4b8S9bm7eVu8p+sPn+xVdg7AZDX5gG
        W4/+0D0suk43+y01FFuS711MqkNmM2ovxd4JZZ7Xme1PmT6K/0VVjh729+CY1vhbr4UE3W
        6MuWTBo5oUxiDAhIANE+HnIFr3IqjuizQcCqEQ2zrhV+QM/bElwjM7HxdYpReCIQj7aImP
        eWD1zJ7OmSkC73XM0KnKf6Y6PW3iAPA8LnFKeVlqM62n7iszMgiMQs4Ku6PjUA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1673903396; a=rsa-sha256;
        cv=none;
        b=iHvowksLtk7oQlAB9j3XPUn3aANguOE5qazWaNzJyBnO6Icd3YTie6EWqPsnDi1xu6ktk3
        mOV4K1FEiIBKtyMfzv+mCzT8B6QmSLGt1pzizH7d2BCsz5OYV8kUZ1KhzLqH4/oeolT4Yb
        AYATmo0G2Ei8IDmNC8BEUtV0A/NAt5Emm/7QRGmdE5MAVVr9y2ZUDDreAQz2kS20lrzf4R
        SA7FfrbydPpb/DXMswvrA6B/xKaa3DQYYao0uLdyXe8L2SnIIOlBjEc4N2rv4LE6FVkd1T
        Pvt/5tMveVeBAjMac2tATGustHvJ7VDzOBpXTEA10eE8KwFMCisx9qD7Z5n0NA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0A09E634C91;
        Mon, 16 Jan 2023 23:09:56 +0200 (EET)
Date:   Mon, 16 Jan 2023 23:09:55 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: imx219: Fix binning for RAW8 capture
Message-ID: <Y8W9I73w8zYdG1tp@valkosipuli.retiisi.eu>
References: <20221228111457.25516-1-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228111457.25516-1-j-luthra@ti.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jai,

On Wed, Dec 28, 2022 at 04:44:57PM +0530, Jai Luthra wrote:
> 2x2 binning works fine for RAW10 capture, but for RAW8 1232p mode it
> leads to corrupted frames [1][2].
> 
> Using the special 2x2 analog binning mode fixes the issue, but causes
> artefacts for RAW10 1232p capture. So here we choose the binning mode
> depending upon the frame format selected.
> 
> As both binning modes work fine for 480p RAW8 and RAW10 capture, it can
> share the same code path as 1232p for selecting binning mode.
> 
> [1] https://forums.raspberrypi.com/viewtopic.php?t=332103
> [2] https://github.com/raspberrypi/libcamera-apps/issues/281
> 
> Fixes: 22da1d56e982 ("media: i2c: imx219: Add support for RAW8 bit bayer format")
> Signed-off-by: Jai Luthra <j-luthra@ti.com>

I'm afraid this no longer applies after Laurent's imx290 series. Could you
rebase this on my master branch:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/>

I'm about to push patches there, should be done in a few hours' time.

-- 
Kind regards,

Sakari Ailus
