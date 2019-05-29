Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABBD02DC91
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 14:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfE2MSU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 08:18:20 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:32946 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfE2MSU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 08:18:20 -0400
Received: by mail-wr1-f46.google.com with SMTP id d9so1649503wrx.0
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 05:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Bejd1gVgSgMcW8pTKawlHhgsU2AuPn6IsO3HpoUoBw4=;
        b=TVCczjE7bWQQz40zGXU6Sb9hMI0WJ+L+tAD/lz3jJztwWqdNNC+KgXQDKBvNqxxipF
         82fcmvciSYR01CKBb/cOthvydQy4J01D2pKZuHAAnsVRwDT3JA0fJMzAE2h8fnNLegkn
         GbGR/SP4A68skkNzmR38B+2DMV5iBdkm2CHMXcS4+rzqRFouY8UYhWXas0BGRRvK3Z5a
         dECKIuveAfkt4rb6B6p9TfgozyH/N/sNtqXt/EJXFiXiZqfTW2dBVueq/nFPFD7nWNg+
         tDt2ofUJTZGI+b07ZMIVs7jN+MniZ13hI/URRPIMdfEE954heXW63okavLasbOaxDijc
         alMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Bejd1gVgSgMcW8pTKawlHhgsU2AuPn6IsO3HpoUoBw4=;
        b=EhLgP/URImKJtHikLEOhrjWx/RN56LKmrpZj8XOnS6GldrdYM1oJbEMxi3duKuSwjv
         5Kv4HrRBqX3zRXF+CXydU1LU5ETBAbHxem0du6Pj8t82kUYWVcXBSd69zIa/HjHY86w8
         aXFx3DQ+7UW20KQtT6GgtrhplWdEXy6SQld+RaqQVzd5agnraf7XPqcUAGzGaMrk6swt
         WTa/as51h9uYW9oXf/7zKIS1s9TBIfGrLT8LLzs+g1Pjgb7QWwOWv6w8jEo1HpQPnw/p
         6f9oqqHc724Dex2DiFEI1UQ5tXryVvC7ps3RgmNt72gsGRlaH+mbojvv8nBVyqGNbDXT
         eAGA==
X-Gm-Message-State: APjAAAUL+gT1XdUY3zUZukU+Xftgl7FZUWyrqgFRDubFxEhjX072SlAz
        PoQb70UBnyZFWcj7ecd/DjNTnA==
X-Google-Smtp-Source: APXvYqzm2vBc4V8UvEHgtYpMnPDUJxzpbOXsvWk5noCh3SmUShbW6Sto2y27QgEAaDNe8uMKk1CeFg==
X-Received: by 2002:adf:8385:: with SMTP id 5mr4110035wre.194.1559132298798;
        Wed, 29 May 2019 05:18:18 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id z3sm1133836wml.28.2019.05.29.05.18.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 05:18:17 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v5.2] Venus fixes
Date:   Wed, 29 May 2019 15:18:12 +0300
Message-Id: <20190529121812.822-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here is a fix for a regression in HFI parser. Please pull.

regards
Stan

The following changes since commit eb96e57b913ff668b8b804178cdc509f9b3d4472:

  media: dvb: warning about dvb frequency limits produces too much noise (2019-05-22 15:32:08 -0400)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-fixes-v5.2-rc

for you to fetch changes up to a75d2c1073da0f09e02848f3ae490c308007d792:

  venus: hfi_parser: fix a regression in parser (2019-05-29 14:26:31 +0300)

----------------------------------------------------------------
venus fixes

----------------------------------------------------------------
Stanimir Varbanov (1):
      venus: hfi_parser: fix a regression in parser

 drivers/media/platform/qcom/venus/hfi_helper.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
