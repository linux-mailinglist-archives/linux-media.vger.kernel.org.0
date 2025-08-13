Return-Path: <linux-media+bounces-39813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DB5B24996
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 14:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6448316DF8C
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5373F23D7E3;
	Wed, 13 Aug 2025 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KbEYuWTR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E2822259F
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 12:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755088574; cv=none; b=QemkFE0iRoo0AavvjFyeIiNaOxXQj1oPAISw4B3wZjKTdpDNucAkxxEVP8nFIm05kT01by8K5JrufetPKuCZ0xEuzujJ7tuHxmw/ZOGDmmBJCHyWy5xirV+Z7Wx08TkIW9HUpIc2IlG+mRaWVTNQgqsgVrkldlAbEdJVEpGVtrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755088574; c=relaxed/simple;
	bh=rjv/62VujAs6Sqn5q1QUkhjoU1XCW0uhLPuA6OFYXl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=GorCa8WYx2retDpoDV+wIa4zbdTrib/fjEaih7icB1eivgr7XfQ7J4xRSobZ1rRp1DSjO80SeVC8GNvPJxf8YcEG50rOFL/DhBoTbYop/v7BjA+OKD6ceNxV8QcU02C/SMpNlxUxjLIOXXamXt4sPlPsxfcCFWRQDLyfPo71AGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KbEYuWTR; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DCF9VX013789;
	Wed, 13 Aug 2025 14:36:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=5uzkHKNY9qdKVb2rwtTZD8
	wmImuVxqqmWZ6877y//Zk=; b=KbEYuWTR/f1sKxQpyC/XlKN6LEoLFHqQkPYd2+
	gtM/HxMpXoaL8Vj39CsWtsBLt2uQ1mlVoTU3VvEmY3gSUHGtxu9mK3w47sgNY30q
	Ow6JH4FeWSa1PGa5Y0RJqJzpoZgwUIrA2os2/ZG3uNbzetsriDJbhGSpsgG4VytL
	trnTucriuSUxm3CdVy9ZvgeZ6Qr8nayGUAF+YC9cLdJwgTeegqS17Y5Im/wOzNym
	0/fAUY1Qhu7mkx49JwKHwF/8BhLMZ7gzzCmCINNZolZOtUb4gJYXrQLvu127X/K0
	bE/HMTeMmMTJIi1C4DQlxwT9IP9iF7vc9bT7X5hfJi3MUDeg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dw7gepxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 14:36:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0A06E40045;
	Wed, 13 Aug 2025 14:35:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E76173D3F6;
	Wed, 13 Aug 2025 14:35:25 +0200 (CEST)
Received: from localhost (10.130.78.67) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 14:35:25 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Wed, 13 Aug 2025 14:34:57 +0200
Subject: [PATCH v4l-utils] v4l2-ctl: Fix failure on controls starting with
 a digit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-fix_3alock-v1-1-7396410bac0b@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAHCGnGgC/x2MWwqAIBAAryL7neCjKLpKRIhttSQZWhKEd0/6H
 IaZFyIGwgg9eyFgokj+KCArBnYzx4qc5sKghGpEJzVf6Jm0cd7ufJmNVa0wqJWEEpwBi/1nA6T
 a8fsiF2HM+QM2wGxVZwAAAA==
X-Change-ID: 20250813-fix_3alock-fdac270ae321
To: <linux-media@vger.kernel.org>
CC: <hverkuil@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01

Specifically querying the 3a_lock control from v4l2-ctl fails :

  $ v4l2-ctl -C 3a_lock
  VIDIOC_G_EXT_CTRLS: failed: Invalid argument
  : 0

A similar issue occurs when setting the control :

  $ v4l2-ctl -c 3a_lock=0
  VIDIOC_S_EXT_CTRLS: failed: Invalid argument
  Error setting controls: Invalid argument

This does not happen with other controls. Internally, v4l2-ctl parses
its arguments in order and differentiates a control name from a value
using this check :

  if (isdigit(s[0]))

This means if the argument starts with a letter, it is a control
name; otherwise, it is a control value. This works well for all controls
except for 3a_lock, which starts with a digit and is wrongly detected as
a control value.

Currently, 3a_lock is the only control that starts with a digit.

