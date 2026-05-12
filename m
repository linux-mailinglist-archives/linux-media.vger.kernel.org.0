Return-Path: <linux-media+bounces-61220-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKyxDtXrAmpKygEAu9opvQ
	(envelope-from <linux-media+bounces-61220-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 10:59:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 370E251D267
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 10:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85A93303572B
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14E33A4F5B;
	Tue, 12 May 2026 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpSIET12";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmQeB1vw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4134D39D6CC
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576131; cv=none; b=JOqWNQAo7k6RaFia7e+m4aqN+nzrpO3SrZkGgCd4YzxW/GrtOKbQjM2JndMyCDeC8bznhPAfD0NXAa6dIq514DRRzoqi1gp1afybcERbwfm9MSvFk4+j1bgb9dOivSOqxQYYw/ha//m1rSctrRDv9ESTIagrlpurVkepDrJuFqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576131; c=relaxed/simple;
	bh=gwtNvlfUubWDaiqh/mFhnWgfbZIOj0eIrfEYWmfkJpM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YUEneXSEge5z8Sc4MCvghrdVxIYEHckmGylTkJNjUYh+vYktHQyTBu34de38P/tmRMMqITIv0oqqT7WHxECgcr77U+4AtU64ntahsvOnZLjmio/5ARPKeFdQttYFVd0qCPHdNBHXE43mMlZ7FDiNx0ZcLmkgG0tgpSNT/cGVoeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpSIET12; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmQeB1vw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5IrgC2186527
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9mJA7itZBXELD2JlCu9s+u
	KTEHrl+15jJgnmgnLk8A0=; b=PpSIET122qZNfTDJEDLzy/CordvUThLK3VpvHd
	tjPchpqVD7oiDHkVKBOJVB+iauAZBZPEVNpj4btg2MOHWVCk38+mUnr983URinKX
	RhMQMDo6P12VV/uLY3PG+FBykSVj7I6ql7AftGpDsNr3AW6UYG7zMLpaBOUXF6/o
	8tbCEhxDgLjQJ8no/UR4iO9Jpitb3GD60m9kY+tDfAtVJDyoD/jnCJFU+WjRqVql
	wKoOkIpqCNjzODxJ4p/emMw0NjFkCKZOzAwwR8l0da1nMX7ER/1fQ4CWqLSGYl9f
	SiJz68FJorzN01vuiD+Xa52Hc7tsGPdryD6mb2681n4n5n0Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0t90p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba224c3ffdso72240955ad.0
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 01:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778576120; x=1779180920; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9mJA7itZBXELD2JlCu9s+uKTEHrl+15jJgnmgnLk8A0=;
        b=dmQeB1vwmZcJoj2jF2nX8o3OktIADH45qffKusIZaPX+KPTTkl87pY9lZkNHnmIgnb
         mSBdr413VXdwODC1mJEsDK0rJ5cgJGZLDoPTF5XgVwoQNs3dae+HSdYt9rEn5c3hKJQu
         NBPMy9mN207ZjRBUpK5WRSfRJSs95Ien61LW95ztWjt7db5qJDSCdYcItGTlOwLcC4mG
         12U4oX4Qt9QpU34VosIT4s7+YcLTqLHhUnj6LvWw3zi7XAHgTZjZyiHNnIYVobORHbzD
         FzDSqLoaQ7yt657u9b2pvcuVKyplb0syVgQLz4uE7KAREEP+MvdJjNl+UJ+N55bKYKes
         JnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576120; x=1779180920;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mJA7itZBXELD2JlCu9s+uKTEHrl+15jJgnmgnLk8A0=;
        b=BvhZHGFAw7lx2VWGb/08vbpM7xaWFxP5N//WIeI3B3FAN5W1EgCIDGiqS0QmNZ789+
         Q5QjHvb1IfTqyu4bRzF6YmD0ZH15kaBJnO7QFTejEnD9MLOkFYBvY9uyKA7DM2PglSPA
         0QwfkidHkpVCJJOMSSt2cNc4qfBKfwm5KjRat1a6Xj9dLIRGGYxA65DKLJ+QVdGgJNyk
         CBcAYeUrqZd+NwngZ3cqe+j7vGPWHYaPBjaZ5v6+5pxnVqtJKyKCNtak37rZ36DvQ/+b
         hZFpjlMtVKu9Un1TmQVPMXAEZxFIygQF1P18tAzvIX1gLuNwRoohAVSJHzL0TIXb+58M
         5wcw==
X-Gm-Message-State: AOJu0YwVYmN/Mv46ghPU+CQBGwZcg7UkVF9UDwoLlZaxl+Laz+9FW92e
	n1N0F4jKCRa1GuPlsTB8cCw8eleavpoAB1LyIhkFef5eGx6UsFWL7wkSH0M0iQN2i8HawIfbTf3
	A9wk11/vi6jmkyCK/C0Zkvm76D95ANOCkJ7j3uVXiMvOQ9Epwagj3QO4IqsMEjljk2Q==
X-Gm-Gg: Acq92OGY7BLQpCCo2sDy1huQ4ZW1bztEwScZgTaaRpA1KFxNCZE/uc1NmhmPuZ0NF+v
	RQmGhPAI1N/yMdQE5gXL6P9qmasOyVQaZX0NhoUJcBfgk0OePKfoJyxyE6dZHLVDayGiv3dJ9fu
	p5n7KcCPNFCBt+2rgzyQIEaTBTsQFkHyq58h/U01t9vOtWY1H5xfDFkbY4vKEXDEoiwfGfSLft7
	OvuLgXGACbmIfJ9xg73vcwKMIM+Nh7XD6ABvi6GnJrQknl5RXodgvHQYuuDrLcGQWM14BUQjigm
	BvCqO6/2SJ6Nr6LN+gOaZDrHBx7yk53pzV7b8uA7JtegnRzSbXXPRw86g/jkKBC6ZdK+o8Uos4F
	ZOspuXaREZby7Cz+RaZJ3y15KoImzAvsKf5kgloO9pT8Z6ObtDs395DUAkoZnMLd6ezGVFg6jYD
	+82XQdoQ/vGDPHBhiZ6aJy
X-Received: by 2002:a17:902:f710:b0:2bd:412:21fb with SMTP id d9443c01a7336-2bd04123306mr17817345ad.8.1778576119480;
        Tue, 12 May 2026 01:55:19 -0700 (PDT)
X-Received: by 2002:a17:902:f710:b0:2bd:412:21fb with SMTP id d9443c01a7336-2bd04123306mr17816935ad.8.1778576118832;
        Tue, 12 May 2026 01:55:18 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e90854sm127641405ad.66.2026.05.12.01.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:55:18 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v7 0/6] media: qcom: iris: encoder feature enhancements
 batch2
