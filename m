Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C98F4D34A4
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 17:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbiCIQZ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 11:25:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238175AbiCIQVb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 11:21:31 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33484A278C
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 08:20:06 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id qa43so6119017ejc.12
        for <linux-media@vger.kernel.org>; Wed, 09 Mar 2022 08:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KFt0Aj3/gXHUCz4dElk3edicceyKwBTKcXLoDwythKs=;
        b=maYSac5LFltun5TECyK2+iW1GicBXblo3N+eCbQ71y6u4ZTX3IdaLSSKVJB/B3/mq7
         JbOp7gub1iLVw+tlFmTc20n+PSkUPMF10ihVXvwdRVi50n0mAxjPtXu5CmQlm9sPUlUq
         u9sLYOJaf2YdfqwUmSx89mHv13iB18M6ZncRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KFt0Aj3/gXHUCz4dElk3edicceyKwBTKcXLoDwythKs=;
        b=QLWtXt3bpDAsaT7GK1/TXWukR8vGU2Cty8OHE8G6YZjFpzhjURITJ3D/kFK6+kmN7a
         V8ARBjtRhcl6NYkf65VNRG3KDgzNMQttjC4N+FrTKvx2pVBVPX/CwXnd57e85/g9DM4I
         +WUs+jPWmADs2l/h0M8vkD5BKgUrgMygEQnR7QvFkDmnCAHM2PiWtTZf8/ycMFnrSx0Y
         Wd20xB1HVC5R6UyKS/u7oAseAAaOeZ70yV+HQVoJGdTTRu1WOz+yjheD7LTxdoq+ZDri
         h9k0qtxwlRZ1l55DS9BQdt0tD/yYSlJgKCxmbiJ1xtQg/Nuq2rSj2O2ORMjbigki1mXi
         cxBA==
X-Gm-Message-State: AOAM533KSgLWChE+mx9AXijBL1YtQQQ7VHugg3hAL4lj5PDM1Y4m7V87
        tmoANtV/l3AYw1MLo4BYD848TJfKOmxA8Q==
X-Google-Smtp-Source: ABdhPJwoU17aJK87cXY7MAydzPrTR7U7DxpgEd6/5Obnwt2yvL9CBI692ptxG+lDuT191ihDGeCREA==
X-Received: by 2002:a17:906:b56:b0:6da:f8d8:aaef with SMTP id v22-20020a1709060b5600b006daf8d8aaefmr485003ejg.67.1646842804783;
        Wed, 09 Mar 2022 08:20:04 -0800 (PST)
Received: from carbon (78-83-68-78.spectrumnet.bg. [78.83.68.78])
        by smtp.gmail.com with ESMTPSA id h17-20020a05640250d100b004162ee0a7aesm989889edb.38.2022.03.09.08.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 08:20:04 -0800 (PST)
Date:   Wed, 9 Mar 2022 18:20:03 +0200
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: media: add ovti,ovm6211 bindings
Message-ID: <YijTs+wlpGRuP5hJ@carbon>
References: <20220309102215.891001-1-petko.manolov@konsulko.com>
 <20220309102215.891001-3-petko.manolov@konsulko.com>
 <20220309135904.GA2790178@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309135904.GA2790178@robh.at.kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-03-09 06:59:04, Rob Herring wrote:
> On Wed, Mar 09, 2022 at 12:22:15PM +0200, Petko Manolov wrote:
> > Omnivision OVM6211 MIPI CSI-2 sensor bindings.
> > 
> > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> > ---
> >  .../devicetree/bindings/media/i2c/ovm6211.txt | 49 +++++++++++++++++++
> 
> Not sure how you got to v5 already, but bindings must be in DT schema format
> now.

Easy, the bindings got included to the patch in v5.  Looks like it's going to be
yaml all the way... :)


		Petko
