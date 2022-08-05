Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA10458ABD3
	for <lists+linux-media@lfdr.de>; Fri,  5 Aug 2022 15:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbiHENwt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Aug 2022 09:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233951AbiHENw3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Aug 2022 09:52:29 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC87143E7B
        for <linux-media@vger.kernel.org>; Fri,  5 Aug 2022 06:52:25 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id v5so1474800wmj.0
        for <linux-media@vger.kernel.org>; Fri, 05 Aug 2022 06:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc;
        bh=v06PO/bg9EgkcXhguDDztG4OaVFASY+nO81q0wuW1VM=;
        b=qHkXN9BybhkQ7MlwVNpcJZ3mtCqQ3JiKHapyMPnSSMAkpqZgHCFOp7G5uhfg9JZ1th
         uEWZ3t70lbOk6cU1o/gpE7/NuRdfd0hb7om5tsvmB+8n3mzurg9KpTwhR6E8Z5BCGDEJ
         umRQ8JanGLQHyu0UT3tUEchag3xu0z5tOV0ZQdFd49furtBYctdvrcBQxhi117bw1sDs
         QTFF3khPbfx6kcMvIKU90k6zHppkLUh+wpmDoMoUStmPs4Uauk8+94R/D6VjTmw/BKj0
         rTLJ7oQRfRGFbq49Q1QGXvUJEG1xiC4CAEQMIkNjEAq92yKao26gikwbo4noV4lwETPG
         AIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=v06PO/bg9EgkcXhguDDztG4OaVFASY+nO81q0wuW1VM=;
        b=wdj5sTpMaCHTDdbZ1dvNKYbE3dor3pU/155sBcQW0bLj363Dck2YUBgqaC9xGHgTZk
         LbdHqBIsR3dtcTfn451Oq1xvPJ71cmm5q4/yel6wq2jKQY4ZPMx68nc+1H8kCs8ZK+p9
         GmfRordKSfooYQB8ljb1HSdUMYoH9z28JANPbOLtOVGxy6zmbmf2mqmueKuTiB7Vao53
         5ZnUmW7EmkpA9+ay+e/XbWL0MsKUAkRwau82ZSbFiCDcfdKPguBVPhojE993v3t2Hu1f
         4RZNZFI0aDYPF1XLhipISC0Tn36AtEl0/5akw7PNydoKqnmNx+e98SXVqfZqtCKNV0Go
         UqtQ==
X-Gm-Message-State: ACgBeo1gQ1CJ2nEwBW1xDPsj/bfZ1ZYT9hcH9I9oX7E+9QJoeZ6DLd1M
        1BN0bUHdkzShrolUlMUcPlORfv8uwdY5UvCFsfw=
X-Google-Smtp-Source: AA6agR5yldkE6Zb2ZnZsPB2Wi+pB3nTE2tRT6opXuhmSnP7IZuKlXDZAe5FJ4ediswPFfjvUVdC5vQk9+ZwMEytfZCU=
X-Received: by 2002:a05:600c:4e12:b0:3a3:2fe2:7d0e with SMTP id
 b18-20020a05600c4e1200b003a32fe27d0emr9918149wmq.151.1659707544378; Fri, 05
 Aug 2022 06:52:24 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkaylama@gmail.com
Sender: koutojeannine@gmail.com
Received: by 2002:a05:6020:f901:b0:1f4:9255:35ea with HTTP; Fri, 5 Aug 2022
 06:52:24 -0700 (PDT)
From:   sgtkaylama <sgtkaylama@gmail.com>
Date:   Fri, 5 Aug 2022 13:52:24 +0000
X-Google-Sender-Auth: 6HZkukp18jNjKC5OcnqZvOQDxSY
Message-ID: <CAAkpJ0tx_HH=dvLWJeNL_KcBHh2fvK03W661FG9ULjr0Nk3SGA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Salve, non ho ricevuto risposta per quanto riguarda il mio ultimo
messaggio precedente. Per favore controlla e rispondimi
