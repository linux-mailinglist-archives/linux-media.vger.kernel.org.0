Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB326815C1
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 16:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237555AbjA3P7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 10:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237769AbjA3P7I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 10:59:08 -0500
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D153F286;
        Mon, 30 Jan 2023 07:58:42 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1631b928691so15508195fac.11;
        Mon, 30 Jan 2023 07:58:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92ylG2q5d+cXOP0ReRMncsJUB/Zg6KaFUynLvEqS9XA=;
        b=GxqCXAFdNRUNfkOQ6x2LF0tuNWhroSu/zjFqsNQjWTfB7uoICx1Huxu2kyHFVGCzfD
         Vgjpp9k42+7TYt3ObUd4D5Eh1s9dYFSu7ZhImvmRRulVUMPyt9IbnYXP1taHn5boku6V
         65YzkgWshH6c/JmumSj5dG8Gd3KiKJvFOoUvbOUGFYElEq/fjsasDIb/Y/q3YPGIvYvd
         mqnQE+L7752S19qSbbAQk16sBwA1lx2nQIkTuw2fiakOKnXL/zm/nGb2Oo4UNcEfX9Tv
         In28WgzpGC0D8YQjolmPiK5coLurlEeUuhS+t2/lxCFg7v043iW/flXdtMPfvAqt/Mpj
         Fnmw==
X-Gm-Message-State: AFqh2koGI7zxAaoy6+d8wTvKkhqmoQ/vU/rStQ+osiC92jRW2alYb0dp
        zzjUghaYyo1YeNBqUq36Ug==
X-Google-Smtp-Source: AMrXdXt0IHRcFx9GapnPz7re2QJTCPhvFjUUyqmVAx1CEICu0Q4iLGY8886mGxNbCmnlazAHZIoeJw==
X-Received: by 2002:a05:687c:209:b0:15f:2e5:96ae with SMTP id ax9-20020a05687c020900b0015f02e596aemr19945434oac.27.1675094321901;
        Mon, 30 Jan 2023 07:58:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e8-20020a9d5608000000b0066b9a6bf3bcsm5526341oti.12.2023.01.30.07.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:58:41 -0800 (PST)
Received: (nullmailer pid 2722384 invoked by uid 1000);
        Mon, 30 Jan 2023 15:58:40 -0000
Date:   Mon, 30 Jan 2023 09:58:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        chiranjeevi.rapolu@intel.com, luca@z3ntu.xyz,
        krzysztof.kozlowski+dt@linaro.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6.1] media: dt-bindings: Add OV5670
Message-ID: <20230130155840.GA2706990-robh@kernel.org>
References: <20230126165909.121302-2-jacopo.mondi@ideasonboard.com>
 <20230128112736.8000-1-jacopo.mondi@ideasonboard.com>
 <b4794490-b059-373a-dec0-58fcd2344f6f@linaro.org>
 <20230129121132.uamuvywdsuah5ivn@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230129121132.uamuvywdsuah5ivn@uno.localdomain>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jan 29, 2023 at 01:11:32PM +0100, Jacopo Mondi wrote:
> On Sun, Jan 29, 2023 at 12:40:03PM +0100, Krzysztof Kozlowski wrote:
> > On 28/01/2023 12:27, Jacopo Mondi wrote:
> > > Add the bindings documentation for Omnivision OV5670 image sensor.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > > v6->6.1
> > > - Use additionalProperties: false for endpoint properties from
> > >   video-interfaces.yaml
> > > - List 'remote-endpoint' among the accepted endpoint properties
> > >   now that we use additionalProperties: false
> >
> > b4 diff '20230128112736.8000-1-jacopo.mondi@ideasonboard.com'
> > Could not create fake-am range for lower series v1
> >
> > Can you send patches in a way it does not break out workflows? Why
> > making our review process more difficult?
> 
> Because it's a nit on a 10 patches series with no other changes
> requested ?

So? Think of patch series as an 'email transport' for your git branches. 
If you rebase your branch, that's a whole new branch to send.

> What is difficult exactly ?

In addition to 'b4 diff', if a maintainer is applying this series, for a 
v7 they just do:

b4 shazam msgid-of-v7

For v6.1, they do:

b4 shazam msgid-of-v6
git rebase -i ...
<stop on patch 1>
git reset --hard HEAD^
b4 shazam msgid-of-v6.1
git rebase --continue

Which one makes the maintainer's life easier?

If it's a CI job trying to apply and test this, there's no way it's 
going to do the second case.

Rob
