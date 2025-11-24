Return-Path: <linux-media+bounces-47647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF52C7F6EB
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 09:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0553A54FF
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 08:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4220F2F0665;
	Mon, 24 Nov 2025 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e6dAhq34"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C882EF677
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763974536; cv=none; b=Sx2dRBJnEqQ9SCzMqt4Bv0yAtdkado6qkV7PUDLu0VPmv7XQ1FcApSW6J655pSJ6DqjKBFMdK54M7/bfx4+YNso1VVPQnH18/1n1yFKEl72e1oJk4wfB8+jcVDAx561LQoNIkmRTfsx8azjJVHBRUlqP3rVyEPul2Hg37ns1t6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763974536; c=relaxed/simple;
	bh=dzFKPUU+2Jm+aJjlserlVb1c+9gkC6FLRTPeyWL5qcQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HbjxkSqZTff7eNflutryj/7Ycws6hvT74BrghyU6iO+1ZIBBieLV9hZLqW9AaD8ydS/KD4tV7o9lnzdiz5sSb9ShTNbiiSek0U+uTYodGmneu6Hia3IPsXjvEBRLN2QDnImoLUdzvp1yK+b/XbadZTD7J/mF30Dds7K4q7ZhXmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e6dAhq34; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-378e8d10494so49995141fa.2
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 00:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763974533; x=1764579333; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C2xBOGhDwjzpUv9LQ6vEeN0qYWUnTtQKcObi0HW7Ixw=;
        b=e6dAhq34aH4vR7P82QYXN3N1SMi4imF0+IMzByc6XSe+mP12VnyulovGG1z3VxMe52
         aHwmbGjSgUjIzCP3JUmyBgKye+UmzTFofkKDbTTlIsrQbqdxSgDhE+IeGIbP1gfggoUY
         hoPR7NOl1yK1QDRFvd+R9KPNWp7LwzURdF7W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763974533; x=1764579333;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2xBOGhDwjzpUv9LQ6vEeN0qYWUnTtQKcObi0HW7Ixw=;
        b=kDSsY2ekJhhHng8QsnFi+OR7hPFm3HnS5a3FQT2XsOPlmGZFjtMowTQoj3IwEtHdnd
         TZf1CB9zUNJ3ku63HQqhY4Kp4KQuZo/xz8ZfgNDs9Z304Y/l1F8t6FGXvyIZurkGAeV1
         GJeB1h6fEemscunM9WfRR4P+aDzsu379M5BTInSAWTdKabzWTseEMYjb6nXoqXgb6Ay1
         Z3SB/Wj6qTJks8tzl/YfD1HXiBUIAcvjz2hb9d8R96SQWbD7woEJwhLdMNQn275qDhZt
         7nSGgkmAcf+uNdrDxBijxMXk1SYgi1ZGg35qaZXf9OPZhZrFdZiAjPWcK5MJsVBD2U/S
         XS0g==
X-Gm-Message-State: AOJu0YzKlA6h1qScdoGklzjHqlwHO6faa8ftUsZTrBREDfVouqhCQb02
	EJcX5bQeC3GcWN2JMxju8Ipo2PGbQF9PNhWVHwjGWDYEl0wWz1DJLPzdHzVPgRSNR9F2cZguf3Q
	ZueVIYQ==
X-Gm-Gg: ASbGncuorYWIORaeOByUf99qp0ObQEBKqtwfkaQKurpJWfTkBIBs6b3L3Tpp9EuOS1b
	W47o/B0w85DGs9aDPwR0z9C5YoTPpcApEBE4uKrtu8I4JAsZXkQlkv4V6JszgA5MYhNHjK1djym
	pPSX22I6jffDgVqL4GaVSJfBXtvAi0a7H9QZ6Vu3GTxaGoivMugmgX+qM7wVTQso+UADdV32/c2
	4QKdyKUCLRUlWhVXA6hcjzYeL2pM3AsKGL1r47xeI6nE9FqlPBVGEEarLDBSMXYKx7YZnt06bKF
	deo6OQFz7WoHEir1PvKZ1r0oZOvjLRg+bTxWK9cLxrDd5UUm1cgZ6/x2bNnWOsFXY4UiNGCW9w+
	64dbf//nU2BVmyUdsCumfSXD01RbV2AgqReLeHugg3J2bqLwsWhwrUJ4dtfrgLwx+5SHeAZIISN
	SJ69VmrRX898raZ2KEiamRXw7H2Ph/TLBqLmbb9X2xdUaYXgxv
