Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA293519B2
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236924AbhDAR4D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234308AbhDARxQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:53:16 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3DCC00F7D7;
        Thu,  1 Apr 2021 08:07:42 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b9so2158812wrt.8;
        Thu, 01 Apr 2021 08:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kB6b35TkKeBEpWPgQVDGgf20f9VdNcsRCGKE/IEecDU=;
        b=fiYgqtRbuHkAOIB9pENfmYb9zlD+pRfCDLUG+YkieQk7mjFtH6p2GAAQdasUBiQbp3
         wnmiNcXg21EjkroMnjElV7BTQhJZOliEG2w4cPWVcs1i4vIrP1+x7eEV98xAo/82ZaR4
         kTWtiQ+NG5fyJQUBBa1X06X5D2kSadWkTSIppl6bEZnOc3vT7sp+TL4xD0NyQzm3wIwX
         oL8ziPJfasSMRa9W6DXxQ49thzeIQZQcCWzqFs9n7cU/CxYGu5mP/7D/iiGviNGt5JH+
         BnA3bea56LqRMbGP8OPETfZR/GCuFE1Mw8GaClX9W377R/PvhvpGLl06kyjLkJoZ5TXg
         rlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kB6b35TkKeBEpWPgQVDGgf20f9VdNcsRCGKE/IEecDU=;
        b=Q7bi3Qzvo6MBW51LqISfKKUqXtO9hUz1QzBLwKXE0ZLyD4t/TJfEr/xO/5zzO5da4r
         6iJWqUiXhuHOfTorr+5YAKKvPYKtEreGNH+6mvxFpj2gdepsMEUqV6O/hFx0UcefKLmO
         Bcfiu1jRCMu916M/EqMdN+VM4R4QIIysLBAuFevyK2Z66vuO+JtpiTBmLizP2ZFawIlI
         lj3U3ldHbeqls5GmoN2ROWUnE74bNsnv/suZdhzL0YCMwkpe7HDDedGouwPul+DIS8v1
         5cqIBgB2vTCOgxOR+L1JA1m0fwiDkW6I4eCj33gS9RrqIj+GwGe7EV25h58H4bE7zajH
         xwaQ==
X-Gm-Message-State: AOAM531P2Gc83WS2+57vovKJCvGFsEpPsZPuKsZMhef0Hk7l+3nobhHP
        XS3en3I/+2YNOXSLdOjbHZU=
X-Google-Smtp-Source: ABdhPJz1D4q12Th4EbfW7VXcWMjQP+Xt/wwiD6MDbLhKfM9AdssdVhAjfndQNkZQmjWOcZfdZhWBHg==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr10303387wrp.264.1617289661280;
        Thu, 01 Apr 2021 08:07:41 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:a182:b5f0:9f7c:c891])
        by smtp.gmail.com with ESMTPSA id n8sm9710108wrm.70.2021.04.01.08.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:07:40 -0700 (PDT)
From:   Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com
Subject: [PATCH 0/2] staging: media: omap4iss: Patchsets cleans up in iss.c
Date:   Thu,  1 Apr 2021 16:07:37 +0100
Message-Id: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clean up checks of "Alignment should match open parenthesis" and 
"CHECK: Lines should not end with a '('" in iss.c

Beatriz Martins de Carvalho (2):
  staging: media: omap4iss: Ending line with argument
  staging: media: omap4iss: align arguments with open parenthesis

 drivers/staging/media/omap4iss/iss.c | 48 +++++++++++++---------------
 1 file changed, 23 insertions(+), 25 deletions(-)

-- 
2.25.1

