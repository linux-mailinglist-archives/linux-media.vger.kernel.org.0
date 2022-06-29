Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87B2455F9D1
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 09:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbiF2Hzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 03:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbiF2Hzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 03:55:47 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D0BB7F0
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 00:55:46 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id fi2so30821226ejb.9
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 00:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=BIWfiQZuE91J2n6ksaWg698YlCIOXBkgfMP8L6Pmy54=;
        b=dLl0tYnBVeP8ihtzrRaTEwGYrVqXxeEtw+TsyvQ+OF1da1m9xCI4OYkPiH4CX80WAP
         wkb/vC0i0oEmnQ7ta/WGzn2M3e5OFlaZ+QxKzaCtvPmvEYHeGORtn3JZLujuX4jRTMg7
         jPhs0YmJjzDBE880aQ023NbdzkKQ2ruCfA5kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=BIWfiQZuE91J2n6ksaWg698YlCIOXBkgfMP8L6Pmy54=;
        b=utwO5e7nTyCUzvavXPUPnjB8iSBhqBuotJQNPCAY5A4QJzvT8wBsa6FhFAypNEc+ud
         5+0fEB58VpnV7roWzRSNDxrN2uPBnXHBndhB4b3PE2VLLttRgtpkxzjLQgeQ/12de7A7
         xAB1bInVSznLnOy9siTDaBgNYYXRiwAGa6so7f4zZRDeOeA6T6Xn26hw25CRT8Up7LOk
         asaujOfq0IOZmJSlDPcXJrLYOFIuByxOss27ThZvyhKasAL/bA4whnpslUyQFzbmi5BG
         Ju0afcIRnv0M2I0MwVKSNw41JYSZWEuP9JL2Hhsg+4EHoPkZh+Z8vbnuWcO9R2e+wON8
         3FMw==
X-Gm-Message-State: AJIora/a3dPGrezCqVhZqqqAwtqk8GFOZePtwCQgSFP/re40xNZmqMz9
        MRU43VMuXAA9iqudj0jnVJus4wG/Gyk79Q==
X-Google-Smtp-Source: AGRyM1sb6TQ/y1KB78v2hilOneFOOAy+K5VxOxSLuaxrqg3IqeES4HKMn7TDMw7/1gEH1G1KkpcEig==
X-Received: by 2002:a17:907:60d1:b0:726:a049:7740 with SMTP id hv17-20020a17090760d100b00726a0497740mr1963188ejc.215.1656489344523;
        Wed, 29 Jun 2022 00:55:44 -0700 (PDT)
Received: from carbon.lan ([94.26.108.4])
        by smtp.gmail.com with ESMTPSA id b12-20020a05640202cc00b004335e08d6c9sm10930215edx.33.2022.06.29.00.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 00:55:44 -0700 (PDT)
Date:   Wed, 29 Jun 2022 10:55:43 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo@jmondi.org, laurent.pinchart@ideasonboard.com
Subject: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YrwFf7Jw2/yDlcDq@carbon.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

	Hi guys,

First, i'd like to apologize for the noise and sending this email directly.

I am trying to hook Sony IMX492 sensor to v5.10 imx8m-mini based platform.  The
capture driver does not support Bayer GBRG 10 and 12bit pixel format, so i had
to add these.  I also stumbled upon a bug in mx6s_capture.c which, i assume, is
completely out of interest here as it's related to a vendor tree.

I got as far as sensor is registering with the capture mipi csi driver and, if
HW is properly set up on both sides, should be streaming.  While my confidence
is pretty high about the IMX492 setup i can't say the same about the recipient
part.

So here is my question: how stable are NXP's MIPI CSI2 and CSI2 bridge drivers
in v5.18?  Would it be better to switch to this version instead of hacking madly
at the v5.10 vendor code?

I've already published the code here.  Once the development is done the intent
is to mainline Sony IMX492 sensor driver.


cheers,
Petko
