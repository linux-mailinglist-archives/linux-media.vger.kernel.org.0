Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D39AB5F77D4
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 14:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiJGMFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 08:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiJGMF1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 08:05:27 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3052048C97
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 05:05:26 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkv1q4tdsdyy1rk42mgbt-3.rev.dnainternet.fi [IPv6:2001:14ba:446a:dc40:6f18:157:2316:5143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 686561B000E5;
        Fri,  7 Oct 2022 15:05:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1665144323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LG1Y31XlV4sN+exQFNnn8juZfVMOiwdjUpxNlgyl0HU=;
        b=pewUGmkdYmlH4UQDMduxYXhcpyGVVLi6mMIZ7oEnwXpOQ3eUJI44Gcw7GRzpBAupdpbTKE
        BEvoFay2MpEPe3HsfOPArC7VYKLYdMiX/6qHK8nG8HRlXlkDv8zy82aI6k0zyCZ5IWvhhg
        8Vi6xw90w8AZeApEklUIO5ggWMH9+Y+2rGUbeJhcxN1gYdovoSX49AzWj5fDYPFIsOKdkA
        NfoAkDlqlSpoGGUyPKEog5UFjMiS28z7hC/2WzBAUoP9oNZByksW4qp1dJu6B2sGGlceXO
        XkEkLBfxhrXjoAnbQKUXRm3X/SBQDZRhiR05zqLS2YOcHk2EKa3WjUamjIiqlw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 610B2634CA5;
        Fri,  7 Oct 2022 15:05:22 +0300 (EEST)
Date:   Fri, 7 Oct 2022 15:05:22 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 01/10] media: ar0521: Implement enum_frame_sizes
Message-ID: <Y0AWAgplTjgh9p4g@valkosipuli.retiisi.eu>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-2-jacopo@jmondi.org>
 <Yz8DaZvFAOMKPlCQ@pendragon.ideasonboard.com>
 <20221007072959.n52j2bzrn6xstjnd@uno.localdomain>
 <Yz/fMH5iEWtKDWNF@pendragon.ideasonboard.com>
 <CAPY8ntDa11Psmpg8XbnZqZCWXO1c4WxEkXR5e4sAG95X-Tmvww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntDa11Psmpg8XbnZqZCWXO1c4WxEkXR5e4sAG95X-Tmvww@mail.gmail.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1665144323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LG1Y31XlV4sN+exQFNnn8juZfVMOiwdjUpxNlgyl0HU=;
        b=tiwpeIemxtkJsDamPH7Z0eE1ciMwu3XKy+icOhiq5I8G7WX+lYr/1zPNgnSk12H0OXBZQL
        ZCMG8NGmwQHCtkX3lJ391GSDM3deTA534LLKko9+w1yXP54B4q7ZZdw9gUf+HTmueRTN6f
        +3uWyS4nyyFkrVK0HuyIV4Lb/P4twpAJq5VxeYM8cUWiGVyUmWiPY2Vl9zIAOeRKGSt2K6
        z0JiwamaWfjQ6igVzI/4EPGDKNSvmTgKXRLTUfqDsjg1LJ+pA3k4EtRIsGlDEJulnMvHbK
        6eD96fA6ApKzRcmBczlLRIXXMFvaN1Wi1/GZfQj1OSqppNQlgIJiGP0H18HYsg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1665144323; a=rsa-sha256;
        cv=none;
        b=P2NW7qSrHLWBFIfjaixC1aaV2rOU2SKb6M9t6KihaQjNEp4hYEZo0XNl2T0CTdfu32sDot
        niFacbBztJliH35ILVs1c9qo+Q4NWttfLZMnKG63P7TMn0AZMDKF8Kf2FONMO+6ZMRoLk/
        jVk1jnTm0J7RHEgPvL1Gq2aAXf76AME52y7Lucd0i/oaCciPsGVBZh/CxI5uK3yDs1BIOF
        cOVZuVaZ3gt3mkhljYU4eFdqhXOx1SXPNebqGSj7S2uA6Ttsd8jQ0T+GSwzn9PSaenpRG3
        zhSUILRVsQlW88iCn8jcBEO+C0gjR6FNEV5UXgjxWttI6+RTfl1eVGZ8A/e0pg==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Fri, Oct 07, 2022 at 11:32:27AM +0100, Dave Stevenson wrote:
> The datasheet and register reference have a fair number of references
> to SMIA standards. I wonder if the CCS driver can take over from this
> driver entirely....

A lot of the configuration of basic features in the driver appears to be
going to CCS MSR space. While it's possible to do additional writes to the
MSR register space based on standard CCS register writes, semantics still
needs to match.

It is possible to support many sensors with additional CCS static data that
provides the limit and capability values, too, but to me this sensor
doesn't appear like an obvious candidate for that.

-- 
Regards,

Sakari Ailus
