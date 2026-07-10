Return-Path: <linux-media+bounces-67283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mlHtEobUUGru5wIAu9opvQ
	(envelope-from <linux-media+bounces-67283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:16:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A56C073A204
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:16:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bJ5Bl+u2;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67283-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67283-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70477303B7EF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC92413220;
	Fri, 10 Jul 2026 11:16:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10429372B41
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:16:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682169; cv=none; b=lfq7Ums5XMVEWdxpt1BgG2YmYKOJYtd4L4Go/E+5SvlWQLxZLKSLvdMo4ngrXYVLbTyaRlPo7qEzsRQAAOPQ5eoQtCOoedV/MA6tL8zqLr0bef+u0+8C1hxZpF6/Y9KZEAFFI/jx7y/ksvPzjeM0xW/3rQN8mE3akB5TcK71Yqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682169; c=relaxed/simple;
	bh=1f+usL2BJkwGmbs2Fr4Jq2FkbApXemYsE5L+uFlW6sg=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=pTl5u/Sm5rbVdbcOdcGZnHc/Qg7I++Ve2QVZjoUDyqFFBUK3jMh4s8gPszv4CWwjPFjEVyFHhJEjHYP8X5x0E3NXi5s4V5Sb/7jL81w2tLlj9yyg7r8z3eUmPwZyZtxqHoK2ERIc7wzQIw8UREO2zQ1cFWMSjTV9mxMKgWD4Zg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJ5Bl+u2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449391F00A3F
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783682166;
	bh=1X/XOefjad39Rq8RO4Y5in0/k8QT3+eiFXYBROpemxQ=;
	h=Date:From:To:Subject;
	b=bJ5Bl+u2Ofm6WmPFmm8n+WVGcivjRAMVMc6YxkpkbMj8qtHAAX2yUlB74ue1fvuNF
	 pywwdCxR81ejQMc8Gh1DH8kuBFli2sCHCx00H4Dxde3s4OPhAKUjnk8EU7wmzMT1sf
	 Akyn4D9RJ3d6NwFpOrKyzflERhmpFRw8/zNgY4KoEzVLWCRE+wZOo1P+JfHqC3Q8uG
	 URKpyQMacIWHNbO5zdC3fNTdEP3ZNP8exFZHDRsC2P9rbYe6ICFSqZNtkpefHhyA7U
	 qcbf8r/zbgK43BLF0bQ0PKNE5FYF/VBlWevzAsHuKDIznzkfpeyE16d3N0Vv4kETn7
	 eiwSkJUoVVIDA==
Message-ID: <65a6bd5c-4e62-4370-b654-7dce0712aae5@kernel.org>
Date: Fri, 10 Jul 2026 13:16:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH] v4l-utils: cec-compliance: test timeout handling
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-67283-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A56C073A204

If we are testing against the vivid driver, then use the new timeout error injection
mechanism to verify that timeouts while claiming logical addresses are handled correctly.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
Note that is requires a kernel patched with this series:

https://patchwork.linuxtv.org/project/linux-media/list/?series=27637

And a v4l-utils synced to that kernel so that the new CEC_LOG_ADDRS_FL_CONFIG_FAILED
flag is available.
---
diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index 1bc7d5e8..eb00d6ac 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -258,6 +258,43 @@ static int testAdapLogAddrs(struct node *node)
 	return 0;
 }

