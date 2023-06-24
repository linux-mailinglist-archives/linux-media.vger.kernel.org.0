Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC26B73C6C6
	for <lists+linux-media@lfdr.de>; Sat, 24 Jun 2023 06:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjFXEc4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Jun 2023 00:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjFXEcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Jun 2023 00:32:54 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EEF272A
        for <linux-media@vger.kernel.org>; Fri, 23 Jun 2023 21:32:53 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3111547c8f9so1629114f8f.1
        for <linux-media@vger.kernel.org>; Fri, 23 Jun 2023 21:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687581171; x=1690173171;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jlL8pzL6NVZbuVjV4h5KPilkuQmPMJRpXcDIhZ2tX0=;
        b=JmZTYlHwvRIxXWXVjPGsheHn/LNjGYjEXP/MlE7IevLmw1dV4QprurmGnPEA1td/sY
         7CPiS6f2WVlc8VvVX+amlT/cR+ckMFjuaNzS0y4+Ya6Fq+71v0ia8+053EorF3/sw5Gd
         Yqr/ZmUDH8/CwN4lKQWWgd5facfCRSXAiFtLWTtrJ/0Yb6UM5U4PtPucimEFmbOH0P4s
         BNGbF2bZuF5xQMZq2s7wxGzD0rskLoIZ8SCcXIa/jWlEy32tV+b+U2v6Mn3hpTzXOimy
         suKQxXiTjEcQI7kcrHNgN3jzgV9Snws8iQrneZ38LYfQY7nGKdjsH63AiIK7hohQk+HD
         j8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687581171; x=1690173171;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jlL8pzL6NVZbuVjV4h5KPilkuQmPMJRpXcDIhZ2tX0=;
        b=QH4xx2fS028JVJtIOIfK3ygPq79dL/E61MCTYV/BqULyWcJTSHiri9ajWajcjZAFnZ
         tPt5lHkxDfhSPe/Zs3ujJBktzp6dkyMx5ymyImKQo2bma/V1gBnZihAlLvjg7T1W5lgl
         kdr8P+pN5XGXQxsMCCNKgwOkxV5sekFRlBhJWxFY/+1agU+2EAS420J9vLWUlK25hk0T
         4dSbUqvKrfkXFKQ6EC9+siv72rI+ivt5bvhSawgcwjl4jxY+gn2tMDbOQ40GyE+zeud8
         dyPOs8JKd2GBItCmsN+szKIqW5adqo/CK1+ifrANx/gxQaB/da7kNbryHfBS/7tcW2e4
         88/g==
X-Gm-Message-State: AC+VfDwYY3dq8y6uqB8AyiKVbXRuisCDI3LeW8B3xf9nMiMXPGJ/nkSf
        Qlt4CHT6rLxc+9dniO6neSZf3NluRVuL81Jtqjk=
X-Google-Smtp-Source: ACHHUZ4+NHOhLsAouyT9dFdXQuWnvUyr+eK2RzlAGeLmbsU3Thlcj0qhZromZGVaFIGZi1GH35/m+my9bjvAVH1B1TM=
X-Received: by 2002:adf:cc90:0:b0:311:ffc:f54d with SMTP id
 p16-20020adfcc90000000b003110ffcf54dmr19926965wrj.66.1687581170841; Fri, 23
 Jun 2023 21:32:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:f451:0:b0:30f:c678:a09b with HTTP; Fri, 23 Jun 2023
 21:32:50 -0700 (PDT)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <regionalmanager.nina01@gmail.com>
Date:   Sat, 24 Jun 2023 04:32:50 +0000
Message-ID: <CADndTXtgCPaATzZT59tkV=D4pRRGOJgJekuX8ehRJoX7TjWaBA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibaly
