Return-Path: <linux-media+bounces-22637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8EB9E3F98
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 17:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD9DB163DEB
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 16:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFF020CCCC;
	Wed,  4 Dec 2024 16:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V31ZNHFr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F1A20ADCB
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 16:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733329623; cv=none; b=Ivz3k8OOUWSs0ndgxLxou9QwhZyINzmVwTF77rIPvjds1gSIxdt7Tioi9gz8g0Q1xRbq0W1vxrn8eoBu+9fIov835M42spXmKULDHa+/AV797QgFJbdPRjKiGs2TXVTprBPjQ3rKK0tD+AHPWw9ah+kE3jVNPPwNswHIJvUl8iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733329623; c=relaxed/simple;
	bh=x70cZ6Pnodptk8s8H2UvJEPrrE/aNUkvtZGjOJaEWtk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TP5T1AnSJTumBtNpiTve8TN569eEKp4aPKTwJm/tTW3yFH1rYVeIHRwuj2NlhrrP3+B7BT+ljutYyBg3EkFHq+ZUrNSe65RewnNRs/vhzQ+2QzWYsJ2zqmaD0u9luACcQLEcIZaLwi9oJ2ejPOsAJrEnBY+ejeVAVmHpro0AeeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V31ZNHFr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4349ea54db7so61665e9.0
        for <linux-media@vger.kernel.org>; Wed, 04 Dec 2024 08:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733329620; x=1733934420; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KyQtsXmeUdkqec1pltW/92iEDMhCyyh/Xugcf79kOqw=;
        b=V31ZNHFr50T7ICeDRNi9HoJWR8UJd9yFPtaFXfh3HC79SWtGvJJta7PE0hSlmZZL1/
         8ku4HytApLjsSbL7rymTgPqvTHFsveXMVbVS1c4NZPlx9sBC5PDE/Y2jTSEQiPaw9ARZ
         Ynf902Ff+xIBb5MEXWgC0hRGy0Vv7o7zuuP9w9y0mahTluJOMUKkEWYnowx+4OaFN4HG
         lf6+YnakI05ylVVefXhqtrWIlcOB+Ujzi4R1P/PZSaTMRS4IfPCsUvvDVjbW7Y8Ywiyb
         jD5iGIBMcYMTL60IpKwr9i+PCY766H9yq4BGRMoN8I2YE8I/Czf3WtQqS9UJSPFa/Bn1
         C9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733329620; x=1733934420;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyQtsXmeUdkqec1pltW/92iEDMhCyyh/Xugcf79kOqw=;
        b=UdchCaVHDm17JKYjAvg+5GoWa2hysI9vPGfey8t1yYWXQvSDf9zVnyov8b3/jlRxQN
         qyuaby5az1cdfQ3fjtai5R6D2DVNGeLckGoXUcb13E4O3Y5a/MpNTPCZyGeFwgi7nYvL
         jL6NaXDqrpGB3rPKzwDPIEuaxIu6zj87IG7y99pA6+wKFik4KadumBTAviuWowxf4aNE
         agsGrTugwgE71X5lqPX0ru+xUEe/UYt7uN8jaIYoO6XMCGUTsfbhzzx+oCGi/0vXRE59
         bgNB1HfdDcDPY80DbkZYC36xB7d0JD/hJcuJayqdkEusxIRueftrF2JfzQD485cX3NBW
         KHpA==
X-Forwarded-Encrypted: i=1; AJvYcCVH8xmo2A8HSkhzdtPhVRqB322IiRtbdPInUoInt9YcxnhTHsN++ZCZN1zmWWkm+VLiM/mtqaA+wJeNwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAmKTUn9cjQrUu1KJPgLCSfbrSH6ocGEUKrDV4CikJ2PzA9O3C
	gm/lQHq0Vy7obuBaZfq1odcz1hRiPFR8ok17zt/eUjx+zveOBefyZRB6qMhhhA==
X-Gm-Gg: ASbGncsXenjFbkLX8TZmsmzLwQKaaGF20l58IF+/pIx2lSH/IsWzsdkct6fI10Tn5KZ
	E9jcSVXdIrnNFjgf78YDNUNlbP5TQmg15u4gpWTDiMRa4DGWvuAFLKFbiZ9+x3PAzhawKtc7WYe
	ticjgi8CNiP/VNGY8lBzHCMG9skjlOEuwzURgxXycMNd3oTH8eHc0SJvJJmVfuqPPe590H21tyC
	jA+tYlO9g7+GSisgziuYaHNRPgbjgnQR7GXRQ==
X-Google-Smtp-Source: AGHT+IFpzQfGXpeDPtULiRhPLDybLBEA4OSAEcAX75ckbymNW1nJjJIq12WV3lMHghFcvSelG5JPlw==
X-Received: by 2002:a05:600c:55c5:b0:42b:8ff7:bee2 with SMTP id 5b1f17b1804b1-434d52b563dmr1239595e9.5.1733329619368;
        Wed, 04 Dec 2024 08:26:59 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:4606:5fa1:8ade:6950])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e17574ebsm14388276f8f.30.2024.12.04.08.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:26:58 -0800 (PST)
