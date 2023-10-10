Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3057C4430
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 00:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbjJJWfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 18:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjJJWfB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 18:35:01 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF9B98
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 15:34:59 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-533df112914so10310504a12.0
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 15:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696977298; x=1697582098; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsgV51zgbck/VovoDZq2ZYI93jFFVuKlVa93/gzxY58=;
        b=iRBkHug4MszB7pAGoLZiIgyEa8R3CglKnu43rYDwQl/PVcVmxhu+qJ0k0F0QD5hyv4
         qalKcm+w2A1RGPOfcosnqBowYV9WSbtRReJDuHY7nBmt7AP4AzQjRQoYZQpOABbsD1v/
         yKmsOwIAbY2ViOrhNhJcI9uUikHGyh6ELfDwgcJj2q4vyY3tbX43GN+6edJzh+Hv06eP
         9t13I0S20S47aBaft9ZeoE2lcXTTcrbiLz7N5/OGVp2ucuOKTeuiYGxBBRV6xSQsHqCz
         d+5zwRtX1TaG5TxK3bLnhUsJWkmcbEKB/RiOaRwzEkuSWMPT668FpDGtO997PX2yB+b4
         BO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696977298; x=1697582098;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsgV51zgbck/VovoDZq2ZYI93jFFVuKlVa93/gzxY58=;
        b=jrrtP9xDi0VS1xr7SGJaROO+uIZ7v2D2Z46+/1QbtcZALnEBK0SnJmyEgUTU9aaoQD
         FYE6AE4+Bl3wgt84vbeo0dXy7Cb/LMljKju3S8khXGTLxA6xITc9RVKoQdWzb9c6fLEm
         RGWZafptNgb7ISW4Uvx/Zs29G5eqnSWPc0WqhKZ0851I5QZqi6Z/zYb7kcUopuE9+bJW
         CxDj5V/+onO+Xb+c4x4JcGECt9WtHGMSyHP6AV4UBugik6Oyto0CzGaT8rEYQPOqz7w9
         v1MGisoTa5NFQf8d01c0hJEMTDuuNWN+0RPXeTh6xIgdJvg4m+++Nh0AhiotzNgNbT6O
         1WeA==
X-Gm-Message-State: AOJu0YwOIFwZo0N4I2855dCv9hjlqL1wLETEqP+upN1UT4HteTZUesRZ
        5vyITdfKqb7o0cdBXctQFWYQAu17p0P9AwjGUr4=
X-Google-Smtp-Source: AGHT+IFh90gDlZcCqGK6HIn8gPFZSJ6DW3nhxGPinJP5aJ47v0O3LiPv+x50+ngS1rTWK4VHFGaaCw0CQLe3ZUugRek=
X-Received: by 2002:a05:6402:351:b0:532:e4d3:df83 with SMTP id
 r17-20020a056402035100b00532e4d3df83mr16862623edw.4.1696977298377; Tue, 10
 Oct 2023 15:34:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6400:18:b0:22d:49d9:dff9 with HTTP; Tue, 10 Oct 2023
 15:34:57 -0700 (PDT)
Reply-To: tchalimbenson@gmail.com
From:   Benson Tchalim <rw5455090@gmail.com>
Date:   Tue, 10 Oct 2023 22:34:57 +0000
Message-ID: <CAFXnTB1Jx1caym0z0pB-i3ha1FHunFHsgN-z_NGxEM-x-iCS0g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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
Are you still using this email because i wrote to you a message but no response.
