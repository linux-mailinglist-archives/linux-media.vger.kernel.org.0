Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3939621227
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 14:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbiKHNR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 08:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234434AbiKHNRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 08:17:23 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8244299A
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 05:17:22 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id F0100205A6;
        Tue,  8 Nov 2022 15:17:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1667913440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aXHD5ojfAaG6PrKNoQkvXleWatuwv5TQ5PjKPk56ITU=;
        b=X5OgNRFFvpwV7b9mAgSC3VdXpl4dkk2VyNQceZlQ1CXp2mTKcnylunOP93uAilT69O2WMV
        nI5HMQ3IzIWhSTcU6tScVzmJPTsQKkHtqpjzaz4A+2110Xz8WEOf9OQKbwnnqMOLn9TW7Z
        Ht1nRzY0tFghXyIGfkoPjlEz2G+XJ3w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1667913440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aXHD5ojfAaG6PrKNoQkvXleWatuwv5TQ5PjKPk56ITU=;
        b=svYHim8Jsejo0adIL2z0n83zzzY3HoVpoPaYPr8S347nDWcchx77S9OieHnf570c+gnjkW
        smv7QfLJbOsMBUjplHRfTRcgWsaCaLPo+hsgtnN4UbepcNUdgQ1dN4rnskGF9SIGjNyva6
        NLpt0LjPRZPWMf0W+bIv717ZahdNTaA=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1667913440; a=rsa-sha256; cv=none;
        b=L55nt+gMQ4CPuCgc3xv8ndnNty9cAGZ5/NpmSsUKk3pnFapR229PSJdE8lMRWPRmnf9E3u
        D0SY+SgThUdXuwhQLMqF0Z2rGlVskHlnH1wO95dqzFYkI8mRiH+i8FbW19yP0MvUrRJRIo
        VeJES4XvM8uK+lE9xEjKajxgt1kjiyU=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 65D07634CCA;
        Tue,  8 Nov 2022 15:17:19 +0200 (EET)
Date:   Tue, 8 Nov 2022 15:17:19 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     dave.stevenson@raspberrypi.com, jacopo@jmondi.org,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v6 0/3] Add imx577 compatible to imx412
Message-ID: <Y2pW3/QNeUa5rYre@valkosipuli.retiisi.eu>
References: <20221014180417.3683285-1-bryan.odonoghue@linaro.org>
 <34fd2ddc-7645-21d4-45f2-f1534478d586@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34fd2ddc-7645-21d4-45f2-f1534478d586@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

On Mon, Nov 07, 2022 at 11:29:47PM +0000, Bryan O'Donoghue wrote:
> On 14/10/2022 19:04, Bryan O'Donoghue wrote:
> > v6:
> > - Drops -items encapsulating compatible - Krzysztof
> 
> Ping.
> 
> Any chance of the good folks @
> https://patchwork.linuxtv.org/project/linux-media picking this up ?

This is waiting like other media patches to be merged to my tree. I think
I'll prepare a second branch to get more patches merged.

> 
> It unblocks enabling CAMSS on the qcom RB5 where the feedback I've had is we
> should get compat imx577 merged to accurately map the hardware config we
> have.
> 
> https://patchwork.kernel.org/project/linux-media/list/?series=644675
> 
> https://patches.linaro.org/project/linux-arm-msm/patch/20220518133004.342775-2-bryan.odonoghue@linaro.org/

-- 
Regards,

Sakari Ailus
