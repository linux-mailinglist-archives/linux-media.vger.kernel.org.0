Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39C1250D683
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 03:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240106AbiDYBZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Apr 2022 21:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233946AbiDYBZg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Apr 2022 21:25:36 -0400
Received: from beige.elm.relay.mailchannels.net (beige.elm.relay.mailchannels.net [23.83.212.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C2AA0BCF
        for <linux-media@vger.kernel.org>; Sun, 24 Apr 2022 18:22:33 -0700 (PDT)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id B8F762C0E13;
        Mon, 25 Apr 2022 01:22:32 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (unknown [127.0.0.6])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 344262C0DB8;
        Mon, 25 Apr 2022 01:22:32 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1650849752; a=rsa-sha256;
        cv=none;
        b=66VIcvY+0RiHPxMYqUPuFXa07j1M2Ymdz52vTzn9op46zZuKAA3ksawjcScfJcpz12lO+M
        X7DtZPaUawSIzSzkFrpnPtxCH8zXuFRv1C9mbcREsbFqOhjhpNB8KhtWEDKK2YAMWA7B3l
        +4T/Fi9to7vM+lATIKKGUk2ZnQd3cANARF27SaOjEaYTIXZ8nJnLl2n3JcckmSYhmD/O5o
        7a6V5kKoZq4JwImKRNcK5NZSrpci8wrQTNTKSuUfDYrpk4kWYx3U06Xzk2cgJGf2qfNVgF
        Dv4El4/+KHI0RGNZEGP4UZ34LCqgJ9DhHIaCrVbtj4bnqYjUy5jOuk3xnYItYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1650849752;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references:dkim-signature;
        bh=LczG6KC7ec7iQVuOVzkOxhwlnbxNGZx3FsulHyLm/sA=;
        b=SB3B2V/xKf09r4Mdtzi3kMhd2YFwn7RVz2zsaI5Iza+gzQo+MNj+JnofPDF39Px0XeNfFS
        RNfI5pS+9rnC18FuCIMgm/9J53tpRxhHRJEH8+0vvm3XHHnJKUShDkL5vg2KRmSThJrXho
        qrCoIU2jylSzgX2aPUlH5M/qeEXVUbeVMwuer8DkyCaFMnSU1ZL+XU8l3oBCd3KwPgpwvx
        uYHbQjaQ7X3+AdsgaqMk7PAcDBwzz/3GqJAfxkPUqQZQIjOkbOhwDOt21n0YcpSR55psxf
        Y8k/n/OJgfR0qXrWVarLa4J6So6ZDJgSukOg4oY0c63efmeieKlEtLXSruMi2Q==
ARC-Authentication-Results: i=1;
        rspamd-67b64f579b-chnfp;
        auth=pass smtp.auth=dreamhost smtp.mailfrom=ian@linux.cowan.aero
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ian@linux.cowan.aero
X-MailChannels-Auth-Id: dreamhost
X-Wipe-Fumbling: 04752f086372584b_1650849752501_514037675
X-MC-Loop-Signature: 1650849752501:3939715479
X-MC-Ingress-Time: 1650849752501
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.121.210.129 (trex/6.7.1);
        Mon, 25 Apr 2022 01:22:32 +0000
Received: from fedora (unknown [69.12.38.97])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ian@linux.cowan.aero)
        by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4KmnLb2XS9znZ;
        Sun, 24 Apr 2022 18:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.cowan.aero;
        s=dreamhost; t=1650849752;
        bh=LczG6KC7ec7iQVuOVzkOxhwlnbxNGZx3FsulHyLm/sA=;
        h=Date:From:To:Cc:Subject:Content-Type;
        b=QxshtbqO9wbrPryZeG6n4plGKWrTfzYDABTQzZr71KQU424czDdw3Fb1+ee8LmopH
         sa8p95zvUWrvMCktPAZP5Rc2eVfyy9GtqokKT7mHlkzRJVWSC4juCpLgMR6CgWFe2y
         NK5Ul9JDVGuTfzCCqJwoJkZh+3uEBA73rAVxP4YaUESeptygDLMhbX6FE7y8lNWM0c
         JXMDSkZT+LO/fkLmJUsVHIcs5fKDNd8B2/7VKU8rbwOEsIgIuay+MrtHxgnhyWoxbg
         BYehjj0QVdRBGRlWor/eD6YjGK/KKv5Fv5MZHs5d9FRx61vYvV0eGFRZzOO5q1Bacb
         bFyd3ytxLMYSQ==
Date:   Sun, 24 Apr 2022 21:22:30 -0400
From:   Ian Cowan <ian@linux.cowan.aero>
To:     LABBE Corentin <clabbe@baylibre.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        dan.carpenter@oracle.com, mjpeg-users@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/4] staging: media: zoran: add zrdev_dbg() macros
Message-ID: <YmX31vg+lCx6rsKF@fedora>
References: <20220423051745.292683-1-ian@linux.cowan.aero>
 <YmWiQsrPj0uIpZ7w@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmWiQsrPj0uIpZ7w@Red>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 24, 2022 at 09:17:22PM +0200, LABBE Corentin wrote:
> Hello
> 
> Thanks for your patchs, removing dprintk is a good idea.
> Please use pci_xxx() instead of dev_xxx() to be consistent with the rest of the driver.
> The comment title is misleading, zrdev_err is not about debugging. What about Logging macros ?
> 
> Regards
> 

I have made those modifications, and I will resubmit patches 1 and 2
shortly. Those are the only patches that affected by this change; 3 and
4 will not change.

Thanks,
Ian
