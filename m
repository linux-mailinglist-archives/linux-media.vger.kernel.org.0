Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794C64A0035
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 19:35:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343654AbiA1SfY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 13:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350667AbiA1SfS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 13:35:18 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2FC2C06174A
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 10:35:17 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id j12so5649011qtr.2
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 10:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=0ejhGzWx3KuN6toGyoNuAcAKGEjB+tNQt5hfYsRmLzY=;
        b=Dc/Q5aRQQW/FYNuWI64tLLhpsXU8U49S18ok3jtKhmPdY7qwNshd3KD9+hWmsdHbnW
         mItaNCzF0W3wTR7QZ626zWodJTt8/3plDEJ9Wye63GMlaZOTyr+TvoJw1YwNT4c8fPj9
         cnWYu7CRqvMcAZOT5ppXRbiQDJrzzYA6VOhR+/xepgyu9PelcHbZHecVcDF2xha8gbO2
         fEjiCs4Fgs5OpT2pDNAQmTUAbBJd/5OF8j0bjgtq56kzoDJA9jdKIuvz4N+q22P6yrhU
         lNzui1LSlc7Qc+NfjExJqvx9/kl/fBn/le9RhoTzbEBU3rVrTc1QYWHP2C0n5s8RFLRY
         DmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=0ejhGzWx3KuN6toGyoNuAcAKGEjB+tNQt5hfYsRmLzY=;
        b=sh1levYUrdrtfdzDFgd1fTFqzTRn2VpNQ2YeaVFzNbqKbsvpcA0GsLze339FAscnRP
         pRiCNbdbkLWj0KAl91VFmGv/F6xFOVUcxUW6C/48+RizB649zLu1tV1Hkc0MtkwDguIT
         K1V2pcsq0Ai4898yKCkIlmhIVnT7w2sUppeaKoSydomONZsnYMhI3mMZXe2uwPVINuxg
         GkAT0itu2mgvN2LFJbDkXspRZbDMqPnajV97lN6FZBgHdzOOaERKzljAYTlOH5UIghEb
         u07SPlY/n6+Aa+kXOuYO7FGOdH1ENsGm2U5f9ClpPcKGvy1l6992W2qE0SawbgocofD0
         8P2Q==
X-Gm-Message-State: AOAM5334dX+8D8a5/uGTOC1IqqqRoiWedIbuTkt/AvKjI0st19ReIn/0
        9NNbvoAPn86YHZSRAC861O/e9A==
X-Google-Smtp-Source: ABdhPJwvp0xZAHLLIXerkW19P2csCt0EFoQSNrhpfj5zjnQfu3eeiysbuUz+PTXAxMIqJgOVNtPXhQ==
X-Received: by 2002:ac8:5aca:: with SMTP id d10mr7170984qtd.565.1643394917103;
        Fri, 28 Jan 2022 10:35:17 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id y16sm3524331qtw.4.2022.01.28.10.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 10:35:16 -0800 (PST)
Message-ID: <c86506596c9126da6f2df02eb6680759064774f2.camel@ndufresne.ca>
Subject: hantro: g2: Does the postprocessor needs 32byte aligned width ?
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Adam Ford <aford173@gmail.com>
Cc:     "jernej.skrabec" <jernej.skrabec@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        kernel <kernel@collabora.com>, Chris Healy <cphealy@gmail.com>
Date:   Fri, 28 Jan 2022 13:35:15 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

Jernej and I had to deal with user report which show a stride issue with the G2
on Allwinner H6.

https://forum.libreelec.tv/thread/17565-nightly-images-for-a64-h3-h5-h6-and-r40-boards/?postID=166086#post166086

We quickly found that the stride alignment set to 16 needs to be 32. Though we
noticed that this is only needed when using the G2 postprocessor (NV12), while
it worked fine with tiles (NV12_4L4).

We were wondering if you, or anyone here on the list could test this on IMX8MQ
and IMX8MM. We'd like know if this is specific to the older G2 on H6. To trigger
this, you need a video with a resolution like 1552x1080 as used in the report.
We can help you get one if needed.

regards,
Nicolas
