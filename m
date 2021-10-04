Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 059B5420950
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 12:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbhJDKaB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 06:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbhJDKaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Oct 2021 06:30:01 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80EDDC061745;
        Mon,  4 Oct 2021 03:28:12 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 03DBB1B00124;
        Mon,  4 Oct 2021 13:28:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1633343289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=U/amSm/NdNdPZ79iD1rl0AUghnLCS0+R2uJLb7cxDZs=;
        b=kMBRuj4FDnpztatfMP8NlGfKXxPgV7p5R0d48ZOpcq2bRfPdpBEJ5IXiX9/m0TDPbOd3lL
        tPPPWFuiCFu6Buk8aoo5hfigWDjd7V1yVXSkjnVRRrbV7Wd1i1oA/MNsVV108TPn1F098N
        Csr8cbJMLVVH66o2UyjoWZRo11DkAwONRnABtDc2OOEY5Vo/tH8KCK9T3KpQtXCALE48ye
        lldza0xDGYGqK5UBynUu9+DtYVhgI6s05BnsVF3AjWcYxUqgPLkJ4//JMU5XwKV2fQrG6f
        xm81f67lOfUckut1wzbFJ22tPbYGSCtwzinb1pjRx8ffH+znsU/eN1BsGyZr2g==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 07C57634C90;
        Mon,  4 Oct 2021 13:28:08 +0300 (EEST)
Date:   Mon, 4 Oct 2021 13:28:07 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5] media: rcar-isp: Add Renesas R-Car Image Signal
 Processor driver
Message-ID: <YVrXN9H2d1+wGEdM@valkosipuli.retiisi.eu>
References: <20210914140057.2801405-1-niklas.soderlund+renesas@ragnatech.se>
 <f3f48e76-01c1-92ec-3845-6687d030c4e9@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3f48e76-01c1-92ec-3845-6687d030c4e9@xs4all.nl>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1633343289; a=rsa-sha256;
        cv=none;
        b=PDOz1MkV9iirXytvplg6ABJ0IbsLfSUGkx0YG1Gex6Hf4vL3FWlXDCzlxTCQw3Dikfy0SP
        rSeGEWN5mFFymToaLrxps6RHu1h1Gz4yq8FlhnyvAzg2/xLCK0XkZt37fi7nUZ8R1eJX8k
        ERYVftVnMnsCFA/izfKsVU59h/FePzrZKxCon6XH1bBf1m8tsTPHSL44F9icrLpzuWxOqV
        HgZbxZeqjeeUZeS79mgx4/GxmKugq/nCgPfPw5J4Ev0jw1E2BNQqpb3CgJtRKQnjWMiLKN
        t3/OV8IzqKO1WT8TgiB5NSOjiueRqfZFgmIUfxC/WOgHD5cXjPFqgx2Nxzl0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1633343289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=U/amSm/NdNdPZ79iD1rl0AUghnLCS0+R2uJLb7cxDZs=;
        b=HNTfsxmoMZCk3YmqMZymxo/A8aV8CIr1f7MRs+hJzM0v3KMLJOIfHBAohc85hTzk1LkPUA
        xeygw4hZHrRW0D+lTJFWYQspjOgd9R5Ft2gpS1FALZrjDyMwJVo1Tw9rBBe5ONBaEe4Mkh
        UHadn/aEUu6zlphNDCgzMC7P9LWZB+O3ncprX7e2sA8ShyoalqG2LrIyPL8J06zi5f/rW+
        0T8/z/G9nIw/eSsi1+dTabE9PHBPjfWRLmiD6j99RMMQ4BlFxLMEvBsBTmuvis3uFfSeuG
        gY8yobmW1WoSK8vbc4l5j9J8dYwDtrsDbjsHElfZlLiaR1NUWr1huFv8aqZy0A==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Niklas,

On Mon, Oct 04, 2021 at 11:11:55AM +0200, Hans Verkuil wrote:
> > +	isp->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> 
> Is this correct? Based on the description it is really more a MEDIA_ENT_F_VID_MUX.

We also have MEDIA_ENT_F_PROC_VIDEO_ISP nowadays. Just a note. But VID_MUX
would seem appropriate based on what it appears to be doing.

Niklas: what does the device do with the data other than redirect it to
some of its outputs?

-- 
Sakari Ailus
