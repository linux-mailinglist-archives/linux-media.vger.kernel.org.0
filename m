Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E860F704A58
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 12:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbjEPKUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 06:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbjEPKUr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 06:20:47 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CE819BD
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 03:20:45 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4QLC1R4ZfNz49Q1p;
        Tue, 16 May 2023 13:20:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1684232443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Z6UXmyFqxBijHQe5F0u2dxP3v57rQKeOyJsjJDkNOHY=;
        b=SoPoOO9JFwU1hFV17t/qvbM6fdKEmuXtpERfGLpwa/svprM2Ko7HceoLR1VNT+f2PT5MRd
        eSp4/LDsb84KrRMs9Nm5gf/eA++lieWx8zNks5IU/PVjnx7+LHiOnvZ7UZgOM70d0jrxbw
        aDPXMm2WL0AuqmzWjGeSLLsvo954OCPbVgHPQcSsV6BRdZsV6LSLUkYezzox6ZnI2ZU9T1
        GWRsIr4NMlttS0DVZ0QyFgL0U0cV/tJjqvUjT9HWxUgHRUsFj/4nDxcU1SyO7i5m3FPTFM
        BnRAdiAGsaXqycpPdjmbyHpgDN2xVDRQEWhty3StglbDkmH54VOFEa0dPw/bOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1684232443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Z6UXmyFqxBijHQe5F0u2dxP3v57rQKeOyJsjJDkNOHY=;
        b=EzuZkJgnblq7J7yLdemxH6ficQ2ZUsx+ZQ9oMipPUprfq0r/H4k2eVeUZ8kJ89XHPm8r5+
        hLYnjDk/HrFVZM9VdWEkP01P9wmZtRoDfa/tyIWjdf/7ORZXLk/TlXQpVdCGHsRqdMaKXg
        A2LHcoNmG3jWJv5BK5foqx0Uk9Ac4980YjmhK/idETXkjLr8wfIerBAoNNNgw1YYvTt5We
        eRrU2mVIzznvAZDZs7lwx5aalNypFoTdwUNnsi3qu0YRzHip39Z7RMDDqTiawhClSaQiLa
        MaksozqwZmrojJUtKWTmEIZhMLPMTQNmFtYQlAx5YP/KluI4aHv+K14NxuLa4Q==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1684232443; a=rsa-sha256;
        cv=none;
        b=nCwE0MHFxZyBHEUzfh+q+nHzltPN5kYMlx3epQzkpkkEsWMBqJ4lhVsyVyq3ouKuivIr+P
        sJkmEZ+GKCbcWIRENKFplV6gV/+UgaT8EuzqOyIc4k8wyoepRGS1Z9CBN7lVMdj8s692p5
        JTn/3M46LFFZLj3/dfC8og34d/PQgsdj8XZg96gb3/DQjVBLki2U+52sGOOb/hS8v0LnHy
        BKNWWO4utR3LGJ3/kYEdAwfqSydTO/kjAxvyx1ywRbYxI3ICIBmR25L+kmiMv9iVL7nfPa
        uqgmOraA0/IryUxJTt8wWD9oI2winPWMR3K+uBe8m2GXyLoFyXg6UWNuRih4Fw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 02CE9634C94;
        Tue, 16 May 2023 13:20:42 +0300 (EEST)
Date:   Tue, 16 May 2023 13:20:42 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [ANN] Request for Topics for a Media Summit June 26th
Message-ID: <ZGNY+sNDDpLrSug2@valkosipuli.retiisi.eu>
References: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
 <ZF96/ZebSx7eaABw@valkosipuli.retiisi.eu>
 <08e68650-e388-bdd9-b0f2-2ad7e0421789@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08e68650-e388-bdd9-b0f2-2ad7e0421789@xs4all.nl>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, May 15, 2023 at 04:45:56PM +0200, Hans Verkuil wrote:
> Hi Sakari,
> 
> On 13/05/2023 13:56, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Fri, Mar 03, 2023 at 03:44:00PM +0100, Hans Verkuil wrote:
> >> So, if you have topics for the meeting, just reply!
> > 
> > Thank you for organising this.
> > 
> > I'd like to propose to discuss generic line-based metadata formats in the
> > meeting:
> > <URL:https://lore.kernel.org/linux-media/20230505215257.60704-1-sakari.ailus@linux.intel.com/T/#t>.
> > 
> 
> Do you have a guesstimate how much time this topic will take?

Good question. I'd guess 45 minutes should suffice. This is closely related
to streams and internal pads (part of the same set) so some time is needed
for introducing these.

-- 
Regards,

Sakari Ailus
