Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB925438CD
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 18:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245138AbiFHQXV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 12:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243257AbiFHQXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 12:23:20 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819E83EB92
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 09:23:18 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id h19so27844971edj.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jun 2022 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6bCnYfpH8sQ/d9koSZ6dyy2E2YkGKvI5sdpoF1AgpaU=;
        b=F6dUFiJlf1k5wV8cjjyO6RZGdS+iHk2ORzLe40efnVeQBaTLW7j9Z0+eL59Dat9/TQ
         myfdWgiVx7IuDCzUSKEx5pEpu5atQ4YOldHrxTOZdNY8sQFeS0sonbTcsFMwU0LlNSLX
         oe9gcfdfPzROpdVLhyY9+jfmfnljdUn39rWNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6bCnYfpH8sQ/d9koSZ6dyy2E2YkGKvI5sdpoF1AgpaU=;
        b=IKr1ez0VWqjz7Ox1K4+6r/6Jq8MbxZuzAu6txrFTYq/LMuac57OuifmNUbgxgCexlP
         mP5WbNTuoFSOIQD0ZyxgaTKDHwY5P0VoQ/3EnVW3LRPCBFgRr48mafEZvxWAB1phAFvc
         oaJKS/Lc6KMsUxB0dlPpu+QfkNcwtOYiQtAKLFpUeFU4/O+G81tnAgC2bAW2fDE8V2bH
         y/Qz15NXGaKP3DTPyAOWltRgp1GF3RQfq31WMf3kpfcxj/1ER94XGY4RsWrJoFIlTShs
         5ig/W2eQ6bhBb11XTZIWWqQ2SYQieMEMybgZwgdHfADWtbLxbMngItSCVmOC7nQAL3fX
         dw0A==
X-Gm-Message-State: AOAM530/mXyEXhvhkSg0UsWl3Z1T3/G5ehO/FCPmG4qnpWG1pGDbHbzC
        t61YQXyNj4/QbmBLD+78sO4Lluj9/QVisg==
X-Google-Smtp-Source: ABdhPJzg4/fByYj7uFrLx2SbQAjAT2zfZeii/3+4vsEXTOld6eua8j9uZn8+YRT5K8ZIpvkIVou0tw==
X-Received: by 2002:a05:6402:35c9:b0:431:3b5f:ecc1 with SMTP id z9-20020a05640235c900b004313b5fecc1mr24194559edc.349.1654705396951;
        Wed, 08 Jun 2022 09:23:16 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id m26-20020a50ef1a000000b0042bae6fbee2sm12475008eds.74.2022.06.08.09.23.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 09:23:16 -0700 (PDT)
Date:   Wed, 8 Jun 2022 19:25:34 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Subject: Re: imx492 camera driver on imx8mm
Message-ID: <YqDNfiSZgRcVjHrn@p310.k.g>
References: <Yp5lIHTt/NhgHNGm@carbon.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yp5lIHTt/NhgHNGm@carbon.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

	Hi again,

As continuation to the above, doing:

	gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw,width=7408,height=5556 ! autovideosink sync=false

fails but does not crash the kernel.  OTOH good old:

	v4l2-ctl --stream-mmap --stream-to=/dev/null

inevitably kills it.  Does anyone know WTF is going on this good old i.MX8MM 
platform?


thanks,
Petko
