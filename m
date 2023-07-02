Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9229744D5B
	for <lists+linux-media@lfdr.de>; Sun,  2 Jul 2023 12:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjGBKvV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jul 2023 06:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjGBKvU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jul 2023 06:51:20 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386FFE7D
        for <linux-media@vger.kernel.org>; Sun,  2 Jul 2023 03:51:15 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4Qv5Sv2R2XzySF;
        Sun,  2 Jul 2023 13:51:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1688295071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gle5XB5BKemtefp1hV/M9n/OMHT5GMyfRERxeWcRsRM=;
        b=KlIFETygxsXicGqCmoR84ZNy3Tmz+inXZXYIpzs1pWk9ixQWqVJ2YnnK6tCWXZAo29hF6M
        nUDxAK6dxlpJoHps5CC6c8pyfPxqXZRHUDRlD4BHm6qOiTnu82hC6zE6Yb4hhUjgVzpnI3
        s/F52Np2Gw4QouAjvd2dTs0Attu4lGM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1688295071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gle5XB5BKemtefp1hV/M9n/OMHT5GMyfRERxeWcRsRM=;
        b=tSEGiJQcq67fA/afTBNPaKBCK2Ouy4BuRKOK2ytbUBiPvw11Boto19tlVYmvFqx2VyEvGg
        R2Rj2vODYSpKrHP44coeb116SSe+ttmB+VM6J0kaQONPUJ/wv1KGElLjMFNYQca3b6gWOE
        pKFBkf0xP7mHfGEgvJ2VWZOlXMj289Y=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1688295071; a=rsa-sha256; cv=none;
        b=v48MJZXZUlu0bB2yiIQCu2CivZMLkmpynnfYeBuknxJ6X29afohoq6FgygJ7I1rh8j1avG
        BvI0gtOxRPlSE1BOTfyUWKux0ndVQLdmad00KSoY74MMSCsklAzZOtErI8L/seqStLn7X4
        eICC7JHW0qyGxOwQPdAVzGDJfhsaX1I=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9FCC1634C93;
        Sun,  2 Jul 2023 13:51:10 +0300 (EEST)
Date:   Sun, 2 Jul 2023 10:51:10 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZKFWnhpHSCVQDfBy@valkosipuli.retiisi.eu>
References: <20230627125109.52354-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627125109.52354-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Laurent,

On Tue, Jun 27, 2023 at 02:51:03PM +0200, Hans de Goede wrote:
> Hi Laurent, Sakari, et al.,
> 
> Here is v4 of my MIPI CCI register access helper patches.
> 
> New in the CCI register access helpers in v4:
> - Add V4L2_CCI_I2C Kconfig and wrap devm_cci_regmap_init_i2c()
>   with if IS_ENABLED(CONFIG_V4L2_CCI_I2C)

Laurent: are you fine with this version? I see you've acked all but the
first patch.

I'll pick this to my tree then.

-- 
Kind regards,

Sakari Ailus
