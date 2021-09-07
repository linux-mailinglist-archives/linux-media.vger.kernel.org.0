Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48CB340306D
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 23:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347390AbhIGVnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 17:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbhIGVnh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Sep 2021 17:43:37 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57455C061575
        for <linux-media@vger.kernel.org>; Tue,  7 Sep 2021 14:42:30 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dbd1vftgng281pd4yskly-3.rev.dnainternet.fi [IPv6:2001:14ba:8eb:1240:ab2d:b956:f00:7a12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 3C5A41B000E5;
        Wed,  8 Sep 2021 00:42:27 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1631050947;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0qrrmR2peFJuKXccrFav+TmKGQLK2i5HTe8GZSXpCf4=;
        b=WJ9GhEVRp/ibm2cNjHBVxaWEUGeorAG3rs9yHBQE9Lg2Q1Z8iZ6mitbM23q+5sZfHTB/tt
        TrPMbJZ1EiTR2rU/5Mk/AVarX4TH9Fucvtjk5uujog/q7gLWsmBqaeyaK1qfihbul7TLUT
        9/f4NmxbUgRKQtkFi9/RK04zymxixog8njU18+UnvkitUd3EI31lXrSQz1KRZFIElsIMvH
        xJj2Udd7ZX87zUb56fZwHJQQORthpu4H4RMKqWy0UDM0QiuZqhK29O5c9kwktD9c8vJOYT
        ROan9jg1/TN2RuSoNqmIwxgMdaT7Ld6+x/VZxlwdMpJKyvHIh7ScqJ33AWYw6g==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C3F29634C91;
        Wed,  8 Sep 2021 00:42:26 +0300 (EEST)
Date:   Wed, 8 Sep 2021 00:42:26 +0300
From:   "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
To:     Anil Kumar Mamidala <amamidal@xilinx.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Naveen Kumar Gaddipati <naveenku@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v2 1/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Message-ID: <YTfcwsDBIjQHbsnm@valkosipuli.retiisi.eu>
References: <1627560692-21675-1-git-send-email-anil.mamidala@xilinx.com>
 <SJ0PR02MB851449DED958C023D662E14CB7F19@SJ0PR02MB8514.namprd02.prod.outlook.com>
 <20210810152605.GM3@valkosipuli.retiisi.eu>
 <SJ0PR02MB851440739434B1C101FC8BE2B7F89@SJ0PR02MB8514.namprd02.prod.outlook.com>
 <SJ0PR02MB85140E02562D8C4B5B4CD738B7D39@SJ0PR02MB8514.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR02MB85140E02562D8C4B5B4CD738B7D39@SJ0PR02MB8514.namprd02.prod.outlook.com>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1631050947; a=rsa-sha256;
        cv=none;
        b=Z3Itxc/jhqFL+k3ectZ380Dn1PKjE4QsKzY6edeSL7KUvhWXPRabv5vYOO4WSLJEO7FLyG
        OrbmwK8DVO2t2xOVz6+ChyqEdLQsZttUks2FVM6sQIcdsNM9607k9gFj0Og36GWY1rsGk8
        Tr0kJ9Z6FdXu5M6jnhs6OEX+Q5AAF8M4QOTE+E8SjogcSMhYo5plh+SfcG2G7rNYfwXQo6
        rgEIoosqBdVYkeJWq+CkAD3kcwGJikNVFSZF0WTmYGH0Q+8/dK9MxaZ6sUqqCEgIftV42J
        eT/MydOpstd24tzz7j5uOtGC2moMYzUcf3FXUd5hNF7fcAoif5T9ncv0dG1hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1631050947;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0qrrmR2peFJuKXccrFav+TmKGQLK2i5HTe8GZSXpCf4=;
        b=BsI9o70zahgvGGwsrs19p8seF/c+mrZ4f5hFBTB6dLcz3Y5wvUI54cPxSjAxSnJLcQWXJh
        2+QCE58IdMKqr19WHdep6lec24cvrKWH9X0xsLNgJIfiXTqt/9q1fxSFuOM5dVx+OPzCqk
        ymEPsNbuD4UkUf+BsimVhklGVfasDqZ87XM0YapplNcP14EdNH4FaPDb2la8VjwV9susSC
        YNpZGXqJ6MoMmLH2k//gHBgaRzZHKkOOV19j0KY/1Hq2ECstOhMygoI/2MMxOuWXa6gRL5
        TFWq4vtcBhx5GxgnaoF5Vf9C8GNwRagZxQkrEoVdZQ7ODSjkPZ/MMV24uu6iQA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Anil,

On Tue, Sep 07, 2021 at 03:16:19PM +0000, Anil Kumar Mamidala wrote:
> Hi Sakari,
> 
> Can you please review the patches and provide your valuable feedback.
> 
> Please find the change list w.r.to v1 patch below.
> 1.  Updated code with the review comments from you for patch v1.
> 	- Add check for firmware size
> 	- Remove hardcoding of MIPI lanes
> 	- Use fwnode_graph_get_endpoint_by_id() API instead of fwnode_graph_get_next_endpoint
> 2.  Add streaming flag to avoid multiple times calling of stream on/off functionality if already in that state. 
> 3.  Add v4l2_ctrls for setting brightness, saturation, AE metering mode, contrast, gain ctrls.

The patches seem fine to me. I was waiting for Rob Herring's ack, but I see
he's not cc'd nor is the devicetree list. Could you resend the set, with
both cc'd?

Thanks.

-- 
Kind regards,

Sakari Ailus
