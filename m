Return-Path: <linux-media+bounces-65065-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mBcLGffNMWo7qQUAu9opvQ
	(envelope-from <linux-media+bounces-65065-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 00:28:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4173695919
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 00:28:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k/dNu8Uc";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bAbgEQLq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65065-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65065-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BFBE30A3973
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 22:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B110F3ACEE1;
	Tue, 16 Jun 2026 22:26:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F303AB460
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 22:26:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781648816; cv=none; b=EXh5zOnKoAhlZkkXNduCnxeXvWcEc82u5LCFD73QLIlu66DsI4Y/A6tuOjGy5TtGbvp3IjVv4UMcSOFFLeWcZ9Vd2De0NErg7npC43bI+FY6Ul3kWBpbIlR2O2AQePyVs3qpA57uon0P0VC1osW4uqIvX0jcsLfiw3HiFN+FvYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781648816; c=relaxed/simple;
	bh=mQjBhiVsanPT419EGc9XeP+wi6+CySnwJiALN1S24ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EKS3a43VcQCdS5kth1Ea2lQHyh0+eabP+K7qQEbZcfARTVwdYWggzTIfbzvDbyMps0wbhdXmau8ByiKH26hPkgq7uYm8/Lih6sVuJyEQig68euZgZFy86AXqlcQpD+UaXasHi6bksWMs/iB3jea9M77VLXyGkjX6P46NETgy2gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/dNu8Uc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAbgEQLq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLVu5t1816039
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 22:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bs/85VkMFJxP/A1zdCjdU5
	tMpFl8wYyvVzGNgFQtOWs=; b=k/dNu8UcAlyY4iku1vIoL+7GWasvCOUAOiDY68
	nsSqnocbt+g9e8m+ckmmp4n5BsEQ1BCUum+iaoIObcTrV3SDB4vsxPm3HCGiIC7C
	2nIzuH0CDHSCJekZSUa40hYDjmbA54LPhnaZS3lolR2t9HBjTA17sUtuVkwAL46m
	FsuV0Ys7NxnJsQtL708NXDkTJZAcRyNjI3nA2bthsyYeCVJjcY6SA4wbndx5nJHA
	8UUVzaj9z3q9FWLSAD/mT121tfLZdXPeAvWSVok5OQAZOWkJxUmfz/S0XKD5jMS8
	OJddleZT138/bez784IGCMNJ68hFiNdy4OG1AEwFFJeGw7wg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbr62w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 22:26:53 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137dd558ac5so365941c88.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 15:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781648813; x=1782253613; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bs/85VkMFJxP/A1zdCjdU5tMpFl8wYyvVzGNgFQtOWs=;
        b=bAbgEQLqEbjwXJ4tj4RZ3TfmfyYVtlljROm7QsxHth9eTHWmGJCM+Eb8yyCQKvhwtE
         zvHgBLs3I78vy62VPfU0P6ZdGtoFPJjrPDrM8mMvprHE+fVpfAWIGj930Ul51QUrqGw5
         svma3Q9lf6kTBwdtPDnOLyQcap/kawNGubOWETiqt0Ss/iQbaRYteOk98uyqpx+xuELs
         w0eBpqw+JzXuwvBcDm2WAqfJev28Y+Wa5d5UgaTFI8tAXWQZ21YKN7DHwYgBwNbYOmce
         67m36eGEGljbdgJe6nWhLQ4CGWm6BbwHr4QlzBEnTnXq1O1hbJlkr2PPcNVq/t5IMQxE
         aTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781648813; x=1782253613;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bs/85VkMFJxP/A1zdCjdU5tMpFl8wYyvVzGNgFQtOWs=;
        b=TbwzL77LrvKFl1V7hlwRSPp3qiIEXQm2YzwO2otCW7yYM8DS2GgEQtwhbhEaEuW8WH
         ZNEGDFhQUTd3DxvtnXWas+gAYthqaNhW70DaSQeOkYgXwLPLgTzBc+F1E/0oGKfOgh0y
         B8dLyUkmBtadveocN2BuSh2qeo2j3nalIHGHWQmKrNgFteKjSJDFS2vBEbTM4cd6IDN/
         uWVTXNeqPO6+bymlvwwfDT4qcJJMTqkAAzCkAhvpULSpzundcKF3+rR9uMPmKUilGK9t
         1bVwfd471UjJiiA091Sju6QXOHkzec66y1Ivp6xXdvob7d1ZkvYoYeQKrzLuUN308ibj
         XzwA==
X-Gm-Message-State: AOJu0YzlytNsn7sTigxpEsRVnAw1FbPTL1rffwfauQTXUWEgDTLXzEVq
	WUs8WinQduQLh336oi9LFw8aKFzuWEPeU9VTxznYfL6qHz1FsQXkRjNolLVbnj2A/rbJt+NM7Q/
	x6XKChWSkbhbcSOUhOZzjae0I5M2vUNF7eN+5+32wvYHGxmzGMrkA3X0Eo2PHH5+lScHsz4T50A
	==
X-Gm-Gg: AfdE7ckqNDMQ+fGu3hc10aJ1UXoTFG1mz9nVEMhE7ZuKkK+rMkFNMHojaMyVxBEvuE2
	7SInN7YdRg8j3SxauiBiR8Nwbk+QsSEdVljvxHGSxLtw3zqR0NEzWy4neTZvCxJvIIohWoyXJjV
	CSYqHSfJntR4I/8VW7jqU1NacfNEk3k5b8iTiATHanVop/WS7WMBEDLLJ1qsM6uD/aLbrvbJgLp
	BOFT8MLYvUygzDF+b7/72v7k84Lzl6dheH+P+E1xC+P4N7bnS4mQFueIxMt0FVCUgghUKvVupFM
	W+02xZQCNE8H6i8q61VWmruMfDPt0mNPs1g4kV2o8Mv3IS5kINo7VCqs9drvMOlNR9NaPDCEmtT
	3Z8iLJMH9VmOv+1c+aZxd/BtKM6KAKf+zmKabcri8XUP3ybldGErJ+EHcBAJ22Wa5jUx/EPK73L
	j16tOXyQ==
X-Received: by 2002:a05:7300:2211:b0:2da:b05a:5a7d with SMTP id 5a478bee46e88-30bc9163c29mr331192eec.0.1781648812884;
        Tue, 16 Jun 2026 15:26:52 -0700 (PDT)
X-Received: by 2002:a05:7300:2211:b0:2da:b05a:5a7d with SMTP id 5a478bee46e88-30bc9163c29mr331186eec.0.1781648812235;
        Tue, 16 Jun 2026 15:26:52 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbcb11310sm2669877eec.14.2026.06.16.15.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 15:26:51 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:26:34 -0700
Subject: [PATCH v4l-utils] v4l2-ctl: add V4L2_CTRL_TYPE_S8 for ROI MB
 delta-QP support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-enc_roi_enable-v1-1-252792d27894@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJnNMWoC/x3MQQqAIBBA0avErBPSTKKrRIjZWANioRVBePek5
 Vv8/0LCSJhgqF6IeFOiPRTwugK7mbAio6UYRCNUo3jHMFgdd9IYzOyRtULNjkupnOmhREdER88
 /HOGWnl0n+QRTzh8tOMBsawAAAA==
X-Change-ID: 20260615-enc_roi_enable-326bf1446fa8
To: linux-media@vger.kernel.org
Cc: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781648811; l=11268;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=mQjBhiVsanPT419EGc9XeP+wi6+CySnwJiALN1S24ds=;
 b=O8lzyK37ffDMR4ht+n8pOGyzHtWDcDQPEusK0mFnpPrTYSdbNnoRUxT161ANjknB+2dv79A01
 Pgmhl+hG3B7DR0Eyhj8lVjaKeXWu9fRK6tw5zUoz7My/ITto2PRouhC
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: 4y16HiPLO6D01LfVJrTUosFjTbYg_7jK
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a31cdad cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=w7IVZahy6_MTU_SYSSUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIyNiBTYWx0ZWRfX5J7h4C96Pf2h
 HiOmWTpD0aZNA+N1X/WDpPzk/gnPgmbXRShiVAmXJUM4vvv9ZrhQFSLg2lARnecMtXdcrQZySsX
 /6HYi75mlaC4g/3DGCLr1lLbtekO6ug=
X-Proofpoint-ORIG-GUID: 4y16HiPLO6D01LfVJrTUosFjTbYg_7jK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIyNiBTYWx0ZWRfX5yUeWbsZ0yhl
 nkPgcStEyhfFlVx4lmXLD2DsVMRfWw6DhKsPZX6kej4+A9FwSz737qG+EyP3t0/ePVg4uCTL3ce
 Oa4TOdO+wCxZJ6xoDlru2jssSJ8psBnEYmPyaGiFMCoeBle7CB9Ql7pDEc6I6uTK9Ur47n/20B7
 M8V7njj8dIiXMgTAZzaGtetzeJyFZQPd67y8WFyTTp9tm35VOXxvl9jxfslfnsnGNXHuA4OYiAa
 P64ipTHKtjbF8gmFUvUhbywCH7Kc7ykSDlUilzzUzK6ejza32LiKou2opxMso0rBjSAo9RiEG9V
 lj1ni2aEFA/HcIU+mDQOQ7yDlIrBX7tmIvgvx7o7+U1zYBAS99FpthAniG1VW01IB5nks1RJHBg
 lELOiaRrKP6ute4SH69omgjWuqT22AcZeWPVVT9CfZfbu3h2bwMPmyS9b6mcAPfTCDJHU1OEGBE
 KCnaNHdYzCNMXOCUIcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606160226
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65065-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:deepa.madivalara@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qc.id:url,qc.name:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4173695919

   Add support for ROI MB delta-QP in v4l2-ctl. The two controls
   that are used in kernel are as described:
   V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (codec base + 658)
   An s8 array control carrying per-MB QP delta values for the whole
   frame.q! V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE (codec base + 659)
   Reports the macroblock size used by the encoder so that user-space
   can compute the correct array dimensions.

  v4l2-ctl:
  - Print s8 array controls in --list-ctrls output (min/max/step/default).
  - Add parse_array() to tokenize comma-separated array values passed via
	--set-ctrl, e.g. enc_mb_roi_delta_qp=-20,-2,-22,9,-16 etc.
  - Handle V4L2_CTRL_TYPE_S8 in common_set(): parse the comma-separated
	string into an int8_t array.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Hi all,
 
Two new codec controls for macroblock-level Region of Interest (ROI)
encoding are added, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (codec base + 658)
An S8 array control carrying per-MB QP delta values for the whole
frame. V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE (codec base + 659)
Reports the macroblock size used by the encoder so that user-space
can compute the correct array dimensions. To test these preliminarly
following changes are made in v4l2-ctl.

v4l2-ctl:
- Print s8 array controls in --list-ctrls output (min/max/step/default).
- Add parse_array() to tokenize comma-separated array values passed via
	--set-ctrl, e.g. enc_mb_roi_delta_qp=-20,-2,-22,9,-16 etc.
- Handle V4L2_CTRL_TYPE_S8 in common_set(): parse the comma-separated
	string into an int8_t array.

Testing:
v4l2-ctl -d /dev/video1 --list-ctrls
...
enc_mb_roi_delta_qp 0x00990b92 (s8)     : min=-31 max=30 step=1 default=0 dims=[139264] flags=has-payload
        roi_mb_size 0x00990b93 (u8)     : min=16 max=32 step=1 default=16 value=16 flags=has-payload
./v4l2-ctl --verbose -d /dev/video1 --set-fmt-video-out=width=176,height=144,pixelformat=NV12 --set-fmt-video=pixelformat=H264 --set-ctrl=enc_mb_roi_delta_qp=-20,-2,-22,9,-16,-2,14,-9,-19,3,-26,19,-23,30,1,0,-6,-7,7,2,-2,15,-15,-24,-24,-26,-26,5,-1,-1,9,-11,15,-25,-11,26,-11,7,-26,-27,-8,-18,7,-4,-12,-23,-11,22,-7,7,-14,24,6,-8,-7,2,7,-26,2,-25,-1,-3,-4,-6,-26,-11,7,16,-30,-22,-15,30,-14,-29,-11,-8,8,6,19,15,-17,21,-27,30,-17,-28,-10,-20,1,22,29,-19,-2,28,10,12,-10,7,-4 --stream-mmap --stream-out-mmap --stream-from=/media/foreman_qcif_nv12.yuv --stream-to=roi_try.h264 --stream-count=10
---
 contrib/freebsd/include/linux/v4l2-controls.h |   2 +
 contrib/freebsd/include/linux/videodev2.h     |   3 +
 include/linux/v4l2-controls.h                 |   2 +
 include/linux/videodev2.h                     |   3 +
 utils/v4l2-ctl/v4l2-ctl-common.cpp            | 104 +++++++++++++++++++++++---
 5 files changed, 104 insertions(+), 10 deletions(-)

diff --git a/contrib/freebsd/include/linux/v4l2-controls.h b/contrib/freebsd/include/linux/v4l2-controls.h
index 80d0e12e1974b316fe99babcb1a6a1c8f52e6713..f86db7caad2a16f04a57be24c5b76ef7ef7b05e3 100644
--- a/contrib/freebsd/include/linux/v4l2-controls.h
+++ b/contrib/freebsd/include/linux/v4l2-controls.h
@@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
diff --git a/contrib/freebsd/include/linux/videodev2.h b/contrib/freebsd/include/linux/videodev2.h
index 3d26df7955a70b84bd43a02b01b9cc104ecc7090..867b3ae4dec80717f1f3972e6d2fcf6b149b596d 100644
--- a/contrib/freebsd/include/linux/videodev2.h
+++ b/contrib/freebsd/include/linux/videodev2.h
@@ -1849,6 +1849,7 @@ struct v4l2_ext_control {
 		int64_t value64;
 		char *string;
 		uint8_t *p_u8;
+		int8_t *p_s8;
 		uint16_t *p_u16;
 		uint32_t *p_u32;
 		int32_t *p_s32;
@@ -1958,6 +1959,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
+	V4L2_CTRL_TYPE_S8		    = 0x284,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
diff --git a/include/linux/v4l2-controls.h b/include/linux/v4l2-controls.h
index 80d0e12e1974b316fe99babcb1a6a1c8f52e6713..f86db7caad2a16f04a57be24c5b76ef7ef7b05e3 100644
--- a/include/linux/v4l2-controls.h
+++ b/include/linux/v4l2-controls.h
@@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index feb326686ead6740161d6643dd68fa8226822fe6..b4b04410aa47c5a32243f35f147e39ad3c14475d 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -1815,6 +1815,7 @@ struct v4l2_ext_control {
 		__s64 value64;
 		char *string;
 		__u8 *p_u8;
+		__s8 *p_s8;
 		__u16 *p_u16;
 		__u32 *p_u32;
 		__s32 *p_s32;
@@ -1924,6 +1925,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
+	V4L2_CTRL_TYPE_S8		    = 0x284,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 87e361412c536024233bca8e66479ec940a7a57c..1a3ae2f7453e0b1e9e147731b4c33dcc69bf5b7c 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -4,6 +4,7 @@
 #include <list>
 #include <map>
 #include <vector>
+#include <sstream>
 
 #include <dirent.h>
 #include <sys/stat.h>
@@ -477,6 +478,7 @@ static bool fill_subset(const struct v4l2_query_ext_ctrl &qc, ctrl_subset &subse
 		unsigned ss_dims;
 
 		subset = ctrl_subsets[s];
+
 		for (ss_dims = 0; ss_dims < V4L2_CTRL_MAX_DIMS && subset.size[ss_dims]; ss_dims++) ;
 		if (ss_dims != qc.nr_of_dims) {
 			fprintf(stderr, "expected %d dimensions but --subset specified %d\n",
@@ -490,6 +492,7 @@ static bool fill_subset(const struct v4l2_query_ext_ctrl &qc, ctrl_subset &subse
 			}
 		}
 	}
+
 	return false;
 }
 
@@ -782,6 +785,11 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
 	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
 		printf("%31s %#8.8x (av1-film-grain):", s.c_str(), qc.id);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		printf("%31s %#8.8x (s8)     : min=%lld max=%lld step=%lld default=%lld",
+				s.c_str(), qc.id, qc.minimum, qc.maximum,
+				qc.step, qc.default_value);
+		break;
 	default:
 		printf("%31s %#8.8x (unknown): type=%x",
 				s.c_str(), qc.id, qc.type);
@@ -1126,6 +1134,60 @@ static bool parse_next_subopt(char **subs, char **value)
 	return true;
 }
 
+/*
+ * parse_array - consume one "name=v0,v1,..." token from *subs when the value
+ * contains commas ex: enc_mb_roi_delta_qp=-20,-2,-22,9,-16
+ *
+ * Returns true  and sets *value to the start of the "name=val,val,..." token,
+ *               advancing *subs to the next token (or "").
+ * Returns false when the current token has no comma in its value; the caller
+ *               should fall through to parse_next_subopt() as normal.
+ */
+static bool parse_array(char **subs, char **value)
+{
+	if (!subs || !*subs || !**subs)
+		return false;
+
+	char *p = *subs;
+	char *eq = strchr(p, '=');
+	char *first_comma = strchr(eq + 1, ',');
+	char *end = first_comma;
+
+	if (!eq)
+		return false;
+
+	if (!first_comma)
+		return false; /* scalar value, goes to parse_next_subopt */
+
+	while (*end == ',') {
+		char *next = end + 1;
+		char *seg_end = strchr(next, ',');
+		if (!seg_end)
+			seg_end = next + strlen(next);
+
+		/* Does this segment contain '='?  If so it is a new token. */
+		if (memchr(next, '=', seg_end - next)) {
+			/* next segment is "name=val" - stop before this comma */
+			break;
+		}
+		/* Otherwise this segment is part of the current array value */
+		end = seg_end;
+	}
+
+	/*
+	 * *end now points to either '\0' or the ',' that precedes the next
+	 * "name=val" token.
+	 */
+	*value = p;
+	if (*end == ',') {
+		*end = '\0';
+		*subs = end + 1;
+	} else {
+		*subs = end;
+	}
+	return true;
+}
+
 void common_cmd(int ch, char *optarg)
 {
 	char *value, *subs;
@@ -1149,19 +1211,29 @@ void common_cmd(int ch, char *optarg)
 		break;
 	case OptSetCtrl:
 		subs = optarg;
+
 		while (*subs != '\0') {
-			if (parse_next_subopt(&subs, &value)) {
+			if (parse_array(&subs, &value)) {
+				if (const char *equal = std::strchr(value, '=')) {
+				std::string first =  std::string(value, equal - value);
+				std::string second = std::string(equal + 1, strlen(equal + 1));
+				set_ctrls.emplace_back(first, second);
+				} else {
+					fprintf(stderr, "control '%s' without '='\n", value);
+					std::exit(EXIT_FAILURE);
+				}
+			} else if (!parse_next_subopt(&subs, &value)) {
+				if (const char *equal = std::strchr(value, '=')) {
+					set_ctrls.emplace_back(std::string(value, equal - value),
+							       std::string(equal + 1));
+				} else {
+					fprintf(stderr, "control '%s' without '='\n", value);
+					std::exit(EXIT_FAILURE);
+				}
+			} else {
 				common_usage();
 				std::exit(EXIT_FAILURE);
 			}
-			if (const char *equal = std::strchr(value, '=')) {
-				set_ctrls.emplace_back(std::string(value, (equal - value)),
-						       std::string(equal + 1));
-			}
-			else {
-				fprintf(stderr, "control '%s' without '='\n", value);
-				std::exit(EXIT_FAILURE);
-			}
 		}
 		break;
 	case OptSubset:
@@ -1234,7 +1306,6 @@ void common_set(cv4l_fd &_fd)
 				use_ext_ctrls = true;
 				ctrl.size = qc.elems * qc.elem_size;
 				ctrl.ptr = malloc(ctrl.size);
-
 				ctrls.controls = &ctrl;
 				ioctl(fd, VIDIOC_G_EXT_CTRLS, &ctrls);
 
@@ -1295,6 +1366,19 @@ void common_set(cv4l_fd &_fd)
 					       &ctrl.p_rect->left, &ctrl.p_rect->top,
 					       &ctrl.p_rect->width, &ctrl.p_rect->height);
 					break;
+				case V4L2_CTRL_TYPE_S8: {
+					std::istringstream ss(set_ctrl.second);
+					std::string token;
+					unsigned idx = 0;
+					const size_t maxElems = qc.elems;
+					while (std::getline(ss, token, ',')) {
+						long long v = std::stoll(token, nullptr, 0);
+						ctrl.p_s8[idx++] = static_cast<int8_t>(v);
+					}
+					qc.elems = idx; /* actual input array size */
+					ctrl.size = qc.elems * qc.elem_size;
+					break;
+				}
 				default:
 					fprintf(stderr, "%s: unsupported payload type\n",
 							qc.name);

---
base-commit: da3a89e7ade1f6ec5c0635634ac78388557b4832
change-id: 20260615-enc_roi_enable-326bf1446fa8

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


