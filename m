Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15B6B7068A4
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 14:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbjEQMwD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 08:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbjEQMwC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 08:52:02 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B1430C8
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 05:52:00 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QLtKV3pdczyVk;
        Wed, 17 May 2023 15:51:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1684327918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2tO94s5LGmPIK3oWnN98CJNDhIYsE24jyG+iGeBCVCA=;
        b=H+zUJ8JfZiiZ8FFu5He3tlsOF9TF4pDoSXQ04XymQgCJ4i/oOrXf2WGmK8Q7j3KgGvQPWh
        YOWh1y7+CfWp2pXNpSD/1GbVBGbG+oNjJwQyGHPAPoCTG7FPYbSBYhdcf8X3FLuBMNo0yQ
        oSPi44JUIMiweIfusPMNJNX4aAxrotA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1684327918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2tO94s5LGmPIK3oWnN98CJNDhIYsE24jyG+iGeBCVCA=;
        b=Z9B/qoSf+9pcGth4oV+wFBvB+nOXRziy57/ukRMw8YoCiH1OKT83EVR1qTM2PaNO95pLbL
        50O9O0Aq7QVeHzDsjI9/k4DRp4SrUVrI7pZueTpW3t2qikrSLuCnoUEuv5oWAX8endn41y
        /0ANLCXBXE9x77ogbbbedMiMye1pGtw=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1684327918; a=rsa-sha256; cv=none;
        b=qQKLBTzpSrnf5fU1m7gbFcOk4TXRk7KEOLp/yLIhIS451e2jHnbOIwekT3YXWc/TBUHPjY
        szEsXWT6lu2u1F7gobM4LhtshVs1uVn9tMl0kMIGQ9nvAzntjbtSWTKHzsoUCaz8h4Auap
        aV2aCwwCEH5ix7xiSULLf7AOFIhZu/o=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EF1B9634C94;
        Wed, 17 May 2023 15:51:57 +0300 (EEST)
Date:   Wed, 17 May 2023 15:51:57 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Media Submaintainers <media-submaintainers@linuxtv.org>
Subject: Re: [media-submaintainers] [GIT FIXES FOR 6.4] V4L2 fixes for 6.4
Message-ID: <ZGTN7blhMv+1P1hu@valkosipuli.retiisi.eu>
References: <ZGTItbiccvPAbhkl@valkosipuli.retiisi.eu>
 <20230517124623.GA12992@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517124623.GA12992@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, May 17, 2023 at 03:46:23PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Wed, May 17, 2023 at 03:29:41PM +0300, Sakari Ailus wrote:
> > Hi Mauro,
> > 
> > This set includes fixes for 6.4, including compile fixes.
> > 
> > Please pull.
> > 
> > 
> > The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> > 
> >   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/sailus/media_tree.git tags/fixes-6.4-2-signed
> > 
> > for you to fetch changes up to b82b6df4937ee625ba99ee231a3ab6ba98356ca6:
> > 
> >   staging: media: imx: initialize hs_settle to avoid warning (2023-05-16 16:41:05 +0300)
> > 
> > ----------------------------------------------------------------
> > V4L2 fixees for 6.4
> > 
> > ----------------------------------------------------------------
> > Hans Verkuil (1):
> >       staging: media: imx: initialize hs_settle to avoid warning
> > 
> > Palmer Dabbelt (2):
> >       media: nxp: imx8-isi: Fix unusued function warnings
> >       media: nxp: imx8-isi: Fix undefined config warnings
> 
> Linus' master branch already contains (better) fixes for these two
> issues, see
> 
> 55e2a6e36be6 media: nxp: ignore unused suspend operations
> ba0ad6ed89fd media: nxp: imx8-isi: fix buiding on 32-bit

I would have expected those to be merged via the media tree. Oh well. I'll
send a new PR then.

-- 
Regards,

Sakari Ailus
