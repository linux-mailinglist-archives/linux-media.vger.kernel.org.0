Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 262587BF51D
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 09:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442694AbjJJH7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 03:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442686AbjJJH7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 03:59:32 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDCCEB8
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 00:59:30 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163d.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4S4Swc38Kdz49PxG;
        Tue, 10 Oct 2023 10:59:25 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1696924768;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oSJ/xft0gdB2qRLTi49BdrNGWX4+A0i4B4aCSB16ZrA=;
        b=bvdnGU0zfFdOCkneQ4axeob7AfG21tvWlgdmLSrQuzpDj9cVrR791NUcldtHj8t/msNuYa
        TDgi1+2V4zuLpdyibo20kOgnKY0pFaW3FDK3EbjadHysmulMhbk23vrAIAqBjD9knTtmR/
        N4JohsKToh6NTcPaHRsF7LzL6hfs2R9oyEAVnTlqKnhgXuiPhKboZnrGtF3ZJQMC3cHJmI
        cih01rChQipl3bDemyLSOwAkhgSWerVfy9dgc6EEyUptDvnPtb5+VCqdXGf9Eb89p+ijRO
        2Gg/IqF7kV8w3p9Oj0bDjksnKtsgj61XhMRRgmFYa7fptPSlZ4CxsAv3rTJuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1696924768;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oSJ/xft0gdB2qRLTi49BdrNGWX4+A0i4B4aCSB16ZrA=;
        b=Hk95au9buDM+WQLiFtpsNaOknjvKDpcKNua8F8MJcVGGoAECJ6xR5K+nbPkBLkcDl4Zs1t
        L0azhX/IznB0Qth6DswbDlFbDkIsjZhqaRVBfirGtA4CvBFNkXYsjz9jdJ8eCN59II027F
        nlqOoxYFWcDTrK7WfM91ca3ZbNYn6nZauYEx7VqLlqWaGEP9J86Bp+9RNDxvlrf0DSN4Vd
        3jHuoQ/GkyieGEI4L6uWuWsVpY5BV5wbRU4DWvAD0VHiBCrsvEFQ0roRNtI6RUdWtc189+
        EIGNbzdGHikatodU5T3CyXYJkuZX6unS5TDnLAIi1luvqw8IwTWOfT6UCPyACg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1696924768; a=rsa-sha256;
        cv=none;
        b=LUd0J2ZcwN3otQamvwJK9Hn7PHTtkR1Zo5sfF2ZYP7TFFNrxNhvapoKCoOfU+x38jSQOn0
        x9TRx2BSa1bwDYZF1Yuqh6B+f7AuVdF1pTroN81fiUBvwNJp8+WEJtqhBvF/cWFMGrgvc7
        +JZgvso5Lq8J5OQO3lS8vV6YW2J5bZ0EJSpSkRUaKwisTg7vrtVlH4nRuCKvtv2xB4qscU
        sDpxieYKb6NqCMiRyUM54rmUfJJX6oyER3W1m0s0UM9s1+zwBb2EEIXl5i0u/J1IrtbqlO
        hxbaLyBxwCmD+tGFCMcDOKgU9tSPmg5gOjupQyJvkBJRC5llUbAoLmCmDiYkYA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 55C03634CA9;
        Tue, 10 Oct 2023 10:59:24 +0300 (EEST)
Date:   Tue, 10 Oct 2023 07:59:24 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 8/9] media: i2c: mt9m114: goto proper error path
Message-ID: <ZSUEXHDmYtstvMBV@valkosipuli.retiisi.eu>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <6e2b3d5971905c1cf63184e7c3cd269c10151bb7.1696586632.git.hverkuil-cisco@xs4all.nl>
 <20231006151826.GB5121@pendragon.ideasonboard.com>
 <d625a11a-11a4-41c5-a7f7-fa651649957e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d625a11a-11a4-41c5-a7f7-fa651649957e@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Oct 10, 2023 at 09:24:10AM +0200, Hans Verkuil wrote:
> Hi Laurent,
> 
> On 06/10/2023 17:18, Laurent Pinchart wrote:
> > Hi Hans,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Oct 06, 2023 at 12:08:49PM +0200, Hans Verkuil wrote:
> >> In two places the probe function returns instead of going
> >> to the correct goto label.
> >>
> >> This fixes this smatch warning:
> >>
> >> drivers/media/i2c/mt9m114.c:2381 mt9m114_probe() warn: missing unwind goto?
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > I've already submitted
> > https://lore.kernel.org/linux-media/20231003192043.27690-1-laurent.pinchart@ideasonboard.com
> 
> Is it OK if I pick up your patch for this issue? I plan to pick up at least part
> of this series tomorrow in order to cut down on the number of reported smatch
> warnings.

I've got it in my tree and I intend to send a PR by tomorrow (there's an
issue also in the CCS driver).

-- 
Regards,

Sakari Ailus
