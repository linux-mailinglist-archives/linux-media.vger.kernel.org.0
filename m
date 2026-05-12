Return-Path: <linux-media+bounces-61255-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHTWNeErA2oR1QEAu9opvQ
	(envelope-from <linux-media+bounces-61255-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:32:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 788925213BB
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E479F348AB0D
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 13:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D9C3905F8;
	Tue, 12 May 2026 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m37qP9Lh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ev3fieW7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231C3E1701
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591386; cv=none; b=SOjEk7xV56oMYdDMqOf4NbSDoNsDTezXbunMVw079e1sh/klWi4YgsTvP/gNoHLEKCX+nP7DM/ousLiQJgYAXQyxxKFJ/h6gYhY/J7+O/ZTShYf1cguoPPyuNBwvOF7YzPSrR3brk1ghjbfZbE5h1W536KUHzJS/GSDYfl1zZLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591386; c=relaxed/simple;
	bh=0EqECexLcac2giA/NQKOv8540ep6zPzAeOrzM5jLZ4w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lj2KhSq7MOcYulns6ye+XuDJBCLIewtD4bWOwRLtIo8qAwMh1jOTZMG0DcrulqotAwR1JQTLEzHUxmW36BkhQnPdXcRRh4TejDzy8RJkVS5FI6jXKqFK/8jTFpk0Vmpka3SNat8tWsACbs44uPL6bWarYwjFLtf9GCJ/LkDDC48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m37qP9Lh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ev3fieW7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCL1ue545238
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IxmCbS1K5HCT8V10QPgEdV
	RTPYL0A2N5hlwgSLwz6Ok=; b=m37qP9Lh3RgZ9Z1gMG2gYvfW1QSRLCLKOfM6/j
	rDQdppkdlFot7AN/G4j2mtNahUO6Di7VX2hFGMsoYmwkfdPm02lTCE31TkARQl28
	0gh+peyVTexpLfz+hQGiLnLbtjgf/30vtByc5lR77boc9eDbMpkEtnnSRS577x5z
	k91Ew3X4mTMLjiaSdTOLrOaUjKX84MEBcledPGReWWvwQxYn5hIpHFWEH1ykSKO8
	4v/u+tILcZWAsa9xARgiPD1NIaUfjcLaVkaNTjMT5r7ZmcAn6wLMgWHrpPLZSYeG
	lMQWLuaCcR4CLJR2lsOqTPnSSofsVOyEJVMqznj5hcNRHN4w==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444sr55c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:43 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-68cfc614246so6657581eaf.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591383; x=1779196183; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxmCbS1K5HCT8V10QPgEdVRTPYL0A2N5hlwgSLwz6Ok=;
        b=ev3fieW7SFH9qIRCxzq2KoRiYE6/1TsZsrQR1sRkjTIAPJQQG8ynbuk8jklyLyLqs5
         lDtQusaLagj5T1wqdsl+hllgcVqVutJSiWtBIv64TRw52GI5Mbu2EUeag1kaCHX71u+7
         MZxHWkQDmGX7bF5i0nxrPJmbXVqVvgWOFzlRK+iBx0bLTRAm+co2oWbVMjUBInHu853Y
         BdiIGefoRhNnYAeFuacuU+tSr5RBL5SqX5Zuh2IUgEq+Vmyiz2DVRn69UA7osCQydakE
         VsWZ+Qlj75Gl1nn83HUjBAEzhYgJMQsmOqmHNkInJEmvY/dpNyYi/KppuAJAHXjuEX0N
         zljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591383; x=1779196183;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxmCbS1K5HCT8V10QPgEdVRTPYL0A2N5hlwgSLwz6Ok=;
        b=hg50z5aKczTY1xwI2ww0PjLn8UoaG4ssPHcOiwrpSWoByo2SWfVgzS0moizEXwSiEk
         d6YfCyuf8qSo+LDkMW92NCeUnntszxFe6NDrx5gmjFaHrRhvyavm9mQcBACtlsxH1/Ye
         tSOOqqJuHZvZKGUEOHv2EB16P6kdOU4w02Z91k0FQfl9EUj6KQNxB7eQFoDfVOQf4mKr
         469ChLFIDygEsDWfyknBNneJnF+O4vggf7B4Nvalty452dwR0J3iCVXWla4E4QplB5y4
         pvR+XKRLF8N6x8KLS9NMISVKusA3IHD6JtMeycrQBbEXKUp7DGp8NnayjEaxqPQCK8Be
         pgiw==
X-Gm-Message-State: AOJu0Yxq50edj2VZiaBbLfnzXDbUGU6Cc6L70vacuUKybM+YICdUlapz
	bS8C7YtWmMqxH7hLkxhGgqPd5TqZxIivFViOMfmEMXYneC+Cy6Xde5eD/OhCsRtRtrzYU0Zk+97
	FdaJZ2oCMQC9rTLVs9ZcWNaD4vC/wA5yC1E68oAVw6hHqhC9UMdgyf7nTaVkHLby5OA==
X-Gm-Gg: Acq92OHdQqD2F18DSgU2S+CJldsWeOubv+heDKtSKrVOIYQm8cwmy94skvMh7vc0mR+
	QX/tJ11AIQ+EjrUU0ANti5QB2LPveF8T0wtB7SWTJYzlznE854Hqp5rGXwIzeTZHdjM18AXFd2C
	H0yVEGT8x9cphRi3XlzwgzWJ1CdMv5qZiKHGMWClAxhqhhFWg8fwuXYVggZUq5ZLZl+G/p9abOX
	bWjb/uzQ2xW0bJqpVR06Af0SYFxD8Az2B05kXr9HWD/dD3MVRSRX1eZqxlIejsyO6x5EBrBYp8n
	mYygZx0afkmgsrxJR0O2OiDpR41bifZKRmJICzq4s9VJjQeP6A6kmqoO+EVP0LGZm+fP07op7Jx
	NLPkbvYMBxkbdfuxqVXRI3CDcYGGuJcjeDeN8nKD7UtH9phBZMukPrm21Qxz218dtUd3sPLfKy4
	O6x1Lyd4SDvG1+ovpwBHOZuNVNiV8IBmQbooA=
X-Received: by 2002:a05:6820:c3d5:b0:69b:3a37:7896 with SMTP id 006d021491bc7-69b3a378267mr4424133eaf.50.1778591382907;
        Tue, 12 May 2026 06:09:42 -0700 (PDT)
X-Received: by 2002:a05:6820:c3d5:b0:69b:3a37:7896 with SMTP id 006d021491bc7-69b3a378267mr4424102eaf.50.1778591382421;
        Tue, 12 May 2026 06:09:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/6] media: iris: enable SM8350 and SC8280XP support
