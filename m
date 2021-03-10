Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B75533432B
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 17:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbhCJQhN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 11:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232898AbhCJQhG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 11:37:06 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65AD2C061761
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 08:37:06 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id e20so7314057ljn.6
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 08:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkmW2GvjqGWts2vPAfis7GUqTOxPlIzb1CZYJYGpMME=;
        b=GODj3reE+EBC+KyzxwypFssgDByJDM+onjtNQHeM27vWvLdCqxABZeo4InGHNq29CH
         s4xAf/jsadcR28qkpE9OKvbOoEN06BXkj5tT/O5gJj88sibReqzJMxkjJIR0bbmC8/ur
         P7sCIgK4eKNLw81XGdRKs6WZ0jD38AdhrxSeWq1p9mE8AO/AKD+aatuDOOpLX4/MW9m6
         g1NYzb2lF3pr0SmKbpDQofzv+ZdyCOFJWR6TboyexTyCaHFS9z/GHq2Uz+YEgVVfpklD
         lZiKygPz4Klu1svIlHFgfq0VD/IAgQupazGb1mtXY0nfNxCs6KH8xfkM5FkdvWL3SuBQ
         k1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkmW2GvjqGWts2vPAfis7GUqTOxPlIzb1CZYJYGpMME=;
        b=UMhxNLFEQlMroknYkMXGkqjvKRLbQB/myJU9Odktmyk77xnnMrsdpjT/KnGHsATRlf
         CmSOzTc1IoWVKXioTJPPakwGqfnpCT/Bv4y1LYcuIvs3O5litu4ff0arYmV1Sv/VuAEK
         KhW4Kt4ckbhi+R8/JgJs9rqT+A3TKBtE8qahQubyvkZ4eeniGOc/gqn+2+LQxd8jSLKk
         HxQJSgxiCWd/8ksPDuWa0X+Z7DPBeMhfOu80TqvxobG/r83I08pNPwCmpteaJRD2v9qb
         7LmyD/gqNjSRkyEstF7YN61m2Bn3KDDB62rqOVysm6CMGgYtGQLw+r5vJf405XTyHJvS
         dmxg==
X-Gm-Message-State: AOAM532CqZwAvWFmPW37UkUjB1KeMHPlD6tTZEeDfrIsXdqeSoZ3C9Jt
        EEuTUZc2BHVrG2Wf+4Il47AJew==
X-Google-Smtp-Source: ABdhPJy/e5j6tJye7L9eF/hLH4FCYLVMSzfrfMtWZuFThVQR3RMJkkYsQZ7O3gNjRWcN3Ff6vXuUTg==
X-Received: by 2002:a2e:9d8f:: with SMTP id c15mr2289953ljj.494.1615394224788;
        Wed, 10 Mar 2021 08:37:04 -0800 (PST)
Received: from localhost (80-167-86-46-cable.dk.customer.tdc.net. [80.167.86.46])
        by smtp.gmail.com with ESMTPSA id q17sm1846587lfm.168.2021.03.10.08.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 08:37:04 -0800 (PST)
From:   Daniel Gomez <daniel@qtec.com>
To:     Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Huang Rui <ray.huang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
        Dennis Li <Dennis.Li@amd.com>, Monk Liu <Monk.Liu@amd.com>,
        Yintian Tao <yttao@amd.com>, Guchun Chen <guchun.chen@amd.com>,
        Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc:     Daniel Gomez <daniel@qtec.com>
Subject: [PATCH]] drm/amdgpu/gfx9: add gfxoff quirk
Date:   Wed, 10 Mar 2021 17:36:52 +0100
Message-Id: <20210310163655.2591893-1-daniel@qtec.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Disabling GFXOFF via the quirk list fixes a hardware lockup in
Ryzen V1605B, RAVEN 0x1002:0x15DD rev 0x83.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---

This patch is a continuation of the work here:
https://lkml.org/lkml/2021/2/3/122 where a hardware lockup was discussed and
a dma_fence deadlock was provoke as a side effect. To reproduce the issue
please refer to the above link.

The hardware lockup was introduced in 5.6-rc1 for our particular revision as it
wasn't part of the new blacklist. Before that, in kernel v5.5, this hardware was
working fine without any hardware lock because the GFXOFF was actually disabled
by the if condition for the CHIP_RAVEN case. So this patch, adds the 'Radeon
Vega Mobile Series [1002:15dd] (rev 83)' to the blacklist to disable the GFXOFF.

But besides the fix, I'd like to ask from where this revision comes from. Is it
an ASIC revision or is it hardcoded in the VBIOS from our vendor? From what I
can see, it comes from the ASIC and I wonder if somehow we can get an APU in the
future, 'not blacklisted', with the same problem. Then, should this table only
filter for the vendor and device and not the revision? Do you know if there are
any revisions for the 1002:15dd validated, tested and functional?

Logs:
[   27.708348] [drm] initializing kernel modesetting (RAVEN
0x1002:0x15DD 0x1002:0x15DD 0x83).
[   27.789156] amdgpu: ATOM BIOS: 113-RAVEN-115

Thanks in advance,
Daniel

 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 65db88bb6cbc..319d4b99aec8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1243,6 +1243,8 @@ static const struct amdgpu_gfxoff_quirk amdgpu_gfxoff_quirk_list[] = {
 	{ 0x1002, 0x15dd, 0x103c, 0x83e7, 0xd3 },
 	/* GFXOFF is unstable on C6 parts with a VBIOS 113-RAVEN-114 */
 	{ 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc6 },
+	/* GFXOFF provokes a hw lockup on 83 parts with a VBIOS 113-RAVEN-115 */
+	{ 0x1002, 0x15dd, 0x1002, 0x15dd, 0x83 },
 	{ 0, 0, 0, 0, 0 },
 };

--
2.30.1

