Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9ABD1A2AF5
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 23:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730229AbgDHVUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 17:20:48 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33449 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729540AbgDHVUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 17:20:48 -0400
Received: by mail-lj1-f196.google.com with SMTP id q22so5511817ljg.0
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=IqdweVCdvzc2vntA+ndnGJVnpkFTuGWifCd5YOr8biA=;
        b=PkrnR+vdqIX+9aACYJV8/jL2dNKAIMaKYGCnc1b2L2DoWzZIHQV9NYHj0Bgtp8qfpo
         b2HmpqSLCi/Prg3tKr83mxSlfWNkBR2vnPo4q4fdRu+GZmjilSEliom1bYszmaRTo4BF
         fRt5OrPRC8a/yE5EFm4+4c5u5MQZvg1OmZaWvMlKvfkJBpzVwYM5A2+VBBLbCn+G16L2
         miFUh3CYPeoYy2bqtiwm6KPlCjM130NzcuXud+tXonqaFYSzQni7FpVsg0RWISjDwAm/
         8KTmW+zkp+rPI5kXYErBDDUvCaIKnGxVlWriQCduEXgYkoZ/+L2g2RXATuvm/L0TIfB6
         NdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IqdweVCdvzc2vntA+ndnGJVnpkFTuGWifCd5YOr8biA=;
        b=qb6TDqdmqnH6sYzQJN8y0VScWSNnHEEyYM8ZeySFHmtGr5AgJxW10LfVwADrtJSd/f
         0oxSXTnkKv8esOkQJ/KPj9zYhOmkF6+CdsZutiDT8aBtRIbLVYmJvGGhojBHFbCcok+/
         Rin5DoWBP0hIJaTD7CZ+8J5sJtRw9M6kGvJkOjwvKO5LUZisdus/JR/zMQll69AqzkJ8
         XTBWAmGKMw+lELFSt8+GMZ5AuIuYZoFAcVzTS5Xlnm0RjvL+2TuV1oEpDzc8/1OLKPY5
         vWTl/D18jo1CddsA3wXeCZbjA1x+tTM71aS4O1KX8z3rYjNPDp6wMTNp5U6l8J4JmsSJ
         cSUA==
X-Gm-Message-State: AGi0PuaohqaiP8GaYXtHOWhyucJPk95TNy2YKPB6m70G5I9QT3PxiTql
        wsVVuoXYMs9cJfyzvXZWCwfnElFqkE8=
X-Google-Smtp-Source: APiQypKUbaDGiJcTI5Uq1jzGm7dv4uDiizeN2luTguhgODlsIZf4INtYuRrXnGF2OsXN/KWtnLA5aQ==
X-Received: by 2002:a2e:6e15:: with SMTP id j21mr6187491ljc.42.1586380845262;
        Wed, 08 Apr 2020 14:20:45 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-138.ip.btc-net.bg. [212.5.158.138])
        by smtp.gmail.com with ESMTPSA id b28sm17395301ljp.90.2020.04.08.14.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:20:44 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/2] Venus dynamic debug
Date:   Thu,  9 Apr 2020 00:20:22 +0300
Message-Id: <20200408212024.23377-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Here are two patches which are modifying the debug
infrastructure in the Venus driver to make it more
flexible and usable during debug specific issues.

Please comment.

Stanimir Varbanov (2):
  venus: Add debugfs interface to set firmware log level
  venus: make debug infrastructure more flexible

 drivers/media/platform/qcom/venus/Makefile    |  2 +-
 drivers/media/platform/qcom/venus/core.c      |  5 ++
 drivers/media/platform/qcom/venus/core.h      |  7 +++
 drivers/media/platform/qcom/venus/dbgfs.c     | 27 ++++++++
 drivers/media/platform/qcom/venus/dbgfs.h     | 12 ++++
 drivers/media/platform/qcom/venus/helpers.c   |  2 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c  | 24 ++++---
 drivers/media/platform/qcom/venus/hfi_venus.c | 27 ++++++--
 .../media/platform/qcom/venus/pm_helpers.c    |  3 +-
 drivers/media/platform/qcom/venus/vdec.c      | 63 +++++++++++++++++--
 drivers/media/platform/qcom/venus/venc.c      |  4 ++
 11 files changed, 147 insertions(+), 29 deletions(-)
 create mode 100644 drivers/media/platform/qcom/venus/dbgfs.c
 create mode 100644 drivers/media/platform/qcom/venus/dbgfs.h

-- 
2.17.1

