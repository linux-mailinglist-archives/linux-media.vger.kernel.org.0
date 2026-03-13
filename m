Return-Path: <linux-media+bounces-55586-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDN5HE7Cs2mEagAAu9opvQ
	(envelope-from <linux-media+bounces-55586-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:52:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 724D827EFF8
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F4D6301BA4D
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F2936AB5B;
	Fri, 13 Mar 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwW7uX/E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E094PMaa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D1344D80
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388360; cv=none; b=TSqmSR/4ia/oJAb92Hd7DcG4PVeW/zIJaoyqb7Kz70poIG9EKLFF6CH/4uWY8ltjfcdtq3GgASDtwhkZaMu7jQyfpP4Wd2ElMD8jZyAMVIYWEXgH7WcmukpiygTCkJLEZnX/68d0+pblWSUV2YHfYzEH2MZ8FIjKEgzv6DYaXKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388360; c=relaxed/simple;
	bh=kRp+pQGG4Ly9vreWnHYVm2xy+z7pQunkmYpqE5Jj5tU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UtJlmtGtOxp1HiTSOpWBHtH+cdzYXCaEqqiSbSBINN564NSkrkam3TKw8JZbe28xTNrzBaOA9G3IJ/SscpmgP3rHu68AhGSw7Wm/ZXdg3rnSRmM0ukJ0sx4W7z1HwNVx5PtokNtxS8p/aF/cytjyaFpjIMGF5kG5PUFYMfBX8hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwW7uX/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E094PMaa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tbca1176366
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9DhIZLID1guj++E0ajGKsf
	vCv+/6MvxYA2ir7qDhcjA=; b=MwW7uX/ERAvfJZJm2nAdP2cSeFYAyr6PYVEcoN
	pww/sOg083WxSBZ4ctkTDFrFzf+EJNa/OUPYnVqEA9e8AlxDNEJ3tniervGqceqH
	t/koM8IXtuuH6kqECWZwg3XXbt+1kdEMj/zOvDExs8K7qPUEYPyNjhMr7qnHDGO9
	nWoNBIA4MZUTPtnQe3RGl+2ZPBdEASHzsSd+281tI5ZDa27VH3Nia6eLM9qR2X+e
	ifRGd+E4dgjF9uVQTac3nohXdncPRBrzzMre1CZxFBPsPYSsluaj0OD7Ojz1l0XB
	zydWnDdDg+7tkCtUCrU/r11rhcI40kGeAtSWlXUbVAw8BhbA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqcgsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:52:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094ba09affso121220391cf.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 00:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773388357; x=1773993157; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9DhIZLID1guj++E0ajGKsfvCv+/6MvxYA2ir7qDhcjA=;
        b=E094PMaayONxMygzeYYTNDxzQg5bTYaUtQAKeYZbBpYPVI4disMnqkEQUaEWgN3P4u
         opX9VcM5qZb5nOq7p0rEYh1ZCb+cR2J53C5ti6dGdPWgQAXbPJdgEbC+22PizeuAz2sG
         LHEFC6Kym7YsmvODMq3ScMzyaIrMvIKges6HMXaOtzQQZmIb+SC+p44iuDo11UxkTPcv
         3qmdcrUgMWFi0sLTsONKOWlJ3ed+8oM/InOCFdQEI6lnLGiTrpnHdPsvrX4zBLr9f87R
         2QLzjetNJ/KlMexmcwP2W5ik9eOKWfVpEXBVek7MmbhMe/jNZrUd3Qd9+fvDvlzj44kn
         pJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388357; x=1773993157;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DhIZLID1guj++E0ajGKsfvCv+/6MvxYA2ir7qDhcjA=;
        b=XIW5qiCsDcunkYsxhDjnuM7ijhWKkk8dYc4TOE258Uv6somHbimnao182vbIg5lhSz
         YhEXAk7u5xbkNLOMmEGojv0lkfRHrk/OlCQzhBbUFEodeexU62LZIJpVHXnfmvNgn5ab
         SNZgdOxkvM1MJzq07mJXp0oO9wC/PtGCXISP41LO8I/CpJb3yLZ4gjrRyloQIqZd86ma
         /GUkICRD68eJp6AeasBngVv/0Vg1xManHw96mgCkd8MZO8gCitPbWLBXbcMfJW9e/GuG
         bBvc3M/2tCVTKtuhOUq1SbXf8K1O/384NisRG8vEx7wWfb9o1fTCMA023h3HJlLy2LJZ
         JCgA==
X-Gm-Message-State: AOJu0YwcY7Dwod/lNVKslzz+Dq0ZHmFlmnHXyE2SRnII5G2eNw6EGZKq
	BHh68ffa2Fx9a0urL0cthIxt3XB6g6LKezREDdI2xqLdhanPu6/Ye1npSGXnRpedRt1DIHcc9hW
	8DEeqCDLDGw/wZI3oaGruw2cYMCV8I7dgkISUa38RCW9n6J5gvDlkFF/i/kQmDb3FSBICUxrLCg
	==
X-Gm-Gg: ATEYQzzdWBua+GABdBLXeq0v1fMt1T0syqfZuQPOrnYy//mORq/c9jg98Q6ch92wVTQ
	PAD4Hhz4fTVy+ER0SFaCywCzCYzIeQKlp7jo0zNv5gGgQecCwq3XdZTk6fa+aOT1VkdQiAYRd9q
	r5r+qYTAc4WhbHKgeS3TKfC78RMnZvjH98/oGxvfRnHjZr6jczn70jzX89azqU5FW1C54Eud+o7
	o8dsoLJcxNUBHh/ZV8KoJq4GNOvrx7Fi2X3sLDB4f8hVZ1Zy9MshkKRF7+S3fh8EnUOzyj66z/U
	RsF5wsFAhaNzh0rQ4ZTyR0HLC0kY9EGGiiiaG3zNHG9migFRQAIZyclVzB93DY0BGDav9q3njRo
	ngBhKqtEyXalS+xTSWEd3csDUWIuoAeRK5N4aSLAJr/QQCdwLIgFXLs8V2GcWreX+1yXSln1xyL
	YlmuamyZHSXQXLsE7sN/25K/wlz4xc6sIS/x8=
X-Received: by 2002:a05:620a:4041:b0:8cd:8e07:46a7 with SMTP id af79cd13be357-8cdb5a6b403mr306800985a.23.1773388357489;
        Fri, 13 Mar 2026 00:52:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:8cd:8e07:46a7 with SMTP id af79cd13be357-8cdb5a6b403mr306799285a.23.1773388356992;
        Fri, 13 Mar 2026 00:52:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1563775a2sm1347475e87.89.2026.03.13.00.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:52:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/8] media: qcom: iris: rework platform data handling