X-Google-Smtp-Source: AGHT+IExsiB3Ne346wlIj05FzuTlIO9FcZTaHS5bX8WIw3h4Cccz9mXEr5tzgRAEYuMP9e2vUtAViA==
X-Received: by 2002:a05:651c:420a:b0:373:a5ad:639 with SMTP id 38308e7fff4ca-37cd9154030mr25603991fa.8.1763974532515;
        Mon, 24 Nov 2025 00:55:32 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6bcb262sm28703841fa.43.2025.11.24.00.55.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 00:55:32 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-594270ec7f9so3662833e87.3
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 00:55:31 -0800 (PST)
X-Received: by 2002:a05:6512:304d:b0:595:9195:3390 with SMTP id
 2adb3069b0e04-596a3e987d5mr3084382e87.5.1763974530986; Mon, 24 Nov 2025
 00:55:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 24 Nov 2025 09:55:18 +0100
X-Gmail-Original-Message-ID: <CANiDSCuizbMt77XfrzGPMa3Biai5TF1vcs+C5qdhYoLrP=9b3g@mail.gmail.com>
X-Gm-Features: AWmQ_bkgxCnyPp-tCuaEQHQw3JvOOGYecq6sCM7NLS7HC_Jpru4NhmfL5cyH1Dg
Message-ID: <CANiDSCuizbMt77XfrzGPMa3Biai5TF1vcs+C5qdhYoLrP=9b3g@mail.gmail.com>
Subject: sparse: Lots of (erroneous?) "different address space" errrors in new version
To: Dan Carpenter <dan.carpenter@linaro.org>, Uros Bizjak <ubizjak@gmail.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dan

Every week we bump the smatch/sparse version used by Linux-media's CI.

We were almost error free, but the last version has introduced a huge
amount of errors:
https://linux-media.pages.freedesktop.org/-/users/ci/-/jobs/88441453/artifacts/junit/test-sparse.log.txt

(It is also reproducible with linus/master)


I have bisected your tool and it seems like they were introduced by:
commit e53027a4e816a772403baafa83c09e4a94c1cb8f (HEAD)
Author: Dan Carpenter <dan.carpenter@linaro.org>
Date:   Sat Oct 18 12:31:01 2025 +0300

    symbol: preserver address space qualifiers with typeof()

    When we're parsing typeof(var) we should preserve the address space
    qualifiers as well.

    Reported-by: Uros Bizjak <ubizjak@gmail.com>
    Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>


One example of the new error found is:

make -i W=1 C=1 CHECK="sparse" CF="-D__CHECK_ENDIAN__
-fmemcpy-max-count=11000000" KCFLAGS="-Wmaybe-uninitialized"
drivers/media/v4l2-core/v4l2-compat-ioctl32.o
drivers/media/v4l2-core/v4l2-compat-ioctl32.c:763:13: warning:
incorrect type in argument 2 (different address spaces)
09:08 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:763:13: expected
void const *from
09:08 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:763:13: got
unsigned int __user *


static int put_v4l2_event32_time32(struct v4l2_event *p64,
                                   struct v4l2_event32_time32 __user *p32)
{
        if (put_user(p64->type, &p32->type)


Seems like if we would like to fix the error, put_user should be modified....

Maybe it would be better to revert `symbol: preserver address space
qualifiers with typeof()` until the codebase is ready for it?

Regards

-- 
Ricardo Ribalda

