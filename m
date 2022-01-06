Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5C048674A
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 17:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240698AbiAFQEp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 11:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240993AbiAFQEc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jan 2022 11:04:32 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9737FC061245
        for <linux-media@vger.kernel.org>; Thu,  6 Jan 2022 08:04:31 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id u25so11321580edf.1
        for <linux-media@vger.kernel.org>; Thu, 06 Jan 2022 08:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DAe/CHVEUB1Gpp2vsVez46/AIKFse9wiK0m9LSSVfSo=;
        b=Y50khu05qrA0RawcqFfD2JMFwklYNtfANvRgdC3ZQobRUz7sP3sHillXSV/EAD3Vv/
         LLProiJHCr4cWcqWnuc/vTE5UTmdSCRJzzgB2QnfXCqaBEP92Pvt2nJ1eBRReRXnCSPZ
         QVocqm8VIds/F3KyG/kwR8r8DVH/xrCUeIokk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DAe/CHVEUB1Gpp2vsVez46/AIKFse9wiK0m9LSSVfSo=;
        b=FHWScHw5bgUM1+7iblzL9KTJn0ewl4G4roTtUau4J4piUmLja0SuTKZeF8A5zSkAsn
         5PUXldTukwaBjqqxpkr8vhy533fkMP3E4IqchV+hiLnlFXv+t+FTEHESkG/oTuN5QNG0
         Sk7jg0GzZ0FOeVJAgsXjt7YpunZlhcJP93DkiuU3kUERNAcJkMOl/fnQZ/eSVSAXdmXD
         qWkb3arFkp6+IBdN206UQfr/rz82AgO+eRaXiB53LLLN5n2aweACGMr9aUJWZdd+Qx3F
         p32GjXwugCJ2dWdoOgAwlFAx8KpqaPZCPp9h3B15m24q0FKAOmQtQd9jZdwUnE5Dbwxr
         MYGw==
X-Gm-Message-State: AOAM531THiW17+xoM/xTy88gj9Q/32yir+uN8XXRh8PEXrdoraOHuPRR
        BNlre8VBmMu/E2xMvH3FFluBUKZucoReaw==
X-Google-Smtp-Source: ABdhPJy8aKjV9ET1iPId/wHr6AHf34Jl0nJ2ovnih2rLgmE00HdKXH2/QvnZlGJ5gXsQ7EJcJN6HQA==
X-Received: by 2002:a17:907:9086:: with SMTP id ge6mr2926564ejb.332.1641485069912;
        Thu, 06 Jan 2022 08:04:29 -0800 (PST)
Received: from taos.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id qb31sm580638ejc.76.2022.01.06.08.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 08:04:29 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 0/1] media: ovm6211: Adds support for OVM6211
Date:   Thu,  6 Jan 2022 18:04:25 +0200
Message-Id: <20220106160426.2683742-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v3: As usual, not everything is perfect, hence v3.  The patch set is now merged
into one big patch, redundant code was removed and the end result tested on the
board.  DT bindings are coming some time later.

v2: Removes an unused function (ovm6211_set_pix_clk) and this patch series is
now based on media/master; Didn't receive any comments about the RFC version,
thus i assume everything is perfect... :P
                                                                                                                               
                                                       
This patch adds ovm6211 driver into the staging directory.  It also creates
media/i2c entry, where ovm6211.c lives for now, to mimic the generic media
source tree.

Petko Manolov (1):
  media: ovm6211: Adds support for OVM6211

 drivers/media/i2c/Kconfig   |   10 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/ovm6211.c | 1043 +++++++++++++++++++++++++++++++++++
 3 files changed, 1054 insertions(+)
 create mode 100644 drivers/media/i2c/ovm6211.c


base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
-- 
2.30.2

