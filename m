Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2FF3D73E2
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 12:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236318AbhG0K7T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 06:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236169AbhG0K7S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 06:59:18 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7734CC061757;
        Tue, 27 Jul 2021 03:59:17 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-100-251.bb.dnainternet.fi [89.27.100.251])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id C00531B00238;
        Tue, 27 Jul 2021 13:59:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1627383553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FnxEodskcXSYQ/A+/Q1PIrn4pOXRcxd+x5S5f3m29O0=;
        b=dlvdvfyM5HBf224ix/CqeA2GGbTkZzdYYMto0uK8tS1r6F33cZHs9bC9PH15tfvSM3nHqw
        IMPfDnUxSI+aJJUB14G/2BTtz6YmDuJJNtV6deJXB/EZ9oBQe/sqpiy9yrcSOpPCtCcrgg
        FA6cp/q2onlExWlMwL9EBSIXidcV+Scp5iRTflbmJrm91itr1NV2B3k5//giZZdPs3SJv4
        j/0RWWAJKDoF2LFTpVElQ00N5KjUXZOwxxLQgmdj9qcRQtNwHvIKc7gZn419tKepyhwbsQ
        notvNt+uwq8FC/gTK4sK5PVVAnOLnyhiJsrXLQdMk4C2ZAsIWwRpI/CmcB3M8A==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 29910634C87;
        Tue, 27 Jul 2021 13:58:04 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1m8Kn8-0001I3-Ef; Tue, 27 Jul 2021 13:58:30 +0300
Date:   Tue, 27 Jul 2021 13:58:30 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC v3] dt-binding: media: document ON Semi AR0521 sensor
 bindings
Message-ID: <20210727105830.GH3@valkosipuli.retiisi.eu>
References: <m37dhkdrat.fsf@t19.piap.pl>
 <YP9ccgd7WNpHuLgG@pendragon.ideasonboard.com>
 <m3o8aoavrv.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3o8aoavrv.fsf@t19.piap.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1627383553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FnxEodskcXSYQ/A+/Q1PIrn4pOXRcxd+x5S5f3m29O0=;
        b=u2lYg9uFnZypc/EKVxG7GzzKr3bdWW512fhapacOQRi58CRAJRb8PLKtLqyEnyh5lhULvI
        eXcaGfcQHmLCWQIJZAel+oKkYJkIU5S8ALfcX6tIC8IANZukOcZwkNcj5YvPHhCN/YzwQP
        VEAVvCdKBgxCzMVJHB9Og5feF8Dph3oUKS94N3m9hDrx45UpGt47OEeZ/S/6G2gXnq21rx
        HmbGGpbeqJZjJ5nWnOqR8n+kC32a5KPHgaWlsruWOYrQtqDG3IWCSHQhm3g32+gIOQDsSC
        aHlZ0HjO6GS5rJmpka0gQ5t+WcQHJBaaZawKolkhTCCm4I49jyQUbDRr0B6XFA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1627383553; a=rsa-sha256;
        cv=none;
        b=jaRzm/fLepTiV1ksVrLPYto69e+WIoiA7JgznMInoWBwf6QXLPSRyMRjwMke3SiSenDOMi
        0CgjuMEMQE4KfZMbdRC6+mmtSk8QriJCvOL8HSyuhi0FfGlygUoPRKL5JEyaynBG3vzqWW
        a0VgIofuELydwKQmF5ao0W+IulOUnX3SDXX1twDEIa2OALuI6kcP4/lYYu6gT+2MV01mlX
        xb1c9SUkWmzJm+ZnLd3KHNL6LmKhPB9/CVGAPVg3EinDGJMoest39ZfulaQUsrwV+Br5Mn
        rhYYCo0M/a1t9Fa1OB1fz3/OaMnmKZfXCXQKW4XGs6OQl9SZFsvBDkoRBYxYBA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Tue, Jul 27, 2021 at 12:36:20PM +0200, Krzysztof Hałasa wrote:
> Hi Laurent,
> 
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
> 
> >> +        properties:
> >> +          data-lanes:
> >> +            anyOf:
> >> +              - items:
> >> +                  - const: 1
> >> +              - items:
> >> +                  - const: 1
> >> +                  - const: 2
> >> +              - items:
> >> +                  - const: 1
> >> +                  - const: 2
> >> +                  - const: 3
> >> +                  - const: 4
> >
> > As the sensor also supports an HiSPi output, I would add the bus-type
> > property:
> >
> >           data-lanes:
> > 	    const: 4
> 
> Is there any example of this? I'm not sure how should it it look like.
> Something like the following?
> 
>         properties:
>          data-lanes:
>             anyOf:
>               - items:
>                   - const: 1
>               - items:
>                   - const: 1
>                   - const: 2
>               - items:
>                   - const: 1
>                   - const: 2
>                   - const: 3
>                   - const: 4
>           bus-type:
>             data-lanes:
>               const: 4

I think Laurent meant:

	    bus-type:
	      const: 4

This way the bindings can be later amended with HiSPi support without
relying on defaults. Albeit the other busses in practice almost never end
up being used even if supported, apart from the standard BT.601, BT.656 and
CSI-2.

Either way is fine IMO.

> 
> And... HiSPi would need additional code in the driver. And preferably
> some testing. I think I'd prefer to have DT and the driver staying in
> some sort of sync. Also, I'm uncertain about the syntax and the meaning
> of such, apparently redundant, construct. Nor about its relation to
> HiSPi. An example would be welcome.

No need to add support for the driver.

-- 
Sakari Ailus
