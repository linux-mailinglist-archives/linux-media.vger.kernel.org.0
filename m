Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 034855E5391
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 21:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiIUTHC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 15:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiIUTHB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 15:07:01 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005EB99B74
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 12:07:00 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 42D851B000EF;
        Wed, 21 Sep 2022 22:06:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1663787218;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TmcDUy9NsRP2NcA+NlFBpgyys2b/YyBAFu2MmfHqLiU=;
        b=ezgXEiZdS/VxT5wuFj9vCC0dJw0jitDUZE8RVovX2qq0FazpLxGkn+cmc8lvv/Fg5bfb7h
        1ho0XFZgIZ7etVBtUclfmsy7y9izoH/zHZ3UOZK16JAgkqx4PeqTPbawDfZzQmQvg5+p7+
        Dqb0/Ebvs8NTmEhMLJgauM4RIrEBc0dCDZ8xKyx5JoKZ4gH5Ci2UiBafsd2Xm58d6iGJAX
        ZwM4HI7ywyH9s5zdmZgKH9Dj27aZ0/ZEz+rbLrb3C5Zp80aOhoLyCCAQFxACKBFE/GpFRK
        cpoAEYG2UfciVZVWJmxdovQ1awgnxd7jblKna1MGBqsoi/zpQXmAtaK6722PNA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E7089634CA9;
        Wed, 21 Sep 2022 22:06:57 +0300 (EEST)
Date:   Wed, 21 Sep 2022 22:06:57 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     dave.stevenson@raspberrypi.com, jacopo@jmondi.org,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: imx412: Extend compatible
 strings
Message-ID: <Yytg0VB/oMrk88Cr@valkosipuli.retiisi.eu>
References: <20220916140213.1310304-1-bryan.odonoghue@linaro.org>
 <20220916140213.1310304-2-bryan.odonoghue@linaro.org>
 <YytgG+uVdk7Lzupd@valkosipuli.retiisi.eu>
 <5eb11a02-d9b4-da47-6cad-eeda9a4b10e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5eb11a02-d9b4-da47-6cad-eeda9a4b10e3@linaro.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1663787218;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TmcDUy9NsRP2NcA+NlFBpgyys2b/YyBAFu2MmfHqLiU=;
        b=Hl5710EW4ErnMcqQ6Hn1NWXlENOWHFQnGUAaZ4Bh6cSCZMUzIUKaW7U13/K049SC9dYJlw
        LYuC/iBc9PkbUVXNjUDL04K1/mB7x42Ug5JZUHJqJm0NHFc7mYTURkDCm4GMn7eS47fFh0
        boJs2A+BDPoBynueyZp8PQpmz6FLWhl1RlgoBwOKXb9cJGX3pXSnUlZPeVXc1nDrN5VFin
        hbsmSx5426WRcsY0LkfdGOm6CVsfrpkL6TtYqPHl9/OEASZSsi3AjO6Eswx2w/MpTx8zE5
        AiJlnczILxwlCYLSDACdMeNVC/Fcu1kZaSgvtAYnNoCHe7G8FrEhCw0s2fQEYw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1663787218; a=rsa-sha256;
        cv=none;
        b=GC1+5VBsdAmCiszDzL9Sezj4TWe3Sj7sMnAKyIYfirf2QqeFNG4WAu0rrajhji6qV7TBnX
        4aIdoEaOhAYZPjaHSyhL6fvQX+qTaCYPLTCvqttrGmP1+SNV3Ypp3nvPXkr4Y8fO+JKjQY
        eW0aBR49bMAVv6Hw3ChpOCDwez6glJBaDr4Vc45X3SnzUKjBEoot0DavlDJiY5I+DYLQYM
        U0Awubgy4F0VMOdGPUBmO74AnvgQImHNyVZ3hmsqZwqJm1cVcCdF9aWZ+0U8u5oxUw2FgM
        HLbgzpJCcW1GhZRz5xsQrcn8Egg/iDZ9godCnl0d+swBI8+20cPPbkXX6lKPgQ==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 21, 2022 at 08:04:42PM +0100, Bryan O'Donoghue wrote:
> On 21/09/2022 20:03, Sakari Ailus wrote:
> > Hi Brian,
> > 
> > On Fri, Sep 16, 2022 at 03:02:11PM +0100, Bryan O'Donoghue wrote:
> > > Add compatible bindings for imx477 and imx577 both of which use the
> > > same silicon enabling reference code from Sony in the available examples
> > > provided.
> > > 
> > > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > 
> > The patch looks good to me and I was waiting for an ack from the DT folks.
> > They aren't cc'd. Could you resend the patch, cc'ing the devicetree list
> > and Krzysztof Kozlowski, please?
> > 
> np

I actually think it's better to resend the entire set.

-- 
Sakari Ailus