From: Jann Horn <jannh@google.com>
Subject: [PATCH v2 0/3] fixes for udmabuf (memfd sealing checks and a leak)
Date: Wed, 04 Dec 2024 17:26:18 +0100
Message-Id: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqCUGcC/3WMyw7CIBQFf6W5azG82lhX/ofpgseFkthiwBJNw
 7+L3bucczKzQ8YUMMO12yFhCTnEtQE/dWBmtXokwTYGTrlknAqy2UXpzREX3piJpVL0qJUeBgH
 NeSY8jqbcp8ZzyK+YPke+sN/6r1QYocSNI78wI2Sv1M3H6B94NnGBqdb6BTX3zp2rAAAA
X-Change-ID: 20241203-udmabuf-fixes-d0435ebab663
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>, Julian Orth <ju.orth@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733329589; l=3258;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=x70cZ6Pnodptk8s8H2UvJEPrrE/aNUkvtZGjOJaEWtk=;
 b=wvi+WMu5XyGongyF0xG2h2EfpSwyL8Ch96wwqWKQwp3k2ZEGtB86dYewh42kVY0ZyLnBTMeKu
 1GCnV9vQLOPBwlbq+veVUlxDTxbwGjCn5HlM6jDoIcqd5fad7aYhFUZ
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

I have tested that patches 2 and 3 work using the following reproducers.
I did not write a reproducer for the issue described in patch 1.

Reproducer for F_SEAL_FUTURE_WRITE not being respected:
```
#define _GNU_SOURCE
#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <linux/udmabuf.h>

#define SYSCHK(x) ({          \
  typeof(x) __res = (x);      \
  if (__res == (typeof(x))-1) \
    err(1, "SYSCHK(" #x ")"); \
  __res;                      \
})

int main(void) {
  int memfd = SYSCHK(memfd_create("test", MFD_ALLOW_SEALING));
  SYSCHK(ftruncate(memfd, 0x1000));
  SYSCHK(fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK|F_SEAL_FUTURE_WRITE));
  int udmabuf_fd = SYSCHK(open("/dev/udmabuf", O_RDWR));
  struct udmabuf_create create_arg = {
    .memfd = memfd,
    .flags = 0,
    .offset = 0,
    .size = 0x1000
  };
  int buf_fd = SYSCHK(ioctl(udmabuf_fd, UDMABUF_CREATE, &create_arg));
  printf("created udmabuf buffer fd %d\n", buf_fd);
  char *map = SYSCHK(mmap(NULL, 0x1000, PROT_READ|PROT_WRITE, MAP_SHARED, buf_fd, 0));
  *map = 'a';
}
```

Reproducer for the memory leak (if you run this for a while, your memory
usage will steadily go up, and /sys/kernel/debug/dma_buf/bufinfo will
contain a ton of entries):
```
#define _GNU_SOURCE
#include <err.h>
#include <errno.h>
#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/resource.h>
#include <linux/udmabuf.h>

#define SYSCHK(x) ({          \
  typeof(x) __res = (x);      \
  if (__res == (typeof(x))-1) \
    err(1, "SYSCHK(" #x ")"); \
  __res;                      \
})

int main(void) {
  int memfd = SYSCHK(memfd_create("test", MFD_ALLOW_SEALING));
  SYSCHK(ftruncate(memfd, 0x1000));
  SYSCHK(fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK));
  int udmabuf_fd = SYSCHK(open("/dev/udmabuf", O_RDWR));

  // prevent creating new FDs
  struct rlimit rlim = { .rlim_cur = 1, .rlim_max = 1 };
  SYSCHK(setrlimit(RLIMIT_NOFILE, &rlim));

  while (1) {
    struct udmabuf_create create_arg = {
      .memfd = memfd,
      .flags = 0,
      .offset = 0,
      .size = 0x1000
    };
    int buf_fd = ioctl(udmabuf_fd, UDMABUF_CREATE, &create_arg);
    assert(buf_fd == -1);
    assert(errno == EMFILE);
  }
}
```

Signed-off-by: Jann Horn <jannh@google.com>
---
Changes in v2:
- patch 1/3: use file_inode instead of ->f_inode (Vivek)
- patch 1/3: add comment explaining the inode_lock_shared()
- patch 3/3: remove unused parameter (Vivek)
- patch 3/3: add comment on cleanup (Vivek)
- collect Acks
- Link to v1: https://lore.kernel.org/r/20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com

---
Jann Horn (3):
      udmabuf: fix racy memfd sealing check
      udmabuf: also check for F_SEAL_FUTURE_WRITE
      udmabuf: fix memory leak on last export_udmabuf() error path

 drivers/dma-buf/udmabuf.c | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)
---
base-commit: b86545e02e8c22fb89218f29d381fa8e8b91d815
change-id: 20241203-udmabuf-fixes-d0435ebab663

-- 
Jann Horn <jannh@google.com>


