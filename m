Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09A9C7C5E36
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 22:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbjJKUTN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 16:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjJKUTN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 16:19:13 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A8990
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 13:19:11 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-11-240.cust.suomicom.net [185.9.11.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4S5PHd0NgHzyY5;
        Wed, 11 Oct 2023 23:19:04 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1697055549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vXE2wUZo97IRHdidZup8xraX9G/nju/6k51+KpqFwYA=;
        b=tRAjlCU0B08UBSO5wt1onqsfcAxRq6P4VNBvYaxRzgzOZkSuHS3NDJuD7dglmZq1U1AJyL
        jIzFtviqho+XwlRCzVM/39/tEudRfJ9iV5w3YMQto3Y0PadRtBWpQKrnkYmMdWUpvCA2wX
        xRYKlOF0eTglHJ0RzubOVsuZtMFxrRI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1697055549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vXE2wUZo97IRHdidZup8xraX9G/nju/6k51+KpqFwYA=;
        b=vi3RmDMJkgAD6YIyoOl007MiYFn0SwlpWWqREDBQkgpIpJLvkatSLlXbn6Xxbav0FgVcJP
        vGVAFSWo35+b2TQKj9HazOXurtACOrR34iWWk8zXDmroQItUK2nk/HJu72JA8nsQcDJHj6
        hqzFQwaXONtaOLXExtk3AtbAoalGpLA=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1697055549; a=rsa-sha256; cv=none;
        b=Zs6QTi/MfSAAVXYJJxT0ofCs5eGM7qiOxN2mDEYE0ilZk4NRbV3BpLMXZUEb4vYu3Pnr1p
        BTgdVkK0/aerie3iMAUlVfZsPdmcaH1F9LWATjChlzTKRYOgMF150mXhoj5Gwq5/ZZEWUy
        sijT/CdkGd3hWGzz1S9gzL709K6wqP8=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EE9A3634CA9;
        Wed, 11 Oct 2023 23:19:03 +0300 (EEST)
Date:   Wed, 11 Oct 2023 20:19:03 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Shiyan <eagle.alexander923@gmail.com>,
        linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH] media: imx: imx-mipi-csis: Fix null pointer dereference
 when link is not set
Message-ID: <ZScDN0mg08Mq6K/F@valkosipuli.retiisi.eu>
References: <20231006074654.11468-1-eagle.alexander923@gmail.com>
 <ZSb7O+2pbIHKgroc@valkosipuli.retiisi.eu>
 <20231011194833.GC5322@pendragon.ideasonboard.com>
 <ZSb/LqHwDgLRCsvF@valkosipuli.retiisi.eu>
 <20231011200615.GC5306@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011200615.GC5306@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 11, 2023 at 11:06:15PM +0300, Laurent Pinchart wrote:
> On Wed, Oct 11, 2023 at 08:01:50PM +0000, Sakari Ailus wrote:
> > On Wed, Oct 11, 2023 at 10:48:33PM +0300, Laurent Pinchart wrote:
> > > On Wed, Oct 11, 2023 at 07:44:59PM +0000, Sakari Ailus wrote:
> > > > On Fri, Oct 06, 2023 at 10:46:54AM +0300, Alexander Shiyan wrote:
> > > > > Let's add a check for src_sd before using it.
> > > > > The link may not be set, in which case the call to this function will fail.
> > > > 
> > > > That would seem like an understatement.
> > > > 
> > > > Any idea when this was introduced (and which patch did), Fixes: and Cc:
> > > > stable should be added if this is already in a release.
> > > 
> > > It's actually an issue in the pipeline validation code in the V4L2 core.
> > > The link is marked as MUST_CONNECT, but that isn't handled properly :-(
> > > It's been on my todo list for a while but I haven't had time to get to
> > > it. Feel free to give it a go.
> > 
> > What's wrong there? It used to work at least...
> 
> It's called a regression :-) If I recall correctly, if the pad is not
> connected, it's not added to the list of pads to check, and the
> MUST_CONNECT flag is not checked.

This has potential for other similar issues in a number of drivers. I
suppose this broke with the graph traversal changes ~ a year ago?

-- 
Sakari Ailus