Date: Tue, 12 May 2026 16:09:28 +0300
Message-Id: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIgmA2oC/33QwW6DMAwG4FdBOS9d4pAAPfU9ph1CYtZIA9qYI
 qaq7z7TbppUrb1Y+i37O/xnQZgTktgWZ5FxTpTGgYN9KUTY++EDZYqcBShwSoOSKSeSFGqo1XK
 QtY3atMEpa5zgn0PGLi1X7+2d8z7RNOavKz/rdfsr2Ttp1lJJCBZd03msXLsbiTbHk/8MY99ve
 IgVnOEpAoxYCyEGg941+gFiniKGkQi6dto36I15gJR/iNFwj5SMeFVW2Gk0oYr/IJdbYRmPJ+5
 9urUmWk8o16M0bYseY/I/acJMrwMuE39evgGTWoduuQEAAA==
X-Change-ID: 20260120-iris-sc8280xp-85d13bc60536
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7655;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0EqECexLcac2giA/NQKOv8540ep6zPzAeOrzM5jLZ4w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaTTa4rbmYdq3tyNpQA9gB6YIIxXOFMgplYA
 CImfiTvpCyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmkwAKCRCLPIo+Aiko
 1QrqB/91aaSNAEoGHxiH/L8Gg4hS8LPBj81ph4/gAxOph5T6yZMnkQdj5t6MSLHFPBJ5aCYbpkg
 44WnfLTBrM73DF7KZSbf7VSuZmP7sd43hElwk0ID3pbynGCjqZEzTXSb/XjTzpZf2e1LLuXTRr+
 qAbxosScF+f9htDybTNWD5KPketXevVphOgsJ0k1ZZkfqF/+2Zo+EOMq+GoMMApFjthRPeVjZd0
 byJKhjQ7oTBIt1qJNcvS0h9jU7CIn5n0JjUILdybWQCdjtRq+qn9YvQP+ZOKJBR5X+D+Ep+pgyd
 YQI6LXOy/CHUtYLn26JfZb66X0tmjWQGU2ta3c3DKaZPWyHc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: UXXlqIsCqC8g10eQv5g516j4IRsDShcp
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a032697 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YpImPho9_kIrJV5eQEEA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=mUDYQMy1hxdww3aAYIDK:22
X-Proofpoint-ORIG-GUID: UXXlqIsCqC8g10eQv5g516j4IRsDShcp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX7OOxPUodekfi
 4DBJ3oXJRkF/YDCZ/rZ5DQ6h8P2pLpz5JVBBgGWYzcZwW3uIjVWLDGn7r2EDlXDhTk7S41O3a2e
 OBlSbVwCXY4exHpKbj3r9VpjPlJcaOm0zKXYD/SItRGHsyyyKTJQ5CuazEFz6yzXPLjBzjvBaPV
 PSpNUQ+30/9XMAsvBXU9cum071P0EaKV2sGwoEtVAZbmsKbrCCzEXl5R1PkmWMsnjObM4cPziqF
 t59GrzKbuO1s79gqATmnnmsHasMxB3DfyEPSt4gthGthvl9GFbNul167N5w6VN9v27UOViktgn5
 dg0Ri7rvmRhhGMauSUWGqBMT0Lcc2HoINmhrVp1ClnipDX7db0W0Kdg/0//6ehhJKzLmhJ6VC9D
 Ek4OdFFfpeyTNvkgHacHhPNMJcfaKdcEdGCN8Y2Isy7SLPnLHgVwGco/Rqr1geOlNqCbSp405tT
 tNc9oRaHjgND6NGU3pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136