+static int testAdapLogAddrsVivid(struct node *node, int fd)
+{
+	struct cec_log_addrs laddrs;
+	char buf[3] = {};
+
+	memset(&laddrs, 0, sizeof(laddrs));
+	strcpy(laddrs.osd_name, "Compliance");
+	laddrs.num_log_addrs = 1;
+	laddrs.cec_version = CEC_OP_CEC_VERSION_2_0;
+	laddrs.log_addr_type[0] = CEC_LOG_ADDR_TYPE_TV;
+	laddrs.primary_device_type[0] = CEC_OP_PRIM_DEVTYPE_TV;
+	laddrs.all_device_types[0] = CEC_OP_ALL_DEVTYPE_TV;
+	write(fd, "6", 1);
+	fail_on_test(doioctl(node, CEC_ADAP_S_LOG_ADDRS, &laddrs));
+	fail_on_test(!(laddrs.flags & CEC_LOG_ADDRS_FL_CONFIG_FAILED));
+	fail_on_test(laddrs.log_addr_mask);
+	read(fd, buf, 2);
+	fail_on_test(strcmp(buf, "0"));
+
+	write(fd, "6", 1);
+	memset(&laddrs, 0, sizeof(laddrs));
+	strcpy(laddrs.osd_name, "Compliance");
+	laddrs.num_log_addrs = 1;
+	laddrs.cec_version = CEC_OP_CEC_VERSION_2_0;
+	laddrs.log_addr_type[0] = CEC_LOG_ADDR_TYPE_TV;
+	laddrs.primary_device_type[0] = CEC_OP_PRIM_DEVTYPE_TV;
+	laddrs.all_device_types[0] = CEC_OP_ALL_DEVTYPE_TV;
+	laddrs.flags = CEC_LOG_ADDRS_FL_ALLOW_UNREG_FALLBACK;
+	fail_on_test(doioctl(node, CEC_ADAP_S_LOG_ADDRS, &laddrs));
+	fail_on_test(laddrs.flags & CEC_LOG_ADDRS_FL_CONFIG_FAILED);
+	fail_on_test(laddrs.log_addr_mask != 0x8000);
+	read(fd, buf, 2);
+	fail_on_test(strcmp(buf, "0"));
+
+	return 0;
+}
+
 static int testTransmit(struct node *node)
 {
 	struct cec_msg msg;
@@ -1409,12 +1446,40 @@ void testAdapter(struct node &node, struct cec_log_addrs &laddrs,
 	printf("\tCEC_ADAP_G/S_LOG_ADDRS: %s\n", ok(testAdapLogAddrs(&node)));
 	fcntl(node.fd, F_SETFL, fcntl(node.fd, F_GETFL) & ~O_NONBLOCK);
 	sleep(1);
+
+	const char *last_slash = strrchr(node.device, '/');
+	bool is_root = geteuid() == 0;
+
+	if (!node.phys_addr && node.is_vivid && last_slash && is_root) {
+		struct cec_log_addrs clear = { };
+
+		doioctl(&node, CEC_ADAP_S_LOG_ADDRS, &clear);
+		sleep(1);
+		std::string error_inj_tx_timeouts =
+			std::string("/sys/kernel/debug/cec") + last_slash +
+			"/error-inj-tx-timeouts";
+		int fd;
+
+		if ((fd = open(error_inj_tx_timeouts.c_str(), O_RDWR)) < 0) {
+			fprintf(stderr, "Failed to open %s: %s\n",
+				error_inj_tx_timeouts.c_str(),
+				strerror(errno));
+		} else {
+			printf("\tCEC_ADAP_G/S_LOG_ADDRS (with vivid): %s\n",
+			       ok(testAdapLogAddrsVivid(&node, fd)));
+			write(fd, "0", 1);
+			close(fd);
+		}
+	}
+
 	if (node.caps & CEC_CAP_LOG_ADDRS) {
 		struct cec_log_addrs clear = { };

 		doioctl(&node, CEC_ADAP_S_LOG_ADDRS, &clear);
 		doioctl(&node, CEC_ADAP_S_LOG_ADDRS, &laddrs);
+		sleep(1);
 	}
+
 	doioctl(&node, CEC_ADAP_G_LOG_ADDRS, &laddrs);
 	if (laddrs.log_addr_mask != node.adap_la_mask)
 		printf("\tNew Logical Address Mask   : 0x%04x\n", laddrs.log_addr_mask);

