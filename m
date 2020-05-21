Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1558E1DD619
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 20:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbgEUSi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 14:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728757AbgEUSi3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 14:38:29 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD2FC061A0F
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 11:38:28 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id i15so7626225wrx.10
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 11:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LNC3H7rEKUYKmtw+FfHQGSZX2sVQSBHXnVoTDU42qPY=;
        b=JbuLznLZl83UGj+x/fv3TrhYsAe9fNCLffilc1K7DaqA3D+B14saAOvfrK+QCf2bVO
         IdXHbRkvxXsIhfUlHcmLoIANGHGoULOdn3m21jPRcnbpboq620j9KzSmlU+tregxxFDZ
         33xdGc7iUxca+LR96EHtwLNYzCgvk9Dgr2u5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LNC3H7rEKUYKmtw+FfHQGSZX2sVQSBHXnVoTDU42qPY=;
        b=r8AiJbC34Rr2N+tC8PPZHjBz0Nee3nuG0ACDdEQAJ3nnefYWULd9/9wgyWq7jB/wtM
         oipzIVrao3yjXGQODVsCGFRbWEGxuCjk9dHNSeQrDCI0wJYt8JNBk1IArpCIxTdpoLWn
         UhMUadq2U/H0OBR29o9YpaY2X3M3kBFNk2OYnMg7N5xD5QUjUuS97Ukxt01m28BIhH5w
         m8pcVEHYfmGKReZIx/gUNLWGmgzwNT9xNDfvy8D7KHq728DOacHeuiy7izYMHTF62fWZ
         xg+mVX7AsXbWho/e65XEwqcCSgiLIPqqd3YaZGxMkM0egPAiNXxU7VpXLKLOLWpz3A0e
         Mq2A==
X-Gm-Message-State: AOAM531frhCfa14BfS8yFFCJ+c23yJHI8JemvtjdY7dPWPaFA3hwMNZu
        34GL+7T1qhWjqW0S3Wxyt1PxsA==
X-Google-Smtp-Source: ABdhPJx+mMeFfjdw27k0v6HQGzNGMS5EzIHJarokhlVRpcdV62wWUZ44xVDdvCqxSbWyifL0JHBSqA==
X-Received: by 2002:adf:e749:: with SMTP id c9mr3070276wrn.25.1590086307624;
        Thu, 21 May 2020 11:38:27 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id j2sm7127697wrp.47.2020.05.21.11.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 11:38:26 -0700 (PDT)
Date:   Thu, 21 May 2020 18:38:25 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Cc:     "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "pihsun@chromium.org" <pihsun@chromium.org>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?utf-8?B?KOmEreaYh+W8mCk=?= 
        <Sean.Cheng@mediatek.com>,
        Sj Huang =?utf-8?B?KOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        Christie Yu =?utf-8?B?KOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?utf-8?B?KOmZs+S/iuWFgyk=?= 
        <Frederic.Chen@mediatek.com>,
        Jungo Lin =?utf-8?B?KOael+aYjuS/iik=?= <jungo.lin@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH V4 0/4] media: platform: Add support for Face
 Detection (FD) on mt8183 SoC
Message-ID: <20200521183825.GB249683@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <1588903371.16825.14.camel@mtksdccf07>
 <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jerry,

On Wed, May 13, 2020 at 11:45:37PM +0200, Tomasz Figa wrote:
> Hi Jerry,
> 
> On Fri, May 8, 2020 at 4:03 AM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> >
> > Hi Laurent, Tomasz, Matthias,
> >
> > gentle ping for this patch set,
> > If no new comments, I would like to send a newer version.
> >
> 
> Sorry, I still haven't had a chance to look at the series, so feel
> free to send a new version and I will take a look at the new one.
> 

Finally found some time to review the series. Again sorry for the delay
and thanks for your patience.

Some general comments:
1) The metadata format FourCC should be added in a separate patch,
together with documentation for it.
2) Control IDs, structs used by the userspace, etc. should be defined in
a header under include/uapi/linux.

Please also check my replies to particular patches for further comments.

Best regards,
Tomasz
