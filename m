Return-Path: <linux-media+bounces-67080-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 82A6DqzVTmpkVAIAu9opvQ
	(envelope-from <linux-media+bounces-67080-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 00:56:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFF472B018
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 00:56:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="OC4mQR/d";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67080-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67080-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92703306280B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 22:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1255C3ABD98;
	Wed,  8 Jul 2026 22:55:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107F38B14B
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 22:55:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783551320; cv=none; b=HEzDB2yneaq2QEcaidRqEQlL0LjgmtvkUZwUfZup4I62nE7xIavwpqW24sGE0YWnXXGwpYGYltLLqayrQZsg8ons+YZv8gWw4ghaESRG2D/6AAaDAJtqeXGH3Dd1VNpb9SkBMLK07e11KHdmRnQISWHiSV95w8i0dXQFAPmyKwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783551320; c=relaxed/simple;
	bh=V+zoXf55Dp0UPoFZsPQ0Q9eO5GxTO4HRWuclzYLxIPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwo9iiRKj6O5R3MSRURML+Osx0XOU5NdjFTZSp278aZN7ZaGvOk2jST6ZP/YRUL1ftnpvbYtBUjRYX6+H2alpvlFsIV4+3TC6M2H5RtBsi7/Sl/MRQEluTN4hK/aA90cymsS+DRoZrnu2XdlsjrTEeET2hvXcTUBzlzuNu8quW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OC4mQR/d; arc=none smtp.client-ip=209.85.160.47
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4472500e25fso645268fac.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783551318; x=1784156118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ray7Z3XuEO/YKqK09zVWsq/dIoz2MTtQ1miE29pW1fU=;
        b=OC4mQR/dl+YVrJYZRIFQz+5x1ARgdDabqPwqtJsFeTP4wZOzYJPnKrnnUeTYKCyAsD
         YoY6G0gPqQS5IAWFynM3+57zqK0lM3hux9p1T28V/X3i70MjT9wjk5/ORQbAzK0A/4VR
         nrXvmZWXkmC1gbii0t9pc+3eZxFp92nRVlnThDzKwCLD7O0Xw3C+EWbtdWtay8es9FeG
         blglv86lPQtaJET2DjY54pJlj4Q0BIcboVpT6fGphqleTwQQUnQIeVnmSBEUKEX5HR0n
         dSy3OJg7umMdZET2qaqWoQhG4pgjYxGIbuzrlX9b/0GR43yzS3T6rO8f16w1fRolpqCF
         8OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551318; x=1784156118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ray7Z3XuEO/YKqK09zVWsq/dIoz2MTtQ1miE29pW1fU=;
        b=FtDgvRQcVxUDhBKmlaqlfl5FV/1wRzP9RLkm8v1/UNIGznqHAG9tsNp95JjX1J8Tpb
         OCHU8v5p8G1V7vGfrNMh3yxfTsSTfoLkz1qQyrLeaAcrVf+aYClHNu5SKJGOkZ8Vk9ct
         Bw5Y5us6qxvj021bXjIWW6/p/BfITM7Kcot4NJGww75BWEFZJPD51UoMaYPNOjX4yny+
         pqdZdX1lwETN4c4HwM+IgQj1TUHPg0SE3qvY6PBaCuk1fYFVEL6Xn3JwqTxWeWRyY1Ct
         DrnRRjrnGYr/Q1oIO1vrlsmkICNCBAbacdfkYER1aWOmi++igs5EUmO1fZ+7ANtioBZN
         NICQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBPCkgAWF/KIVM3yoYZJXfYqlWZoc8g3om+MR0wT0nUoWwSf5WZNxvSRfwxCSoYoVtye3MO9t47eTQ3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznep2E3qS4IgMkzNFwA6SqLBQrGB4lhg5Ah9m2CUJ+JUkKVpKa
	449C1D84+61QbfhIjK8rgFkeV0nzAW4RKiAD22FTAp3vV381I1OWxh2j
X-Gm-Gg: AfdE7cloL66j+RaoaLMr3C8ISInpYmQEW0Dpbo+tXM0BYWMkja7cKyI4J8iWsjPUrep
	9Y7JIAuOkT5BUBfjb89gLEAybLCibUOecpqlaI8abO22W/qY4NATjcdFAHgQQeICo8xZCXRXqdm
	w2VUPnazs6sRv64yikeubbGtYnHPXv9/pM9k9AJW+6N4hpBlJbtc/akf1RKGrqwugGcXqFZniT3
	uM3ILqD3dJM6bgNFsE8gSGmp1o4p7rRKxY00Qd7DwujWTLCsPV4bAyo2rTkd1Vo20FWfcIVMC9i
	tNFXICgi9bdjDIiPebTLxFgyJPKH3294jIwcWdbtQ/n0toLJZS6fDpPXu7XFF9cCmmtb7C4yVMG
	JHu1X19nk8F/TX3VxFzBm4fKkPIwSpwY9yovS3LQvnOToZ7xCg+DIQgT9DDyJ5AvnpVnZBJux8q
	0cWookJGD5
X-Received: by 2002:a05:6871:340f:b0:448:40e0:69ad with SMTP id 586e51a60fabf-451636f2108mr2800514fac.8.1783551317698;
        Wed, 08 Jul 2026 15:55:17 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:70::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45191244618sm361726fac.4.2026.07.08.15.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 15:55:17 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 08 Jul 2026 15:55:05 -0700
Subject: [PATCH net-next v5 2/3] selftests/net: ncdevmem: add -b option to
 set rx-buf-size on bind
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcpdm-large-niovs-v5-2-34bf6fac941b@meta.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
In-Reply-To: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com, 
 dw@davidwei.uk, Joe Damato <joe@dama.to>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67080-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:joe@dama.to,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACFF472B018

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add -b <bytes> to request a non-default niov size via
NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
hugepage produces one naturally-aligned sg entry.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 36 +++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index d96e8a3b5a65..a16e55af51ee 100644
--- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
+++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
@@ -40,6 +40,7 @@
 
 #include <linux/uio.h>
 #include <stdarg.h>
+#include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
@@ -61,6 +62,7 @@
 #include <sys/time.h>
 
 #include <linux/memfd.h>
+#include <sys/param.h>
 #include <linux/dma-buf.h>
 #include <linux/errqueue.h>
 #include <linux/udmabuf.h>
@@ -79,6 +81,7 @@
 #define PAGE_SHIFT 12
 #define TEST_PREFIX "ncdevmem"
 #define NUM_PAGES 16000
+#define MB(x) ((x) << 20)
 
 #ifndef MSG_SOCK_DEVMEM
 #define MSG_SOCK_DEVMEM 0x2000000
@@ -100,6 +103,7 @@ static unsigned int dmabuf_id;
 static uint32_t tx_dmabuf_id;
 static int waittime_ms = 500;
 static bool fail_on_linear;
+static uint32_t rx_buf_size;
 
 /* System state loaded by current_config_load() */
 #define MAX_FLOWS	8
@@ -142,6 +146,7 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
 {
 	struct udmabuf_create create;
 	struct memory_buffer *ctx;
+	unsigned int memfd_flags;
 	int ret;
 
 	ctx = malloc(sizeof(*ctx));
@@ -156,9 +161,14 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
 		goto err_free_ctx;
 	}
 
-	ctx->memfd = memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
+	memfd_flags = MFD_ALLOW_SEALING;
+	if (rx_buf_size > getpagesize())
+		memfd_flags |= MFD_HUGETLB | MFD_HUGE_2MB;
+
+	ctx->memfd = memfd_create("udmabuf-test", memfd_flags);
 	if (ctx->memfd < 0) {
-		pr_err("[skip,no-memfd]");
+		pr_err("[skip,no-memfd%s]",
+		       (memfd_flags & MFD_HUGETLB) ? " (need hugepages)" : "");
 		goto err_close_dev;
 	}
 
@@ -168,6 +178,11 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
 		goto err_close_memfd;
 	}
 
