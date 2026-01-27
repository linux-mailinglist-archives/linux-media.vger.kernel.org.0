Return-Path: <linux-media+bounces-51655-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INxxBfSueGlasAEAu9opvQ
	(envelope-from <linux-media+bounces-51655-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:26:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 875E79451B
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CD903082CC3
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0C734D4EA;
	Tue, 27 Jan 2026 12:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmimGFay";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aId40Mcf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF6234D384
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516591; cv=none; b=ezT2GaQZRZDUe3CXoPnNXwm8gUbeejx3WnhY2zYnZhvmPLDk1JYy1tjjL6Aixj5LvWZVIE5UsoNazM4c6RGcFNCyxNgKosGjm5/yTs87vDnt/VUDzGZf4zRH6bWYvrZY3vP6/QR2GL1qzrE21NnhVSJkLHHYRCOGSBkOohmHzck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516591; c=relaxed/simple;
	bh=lyD9r8HWDZrBnVMci9MLnlerwDf+zMBRMTff7QgmqOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYg4khQW8XVBdVdt0o+/1PS2PGCfr0npV0n5P8OKEHHXGKOzqo++TloeQuY+ZJWPcJ+sohdlD+nySx+9fOd+nizfNfN8gmAJa3gueCZn22OLBIr72E8JHVdCmvfRsnUZUtyMuJ4O+6ctxFgoTFn+gWud7F5lDDNFEmwLnKEl1Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmimGFay; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aId40Mcf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAb2k6700433
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aAz3ii4wc9r4o1zN3sZnB77VS0DlqcRsmrvn03+0byw=; b=LmimGFayMW3TvRHO
	hNQUw/qKjFc9+htrKq5w1TixTqpsskcibJnXRJRVpKjDqBohulNIDYPlg6ua9yZr
	B+Na8QsC0nsJtHtV09uz0TBFZJ1hVphtIZZcuIbWPCYqUPC9fqbEQiP4uzMsnkgR
	pkBQ1/nRXYmVZWmX1OLvdLSgZIcDL+3azGiPRwGYLmE4bBn+XdHuUtXN7egF90D8
	Ix6wUulIkBs/tNbz9Ak4ycjVZPkKaQ+2Si6RRjLPHzQpKWnsLvTR37GNpfZObL8t
	jLNsd8UBeMwXW8gT6gU9p1MaaIX7Sp0olbtIsBSrDoFeXSNZVHgp5R+b2BAEFCog
	t1qHiA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3trkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:08 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9484dbd65a7so3325524241.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 04:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769516587; x=1770121387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAz3ii4wc9r4o1zN3sZnB77VS0DlqcRsmrvn03+0byw=;
        b=aId40Mcfm2MN0unBvbVE9+U/1Odd7DYbdgrzjwuqtdWPBH25NOKzMw5O63NkxQGNGi
         NK9HbHyoOaSFw3yfwQDGKBk2JhLXhWpOghZOxNbMNjqAHIcSPsxEn9smaWoBwb8nRcFa
         0sISS+rUiAwQs6zuGLUScOW4ydDBVygUMMNmKpEXXD9FdhrEJ5L/V8CatqJNZiJUgMV2
         ue/lD7p93HUZm7P7VH+jH4sB7IV/U4AmWzvP/Y2UKh/jWipJthwsXg3tsI/JdFoOPkWj
         LTVpyMoJlNEExuiMcH/gpORPSJc6pk1iIxVXTY8+i74otInahB5SVnPTczz88KzsMNd+
         HnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516587; x=1770121387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aAz3ii4wc9r4o1zN3sZnB77VS0DlqcRsmrvn03+0byw=;
        b=lrmbPvxd/TAYOEoWGP/gypFz8xi/0VZU+Lo4kPiZnGv503gk/LLxJwO7/HEzswtlRr
         Y5UjVzeAQ4fZOL6WQ8bSH3R9dbhpYIMtL27wEUl20EvXWLUa+dFJD2KwnWqzE78EvTVC
         tAtovROHL5C/S+9stwnH5+sI4QBa1auaWEtpgPPxoMULD6CrgCfefaO0TLFUNuFNeOWT
         gIPYzaY8wYgH7PnNHUkaXu8Ue1VfW3PPwyd0D4zXl39Z8MGJGk6gvTj5XVeag9d4CySX
         s0eGFrCOMGoCJs7GD1jKufnHTsYuiA/C3hFn9C6bjaUQz6np9yaULpS8zsnsYBQuKTVx
         AgPA==
X-Gm-Message-State: AOJu0YwGctw+9PW07xv+sAt1Vf2RKmfpZtwfD1dwzs3LVdhdz+W5pL5U
	obyLJWjk5QF+PZGLybB0vNZ5/Hz0KbcYpIdcgUxfm4ZtVI9AtM1wxs6nq7yiy631DSjXQtFbGmT
	umLv6IECE0U4kgNIsGD+wDA2c1eSml1gLs8GJvvOsv8ESf/EHx5d+Pf7deYCJvCr2Mw==
X-Gm-Gg: AZuq6aIFn0GNLCVWj1iGmr/Zh10naNdpcnSYj14J4SDto7b4K6uBJRCK/20tG1g3apH
	il3n4+79ORhyh9WR7OhkqCwd0797fCIzMYWUXFokzBJNg0xW4BfnH7GdYrSasU5XFc9jOdQob2F
	ElcMhxt4B9zhiG8jZoB9ViDHwrGttZCwSn0hbb9fwafadfc1frToeOEEJvt1tzEG9T/XwnBV1o4
	gICmDVqRZu9gMS/Fl4cmKQArbI9ASkpcHWEtCZYEn1x9QT6oycoytIgh0yuc6SYDOKWcB3c5JN8
	40dZhY215oE+oTs5ItFJR3baFHDhwuaP+vu5l4ed3ATzgI8KFq5kN6RXgC5vu6Bq/06LCCHgahF
	JzQw0l4iYLZZJVflultXMuZgx7aT9nTB5oNUB/Lq2S/1ORN30qFvW/k8BXbFdpms+BxxvBbrqmL
	rE8U8v8JMjGjykljnr9XuVgfM=
X-Received: by 2002:a05:6102:3e89:b0:5f5:4247:8d08 with SMTP id ada2fe7eead31-5f7237859a9mr656266137.21.1769516587510;
        Tue, 27 Jan 2026 04:23:07 -0800 (PST)
X-Received: by 2002:a05:6102:3e89:b0:5f5:4247:8d08 with SMTP id ada2fe7eead31-5f7237859a9mr656260137.21.1769516587077;
        Tue, 27 Jan 2026 04:23:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492cc4asm3375442e87.101.2026.01.27.04.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:23:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:23:01 +0200
Subject: [PATCH v3 2/4] media: dt-bindings: qcom,sc7280-venus: drop non-PAS
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-venus-iris-flip-switch-v3-2-7f37689f4b39@oss.qualcomm.com>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
In-Reply-To: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lyD9r8HWDZrBnVMci9MLnlerwDf+zMBRMTff7QgmqOo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpeK4mu0ymi82vMiHpRMsQepeIyTEDwR+G9qVbB
 3qcuSwTW0+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXiuJgAKCRCLPIo+Aiko
 1ZqVCACvaZu/vyK3V2lJKYdNcQiUcLJJC9cK/u4rVkzxqRkN0Ctpym1LB6rNAf+ZI9Lpeznv5e3
 k8RNuvSylR8wqr822kay0QxK/ZVo9mH23hDDcu8zqmHv5LfYa4l3D10ErN4gYDU/vU8sedCt/pW
 PbdhqohMgeNPG90NUbwSurzWMazEjUyRZp5ktjMN0cpX6Hmz7Rvg7+VlAJ7FO+5aEP4dQEpxrJ5
 nxk8ttekJh2sE+F9EbRlEVcA05EyXHZhaNzIgZUCIa8oVO/rhEJONqq6kBK6JTz7/+/M1AMhkxA
 OscHTFVqxFjfb9/KZhPmlYOakYKaMtV8nAgPKYPbFakb5ZEs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: gdNsxg2skD_mPq5OZdN2AmadJGr8AKAY
X-Proofpoint-GUID: gdNsxg2skD_mPq5OZdN2AmadJGr8AKAY
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978ae2c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zCM7-lDapuS4FQW10A4A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwMSBTYWx0ZWRfX+6ZvuuItFPpN
 ug/eBvolVemhn4nLoYncLc3pPcLMR+i0zgeTV/SpaDkId8qI3T77WQTWAjrtGtJCnp6N5bfEyqF
 PwVK/fjzS6xvzXmoVYpyldVej+LS3D+tIDP4Vuq6+Gw4qNCGZwc2PbTapgXMiZ9RyLbCDiMAb21
 qDzxMf7ATKiqHh+YvVwwcnmflN+QMJxUideqY33zz09u1p308N+TUeh3F6tvTI+W8BDy8hm9dzD
 xxVgFY8xVjIyEOcHaWcZ/Z2140WlAgo7aSwcJfct14ULb2nkeHcTX26NKV0gD5ifAE3wU0E/8hW
 PBhKW8ZlHqdY95dCc54LQWBfFvrOoWItDtPLVO2Z0J057YHsXmW7JbNqAHvNS7L9WDEF2kqAzPJ
 Tv7bT7e18edaE1fAOcyDkmKDfQ/G/jvLeLJNnWEdcDBqO8j5tm8DrrUnprGzygnRtdPDMUOGJ5+
 NvC/UeDVFwm5cdf5MqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270101
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51655-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 875E79451B
X-Rspamd-Action: no action

The only users of the non-PAS setup on SC7280 platform are the ChromeOS
devices, which were cancelled before reaching end users. Iris, the
alternative driver for the same hardware, does not support non-PAS
setup. It is expected that in future both Venus and Iris devices will
use different ABI for non-PAS (EL2) setup.

In order to declare only the future-proof hardware description drop
support for non-PAS setup from the SC7280 Venus schema (breaking almost
non-existing SC7280 ChromeOS devices).

The dropped iommus entry reflects the extra stream, which should not be
treated in the same way as the main one (which doesn't match the usage
described by the iommus definition).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index 413c5b4ee650..9725fcb761dc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -43,8 +43,7 @@ properties:
       - const: vcodec_bus
 
   iommus:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   interconnects:
     maxItems: 2
@@ -120,12 +119,7 @@ examples:
                         <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
         interconnect-names = "cpu-cfg", "video-mem";
 
-        iommus = <&apps_smmu 0x2180 0x20>,
-                 <&apps_smmu 0x2184 0x20>;
+        iommus = <&apps_smmu 0x2180 0x20>;
 
         memory-region = <&video_mem>;
-
-        video-firmware {
-            iommus = <&apps_smmu 0x21a2 0x0>;
-        };
     };

-- 
2.47.3


