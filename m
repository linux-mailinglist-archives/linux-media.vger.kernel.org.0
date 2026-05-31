Return-Path: <linux-media+bounces-63157-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Iys1IVzNG2prGQkAu9opvQ
	(envelope-from <linux-media+bounces-63157-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:55:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8DC6149AD
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57C65302DB61
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 05:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A3432470A;
	Sun, 31 May 2026 05:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJZfuWf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ri1P7tvD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354EC7DA66
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206929; cv=none; b=i+VmV6FCElE/ZFJVMle8mKW3eS/yDr/ffOK4GCDmqOe7Cu379+JIdfycaHx5EQfHCRwVXWg0Cz9JhtJLPIKzXP1zVxCnF1tF4uH7Z/bB4+bS5v3DJx2MbWel10ba5t1qGiAoVf7qqZmyTwlwC/V0hacWHkzwYiMSATjfU5+Emds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206929; c=relaxed/simple;
	bh=aWWHzgXXbLhAdPIfZkTluIIEU0fJsmuZG+EK0Mb9zUY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L+A3MRLNHdgkh8fE7Alq6iRwa9irGAzIcU81PORSQYhlYcqvGa8YKmSwH7k/I6c+w5KhueFdC/2lOZ/Z33dCeFjnv04q+8lc9X/l5y4Hc+BLeqPk2Po84gcDAtkISCBgjPRBv8lJi5Pf+5vP38ZSfsfiyrIIvGKkBEcgV6v5YSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJZfuWf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ri1P7tvD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V1pAIR1632680
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gDsluyIYqDzR/a+ynOYZLg
	EdTtTH0lfZipUYx9zJWus=; b=LJZfuWf3PvImEjmJ3K7K/vTm9ea4e5PmEyJleJ
	bLrkVTBxfnqBE1n4UvvwAVC97wccoNEY9KajsRzPgCnPBwhyxzFKTS9ll6E1VAJs
	9t/hvuPM8Az5o5vP1toHRShddYm8fVhw/7gAYC+tJoChgXqrVzgbl0gq0b3q7ICp
	VttrSkIMQ0XMfMB5rlIctkEMNOdizFxymIWMORncL+888Qw6R675EgdGv72VQyX0
	7hRDqrrqdAnHykJuE70bZEviM/vUOY/UWBOqsGjXKix8ihiY5wP6FSS6Ov3gvneq
	Rn2PQRFNeE601Ky/thE6sbWKQ5UYVO3KVFQgn2s6z6BvAn1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux52e1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf3636d6c0so12163205ad.2
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 22:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206927; x=1780811727; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDsluyIYqDzR/a+ynOYZLgEdTtTH0lfZipUYx9zJWus=;
        b=Ri1P7tvDQYzlsryMy8hP4GUQ5YKAgYS8JlaGvBAVWlZnHQqKdZatbQVviYWebnz/wJ
         8Va/R73BqbgoK34TlY21swbRn+znCNrF/xmf4qFtdKkTyTtiiMclAXtmRhQDaRFiqo3M
         D02SXPwuxbLNh9JBZVcJhO9mg8NMHgc9KZDiAwNyFqK0zlHBUoLdxNlBIGpO4cHNdbj8
         nBWRV5SRSB8svpNI3el5A2Jeu164d6x28Xz1ybGR0FWTZaIAWZIEPgiNL1oNZscnImfi
         Rbg1paElpwyL7EDl1eb0iap0N5O1uWNylSUsVGYQdiZMgIcYdu7f/CM1n2un/4yYlCeq
         Fopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206927; x=1780811727;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDsluyIYqDzR/a+ynOYZLgEdTtTH0lfZipUYx9zJWus=;
        b=OCzUy8wXN9v/ZVdA1V58ylxIH2WQnuHEEWpYdPi5oE5z6R7XmJhWo8g3xqkFWPbrCh
         MVwpi34DOn/AUKzXx5fkI2+PZi81hVvlYwlJjo+3oWgkhfOwlVBTO4nMnZGIq8UALFFo
         I1ayWH+c0JCdKPe+dbN2ES8ag3eByaGV5EEIU5tspE0e955bl6n+9jdXHaATWz0mkblB
         e0VJ8vcjwCZM8hV1UbAmP+ZksupkcLN+/IfwG0phkYS8H3z4DGENRTnhk8XV8VS0WrYG
         zL+mHIYxMZkw0ZofFjykczrrUKjA82fr5mstxWvDOWIPl1Go0YVeQqoWGD2qCqADUDxU
         wLAg==
X-Gm-Message-State: AOJu0YwR9dxIyi8KwOiPqzOaY7zSD0c/ZVsoQz4B9b8ytVVM1q0JRPoO
	/mqt97RyZ6siLEYSB4dQoEeJQxMlq3pTmDEKCaXibQHSLBQHbyM7PVtH66NpLP0iet8Epgp/OfS
	CUo5PkfrHmDReFBvkmj2CWqcJ/LR7XOEWI4msuafqjHuUsgvOK6R/no5dlqe6xCo7HA==
X-Gm-Gg: Acq92OHBj++NtLWQqtlgODTdyVG3zHiUqPVSCvA+/g2RLJtrOXKdsdtpQrrpQYcbAAv
	BAj+dLxeDYhhttxYSHIweJAWLBYhsPxw+OoyGXrd3Oft31nvEn/tjkJ9S26Utvfdo7EU6nvZJ2d
	9YsI6+NcMlMkpnkZ/wXxlSv2PDxvFoCiq1ZAX5WO4nGTTMATGb8B4+3ZG9X0i1Zl7fcl5bHWZs9
	aHsx18Ti4++1Tur0zinORHZlFCCopkAneRbRcrF9aQcO/cItcdyJRugSoe2soxh8xOcvV8GJHSR
	zoiDbjYsKHu4B+cqcjxoVQu8BtQ3rx9GEgx71VBJOkc/9ztZJ0fCEVtgKWvY57ty5qL2mYjIpFN
	eaIONbmcaxCstzq5GIS6y92qwlJPUSvP/nNRnH3TsQa+dAXS0dnQCyMy3bKT9yLeaXg==
X-Received: by 2002:a17:902:d4ce:b0:2be:3626:dd42 with SMTP id d9443c01a7336-2bf36793909mr72969485ad.6.1780206926757;
        Sat, 30 May 2026 22:55:26 -0700 (PDT)
X-Received: by 2002:a17:902:d4ce:b0:2be:3626:dd42 with SMTP id d9443c01a7336-2bf36793909mr72969275ad.6.1780206926294;
        Sat, 30 May 2026 22:55:26 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:55:25 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v3 0/7] media: qcom: iris: miscellaneous code-quality fixes
