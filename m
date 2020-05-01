Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894AA1C1EAB
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 22:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgEAUf3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 16:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgEAUf3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 16:35:29 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE57FC061A0C;
        Fri,  1 May 2020 13:35:28 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id h4so941975wmb.4;
        Fri, 01 May 2020 13:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UJR6qkcEKg4zj/hYVeH+dQgI/I3RrXDHkrgPPab3suc=;
        b=swS9lkWBq/1ZKZ/pPS+EuUDYX4EzjGYp5KnOwV7fSwBnRmJP1+6LuxpXDemfATNqj/
         ZLKcGVcTEQE0VC5QTYSzw0IVfeWPqsWEsldFfbwNnaZPT3pmqnokCOAh7dqw1D38opun
         MHLrNGJj5bTxgsLIyIrON2ZD1WAqzjYYnKLkq7Aqg30GNcfe4ZqVTRvlyG/4MJLmOvK1
         +HYhzkn58JeqjCCYxUlsV6zunMKibLxydwuoL2H6Q7t7z0apov4S1oU5wt4eMqStAajZ
         IwNkCoU+KQvfQu2KfnNidRHK7azRDYdPPvdWXuDp+ShsxJ3f3lH2BkKoYHqvfEZb8bqC
         TWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UJR6qkcEKg4zj/hYVeH+dQgI/I3RrXDHkrgPPab3suc=;
        b=F3gv04BwxQgj9c5j3YiujwXTlMZPGsw1As14Lhy8B+Jp1h6N8j629sgR+NCnGpupzR
         Mk3TTMHeSOsfGB9RM7WPG03HwdMMpC3Iweyw6ypbCKxVLFg89+jV2xNBQrs84qxGlKNB
         UIwdhbJ5PGHOgm6tAFdtmqGMvFtRNrRWEbjlFp9ENV8kwFOUk/UUrcVqqkVLXkmVsQgd
         nlg5JBH0uTsgOnS3o/RHWXKiRD850Ttkdzchw5jsSj51M6RnuCnXzSooNGUg2CX5g6Yt
         x0/x2+faexNQ2ZlHgeZs7j2NMPPaI7rl0ae74y3p8o8FS4oiRW8bO29tACr5oZ+rPLr5
         mliQ==
X-Gm-Message-State: AGi0PuYy0BlgwM3sPekGJKbArftweVOIxVZwW3LLiMxnb1ONXg2ZH7JE
        9Luue2zZslTYDUGiwCEatgDQP0XcbHnIEQ==
X-Google-Smtp-Source: APiQypKUQLLMkja5nKTST+cqkC1H0dquaF9jzTsiLqbDvBgTDlFF3EJ/aVd5aHTHNbPEQ17+uCwSFw==
X-Received: by 2002:a1c:ba09:: with SMTP id k9mr1213461wmf.176.1588365327680;
        Fri, 01 May 2020 13:35:27 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl. [83.6.170.125])
        by smtp.googlemail.com with ESMTPSA id s12sm1021981wmc.7.2020.05.01.13.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 13:35:27 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add support for venus on msm8939
Date:   Fri,  1 May 2020 22:35:01 +0200
Message-Id: <20200501203505.144362-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Konrad Dybcio (2):
  media: venus: Add support for MSM8939
  dt-bindings: media: Document MSM8939 Venus

 .../bindings/media/qcom,msm8939-venus.yaml    | 119 ++++++++++++++++++
 drivers/media/platform/qcom/venus/core.c      |  33 +++++
 2 files changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml

-- 
2.26.1

