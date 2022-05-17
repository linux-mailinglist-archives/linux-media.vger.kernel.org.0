Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C6252AEB3
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 01:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbiEQXfX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 19:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbiEQXfM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 19:35:12 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D06527DA
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 16:35:09 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 6D1E0240026
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 01:35:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1652830507; bh=90A0CO5Lx8M0gs+ouG7L9ZA1Ie2CIwadK1cEQiKc9oE=;
        h=Date:Subject:To:Cc:From:From;
        b=p5GNqI44b/paQllf1Ui9uX378cRwWASCmhsuCtMSODdH3gmapmNHeYd3ASVtp8p58
         phTVU40+2+46u7eMAT0RDcnlxuRVEoQn9oZbSxOn+vreSXUZo9y/xxyHOnsftxdBqI
         K+R00krrTEXCsZYEEFABImcSyFyn+1ighPFQAekVz4Ut6ccHt/gQHl33mfwJTZOF7K
         +vjlT61uWLCSBpuOIqXNs1egsjwxD+rI+o3jZiOzQ5eVRmlWHerkfhAxNo7ZlSUfAE
         5jLZb3Rbtho3scwdx5px9UxmtEXOqxU3cUi8ckrN5twdgph1Sf0YBDQfGQE1u95mLe
         NU6l/+xBc0F2w==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4L2st25Pxzz9rxD;
        Wed, 18 May 2022 01:35:06 +0200 (CEST)
Message-ID: <7412d089-1276-5fda-bfb6-ea90a6b5c15b@posteo.de>
Date:   Tue, 17 May 2022 23:35:06 +0000
MIME-Version: 1.0
Subject: Re: game capture usb device stops working
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
References: <dc489dbf-fbd0-db97-009d-df3eb94860fb@posteo.de>
 <YoQv1CTNTInprDXd@pendragon.ideasonboard.com>
From:   =?UTF-8?Q?Alexander_Wipperf=c3=bcrth?= <wpprfrth@posteo.de>
In-Reply-To: <YoQv1CTNTInprDXd@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Laurent,

Right now I have the following scenario, after re-plugging it in for 3 
times it started working again as it should, then I changed the setting 
for Video Format and I get the following in the kernel log:

[15207.692208] uvcvideo 2-4:1.1: Failed to set UVC probe control : -32 
(exp. 34).

On 18.05.22 01:29, Laurent Pinchart wrote:
> Hi Alexander,
>
> On Tue, May 17, 2022 at 08:34:18PM +0000, Alexander Wipperfürth wrote:
>> Hello, today I got a usb capture card (Elgato HD60 S+) which is uvc
>> compatible and the first time I connected it to my computer it was
>> immediately recognized and the video from the game console was displayed
>> in OBS, but when I change any setting in the configuration menu the
>> device stops working, no video will be displayed anymore, I have to plug
>> it in and out multiple times until it starts showing video again, I hope
>> with me stating this issue here someone maybe knows a solution or
>> explanation why this could happen.
>>
>> Is there anything I should provide that may be useful?
> Are there any messages printed to the kernel log when this occurs ?
>
