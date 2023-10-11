Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65DC57C5DF9
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 22:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235036AbjJKUB7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 16:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233122AbjJKUB6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 16:01:58 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D94C4
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 13:01:56 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163d.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4S5Nvk2R7czyYT;
        Wed, 11 Oct 2023 23:01:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1697054514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ns61Yynri9mfJzKBG/vL3aqLJCvUiQ33iGPTFUfT/v0=;
        b=S9ZfFllDQO4tMNUM3CD0gRxkMDu96KjL88iwWxG260HhHf1sjKdELwI9pvj1Qh7qC7EaOo
        rKCNK5amoB6WF3v1298TKnofETJyfPecfe99XKVYlaUrnmiiATVaD0YX8ylPZvXCu5XXcm
        BmcfYkFkxJJtZFsH8Gt9IyP6J9WR7CM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1697054514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ns61Yynri9mfJzKBG/vL3aqLJCvUiQ33iGPTFUfT/v0=;
        b=Coedd8u+W2zcaFnfEGmf9CX7U98OEpBntZx2W7fezmO4u2VMAs8AaWawMateF2wMYlXeuV
        eJrBhvg5Q9J0Z36LbJxtMiwZ5NmbyCFORnkmroqe5aAn7BbLcQEG7N/6Ie2DUiKgvNBB/7
        ljiFG6aow3mxbIE09LpFKNJZrjh3Gmk=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1697054514; a=rsa-sha256; cv=none;
        b=wKe8/AfwkF88ODSheX7toq3k5NmvOmYWqHm5App8y7C/9hCH89iKi+p5Ts4TET1pxaLSRM
        2Mz4eWv+FvNGVw6sXRH7qtcG7KuX9ikClgBC63EETXZDdqBHM9HtdH9VVcMgxhtgge5Bnq
        KtWM4VAiiwVqw9XXOTWtu0QX3/CKXok=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AEE31634CA9;
        Wed, 11 Oct 2023 23:01:50 +0300 (EEST)
Date:   Wed, 11 Oct 2023 20:01:50 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Shiyan <eagle.alexander923@gmail.com>,
        linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH] media: imx: imx-mipi-csis: Fix null pointer dereference
 when link is not set
Message-ID: <ZSb/LqHwDgLRCsvF@valkosipuli.retiisi.eu>
References: <20231006074654.11468-1-eagle.alexander923@gmail.com>
 <ZSb7O+2pbIHKgroc@valkosipuli.retiisi.eu>
 <20231011194833.GC5322@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011194833.GC5322@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 11, 2023 at 10:48:33PM +0300, Laurent Pinchart wrote:
> On Wed, Oct 11, 2023 at 07:44:59PM +0000, Sakari Ailus wrote:
> > On Fri, Oct 06, 2023 at 10:46:54AM +0300, Alexander Shiyan wrote:
> > > Let's add a check for src_sd before using it.
> > > The link may not be set, in which case the call to this function will fail.
> > 
> > That would seem like an understatement.
> > 
> > Any idea when this was introduced (and which patch did), Fixes: and Cc:
> > stable should be added if this is already in a release.
> 
> It's actually an issue in the pipeline validation code in the V4L2 core.
> The link is marked as MUST_CONNECT, but that isn't handled properly :-(
> It's been on my todo list for a while but I haven't had time to get to
> it. Feel free to give it a go.

What's wrong there? It used to work at least...

-- 
Sakari Ailus
