Return-Path: <linux-media+bounces-55675-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oF+TCHIPtGlvfwAAu9opvQ
	(envelope-from <linux-media+bounces-55675-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:21:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C24283AE3
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1B8F30821F2
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E7640DFB5;
	Fri, 13 Mar 2026 13:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyKV/J3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRhg+V55"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6C63BB40
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407880; cv=none; b=WMZ/hDLMDItLbwhj7r9LwL+lft0hBjjsZE+BIwzns/I4Hu7G+xP7ye/+CyHXcF3KDR09gp3jpRth9kbN7x6vdBvJWh09NgptJmli1L1Q664fZdxbhN/7RDb/0eM5o1vxeh62quddx3qWw5B3uPbuQQ1YGgXd4tv1v8XTq0w3wkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407880; c=relaxed/simple;
	bh=S9XZxqhIyOU1HoZkSIT/EcrWwOrX5DcaP7niMINCiD4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WL1LlLKvrD4WIwquIX0ZMrLprUG5yDWw2yZSluqYA2tJtkxeOSB5OC0Z6TJV8I6NJWcCydUJrGyY8fgJxgo+5gxVnB5tVRWOWx8+0Hlczfz3kgKeE3lc7nOtnWhCqinjgzZAN5/xM/CTYGi9dwV9zJeuB4YXkVQmo1+FudVBka8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyKV/J3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRhg+V55; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iLwP2262547
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bii1WhtiSZWR6uwIUf2lsQ4fMW2y90ZYcpM
	bLtxoyVA=; b=FyKV/J3Sm2yZr8PlR7ZcnEIIjO9nKyfRQ0QQcgNfxacZpzaMnwF
	+zQLlPOydfDV60nX497Q0IgGxLqB6tyct4sAcKugjpZOXHWdB8a2ojbqxwELdV8q
	QRgEB1FiJKeFl969VV4Y4wAagTeRrhngd6pdtFSeoOEDRUXhncojXvxyWda1EFDS
	qFStbhAXFR5WkN30pbYteB/kW1lpwHFGcHQRuBlcrBaLJKF/LwLjr1hmHyOuF1iq
	+baPpkIkLkD3Z9R8KpIi9WSbzYbHzyXXaWaZloyFeUNILCiwFa5GEr8OWe/bi45W
	Xb3t3Mcps6nWufpai+/NNeS3vsk2shNowdg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4s4a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:17:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7d66afceso1436557085a.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773407877; x=1774012677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bii1WhtiSZWR6uwIUf2lsQ4fMW2y90ZYcpMbLtxoyVA=;
        b=RRhg+V55zLD7VkfayO+2O2wWTKb6tOKd2XfbhaocUfQX3bUEfpxIyKo7sgmbAvDcQo
         H6mBLK/vKOLERRqJP7RIHnvQLje3u6ldyM1li1DwZh/F5Zt3AQDQMpaYv9TA3mbnjPR3
         Kiya2FlZtmWs2jryLaoDDOp29HnJZgvTTtBQUxQ5hPtQIbn/wffKRJbk3/fnpdXVOx1m
         o2kBnxzDT8fpR4sGTDIxS2ZcYVelvEIBsandkLJQJonMsSYAeiwGrD8ytf+YTZAGt7XA
         eiWtEfaw/fAAyRZ89Tnb0DLaJrbfZjFUbkdsPeGhnOfS4CwTuIuiOAjKiUMKCH6vQELT
         /q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407877; x=1774012677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bii1WhtiSZWR6uwIUf2lsQ4fMW2y90ZYcpMbLtxoyVA=;
        b=p7W33wZR1yc51arQ4oT3949f+lTkxudgYCWPwPB2UxsgB3j13sbhvqrjlo3YtjAnnI
         Lm8+1OQtNKVEljNH0e6VQ4XeDQNbCQ7pFc1lAKAIa0okZjm/XP4rG52/y9SyxPAflypg
         D2cNzeOj89pB/fJYRgQOjrX7RmjkqmWw9SBTdLJn2U7z/GTKr6ch7F+CU/HitXwAbY5a
         L80sCioRM+lH6us3xsaIqcHJi5POjKQXDKkh/uLGhwx+v/TmZgAKLmsJMyXlPotCcWu1
         VtT/5ncz9jr2NrTyTFBdAS+sJsw/RyEIWbyNy3xEg/vVHVWqCx96hCKRWaCDrB0nsHfE
         CEwg==
X-Gm-Message-State: AOJu0YymY/8NWfIC855lbRh2LybjyjR6SEbeEo90cEcMHOSIf9758aqs
	PTeLfMkQhju9JI3w8lWhfjbgaJAWaVTzceWpU4rUAZnXBmhu/GO4St8gE5U9bg6H1BQ6WEHdQRV
	xE0bMIQ0fSHi+4KflVd/fu8fLRPL4INl5WTAzEz/0BCaLBalAmU37cWPctSev4LIvh4IGb8hR+w
	==
X-Gm-Gg: ATEYQzzJ1PKLgyRiP9B2yK4J9oUAMIsXRqkOW1qTy4puQY+a16pCcsrgkTtj4aGd99i
	uOrIoQVGSE2mpuTgZ5/lSmkcbJORj9PJ7gFNhQtaMzD7QIy+mTRKGkzSQxZ4/LvTzt8ZL8PPIdJ
	INflwnaTIV2vQGLfnIxqgBb2UNJHBedPWvsYbf8KIa/xvW0YSf16qvmLfZc6Pgn/duSVbmTLg3z
	EDEKVxHHWUgiRkdCbLeYh86RGh5L/XDtl94iBZFWnx5c6oSNctWHiG+i0rmtFZfrqxqkmi0TTjG
	KqCPGcbueFewmn1JkLKMhpFv4VNNCKgpCugCc7JerwqyVYXjFhy8WNvZNFQvggAOllilb34CTGw
	mnn4buy7Ay5tstADVxNSRO70qLXOpXf1KE/9lqUMJ8iEII8Sljd/YWhFOLxkX3KWikca5VrRfAC
	C5VusOB348BD0X
X-Received: by 2002:a05:620a:6cc2:b0:8cd:972d:328 with SMTP id af79cd13be357-8cdb5a692c1mr450009385a.24.1773407877515;
        Fri, 13 Mar 2026 06:17:57 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc2:b0:8cd:972d:328 with SMTP id af79cd13be357-8cdb5a692c1mr450004385a.24.1773407877089;
        Fri, 13 Mar 2026 06:17:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm207778265e9.0.2026.03.13.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:17:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/5] media: qcom: camss: Add PIX support for CSID/VFE-340
