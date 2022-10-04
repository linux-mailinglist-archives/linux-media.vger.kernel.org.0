Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3885F4956
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 20:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiJDShF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 14:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiJDShC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 14:37:02 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1320252B7
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 11:37:01 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 3D06220167;
        Tue,  4 Oct 2022 21:36:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1664908617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FsfSKPxIWZNDJEmwXsx4i4Cw9r0yS7zaopmoSqFg6FY=;
        b=U6+DzGVMW9mGQJ7bFfG46oeKrQwXdb5l08T05hONUdDIS3vbxnD1JqibYva6TU4k0reVGj
        aY0FM1COBCOHB1HxWT2ToNVT8PR0Khzb356q86BLMZSZfmHf3Cctyro1LbzNgKj0SLyict
        tOE9vC9hpbGtsfx6rK//PfQ8o7hMIg0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C33CB634CBE;
        Tue,  4 Oct 2022 21:36:56 +0300 (EEST)
Date:   Tue, 4 Oct 2022 21:36:56 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        m.szyprowski@samsung.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v6 2/4] vb2: add allow_zero_bytesused flag to the
 vb2_queue struct
Message-ID: <Yzx9SISk3KqFFY1i@valkosipuli.retiisi.eu>
References: <1424694379-11115-1-git-send-email-k.debski@samsung.com>
 <1424694379-11115-2-git-send-email-k.debski@samsung.com>
 <YzjR5ajfLfMXvC4D@pendragon.ideasonboard.com>
 <9b2c0c99-9f14-7bb8-415b-8c399569aabd@xs4all.nl>
 <Yzv7jBKeYPZ0BPS+@valkosipuli.retiisi.eu>
 <YzxDWhT0fsmupwGZ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzxDWhT0fsmupwGZ@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1664908617; a=rsa-sha256; cv=none;
        b=RIXoRMCvuj8gUr4KQxqwYqUMfVZM9l6ey8Rh/KbS9J+MfI+y81HIVGMq8GJiytCnb5rBLL
        YSG0XBP+2khz8sbSfvzqfFvcFOAw7XZ9+pvmTxItqopLXfG/JvoJPRae+ssIXFGH3bGpdL
        uUNmRxmbsF1scZdYeIM5lLRvDP08pH0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1664908617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FsfSKPxIWZNDJEmwXsx4i4Cw9r0yS7zaopmoSqFg6FY=;
        b=DnmOUTowz1q65qz4tWRdEzy2yWn76sGfwnggINTNNrNS3Fl+TmBILJg/g8yKkJoQKb4nI2
        VhuLh7WbjgglcabYbEWBWgapz+SLJRUW4hxI2B3GTYEWHgCNiEN+xdDbk11kHpJWSoJZab
        0og3v9mV1ogEfbpKCxe59N/unUC43Rk=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Oct 04, 2022 at 05:29:46PM +0300, Laurent Pinchart wrote:
> > If we ever intend to drop this support, we should warn we're going to do
> > so. Otherwise there's little point in recommending against using it.
> 
> I agree. Just saying it's not recommended is pointless. Either we want
> to deprecate this behaviour, which means that it may get removed in the
> future (one option could be to WARN_ONCE() for a few years, although
> even that may not be enough), or we conclude that removing it will never
> be possible, in which case I'd drop the message.

I think displaying a warning for a few seconds would do it. ;-) ;-)

> 
> > The
> > spec should document it as deprecated and to be removed in the future as
> > well. (Or alternatively, the warning should be removed altogether.)
> 
> I wouldn't document it at all, if it's deprecated it doesn't deserve a
> mention in the spec. It's hard enough for people to understand how to do
> the right thing when reading documentation without being told about the
> things that work but shouldn't be done :-)

I would document it as deprecated so that application developers reading it
could get the hint. Otherwise they won't (unless they look at the kernel
logs of course). Up to you, I don't have a strong opinion on this.

-- 
Kind regards,

Sakari Ailus
