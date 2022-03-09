Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 652904D3564
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 18:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237432AbiCIRFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 12:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238986AbiCIRES (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 12:04:18 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC20A1A06CD
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 08:53:04 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-2dc1ce31261so19316407b3.6
        for <linux-media@vger.kernel.org>; Wed, 09 Mar 2022 08:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=a5Dt/ckgrAR/j0DHD5MablupC6tRY3n4B+kc2OBEq1E=;
        b=lf6qdnlnShM+NyA+sRumM9hivTRIGcCncGZbgQNzurEcC0PelK7f0Thi+M3ueh/60u
         crlhMuUH1ipr0mpuDqyE8aJ84VySIaff1FD+fE9773Bt+fv449Jm3nP3wPIlVA+Qfzav
         0k2WlYeS8LRPkeGvJS/ckcrKMSgPM5JtRDzCNqenqST8iJomE7l5mxPW2JqytjG7tKEz
         E11F13r1PzT40iKei9VjsWcsCTlAVdI2efPX0/uTfWtH4OCy9bcb/rt71jwCVzpmmrbw
         9TYlUoBsQKAMkXQRru4/JO9WydZpoUuui7gHXDFAFHPvAuocMffpVfEKhnWZZaGcVMZ7
         KGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=a5Dt/ckgrAR/j0DHD5MablupC6tRY3n4B+kc2OBEq1E=;
        b=SqeZzfc+8ntXzL2kM7dXUdjekLhZu/YRWewJOkrMPWxHze+MozXXfblCvwKPKcypyC
         DGT/CRxMoPZd1ZcbxbC0Kk15jKeyr8zyANV8eUqa7KmMpLiSkPj9F69XEKursHCZ3Inw
         JI27sbtj/pn2l/0uM/oR8FcpIIgLxKPTajYahWb3Tz1YTZe1L9h8iLVomzpYvbKiXUaa
         lAsrrQoHR05IU5fc09sw4npARoNcncwDp8tIhygzkclyfHx8blvdSogVVh7GEMnSdpr0
         CMnpn7Xqaa1zGZO9q7Ej9UqE9phtC64FIXoaJsHQrWRMU2hvDOTgIijrlBMW/aWRXWTQ
         Ip1g==
X-Gm-Message-State: AOAM530qXuZShMZKAnx7Pmdcr20vwbuhOFUd6xTT9Tp6YvGq3zQBO4pS
        X59yr1RY3esH7ipYO0zYvaVfSS38utg9Qa8=
X-Google-Smtp-Source: ABdhPJzdLHhn1AB/XDC8KoTs36Zqp19ShJhHV1TSxCbFMU/1hAK+2Cj1Svo6KldgaODaBXyTBc9IHyUlIGkN9Zk=
X-Received: from tj2.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:187])
 (user=tjmercier job=sendgmr) by 2002:a5b:9c2:0:b0:611:ad59:be04 with SMTP id
 y2-20020a5b09c2000000b00611ad59be04mr510975ybq.405.1646844775149; Wed, 09 Mar
 2022 08:52:55 -0800 (PST)
Date:   Wed,  9 Mar 2022 16:52:17 +0000
In-Reply-To: <20220309165222.2843651-1-tjmercier@google.com>
Message-Id: <20220309165222.2843651-8-tjmercier@google.com>
Mime-Version: 1.0
References: <20220309165222.2843651-1-tjmercier@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [RFC v3 7/8] binder: use __kernel_pid_t and __kernel_uid_t for userspace
From:   "T.J. Mercier" <tjmercier@google.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
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
Cc:     kaleshsingh@google.com, Kenny.Ho@amd.com,
        "T.J. Mercier" <tjmercier@google.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org,
        linux-kselftest@vger.kernel.org
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
2.35.1.616.g0bdcbb4464-goog