Date: Fri, 13 Mar 2026 14:17:45 +0100
Message-Id: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pv-NHgOXIsbFoWhHNPLWJtD6n8mLM46a
X-Proofpoint-GUID: pv-NHgOXIsbFoWhHNPLWJtD6n8mLM46a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfX+idW9uXYRssm
 Tbm5elNX6JOYwEaINgPiaZLXj9z8XhKg0tY/e+SOjE8AA/EAddaGGYztI7CNllyb/jiDcUge2if
 GRT7HBe8s/HSObiYIeCFBqkFEIq365Gfg9T59l7lA2bo0O3Zjx+WODjDKtoKZCqQXhuNYO51pzd
 V+RjH92gWYloPYJ67dQmfzjgghFNrJ3v9VIB87KnArIyttqmWJsxJewe+BAYmpOO+VXI1TGgIw0
 7ROKjqp2OkYNJ5+I+/5PF0hMLgE2xbpCzvPNhtn6goRw0ASCwZHdoZhOxhJ1rHHqCBGb8rgvDAz
 2+oo1LwH+wmvUelb2bNtlb3ANGI5DeqzpbimTDQVI1x2ipNmohmXfTeSH6r5nBosKoTpDC/G8u9
 3PgwlPjHymdtUqy0N4Oe0JE+JTnin12bAX21WlLtxMhvA0XKET5Ffe3UBlfxBjlC03qDQDGmkcA
 nykzDQiRIlsLy7c/wFg==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b40e86 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QLs-j7ecQSDb903mvAwA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55675-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4C24283AE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PIX-path support to the CAMSS pipeline on CSID-340 and VFE-340,
allowing frames to be routed to the VFE PIX interface and exposed
through PIX output devices such as msm_vfe0_pix.

On CM2290/TFE, the PIX interface includes a minimal inline processing
engine, which we will be able to leverage later to export statistics
needed for proper 3A frame processing. This also fixes the PIX path
not being usable on this platform, as PIX routing was previously
unsupported, causing frame capture hangs.

Changes in V4:
- Remove unnecessary boundary check for wm-to-client
- Remove stray \n and fix commit subject for 2/5
- Add proper define for PIX pad index in csid-340

Changes in V3:
- Introduce what PIX is/means in 2/5 as discussed with Dmitry.
- Fix patches format/encoding (proper ASCII)

Changes in V2:
- Fix various typos, extra spaces, and reword commit messages.
- Split the CSID-340 patch into three independent changes.
- Make VC/DT-ID configuration explicit in the CSID/PIX setup.
- Add the csid_vc_iface_map helper to retrieve the interface offset
  from a Virtual Channel (VC).
- Add cropping configuration in the VFE/PIX path so that it
  respects the crop parameters defined in camss-vfe.

Loic Poulain (5):
  media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL
    registers
  media: qcom: camss: csid-340: Add VC-to-interface mapping
  media: qcom: camss: csid-340: Enable PIX interface routing
  media: qcom: camss: vfe-340: Proper client handling
  media: qcom: camss: vfe-340: Support for PIX client

 .../platform/qcom/camss/camss-csid-340.c      | 109 ++++++++----
 .../media/platform/qcom/camss/camss-vfe-340.c | 155 +++++++++++++-----
 2 files changed, 187 insertions(+), 77 deletions(-)

-- 
2.34.1


