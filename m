Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6531D69547F
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 00:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjBMXCy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 18:02:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjBMXCx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 18:02:53 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E842735B9
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 15:02:49 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkzys35kyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4500:fbe5::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 49EB72018F;
        Tue, 14 Feb 2023 01:02:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1676329363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dFhSexet046sWLoSfoNJSgSioqU+r1n/Ayn3Qwm7B2I=;
        b=Y3tJemWJ/kJ71xr3dTpnSzrm9z5qP/jkftjWvs0DVMBQFKcgsBgu0sAQRDG/yJtF1AXHjT
        cNFXRRPaifAOx9bEPHceYRcMW4Z07ZYSA4S3NuJnKKeCRimrr5teMLiHNvcYM2RgxiSxu3
        vfNhfc2CTKeNFTt2p6iLs+AzabW+Z9Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1676329363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dFhSexet046sWLoSfoNJSgSioqU+r1n/Ayn3Qwm7B2I=;
        b=ENrFQG6xLb+MacTtFBWvjRy1fdhj7pKtXpleuLKOqleq6kWLfohOwlvqdZDrhhg4Ccerdy
        gDTo21mbchBwleAJ8/2H9MbC1FBAw4P/Y0+FRxWx8I44DVv4Xc6WQWATMPYgnGemt82Aoa
        P8e9sz1hc2b6ZVPSCuvsdKMwv2yz0hs=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1676329363; a=rsa-sha256; cv=none;
        b=HUQjbPge9EF9uN96oaWg/W36/PZNqvMnq53XxGsKId/HO2Wu3g2v+qKxR7nMhA2UK3WLDp
        nnT9Qqqw8zbVdKBHsWu3Ex0UcYUb/xj6a3DbPmAw62T2db30bxZo6cok30RCLvuRQ4dHyP
        JeEYt/QHy5ORm5qPa7j4ud1AcWIWXYE=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2889F634C91;
        Tue, 14 Feb 2023 01:01:15 +0200 (EET)
Date:   Tue, 14 Feb 2023 01:01:14 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, sylvain.petinot@foss.st.com,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 4/4] media: i2c: st-vgxy61: Use VGXY61_NB_POLARITIES
 instead of hardcoded value in tx_from_ep
Message-ID: <Y+rBOp50nK0mKLhm@valkosipuli.retiisi.eu>
References: <20230201140417.89195-1-benjamin.mugnier@foss.st.com>
 <20230201140417.89195-5-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201140417.89195-5-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Wed, Feb 01, 2023 at 03:04:17PM +0100, Benjamin Mugnier wrote:
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

I know this is a simple patch, but please add a commit message nonetheless.

Not having one produces a checkpatch.pl warning. Did you use it? :-)

-- 
Kind regards,

Sakari Ailus
