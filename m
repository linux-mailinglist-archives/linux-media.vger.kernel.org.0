Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF27489BC8
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 16:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235106AbiAJPGE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 10:06:04 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:32910 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbiAJPGD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 10:06:03 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5A86A612C5
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 15:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C572C36AE9;
        Mon, 10 Jan 2022 15:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641827162;
        bh=KRqWM2nXgqdPVU3m+UNTj9CbiE0h8Ypd1bL+vXkQ+3w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hPmr3sd5wIuhS/QN7xqR7w/btwt5Z+IB9TXO2r+sGOOttgYjVeLuiwaM/T8RJBfZc
         fqLoXckRc9PH+ZF0PTdGP28t8iF/vnFEYcNr01nhEKI2gySfIUV1pcjFpLkEaZMvVN
         XnuftANVkY8B6DGKDaQp0WbVP2eogPieJw2w0PqdOQf0KrIlKgV47iUt4FNf4j2Vvf
         7SjoqP2Yfm6EClaqdSHc2RtiPmxcfGWOe183XMKybERYaUw7wq0TsZcYkYcgHpjIdG
         3Dw/EE9RYkO/LyjXyw/XZh2xbtt5o26s5hfJ/xO5YLRybGsL896yBm0fVZltR6X6Nw
         mDXX9fDpB8n/Q==
Date:   Mon, 10 Jan 2022 16:05:58 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Robert Schlabbach <robert_s@gmx.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: si2157: add support for 1.7MHz and 6.1 MHz
Message-ID: <20220110160558.2f36f646@coco.lan>
In-Reply-To: <trinity-491d504b-a8e8-490d-8353-bda143df9b20-1641819163636@3c-app-gmx-bs20>
References: <cover.1639140967.git.mchehab+huawei@kernel.org>
        <76c2ea87882c87bd35066a85cb48292a36a79fce.1639140967.git.mchehab+huawei@kernel.org>
        <trinity-b5cc1284-ccc2-477c-ac90-56ee40da91af-1641483579446@3c-app-gmx-bs50>
        <trinity-59d726d3-993c-43c9-9e44-5be5cdfae74d-1641493525223@3c-app-gmx-bap38>
        <20220106213045.6afe5a35@coco.lan>
        <trinity-59385619-7f83-4302-a304-c5346098c3a1-1641511005761@3c-app-gmx-bs01>
        <20220107080625.00547988@coco.lan>
        <trinity-37466cd2-8684-4e53-a4a3-7ed406945e90-1641551917644@3c-app-gmx-bap54>
        <20220109080914.53e31572@sal.lan>
        <trinity-491d504b-a8e8-490d-8353-bda143df9b20-1641819163636@3c-app-gmx-bs20>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 10 Jan 2022 13:52:43 +0100
Robert Schlabbach <robert_s@gmx.net> escreveu:

> From: "Mauro Carvalho Chehab" <mchehab@kernel.org>
> > Now, get_frontend is an internal kAPI. If I'm not mistaken, it was
> > designed to be used between tuners and demods, for the cases where the
> > demod would need to know what was the bandwidth set at the tuner.
> > So, I'm OK if it returns the actually applied bandwidth, provided that
> > such value is not returned to userspace via DTV_BANDWIDTH_HZ. So,
> > props->bandwidth_hz should not be updated after its call.  
> 
> Good point. It might indeed be interesting for demod drivers, e.g. to
> adapt the AFC range setting to the (band)width of the signal delivered
> by the tuner (not that I know any driver which does, but hypothetically),
> but beyond that, it has no use. So I agree it should not be passed to
> userspace.
> 
> But for the hypothetical use by the demod driver, the si2157 driver
> should return correct values, so the patch I submitted can remain as
> it is.

Ok.

FYI, just applied the patches on media-stage.

> 
> Best Regards,
> -Robert Schlabbach



Thanks,
Mauro
