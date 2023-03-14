Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5BEB6B93E6
	for <lists+linux-media@lfdr.de>; Tue, 14 Mar 2023 13:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjCNMfK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Mar 2023 08:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbjCNMer (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Mar 2023 08:34:47 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC78F10A82
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 05:34:12 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzbhx1tyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4502:69d6::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4PbXbN63Jrz4BKJt;
        Tue, 14 Mar 2023 14:17:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1678796257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9fciu7HlD9iZRScroZpLa07fSktz0AB/g5mN+Hwg1fE=;
        b=Oh8JaOfEE2zxv7XrWE/wCj69c2d12cQV24aO/AcdI1+C3+t41eCLJwCSe4STisiWhoVBkb
        6tcxr2Bh4Dlv2k86dBCeI3lLZ+7GV8X4ziXHvJeHsQxOr3TfBgovfd/Eh/6G1t7y7CX9wh
        OTRa5kPHw+r6gTilRHqi1ZceUazIS7V1RH5n0QYPtmwLmh+/fNkUsc335Ij1t8PhBEv1Hk
        zQ+alBOuIcSEyVrVkKeqLoVfYkmNG4cF8Ot+a8sy5xAEMc++vrFfL1b3tZX4VpnX3IUQhe
        T3l1F/xBNFrOfiXkSHAfJbJMeOvTzuKgGa+NruNKynXAYoLI973fRjM7bnguTg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1678796257; a=rsa-sha256;
        cv=none;
        b=vyTWkIXDGDfrv6OWq4Xcelpkso2DPskqNjFK5SITlrWj5LrZjmgm0+zTBrocUBw5KDIg54
        Rko8IFknlJ1bwrfgC5tKuAVB29ND6wrFKhdBudG/9Xu0XwKMmptNGCdcbeMRGQlyJgZFZQ
        mKQjFmtIfaIfHmQOBMQTjBQMsYy3PWJ9Qr1Ga9HAszBcq/C6S+AKiLXPW3r2by5Up+7sz6
        yapSHlQh6V2RMnGxZ32vl8xk4z3Wvmk0bnzX85ECLe45Sy+KCCK9McHm0yl7k+Ug3eDNvu
        u0NEy21Y88lIVhqRle+LPS4dMdPfJccQvYpKA9OheOBBJG6ggDBUoqeSu/rIeA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1678796257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9fciu7HlD9iZRScroZpLa07fSktz0AB/g5mN+Hwg1fE=;
        b=vCONT6rqsoHyNTBh+4Bk3cEJNxv/IFmXExv45tS1EMPTXyLgBLOZ2bUe95WtuRYEwYYxd6
        nfvOq8UQOyWIkuX3cAK8V9rQSStccLPaj/Agtr9NJOGKDVJz+ecHYhBJhaheiv6HEVCN1T
        +hI5FxFI9Eb3NF5G4dNpkOct5J+HrYI4PC3DPA+SAfu+cvEMTdDqJPN010lcKKcJZ+bsIM
        26vIuJELiwnNy13D/7aeY8rG0Do9oBz8uUWWXoXS4OqjfP9tha/bXONAhujWwIDeuqc8T/
        RSwiMzXrsDEF8xrTucLWxFLzkRF/b0b5Ayb93sEwXKKoFSJ1Gi+0ujb/WsDVVQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 31C67634C91;
        Tue, 14 Mar 2023 14:16:35 +0200 (EET)
Date:   Tue, 14 Mar 2023 14:16:34 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Dongsoo Nathaniel Kim <dongsoo45.kim@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heungjun Kim <riverful.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Scott Jiang <scott.jiang.linux@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [RFC PATCH 0/8] media: i2c: Drop unused drivers
Message-ID: <ZBBlooCwl+Nh64Uc@valkosipuli.retiisi.eu>
References: <20230125224856.22266-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125224856.22266-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi folks,

On Thu, Jan 26, 2023 at 12:48:48AM +0200, Laurent Pinchart wrote:
> Laurent Pinchart (8):
>   media: i2c: Drop unused ad9389b video encoder driver
>   media: i2c: Drop unused m5mols camera sensor driver
>   media: i2c: Drop unused mt9m032 camera sensor driver
>   media: i2c: Drop unused mt9t001 camera sensor driver
>   media: i2c: Drop unused noon010pc30 camera sensor driver
>   media: i2c: Drop unused s5k6aa camera sensor driver
>   media: i2c: Drop unused sr030pc30 camera sensor driver
>   media: i2c: Drop unused vs6624 camera sensor driver

I'd like to merge this soon, please let us know ASAP if you intend to fix
one or more of these drivers. It is of course always possible to bring them
back if DT / ACPI support is added.

-- 
Kind regards,

Sakari Ailus
