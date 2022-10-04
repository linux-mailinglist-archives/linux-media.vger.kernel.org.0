Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 872E35F3F7C
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 11:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiJDJ0A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 05:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiJDJZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 05:25:23 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3F256B8E
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 02:23:32 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 90C2620272;
        Tue,  4 Oct 2022 12:23:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1664875404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TbX0Wu/XVLkvr1+pwID+2yqckDL8qLVGaAd4Oim2gV4=;
        b=CY4cYKMJrEMhWr8jHhnHk7COpxrKoGQD28ND9l5SNlJgKmSwTbggaTUzfTRqVia0kA0G+u
        qNqde2tvFGERuc7S+e240gQksSt9AQp22CNz/jINvdqZ6mrkOyieetwutRkCCc9nBs0qZb
        9TTF3T88imD+i8kzEh6Rh3s+gyC31AU=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1BD31634C96;
        Tue,  4 Oct 2022 12:23:24 +0300 (EEST)
Date:   Tue, 4 Oct 2022 12:23:24 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, m.szyprowski@samsung.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v6 2/4] vb2: add allow_zero_bytesused flag to the
 vb2_queue struct
Message-ID: <Yzv7jBKeYPZ0BPS+@valkosipuli.retiisi.eu>
References: <1424694379-11115-1-git-send-email-k.debski@samsung.com>
 <1424694379-11115-2-git-send-email-k.debski@samsung.com>
 <YzjR5ajfLfMXvC4D@pendragon.ideasonboard.com>
 <9b2c0c99-9f14-7bb8-415b-8c399569aabd@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b2c0c99-9f14-7bb8-415b-8c399569aabd@xs4all.nl>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1664875404; a=rsa-sha256; cv=none;
        b=O3dhDS2q6LnlXoeGVs+DW9aEunCu5FOWoWsWgcJ6ut3OUZYTIGQKaNVgM64edwhWO+Mcne
        qTMuKsZ5OUN3U83tIy5m8YvjRRLAHmloc7fZVvsswDU1EFQXEGK8W2gC5CwEwwokVt/gM+
        OEBJWcpaqqvHgoxfoGvtkPcXBsLSNQ4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1664875404;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TbX0Wu/XVLkvr1+pwID+2yqckDL8qLVGaAd4Oim2gV4=;
        b=ljD2uJXRGj2+T15QV+iSm0iW8vUYY8tKL5Bcxe3ZW7jf3ciS9EeVzHW87MMDU6Ih7bSeWn
        W9DCmXyTeOKBfbwbRubX88uui41lqf0uK3jww9T9p0i7MnS4TKaL8PZEU3CgEQhvWU3uk8
        nIXZ944uVCHAHZFr6Q3WwvWnv3JjWac=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Laurent,

On Tue, Oct 04, 2022 at 11:12:45AM +0200, Hans Verkuil wrote:
> 
> 
> On 10/2/22 01:48, Laurent Pinchart wrote:
> > Hello,
> > 
> > While working on fixing occurrences of
> > 
> > [   54.375534] use of bytesused == 0 is deprecated and will be removed in the future,
> > [   54.388026] use the actual size instead.
> > 
> > in libcamera, I realized that the patch that initially introduced the
> > warning and deprecated setting bytesused to 0 didn't change the V4L2 API
> > specification, which still documents bytesused as
> > 
> >     [...] If the application sets this to 0 for an output stream, then
> >     bytesused will be set to the size of the buffer (see the length
> >     field of this struct) by the driver. [...]
> > 
> > for both v4l2_buffer and v4l2_plane.
> > 
> > This deprecated behaviour has been present in the kernel for 7 years and
> > a half now. I'm wondering if it's really deprecated, in which case we
> > should update the API specification, or if it should be considered
> > supported, in which case the warning should be dropped.
> 
> It's a good question.
> 
> I do believe it should be removed from the spec. It is IMHO a bad idea to
> just leave bytesused at 0 for an output buffer. Applications should be explicit.
> 
> But on the other hand, I think we need to keep the current behavior in the
> kernel of replacing bytesused == 0 with the length of the buffer. I don't
> think we can return an error in that case, it would almost certainly break
> userspace.
> 
> Regarding the warning: I think we need to keep it, to warn applications that
> what they are doing is a bad idea, but that the text should change from:
> 
> "use of bytesused == 0 is deprecated and will be removed in the future"
> 
> to:
> 
> "use of bytesused == 0 is not recommended"

If we ever intend to drop this support, we should warn we're going to do
so. Otherwise there's little point in recommending against using it. The
spec should document it as deprecated and to be removed in the future as
well. (Or alternatively, the warning should be removed altogether.)

-- 
Kind regards,

Sakari Ailus
