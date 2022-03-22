Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 060124E47B6
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 21:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbiCVUrc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 16:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiCVUrc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 16:47:32 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4AE2ADF
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 13:46:03 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id c62so3658543edf.5
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 13:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=qnZcWONuwZ2JxWEjRAa5hvEc2uBZsRXgW9PaQGqrcaI=;
        b=iaz5tJfjQhdSbfzA9/WkJK3GAE2tDcmRdbZOHXD0qHYuTfIj/7esIG8t1Tj/pZGGmr
         RndFb6rgFirJTbhLf5zyT5Orl4WeurwMHprsaqw52uvWXjVIIR2aX3xeUANecA5FKUyG
         3HuGOUKMLyxNjgbsKIha2tX7bePN+qSEaF0+OjcDoG5Ch4eMWqA1Xu5YILQHVJIqear2
         EzdkPhDJFgi+mCT63uQxG311s7fyw5dPEaRyS6oDPVLWiDsocftTrrdlpAApTpwuFrQg
         OJRLP686kQAFLE4PrN7tkdoh3fr1naFJ9hhIytxmb+/SEjeAV1D6qleYMOZK9SsyVnhD
         cT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=qnZcWONuwZ2JxWEjRAa5hvEc2uBZsRXgW9PaQGqrcaI=;
        b=uI7niDgEd/wIBi4pLsQiromrxnnYr0Vu0+FzMbsdV9w3dDCEQwIKTh2lWFSX9qyMxT
         6GGXBEQrHNddizR1SsJzM6w4Tqs/CLEBfoB7uFZfLlJLwgO7gEXFgcXhSoJhUUR7lAC5
         optCmkDLUgfUmTKj/Clol0cz4DXXqLOQOGfjlhco7tq3qy2HtFhOBPL398b+v+R48ix9
         pXIsx7GvkU2yDsyAK6T6qX68mHVDIert8bIm8HKr04yQb0fQV7fP6moJETsU9r8qmO89
         d9m6LYC3W7BUYYdHo51BqlCYaPvzQ4pNYLMU4qxgg83M4NmdxF/7Pe+qgo6xjIKEMnGh
         qTAw==
X-Gm-Message-State: AOAM5316xkPIgqDGL5hSVW3ZRPsEgOMi/KWRY8eyXokbHFFiIoVysxyG
        oy0PsXDb+M+AOvlINwV/FeUIU5e2mbgMbtJtwpODtsGF4k81ZULf
X-Google-Smtp-Source: ABdhPJwx8S+EjhwqUF18HV8NCx4JvNw34IsU13iI3CqKZgVWXw1N+sW4+6CpvA/bR+fgbUlwWwjSHaf9Islq3Pmiz6U=
X-Received: by 2002:a05:6402:14d1:b0:415:8df3:bfa4 with SMTP id
 f17-20020a05640214d100b004158df3bfa4mr30369214edx.344.1647981962230; Tue, 22
 Mar 2022 13:46:02 -0700 (PDT)
MIME-Version: 1.0
From:   Brandom Vasquez <bvasquezalcocer@gmail.com>
Date:   Tue, 22 Mar 2022 15:45:51 -0500
Message-ID: <CAAzk_gU_qG+aHPnzowUdEbbkWKO_6Noy5c19dTV+3dTPsRWteg@mail.gmail.com>
Subject: Support for the eMPIA Technology, Inc. Masster AVCap
To:     linux-media@vger.kernel.org
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

Hi, somebody has thought of adding the eMPIA Technology, Inc. Masster
AVCap to the supported devices?(first time writing to a mailing
list don't know if I'm doing it right), or at least where I can start
to try to do it myself, I wanted to use it on an old computer, and
noticed it is not supported.
