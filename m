Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3E3652ACC3
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 22:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245129AbiEQUeY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 16:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239770AbiEQUeW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 16:34:22 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABED52B08
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 13:34:20 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id C10DE240108
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 22:34:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1652819658; bh=Qb7ST+awUa7tDy6zdEZLQcrr2+jI1sSJKpIijBJJ21U=;
        h=Date:To:Cc:From:Subject:From;
        b=kvXqXV26YW9VedlV+9CQdqF4tRbRA5Umpl4EGCLnCI/HkuVEVlJrX5CEc5o5H9Fp0
         BSP7fgTMdUTI/x0uLfB5Ok7GHRiHR8MPGZ0v9EGNrN8tzNTLOunmiIMBWDKal+74HF
         p8aX2l8WXzfucULecojPpqRDOdyVbRDJOwXGK7MNB/LWhIP7L2/r+khWIBHQrNkM7g
         pTSFQgw3U1iuqWkcPMVgF2MbZ61C8s6CCzYX+10bk1DfVGeeQPzjx3LHXILyAG3X36
         Bpebs2ELirGG2iySn4J2FGzmzwT7PaTyzwK9NBmPV+JcyFmPipNiWtq3ulAiqAgCCF
         zj5nDVbOMAbHQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4L2nsQ2Cklz6tmR;
        Tue, 17 May 2022 22:34:18 +0200 (CEST)
Message-ID: <dc489dbf-fbd0-db97-009d-df3eb94860fb@posteo.de>
Date:   Tue, 17 May 2022 20:34:18 +0000
MIME-Version: 1.0
Content-Language: en-US
To:     laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org
From:   =?UTF-8?Q?Alexander_Wipperf=c3=bcrth?= <wpprfrth@posteo.de>
Subject: game capture usb device stops working
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_LOCAL_NOVOWEL,
        HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, today I got a usb capture card (Elgato HD60 S+) which is uvc 
compatible and the first time I connected it to my computer it was 
immediately recognized and the video from the game console was displayed 
in OBS, but when I change any setting in the configuration menu the 
device stops working, no video will be displayed anymore, I have to plug 
it in and out multiple times until it starts showing video again, I hope 
with me stating this issue here someone maybe knows a solution or 
explanation why this could happen.

Is there anything I should provide that may be useful?

Thanks for your time!

