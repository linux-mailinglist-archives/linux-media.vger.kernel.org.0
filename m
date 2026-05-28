Return-Path: <linux-media+bounces-62970-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eODdBVV3GGo8kQgAu9opvQ
	(envelope-from <linux-media+bounces-62970-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 19:11:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B04455F5732
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 19:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57ADE3129D23
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 16:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76162E7179;
	Thu, 28 May 2026 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tiFOCtvW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com [209.85.160.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D633783C0
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779986124; cv=none; b=eZuvy63dkrVFAMKvPtMNoEHACdl7SPjHlDyyRt+wXchNkI4P/XSD6u9d6K2zMqjvh+2VebyE1YE52HYQfcAeX962HDtd4VITJvqGrcnduOA4u50glaEm0MHbTy19WXg1mt72A8QljQfMe0XFa1rAURUTvqS3HyAnuUF5/Mj1bdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779986124; c=relaxed/simple;
	bh=5yhDp8R6zKNYZkVZaAHP6czTm7JOZIuCzndR4V+fFjE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ASUBj8jztjF7ulWaXZUxLLNQ+fhjNguQYVInuNdkPeruJM90dDbezVMUl5JbTj6ApSsHB+cxVFsc78vnfMdkMeJlZQq/m610NeQgrLsJ6bikzTr5PHmB1X4zEGMk+CavdoBJwFh3BC3xjy9MClkI8p1sIwVXXbYmU82LmY3giuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tiFOCtvW; arc=none smtp.client-ip=209.85.160.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com
Received: by mail-qt1-f201.google.com with SMTP id d75a77b69052e-516dd6e4ed4so129670061cf.0
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 09:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779986122; x=1780590922; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wpIpYDonhVzCRqac3h1+9LCONZ2LSPLiYOoRoOQd++A=;
        b=tiFOCtvWiYEGRa6r/PND2SlOvzgSjIx1ubLvqjMG33Qm+lXGK/oi1YmYeSjf88Nf97
         mNBnPL8cdYJzkOAdkR+nSErvM4etw16th4FOOPJD5eFmIwytvJWOqdQt1jByI05Q24Ei
         YZ28YcFF9nO+q8eRdri6wPfK4xfmmP3fUf4Zh98esxkBV7YUkktuqLpERAYM7KAuGtmc
         PERpNIjrUrYebeYS8vz8QpHIkX4MfcOnix8VH53HC9naMSJNjZYIdXcLAOgi8SCQJQIA
         YemyPafTGdBhl1U/3DkEM0mmN5XVl3rx/qj7N5dkvLKL7gznsXQWkX2dWwFQ+ERAk6RO
         j4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779986122; x=1780590922;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpIpYDonhVzCRqac3h1+9LCONZ2LSPLiYOoRoOQd++A=;
        b=T48PGWg/1Oh3pqxKl0aSj0Uj1vbZ8CQqCt08v1XazbxTAkFLmo1wazIt7Qz3iym0IX
         YWf0hvClSlpCegDfn00wrEzfkaT5UIPeWzFvXKPoTOochb5DztZXD4P/ZGqNMOpME8kO
         X2cnwlMC/yq3JDL+jvGsEBrmeCMPp4ERBZjElfBMBH0LNquOVeAumubsLv/hnMDpGdcI
         LpHwa/U81NW09YFsJ+85S9XlavuM1zfeX5y8avbc0JdmpbDO0rLGrt/k0idfsm955e/C
         MFMerr3FPShQ90KgpI/2W4CvEqELc6uGBEcrFTdvZTK6y8LyEiQ3TAwlNPoPxgIewMrR
         Sydg==
X-Gm-Message-State: AOJu0YyN+vaBvkkAv6cuqgaZXUe5/4WNaFWO11WvZuGnPsPDBMIuzdFk
	BG524JLxQpSTXrLNs/gWlabDCQquMC8khiFl1NKHeLtFJ00QvZEdql7bcPqRRd4LLmoJiX9xmJk
	tilV2B0lIlWUeKZsC1fJ7lq24Ju0Bp4nG5IP+8GodkLaYZUAgr+YFeCtyHx5YO3U2q9OJJ+Gng4
	0lsH2EqSD6ierORG6ESneIaNv5jrYkeF9DjBkAl3lKaocfJRiN3WCZ7XPqpUerM1DG2uCVkmazk
	w==
X-Received: from qtqq8-n2.prod.google.com ([2002:a05:622a:8408:20b0:509:2144:daad])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:260f:b0:50b:4a84:aa94 with SMTP id d75a77b69052e-516d42ee019mr388716951cf.7.1779986121415;
 Thu, 28 May 2026 09:35:21 -0700 (PDT)
Date: Thu, 28 May 2026 12:34:36 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260528163448.4031965-1-briandaniels@google.com>
Subject: [PATCH v4l-utils] v4l2-compliance: Add an option to override the
 driver name
From: Brian Daniels <briandaniels@google.com>
To: linux-media@vger.kernel.org
Cc: Brian Daniels <briandaniels@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62970-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B04455F5732
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When using the virtio-media driver, the host and a guest VM are used,
with the guest VM proxying requests to a host device. The driver name in
the guest VM is reported as "virtio-media", when really its proxying
requests to a driver with a different name (for example, "uvcvideo").
For the test to pass, v4l2-compliance needs to know the driver name of
the device on the host because it changes its behavior depending on the
driver under test.

With this new option, the name of the host driver can be passed in on
the command line so the test running in the guest can adapt accordingly.

Assisted-by: Gemini CLI:gemini-3.1-pro
Signed-off-by: Brian Daniels <briandaniels@google.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp | 17 +++++++++++++++++
 utils/v4l2-compliance/v4l2-compliance.h   | 15 ++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 4e5c9d00..ddb4e7a7 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -52,6 +52,7 @@ enum Option {
 	OptHelp = 'h',
 	OptSetMediaDevice = 'm',
 	OptSetMediaDeviceOnly = 'M',
+	OptDriverName = 'N',
 	OptNoWarnings = 'n',
 	OptNoProgress = 'P',
 	OptSetRadioDevice = 'r',
@@ -87,6 +88,7 @@ bool exit_on_warn;
 bool is_vivid;
 bool is_uvcvideo;
 int media_fd = -1;
+std::string override_driver_name;
 unsigned warnings;
 bool has_mmu = true;
 
@@ -130,6 +132,7 @@ static struct option long_options[] = {
 	{"help", no_argument, nullptr, OptHelp},
 	{"verbose", no_argument, nullptr, OptVerbose},
 	{"color", required_argument, nullptr, OptColor},
+	{"driver-name", required_argument, nullptr, OptDriverName},
 	{"no-warnings", no_argument, nullptr, OptNoWarnings},
 	{"no-progress", no_argument, nullptr, OptNoProgress},
 	{"exit-on-fail", no_argument, nullptr, OptExitOnFail},
@@ -255,6 +258,8 @@ static void usage()
 	printf("                     then this defaults to 90%%.\n");
 	printf("  -E, --exit-on-fail Exit on the first fail.\n");
 	printf("  -h, --help         Display this help message.\n");
+	printf("  -N, --driver-name <name>\n");
+	printf("                     Override driver name with <name>.\n");
 	printf("  -C, --color <when> Highlight OK/warn/fail/FAIL strings with colors\n");
 	printf("                     <when> can be set to always, never, or auto (the default)\n");
 	printf("  -n, --no-warnings  Turn off warning messages.\n");
@@ -1026,6 +1031,15 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		printf("Compliance test for device ");
 	else
 		printf("Compliance test for %s device ", driver.c_str());
+
+	struct v4l2_capability real_vcap;
+	node.querycap(real_vcap);
+
+	std::string real_vcap_driver = reinterpret_cast<const char *>(real_vcap.driver);
+	if (driver != real_vcap_driver) {
+		printf("(overridden from %s) ", real_vcap_driver.c_str());
+	}
+
 	printf("%s%s:\n\n", node.device, node.g_direct() ? "" : " (using libv4l2)");
 
 	if (node.g_caps() & (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTURE |
@@ -1811,6 +1825,9 @@ int main(int argc, char **argv)
 				}
 			}
 			break;
+		case OptDriverName:
+			override_driver_name = optarg;
+			break;
 		case OptColor:
 			if (!strcmp(optarg, "always"))
 				show_colors = true;
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 4a7af5f5..563075c6 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -311,7 +311,20 @@ static inline double fract2f(const struct v4l2_fract *f)
 	return (double)f->numerator / (double)f->denominator;
 }
 
-#define doioctl(n, r, p) v4l_named_ioctl((n)->g_v4l_fd(), #r, r, p)
+extern std::string override_driver_name;
+
+inline int wrapped_doioctl(struct node *n, const char *name, unsigned long cmd, void *arg)
+{
+	int retval = v4l_named_ioctl(n->g_v4l_fd(), name, cmd, arg);
+	if (retval == 0 && cmd == VIDIOC_QUERYCAP && arg != nullptr && !override_driver_name.empty()) {
+		struct v4l2_capability *cap = (struct v4l2_capability *)arg;
+		strncpy((char *)cap->driver, override_driver_name.c_str(), sizeof(cap->driver) - 1);
+		cap->driver[sizeof(cap->driver) - 1] = '\0';
+	}
+	return retval;
+}
+
+#define doioctl(n, r, p) wrapped_doioctl(n, #r, r, p)
 
 const char *ok(int res);
 int check_string(const char *s, size_t len);

base-commit: f2a3cb8a59bcce9ac9f7a7c5b71429610d638a12
-- 
2.54.0.794.g4f17f83d09-goog


