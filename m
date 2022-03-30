Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9244EBA3E
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 07:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243005AbiC3Ffd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 01:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235840AbiC3Ff3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 01:35:29 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9377721D7D4
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 22:33:42 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 24C9021100;
        Wed, 30 Mar 2022 08:33:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1648618420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=J9c9ivVyjLnjqz1CA+Py6RyKFtWNoX8nbqlVD4cLkcg=;
        b=qxGL7pZW2txY636cY2J/JENLnlg1TMLJdmafzy1D2HFonl7Rk37oW7sbYLwcT68Mo252jq
        39DoFhmFaKE28iNTYByqDulBk58jSTmdvUraMprKNOGkJxt3Ct8GVXNzZbDRCECj7A7iLe
        lUHwnSE1n0ssT0PPAO/s4aURwTHWd4U=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C1A83634C90;
        Wed, 30 Mar 2022 08:33:39 +0300 (EEST)
Date:   Wed, 30 Mar 2022 08:33:39 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 7/8] media: i2c: ov5670: Implement init_cfg
Message-ID: <YkPrs/LTfDO61TTa@valkosipuli.retiisi.eu>
References: <20220329090133.338073-1-jacopo@jmondi.org>
 <20220329090133.338073-8-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329090133.338073-8-jacopo@jmondi.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1648618420; a=rsa-sha256; cv=none;
        b=NEQmTqmpaGH1ZFaHwhts6Ls7cIXu+X5SofsgzfdJ7dpxPd04NZnewS6grlvQAzlCVdCXhe
        PmWrhJ2mGL91e1+aK6BD0Xl6kuw8ObLVXBy/pe+Jf1B4Eo1zZgzk5O+IuRmgc53fSJjA4V
        K/mYLbO4PP/Rd3PfcdNQlYAEo3xUZxU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1648618420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=J9c9ivVyjLnjqz1CA+Py6RyKFtWNoX8nbqlVD4cLkcg=;
        b=qwvhZTNAeRDS1+nqcoAbPoVtTYzG3WCNcE914ZOu1ZMgtbmm8OaLex82H6Jxz3TitEqjtW
        rdICdMXYESafjhzYW7ugCvKECOu9i2gtyjhHGLJvzVW9f3r1fas5H6R/wniXkeEuEjCfgh
        9veYZ1XT617UwgTWmYd9OAWWYb2E+7E=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Mar 29, 2022 at 11:01:32AM +0200, Jacopo Mondi wrote:
> Implement the .init_cfg() pad operation and initialize the default
> format.
> 
> With .init_cfg() pad operation implemented the deprecated .open()
> internal operation can now be dropped.

Nice patch.

Could you add here the configured size was used as the try size instead
previously?

-- 
Sakari Ailus
