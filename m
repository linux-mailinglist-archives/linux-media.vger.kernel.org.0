Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC965BE38A
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 12:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiITKmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 06:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbiITKlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 06:41:46 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786BEFD1F
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 03:41:24 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 12A561B0018B;
        Tue, 20 Sep 2022 13:41:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1663670481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=32W0pDP+MAhkTXPf6Pv3hBBuNpfcJR0GkJ8sdxuWnDU=;
        b=vZYJDMHfmoo/iOg99L+ZlrtXMLejtQiFtcgtOlDiRWVhfNdC8pfnCLLNyLW5dqec8Ez2eE
        N4tEQFy9cQIELPcuJkki6FomPfXDtTDIOoajvw0+ixqRoibPUghhb4gdpR5YOy51I4NZep
        NJ3tyoged3081078OoCP5Z4alHWZz7mTFsvuLyD952qXKHKCTiNEOkKIQE8b9bV3F+d76t
        /DZdL11rxRRVACgKRGVRgiLSLDTV79265d/CzjOU/+hNFR7f0kKAWFNAq+DLrBVit8VqyU
        WqdhmzD+o1JOZ1wuOJbR2nTtfdsizPiLAmpN2XUkXzCLtrs+oThmsZpRm4lyiQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9E40D634C91;
        Tue, 20 Sep 2022 13:41:20 +0300 (EEST)
Date:   Tue, 20 Sep 2022 13:41:20 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH -next v2] media: Switch to use dev_err_probe() helper
Message-ID: <YymY0PF6cMe+0H0R@valkosipuli.retiisi.eu>
References: <20220919155843.1097473-1-yangyingliang@huawei.com>
 <Yyl67oamQ/i8PZpZ@valkosipuli.retiisi.eu>
 <6d8f1bde-f56b-3373-6a77-a69a08b23503@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d8f1bde-f56b-3373-6a77-a69a08b23503@huawei.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1663670481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=32W0pDP+MAhkTXPf6Pv3hBBuNpfcJR0GkJ8sdxuWnDU=;
        b=rlAUJzC49rr2Iu2AB+Fhnx+Nbb2ILC59aqtG/M+xKyM9Z4QokBhzz2YUuZMZaLh1pArHjh
        NfhamSVJBWSBxjx7ThCbdYybhsdqvlTNEAqL8k25b4vTTc7Y9nmqcM6xEy/oxhmJcDKlJd
        LMNRZsACcyXifkZsLqRLwhDtPwqPjoQkTugkbhZe0AvGMxEm+6q4d+4tckSsx479JwFuiF
        tmOaRNyNaNfxLqneXkDvpJdqfCSkXmbi0nztYFWQubvNfyKBgDqaEk+G0ZGJ2+gR+e7wP4
        B54glhEdXUJ7C/TOJmW/YyoYh6AWWp+zUuIFHMW4yFtV20cJD5pRF1wbC6DjLQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1663670481; a=rsa-sha256;
        cv=none;
        b=OuKucBfrb4KCY3BO6gVDXaClqazaYxBPwo68ccjzoBPPbIs+/d/xYFl7Dl2uMmbzdQiM1M
        DbB8BRj/L2lfql1OZUr4AZQSbqHVRhLfX8sEC4MjJ5T19q1FcA2TDPjN833KoXVL8mLirc
        5Bn3gxV2L1MCjk57SKeN02X02GL4Zufpe31xx4Ahbo9XMRTb6KCWEGFt6SQKOYsVQ+bo3/
        jWFkZNk3iekYZbe43DQn/+2bf8FqJo829UhJRvkFPPpx0gQs9EOyPjIZh1hZU//SnW5evs
        hGt2NQPWfCYV7UqBpTH2USUvhOefdYdICGsA3PL8VaziVqe5/rtp73CzYO+mcQ==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

On Tue, Sep 20, 2022 at 05:13:11PM +0800, Yang Yingliang wrote:
> Hi,
> 
> On 2022/9/20 16:33, Sakari Ailus wrote:
> > Hi Yang,
> > 
> > On Mon, Sep 19, 2022 at 11:58:43PM +0800, Yang Yingliang wrote:
> > > In the probe path, dev_err() can be replaced with dev_err_probe()
> > > which will check if error code is -EPROBE_DEFER.
> > I don't really disagree with changing to dev_err_probe(). But I would like
> > to ask how have you selected the drivers and calls calls in them that you
> > do change.
> The drivers that check if error code is EPROBE_DEFER when handling error
> case in probe
> path.

Ah, I see you're only changing this where the printing of the error was
conditional on the error being -EPROBE_DEFER.

Many drivers still do print an error when returning -EPROBE_DEFER but I
guess they can be handled separately.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus
