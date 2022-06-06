Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB77053EAB7
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 19:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239501AbiFFOQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 10:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239623AbiFFOQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 10:16:12 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8FB2CDF5
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 07:16:11 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id 62so12330727iov.4
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=8+4bnTKYSEomgov0fN4WSzB8Yls69bRxwVLBV1+X8+k=;
        b=AxxqEHs4lysBpxL8/oesB4vW3/a+Zr057P6NazPrbgQP5HsmJgEs8GvtVFN9zQjLsZ
         lJUfJIJUug9ekGnWe3iwTySEHVrmddBtyZFMXlEAuVQJsB+QKsOq1f+LA7HbArv/cvyO
         WrE8sEmpunUpvnMSGQLxjqkO0KA7cgVXyDd5lbtB1uK5kNBYE6vslSAGGMH2PDcPVA/w
         XNRqiZ6KLeDrv667Fnw22BARQuIRe2Vgb45ZDwoe6/Cowanj7pqeum+bRiqFvYf1Ka9+
         uk7CKz8N9PDoPbjgMpMvJzZqE9TVkv0oZsOMwKy7KCgPx8GaqmFAszpUZEBIVRd7Imjt
         jGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=8+4bnTKYSEomgov0fN4WSzB8Yls69bRxwVLBV1+X8+k=;
        b=du6r1drn74f053bmIvEMf40xyYzLdansq5TOzRA1vgJR8/iarK8WJnMBK43u5fq5yp
         siRkCoAjVVTTcsZb6ShzMSndgIsLMn1SESBEoZJB715gnb03JZve+kEqf/S5NhQQFbPi
         vUB0AEbJm35770urp8VKC3bbekzt2aIyuRJs6qYk7kmU9fZtGx1C6NGNuqfDWpcPvo//
         wk1AaLrOcmMsULajede/+3Q8t6OQRyePYH34R2xjdkacEEz0xCHyVGdFLbwMJVzVs0xs
         GVPcMDnzZG7uPCgwUPz6T48bvv9u/UdZBOw+ngoizaQ8YyWwqPe52O0uhYEmmHVmkuQC
         ABSg==
X-Gm-Message-State: AOAM530BIzfK96Iwa6SpXvbFJDRjcy1MEeNj076YD4+VSw0Kf4H2fK0A
        XPln1QxL7duCsY7xALJXdyz3lQUphLAM7tE3Mq4=
X-Google-Smtp-Source: ABdhPJyBnj2t6bHhIPWxvY1ZdzgtR9h6Ju8aNdCwgnD3w4MhMv8YRHnrQx/FJp4Pj9K/Fh1wmNr3fWZmWUfy+c+cHqE=
X-Received: by 2002:a5d:94c2:0:b0:60b:bd34:bb6f with SMTP id
 y2-20020a5d94c2000000b0060bbd34bb6fmr11177294ior.32.1654524970602; Mon, 06
 Jun 2022 07:16:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:c41b:0:0:0:0:0 with HTTP; Mon, 6 Jun 2022 07:16:10 -0700 (PDT)
From:   Ulrica Mica <ulricamica323@gmail.com>
Date:   Mon, 6 Jun 2022 07:16:10 -0700
Message-ID: <CAOL=-jZJ79M7GPNF7H1s0ECxNvaZduOSuS-iksPrfaPoyh_=Yw@mail.gmail.com>
Subject: good morning
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
Hello dear
Can i talk to you please?
Ulrica