X-Rspamd-Queue-Id: 788925213BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61255-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

In order to enable wider testing of the Iris driver on the HFI Gen1
platforms enable support for Qualcomm SM8350 and SC8280XP platforms.

Note, this has been tested only with the Iris driver. Venus driver fails
to boot the Iris core on SM8350 pointing out the UC_REGION error.

Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
SC8280XP). Please use corresponding firmware, extracted from the Windows
/ Android data.

On SM8350 with the Iris driver:

$ v4l2-compliance
v4l2-compliance 1.30.1, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.0.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
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
        Standard Controls: 2 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

|TOTALS|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
|-|-|-|-|-|-|-|
|TOTAL|169/316|128/316|154/447|126/447|159/311|229/311|
|TOTAL TIME|242.251s|267.903s|293.458s|261.934s|203.009s|366.936s|
|-|-|-|-|-|-|-|
|Profile|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
|BASELINE|0/0|0/0|3/7|4/7|0/0|0/0|
|CAVLC_4_4_4|0/0|0/0|0/3|0/3|0/0|0/0|
|CAVLC_4_4_4_INTRA|0/0|0/0|0/4|0/4|0/0|0/0|
|CONSTRAINED_BASELINE|0/0|0/0|32/33|33/33|0/0|0/0|
|EXTENDED|0/0|0/0|1/6|1/6|0/0|0/0|
|HIGH|0/0|0/0|22/45|22/45|0/0|0/0|
|HIGH_10|0/0|0/0|0/2|0/2|0/0|0/0|
|HIGH_10_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
|HIGH_4_2_2|0/0|0/0|0/21|0/21|0/0|0/0|
|HIGH_4_2_2_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
|HIGH_4_4_4_INTRA|0/0|0/0|0/6|0/6|0/0|0/0|
|HIGH_4_4_4_PREDICTIVE|0/0|0/0|0/11|0/11|0/0|0/0|
|MAIN|127/135|126/135|41/90|41/90|0/0|0/0|
|MAIN_10|0/11|0/11|0/0|0/0|0/0|0/0|
|MAIN_STILL_PICTURE|1/1|1/1|0/0|0/0|0/0|0/0|
|-|-|-|-|-|-|-|

Tests failing on SM8350, but passing on SM8250 (note, on SM8350 they
also work with FFmpeg, but fail with Gstreamer).

- AMP_E_Hisilicon_3
- AMP_F_Hisilicon_3
- DELTAQP_A_BRCM_4
- SAODBLK_A_MainConcept_4
- TILES_A_Cisco_2
- VPSSPSPPS_A_MainConcept_1 (this one timeouts with ffmpeg on both
  SM8250 and SM8350 and fails with Gstreamer on SM8350)

- vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm
- vp90-2-14-resize-fp-tiles-8-16.webm
- vp90-2-22-svc_1280x720_1.webm (works with ffmpeg, fails with
  Gstreamer)

For SC8280XP:

|TOTALS|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2|
|-|-|-|-|-|-|-|
|TOTAL|158/311|232/311|93/447|126/447|166/316|133/316|
|TOTAL TIME|85.753s|111.439s|359.253s|65.825s|79.435s|88.543s|
|-|-|-|-|-|-|-|

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Rebaed on the pending next tree.
- Corrected Iris block name (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com

Changes in v4:
- Changed compat strings to use -iris instead of -venus (Konrad,
  Dikshita)
- Dropped separate schema file, switched to SM8250 schema
- Dropped driver bits, it's covered by compatible string now
- Link to v3: https://lore.kernel.org/r/20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com

Changes in v3:
- Add missing header, sorry.
- Link to v2: https://lore.kernel.org/r/20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com

Changes in v2:
- Added missing chunk, including sm8350-videocc.h, lost in rebases.
- Link to v1: https://lore.kernel.org/r/20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      media: dt-bindings: Document SC8280XP/SM8350 Iris
      arm64: dts: qcom: sc8280xp: sort reserved memory regions
      arm64: dts: qcom: sm8350: add Iris device
      arm64: dts: qcom: sm8350-hdk: enable Iris core

Konrad Dybcio (2):
      arm64: dts: qcom: sc8280xp: Add Iris core
      arm64: dts: qcom: sc8280xp-x13s: Enable Iris

 .../bindings/media/qcom,sm8250-venus.yaml          |  12 ++-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 103 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   6 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  81 ++++++++++++++++
 5 files changed, 203 insertions(+), 5 deletions(-)
---
base-commit: 10f943b12e7cb338da00f10e129043ae27b33af4
change-id: 20260120-iris-sc8280xp-85d13bc60536

Best regards,
--  
With best wishes
Dmitry


