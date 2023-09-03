Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD448790EE1
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 00:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242388AbjICWPO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Sep 2023 18:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbjICWPO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Sep 2023 18:15:14 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0AFDE
        for <linux-media@vger.kernel.org>; Sun,  3 Sep 2023 15:15:11 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1d4e0c2901bso208653fac.0
        for <linux-media@vger.kernel.org>; Sun, 03 Sep 2023 15:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693779310; x=1694384110; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgPPGV/yZRcSLc7oRmhs3VDYngZZ/iIFKMRbxcYlqWQ=;
        b=lgwCjlqk0zYI3uhaVg2+BVwyb3euWucML7QlrWlIkJosHOBLTjER4DhDC1/ttJ/E64
         AVd6OsoeQRujv48nLIShQ4P5mtcweZulEzqaAhrqiJ4/nEnysgR08jKP4aSgaxZ2QP6l
         YkhKUhKrodXs0ZD6Xv9SUiiaJ8ptjMkQK+FdJQeinATx70MIPB6DQ5ok/UuuaYiI16fN
         cFqQxtjq8XMyJE2hJYIKiCMrMASWyxW+FSPw9jWk+mcni2zKGzFgM7kh4M7jEKvcA+d2
         YlZLa/BWrMUD0a0Rb5QTY3WNQUJyd5yxLypKxhyc3EGGlsSOGI5Ukh7qCByHecyjdpZn
         0iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693779310; x=1694384110;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgPPGV/yZRcSLc7oRmhs3VDYngZZ/iIFKMRbxcYlqWQ=;
        b=MgyGpAYHNrCAozXZs2zcXjpAd0pz8ZTU1oIBrXQ83L/mkcA5F1kiY7yfcUUFneLO02
         o3unF+cHinB9ijMAgsfAs95cm91KeBWmef6qAicaHGe8ciKKw7hJX0ElGSIsp5L2rUxn
         qEpKPzNWBGmD0xtHKCvddS/SOF2vK5whrc7CPjdcIR3RwAvyn7QbV64vZ4YfYAXZ+DS/
         K5ejh17EtSTKk7E2G4+9+BXxmc9Olqe1/QdfrMIXz2Bi9kHzrpXrfwYW4Eig7XXkHzEQ
         YI4gq5VzvtrttLIJ1VxOI8NbNqEtYr1LwQnehRgHLhXd89eB1Q4UAv+YvVdzjmMa5h5p
         KRBg==
X-Gm-Message-State: AOJu0YzEn3WkC98ppzefgZfxO1P89swRSrpngvEoKHacSok0PriokDO4
        FxjQAXtx0XCdRdCAsi0dyB3efmuWIu8/ANyl0X24mxNB8WifmQ==
X-Google-Smtp-Source: AGHT+IGBXxzaOhtg98eCB/f0a9InyzJx85D9OtkLwfcSRAO1VoK/lCyUw6vDwkfFnQd1sZNJsmIjwEisUL0ji3w1JZI=
X-Received: by 2002:a17:90a:49c9:b0:26d:61:3aad with SMTP id
 l9-20020a17090a49c900b0026d00613aadmr5797186pjm.4.1693779004792; Sun, 03 Sep
 2023 15:10:04 -0700 (PDT)
MIME-Version: 1.0
Sender: market03.xinyujie@gmail.com
Received: by 2002:ac4:8959:0:b0:61c:9894:e85a with HTTP; Sun, 3 Sep 2023
 15:10:03 -0700 (PDT)
From:   "Heinrich Barkev (R.K. TradeLinks)" <rktradelinkskote@gmail.com>
Date:   Sun, 3 Sep 2023 23:10:03 +0100
X-Google-Sender-Auth: C--eJgsSXEjVtwTy9cUK17zn62A
Message-ID: <CADJq-3_ZmK0GJuoC=mRUUn_stxTgWk0g9zppC5P8oc6VpJgVDA@mail.gmail.com>
Subject: Product Inquiry For New Project
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.3 required=5.0 tests=BAYES_99,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Dear,

How are you doing today?
We are interested in buying your product.
Can you ship your product to Germany?
Please send catalogs to my email below.

E-mail:  rktradelinkskote@gmail.com

Thanks, and Best Regards,

Heinrich Barkev (CEO)
R.K. TRADELINKS KOTA
Tel: +49 40 3002-06
Fax: +49 40 330054
E-mail: rktradelinkskote@gmail.com
Add: Ballindamm 25, 20095 Hamburg , Germany
