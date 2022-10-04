Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4118E5F4B17
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 23:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbiJDVqN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 17:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiJDVpn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 17:45:43 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F136DF80
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 14:43:12 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 637141B001B0;
        Wed,  5 Oct 2022 00:43:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1664919790;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BtCanuirEFNxJUYhSFkYqhtMTx2sKEBkpPIMaooCjBk=;
        b=aDkTI+b7SPA0AwrCMjBGeOWjAzE0r+yiZC2jF+bNoXal7+D9/6vyDgCTGwgVrF7aRrTgTU
        PPNZDc0DNG9/NaUPqE+ydn5Llq2ChzPvzBnmJ+/Ran3nFRW9eVNFy+rTPWI21WbfNzOjjr
        BaLwXjBf/1TUz881xZ72yOYCaBuk4YuG9fLASOzTIrrGIS/SHy2tkUpvrGUXhbGJms0tUR
        wPlD5qd5olMhsrPUj319REjl2r38vbb6SHSs7gRdoLVGLHYiTLTS+lTLyMffZ6xPDjiXY4
        t35rftpjjJHK1ophm+Dbed/6Y+uGlcnUyM3wU+d7DvjyUKLGaeJSx9RRo1Zr6A==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E6544634CBE;
        Wed,  5 Oct 2022 00:43:09 +0300 (EEST)
Date:   Wed, 5 Oct 2022 00:43:09 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        m.szyprowski@samsung.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v6 2/4] vb2: add allow_zero_bytesused flag to the
 vb2_queue struct
Message-ID: <Yzyo7cCT/7ceiSFu@valkosipuli.retiisi.eu>
References: <1424694379-11115-1-git-send-email-k.debski@samsung.com>
 <1424694379-11115-2-git-send-email-k.debski@samsung.com>
 <YzjR5ajfLfMXvC4D@pendragon.ideasonboard.com>
 <9b2c0c99-9f14-7bb8-415b-8c399569aabd@xs4all.nl>
 <Yzv7jBKeYPZ0BPS+@valkosipuli.retiisi.eu>
 <YzxDWhT0fsmupwGZ@pendragon.ideasonboard.com>
 <Yzx9SISk3KqFFY1i@valkosipuli.retiisi.eu>
 <YzyN5U+HPB5l0Jv9@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzyN5U+HPB5l0Jv9@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1664919790;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BtCanuirEFNxJUYhSFkYqhtMTx2sKEBkpPIMaooCjBk=;
        b=jlLBoo92P0dpHLemdcK6ibVf0iZEsQoC/BDRHrCEHZbMiCih7byLukHmet+UBhvw2SBpBv
        A6iRelWORmVggWN5YiobVy81rhY9yoYll7lJDCHtEOgv9JFNRWaG1p/GXSbCBagujJ5EGQ
        IcyqJANmkDe5i3t8w3grD50i3wDTrPxdBAopUp1TD51mu69Y5h2J0J5mcM49ZI+R0To7Qe
        q1aE27FP3OFVJgdcGOdhhoV+chHJ/sCUMETxZsQ53fIELfD+zVmNQq1sn0LGzQHhgAaiQN
        hk6ds7XUUfnmG0zFdlWlxsNaPlFLXwOGeW/X7gBRTY7fOi4L3167+0c8PkCknA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1664919790; a=rsa-sha256;
        cv=none;
        b=WZUOsS+5REiaOkL8kJKfoLVDvFt/rxB1/VoBmL/KQi8OOQRgYCNi51OH0vn3rDtHfm+ghC
        +jsGhCvHXyvOcj9ovxI9737GDiOQZ3hTv/+i/vRLlSHpbDgqDoDuWtVnCvklC0/83g3u9u
        Q4bxjSg8ibM252ZTONCtYZw/I24nmzna3rOnTHE6c58Ous4CrBpfS2/fjZ7DqT0x3NQadW
        XUJ063Fu9YscT8US12gtz2Y+0bzooiuycAq+wk1TExPJMV78JmKKanNSFKiY/an15wnAuM
        q1f8g6UljJdhxJywZ7y6Akpx/UJNObNpMXfscno+TYpnQNFN5cav31VJVQvKSw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Oct 04, 2022 at 10:47:49PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Tue, Oct 04, 2022 at 09:36:56PM +0300, Sakari Ailus wrote:
> > On Tue, Oct 04, 2022 at 05:29:46PM +0300, Laurent Pinchart wrote:
> > > > If we ever intend to drop this support, we should warn we're going to do
> > > > so. Otherwise there's little point in recommending against using it.
> > > 
> > > I agree. Just saying it's not recommended is pointless. Either we want
> > > to deprecate this behaviour, which means that it may get removed in the
> > > future (one option could be to WARN_ONCE() for a few years, although
> > > even that may not be enough), or we conclude that removing it will never
> > > be possible, in which case I'd drop the message.
> > 
> > I think displaying a warning for a few seconds would do it. ;-) ;-)
> > 
> > > > The
> > > > spec should document it as deprecated and to be removed in the future as
> > > > well. (Or alternatively, the warning should be removed altogether.)
> > > 
> > > I wouldn't document it at all, if it's deprecated it doesn't deserve a
> > > mention in the spec. It's hard enough for people to understand how to do
> > > the right thing when reading documentation without being told about the
> > > things that work but shouldn't be done :-)
> > 
> > I would document it as deprecated so that application developers reading it
> > could get the hint. Otherwise they won't (unless they look at the kernel
> > logs of course). Up to you, I don't have a strong opinion on this.
> 
> Why do you think that would be better than documenting the
> non-deprecated behaviour only ? I doubt anyone would read the
> documentation, realize that the feature is deprecated, and then go fix
> an application. I may be wrong though, is that why you would like to see
> a mention of the deprecated feature in the documentation ?

Yes. I agree the likelihood of that happening is not very big presumably.
As noted, I don't have a strong opimion on this.

On the other hand, I'm certain the other option I proposed above would be
far more efficient in having applications fixed.

-- 
Regards,

Sakari Ailus
