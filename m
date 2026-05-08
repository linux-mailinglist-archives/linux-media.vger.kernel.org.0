Return-Path: <linux-media+bounces-60896-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D0tM3mZ/WkJgQAAu9opvQ
	(envelope-from <linux-media+bounces-60896-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 10:06:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DBF4F37A2
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 10:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29C53301AF4B
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 08:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BCD38228C;
	Fri,  8 May 2026 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAZSzOXM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgN6cW3M"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DA9351C1E
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 08:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778227530; cv=none; b=PTvt/9oYJpSJS/+GOw9udNk24T+JNvy66sF/21PR5n80i+aIA5jbzF75qVP/yhimzSfdWKIjzOoLEH5Y8MnVT77dsGEDeoaR1NoOUflcRDBnbM5yZUa4QuWUp+xI1AJ+dRpomAugqVHz9OyATxsCIeDwwutWg/nL5bGpylLyxxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778227530; c=relaxed/simple;
	bh=cMEm/12X8N+LWdk0mpUd+g+ryVAyOS5o7mrYd0VATEI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dTBVQdOhUx2FmYmPdviDdnJmr31h54/ASwrCTxgdacX0eSGYvqoTbboD/1KGloevTds5bTUBME50yFxYvOu6YKIAj67pL027Ddx5B+wV2TNlKrZztnYIJfA6RcaLBUFgMgy4R7MifiqR/lcUBF8glnL/ntpkNIWF9n8PRcxbK70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAZSzOXM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WgN6cW3M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64863car1173965
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 08:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0jupPw5XMkTyMon3h5L5ne
	r+7HS/q1YAVtjfyoA2Q4U=; b=SAZSzOXMFOV/wdO2cK9zvHQitr1AOyUOL7rlLb
	RN3gllXsYbwGBOogeCkGkA8NtTqiBZalNHrqzvkPNKXrL8xxC70rqcZ9J3X7I6aw
	Dh7C/8YpYaG7CpNxpa553jUwvrl94nowNgYMSJI7Y1ZPzjjSknNS1f+9VHoivMyN
	Jk374W3cyHWRdyzfj4QirmGpNpUve5mReCLy3mbFODnYLHHE7P6HJ4HfkgJH74PF
	fcfUdb9OdCg6koCzrQgeZms9jnMpUhXli0NZrDUomKH0eJPvGsNQnmW9q5gm1mPK
	XXRKStNLoBk0nAq4Jh0NXHRY+P/glIvDFYNXUa1sqzX+YKzg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132h9vg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 08:05:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so1076538eec.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 01:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778227526; x=1778832326; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0jupPw5XMkTyMon3h5L5ner+7HS/q1YAVtjfyoA2Q4U=;
        b=WgN6cW3MDEUw8F3mbqUKVhu7k1BjUAezV/kzognnmtydblhGXzwTvNFmrcRUVo7Q7s
         gCypgM/W68iwlSXAJA3AjU951nzZnsTnxJsgAPPeyaD6X8Tow6MftaYCzlxEn/XSxD1G
         ufQfYiC+HAA3ANs2NWHZM+SXIy2xmckxAMx91t4oxzf/z7h+q+atp65LkCxG82fIwnmU
         izHOYtHVW5Ei9saxXlMOOC3mVvXb2UHLYsphCOpwiuiKS/+yZxRwFKRcDJZn/bKUGkZ2
         nanR/zGLofMwWMkHtRFiiwM5Ddm5ru4rwDdiPrRCrEwY3HF67mJZ0PidDYqnPeC3RGvY
         TuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778227526; x=1778832326;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jupPw5XMkTyMon3h5L5ner+7HS/q1YAVtjfyoA2Q4U=;
        b=jRmFRVq681E+1HlzF5gXiU8M0/br1PpPjp0um/qbo/1sfNMjL8G3rvt2xGDfBF0Pkn
         GHfW0M0qYemBMKhGca1eNOmgAPcT2qkc4hysHsFitqDQgZK2rIcreMhLYmvCezJ2G6OB
         9Sebr/dxegCOyk2+urRYbtbASydqh9w35xIXE1J3G4tvnPp0kZUj5fMbH4FCAgkPREhh
         rdNMzWNJeggWeYoNe38huXEyLbIonqqiGPevg3fa+Cl8+RihVNEzzkMx2j+tu0bd5ubL
         sz3rJjXhI+cavQ0P49JvUwXy2uykTL8038LD+g1mgyxcQc9xiybcWKq5bv2YluYuwAJ/
         RB8g==
X-Forwarded-Encrypted: i=1; AFNElJ/t53w9RCpYbAYCA+vXu4qYgiso/lVnlghN6PRvKi/6JkRT9qufBM6iIviLBxUM9XZY7V8Fx41fM4RFeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRSC9IMFVrQeHAf1t45vFdm2tcMYRXsVerzpQhIGKQofAQG0Bk
	JPjXvlapk6eKwwFcQa7Sb8bnaSRpQiC2qOI7UeS8iLltnSFP9M0X3CF4zzVJ0DnpzY5rdXBNLZp
	Z3kq/Kgh2chr17JuU2xaagTrDX0oWXJ3p5ss6NubMP4p5aOxrXxEPVT9v0Xq9qYlN5w==
X-Gm-Gg: Acq92OFvPpSUbjOqvRJxMHv1SE4sBt+xJkXTefdGuRKrrHoCZvI0v6+jEnXbbW+0NV5
	TPdBGTct0trajyKsWU13NkqoCevN2TNlRIC/WcUpkllkljyie5ogXVkz89kqf+gVv2V6VpZK3zO
	dOAUE7acZFjiAsL02hWUyHNykptlNXRyRiawnfURH/aU2FXVNj3zZRGSxngzcBvT2Yk1o7/2kvG
	kPkhEry+ZCYkBkjJVHgq+xXaI49IGvMmmrwnFnczRn8mIoRyLV8I5/YD/OGXsFO90YAr67C5b5Z
	/fVNeLfhe9jvHKny861OVgLScdfHuV8AWnxYZu6po7+49uygKn0RGqPlNJMwJ3wloU3BlYlEQF3
	IuqzcSEoQnPpWpK77QqJA1aUpv+t401Jj3T3+/lUDCNbAFVh8uq1nFF90TMU/26QapCoNhqFf1s
	YL
X-Received: by 2002:a05:7301:4593:b0:2df:498e:811b with SMTP id 5a478bee46e88-2f6e25fb074mr2867591eec.7.1778227526200;
        Fri, 08 May 2026 01:05:26 -0700 (PDT)
X-Received: by 2002:a05:7301:4593:b0:2df:498e:811b with SMTP id 5a478bee46e88-2f6e25fb074mr2867570eec.7.1778227525491;
        Fri, 08 May 2026 01:05:25 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c469b6sm1189244eec.24.2026.05.08.01.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:05:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v13 0/5] media: qcom: camss: Add Kaanapali support