Date: Sun, 31 May 2026 11:20:34 +0530
Message-Id: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACrMG2oC/x2MywqAIBAAf0X2nGD2IPqV6GC61h7UWCOC8N+Tj
 sMw80JGJswwixcYb8qUYoWuEWAPE3eU5CqDVnpUQ9dKYsrSJldFODndGDBesp+M8QZtv7UOans
 yenr+77KW8gFChORDZwAAAA==
X-Change-ID: 20260531-iris-code-improvement-48aafaec4b1d
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=1857;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=aWWHzgXXbLhAdPIfZkTluIIEU0fJsmuZG+EK0Mb9zUY=;
 b=OORsXq3AGT0po37yjAg5EC8K4ArUSATmU9qRxgmdPS9f0JiQYawNF2ixwY19woAdf/8Iv6gxU
 LQY4RIGm2SRCOTodSB+LMrZi2Jdwki79UetRXLF00xO1OFw1gavoQe7
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: VYLeDk9Be1-27frxAZdeU5LlMOwN7bQy
X-Proofpoint-ORIG-GUID: VYLeDk9Be1-27frxAZdeU5LlMOwN7bQy
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1bcd4f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z3I29kXYegTyEPjnXUAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfXwCJ6BMaDWD0W
 QiedN4V3vuqNGt6WRfeUoHONcSum7s9m8DYY4BECJqN1Jy8cx8IztSfcoyVnT5oIlxQ3xT228ej
 fTRFHrHTm6gYrloblt9xBYhEqYSgD8ravGqgG2MtqaBCWbh57EvuOPx1ix6N0uza68OMEkKPpFt
 7i0+HBaaQw9KlBoGztBicpqf4zSwgtWo9n6xJBP/AW/vBo8u+0CYfoB7T2valJ/7xQd2QCl7HLi
 y7TuuSfrHccbHCKMxzsZzmzak3nalCW3HdfIc4VbAbtpuOelxvTRSSk2u82jZ0CXc+SWh1NxhmL
 3d/U9eG2neLoQrA2W4ipESD7gIi2Os075TT3iXEcuu7D7tOqFxUoKPltweVl3uXsR9rmPDhcHRD
 luGBV5cAqZM7PFXTTLhOKFO1+KvOXu5ZmZDC58bNTXG/rzUxNNZR/QrZxwcSTb9P9Mof0y+597q
 UdIhxoKaBFbOvsGrQYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63157-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA8DC6149AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series addresses a set of independent code-quality issues found 
during review of the Qualcomm iris video driver.

No functional changes are intended.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Rebased and resolved merge conflicts (Bryan)
- Link to v2: https://lore.kernel.org/r/20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com 

Changes in v2:
- Updated variables names for iris_get_int_buf_tbl helper (Bryan)
- Removed un-necessary fixes tags (Bryan, Konrad)
- Addressed other comments (Bryan, Konrad)
- Link to v1: https://lore.kernel.org/r/20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com

---
Dikshita Agarwal (7):
      media: qcom: iris: Centralize internal buffer table selection
      media: qcom: iris: fix state-change debug log printing stale value
      media: qcom: iris: Fix bitmask test in iris_allow_cmd()
      media: qcom: iris: Remove dead assignment in iris_hfi_gen2_set_tier()
      media: qcom: iris: Remove duplicate HFI_PROP_OPB_ENABLE entry
      media: qcom: iris: Add missing break in iris_hfi_gen2_session_set_codec()
      media: qcom: iris: Make iris_destroy_internal_buffer() return void

 drivers/media/platform/qcom/iris/iris_buffer.c     | 123 +++++----------------
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |   7 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   4 +-
 drivers/media/platform/qcom/iris/iris_state.c      |   4 +-
 6 files changed, 40 insertions(+), 102 deletions(-)
---
base-commit: a96fcde9fa9a6696991d1f172a8bc2bade82a6d9
change-id: 20260531-iris-code-improvement-48aafaec4b1d

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


