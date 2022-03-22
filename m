Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C734E46F8
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 20:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbiCVTzg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 15:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbiCVTzf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 15:55:35 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74246326D6
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 12:54:07 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id bi12so38586615ejb.3
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 12:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=2IFYRENq9zVLhAc0a1SnihE0GiYXSFBR+q/ert1KUDo=;
        b=FgC4D9R+eQhMUYWSU385Y5Xn7oXem72I6y3uhGx5a3YE51JGi9rm+w9m2Bhm4OE0JZ
         WLBfbWeZPV3Otbx3wj+FDBbGdsThfM056022xK4wmumaEBj+eVR3cwb4b3E6A7o6NonG
         BL83yVBcZY9Oe2FmLwlRewFbWRbvppFdIF1eA65tYUICUvn9bVa4JUqaa1O2eKqL3W1y
         aQgY2Xycbq+Tg9f9o+TmB5TfVwwtL061xB/MgUo+lYxr6aEzQxVeduSku8xTIZSiuNYO
         SgSgndlNN263D12KA5a7yfxgq46pCioNSXGXljJcjpMXbWJ0+6h8KhJ3+fm/636EJm9s
         6OHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=2IFYRENq9zVLhAc0a1SnihE0GiYXSFBR+q/ert1KUDo=;
        b=axqQH/NiYnx2mvk66pf1i6rDBsXJPrW+TrGg5CBhnRJSJwkQNkbJ9SJMWgVJJFAWvi
         PHu3S48ImosywXw/NzYzmGe4duCFE/EuAokhGMdyhMciv8sWIec2qd0ZdVvE9w9Ar0zf
         K1suBM2nBAaNUXSpFOzljR5Xbyn07FlER67cki/f3FOaHExo0U011zaG68w4sqMqGyaF
         gES15solJjOjLM3t3IJFfTi0qWEq7M4XCWcfRkqHlf5dXl4l9HJi99rbkV8d2hqWDbgj
         EfAv8Fgf+I30hpYl8OP8dRRacYavPUIY2dXOR+tmA+ySsvnRfwYIHbQlTVtrM8Fu3aFo
         KMiA==
X-Gm-Message-State: AOAM533ZP1IvuZ1+ocedPaPDQUPOntZQhwlCzY9f1KYRfiZXzQnFUkoB
        a57ZLTQ+pFX8nhOW7eTOArFHTWV16ATd+V64rarGmYM4B/wXdIan
X-Google-Smtp-Source: ABdhPJzxpP9eq0w6m848S14a1jqN8w/tFuaRAjQYvP+ut5X9X5v2OYGFY9mTUyAn3RD032XwthSzTRyBgaPNS2+hlaA=
X-Received: by 2002:a17:906:358e:b0:6cf:61dd:5a1f with SMTP id
 o14-20020a170906358e00b006cf61dd5a1fmr27790385ejb.416.1647978845806; Tue, 22
 Mar 2022 12:54:05 -0700 (PDT)
MIME-Version: 1.0
From:   Brandom Vasquez <bvasquezalcocer@gmail.com>
Date:   Tue, 22 Mar 2022 14:53:54 -0500
Message-ID: <CAAzk_gVd0fpZVH9cnsuNxUBkA68d5gdFq0Os3odi=tuQ9pKbMg@mail.gmail.com>
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

Hi, I was wondering if support for the eMPIA Technology, Inc. Masster
AVCap is possible? or is too old? (first time writing to a mailing
list don't know if I'm doing it right).
