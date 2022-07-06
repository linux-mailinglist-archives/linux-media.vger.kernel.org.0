Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3AC556930A
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 22:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234369AbiGFUIA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 16:08:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbiGFUH7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 16:07:59 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841441EEF5
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 13:07:58 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id r18so20604377edb.9
        for <linux-media@vger.kernel.org>; Wed, 06 Jul 2022 13:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Um3IlpVEoVCWOCvTslk/lIJT89DuE5v2e3ABcMLxH2M=;
        b=G7oVfFnrCGv7p6NuTL8+ATTZ5xAgUgOR+pwrzQ2QMjsjMivhqt5UiTJatGKUrRPRI4
         4JopXmMHFIv6FX4YuvSd0SG0gHrx7eHhcNhduC+Hikvu2Zdh931n+IqzJgunFQmWNm2Z
         7T2YSQawqkwVQVR4kaY9KqBf9W/m6G8EUHHco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Um3IlpVEoVCWOCvTslk/lIJT89DuE5v2e3ABcMLxH2M=;
        b=0gppUBB6pADtz4DUoHG5p643OyhmI9RNaGI2RJKkYHOHEb5CRFczJS4ZutN5axEiLI
         P+04V1JGJ7miKjl2tBEVs5ZQoFp85x8pLEQvuWd3/jHrg67TtH9XsqPwPvD1QQmhPlST
         82d3m1tYezMR0h7a8p4WGoW4MiY7rRrGmaMri3pmt5PUOY1bzmOcU6AslEFe7m7wIy36
         ZfbIzuoFbYG1QGCJzboLjG2E0nn5RYbaDz0GDNOxNr7DHiomfE8g6tCaKMfJTK/BU878
         OEHfdJ3kopAl/S504JArGhCxze6hoXt4NBSWZBO5XJpQn14JdFYD/lJC5s45bvpi+CEK
         /CIw==
X-Gm-Message-State: AJIora8SZmSa6qEKlDr13IPjKRbUojLo5ZEi6ixNyJIjW9u2U2rOhVp7
        JtpBbLyXHs6BEur6a+FDvgscIw==
X-Google-Smtp-Source: AGRyM1vdl95l6zaytXGOucykYEHp1UsrFRVP1weNNaKtRKor3NwbZ2HccPDTrogIuyG/5SisQFtZDQ==
X-Received: by 2002:a05:6402:270a:b0:437:63ea:f2b5 with SMTP id y10-20020a056402270a00b0043763eaf2b5mr57674749edd.33.1657138077102;
        Wed, 06 Jul 2022 13:07:57 -0700 (PDT)
Received: from carbon.gago.life (78-83-68-78.spectrumnet.bg. [78.83.68.78])
        by smtp.gmail.com with ESMTPSA id u17-20020a1709063b9100b006f3ef214e13sm17685626ejf.121.2022.07.06.13.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 13:07:56 -0700 (PDT)
Date:   Wed, 6 Jul 2022 23:07:56 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YsXrnJ+sTPztWR2A@carbon.gago.life>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <12352558.O9o76ZdvQC@steina-w>
 <YsRVAV8a48CwpaSY@p310.k.g>
 <2450654.irdbgypaU6@steina-w>
 <YsWJBEPhp9WhiYe1@p310.k.g>
 <YsWTXnTpeM+mCImc@pendragon.ideasonboard.com>
 <YsXh/arQZXnaeGAi@carbon.gago.life>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsXh/arQZXnaeGAi@carbon.gago.life>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-07-06 22:26:54, Petko Manolov wrote:
> 
> VID_MEM_LIMIT is only 64MB while the image is ~90MB, but it looks like four of
> those are required.  I increased the CMA to 640MB, defined VID_MEM_LIMIT to
> 512MB and got something that look like it's working.  I am yet to convert the

Forgot to mention - with debug disabled vb2_core_reqbufs() would trip on line 829
WARN_ON() and dump its guts.  With debug 'on' this doesn't happen.

Not sure if this is the intended behavior, just mentioning it here.


		Petko
