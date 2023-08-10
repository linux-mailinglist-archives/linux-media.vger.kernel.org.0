Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC37776DC6
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 03:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbjHJB6h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 21:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjHJB6h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 21:58:37 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 824341999
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 18:58:30 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d5e792a163dso430781276.1
        for <linux-media@vger.kernel.org>; Wed, 09 Aug 2023 18:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691632710; x=1692237510;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Caa76uxp69dq+E2Vi9h630g4vh+SvLVlx5BvK0Ixnc=;
        b=7PLGGQxtydGLGfTypGpnE6gs/Ks2xBSVr4A5cmDSf0B7qvw2LuNNNxYqdiIc3V/Dul
         hODEH6Oo32zK5eW/9I8+dJ7EraWFGLxoJajaGa7Gm+/EiZa4jX4fjm32twQKyi0dQPhn
         cFjV1lTdx8uOeg6L/AwDC25Vc8AxmweLCgT+lMGFmPPIJ1l1EoIFf/fsXa1a8EZHl3ub
         eGezHvqpPVwKipazbsKvubrBsG2BMYP/L6no+6+Cz2d+NQb/A09qqz533l3JtHrDdUG2
         AweMQTJjelETVhcM7oaut0gPRpMH0krhhQ33tChGluoUsS8ZWx91r6h290cd8mRciDoQ
         v2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691632710; x=1692237510;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Caa76uxp69dq+E2Vi9h630g4vh+SvLVlx5BvK0Ixnc=;
        b=IeFfqFTSmvuMLRjht0x7XRm/8RY70SY8hp/p9Tr9gBTBUgwA7MT08uHLT3CaqPbJWn
         CjXRsA/J3x+RcLHYeF/SLUsd9ZOGJnrlZponIQQfLPYvU+7ml03VgboS5XH0xyuXbDG0
         VrOiHv1yxq0hWJ97QL8lR4rnQnyZZgybTVqCXvga/C9PjEKfbGQaI3Jp9jEzeIPjaREq
         cG9AEqOr1iA7/4eJ3HiC7atEpu1sjX5FXpCJMt5AkBuOZi1+hmszwImwsICUNbctaCOG
         m1foKustgvnsr3X2tcgcmcK4GOHvvmHkokOg6A+msL/nY2U15iEnrxHjslt7gvAllQEO
         6Ffg==
X-Gm-Message-State: AOJu0YwyXGT0CZs2D51dCJ8mLAZlfUH+2LHvwL8uA/16KU4C91FJl2GI
        zdULtsKHcRHdOzJvUlRhm0888KrQakuaIW56+Q==
X-Google-Smtp-Source: AGHT+IEig7NAv7ccrOqMwa8RpGx/YS7/Pj9SteVtedOxAZTrR2IA1eglRl+i4zjywkcEjJvhawHOLdfXqWOajvDi0Q==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a25:4294:0:b0:d45:daf4:1fc5 with SMTP
 id p142-20020a254294000000b00d45daf41fc5mr17517yba.3.1691632709828; Wed, 09
 Aug 2023 18:58:29 -0700 (PDT)
Date:   Wed,  9 Aug 2023 18:57:47 -0700
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-12-almasrymina@google.com>
Subject: [RFC PATCH v2 11/11] selftests: add ncdevmem, netcat for devmem TCP
From:   Mina Almasry <almasrymina@google.com>
To:     netdev@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     Mina Almasry <almasrymina@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Ahern <dsahern@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>, stephen@networkplumber.org,
        sdf@google.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ncdevmem is a devmem TCP netcat. It works similarly to netcat, but it
sends and receives data using the devmem TCP APIs. It uses udmabuf as
the dmabuf provider. It is compatible with a regular netcat running on
a peer, or a ncdevmem running on a peer.

In addition to normal netcat support, ncdevmem has a validation mode,
where it sends a specific pattern and validates this pattern on the
receiver side to ensure data integrity.

