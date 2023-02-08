Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1B8668E924
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 08:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjBHHjR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 02:39:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbjBHHjQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 02:39:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46A26E90
        for <linux-media@vger.kernel.org>; Tue,  7 Feb 2023 23:38:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 151A5B81C3B
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 07:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1177C4339B;
        Wed,  8 Feb 2023 07:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675841903;
        bh=Eh1Qhxbv89N9hnay9RF+92zBKi8hIE4t5S58btHtnVM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WwTef12C93slqocOcrndu7Zq0Kj7LQfvwaOdK4fUTug9pUbeMdaFhVu9fqyL1K3rD
         4MdBuGYnEeUUq1egSi3UmILXy39qdo+SILEkFNfNi3mj8vyoksgV8tXzLyuNPUcr6w
         T0sEdd2ooNlD/SFCVj6Hj5ADgdSjHGCB7gq8TUyj6Lpj/dEhnZLkORF7vf5fVWV2VC
         RMekIuPPxPVg+fZNYDdFA8rWiXZTIePhlosnscelYIEycxqyDutNxByqYW8+Nnif8x
         CyYM/esQes4RXojSIN6wH2gqpM4kg5/GHDjcV6vpItoW2wvozo0neIgutqUAhMztvu
         tKSywzBUSPLFw==
Date:   Wed, 8 Feb 2023 08:38:19 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>
Subject: Re: [PATCH 10/17] media: mediatek: mdp3: replace return by goto for
 proper unwind
Message-ID: <20230208083819.4365b97d@coco.lan>
In-Reply-To: <20230126150657.367921-11-hverkuil-cisco@xs4all.nl>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
        <20230126150657.367921-11-hverkuil-cisco@xs4all.nl>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 26 Jan 2023 16:06:50 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> An error was returned at one point without going through the
> goto label for proper unwinding.
> 
> This fixes a smatch warning:
> 
> mtk-mdp3-comp.c:1005 mdp_comp_config() warn: missing unwind goto?

This patch doesn't apply, as the logic it is meant to touch
changed a lot. I'm simply discarding it from your PR.

Please work on a new version if still needed.

Regards,
Mauro

Thanks,
Mauro
