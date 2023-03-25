Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E764D6C90A0
	for <lists+linux-media@lfdr.de>; Sat, 25 Mar 2023 21:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbjCYUJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 16:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjCYUJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 16:09:13 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F2440EF
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 13:09:12 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4PkVXP3H7xzyRB;
        Sat, 25 Mar 2023 22:09:08 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1679774950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UxURUquIh6lnqg3cbLZWiqaPlr2CcImsKif2t0AcJg8=;
        b=pQ6xwdAUhXHC1oF1y/RDf8lTr5HIrpy9Ak73UOY0jJDY37KWngKMpbs0dnAMly2bboPNG4
        xvUGKIAedigNvzZADpO65o85GWFkcUeApJhq130whzKHhvq5K5Yu9SsuYICPTphsOSb6UD
        NFQWC5UXz8VzizqPkAiwhRNClcuOkUc=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1679774950; a=rsa-sha256; cv=none;
        b=u3qzl2emiFHwcgcHoSJ5gG65YcCirY5uKqucZDJAEaV7nwqdaHXRXtbSGJ8KaoXoMJfrU/
        SIo1KDN2XjjIQacvYzK9ShzVc2SFX3sENNW/L3a1WkcoByT6Hv0n5OgWDS4stNZ/mRlsV2
        Ay38N+9bIidw+Lb5L6sH52e8KyeY5yI=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1679774950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UxURUquIh6lnqg3cbLZWiqaPlr2CcImsKif2t0AcJg8=;
        b=hrxn99kICAP8asnGqOWwbmnnfy2DUItFbmORybKbeq1zb11uBgM8qDJQDGC+orq8WRMuOZ
        OtGQ6EWAnQNxJFctMv6lCJvd1HjaMROogC4ejrsRrP2vl3Qm5RvrXoKFxAkby/VxXTJbSE
        CJZZvT3pZc4rblHNV9VZ4zxRg7zsliY=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 147C9634C91;
        Sat, 25 Mar 2023 22:07:16 +0200 (EET)
Date:   Sat, 25 Mar 2023 22:07:16 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mirela Rabulea <mirela.rabulea@nxp.com>, linux-imx@nxp.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] media: imx-jpeg: Fix incorrect indentation
Message-ID: <ZB9UdAw+fv2cboAv@valkosipuli.retiisi.eu>
References: <20230215160800.12621-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215160800.12621-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 15, 2023 at 06:08:00PM +0200, Laurent Pinchart wrote:
> Variable initialization code in notify_src_chg() is incorrectly
> indented. Fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
