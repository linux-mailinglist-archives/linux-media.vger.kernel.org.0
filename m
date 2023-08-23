Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604D4785881
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 15:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233770AbjHWNJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 09:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjHWNJv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 09:09:51 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1551E4A
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 06:09:49 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-26fc5a218daso75411a91.1
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692796189; x=1693400989;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s+85iWZZtHxiRTzxqot4mUtWjRMblOX+5DmPEvV7v+k=;
        b=Oe+XR5+sO1+EoHsLdJFyEgt6C19sa9KTwbe2hDpLnsRgH+KAPxsniTykviaVWjKk2J
         mb2ByCykwFLlLpkN/266yvw5l7CLt0X+f8LyRxzCnDScrjAUKxV0QV247Yxc4cH3UB+r
         4VmZZ1/uyhOeCgEE6XQyb/mNnD2jSBKHK6M/KDMHEmYNtz8iwbhzK/Z38n5Q/JQKvWgJ
         si+fTh3S7SXQ0xBCRenKpxs2dGePEWHSYVpxs4RMEY5buTQj0fr8hZO6YSgaZLUpCj14
         ynN0VOGdMhNZ6m2MIUWIRRXlyKeuh2goz30liegygS2OvewV6coKwLAsOdG6PxEqBLiF
         3zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692796189; x=1693400989;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+85iWZZtHxiRTzxqot4mUtWjRMblOX+5DmPEvV7v+k=;
        b=YeT6/KcmrOxj7AO4ZyWBow/JEFuar7rE89vI7pg+oRutItWEELIUS1ooZiT6xPp1zC
         IrcFAlRbn6kqfXwUMtGZnMsKvB9hPLGuVXN0n0yYcyGOmuMU4XGz+C0YoVV8aK5ozBCa
         VhziuDU5F6AWQNQw7s1Zv8TTvVGBPTUFuSt8pO3YgOJGl6OEDXQy1XkNalomYCpLc9+J
         BfKCDbxuNK8Ohw/LEv1Egi7Lc1xm1z6wvEsqoEnCe2nsFu23jhJSFuyeBK/lXV7e6zc1
         PgnHhbdp+SYxE0cS5wgBsF87VGT0Oj33M6fXcwZckXvit9t4vkMyLX1geOgPTE3WcsfO
         P3mw==
X-Gm-Message-State: AOJu0YwBgRhntRxBg/0JefUVJ2fhzDzYRGClGjAG7yIWCXoQuU/ZvHt4
        DzMqkGovtzUHziZTafUF2SYJ20pCd+U++Y4PzaM=
X-Google-Smtp-Source: AGHT+IEWX0mDw6pMFkD3xnYrWw1pAUWy/JHQth2wGo+uFHEKmVBkGVGXPP0ErcxeQr+WLk4x8nLZTqg8jaTpy0I0/LM=
X-Received: by 2002:a17:90a:1d08:b0:26d:2fab:1e51 with SMTP id
 c8-20020a17090a1d0800b0026d2fab1e51mr9270520pjd.21.1692796189310; Wed, 23 Aug
 2023 06:09:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7301:e0f:b0:e3:28e1:d7c9 with HTTP; Wed, 23 Aug 2023
 06:09:48 -0700 (PDT)
Reply-To: fionahill7364@gmail.com
From:   Fiona Hill <tinaevan102@gmail.com>
Date:   Wed, 23 Aug 2023 13:09:48 +0000
Message-ID: <CAFCgZRsDEVQbLfbg0qwtqnAzUaMBC=qWfCF=c4hZun_RHAjH4w@mail.gmail.com>
Subject: 
To:     fionahill7364 <fionahill7364@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_99,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

44GT44KT44Gr44Gh44GvDQo=