+	if (memfd_flags & MFD_HUGETLB) {
+		size = roundup(size, MB(2));
+		ctx->size = size;
+	}
+
 	ret = ftruncate(ctx->memfd, size);
 	if (ret == -1) {
 		pr_err("[FAIL,memfd-truncate]");
@@ -699,6 +714,8 @@ static int bind_rx_queue(unsigned int ifindex, unsigned int dmabuf_fd,
 	netdev_bind_rx_req_set_ifindex(req, ifindex);
 	netdev_bind_rx_req_set_fd(req, dmabuf_fd);
 	__netdev_bind_rx_req_set_queues(req, queues, n_queue_index);
+	if (rx_buf_size)
+		netdev_bind_rx_req_set_rx_buf_size(req, rx_buf_size);
 
 	rsp = netdev_bind_rx(*ys, req);
 	if (!rsp) {
@@ -1411,7 +1428,7 @@ int main(int argc, char *argv[])
 	int is_server = 0, opt;
 	int ret, err = 1;
 
-	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:n")) != -1) {
+	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:nb:")) != -1) {
 		switch (opt) {
 		case 'L':
 			fail_on_linear = true;
@@ -1446,6 +1463,19 @@ int main(int argc, char *argv[])
 		case 'n':
 			skip_config = 1;
 			break;
+		case 'b': {
+			unsigned long val;
+
+			errno = 0;
+			val = strtoul(optarg, NULL, 0);
+			if ((val == ULONG_MAX && errno == ERANGE) ||
+			    val > UINT32_MAX) {
+				pr_err("invalid rx_buf_size: %s", optarg);
+				return 1;
+			}
+			rx_buf_size = val;
+			break;
+		}
 		case '?':
 			fprintf(stderr, "unknown option: %c\n", optopt);
 			break;

-- 
2.53.0-Meta


