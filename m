Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A83316B243E
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 13:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjCIMfX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 07:35:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjCIMfW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 07:35:22 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649AFE191B
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 04:35:20 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkzbhx1tyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4502:69d6::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4PXTD43LXYz49Q1c;
        Thu,  9 Mar 2023 14:35:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1678365317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YX8hWPA3FGAd26nxTVNRpll/Vdsnh3NpoDZIyApUU24=;
        b=iEj/BJpwdx7spAhvW1A5loM2hRwKdwLFoObXPiAY82+RzxoE4DCpVJhxmESWiyiZ4f51Aa
        FdWUEuzaHGRBBdme5avyvho/cVTaAY9aU7iZFZH6+wtNyEBSiq4S6oYaPOJXjadMb907xE
        H2PF7/ORY14B/SRG9ieDdbZLLG/nX9ncsZyQsrmZLwhO/dav8TcxwGK8/OfV1pLJbY009s
        c9mZAbfnqBppqr1rwh6hr9RGkxi8t6DxioTb+z4BZ6p+UR+Bl6Tdk/PAaOwlbX6I77M6vN
        0l2BxtJv1YkVmhlO61zyX/WYfHQh3Un9CrTpi30ixU4qrf9wLl353K+R8bI3lw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1678365317; a=rsa-sha256;
        cv=none;
        b=sd3+/033MIa3JRAd8HDGSvvbRYCxnwYQtiJE4V4mVAaWl27JsmYY0tFM6dYXrTPgDkcMhq
        eXeah3EJJL6QkZYz4yqv0BgMqZgY6z07HRewEsh0R7wPe54Kv9gQ1bu44BRboFMBgVwJyV
        AgNQFWBfHZp6PEkXwbEToha9n6pWST/iTQdWRQlm+BQQhB3Rc6UBZxtgzmhI/BQrcOM4h3
        MlB3+w9rGrCF7BOGaLc/I9lEztaMO2vYnc+LaHM0cgrc/Qi8jjjd0pVVmP9vB3axHnrFug
        qvSM4SYHIdSmnzrBOeaQ6gXWTusdXkcgKvB/enBhHKl22Hkdqf1bThPNO0IlIQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1678365317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YX8hWPA3FGAd26nxTVNRpll/Vdsnh3NpoDZIyApUU24=;
        b=dcetcqQ/Tox3grD8Q87H2PvRep2CWmviVabRSwwr/wjwAdmbbj687jBViMX0VnMtupam8Z
        6NLBQvJUYToQQGd+7mJcE463wxNvdHO+8X8nTPgc9dnUFtymKp+aY1urcmXcpTETemEJba
        WrKYtsHdAK/00xwLal3UPwXJ5nE5wj/L8OxhXUfubrJ+4N6gTqkLn42YISY9uvUNxbH0+R
        ALI3SyVR6WCseAAXduxFj7ySWeLzD/kqsfB7AUkKg8olmbtMJN6adToBEqDzL79U3VrV0w
        45Bnw6DJBsP+mazqCkSFy5wcNLITP8n5YB7XEsHuHIYTB/vu28XuCXKPVT2MWg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id F0D31634C91;
        Thu,  9 Mar 2023 14:34:31 +0200 (EET)
Date:   Thu, 9 Mar 2023 14:34:31 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        hdegoede@redhat.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Message-ID: <ZAnSV9W3CBPmwqc7@valkosipuli.retiisi.eu>
References: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 09, 2023 at 02:27:16PM +0200, Sakari Ailus wrote:
> Link validation currently accesses invalid pointers if the link passed to it
> is not between two sub-devices. This is of course a driver bug.
> 
> Ignore the error but print a debug message, as this is how it used to work
> previously.
> 
> Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>

This was intended to be v2. V1 is here:

<URL:https://lore.kernel.org/linux-media/ZAIryJV7XNpW8lbY@kekkonen.localdomain/T/#m12c7e39e154a799b1034388d0c63ce0f65979a1b>

-- 
Sakari Ailus
