Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401D72EAB91
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 14:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbhAENKg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726685AbhAENKg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 08:10:36 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAC4C061574;
        Tue,  5 Jan 2021 05:10:11 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id h4so26357399qkk.4;
        Tue, 05 Jan 2021 05:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LQhTpfYHLDRwx3w40/HeUR0qSHC2BNRF9Xp53fgaufk=;
        b=K+asJL/sTwQZVtAsg4jvOYGxL8o5zGXDs2BXdUyusYKz7dzf7YPyRzg1LcDq6MsY1h
         ZYI6DLJXK39u/kfja28OWpsXpS1x2R8XSmMYuWSpiqfvCOBnWpU5F3UB3wWJeD8Y4PsD
         O9IKbYeVMhAQ1Oj3qjriwWp5Am8niHdSLgCi5Iid5+6UNDRrawMeapWQIUIceQCrVh2j
         tDBKdG/IYYntP+LnMih+Gbu/2h4HdlnPZfppMBPycLmGymC/q+KtuAYJlIUepuH2Rfgl
         Evly8hJJZxUfPGuRfqjahfc4gtfg42sLwP6xnhtwccrvOwse7vNC0N4eqLwcLslyT8nB
         AYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LQhTpfYHLDRwx3w40/HeUR0qSHC2BNRF9Xp53fgaufk=;
        b=pELGgYVeDLUWaHkcaFoe/GS+EzUW6dZ7lTDSEhD7JCAxVa+vM/ynpLdXkd+SJd93yF
         vcfqlvEJQUzYPevIo3cgZO1oHxBL8Glr5TUSDIhXWL0rqSUL3mXQ8hgk6ZQtgIMakzOj
         b3PS6loZV466bkiqk3G9kIEp/nI6JM+PlDMnJS/neKTxfzYWvD54081aMD6+8oEoxg6b
         mRSgfUKgZ8WZGtRlgoFenXKufk6UWbukKfdw4lCZITiSzWz6Sekve1KgCevpf+4BJ6t9
         0nOpP58Exz6truCY8bcbxTzPG43oIbvMGnwtVCyZ0OrcuBWlyUO0ewrcsNbJcjLcq+iO
         MW2Q==
X-Gm-Message-State: AOAM5311+ub44w/uAQ/uaWLuwLY1TI35BlNoWOgiikk7zw5BdtCfyX0I
        uoiBgO3hr0LCyxCx/EOKkgg=
X-Google-Smtp-Source: ABdhPJyqti8Wjdpymn9SgsBRvjq4h577IxB7RlB68c0Z4cwUomJYOyY3ka0YJ+TsgMDibvf53/CpQw==
X-Received: by 2002:a37:3d1:: with SMTP id 200mr39131698qkd.30.1609852210186;
        Tue, 05 Jan 2021 05:10:10 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
        by smtp.gmail.com with ESMTPSA id s14sm19877804qke.45.2021.01.05.05.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 05:10:09 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: vidtv: add media controller support
Date:   Tue,  5 Jan 2021 10:09:52 -0300
Message-Id: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This series adds media controller support for vidtv so that we can
support this driver at the test-media script in v4l-utils.

I based my implementation on vim2m's.

Daniel W. S. Almeida (4):
  media: vidtv: Add media controller support
  media: vidtv: reinstate sysfs bind attrs
  media: vidtv: use a simpler name in platform_{device|driver}
  media: vidtv: print message when driver is removed

 .../media/test-drivers/vidtv/vidtv_bridge.c   | 32 +++++++++++++++++--
 .../media/test-drivers/vidtv/vidtv_bridge.h   |  7 ++++
 2 files changed, 36 insertions(+), 3 deletions(-)

-- 
2.30.0

