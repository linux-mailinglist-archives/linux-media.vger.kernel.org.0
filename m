Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C906E57BAE4
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 17:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbiGTPxw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 11:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGTPxv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 11:53:51 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3F74BD18
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 08:53:51 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n185so11126873wmn.4
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=48fj8+SEYseTJxEMnEnTvEGFV8gDAw0PWcc7VlH/EIs=;
        b=ddyi+dka3ecgLJQbTwR2E8Amafus9lYfV73N8wz5UjfKf+XJjTmooD3yZhZwMSO5Y2
         Z03PzUnlLDRn4cyHXeQhjeXmjQCg/8++Sfc3YsAEDqKHeD7thFuNMDNAotGhCsroa4ml
         NBtkJhWp8Tab5D/qKu8ufhuE/Y6Hgh4qISorKcHJi98kWh2RjkIJMzvOLEeT1DbVO2JL
         HO2CgWb6O7+WS66E83OsqCrU1cDLdYIDXoVP6LsawOCtcjv2gFLREGvNITSkAk8ow7kC
         D6iJcrrMcbvv7FHC/mR/dLeVLpgXN0Chx3k2ijcQGjzf67ksdKrY9Yc1KCFVTMz8aM4/
         5rWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=48fj8+SEYseTJxEMnEnTvEGFV8gDAw0PWcc7VlH/EIs=;
        b=QrOPuYy+8rzKC7Lk9nboTdUgnyGX45K65fA1vuIuuWDZ9Omfha82Kpe2wn6lQsYUp0
         Lu3/XnQOmmnan+1omFQgjcDLlbHRA9vUbIN2QTibFZnyi2WhC6jXNceu4yBTgNUK3Ome
         kXcCzDk9mpu+yXvCPaquDX8lFksSJQJ1j40RARmClmnPixT4CsGEyT4KgMXOjA85vC2I
         q252lHb0NsTqfkEOiiIIQ3ScG9fPwGVDO4eYCEEq9+olZDjmPUB3qJVtCnjUacEb15dg
         E1cXMXVEHsvIUrYwLmdvMYxpKsTEcnhpbfZIeterTBBIAYL/PbwfkdD+pVDTTNHyB5HW
         cjMg==
X-Gm-Message-State: AJIora9i2YdaH2PC2P/QwN2BqHwanELrM1BPW6jQfv1hS5MHKgLWdggu
        oFb81PoBiYoFLGWqfYIBOA/jrHXF0UKIZR3wgqE=
X-Google-Smtp-Source: AGRyM1s3nNOQ2EAh3HuWsAlpgHXiuECjIr2V1uJkjfET/BezcYZlvQumrf5vxzQqtExC2WsZNkBrgSDo/ENXleH2Vgg=
X-Received: by 2002:a1c:1901:0:b0:3a3:1be3:4df2 with SMTP id
 1-20020a1c1901000000b003a31be34df2mr4584726wmz.146.1658332429678; Wed, 20 Jul
 2022 08:53:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a7b:c404:0:0:0:0:0 with HTTP; Wed, 20 Jul 2022 08:53:49
 -0700 (PDT)
From:   D B <kosdav71@gmail.com>
Date:   Wed, 20 Jul 2022 15:53:49 +0000
Message-ID: <CAN6u_H_MwigBFN1hVe0haV-pZgCQCEUUfG0GtnouJF4AOVRfxA@mail.gmail.com>
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good Afternoon,
Please am still waiting for your reply on the mail i sent you yesterday
Mr David