Date: Fri, 08 May 2026 01:05:12 -0700
Message-Id: <20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADiZ/WkC/3WOzQ6CMBCEX4Xs2ZKWH4ucfA/DYYVFGoVCFwiG8
 O4WOHvZZCb7zcwKTM4QQx6s4Gg2bGznhYovAZQNdi8SpvIGRDK6SqUi8UbssMePESW2zELHWkd
 VklBda/BU76g2yxH5KE7taJh88nia8EQmUdq2NWMedLSM4ghPpYYdaAyP1n2PSbNSB/K33T8IK
 TJFSZ3eMK1kdrfM4TDhZ28I/YFi27YfzeN+QekAAAA=
X-Change-ID: 20260112-kaanapali-camss-73772d44eff7
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4MSBTYWx0ZWRfX+bsHuKCd0EpJ
 cYP8CKla/9PWLS67E60hzp3CjyoWVzvWxMUgt3BwK9QQ4/v+QiH4v5127kgJp+bT11Y7dC4vGsB
 MquYiXs+9pEDo8VerFHDufoHDoL+vnD+18OJvtf/DRJyPfmJINrv8eEwctmR16o4cmoSBxfaWaQ
 nwHsbQsI5Lq3ENaoWN7d1/j7u2IvQqnIF5ULped1m1KjXBJZHlNhdkMIWDejuKsa0InFn7uGt0i
 u2gn1GudozV+0I2AzVYJIUzSem9dKGz5/z0XTLPxAES4JmsuBftti7uclV2uRoFp47XY6NP/Ql/
 pFJpEMqDADD9nUDUVkDgb6EodiAbNjcFviOShcngCnHDd3X3skYEzvMaO87b5+uXiffboOZOkf8
 bE3BEaOdNY5kRi0R01kfucNGGlKbnkh75koUkXOYjg1FnIiC7UN0VaNDW+lqUt6rXx4034AEjCG
 n54bjvT9aB09O7YopWQ==
