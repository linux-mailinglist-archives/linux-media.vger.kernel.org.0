Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27092EB853
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 04:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbhAFDFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 22:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbhAFDFW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 22:05:22 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6781EC06134C;
        Tue,  5 Jan 2021 19:04:57 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id 186so1469424qkj.3;
        Tue, 05 Jan 2021 19:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s6kPsdrQGFtRIW15gnjfxayTfIR6vKrZhwi28iuMhA0=;
        b=dzwj0vmBYlMtkdxj6zzOPVRBCaUVvyHQ7MXQj4ItQJ6V1nI4vb8NJwfksMbPpvFVak
         nEGOhe0LjlPvvHH1CPMLCV5fM1P3KDYLUBS8qOQzmeR1h27v7Qg9E+yer0seApXtWOQY
         IA4Y7dyB+n/6LXPSDYl832rLDx2d2fGj4Hg8jUyTR1lxIddgc+B4frfQSvpa43d9N2fX
         Ugz3BFg3TOaxKByvkrtrzx+kfXKfXK6LE/R+c+uPZ61m4MBx/nepftaVQ/nYQgltzCjE
         5hXBftcAG+TfBuGT/lxEq5h80q4hUaKje/Pm30jgC77tolZX/fpF4IZUsyvZLItF6Kk/
         mwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s6kPsdrQGFtRIW15gnjfxayTfIR6vKrZhwi28iuMhA0=;
        b=ouAobOzYRZ+RAJvRXdPJcBfQlDGAcA4d5EcRygTv2S+Haq4bLWXW+K2gHf9hAMtUeA
         9KwAchoBshiKiXNKzT2dpPPiFu7PjXxChw+JrraFNpSnvdfNQQHyF9xvLcXYEuAGDUJY
         F70y8CXRCtZCP/2CxNhZ+CDSmt3MM0vfvjiHWERVaStckDClKKRPUqdnVxiyewxB8XhV
         RPMC+xDbVXrlKSB6AJV+XHYZtEWinCzLe+PA0MNHxTT5Yd8tUOMSQv60vcn9JQuYOIuf
         ER91Uq4kEf8LEjQjoNuPXLsxNe5+7mCQYqKIpZbT6BcCjOId9Fu09NqzpeXw5pMmhODG
         tvhg==
X-Gm-Message-State: AOAM531miFJnT9u0zS0CVf7wKpcB6QAfScdmd8kvJjaPy6WZOzFWRmyZ
        0ZdGb6NuarGLVYXwIg5vUj4=
X-Google-Smtp-Source: ABdhPJyF4RtXgEU36C8YgcHsJ2JHyUGpVT62dayZsGYyv3EN3ffcQBVbB1GZWw7K6UYtY2KrRnhhCA==
X-Received: by 2002:a05:620a:13c2:: with SMTP id g2mr2532569qkl.174.1609902296433;
        Tue, 05 Jan 2021 19:04:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
        by smtp.gmail.com with ESMTPSA id n195sm730019qke.20.2021.01.05.19.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 19:04:55 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] media: vidtv: add media controller support
Date:   Wed,  6 Jan 2021 00:04:45 -0300
Message-Id: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
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

changes in v2:
	added missing #ifdef that otherwise prevented this
	code from compilling if CONFIG_MEDIA_CONTROLLER_DVB 
	was not set.

Daniel W. S. Almeida (4):
  media: vidtv: Add media controller support
  media: vidtv: reinstate sysfs bind attrs
  media: vidtv: use a simpler name in platform_{device|driver}
  media: vidtv: print message when driver is removed

 .../media/test-drivers/vidtv/vidtv_bridge.c   | 34 +++++++++++++++++--
 .../media/test-drivers/vidtv/vidtv_bridge.h   |  7 ++++
 2 files changed, 38 insertions(+), 3 deletions(-)

-- 
2.30.0

