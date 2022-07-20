Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC80757AFAF
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 06:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbiGTEE5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 00:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiGTEE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 00:04:56 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34A861737
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 21:04:55 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e132so15303799pgc.5
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 21:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=X3lPFzopQ80LHO+2XKoDXvN8z8W6R+5JHHNXPfbd/e8=;
        b=LJPudTY/QbpVH1NZ3XJvvoCJ/ttQEJIVmPG8H7x13Ko4jfZWldISKhb5BBnBtnM7bU
         vut5b4pY5SRJxx0ypfQG5A24sOKeByahXJ8DY9mi9Avjm4yiRqgvwlu7WkiQIzZUnZO+
         HMIGDKm7bH8fpcIelVgUCO1dH50JVHR2CbbivalwbHWM66jS82EZblZkHVtgQ7wpQUi9
         y1EF1PyxGNDGw7jUiko7VP/IGdESBqueAipIi7Crb19jw8XXg7PSSyQRP14mI5kZaPE3
         0GXTJV5vgUqMzftcIIkzahzDvHF7xvcq/2OnUTm5hS0iV14X0Nfm6jgpugsVJ83nuHtH
         Mung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=X3lPFzopQ80LHO+2XKoDXvN8z8W6R+5JHHNXPfbd/e8=;
        b=rJyXlZlS+xNN1WpGzOHXXltBL/9uvsruZotvSh/d91M66Dc1/4P+al4e6hOcTTbH+K
         AZnx8rdTaU7i/5UUnxpfNaTENlytlDo9Zl844EYZNt0jrGFAdAhf8uUbymOgGKBASKTS
         PXfbDcYIorKp9FIwWfwGMFsBvxHSv84+vNnXbhLs1XnFcamVSwoyRq7e24Z3sFde69N2
         Ik+F9ghC/ttMjbw4tahWwemqTn6Ga/zB19eDnblBosCR2GNTtf2VFFqvx7emzw7w1yOu
         x/DF+AW+rcE0XqNl9K0FBtlSJJCSPxCbxbX6rIouXiSdxvLQ9BvLhL27zKyBthV0jFwd
         UIVw==
X-Gm-Message-State: AJIora+uuzB8e0FhY5oo6VuojzwrIZDJ2/0RhNG0KTdNHHvZnhh+PRnU
        ZP0fjZs+YslomTr4/NmJOVHig33vg/cdq6OadhZLHOcJEXCJYGP4
X-Google-Smtp-Source: AGRyM1t80gNT34tirpvFbEi5J62r/qHk4P6bBS+zq4rq2dZlwqA5CE3ux+iEQ3aXxI0ZMj7htd5u1C2oCdL038SatYU=
X-Received: by 2002:a63:e217:0:b0:41a:69b1:a68e with SMTP id
 q23-20020a63e217000000b0041a69b1a68emr197497pgh.428.1658289894979; Tue, 19
 Jul 2022 21:04:54 -0700 (PDT)
MIME-Version: 1.0
From:   sanpe qf <sanpeqf@gmail.com>
Date:   Wed, 20 Jul 2022 12:04:44 +0800
Message-ID: <CADi8-=roRNcoiYvhAHxoq9JVpZPOSrhH36=UGqNfRh3Cxu-zJA@mail.gmail.com>
Subject: 
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

subscribe linux-media
