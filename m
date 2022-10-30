Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBED612DA6
	for <lists+linux-media@lfdr.de>; Sun, 30 Oct 2022 23:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiJ3W7m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Oct 2022 18:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJ3W7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Oct 2022 18:59:41 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B62B1F7
        for <linux-media@vger.kernel.org>; Sun, 30 Oct 2022 15:59:41 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-13bef14ea06so11946762fac.3
        for <linux-media@vger.kernel.org>; Sun, 30 Oct 2022 15:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rothemail-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sdlkew3yvOW0KE3ZulW+OMTtI9ON9skoB84wktVp5Kg=;
        b=ShfrYT6eHdSHq92oKPtzzOrjhYGrdXvK9ZB/dsJSW40XmWbPaRjbsRoiZfe1Q3JlII
         x9xBwpBKWEfpeVTVhTyJu7GmvVm8sczI4QqN3YT9HmcbSlethdUAlwX52DqpFrOjnj3w
         CKfqrReRuiPw1Krs2vWHrr4bMzMsJ0RWd0R7YeR9/f2uA6UEJcnhvV0dKEU37W713+FW
         BhDcgNX7OWCSVx4YNohYk/IDbpcbxDKTxCTAenjG2FSPt+nlh3Wx7mN35ttP/s215T9x
         o6KbTb8fjGr5Nc6E88aqO0z4e5ko+FbZfrg0aedDqiNjgUjAplvnUgtAYb5EazOw+lR6
         URww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sdlkew3yvOW0KE3ZulW+OMTtI9ON9skoB84wktVp5Kg=;
        b=CRkRiMiO6X8nnW+tz7mjiuUp1rmrKfbioMU3Q5Z+I4M4OGF/7wzKfRrE95p0pFonSO
         biYvzVZ9ccB1PzZms6XYoXm5/Vo4GZBMEktzF0M4IctdmHpdIozc4rtW24Jb1ILBuIvl
         e6D41I5xfFEyCp0ekqHaT4qkdkIuRCdGpbYOsL5i4Iqn+4sBn/kDZOoHb+D4zlfia+CU
         EYmdycxq1TxzHaxUb/3REfaAsvNeKwhjv9z/Aa/fs1V8v7YGXD5/azydCMY2Nk5J38gy
         FTEdzrPdUo/G+KPWj9mdcuw1SEvqpbccyEX6+LFoqe2MSB/wcsvH0OrlKkD+l81iJm9k
         q2wQ==
X-Gm-Message-State: ACrzQf2UGo60rhMQTSKz245g9p/7wfGk1u26HwjMRhbKIr3aVR6U0bLp
        2TvbM4xXl3JUP+gsnFGYByRM6gu72LNuXQ==
X-Google-Smtp-Source: AMsMyM7+4oxxvAvwfh7TLO1JAosPsDH1PwZLJdV1cKyjHtkiR4TRYjZ7zoX1Btr3eUvJPxxAyI+ueg==
X-Received: by 2002:a05:6870:f692:b0:13a:f2be:7b49 with SMTP id el18-20020a056870f69200b0013af2be7b49mr16250916oab.77.1667170780365;
        Sun, 30 Oct 2022 15:59:40 -0700 (PDT)
Received: from nroth-pc.attlocal.net (104-5-61-214.lightspeed.austtx.sbcglobal.net. [104.5.61.214])
        by smtp.gmail.com with ESMTPSA id o6-20020a9d4046000000b0066194e0e1casm2098971oti.75.2022.10.30.15.59.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 15:59:39 -0700 (PDT)
From:   Nicholas Roth <nicholas@rothemail.net>
To:     linux-media@vger.kernel.org
Subject: ov8858 driver
Date:   Sun, 30 Oct 2022 17:59:32 -0500
Message-Id: <20221030225933.74570-1-nicholas@rothemail.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This would add a driver from the ov8858 to the kernel which is
currently in a Manjaro upstream. Upstreaming this driver will
enable upstream support for the PinePhone Pro in libcamera,
and in turn Waydroid, a lightweight container-based Android
runtime for Linux.

Based on the prevalence of quality Android camera apps, as well as
Android apps that require cameras, I see having a functional camera HAL
as an important part of helping people transition to FOSS-based
smartphones and appreciate your support.

Pleasee review and let me know what we would need to mainline this.


