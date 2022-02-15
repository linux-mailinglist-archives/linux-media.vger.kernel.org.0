Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935404B79C7
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 22:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244378AbiBOV2f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 16:28:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233069AbiBOV2f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 16:28:35 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3515BC24A9;
        Tue, 15 Feb 2022 13:28:24 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 53B211B000F7;
        Tue, 15 Feb 2022 23:28:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1644960499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TNR+UWwOUIe5Ol5GaIiTKvYLB6cZOFWi5SXT3cza3B8=;
        b=Vsik3++9JZvVln1Zurc0XQHIHTlb/WOzoGgeYTq/r1s+vuSPf4991ZWyAKrUK2bMly684a
        U+HomqvrB9Q8zSUUoC7ax+Y8fjUFmT9EDIXy0znNi7acv50Eb37tKatWL2EL7p3yma2cRn
        S+IzECSditwIB143dK+FOQcQ5EAIYeR7FulasMffmKj/1gYfA1A/FFXYjWmlyjsU5C5gl/
        Ep++7j9E5SwempIQqvqv3mNsNOLplLdp8y20VwFvq0WDH1N4mpUYQaEp5F3LzD1NZQpF8V
        MIkaCpIk9lVK6vmiZcx1ZkAONahSRszmns8xyzPvX8MtEHalTrPdvetZE5dGvw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B2BDC634C93;
        Tue, 15 Feb 2022 23:28:18 +0200 (EET)
Date:   Tue, 15 Feb 2022 23:28:18 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 2/2] media: media-entity: Simplify media_pipeline_start()
Message-ID: <Ygwa8qJBNBMLREH9@valkosipuli.retiisi.eu>
References: <20220113150042.15630-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220113150042.15630-3-laurent.pinchart+renesas@ideasonboard.com>
 <YeMG1Xgtnq0Qu9ar@valkosipuli.retiisi.eu>
 <YeMoTVuO8nbgw9Rr@pendragon.ideasonboard.com>
 <YgbUukylCOq8j0+r@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgbUukylCOq8j0+r@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1644960499; a=rsa-sha256;
        cv=none;
        b=ekiXkpD+cJr9GyLovAdkVkstOGXEGQCE3N8NFy0n5voQt8LiGjZs+ruCankt557I8htuPu
        0HudXoRXIxh6zoqo9E4VLWWM2R096JktZCHv17/jW/00edDLhTymDzMHLeeDlcLCRdDV39
        s/nvrW71tJmz0NAZCyA5G8TJOv5fibY2yK35ls4rBoJkQ45GEyEI3/pddznK8nKS4yDlYe
        TcVjGWWiR165/vYkxOmyGGl48/DIWXznCDk8Kj5dXCVJLWjhCYiFNb+enE8v9lfLauD8vK
        BrEUIkPy9ph7TSAW4m+wYtNfwuglQrYdA8hrk4x9O9TrjkaoJrrGQmVG2e2TmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1644960499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TNR+UWwOUIe5Ol5GaIiTKvYLB6cZOFWi5SXT3cza3B8=;
        b=LUy0dud2TwkZ3l9rxJ20837f8kR2GlqE8IKTj1kGhVEK1eaUXBVzscHEAo47aBjeHMF1JB
        Gw+U+GcwFdyHT/nXAs8OGN4YLVvUidRukfTyHEezW8Tm8gwRPY5uoWFJOgkq8D7O+j9lEr
        HKxflG6XBTj4rRRaBMcy7Ir/8UrsBjVf0hmh+wUWBRhIwL8w0/5DM0VuG7VoK1NEdXcGGl
        /dhVQXKprzFkvwW4VmO67F4rZkTU0m6vmX7LwaBLWbwYGGNw3XJ0hmH0BPa4qhcJCSmzXQ
        Lz4MbBusP/g58RlkzUsO2nl3bjTGuXB6Bn/4ZurU8rSyRQCtp10INM5iO/rj3g==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 11, 2022 at 11:27:22PM +0200, Laurent Pinchart wrote:
> > > I'll do that when applying if that's fine.
> > 
> > Fine with me, I don't mind either way. Thanks.
> 
> Will you take this series for v5.18 ?

Yes.

-- 
Sakari Ailus