Date: Fri, 13 Mar 2026 09:52:32 +0200
Message-Id: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEDCs2kC/4XQ32rDIBQG8FcJXs/Ov4nmau8xdmHMcRWapFVjO
 0rffTYZrLCU3QhH+H4f51xRhOAhora6ogDZRz+NZZAvFbJ7M34C9n2ZESOsJow12Acf8fFgkpv
 CgHuTDLbSKgJK9NQ0qASPAZy/LOj7xzoHOM3FTusn6kwEbKdh8KmtRrik18HEBAE91rZVKZWUU
 o0zjHNcq93BH3E8+2T3uJfacNfZ2oiuzeJvuiaUkjU3d2eLSe1qYbuOUwPPApyugbWzLILjoJg
 k2GmugGlohG7aLNF9tb2PaQpfy/kyXXb7uZTaulSmmGDLrOSSa6eFepti3J1mc7gfY1eeRc3sf
 4kVyVhHeG24VcI+kfivxCndlHiRXOmRyopeQP9EEo8S35REkajQrOmd0KTekm632zeAQyZNdAI
 AAA==
X-Change-ID: 20260227-iris-platform-data-c5c80e84d1a7
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6807;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kRp+pQGG4Ly9vreWnHYVm2xy+z7pQunkmYpqE5Jj5tU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps8JCKZFvmn3YxqmIy2PMJy+5x8Y+sSpSqTP9y
 PdmR+GZd2uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabPCQgAKCRCLPIo+Aiko
 1TFdB/4gSqXdoP4sTpxiRNlsTCqbD33e0AZFLa08dfyjfThiZ+PkCK0nWS0K5Kcx/VdOcBqQ5Qo
 ElpdbWc4mxW643VkupUwWjU9SZe9BDwulNInzILHkPk/WwL72nYtDD8l2HGy84TAu0mAYbulXsZ
 89Vpyk9SyEXvb4VOqFv6rigxH5BSkVN16o8aFAFtXmlBR9yHivta0+aLK30w24UdnX/sSDg210A
 /GCrJ8kd8FP02nZwp6J6gEv9TkHuCV5Ab/8zmXwWecWfxZ0+RydWuMrpFs58ePHHCBBBBTYkb3f
 htRhEGXsW9EWYHnQJK1zJeBWu2SPRA+jS+p/w8Yny3LmnxbO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: VoFRKYf1eovZOZ65jKNlPZXozfaeQisa
