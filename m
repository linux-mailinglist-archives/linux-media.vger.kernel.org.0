Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC28B4F7B63
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 11:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243709AbiDGJRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 05:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243797AbiDGJRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 05:17:41 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048755A595
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 02:15:39 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id q26so5629218edc.7
        for <linux-media@vger.kernel.org>; Thu, 07 Apr 2022 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wOZr49sb/Ny9apGippa8fdUG/E6tcaVDX+ivqlNiEoY=;
        b=OUJdfm0Skg/SevIzmzikdz6fZur6D0CXVIcupP3mXL+yxFUOW0AUukZZ3mPDZIAqz6
         oOojssy3IAFP3UuvZOjSFUnfyfVG+F2Ur+jroH3JX/9Xuqbcy6tNPI9BF6qzAls8Pyes
         O5Tz5E9oaCFqu9ZnbxNI31yVF2KMClPL1HDtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wOZr49sb/Ny9apGippa8fdUG/E6tcaVDX+ivqlNiEoY=;
        b=gZjGrYz0IuY6tb+4jRsdqMDIXin1sdGHPnHgOio2lPwXN1lGHgAnq5TXxT74pI5js5
         WCILpUV7HEIbIR7Ed6ht0CWJnh77SOX+0jk++saw5oHFaGgfYjXNv2YLOAoeUTD2P48B
         voW+/dMn1BY7o38/C+/ezuDtQYN5yheXFZTCkTieFyDzXp50Ocb4tyErkAglnVBJO65a
         Uc+lqSQYcMriAviQ/Z7yyfDE9LFZvL2rnGHrKTYCN7HyqpbRLeRe/hBoHrEirfc/ZkJX
         Ns3rLV/pNiHVrv6ovNZC/Hc9Q4SOzD7Dg4qiWwfYuAcRC6CX3EssuzT3npdrZnAehFBy
         UIzg==
X-Gm-Message-State: AOAM531MOlnPxTdmaoQDKkDsXGUX7eqPKqO9GEja94CJo1EX3zTjMkLK
        EJz34fuzbdRzs+V/cwQjxXYrmA==
X-Google-Smtp-Source: ABdhPJzmpKY3RGEMTeuwi1iMVD/SXnxu3nIwPkgnTiZcLFENqdqDVYQLLrvfFPDqAev7Uq5qFJsuMA==
X-Received: by 2002:a05:6402:5186:b0:419:651e:5137 with SMTP id q6-20020a056402518600b00419651e5137mr13192197edd.335.1649322937637;
        Thu, 07 Apr 2022 02:15:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id i14-20020a50cfce000000b0041cbaba8743sm7069038edk.56.2022.04.07.02.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 02:15:37 -0700 (PDT)
Date:   Thu, 7 Apr 2022 11:15:35 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: DMA-resv usage
Message-ID: <Yk6rt7Vpm038eGMZ@phenom.ffwll.local>
References: <20220407085946.744568-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220407085946.744568-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 07, 2022 at 10:59:31AM +0200, Christian König wrote:
> Hi Daniel,
> 
> only patch #2 had some significant changes. The rest ist pretty much the
> same except for the dropped exynos change and the added cleanup for the
> seqlock.

Reviewed that patch, I plan to do a full review of the docs and hopefully
also a bit of all the various users once it's all landed.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
