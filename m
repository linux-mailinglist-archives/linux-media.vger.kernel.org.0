Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE164E8CE4
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 06:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237937AbiC1ECb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 00:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237973AbiC1ECI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 00:02:08 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACA746645
        for <linux-media@vger.kernel.org>; Sun, 27 Mar 2022 21:00:17 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id b12-20020a056902030c00b0061d720e274aso9979950ybs.20
        for <linux-media@vger.kernel.org>; Sun, 27 Mar 2022 21:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=5YF472UBEt2/+0TMmuAJ6M5CUqS69OAWnmeSQdznm4c=;
        b=Otbv6BZ5qGCcevBDAZX6xN8e9nfLahzy72aZz2C8ZnF7O0aumEiNkqQhZur1HY8/Cs
         iuIInxQV8DulTLV4peuIv24Kjo659uXmfHBO0sgraK+JrrU+As1YNNyP5VsmX8xvpfHj
         +DBCyPIEf7Myz5u2eebcccJK1GhatoYgWRAn9u6/hx3eLzgc6yDZpT0DbGZeqrIsxVy0
         MWOGzNy1ZJc3Y1AzaPB/KCHt1qRh6XZ3/aS55BAmF+xfDQhiQ6MSAI6I/s870uy88oLD
         B8qFjM3s8ixGcMg26tII9h+aMEs3oAt5IN56f2ExKguMu+wacxiRqK48y/Tgb9VayNGA
         E72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=5YF472UBEt2/+0TMmuAJ6M5CUqS69OAWnmeSQdznm4c=;
        b=Jo/eshLS9mKueJHxosWA4wE81+Cw5DzyhVtakDuzd4pPOSlhEijDhAW1DSmjP6yp8u
         tt76ZxZOvb3x1D66ALxsDFB0PUy7XY4GRsf0X5PBlqLWvsxRxwZjlRysNvXoqTZJmfWr
         z+o1AlTgAgu/tRwnlOwpn4epZxqdiT1RiclvA3zOaMwxOJCx5v/zVkEWaEge5Cg2GeXP
         5Dzg4bPf0YK0Gf7sEKKxYSyXEqOAxgPYqgXD5ib4iJeAa7xy/6tqdBmAENwS3na5If0j
         QeQh9E80tsBQbo7SbQoJXAPr5lFRvMbICJxxeGzTdYR2O+Eb/UQY+Tu3e2iu/rhnzFC5
         EHBg==
X-Gm-Message-State: AOAM531vP70dx9n35yak68sIif3XpxT71R40v9o4ajfu4egEyLUlSiaW
        gKsNMvBipcvpQxMmJE0tXXQhiUe41StQHqM=
X-Google-Smtp-Source: ABdhPJwZN53y2iru9thBQM3748jxF+GUaJNvT80PrAObXElBNXlNdj3eJA3jMrzwFwkCwnM8D+0mObmQfCh9oiQ=
X-Received: from tj2.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:187])
 (user=tjmercier job=sendgmr) by 2002:a81:f0c:0:b0:2d6:83ab:7605 with SMTP id
 12-20020a810f0c000000b002d683ab7605mr23417374ywp.150.1648440016871; Sun, 27
 Mar 2022 21:00:16 -0700 (PDT)
Date:   Mon, 28 Mar 2022 03:59:46 +0000
In-Reply-To: <20220328035951.1817417-1-tjmercier@google.com>
Message-Id: <20220328035951.1817417-8-tjmercier@google.com>
Mime-Version: 1.0
References: <20220328035951.1817417-1-tjmercier@google.com>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [RFC v4 7/8] binder: use __kernel_pid_t and __kernel_uid_t for userspace
From:   "T.J. Mercier" <tjmercier@google.com>
To:     tjmercier@google.com, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <brauner@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Shuah Khan <shuah@kernel.org>
Cc:     kaleshsingh@google.com, Kenny.Ho@amd.com, mkoutny@suse.com,
        skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The kernel interface should use types that the kernel defines instead of
pid_t and uid_t, whose definiton is owned by libc. This fixes the header
so that it can be included without first including sys/types.h.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 include/uapi/linux/android/binder.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/android/binder.h
index 169fd5069a1a..aa28454dbca3 100644
--- a/include/uapi/linux/android/binder.h
+++ b/include/uapi/linux/android/binder.h
@@ -289,8 +289,8 @@ struct binder_transaction_data {
 
 	/* General information about the transaction. */
 	__u32	        flags;
-	pid_t		sender_pid;
-	uid_t		sender_euid;
+	__kernel_pid_t	sender_pid;
+	__kernel_uid_t	sender_euid;
 	binder_size_t	data_size;	/* number of bytes of data */
 	binder_size_t	offsets_size;	/* number of bytes of offsets */
 
-- 
2.35.1.1021.g381101b075-goog

