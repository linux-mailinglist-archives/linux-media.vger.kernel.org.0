Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C38C61E4C6
	for <lists+linux-media@lfdr.de>; Sun,  6 Nov 2022 18:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbiKFRSW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Nov 2022 12:18:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbiKFRSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Nov 2022 12:18:08 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2887C1C429
        for <linux-media@vger.kernel.org>; Sun,  6 Nov 2022 09:11:39 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id y67so10061082oiy.1
        for <linux-media@vger.kernel.org>; Sun, 06 Nov 2022 09:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rothemail-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/GuAJF9EByuMJlQjXwwDdmyZFlLJjZ8834qRoY3Gko=;
        b=NO2BjfuUmsVN+Qi3iQnBM0dylFdulP5wSUlqBuuOGLjgXi4ZKwZQxndxo/jKSke3z+
         PBluhE7jIZZpxkcb0FX0Vo1UrNj3alyvcrLULDANOqdepyWGMuc1q1HsmJ+JEOtgFXWc
         pxcEpDBurQDhs0/jcJDk736S8imIdwGpUDxWOpvvtfJWqEm4+5NrdZYIssOvit6x44Bt
         TSKJA5IzvhGbcFj4iixAzctzcV8E2eCYU2dl5F+KOE6dclqnsfS88l1D7OSk6zAel/qM
         Dqdy1QDQzTSm+Rfb10WeX0Q8aBXtsawmladUZ6i382RIomJK6ZDXulpqg/kR0VYcSMoV
         UXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/GuAJF9EByuMJlQjXwwDdmyZFlLJjZ8834qRoY3Gko=;
        b=1PlxvgSAaJMwZUCSumrTwMkcLW30mBV9LpjeC70eQivVbS2TDOpHXwvVcbhwDiZdIz
         f5oXjBCtCfz1lI94cOv3mcep8zm4xyDGQs2xQFDuqqdmGJz89IfgaY0oLtiYmCnVsQ51
         s4NXIoAxgvk/BilKcKxo4XSlMCbAdl8KSZww0zMBg6o1JJ7hseaHtsmjYS9KDwoEaane
         0vaeFXOans6N0pnv7GfqPDYzd2qoZ4QcXG9zW1ijcXFasSC2CF/yws5fSsuqAZ4VbBeL
         Y+KUpkXQSpgCBJuLy3Ykaati3ZhDBfy7/nGycBHw0gex2UfSIzVmfBVHQ6/n0KIaiM1y
         62sg==
X-Gm-Message-State: ACrzQf1ymQrnF5az3RJ8iBbLZ3yrt8IkDNm2Wgthpd339PHmJ+JlvMXF
        gmIno1TUUu5XOyn+blHrDLembz+LlnzDYRnF
X-Google-Smtp-Source: AMsMyM7v/QG/u8qBmZk3dwoqmelKkgY+fVQEXH+nGlVWfFaUF/7yHP+Ee6TRmdMr4Bsz40bSAupu9Q==
X-Received: by 2002:a05:6808:a1c:b0:35a:202f:1bc0 with SMTP id n28-20020a0568080a1c00b0035a202f1bc0mr18106076oij.286.1667754698119;
        Sun, 06 Nov 2022 09:11:38 -0800 (PST)
Received: from nroth-pc.attlocal.net ([2600:1700:20:20c0:37f0:51c5:4051:a636])
        by smtp.gmail.com with ESMTPSA id l2-20020aca3e02000000b00354efb5be11sm1655306oia.15.2022.11.06.09.11.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 09:11:37 -0800 (PST)
From:   Nicholas Roth <nicholas@rothemail.net>
To:     linux-media@vger.kernel.org
Subject: ov8858 driver
Date:   Sun,  6 Nov 2022 11:11:28 -0600
Message-Id: <20221106171129.166892-1-nicholas@rothemail.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please let me know what else you see that I may have missed! Kieran's
comments have already raised some great questions about handling
vendor-specific ROMs with useful information (specifically, how should
we?).


