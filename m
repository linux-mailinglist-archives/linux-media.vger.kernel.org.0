Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDFA4771E6
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 13:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234576AbhLPMcf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 07:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbhLPMce (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 07:32:34 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E7FC061574
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 04:32:34 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 657151B00131;
        Thu, 16 Dec 2021 14:32:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1639657949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=F+oyyRhhDr2BOVX0I/lrRmBRNcZcuHRWpJlYdPJPVRM=;
        b=RemRXA6gm2gYjNCZL5ZxTSq3LdRyRcC+mzv/10ZOX31ERt7DsRvyaGJvPUy7L9ZMM1BRzO
        q3p+tu67B6dFZO6gNM3Deytsf8jL2oa3KseiX+Cm29TVtD9vPsIs9SIztsomTb6X59aykr
        7uQq40JGw+pkyw0nB3QvFgOPs0tY6izNIf/8/NwynCmlzQBL0sVjpfpa4o3OfRRJvTdHMm
        jy0/obiQtWWijFJAJ2jLBQ3xpBmQgKW1gQv0QyXM6/elqEfeX+zL4w/gaALiNjrTx1mFmy
        YTl4dpfwo8IKsvJu0kbu2j7Opq5xlSiLamqQe70l+wJgIFt0555o0UXNwvpvew==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DBC55634C91;
        Thu, 16 Dec 2021 14:32:26 +0200 (EET)
Date:   Thu, 16 Dec 2021 14:32:26 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jenkins <jenkins@linuxtv.org>, mchehab+samsung@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 5.17] V4L2 patches (#79461)
Message-ID: <Ybsx2npF4ZoIWg/u@valkosipuli.retiisi.eu>
References: <YbqEPv6h6cESfWY5@valkosipuli.retiisi.eu>
 <20211216001713.1281255-1-jenkins@linuxtv.org>
 <20211216132725.029f689b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216132725.029f689b@coco.lan>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1639657949; a=rsa-sha256;
        cv=none;
        b=LqbQhHZwfCGsR+t43iJ1K7f2+JSZq2Afp7Wx2E2ZHKxXnXjjVf1UGc71bSby1UzjoL+9st
        CqNvN9vwKpU9yedpeJ0gZ+V1zSudfIbQDp3D/Osq5DQlfwGKQuzCY8rO4BBKl4mgOCfjEo
        uPk8p+7JbEG9+ERZG52afJ2FseMzdaYnNLAvjNQ710cbT6Rf8XSwX6sa+LAec4YdzNvBLz
        BgS7tAHOC/en0uRXI06zSGodPZ4C5jtIia0oYphwke6UwBraSH915pR3ZmJ2yRhKg9/OOL
        2qWERR9pXrRSRrCnT/6WLBBMNkmRh4YmuAnXdC4zuTIHnbEayDJkeA6xzTLw1w==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1639657949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=F+oyyRhhDr2BOVX0I/lrRmBRNcZcuHRWpJlYdPJPVRM=;
        b=PRoLox1WptFvJCynwnHbOEU9j6WVyhONojp/q54m+wjXUx0GpXpHljGsuxUkMXlgdtpYPD
        mrITzgXfp6m3Z1Yl3qkOurn2uRwjf62dfiau9qNo3ghTguEFIPHV0HuDnxCUFhmBxLZuu+
        7aB4Oq14Co0ANHqwrqiqUKzOcPgtRCynNc8jdPCcLWk3k9WVP9gUIShhDmJf5nRdda9Vqk
        Rwq7bnUVi3dONtPCMPabyYOhJtX2gqL+/KWDfxVfOY2tCfxei2o4lBLpHWYlIgIr+WH06q
        Okwzwm/9WhODHS9+vHp7Z9mpSkCZXaFQiKAbNrEoJy36nBoFrRWv/eI+++N3Uw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 16, 2021 at 01:27:32PM +0100, Mauro Carvalho Chehab wrote:
> Em Thu, 16 Dec 2021 00:17:13 +0000
> Sakari,
> 
> Could you please rebase on the top of media-stage and resend? It sounds that
> some of the patches here were already merged ;-)

Ah, yeah, seems so. I'll resend in a moment.

-- 
Sakari Ailus
