Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80D4E6A6877
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 08:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbjCAHzu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 02:55:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjCAHzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 02:55:49 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB4332E55
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 23:55:22 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkzbhx1tyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4502:69d6::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 998CC1B002E0;
        Wed,  1 Mar 2023 09:55:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1677657319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QNgyeGNbIakVmUaNTjzSwd5abaEgLpphKY3AKMb7PrA=;
        b=KYUSTIUqSWHhS2ZvEtGNGkof5IRAg7xaxvU9nRy40X3ymjyAXVQ3wzzZN+KjuMhN+E2bhN
        rbGLqUcHonwDykIrZI3t+OONWjbdprlYabNH4ME02B/X/WVC/TI68e/LwEFn1UWt7lpvid
        gZDVnzSPM8aSl/yRPHmlWwa/qlUYAa3nwghuhpleNpqz8gp+i+IVw0rOZEoRkZZ31UV4R7
        PovAlB/+aSJT4VjLPixBrf1ofT+mv8p2xCiyDHszB0dOYleXm5h9Vn24Lu+C0ISNRbnZCk
        b5wk97eSe+hPN7A/A7uuGkFmItzcs+tGW4KrQTvQl6a2PG/aMdpiRelPp1nU8w==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1677657319; a=rsa-sha256;
        cv=none;
        b=tL9p089BX4qFRu23nFBg1M1n3CQPRf9lrXE0Sq0d4uwRtXf5vuj9wUybRCgq1J2U7Ht7XU
        Rb0bhs5GQ3bL931sSY4IjaiAYZkxVrTJ0nvd+9Ta8JZAE4UNYCwRacG6ydbyMZXrGwD1xg
        ODB2nAqBI+sTnC280N20mHynCP/2nUua9QQTwA+RKHd+oUianvcgtBtFV/2bFfe2RxGhzM
        v26vLr68cGYVKW4h6PaHfRVE/o2EaAG7qH/NGBFyCizf/tX2c2Pmq5O2Vsq/OJy7J57yPn
        Qxmz6UjwBnqZijRY3fJERmm80ExlFK9ej9sDn4svB1buARq6+HuRjuv9gDt72w==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1677657319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QNgyeGNbIakVmUaNTjzSwd5abaEgLpphKY3AKMb7PrA=;
        b=Il//jLq1Gd48VojdutBxASabPg7wrpkR7vHRXly2PwOLgEuR8+tja8P7sjgitKSr7kEkVg
        SHT3VjabEFqq1qYpjz4zDlIyyUbYWVPzHo4yOj2+ROsFlTopika4KisBaSpwDDJlRCoSPm
        d8bkhyfvPJ+O5Ol1w74SrCZb05bOo8sPhmfEXvwzI4NO7QgNaWQz7x3mNuTj0qlnSlWaWQ
        2++M6810GnQcd/WihAgPxn29ld/7p/YzSyz5OarkkDvvdRJrsuHmGhxoHJHv++/Mf9kcBJ
        9H2gONCFWFSqS0OfbHkATdBd2IG9NNeVSapWYUNacxHqOD/5py6h9zjPc/fDjg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 73285634C91;
        Wed,  1 Mar 2023 09:55:12 +0200 (EET)
Date:   Wed, 1 Mar 2023 09:55:12 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH 1/3] media: Zero-initialize all structures passed to
 subdev pad operations
Message-ID: <Y/8E4Ds+EOfYKsXi@valkosipuli.retiisi.eu>
References: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
 <20230215165021.6628-2-laurent.pinchart@ideasonboard.com>
 <Y/3Rz5DRX9DnLe8E@valkosipuli.retiisi.eu>
 <Y/6Ugu86FDL0Cv1s@pendragon.ideasonboard.com>
 <Y/6VInMEEPhpMlxd@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/6VInMEEPhpMlxd@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 01, 2023 at 01:58:26AM +0200, Laurent Pinchart wrote:
> On Wed, Mar 01, 2023 at 01:55:49AM +0200, Laurent Pinchart wrote:
> > On Tue, Feb 28, 2023 at 12:05:03PM +0200, Sakari Ailus wrote:
> > > The second latter of the subject of the 3 patch should be lower case.
> 
> What ? :-)

s/a/e/

-- 
Sakari Ailus