Suggested-by: Stanislav Fomichev <sdf@google.com>

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 tools/testing/selftests/net/.gitignore |   1 +
 tools/testing/selftests/net/Makefile   |   5 +
 tools/testing/selftests/net/ncdevmem.c | 534 +++++++++++++++++++++++++
 3 files changed, 540 insertions(+)
 create mode 100644 tools/testing/selftests/net/ncdevmem.c

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index 501854a89cc0..5f2f8f01c800 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -16,6 +16,7 @@ ipsec
 ipv6_flowlabel
 ipv6_flowlabel_mgr
 msg_zerocopy
+ncdevmem
 nettest
 psock_fanout
 psock_snd
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index ae53c26af51b..3181611552d3 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -5,6 +5,10 @@ CFLAGS +=  -Wall -Wl,--no-as-needed -O2 -g
 CFLAGS += -I../../../../usr/include/ $(KHDR_INCLUDES)
 # Additional include paths needed by kselftest.h
 CFLAGS += -I../
+CFLAGS += -I../../../net/ynl/generated/
+CFLAGS += -I../../../net/ynl/lib/
+
+LDLIBS += ../../../net/ynl/lib/ynl.a ../../../net/ynl/generated/protos.a
 
 LDLIBS += -lmnl
 
@@ -90,6 +94,7 @@ TEST_PROGS += test_vxlan_mdb.sh
 TEST_PROGS += test_bridge_neigh_suppress.sh
 TEST_PROGS += test_vxlan_nolocalbypass.sh
 TEST_PROGS += test_bridge_backup_port.sh
+TEST_GEN_FILES += ncdevmem
 
 TEST_FILES := settings
 
