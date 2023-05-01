Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 784916F3AA2
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 00:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbjEAWpa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 18:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjEAWp2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 18:45:28 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74ABC3C33
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 15:45:15 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-42e2dea368bso1032309137.2
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 15:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682981114; x=1685573114;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p0aIhRo1dqu6oMIGp9/id7duERxp/ydaFZhLl4Qdk/0=;
        b=nimEegRCpDOKtbeA9GJI8ZoZyZ+EgiFFLXIpqbzkOGIBVZv83kDkSbeKpe5mtciL6Y
         bWqZn6Yb2nd3SkSYtnwjuwfMCRV7ppb6KyBC+mJz19cEqO52zf4m/KbH4YUzNiTaTGzK
         OuIlYH3A7bdoLsfIiJwrNETZVjGs41syL0VSd8+HPD9CfV4HjyiQGqFOq+J4TvR8VcF8
         9AnRRYUUQifb+KwEoFraMTK23wJxu+2n83QCLEG08Zojo+fnzEGh7QwjRRlqOP1gP00j
         7KLJAUfqP2RmPvf+wbjMkR+n5qx5S4x/UKTK9Pu/m3DynfOwgA7aDCYHOENreuohIOTj
         8J2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682981114; x=1685573114;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0aIhRo1dqu6oMIGp9/id7duERxp/ydaFZhLl4Qdk/0=;
        b=dwcKALzxeJqYwKM4YglQmBCXJc4A7JqDdVMjGxIiY+iftOYMtjB6lggBCp1+6TJBh0
         p3PrTgq7sqiwQxlKPjIKFQ3bU5U2huzXDPPTVH8yt+idpvI2kgCsi/lIg2syE3RKf2+F
         2BAkAuvhu0THTNRbMQw7k+Sabsi9TTI/dFroi0gTxmvbzGPFrhEsCbqPFHnZVbpSJ18N
         Mf/r5Mzq+selqC0edTTQs9Fjr99H2N6vTG8uLCQ8usA/ohY4aHMwJILiLDKBS/4epCdS
         JUiIzFvAmzVx1TL/sF0cf9hPMttHlVuZyd+Nn1+lBQpb6RqOG5U2TS2IFhEUXMdxcwUk
         Hi1A==
X-Gm-Message-State: AC+VfDw6EF9PEmqQLZgJgJKE3es36pI+inJwYBHpjYDk6d8bZFJYeXGp
        2o5b5XZVftKoxfSWpXKwOn2VyqyzsTlHUn8Hzafs12uPdKkcnKAz
X-Google-Smtp-Source: ACHHUZ7LNyCiO5Do1XgogZwEtSNGx21RzAwXmLFxj+Pr06ZXwJ/QeuJ6Y8teB97Pr0LyeHLZKvXo8H8MxFT4lbP67cY=
X-Received: by 2002:a67:f40f:0:b0:426:149c:f89 with SMTP id
 p15-20020a67f40f000000b00426149c0f89mr6202589vsn.21.1682981113686; Mon, 01
 May 2023 15:45:13 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?U2VydGFjIFTDvGxsw7xr?= <stulluk@gmail.com>
Date:   Tue, 2 May 2023 01:45:03 +0300
Message-ID: <CANUFAR+U3RJN=dmo3MQeaS+c=D8-G_z8D4OfL7pqbwkT4Q__AQ@mail.gmail.com>
Subject: CreHivi 4K Video HDMI Capture - Kernel Crash Messages
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Sorry if the title is misleading, I couldn't find proper wording for it.

Here is my problem: www.drejo.com/blog/linux-4k-hdmi-capture/

Shortly, 2 problems:
- Kernels 6.2 and 6.3 prints crash messages (format enumeration?)
with 4K Capture device (5.15 kernel does not print such messages)
- Can not capture from 4K HDMI device consecutively with ffmpeg ( it
just works fine with 1080p devices )

I studied this:
https://lore.kernel.org/linux-media/2295088.CIBgFgJDf4@avalon/T/ so I
decided to consult .

Could you please guide me, is there anything else that I can try to
overcome this issue ?

-- 
Best Regards

Sertac TULLUK
