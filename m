Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C33E6873D4
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 04:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbjBBDaQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 22:30:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbjBBDaQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 22:30:16 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0AF24C9D
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 19:30:14 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-50aa54cc7c0so10365087b3.8
        for <linux-media@vger.kernel.org>; Wed, 01 Feb 2023 19:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0W4WklHHfSoXPv06aWPHpJEIJGtCmBSW1y9VXoLBaE=;
        b=PTp58QmGHtu99yVo+eEk/y5K/shKJQDaQKW7qm3ldqrFMilv5nh5h1a14lg8YAJcOJ
         a6Fdvq5cr5+HecbTUH1mc5zC8PDtvtjrBkX2vm2TPttYxp2JClDv5mBKR4jaMuMOY+ir
         HrjRCNpp3klkeE4D9757tCrcPg1L7cMMaW7m/YVeEw11LPTFgHaBj0IXsOuFW1U0SoPG
         hzEffbPGl7iMJeukcY6qPZ1OEIxOhOugFfXPDU4i/F2GHfSJh3RE8tl0yNpcIJ9HA//p
         Pup2AG7v8rYcoWrY6YJuGBRVIIZjvsm6pyHqGbFqGE+hMRqwIqIzwYYYWfbNec09R8/U
         IUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0W4WklHHfSoXPv06aWPHpJEIJGtCmBSW1y9VXoLBaE=;
        b=JKusctSwb+CbY/BzjLVg4q8I47jIU1kgyOCm2fqcXRJx7iajxIvYcyHNKsl2YBmySu
         4HNB5yZdW2/gvKnnTi0nAmiYdu+6XWUuhsmNdfoOuD3svkHnxs3Xnt3ekVa6ESrKLoPx
         cKnH0wNh6IxSem9Z5ir91vUxBkCAqYyB9xyTQBItp7XiIqyHLvzASOWCeymXRze6Fd9e
         btL9DYIhWIHXzE5oZGGvJVNoIAIZXpHDDdCJH1c4xSFQbKMjQ6nK+XKQL6HDllKN6E+S
         ZcNG8mdW3VVJutGR/QwumwF4dPXIt03Ldyf/vYmzu3hlc4iKBU+2C06H934/i5OWJnO3
         eiUQ==
X-Gm-Message-State: AO0yUKWTzcxXClYYdx2YGzJMVgTUnW1dxcg4tvt6/b2gepEKRz2uNmEX
        GhZhA011I7mkxcWmubmsf5/HgVr31kqws5aIKkw=
X-Google-Smtp-Source: AK7set8ol/76IIEuYYuKFmw3dgFwB52ketzx3GyzMkYzHC6cxhJ1QGg1K+OVv+dA0XK1uzE/5ugiBgy4xpBdnsZ3OOs=
X-Received: by 2002:a05:690c:987:b0:510:c8d0:383e with SMTP id
 ce7-20020a05690c098700b00510c8d0383emr512588ywb.48.1675308613371; Wed, 01 Feb
 2023 19:30:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:50b:b0:465:6c65:d8ec with HTTP; Wed, 1 Feb 2023
 19:30:12 -0800 (PST)
Reply-To: stbzan@gmail.com
From:   Sheikh Tahnoon Al Nahyan <ak2424939@gmail.com>
Date:   Thu, 2 Feb 2023 04:30:12 +0100
Message-ID: <CACPxCnckqT_LpaMeNALV+_C7p-8iVmj=+kbP37WjNHetKKFwFg@mail.gmail.com>
Subject: Hello sir
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
Shalom,

My name is Sheikh from United Arab Emirates, I want us to be in
partnership in business deal.

Thank you.
