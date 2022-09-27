Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAE55EBF0A
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 11:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbiI0Jx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 05:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiI0Jxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 05:53:55 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D4FA0300
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 02:53:53 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id e129so2864227pgc.9
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 02:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=aVLzOJdTUGPI5bT/kAoKVtV4sieTuKiOcbShaYt9u2M=;
        b=J0j16jCYq1XF9fkWWYYa8dM0RA2nGcnDa3DpAIPiBzWI1Haw0yRhXc+r72SDXtGJG1
         G2oL3SkJGleI7QyWb0SD4Fslq/XGAXGcpokVq1a9VosBw3y5MdLLOJBsqGKOXJmvEB4F
         J/5E+ZaRcbP6/jmTnBj8ZUCilJNFSpf3Bn6RieXfJxPMeQoullZOMdPsx1DVOvazyYdD
         53OHJ/pVc5jdNB1CtXTkG9mqwE1d0gRFAyW041eqqiFA/giky6/ri3QLUP22Ob3aebcn
         k9c9zujs4bAgJ+hfWvAXwCr2za1D/1x67MNJw9u5eRNKvcBeDA7BNvuXlVOFEz+0nwXM
         RZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aVLzOJdTUGPI5bT/kAoKVtV4sieTuKiOcbShaYt9u2M=;
        b=kqrzrnXdmN9WeVF37A1DUtzg/e/lGYKmkdDjoW/2sbrqUfR8Eu0/38kpn7SuRXnUyy
         O3UT+9cJkEeheUPnwuSyGWA2H/CuTEskUfbb80WKfMF98GrS4cROVvW/nXBK49iUfddW
         uTKRStZgpeL3dOyDD+zlPKXiK3UT4UM8GHn1fgUeK+8jTe/5hKKkcapaG5GtZazFB3BT
         PcoV9mBSShHBeBCLSU8nvk1R95L2+DwDqRVrVtfgEEoicZ+3aYyZPAN9MRvNxo/Dq9AM
         6IBZHQsYdl0Nq+LV/frjUWwgTXnsTvax56cypgPXNDEh+YRAdCwrxAvGC5ZBuwS1raPO
         /DKw==
X-Gm-Message-State: ACrzQf2Um/78RCOlo6QFy/73zqzg8o7G/V5zkHJqPgFeR+FfUfR1DoTj
        aeX4XTsozYJdpj/TeS+w6WC97ls6qDcnzWA6Wtk=
X-Google-Smtp-Source: AMsMyM74VQ5QXDmaA843FovCwXI3FGedXHtCnCDTyiVyy73v8sROYSJzJ/C/161tAmhmjZV6bDljETda7wYCeCEZiSU=
X-Received: by 2002:a62:2985:0:b0:544:77d4:f43b with SMTP id
 p127-20020a622985000000b0054477d4f43bmr28581415pfp.9.1664272432999; Tue, 27
 Sep 2022 02:53:52 -0700 (PDT)
MIME-Version: 1.0
Sender: sawadogomahamoudou86@gmail.com
Received: by 2002:a05:6a11:45a8:b0:2f4:7743:3748 with HTTP; Tue, 27 Sep 2022
 02:53:52 -0700 (PDT)
From:   Colette Edmond <coletteedmond7@gmail.com>
Date:   Tue, 27 Sep 2022 02:53:52 -0700
X-Google-Sender-Auth: gFi2Zvmtvk_LZNM0LoxJnqWFRlU
Message-ID: <CAOH1Fy8d2rPwWjM7oDjkinkrq2Z+8hpqgcV0fcFtTp-FJyZC+g@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.1 required=5.0 tests=ADVANCE_FEE_4_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

My name is Colette Edmond, I would like to inquire about your services as
my partner/investor abroad and help me move and manage my funds by
investing in profitable ventures such as buying company shares or real
estate; I have a reasonable sum inherited from my father, Mr. Edmond
Johnson, which I would like to invest in your country.
Please reply to me once you have read this message and the documents so
that I know how to proceed.
Sincerely,
Note: Below is the main reason I am contacting you.
(1) Provide a new empty bank account to which this money will be
transferred. if you do not want us to use your personal account.
(2) Serve as custodian of this fund as the bank insisted that their
agreement with my father was for me to provide a foreign partner before
releasing the fund.
(3) To arrange my trip to your country to continue my education and obtain
a residence permit in your country.
Cordially,
Miss Edmond Colette.
