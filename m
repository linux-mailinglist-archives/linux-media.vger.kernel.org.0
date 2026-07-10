Return-Path: <linux-media+bounces-67280-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ln5YAoDTUGpj5gIAu9opvQ
	(envelope-from <linux-media+bounces-67280-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:12:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F075B73A01F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:11:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GjNWM88E;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67280-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67280-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D09B3006220
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B2A416CE9;
	Fri, 10 Jul 2026 11:11:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765014071C6
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:11:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681914; cv=none; b=ooxID1Pt5MgqELds/lhhEECijJlT9zm5TaWsf5NI3HEqCWkiv5GNPudEjqZO+KhTdRPOppkpUbYrCBl8lTuAHxb5qn6MwtN7Zwe/obMHvTkjrYzdInhFPV49DP0tu9hxJ6Woo6H8IUo2CJDog365VdJiHL7vwQIyNY8zUq0nP2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681914; c=relaxed/simple;
	bh=HjpP1hoGlayEeDKpn+MP8NjLeC7VE7+r2wcn9xhzb3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tt7uSEtQvERT83AcGvGAe5iNXKawsJH45aZYVNr3oWTMACyocdfR7nSshRbZhc+MQYX4cn6PHaLMSoax0NiF5BC/oq0ITuMP422StaIa1VjuHKiE0EcOIIzDs/I777Yo856KXZCTWiG/yAjVvu+RPIt535PSONaxA6vS2RRE7zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GjNWM88E; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0041F00A3A;
	Fri, 10 Jul 2026 11:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783681912;
	bh=02gLolDtnSRMz3VCqLoCClfv0iGni6FANsLqP7CFi8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GjNWM88E57S76CK8AApghucVTpmWuvbsnCyqAr1/5VOgAbBmsTj+3BUf9+xDk6t7R
	 FFgo2mMXfQlTWyFSjdiLJZ+PdPC6E0+hMRk6mnobx6qpG4KKBAoPVitLC6wgfVnjPQ
	 gCkTinUbuvIsIoscmSHubRBN8JNulDSXGVGr/0PBkiNNndyuKpRdZMv7pPLsdWD0qw
	 UNHqzPD6LBUCvTZwHKN7CoVEBwT+plkHRDyhGWYSvMhQuvn38wlp5E27qODc/wjjeg
	 VgWYhdR2C/NDFWjLDutf5S7R1vNxivVvlNZOneV49X3v4pKmvCCwZdnbP8THqaVBf7
	 bAntQv2KiGpkA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 6/8] media: cec/core: add a new CEC_LOG_ADDRS_FL_CONFIG_FAILED flag
Date: Fri, 10 Jul 2026 13:07:34 +0200
Message-ID: <d0615766cac30d56b1829cfc4e54f1a56c042a15.1783681656.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783681656.git.hverkuil+cisco@kernel.org>
References: <cover.1783681656.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67280-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F075B73A01F

If claiming a logical address fails, then set the
CEC_LOG_ADDRS_FL_CONFIG_FAILED flag. This makes it possible for
userspace to detect this corner case.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst   | 7 +++++++
 drivers/media/cec/core/cec-adap.c                          | 3 +++
 include/uapi/linux/cec.h                                   | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
index f3293a589dd6..8397bf573798 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
@@ -185,6 +185,13 @@ logical address types are already defined will return with error ``EBUSY``.
 	are CEC devices that can only handle CDC messages.
 
 	All other messages are ignored.
+    * .. _`CEC-LOG-ADDRS-FL-CONFIG-FAILED`:
+
+      - ``CEC_LOG_ADDRS_FL_CONFIG_FAILED``
+      - 8
+      - If this flag is set, then the CEC device failed to claim a free logical
+        address and is in the unconfigured state. This can never happen if
+	``CEC_LOG_ADDRS_FL_ALLOW_UNREG_FALLBACK`` was set as well.
 
 .. tabularcolumns:: |p{7.8cm}|p{1.0cm}|p{8.5cm}|
 
diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 4d14186bfef6..774bf9099183 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1482,6 +1482,7 @@ static int cec_config_thread_func(void *arg)
 	dprintk(1, "physical address: %x.%x.%x.%x, claim %d logical addresses\n",
 		cec_phys_addr_exp(adap->phys_addr), las->num_log_addrs);
 	las->log_addr_mask = 0;
+	las->flags &= ~CEC_LOG_ADDRS_FL_CONFIG_FAILED;
 
 	if (las->log_addr_type[0] == CEC_LOG_ADDR_TYPE_UNREGISTERED)
 		goto configured;
@@ -1614,6 +1615,8 @@ static int cec_config_thread_func(void *arg)
 unconfigure:
 	for (i = 0; i < las->num_log_addrs; i++)
 		las->log_addr[i] = CEC_LOG_ADDR_INVALID;
+	if (adap->phys_addr != CEC_PHYS_ADDR_INVALID)
+		las->flags |= CEC_LOG_ADDRS_FL_CONFIG_FAILED;
 	cec_adap_unconfigure(adap);
 	adap->is_configuring = false;
 	adap->must_reconfigure = false;
diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 81a05c9c0706..fdfc97a6e4ec 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -403,6 +403,8 @@ struct cec_log_addrs {
 #define CEC_LOG_ADDRS_FL_ALLOW_RC_PASSTHRU	(1 << 1)
 /* CDC-Only device: supports only CDC messages */
 #define CEC_LOG_ADDRS_FL_CDC_ONLY		(1 << 2)
+/* Configuration failed */
+#define CEC_LOG_ADDRS_FL_CONFIG_FAILED		(1 << 3)
 
 /**
  * struct cec_drm_connector_info - tells which drm connector is
-- 
2.53.0


