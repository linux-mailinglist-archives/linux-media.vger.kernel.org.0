Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83ECB3018B6
	for <lists+linux-media@lfdr.de>; Sat, 23 Jan 2021 23:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbhAWWjp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Jan 2021 17:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbhAWWjo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Jan 2021 17:39:44 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B0AC0613D6
        for <linux-media@vger.kernel.org>; Sat, 23 Jan 2021 14:38:36 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dbd4xkyj7wcfw2k22jcct-3.rev.dnainternet.fi [IPv6:2001:14ba:8f1:3400:fb90:892b:22d6:3885])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 318181B00249;
        Sun, 24 Jan 2021 00:38:33 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1611441513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=soLPZoZgsDr01oVg+EVFmEIT/CnZPJAm2NaagjEhcl8=;
        b=ht+euYOELnUGA+BVoQm+tnk+Sijit0yNUMrV939lPutlfL89XeE1AAHDHuGyBuNMQ+YGcd
        5CSkw3xKCSGakFf4BPBPH5lXtxTxjXUCznrI6yMOHfJf/Vmct2tZZBI4H6GThWRKZME2qP
        w2woKFuf8jJdwz0RJZfbIM1VfxcY1JtCPrPgKziYySf6bBm4rR029yikd3wReK4MVbi3bs
        Wh6CvnaAwSSusmDCWSyqi9Qt3tgePOJ61UW0ITDeWhF1EnZisOUcUYYsIjykMYROjBn9m1
        vMCN/6e9XUSpFdL94iE2v6b2SWjGWfHgHKaQYaofhJK63RrPKc7oQ1s+nduLFA==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5E8DE634C8C;
        Sun, 24 Jan 2021 00:36:59 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.org.uk)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l3RWd-0004zJ-Ri; Sun, 24 Jan 2021 00:36:59 +0200
Date:   Sun, 24 Jan 2021 00:36:59 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 00/14] Fixes for smatch/sparse/sysbot/compiler warnings
Message-ID: <20210123223659.GA3@valkosipuli.retiisi.org.uk>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1611441513; a=rsa-sha256;
        cv=none;
        b=gFcuJ2Mv+UDBy5GhVZn1POvZtDvQM26Fy/cZzSBm6Y1/IARAGaBichd1+eFfG6DSfkrqmH
        C6fOltP5dfTpAWCA8FYsHgxl5K8/Q9JcebnJbU5qo/IyF7/cBdnJOeqpWjlAIoHVH7QfWb
        6GK0aMVh6WKede290IRwdxfbd1F3VYqb9qwWmcJ/ROIW8rAUpp0wSELtSEFVKEx/JWr+Rb
        T8YG66Usa4a4UHMUTyJ+2DMIxI50sJ1loNMmhQOoeucKdEV8wa+/m8HLkSLZdlQNf3ceRa
        QU3HhNrgxWQTr0DWID7ohOZCCOGe/fHzFRkU506jdLbUdBZ75eGmNLwLfWkVrg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1611441513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=soLPZoZgsDr01oVg+EVFmEIT/CnZPJAm2NaagjEhcl8=;
        b=EPqpKbpLfPG7cBEPqOx9FxWMtc8jrH2BNH0iDLqOs9O8V4dArkQ+TjYiRRgSTCcu5Etu78
        5PZtmdY9nr1FcKLExdN2TfdW/Rs+Hn97O6qNVlDR30Q2fq9AY6umOQT1bdLKx06T3BAFy0
        i0lsrb+VbAXTnkt/u/96dagh2A3AzD2ohFqcmjsEXb+mO9sNqASp6241/27NPLrVoCi/IC
        uUuT7+bY3evqpEKukZOgs6QEK1WSJRWL5L8xjZH32LKBMCaQSOldkVoFun+AlWBqKyvF5r
        /hoBwGDVDpMdrgLiwwNUaLCV+oM+MRJsL6KbJPfp4RVacgPKUtE+SVQYoo8Nbw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jan 20, 2021 at 10:42:52AM +0100, Hans Verkuil wrote:
> The first patch fixes a compiler warning for i686, the second
> patch fixes a sysbot error, the last patch fixes a sparse warning
> and all others fix smatch warnings.

Please add on patches 6 and 14:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
