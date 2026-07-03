Return-Path: <linux-media+bounces-66436-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g/sMNsZwR2olYQAAu9opvQ
	(envelope-from <linux-media+bounces-66436-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 10:20:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C3C6FFFD4
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 10:20:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gz7bKLxt;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66436-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66436-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40956320D636
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 08:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC97374178;
	Fri,  3 Jul 2026 08:09:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAE2371D1F
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 08:09:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066175; cv=none; b=LVLWnFVcQLirkPe4INX7xxAvpgYTbXPQ+Zau2edmO/hvWFzZ/f2xCeuBm7u4fZz0Z7twjAZdsbFSvx5lXp0JszdmisAxLlYlqTGY3ykWVsx7FGDbJZbLN0T7Aaf/pHSkizhBVO5iy6csObzRZb7Q7XqGTXCg0Pg2AK5VLFGxeg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066175; c=relaxed/simple;
	bh=CSYuelwBEgbOsTqPxA/RNruqEGmC7llHkPEnmOQMDNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dd3+o7M8D34QHYuh2YcxRhnJ67bLF9+uC+NRzdHb/szrPNYTguz3BfO8wrmuwNios9YYUw/Yq38IFKNxTy5xA9LdwDZE0UbGM/K/a/JW1oYtC6w0+afcA5XlPl8AdYF5RrbgNLG/hxwGa7LEZc3D6yeZpouUKK15z1g50T8HOC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz7bKLxt; arc=none smtp.client-ip=209.85.216.54
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37fdee9276fso362651a91.3
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 01:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783066172; x=1783670972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w87AnrTB3+K5h4mEbRFEu3fZorqFSIFJ3pSg+bs+2hw=;
        b=gz7bKLxtjD6wzsMtzaXuvzZEpzJzvQhH+mrf6cEjNTF1S3tox+ChiQmN8MptMVLssm
         lS9y0LIQX3oqziBHlwK0AeiVe8FU1M++x6TQaWLnUnQDEOdeXP3dpcTWeAQef6A675VM
         zIV5Gg18ANh7+t+delRsgFypGHyITARitdrvUOCHDJJov4DgfgoHkAAyg5qotdZ9id8Q
         A15uU26KWyQ4rbD7ygcHCTi2F0BlSmwBiNVYFbB+M7AFKw/6B/j3NxanAySX6xhtEmrm
         ay3zVfnTceOrwiQJ8mGXgUnISEq4cDKNBxOTusLoo4ZojHszJTEldH3Eb3RnzBgz96D8
         Z16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066172; x=1783670972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w87AnrTB3+K5h4mEbRFEu3fZorqFSIFJ3pSg+bs+2hw=;
        b=qcnwhckviLxKn1ZhyCRjvDhw/9NIGFoWmKCvcdZrFwDcF8bd062OQKbXGOvKTjRlto
         9Y2yfBYMvm1y0pVsDU6D+aVqrQpK1ReV0CRW4ryw/7Kbd9lih0ceGz/PbiFl+lWy643R
         7l7yEEpXey1zZQv153j7Bj+nR32Yu64XIOmGk9Y6ZufjDGcHqS0wVgl2eJQNp3QnkqQ+
         xI5hCgORdZdQHCiPbx9s0fWl0GXwmWeoRmOpBM9M1sSaZ7moxdOKdoUGIKnE6DUg1/Bk
         cayw4c0quwSCx63ZvmDyJTS0dnrtm9zZZbITdncbVsQuasG4a6G4Xpy7zUN4yonGb14N
         5YWg==
X-Forwarded-Encrypted: i=1; AHgh+Roe1ziMMcGE7N4yasbcbzLKmacooLcf65Vm6e05lhjhYzXhex/+FE41Dk/brZ3R2fBQyMZ2RDXUvBl1WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvIr7SVRq8N4mDMiMXnNb2zs5idGtxEgkwJ1LhgLwoUBo73cQ/
	4HJLqEBk7kX+hxazfhA1YyQXf0w0K1jqO7pYkgrXrDCjIOLH7KeBtWzw
X-Gm-Gg: AfdE7cmHpR0HWalXT8A1zoqI4zF1tTf3wpGerCHDkGtO0UAyECV3DQSIOwpKTgTQlU3
	gy9aS7huKhqbM4KhhKbuozrrU45J61KOVjJKMaClPhNSdUnx92ZdHzU06LumJV9+01eBoLfIf95
	5dMC5HtmDJT53eYg9GJsqdp+KA0cUGsQ69fWep0b7ZU7r001EyMh7ad795t786mVoB3L7ZFDl3S
	dlNQMp0X42VPehhwiw1aHQNk0qySjex2Fv8Xz8yQdgD572Th2zFL8aPFPLPmU9P3aHwMIZxUanF
	gptBcUOyjGdHmzWDoJWmmbtjgyjbNqtrveEpFAU04V5E8YhJM+hX2MyRwtjw31aGYXkMzi3p9gn
	vlDfbv+/WFx2tuhbKGYEBHFfRWsV00JpGVFlKU2xbXW44cCN3kallsM0wB/0kOkRcHKHqteI8oU
	0a7AXpQEd9dMlc+DXt2Zb8c3H1kiNnmXEUgMliNDrmMStUAp3vhD9kNw==
X-Received: by 2002:a17:90b:1d8d:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-381020baa35mr4976082a91.14.1783066171845;
        Fri, 03 Jul 2026 01:09:31 -0700 (PDT)
Received: from localhost.localdomain ([45.67.201.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae18f7sm614923a91.3.2026.07.03.01.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:09:31 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sandeep Patil <sspatil@android.com>,
	"Andrew F. Davis" <afd@ti.com>
Cc: Baineng Shou <shoubaineng@gmail.com>,
	stable@vger.kernel.org,
	linux-media@vger.kernel.org (open list:DMA-BUF HEAPS FRAMEWORK),
	dri-devel@lists.freedesktop.org (open list:DMA-BUF HEAPS FRAMEWORK),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA-BUF HEAPS FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dma-buf: dma-heap: close installed fd when copy_to_user() fails
Date: Fri,  3 Jul 2026 16:09:22 +0800
Message-Id: <20260703080922.1838362-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66436-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:sspatil@android.com,m:afd@ti.com,m:shoubaineng@gmail.com,m:stable@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43C3C6FFFD4

DMA_HEAP_IOCTL_ALLOC allocates a dma-buf and installs an fd into the
caller's fd table via fd_install() before dma_heap_ioctl() copies the
result back to userspace. If the trailing copy_to_user() fails, the
ioctl returns -EFAULT and userspace never learns the fd number, but
the fd (and the underlying dma-buf reference) remain in the caller's
fd table and are leaked for the lifetime of the process.

The failure is easily reachable from userspace: pass a struct
dma_heap_allocation_data that lives in a page whose protection is
flipped to PROT_READ between copy_from_user() and copy_to_user()
(e.g. via mprotect()). Each such ioctl leaks one dmabuf fd; repeating
the call quickly fills /proc/<pid>/fd with anonymous "/dmabuf:"
entries that only go away when the process exits.

Fix it by closing the installed fd (and clearing the fd field of the
kernel-side copy) when copy_to_user() fails after a successful
allocation, so the error path matches what userspace observes: no fd
was returned, therefore no fd is left behind.

Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
Cc: stable@vger.kernel.org
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---

Reproducer (full source, gcc -o poc poc.c; run as root):

    // poc.c -- leak one dma-buf fd per DMA_HEAP_IOCTL_ALLOC
    //          when copy_to_user() fails
    #include <fcntl.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <unistd.h>
    #include <sys/ioctl.h>
    #include <sys/mman.h>
    #include <linux/dma-heap.h>

    int main(int argc, char **argv)
    {
        int n = argc > 1 ? atoi(argv[1]) : 100;
        long ps = sysconf(_SC_PAGESIZE);

        int heap = open("/dev/dma_heap/system", O_RDWR | O_CLOEXEC);
        if (heap < 0)
            return perror("open"), 1;

        for (int i = 0; i < n; i++) {
            /* Put a valid request in a page, then make the page
             * read-only: copy_from_user() still succeeds and the
             * dma-buf is allocated and fd_install()'d, but the
             * trailing copy_to_user() fails and the fd, never
             * returned to us, is leaked.
             */
            struct dma_heap_allocation_data *req =
                mmap(NULL, ps, PROT_READ | PROT_WRITE,
                     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

            memset(req, 0, sizeof(*req));
            req->len = ps;
            req->fd_flags = O_RDWR | O_CLOEXEC;

            mprotect(req, ps, PROT_READ);
            ioctl(heap, DMA_HEAP_IOCTL_ALLOC, req);  /* -EFAULT */
            munmap(req, ps);
        }

        printf("done: check ls -l /proc/%d/fd for %d leaked fds\n",
               getpid(), n);
        pause();
        return 0;
    }

Before the fix, ./poc 10 leaves 10 anonymous dmabuf fds in the
caller's fd table:

    # ls -l /proc/$(pgrep poc)/fd
    lrwx------ 1 root root 64 Jan  1 00:03 3 -> /dev/dma_heap/system
    lrwx------ 1 root root 64 Jan  1 00:03 4 -> /dmabuf:
    lrwx------ 1 root root 64 Jan  1 00:03 5 -> /dmabuf:
    lrwx------ 1 root root 64 Jan  1 00:03 6 -> /dmabuf:
    lrwx------ 1 root root 64 Jan  1 00:03 7 -> /dmabuf:
    lrwx------ 1 root root 64 Jan  1 00:03 8 -> /dmabuf:
    lrwx------ 1 root root 64 Jan  1 00:03 9 -> /dmabuf:
    lrwx------ 1 root root 64 Jan  1 00:03 10 -> /dmabuf:
    lrwx------ 1 root root 64 Jan  1 00:03 11 -> /dmabuf:
    lrwx------ 1 root root 64 Jan  1 00:03 12 -> /dmabuf:
    lrwx------ 1 root root 64 Jan  1 00:03 13 -> /dmabuf:

After the fix, only /dev/dma_heap/system remains open; the
anonymous "/dmabuf:" entries are gone.

 drivers/dma-buf/dma-heap.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index a76bf3f8b071..0dd7a84b06bf 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -18,6 +18,7 @@
 #include <linux/uaccess.h>
 #include <linux/xarray.h>
 #include <uapi/linux/dma-heap.h>
+#include <linux/fdtable.h>
 
 #define DEVNAME "dma_heap"
 
@@ -181,8 +182,16 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 		goto err;
 	}
 
-	if (copy_to_user((void __user *)arg, kdata, out_size) != 0)
+	if (copy_to_user((void __user *)arg, kdata, out_size) != 0) {
+		if (kcmd == DMA_HEAP_IOCTL_ALLOC && ret == 0) {
+			struct dma_heap_allocation_data *h = (void *)kdata;
+
+			close_fd(h->fd);
+			h->fd = -1;
+		}
 		ret = -EFAULT;
+	}
+
 err:
 	if (kdata != stack_kdata)
 		kfree(kdata);
-- 
2.34.1