Introduce is_digits() to check if a string contains only digits, and
therefore would return false when parsing '3a_lock'. Use is_digits() for
control get and set operations, and expand its use to all other relevant
cases.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 9 +++++----
 utils/v4l2-ctl/v4l2-ctl-stds.cpp   | 2 +-
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp | 4 ++--
 utils/v4l2-ctl/v4l2-ctl.cpp        | 4 ++--
 utils/v4l2-ctl/v4l2-ctl.h          | 9 +++++++++
 5 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 32dbe9de7162258ec19c49580bd36c0971fd7fe6..792f4c95266364a506f958d5544c6f06fa3b36b7 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -1000,7 +1000,7 @@ void common_process_controls(cv4l_fd &fd)
 	find_controls(fd);
 	for (const auto &get_ctrl : get_ctrls) {
 		std::string s = get_ctrl;
-		if (isdigit(s[0])) {
+		if (is_digits(s)) {
 			__u32 id = strtoul(s.c_str(), nullptr, 0);
 			if (ctrl_id2str.find(id) != ctrl_id2str.end())
 				s = ctrl_id2str[id];
@@ -1012,7 +1012,7 @@ void common_process_controls(cv4l_fd &fd)
 	}
 	for (const auto &set_ctrl : set_ctrls) {
 		std::string s = set_ctrl.first;
-		if (isdigit(s[0])) {
+		if (is_digits(s)) {
 			__u32 id = strtoul(s.c_str(), nullptr, 0);
 			if (ctrl_id2str.find(id) != ctrl_id2str.end())
 				s = ctrl_id2str[id];
@@ -1212,9 +1212,10 @@ void common_set(cv4l_fd &_fd)
 		memset(&ctrls, 0, sizeof(ctrls));
 		for (const auto &set_ctrl : set_ctrls) {
 			std::string s = set_ctrl.first;
-			if (isdigit(s[0])) {
+			if (is_digits(s)) {
 				__u32 id = strtoul(s.c_str(), nullptr, 0);
 				s = ctrl_id2str[id];
+				printf("%s\n", s.c_str());
 			}
 			struct v4l2_ext_control ctrl;
 			struct v4l2_query_ext_ctrl &qc = ctrl_str2q[s];
@@ -1359,7 +1360,7 @@ void common_get(cv4l_fd &_fd)
 		memset(&ctrls, 0, sizeof(ctrls));
 		for (const auto &get_ctrl : get_ctrls) {
 			std::string s = get_ctrl;
-			if (isdigit(s[0])) {
+			if (is_digits(s)) {
 				__u32 id = strtoul(s.c_str(), nullptr, 0);
 				s = ctrl_id2str[id];
 			}
diff --git a/utils/v4l2-ctl/v4l2-ctl-stds.cpp b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
index 8c9abf5df687d3aeaf68089e702566854bd34bd0..5e23cc5708b7c33e4cc8562d2ec1d13c3efcd70c 100644
--- a/utils/v4l2-ctl/v4l2-ctl-stds.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
@@ -445,7 +445,7 @@ void stds_cmd(int ch, char *optarg)
 			else
 				standard = V4L2_STD_SECAM;
 		}
-		else if (isdigit(optarg[0])) {
+		else if (is_digits(optarg)) {
 			standard = strtol(optarg, nullptr, 0) | (1ULL << 63);
 		} else {
 			fprintf(stderr, "Unknown standard '%s'\n", optarg);
diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
index 498362217149df1b854f138fd642dc938e7a90fb..2384200248d567d14be0628aa2e1158b345fc57f 100644
--- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
@@ -133,7 +133,7 @@ void vidcap_cmd(int ch, char *optarg)
 							   optarg[2], optarg[3]);
 			if (be_pixfmt)
 				frmsize.pixel_format |= 1U << 31;
-		} else if (isdigit(optarg[0])) {
+		} else if (is_digits(optarg)) {
 			frmsize.pixel_format = strtol(optarg, nullptr, 0);
 		} else {
 			fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
@@ -165,7 +165,7 @@ void vidcap_cmd(int ch, char *optarg)
 							    value[2], value[3]);
 					if (be_pixfmt)
 						frmival.pixel_format |= 1U << 31;
-				} else if (isdigit(optarg[0])) {
+				} else if (is_digits(optarg)) {
 					frmival.pixel_format = strtol(value, nullptr, 0);
 				} else {
 					fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 0eb4bb5c9200a32c1fa056d73d2c1f4e050e7e23..cfe33f32f52286a5b23421ad4222918feafe03d2 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -812,7 +812,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
 						    value[2], value[3]);
 				if (be_pixfmt)
 					pixelformat |= 1U << 31;
-			} else if (isdigit(value[0])) {
+			} else if (is_digits(value)) {
 				pixelformat = strtol(value, nullptr, 0);
 			} else {
 				fprintf(stderr, "The pixelformat '%s' is invalid\n", value);
@@ -950,7 +950,7 @@ static __u32 parse_event(const char *e, const char **name)
 	__u32 event = 0;
 
 	*name = "0";
-	if (isdigit(e[0])) {
+	if (is_digits(e)) {
 		event = strtoul(e, nullptr, 0);
 		if (event == V4L2_EVENT_CTRL) {
 			fprintf(stderr, "Missing control name for ctrl event, use ctrl=<name>\n");
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index b0d42110ca0fbbf05dc3957a6fe08f426947b871..132ac64a35414a9be47997ca1b26319ce5adc664 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -1,9 +1,11 @@
 #ifndef _V4L2_CTL_H
 #define _V4L2_CTL_H
 
+#include <algorithm>
 #include <cstdint>
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
+#include <string>
 #include <v4l-getsubopt.h>
 
 #include <v4l2-info.h>
@@ -331,6 +333,13 @@ static inline bool subscribe_event(cv4l_fd &fd, __u32 type)
 	return !fd.subscribe_event(sub);
 }
 
+static inline bool is_digits(const std::string &str)
+{
+	if (str.empty())
+		return false;
+	return std::all_of(str.begin(), str.end(), isdigit);
+}
+
 #define doioctl(n, r, p) doioctl_name(n, r, p, #r)
 
 #define info(fmt, args...) 			\

---
base-commit: 48316b8a20aac35f982991b617f84fb3c104e7b0
change-id: 20250813-fix_3alock-fdac270ae321

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