diff --git a/tools/testing/selftests/net/ncdevmem.c b/tools/testing/selftests/net/ncdevmem.c
new file mode 100644
index 000000000000..2efcc98f6067
--- /dev/null
+++ b/tools/testing/selftests/net/ncdevmem.c
@@ -0,0 +1,534 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+#define __EXPORTED_HEADERS__
+
+#include <linux/uio.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <stdbool.h>
+#include <string.h>
+#include <errno.h>
+#define __iovec_defined
+#include <fcntl.h>
+#include <malloc.h>
+
+#include <arpa/inet.h>
+#include <sys/socket.h>
+#include <sys/mman.h>
+#include <sys/ioctl.h>
+#include <sys/syscall.h>
+
+#include <linux/memfd.h>
+#include <linux/if.h>
+#include <linux/dma-buf.h>
+#include <linux/udmabuf.h>
+#include <libmnl/libmnl.h>
+#include <linux/types.h>
+#include <linux/netlink.h>
+#include <linux/genetlink.h>
+#include <linux/netdev.h>
+#include <time.h>
+
+#include "netdev-user.h"
+#include <ynl.h>
+
+#define PAGE_SHIFT 12
+#define PAGE_SIZE 4096
+#define TEST_PREFIX "ncdevmem"
+#define NUM_PAGES 16000
+
+#ifndef MSG_SOCK_DEVMEM
+#define MSG_SOCK_DEVMEM 0x2000000
+#endif
+
+/*
+ * tcpdevmem netcat. Works similarly to netcat but does device memory TCP
+ * instead of regular TCP. Uses udmabuf to mock a dmabuf provider.
+ *
+ * Usage:
+ *
+ * * Without validation:
+ *
+ *	On server:
+ *	ncdevmem -s <server IP> -c <client IP> -f eth1 -n 0000:06:00.0 -l \
+ *		-p 5201
+ *
+ *	On client:
+ *	ncdevmem -s <server IP> -c <client IP> -f eth1 -n 0000:06:00.0 -p 5201
+ *
+ * * With Validation:
+ *	On server:
+ *	ncdevmem -s <server IP> -c <client IP> -l -f eth1 -n 0000:06:00.0 \
+ *		-p 5202 -v 1
+ *
+ *	On client:
+ *	ncdevmem -s <server IP> -c <client IP> -f eth1 -n 0000:06:00.0 -p 5202 \
+ *		-v 100000
+ *
+ * Note this is compatible with regular netcat. i.e. the sender or receiver can
+ * be replaced with regular netcat to test the RX or TX path in isolation.
+ */
+
+static char *server_ip = "192.168.1.4";
+static char *client_ip = "192.168.1.2";
+static char *port = "5201";
+static size_t do_validation;
+static int queue_num = 15;
+static char *ifname = "eth1";
+static char *nic_pci_addr = "0000:06:00.0";
+static unsigned int iterations;
+
+void print_bytes(void *ptr, size_t size)
+{
+	unsigned char *p = ptr;
+	int i;
+	for (i = 0; i < size; i++) {
+		printf("%02hhX ", p[i]);
+	}
+	printf("\n");
+}
+
+void print_nonzero_bytes(void *ptr, size_t size)
+{
+	unsigned char *p = ptr;
+	unsigned int i;
+	for (i = 0; i < size; i++) {
+		if (p[i])
+			printf("%c", p[i]);
+	}
+	printf("\n");
+}
+
+void initialize_validation(void *line, size_t size)
+{
+	static unsigned char seed = 1;
+	unsigned char *ptr = line;
+	for (size_t i = 0; i < size; i++) {
+		ptr[i] = seed;
+		seed++;
+		if (seed == 254)
+			seed = 0;
+	}
+}
+
+void validate_buffer(void *line, size_t size)
+{
+	static unsigned char seed = 1;
+	int errors = 0;
+
+	unsigned char *ptr = line;
+	for (size_t i = 0; i < size; i++) {
+		if (ptr[i] != seed) {
+			fprintf(stderr,
+				"Failed validation: expected=%u, "
+				"actual=%u, index=%lu\n",
+				seed, ptr[i], i);
+			errors++;
+			if (errors > 20)
+				exit(1);
+		}
+		seed++;
+		if (seed == do_validation)
+			seed = 0;
+	}
+
+	fprintf(stdout, "Validated buffer\n");
+}
+
+/* Triggers a driver reset...
+ *
+ * The proper way to do this is probably 'ethtool --reset', but I don't have
+ * that supported on my current test bed. I resort to changing this
+ * configuration in the driver which also causes a driver reset...
+ */
+static void reset_flow_steering(void)
+{
+	char command[256];
+	memset(command, 0, sizeof(command));
+	snprintf(command, sizeof(command), "sudo ethtool -K %s ntuple off",
+		 "eth1");
+	system(command);
+
+	memset(command, 0, sizeof(command));
+	snprintf(command, sizeof(command), "sudo ethtool -K %s ntuple on",
+		 "eth1");
+	system(command);
+}
+
+static void configure_flow_steering(void)
+{
+	char command[256];
+	memset(command, 0, sizeof(command));
+	snprintf(command, sizeof(command),
+		 "sudo ethtool -N %s flow-type tcp4 src-ip %s dst-ip %s "
+		 "src-port %s dst-port %s queue %d",
+		 ifname, client_ip, server_ip, port, port, queue_num);
+	system(command);
+}
+
+/* Triggers a device reset, which causes the dmabuf pages binding to take
+ * effect. A better and more generic way to do this may be ethtool --reset.
+ */
+static void trigger_device_reset(void)
+{
+	char command[256];
+	memset(command, 0, sizeof(command));
+	snprintf(command, sizeof(command),
+		 "sudo ethtool --set-priv-flags %s enable-header-split off",
+		 ifname);
+	system(command);
+
+	memset(command, 0, sizeof(command));
+	snprintf(command, sizeof(command),
+		 "sudo ethtool --set-priv-flags %s enable-header-split on",
+		 ifname);
+	system(command);
+}
+
+static void bind_rx_queue(unsigned int ifindex, unsigned int dmabuf_fd,
+			  unsigned int queue_num, struct ynl_sock **ys)
+{
+	struct ynl_error yerr;
+
+	struct netdev_bind_rx_req *req;
+	int ret = 0;
+
+	*ys = ynl_sock_create(&ynl_netdev_family, &yerr);
+	if (!*ys) {
+		fprintf(stderr, "YNL: %s\n", yerr.msg);
+		return;
+	}
+
+	if (ynl_subscribe(*ys, "mgmt"))
+		goto err_close;
+
+	req = netdev_bind_rx_req_alloc();
+	netdev_bind_rx_req_set_ifindex(req, ifindex);
+	netdev_bind_rx_req_set_dmabuf_fd(req, dmabuf_fd);
+	netdev_bind_rx_req_set_queue_idx(req, queue_num);
+
+	ret = netdev_bind_rx(*ys, req);
+	netdev_bind_rx_req_free(req);
+	if (!ret) {
+		perror("netdev_bind_rx");
+		goto err_close;
+	}
+
+	return;
+
+err_close:
+	fprintf(stderr, "YNL failed: %s\n", (*ys)->err.msg);
+	ynl_sock_destroy(*ys);
+	exit(1);
+	return;
+}
+
+static void create_udmabuf(int *devfd, int *memfd, int *buf, size_t dmabuf_size)
+{
+	struct udmabuf_create create;
+	int ret;
+
+	*devfd = open("/dev/udmabuf", O_RDWR);
+	if (*devfd < 0) {
+		fprintf(stderr,
+			"%s: [skip,no-udmabuf: Unable to access DMA "
+			"buffer device file]\n",
+			TEST_PREFIX);
+		exit(70);
+	}
+
+	*memfd = memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
+	if (*memfd < 0) {
+		printf("%s: [skip,no-memfd]\n", TEST_PREFIX);
+		exit(72);
+	}
+
+	ret = fcntl(*memfd, F_ADD_SEALS, F_SEAL_SHRINK);
+	if (ret < 0) {
+		printf("%s: [skip,fcntl-add-seals]\n", TEST_PREFIX);
+		exit(73);
+	}
+
+	ret = ftruncate(*memfd, dmabuf_size);
+	if (ret == -1) {
+		printf("%s: [FAIL,memfd-truncate]\n", TEST_PREFIX);
+		exit(74);
+	}
+
+	memset(&create, 0, sizeof(create));
+
+	create.memfd = *memfd;
+	create.offset = 0;
+	create.size = dmabuf_size;
+	*buf = ioctl(*devfd, UDMABUF_CREATE, &create);
+	if (*buf < 0) {
+		printf("%s: [FAIL, create udmabuf]\n", TEST_PREFIX);
+		exit(75);
+	}
+}
+
+int do_server(void)
+{
+	int devfd, memfd, buf, ret;
+	size_t dmabuf_size;
+	struct ynl_sock *ys;
+
+	dmabuf_size = getpagesize() * NUM_PAGES;
+
+	create_udmabuf(&devfd, &memfd, &buf, dmabuf_size);
+
+	bind_rx_queue(3 /* index for eth1 */, buf, queue_num, &ys);
+
+	char *buf_mem = NULL;
+	buf_mem = mmap(NULL, dmabuf_size, PROT_READ | PROT_WRITE, MAP_SHARED,
+		       buf, 0);
+	if (buf_mem == MAP_FAILED) {
+		perror("mmap()");
+		exit(1);
+	}
+
+	/* Need to trigger the NIC to reallocate its RX pages, otherwise the
+	 * bind doesn't take effect.
+	 */
+	trigger_device_reset();
+
+	sleep(1);
+
+	reset_flow_steering();
+	configure_flow_steering();
+
+	struct sockaddr_in server_sin;
+	server_sin.sin_family = AF_INET;
+	server_sin.sin_port = htons(atoi(port));
+
+	ret = inet_pton(server_sin.sin_family, server_ip, &server_sin.sin_addr);
+	if (socket < 0) {
+		printf("%s: [FAIL, create socket]\n", TEST_PREFIX);
+		exit(79);
+	}
+
+	int socket_fd = socket(server_sin.sin_family, SOCK_STREAM, 0);
+	if (socket < 0) {
+		printf("%s: [FAIL, create socket]\n", TEST_PREFIX);
+		exit(76);
+	}
+
+	int opt = 1;
+	ret = setsockopt(socket_fd, SOL_SOCKET,
+			 SO_REUSEADDR | SO_REUSEPORT | SO_ZEROCOPY, &opt,
+			 sizeof(opt));
+	if (ret) {
+		printf("%s: [FAIL, set sock opt]: %s\n", TEST_PREFIX,
+		       strerror(errno));
+		exit(76);
+	}
+
+	printf("binding to address %s:%d\n", server_ip,
+	       ntohs(server_sin.sin_port));
+
+	ret = bind(socket_fd, &server_sin, sizeof(server_sin));
+	if (ret) {
+		printf("%s: [FAIL, bind]: %s\n", TEST_PREFIX, strerror(errno));
+		exit(76);
+	}
+
+	ret = listen(socket_fd, 1);
+	if (ret) {
+		printf("%s: [FAIL, listen]: %s\n", TEST_PREFIX,
+		       strerror(errno));
+		exit(76);
+	}
+
+	struct sockaddr_in client_addr;
+	socklen_t client_addr_len = sizeof(client_addr);
+
+	char buffer[256];
+
+	inet_ntop(server_sin.sin_family, &server_sin.sin_addr, buffer,
+		  sizeof(buffer));
+	printf("Waiting or connection on %s:%d\n", buffer,
+	       ntohs(server_sin.sin_port));
+	int client_fd = accept(socket_fd, &client_addr, &client_addr_len);
+
+	inet_ntop(client_addr.sin_family, &client_addr.sin_addr, buffer,
+		  sizeof(buffer));
+	printf("Got connection from %s:%d\n", buffer,
+	       ntohs(client_addr.sin_port));
+
+	char iobuf[819200];
+	char ctrl_data[sizeof(int) * 20000];
+
+	size_t total_received = 0;
+	size_t i = 0;
+	size_t page_aligned_frags = 0;
+	size_t non_page_aligned_frags = 0;
+	while (1) {
+		bool is_devmem = false;
+		printf("\n\n");
+
+		struct msghdr msg = { 0 };
+		struct iovec iov = { .iov_base = iobuf,
+				     .iov_len = sizeof(iobuf) };
+		msg.msg_iov = &iov;
+		msg.msg_iovlen = 1;
+		msg.msg_control = ctrl_data;
+		msg.msg_controllen = sizeof(ctrl_data);
+		ssize_t ret = recvmsg(client_fd, &msg, MSG_SOCK_DEVMEM);
+		printf("recvmsg ret=%ld\n", ret);
+		if (ret < 0 && (errno == EAGAIN || errno == EWOULDBLOCK)) {
+			continue;
+		}
+		if (ret < 0) {
+			perror("recvmsg");
+			continue;
+		}
+		if (ret == 0) {
+			printf("client exited\n");
+			goto cleanup;
+		}
+
+		i++;
+		struct cmsghdr *cm = NULL;
+		struct cmsg_devmem *cmsg_devmem = NULL;
+		for (cm = CMSG_FIRSTHDR(&msg); cm; cm = CMSG_NXTHDR(&msg, cm)) {
+			if (cm->cmsg_level != SOL_SOCKET ||
+			    (cm->cmsg_type != SCM_DEVMEM_OFFSET &&
+			     cm->cmsg_type != SCM_DEVMEM_HEADER)) {
+				fprintf(stdout, "skipping non-devmem cmsg\n");
+				continue;
+			}
+
+			cmsg_devmem = (struct cmsg_devmem *)CMSG_DATA(cm);
+			is_devmem = true;
+
+			if (cm->cmsg_type == SCM_DEVMEM_HEADER) {
+				/* TODO: process data copied from skb's linear
+				 * buffer.
+				 */
+				fprintf(stdout,
+					"SCM_DEVMEM_HEADER. "
+					"cmsg_devmem->frag_size=%u\n",
+					cmsg_devmem->frag_size);
+
+				continue;
+			}
+
+			struct devmemtoken token = { cmsg_devmem->frag_token,
+						     1 };
+
+			total_received += cmsg_devmem->frag_size;
+			printf("received frag_page=%llu, in_page_offset=%llu,"
+			       " frag_offset=%llu, frag_size=%u, token=%u"
+			       " total_received=%lu\n",
+			       cmsg_devmem->frag_offset >> PAGE_SHIFT,
+			       cmsg_devmem->frag_offset % PAGE_SIZE,
+			       cmsg_devmem->frag_offset, cmsg_devmem->frag_size,
+			       cmsg_devmem->frag_token, total_received);
+
+			if (cmsg_devmem->frag_size % PAGE_SIZE)
+				non_page_aligned_frags++;
+			else
+				page_aligned_frags++;
+
+			struct dma_buf_sync sync = { 0 };
+			sync.flags = DMA_BUF_SYNC_READ | DMA_BUF_SYNC_START;
+			ioctl(buf, DMA_BUF_IOCTL_SYNC, &sync);
+
+			if (do_validation)
+				validate_buffer(
+					((unsigned char *)buf_mem) +
+						cmsg_devmem->frag_offset,
+					cmsg_devmem->frag_size);
+			else
+				print_nonzero_bytes(
+					((unsigned char *)buf_mem) +
+						cmsg_devmem->frag_offset,
+					cmsg_devmem->frag_size);
+
+			sync.flags = DMA_BUF_SYNC_READ | DMA_BUF_SYNC_END;
+			ioctl(buf, DMA_BUF_IOCTL_SYNC, &sync);
+
+			ret = setsockopt(client_fd, SOL_SOCKET,
+					 SO_DEVMEM_DONTNEED, &token,
+					 sizeof(token));
+			if (ret != 1) {
+				perror("SO_DEVMEM_DONTNEED not enough tokens");
+				exit(1);
+			}
+		}
+		if (!is_devmem)
+			printf("flow steering error\n");
+
+		printf("total_received=%lu\n", total_received);
+	}
+
+cleanup:
+	fprintf(stdout, "%s: ok\n", TEST_PREFIX);
+
+	fprintf(stdout, "page_aligned_frags=%lu, non_page_aligned_frags=%lu\n",
+		page_aligned_frags, non_page_aligned_frags);
+
+	fprintf(stdout, "page_aligned_frags=%lu, non_page_aligned_frags=%lu\n",
+		page_aligned_frags, non_page_aligned_frags);
+
+	munmap(buf_mem, dmabuf_size);
+	close(client_fd);
+	close(socket_fd);
+	close(buf);
+	close(memfd);
+	close(devfd);
+	ynl_sock_destroy(ys);
+	trigger_device_reset();
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int is_server = 0, opt;
+
+	while ((opt = getopt(argc, argv, "ls:c:p:v:q:f:n:i:")) != -1) {
+		switch (opt) {
+		case 'l':
+			is_server = 1;
+			break;
+		case 's':
+			server_ip = optarg;
+			break;
+		case 'c':
+			client_ip = optarg;
+			break;
+		case 'p':
+			port = optarg;
+			break;
+		case 'v':
+			do_validation = atoll(optarg);
+			break;
+		case 'q':
+			queue_num = atoi(optarg);
+			break;
+		case 'f':
+			ifname = optarg;
+			break;
+		case 'n':
+			nic_pci_addr = optarg;
+			break;
+		case 'i':
+			iterations = atoll(optarg);
+			break;
+		case '?':
+			printf("unknown option: %c\n", optopt);
+			break;
+		}
+	}
+
+	for (; optind < argc; optind++) {
+		printf("extra arguments: %s\n", argv[optind]);
+	}
+
+	if (is_server)
+		return do_server();
+
+	return 0;
+}
-- 
2.41.0.640.ga95def55d0-goog