Date: Tue, 12 May 2026 16:55:09 +0800
Message-Id: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7qAmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0Mj3aTEkuQMo/i01MSS0qLUYt1kwxRzS0tjEwvLJAMloK6CotS0zAq
 widGxtbUAWDpZS2EAAAA=
X-Change-ID: 20260512-batch2_features-c1d7993489b0
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576115; l=17457;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=gwtNvlfUubWDaiqh/mFhnWgfbZIOj0eIrfEYWmfkJpM=;
 b=AN53hARwTpUmjABPo/g7MR5vDBTMRN9XrBa3J5J7NsiUsazlJOYmbxKuuTdURdxfh2aX1O4bG
 jwO2/zMJMK/DPlCmu2pWiyxR3HGn8sJcRkmHqArAGQrvMYLwySmN11x
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4OSBTYWx0ZWRfX9F+Pl5C98BAh
 WO5JGPYnC2wmaONPqg9QroXXWT2Ev+bA3IO5zfQJv6DU4lFOKTb+GXElDmLXZBHUYVPLkMa0BSe
 DZIOICCWv/JIpjSxtCLhN4Wnp4xa6ZMVW4Be6eQ1C59yzbfHewd4IseotUO63XN6g3+guTZKBFS
 lS9GWXHus+fp3xCiCzHsPN84nFWi4FABYafap/+GYbRBOc48UFLkTd38UecYHE8LXweNcn1K06f
 rqXUIZjH7oS0/rcjJFDuSzCD088dI6KgBPaCzNW1wophbDTXniAPV4kNakWS4hWY3mc6WkY9tYP
 cskpujlzFL0QSpZZCO6NaLwXWul82LHQHD37yeIfuteL7GPMkLbWjU18CFDmW/LMFl7FVFdY62Q
 5FYxdJH0s7rbJUfwelVWK29EkX7TbWGAK6cpIN5B8FYDfGWrGpcwdowGVfCQfzf3ipHbaQKfDaG
 Wp0O8joIe41WCDO/DOg==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a02eaf8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kI2NT6hAmfhZTMc1HBoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: mbFsWWFwDVGnkjssldx1rFx-OJKKwR7v
X-Proofpoint-ORIG-GUID: mbFsWWFwDVGnkjssldx1rFx-OJKKwR7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120089
X-Rspamd-Queue-Id: 370E251D267
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61220-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi All,

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
 video encoding features.

All patches have been tested with v4l2-compliance and v4l2-ctl on
gen1:SM8250, QCS6490, gen2:QCS8300, QCS8550, QCS9100, X1E-80100.

Commands used for V4l2-ctl validation:

