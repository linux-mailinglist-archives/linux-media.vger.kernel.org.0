Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0D2D2AA7
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 15:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388135AbfJJNOk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 09:14:40 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42079 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387664AbfJJNOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 09:14:38 -0400
Received: by mail-lj1-f193.google.com with SMTP id y23so6131147lje.9;
        Thu, 10 Oct 2019 06:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XOswBCNwFK4RZCMtfErG3cL4H6/5uv1kqEZjdrVfyDI=;
        b=HLo6Ayw2rkNVKVoy7Pan31CNGp9CBzZlzVzREmj3C9pGCjZEGM6sjQYAq6M/uFkFLQ
         R9a4byOUYpmkWsLMlKCSRa3brpyD/6lbeG+LDTPfuYSYGQc0BbxeNm4RI5JdsTbufWge
         9Z4nTuko2xFifRsaBIH2vfKjaBimCPoDEuuw/gv94Qk42D+Qozv5Bf2M4E/DmDPuQKRq
         C9DEDP/K/WKzCATI18RcHpMfvCkyMyJCkYlyQnu6NhkBiH8bW7tmIyJLZXRcvlHpsYai
         z3eO3G9pWRjIne6ppqvWlDr7Vg3RhWwZJzJ/1NwoNv7UcGQ5n+lg0ob25FKzqIQF7GxB
         Qy5A==
X-Gm-Message-State: APjAAAXgJgiYfs52kO8sNkKkyrrcINO8UQUzMZo9R/6Pvakat5KZDo6P
        GPPTFn2F5fHCsL+K89k9+ak=
X-Google-Smtp-Source: APXvYqx7rWr//j0nU72LF17c2ZHHfzLol9DG9rI4kOgM1l87fAOHIVImVINHKm3kJUnYijQABR42Bg==
X-Received: by 2002:a05:651c:120b:: with SMTP id i11mr2535790lja.123.1570713275622;
        Thu, 10 Oct 2019 06:14:35 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id j17sm1243951lfb.11.2019.10.10.06.14.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 06:14:34 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iIYHE-0006Ag-JH; Thu, 10 Oct 2019 15:14:45 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Harald Freudenberger <freude@linux.ibm.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-s390@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] treewide: fix interrupted release
Date:   Thu, 10 Oct 2019 15:13:29 +0200
Message-Id: <20191010131333.23635-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two old USB drivers had a bug in them which could lead to memory leaks
if an interrupted process raced with a disconnect event.

Turns out we had a few more driver in other subsystems with the same
kind of bug in them.

Note that all but the s390 patch have only been compile tested, while
the s390 one has not even been built.

Johan


Johan Hovold (4):
  drm/msm: fix memleak on release
  media: bdisp: fix memleak on release
  media: radio: wl1273: fix interrupt masking on release
  s390/zcrypt: fix memleak at release

 drivers/gpu/drm/msm/msm_debugfs.c             | 6 +-----
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 3 +--
 drivers/media/radio/radio-wl1273.c            | 3 +--
 drivers/s390/crypto/zcrypt_api.c              | 3 +--
 4 files changed, 4 insertions(+), 11 deletions(-)

-- 
2.23.0

