Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C96B581A5F
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 21:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbiGZTkV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jul 2022 15:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiGZTkU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jul 2022 15:40:20 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CA75FC8
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 12:40:19 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id AC4691B00238;
        Tue, 26 Jul 2022 22:40:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1658864416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=skgf1BirPSJEDNoBpWdf+Db9GqmrHe/NWwnm+f66rZE=;
        b=f9FxmlKApO3OqOauFZzrLoszqc+GHInz2mCRmaELxfMx4FqhDjrjiKab5HMW74H2Wj0Fsb
        VF2U8yx8vfQzv3fZSxCBIKrjwVEw2mFxWocHrB1NYyDis0dcV6RoeV+MWFyuMErJHQ3Vjw
        gUJPXVtuqAwCwf/SagZFsYi3p2zGP74H0uwnazcmCe/r5v1G82tKtE5IH5A4NZC0LVmxPa
        NUx98q0P/J/7cavS4p03IFc818q6nrD816xlRrO0PGmWCyM3u95G/tgIwLjIlhYpkcJQwP
        E9ew8lcLYhSrpEQwXAqHrZpUruJDB311injAzr6qwKc7kNlToLnzeW8YoU8nMg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 49633634C94;
        Tue, 26 Jul 2022 22:40:16 +0300 (EEST)
Date:   Tue, 26 Jul 2022 22:40:16 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Helge Kreutzmann <debian@helgefjell.de>,
        linux-media@vger.kernel.org
Subject: Re: DVB: Unable to find symbol m88ds3103_attach() [Kernel 5.18.13]
Message-ID: <YuBDIEUokV5vxD6n@valkosipuli.retiisi.eu>
References: <20220723155707.GA17564@Debian-50-lenny-64-minimal>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220723155707.GA17564@Debian-50-lenny-64-minimal>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1658864416; a=rsa-sha256;
        cv=none;
        b=YZNGf61AfulbUtjVp0o5TlPHX2KFdJSHPAz5OlHtN8/ZgckhyGRUnqZANw21KFtBKEoi1v
        VRE6VFmzr6Dl971pPhj5VmxFfJd6Im6WZJ44AOKzgtn/4nMYzx+lbvWRzI8qcpWKtMF/nl
        erRAZVGbiB4dQrLL/cVPFnXie3PqPE2JWP7GTY7kjcBpxhmqhWsjGVQ1WluvrrrrPKzasT
        qQHR/n1iDS0QcIdF2m4oABmi4JCO5nKu5sT07CyOG1KSmrt4TXgvVcprTQ89xbS1Hd0akB
        PKVREBTIv7x/Zg/p42H/96+0Al5rvCXRbIq3PMabMHPKxHc3NwjB705ZSkqylw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1658864416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=skgf1BirPSJEDNoBpWdf+Db9GqmrHe/NWwnm+f66rZE=;
        b=WhTQ1/ZDAHZL77YghvWc8gxorFzHRQQf3PbgRc1CpS9ztLqSgyUPeBCaE1nJxvXojG0HWc
        FcusWCcEAnUNx7IWO4JE5Q77Fu6XvVKEDBGwLJwRW7iDbHE/Df8hdUxDkbfa9OwUxyxWYh
        RHNImhG23HMoykPncNfDTrPEWzCWM8b89zaN/ShOlHK6B9bRIDh7QF1o/QYWkldyFYF0+9
        H+VkmbD3Tws/JTV3fTDo5zlxkch97vRbFQcUBX8KUvOCBLH+J22AhUimHk49Vm8FvpLUqM
        5J54f5Qb+OQb2/LtgZXF4ysljijQXTcpZaETztxMQe+UW4UrGT3q9zIXVTKMdw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helge,

On Sat, Jul 23, 2022 at 05:57:07PM +0200, Helge Kreutzmann wrote:
> Hello,
> I want to operate a Hauppauge WinTV-HR-5524 HD [1]. Despite numerous
> attempts / searches /trials, I'm unable to get the sattelite part
> operating, I always get (during boot):
> 
> Jul 23 08:37:19 twentytwo kernel: [    6.632755] DVB: Unable to find symbol m88ds3103_attach()
> 
> The full related boot log is below [2], I can provide more additional 
> lines as necessary of course.
> 
> I listed the (related) loaded modules below [3], again I can provide
> the full list of course.
> 
> Based on grep'ing through the kernel sources[4], I also modprobed …
> but this did not improve the satellite detection[5].
> 
> According to the vendor satellite should work.
> 
> I can provide more details (also tried applications, ..) as needed.
> 
> Thanks for any pointer to get the satellite tuner working!

Looking at the problem, I guess this looks like something that shouldn't
generally happen.

Have you tried removing cx23885 module and loading it again? It would seem
lake in lsmod listing the module is there but somehow the symbol isn't
found. I can't immediately think what else could cause this, than not being
able to load the needed module when the symbol is looked up.

-- 
Regards,

Sakari Ailus