X-Proofpoint-GUID: VoFRKYf1eovZOZ65jKNlPZXozfaeQisa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MSBTYWx0ZWRfXy3yeVShL/xFm
 nw2tLmR6YR2C2TkHuRwi7AylQOBUu6v1XftKXcLbfy1TUNDw2UxhmViF4kUi7lyV+hxOGN3VoBn
 q6IImY2+FsoiZmbI+4kd3aV6UxGZSoGG40cNBil6GDdC1Z7304gASgzvKepYo52VThlVZGu+Z7/
 LIwC3bDm9vFJdWhYILrBMO20uDMknDGrx8gUrkvRIVMKJV+X+pqMhnsCPghIOXYq57uYQ+WhwCI
 RAgmM+s2xZjFaN8a1ukktkK73OMw3C4p65t7GU3lIkmZJ4fceogjfY/qxWT+w+EIZ3IXxxTTrrH
 JW7vTS+L3xWILZY8v2hnq1laHbQtIOaie6H6Go1gukvdtci7pOFVQLBrAEVD5WYkfAkmkIPLMHv
 H7g+wnerLWpqtt45QMBSMUo8TEhFkRRSpEKZxH6VduEaIZ21OHEIHRYZ9nUAwBa1rUrglkMcRrW
 EZ+2mWE5KuATu8yJdXw==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b3c246 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ubImqinWzueDJ8YnIyYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130061
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55586-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 724D827EFF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently platform data for the iris devices contain a mixture of
hadware and software description. This seems to work in simple cases,
but as the driver matures, it leads to strange decisions.

For example, the recent series extending SC7280 support to be able to
use HFI Gen2 firmware ended up duplicating SC7280 data, using
SM8550-related structs even though the hardware hasn't changed.

Another example, SM8450 and SM8350 are also simiar cores (and similar to
the existing SM8250), however SM8450 will have to go to the same file as
VPU3 cores just because of the firmware interface.

Last, but not least, this leads to a lot of copy-paste duplicates
between platforms, having similar firmware interfaces. It damages
readability and complicates adding support for new platforms.

Rework Iris platform data, splitting it into hardware description
(definied by the GPU core) and HFI Gen-related firmware data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Added missing kerneldoc for struct iris_core (Dikshita)
- Dropped two more unused defines, leftovers from the split
- Link to v4: https://lore.kernel.org/r/20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com

Changes in v4:
- Renamed iris_hfi_gen1_ops instances and related functions to contain
  _sys_ (Dikshita)
- Link to v3: https://lore.kernel.org/r/20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com

Changes in v3:
- Dropped the config_params / subscription_params patches for now,
  let's get more different platforms in first, determining the common
  base and the best way to handle the differences.
- Dropped set_preset_registers callback, call
  iris_vpu_set_preset_registers() directly (Dikshita)
- Renamed HFI ops to hfi_sys_ops and hfi_session_ops (Dikshita)
- Dropped (unused) hfi_response_ops from struct iris_core (Dikshita)
- Renamed hfi_response_handler and get_instance callbacks to follow
  other hfi_sys_ops callbacks.
- Link to v2: https://lore.kernel.org/r/20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com

Changes in v2:
- Fixed build error in the interim patch, the fix sneaked to the wrong
  patch in rebases.
- Link to v1: https://lore.kernel.org/r/20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      media: qcom: iris: drop pas_id from the iris_platform_data struct
      media: qcom: iris: use common set_preset_registers function
      media: qcom: iris: don't use function indirection in gen2-specific code
      media: qcom: iris: split HFI session ops from core ops
      media: qcom: iris: merge hfi_response_ops and hfi_command_ops
      media: qcom: iris: move get_instance to iris_hfi_sys_ops
      media: qcom: iris: split firmware_data from raw platform data
      media: qcom: iris: split platform data from firmware data

 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  88 ++---
 drivers/media/platform/qcom/iris/iris_common.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   8 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  54 ++--
 drivers/media/platform/qcom/iris/iris_firmware.c   |  11 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   6 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  13 +-
 .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 167 +---------
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   6 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  43 ++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  11 +-
 .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 358 +--------------------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 115 ++++---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  11 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  90 +++---
 .../platform/qcom/iris/iris_platform_sm8250.h      |  29 ++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  31 ++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 124 +++++++
 .../media/platform/qcom/iris/iris_platform_vpu3.c  | 210 ++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   9 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 29 files changed, 680 insertions(+), 759 deletions(-)
---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20260227-iris-platform-data-c5c80e84d1a7
prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v4
prerequisite-patch-id: 615a763749fdc0c4ee184478bc64120972d8c7a1
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497:v5
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449

Best regards,
-- 
With best wishes
Dmitry