X-Proofpoint-ORIG-GUID: 5AnjiEY7nciux67z7ktFqa18Bqg2rHEA
X-Proofpoint-GUID: 5AnjiEY7nciux67z7ktFqa18Bqg2rHEA
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fd9947 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d-Za1eDmXPogXgNBA_QA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080081
X-Rspamd-Queue-Id: 11DBF4F37A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60896-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with a
downstream driver for S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v13:
- Remove prerequisite dependencies that have been merged upstream
- Remove redundant empty 'regulators' initializers in csid and vfe  - bod
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v12: https://lore.kernel.org/all/20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com/

Changes in v12:
- Add CSIPHY regulator current due to regulator interface changed - bod
- Link to v11: https://lore.kernel.org/r/20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com

Changes in v11:
- Rebase this series due to conflict - bod
- Update binding commit message to align with previous generations
- Link to v10: https://lore.kernel.org/r/20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com

Changes in v10:
- Update interconnect and CX domain AXI clock names to be consistent with
  previous generations - bod
- Update the struct name for csiphy lane register settings to make it reusable
  for other compatible chipsets
- Updated power domain names to IFE for consistency - Krzysztof
- Add description for acronyms listed in binding commit message - Dmitry
- Link to v9: https://lore.kernel.org/r/20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com

Changes in v9:
- Updates the names of some of the resources in DT bindings to be consistent
  with previous generations and improve the commit its message. The name
  changes are also applied to csiphy and vfe camss resource lists - bod
- Link to v8: https://lore.kernel.org/r/20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com

Changes in v8:
- Change csid and vfe driver file names as 'gen4' to reuse for other SOCs - bod
- Add missing register descriptions to binding and cover letter commit log - bod
- Link to v7: https://lore.kernel.org/r/20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com

Changes in v7:
- Add ICP SYS registers to camss binding - bod
- Rename 'is_deferred' to 'reg_update_after_csid_config' to do rup/aup
  after csid config to make it clearer and simplify its call path - bod
- Remove unnecessary bitwise AND while configuring image address to bus- bod
- Tidy up a comment and a couple of hex values and csid/vfe - bod
- Link to v6: https://lore.kernel.org/r/20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com

Changes in v6:
- Modified the bindings to represent the whole of the camera hardware on
  KNP than just what is exercised by the CAMSS driver by extending the
  descriptions and the properties, the regs, clocks, interrupts, power
  domains, iommus etc. In addition, use the word 'vfe' everywhere in the
  bindings to be clear that all of those resources are referring to the
  same front end modules. - Krzysztof/bod
- Change camss vfe power domain names to align with the binding file
- Link to v5: https://lore.kernel.org/r/20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com

Changes in v5:
- Refine v4 change log - Krzysztof
- Fix typo by removing redundant numerical version in kaanapali camss binding
  comment description - Krzysztof
- Add missing tags that should be posted with v4 revision - Krzysztof/Andi
- Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com

Changes in v4:
- Add detailed hardware descriptions and revise message title to follow the
  standard comment format for kaanapali camss binding file - Krzysztof
- Format kaanapali camss binding file to keep style consistency, by reverting
  power domain name from TFE to IFE and keeping clocks name order as last
  generation - Krzysztof
- Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
  for arbitrary board design with common or unique supplies to each of the PHYs
  in kaanapali camss binding example, based on v2 comments - bod/Vladimir
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (5):
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID gen4
      media: qcom: camss: vfe: Add support for VFE gen4

 .../bindings/media/qcom,kaanapali-camss.yaml       | 433 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 376 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |  11 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 ++++++
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 197 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 360 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 12 files changed, 1512 insertions(+), 5 deletions(-)
---
base-commit: b25f15a8600145233c948b40cab6d7d57bac3076
change-id: 20260112-kaanapali-camss-73772d44eff7

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