Intra Refresh:
./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ir_random.h264 \
--set-ctrl intra_refresh_period_type=0,intra_refresh_period=30

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ir_cyclic.h264 \
--set-ctrl intra_refresh_period_type=1,intra_refresh_period=30

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ir_random.h265 \
--set-ctrl intra_refresh_period_type=0,intra_refresh_period=30

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ir_cyclic.h265 \
--set-ctrl intra_refresh_period_type=1,intra_refresh_period=30

B frames:
./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/b_frames.h264 \
--set-ctrl video_b_frames=1

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/b_frames.h265 \
--set-ctrl video_b_frames=1

LTR:
./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ltr.h264 \
--set-ctrl ltr_count=2,frame_ltr_index=1

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/ltr.h265 \
--set-ctrl ltr_count=2,frame_ltr_index=1

Hierarchical Coding:
./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_p_layer1_3M.h264 \
--set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=3,h264_hierarchical_lay_1_bitrate=3000000

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_p_layer1_6M.h264 \
--set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=1,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=3,h264_hierarchical_lay_1_bitrate=6000000

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_b_layer1_3M.h264 \
--set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=0,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=3,h264_hierarchical_lay_1_bitrate=3000000

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_b_layer1_6M.h264 \
--set-ctrl video_bitrate_mode=1,enable_h264_hierarchical_coding=0,h264_hierarchical_coding_type=1,h264_number_of_hc_layers=3,h264_hierarchical_lay_1_bitrate=6000000

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_p.h265 \
--set-ctrl hevc_hierarchical_coding_type=1,hevc_hierarchical_coding_layer=5,hevc_hierarchical_lay_1_bitrate=6000000

./v4l2-ctl --verbose -d /dev/video1 \
--set-fmt-video-out=width=1920,height=1080,pixelformat=NV12 \
--set-selection-output target=crop,width=1920,height=1080 \
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap \
--stream-from=input_nv12_1080p.yuv \
--stream-to=output/hier_coding_b.h265 \
--set-ctrl hevc_hierarchical_coding_type=0,hevc_hierarchical_coding_layer=5,hevc_hierarchical_lay_1_bitrate=3000000

The result of v4l2-compliance on QCS8300:
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.18.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 52 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

The result of v4l2-compliance on QCS6490:
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.18.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 33 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v7:
- Rebase.
- Link to v6: https://lore.kernel.org/r/20260401-batch2_iris_encoder_enhancements-v6-0-7022af3401ff@oss.qualcomm.com

Changes in v6:
- Rebase.
- Link to v5: https://lore.kernel.org/r/20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com

Changes in v5:
- Fix incorrect logic in max_bitrate assignment.(Vikash)
- Fix incorrect hfi_id for LAYER5_BITRATE_HEVC.(Vikash)
- Add setter for H.264 layer type and layer count.(Vikash)
- Link to v4: https://lore.kernel.org/r/20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com

Changes in v4:
- Fix the bug in the H.264 layer type check.(Dikshita)
- Add streaming check for layer bitrate setting.(Dikshita)
- Tested different hierarchical coding type values.(Dikshita)
- Link to v3: https://lore.kernel.org/r/20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com

Changes in v3:
- Correct the maximum value of IR_PERIOD.(Dikshita)
- Use 'codec' instead of 'standard' in the calculation of COMV size.
(Dikshita)
- Verified these patches on SM8250.(Dikshita)
- Link to v2: https://lore.kernel.org/r/20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com

Changes in v2:
- Add comment for ir_period calculation.(bod,Dikshita)
- Correct the maximum value of IR_PERIOD.(Dikshita)
- Add a patch to optimize the calculation of hdr size.(bod)
- Correct the num_recon calculation.(Dikshita)
- Add a patch to simplify the calculation of COMV size.(Dikshita)
- Catch the result code of session_set_property.(bod)
- Add comment for shift operation in hfi_buffer_get_recon_count.(bod)
- Add support for layer bitrate setting.(Dikshita)
- Link to v1: https://lore.kernel.org/r/20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

---
Wangao Wang (6):
      media: qcom: iris: Add intra refresh support for gen1 encoder
      media: qcom: iris: Add Long-Term Reference support for encoder
      media: qcom: iris: Add B frames support for encoder
      media: qcom: iris: Add hierarchical coding support for encoder
      media: qcom: iris: Optimize iris_hfi_gen1_packet_session_set_property
      media: qcom: iris: Simplify COMV size calculation

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 485 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  16 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 161 ++++++-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  98 ++++-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  49 +++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 226 +++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  18 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  31 ++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  65 ++-
 10 files changed, 1112 insertions(+), 41 deletions(-)
---
base-commit: ca546c9ed44a2c2fe9c6fb719935965c754b20fb
change-id: 20260512-batch2_features-c1d7993489b0

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


